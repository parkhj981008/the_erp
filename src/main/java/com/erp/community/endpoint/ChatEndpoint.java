package com.erp.community.endpoint;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.erp.common.rest.RestBusinessException;
import com.erp.common.rest.RestBusinessException.StatusCode;
import com.erp.community.service.CommunityService;
import com.erp.community.service.impl.CommunitiyServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import static com.erp.community.vo.ChatDTOs.*;

@ServerEndpoint("/api/v1/chat")
public class ChatEndpoint {
	
	private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<>());
	private static final ObjectMapper om = new ObjectMapper();
	private static final CommunityService communityService = new CommunitiyServiceImpl();
	
    @OnOpen
    public void onOpen(Session session) {
    	sessions.add(session);
    }

    @OnMessage
    public void onMessage(Session session, String message) {
        try {
        	ChatMessage chatMessage = om.reader().readValue(message, ChatMessage.class);
        	switch(chatMessage.getMethod()){
			case "init" : {
				communityService.initMessage(chatMessage);
				break;
			}
			case "createRoom" : {
				createChatRoomResponseDto responseDto = communityService.createRoomMessage(chatMessage);
				session.getBasicRemote().sendText(om.writer().writeValueAsString(responseDto));
				break;
			}
			case "send" : break;
			default : throw new RestBusinessException(StatusCode.BAD_REQUEST);
        	}
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @OnClose
    public void onClose(Session session) {
    	synchronized (sessions) {
            sessions.remove(session);
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        throwable.printStackTrace();
    }
}

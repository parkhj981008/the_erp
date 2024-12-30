package com.erp.community.endpoint;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@ServerEndpoint("/chat")
public class ChatEndpoint {
    // 클라이언트가 서버에 연결되었을 때 호출되는 메서드
    @OnOpen
    public void onOpen(Session session) {
        System.out.println("New connection: " + session.getId());
    }

    // 클라이언트로부터 메시지를 받았을 때 호출되는 메서드
    @OnMessage
    public void onMessage(Session session, String message) {
        try {
            // 메시지가 JSON 형식이므로 파싱
            JsonObject jsonMessage = JsonParser.parseString(message).getAsJsonObject();

            // 클라이언트가 보낸 메시지와 sessionStorage 데이터를 추출
            String clientMessage = jsonMessage.get("message").getAsString();
            String sessionData = jsonMessage.get("sessionData").getAsString();

            System.out.println("Message received: " + clientMessage);
            System.out.println("Session Data: " + sessionData);

            // 클라이언트에게 받은 메시지와 sessionStorage 데이터를 다시 보냄
            String response = "Server received: " + clientMessage + " (Session Data: " + sessionData + ")";
            session.getBasicRemote().sendText(response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 클라이언트와의 연결이 종료되었을 때 호출되는 메서드
    @OnClose
    public void onClose(Session session) {
        System.out.println("Closed connection: " + session.getId());
    }

    // 오류가 발생했을 때 호출되는 메서드
    @OnError
    public void onError(Session session, Throwable throwable) {
        throwable.printStackTrace();
    }
}

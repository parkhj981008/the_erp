package com.erp.community.service.impl;

import com.erp.community.repository.CommunityRepository;
import com.erp.community.service.CommunityService;
import com.erp.community.vo.ChatDTOs.ChatMessage;
import com.erp.community.vo.ChatDTOs.InitResponseDto;
import com.erp.community.vo.ChatDTOs.createChatRoomResponseDto;

public class CommunitiyServiceImpl implements CommunityService{
	private static final CommunityRepository communityRepository = new CommunityRepository();
	@Override
	public InitResponseDto initMessage(ChatMessage chatMessage) {
		
		return null;
	}

	@Override
	public createChatRoomResponseDto createRoomMessage(ChatMessage chatMessage) {
		return communityRepository.createChatRoom(chatMessage);
	}
	
}
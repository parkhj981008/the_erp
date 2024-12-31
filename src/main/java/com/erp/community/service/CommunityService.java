package com.erp.community.service;

import com.erp.community.vo.ChatDTOs.*;

public interface CommunityService {
	InitResponseDto initMessage(ChatMessage chatMessage);
	createChatRoomResponseDto createRoomMessage(ChatMessage chatMessage);
	
}
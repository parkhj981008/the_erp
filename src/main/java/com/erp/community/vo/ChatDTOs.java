package com.erp.community.vo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.erp.common.database.PreparedStatementVO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

public class ChatDTOs{
	
	@Getter
	@Setter
	@NoArgsConstructor
	@AllArgsConstructor
	public static class ChatMessage{
		private String message;
		private int chatSeq;
		private String method;
		
		
		
		public PreparedStatementVO toCreateChatRoom(){
			PreparedStatementVO preparedStatementVO = new PreparedStatementVO();
	        preparedStatementVO.setSql("INSERT INTO CHAT_ROOMs (chat_room_detail_seq, chat_room_seq, join_date, latest_message_seq) * VALUES(chat_room_seq.NEXTVAL, ?, 'default')");
	        preparedStatementVO.setAttribute(new Object[]{new Date()});

	        return preparedStatementVO;
		}
		
		public PreparedStatementVO toCreateChatRoom(int chatRoomUser){
			PreparedStatementVO preparedStatementVO = new PreparedStatementVO();
	        preparedStatementVO.setSql("INSERT INTO CHAT_ROOM_DETAILS (chat_room_detail_seq, chat_room_seq, join_date, chat_room_user) * VALUES(chat_room_detail_seq.NEXTVAL, chat_room_seq.CURRVAL, ?, ?)");
	        preparedStatementVO.setAttribute(new Object[]{new Date(), chatRoomUser});
	         
	        return preparedStatementVO;
		}
		
	}
	
	
	@Getter
	@Setter
	@NoArgsConstructor
	@AllArgsConstructor
	@Builder
	public static class InitResponseDto{
		private List<ChatSummary> chatSummary;
		
		
		@Getter
		@Setter
		@NoArgsConstructor
		@AllArgsConstructor
		@Builder
		static class ChatSummary{
			private int chatRoomSeq;
			private String roomName;
			private List<ChatMessageSummary> messageSummary;
		}
		
		@Getter
		@Setter
		@NoArgsConstructor
		@AllArgsConstructor
		@Builder
		static class ChatMessageSummary{
			private int chat_messages_seq;
			private Date write_date;
			private int writer_id;
			private String writer_name;
		}
	}
	
	@Getter
	@Setter
	@NoArgsConstructor
	@AllArgsConstructor
	public static class createChatRoomResponseDto{
		private int chatRoomSeq;
		private String roomName;
	}
	
	
	
	
//	public static class InitRequest{
//		private String message;
//		private int chatSeq;
//		private String method;
//	}
}
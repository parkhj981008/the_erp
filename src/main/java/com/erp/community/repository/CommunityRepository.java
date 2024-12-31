/**
 * 
 */
package com.erp.community.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import org.mindrot.jbcrypt.BCrypt;

import com.erp.common.database.DBManager;
import com.erp.common.database.PreparedStatementVO;
import com.erp.common.database.StatementProvider;
import com.erp.common.database.impl.OracleDBManager;
import com.erp.common.database.impl.StatementProviderDefaultImpl;
import com.erp.common.rest.RestBusinessException;
import com.erp.common.rest.RestBusinessException.StatusCode;
import com.erp.common.security.UserInfo;
import com.erp.community.vo.ChatDTOs.ChatMessage;
import com.erp.community.vo.ChatDTOs.createChatRoomResponseDto;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.<br>
 * Date : 2024. 12. 30.<br>
 * History :<br>
 * - 작성자 : Kosta, 날짜 : 2024. 12. 30., 설명 : 최초작성<br>
 *
 * @author Kosta
 * @version 1.0
 */
public class CommunityRepository {
	private static final DBManager db = new OracleDBManager();
	private static final StatementProvider sp = new StatementProviderDefaultImpl();
	
	public createChatRoomResponseDto createChatRoom(ChatMessage chatMessage) {
		PreparedStatementVO psVO = chatMessage.toCreateChatRoom();
		String[] strArray = chatMessage.getMessage().replace("{", "").replace("}", "").replace("\"", "").split(",\\s*");
        int[] intArray = Arrays.stream(strArray)
                               .mapToInt(Integer::parseInt)
                               .toArray();
        Connection con = null;
        PreparedStatement createRoomPS = null;
        createChatRoomResponseDto response = new createChatRoomResponseDto();
		try{
			con = db.getConnectionForTransaction();
			createRoomPS = sp.getPreparedStatement(con, psVO.getSql(), psVO.getAttribute());
			int rows = createRoomPS.executeUpdate();
			if(rows != 1) throw new SQLException();
			
			for(int i = 0; i < intArray.length; i++) {
				PreparedStatementVO psVO2 = chatMessage.toCreateChatRoom(i);
				try(
						PreparedStatement createRoomDetailPS = sp.getPreparedStatement(con, psVO2.getSql(), psVO2.getAttribute());
						){
					int rows2 = createRoomPS.executeUpdate();
					if(rows2 != 1) throw new SQLException();
				}
			}
			
			try(
					PreparedStatement getChatRoomPS = sp.getPreparedStatement(con, "SELECT * FROM chat_rooms WHERE chat_room_seq = ?", new Object[]{"chat_room_seq.CURRVAL"});
					ResultSet rs = getChatRoomPS.executeQuery();
					){
				while(rs.next()) {
					response.setChatRoomSeq(rs.getInt("chat_room_seq")); 
					response.setRoomName(rs.getString("room_name"));
				}
			}
			con.commit();
		} catch (SQLException e) {
			try {
				 if (con != null) {
		                con.rollback();
		            }
			} catch (SQLException e1) {
				throw new RestBusinessException(StatusCode.DATABASE_UKNOWN_ERROR, e);
			}
			throw new RestBusinessException(StatusCode.DATABASE_UKNOWN_ERROR, e);			
		} finally {
			db.close(con, createRoomPS);
		}
		return response;
	}
}

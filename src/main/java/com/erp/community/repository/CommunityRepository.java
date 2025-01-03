/**
 * 
 */
package com.erp.community.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
		Connection con = null;
		PreparedStatement createRoomPS = null;
		createChatRoomResponseDto response = new createChatRoomResponseDto();
		try {
			con = db.getConnectionForTransaction();
			createRoomPS = sp.getPreparedStatement(con, psVO.getSql(), psVO.getAttribute());
			int rows = createRoomPS.executeUpdate();
			if (rows != 1)
				throw new SQLException();
			PreparedStatementVO psVO2 = chatMessage.toCreateChatRoom(Integer.parseInt(chatMessage.getMessage()));
			try (PreparedStatement createRoomDetailPS = sp.getPreparedStatement(con, psVO2.getSql(),
					psVO2.getAttribute());) {
				int rows2 = createRoomDetailPS.executeUpdate();
				if (rows2 != 1)
					throw new SQLException();
			}
			
			con.commit();
		} catch (Exception e) {
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

	public int[] getAvailableUsers() {
		List<Integer> users = new ArrayList<>();
		try (Connection con = db.getConnection();
				PreparedStatement ps = sp.getPreparedStatement(con, "SELECT user_seq FROM app_users", new Object[0]);
				ResultSet rs = ps.executeQuery();) {
			while (rs.next()) {
				users.add(rs.getInt("user_seq"));
			}
			return users.stream().mapToInt(Integer::intValue).toArray();
		} catch (SQLException e) {
			throw new RestBusinessException(StatusCode.DATABASE_UKNOWN_ERROR, e);
		}
	}
}

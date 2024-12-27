//package com.erp.auth.repository;
//
//import java.sql.*;
//
//import com.erp.auth.vo.UserInfoVO;
//import com.erp.common.database.DBManager;
//import com.erp.common.database.OracleDBManager;
//
//
///*
// * User Database create, read, update, delete
// * 
// */
//
//
//public class UserRepository {
//
//	
////select 
//	
//	//유저 정보 가져오기 
//	// 이메일로 유저 찾기
//	public int insertUser(UserInfoVO user) {
//	    DBManager dbm = OracleDBManager.getInstance();
//	    Connection conn = dbm.connect();
//	    PreparedStatement pstmt = null;
//	    int rows = 0;
//	    
//	    try {
//	        String sql = "INSERT INTO app_users (user_seq, user_id, password, user_name, email, "
//	                  + "phone_number, user_status, register_date, hire_date, modify_date) "
//	                  + "VALUES (user_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//	                  
//	        pstmt = conn.prepareStatement(sql);
//	        pstmt.setString(1, user.getUserId());
//	        pstmt.setString(2, user.getPassword());
//	        pstmt.setString(3, user.getUserName());
//	        pstmt.setString(4, user.getEmail());
//	        pstmt.setString(5, user.getPhoneNumber());
//	        pstmt.setString(6, user.getUserStatus());
//	        pstmt.setTimestamp(7, Timestamp.valueOf(user.getRegisterDate()));
//	        pstmt.setTimestamp(8, Timestamp.valueOf(user.getHireDate()));
//	        pstmt.setTimestamp(9, Timestamp.valueOf(user.getModifyDate()));
//	        
//	        rows = pstmt.executeUpdate();
//	    } catch (SQLException e) {
//	        e.printStackTrace();
//	    } finally {
//	        dbm.close(conn, pstmt);
//	    }
//	    return rows;
//	}
//
//
//	
//	public UserInfoVO findByUserEmail(String email) {
//	
//		UserInfoVO user = new UserInfoVO();
//	
//		DBManager dbm = OracleDBManager.getInstance();  	//new MariaDBManager();
//		Connection conn = dbm.connect();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			String sql = "select * from app_users where email=?";
//			pstmt =  conn.prepareStatement(sql);
//			pstmt.setString(1, email);	
//			rs = pstmt.executeQuery();  
//			rs.next();
//			
//			 	user.setUserSeq(rs.getLong("userSeq"));
//			    user.setPassword(rs.getString("password")); 
//			    user.setUserName(rs.getString("userName"));
//			    user.setEmail(rs.getString("email"));
//			    user.setAddress(rs.getString("address"));
//			    user.setPhoneNumber(rs.getString("phoneNumber"));
//			    user.setUserStatus(rs.getString("userStatus"));
//			    user.setRegisterDate(rs.getTimestamp("registerDate").toLocalDateTime());
//			    user.setHireDate(rs.getTimestamp("hireDate").toLocalDateTime());
//			    user.setModifyDate(rs.getTimestamp("modifyDate").toLocalDateTime());
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}	finally {
//			dbm.close(conn, pstmt, rs);
//		}
//		return user;		
//	}
//	
//	// 아이디로 유저 찾기
//	public UserInfoVO findByUserId(String userId) {
//		// 유저 이메일
//		// 유저 아이디 중복체크
//		UserInfoVO user = new UserInfoVO();
//		
//		
//		DBManager dbm = OracleDBManager.getInstance(); 
//		Connection conn = dbm.connect();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			String sql = "select * from app_users where user_id = ?";
//			
//			
//			pstmt =  conn.prepareStatement(sql);
//			pstmt.setString(1, userId);	
//			rs = pstmt.executeQuery();  
//			
//			if (rs.next()) {
//			    user.setUserSeq(rs.getLong("user_seq"));
//			    user.setUserId(rs.getString("user_id"));
//			    user.setPassword(rs.getString("password"));
//			    user.setEmail(rs.getString("email"));
//			    user.setPhoneNumber(rs.getString("phone_number"));
//			    user.setRegisterDate(rs.getTimestamp("register_date").toLocalDateTime());
//			    user.setUserStatus(rs.getString("user_status"));
//			    user.setHireDate(rs.getTimestamp("hire_date").toLocalDateTime());
//			    user.setUserName(rs.getString("user_name"));
//			    user.setModifyDate(rs.getTimestamp("modify_date").toLocalDateTime());
////			    user.setDepartmentId(rs.getLong("department_id"));
//			}
//			
//
//			    
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}	finally {
//			dbm.close(conn, pstmt, rs);
//		}
//		return user;		
//	}
//	
//	
//	
//	
//	
//	
//	
////insert
//	
//
//}

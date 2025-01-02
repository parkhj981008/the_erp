package com.erp.hr.employeeCard;

import com.erp.common.constant.CommonCode.Gender;
import com.erp.common.constant.CommonCode.UserStatus;
import com.erp.hr.common.DBManager;
import com.erp.hr.common.OracleDBManager;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class EmployeeCardDAO{
		
	// 인사카드 목록 Select (startSeq ~ endSeq 페이징)
	public ArrayList<hrVO> insaCardSelect(int startSeq , int endSeq) {
			
			ArrayList<hrVO> alist = new ArrayList<hrVO>();
			
			DBManager dbm = OracleDBManager.getInstance();
			Connection conn = dbm.connect();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "select s.*\r\n"
						+ "from (select app_users.*, \r\n"
						+ "      (ROW_NUMBER() OVER(order by user_seq desc)) as rnum\r\n"
						+ "      from app_users) s\r\n"
						+ "where  rnum between ? and ?";
				pstmt =  conn.prepareStatement(sql);
				pstmt.setInt(1, startSeq);
				pstmt.setInt(2, endSeq);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					hrVO hvo = new hrVO();
						hvo.setUser_seq(rs.getInt("user_seq"));
						hvo.setUser_id(rs.getString("user_id"));
						hvo.setUser_password(rs.getString("user_password"));
						hvo.setEmail(rs.getString("email"));
						hvo.setAddress(rs.getString("address"));
						hvo.setPhone_number(rs.getInt("phone_number"));
						hvo.setRegister_date(rs.getDate("register_date"));
						hvo.setUser_status(UserStatus.parseUserStatus(rs.getString("user_status")));
						hvo.setHire_date(rs.getDate("hire_date"));
						hvo.setUser_name(rs.getString("user_name"));
						hvo.setModify_date(rs.getDate("modify_date"));
						hvo.setDepartment_id(rs.getInt("department_id"));
						hvo.setGender(Gender.parseGender(rs.getString("gender")));
						hvo.setBirth(rs.getDate("birth"));
						hvo.setExtension_number(rs.getInt("extension_number"));
						hvo.setTermination_date(rs.getDate("termination_date"));
						hvo.setPosition(rs.getString("position"));
						hvo.setManager_id(rs.getInt("manager_id"));
					alist.add(hvo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				dbm.close(conn, pstmt, rs);
			}
			return alist;
		}
	
	
	// 인사카드 전체목록 Select
	public ArrayList<hrVO> insaCardSelect() {
	
		ArrayList<hrVO> alist = new ArrayList<hrVO>();
		
		DBManager dbm = OracleDBManager.getInstance();
		Connection conn = dbm.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			String sql = "select * from app_users order by user_seq desc";
			pstmt =  conn.prepareStatement(sql);
			rs = pstmt.executeQuery();  
			while(rs.next()) {
					hrVO hvo = new hrVO();
					hvo.setUser_seq(rs.getInt("user_seq"));
					hvo.setUser_id(rs.getString("user_id"));
					hvo.setUser_password(rs.getString("user_password"));
					hvo.setEmail(rs.getString("email"));
					hvo.setAddress(rs.getString("address"));
					hvo.setPhone_number(rs.getInt("phone_number"));
					hvo.setRegister_date(rs.getDate("register_date"));
					hvo.setUser_status(UserStatus.parseUserStatus(rs.getString("user_status")));
					hvo.setHire_date(rs.getDate("hire_date"));
					hvo.setUser_name(rs.getString("user_name"));
					hvo.setModify_date(rs.getDate("modify_date"));
					hvo.setDepartment_id(rs.getInt("department_id"));
					hvo.setGender(Gender.parseGender(rs.getString("gender")));
					hvo.setBirth(rs.getDate("birth"));
					hvo.setExtension_number(rs.getInt("extension_number"));
					hvo.setTermination_date(rs.getDate("termination_date"));
					hvo.setPosition(rs.getString("position"));
					hvo.setManager_id(rs.getInt("manager_id"));
				alist.add(hvo);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbm.close(conn, pstmt, rs);
		}
		return alist;
	}
	
	
	
	
	// 인사카드 한개 Select
	public hrVO insaCardSelect(int user_seq) {
		
		DBManager dbm = OracleDBManager.getInstance();
		Connection conn = dbm.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		hrVO hvo = new hrVO();
		
		try {
			String sql = "select * from app_users where user_seq = ?";
			pstmt =  conn.prepareStatement(sql);
			pstmt.setInt(1, user_seq);
			
			rs = pstmt.executeQuery();
			rs.next();	//한건만 있을때
			
			hvo.setUser_seq(rs.getInt("user_seq"));
			hvo.setUser_id(rs.getString("user_id"));
			hvo.setUser_password(rs.getString("user_password"));
			hvo.setEmail(rs.getString("email"));
			hvo.setAddress(rs.getString("address"));
			hvo.setPhone_number(rs.getInt("phone_number"));
			hvo.setRegister_date(rs.getDate("register_date"));
			hvo.setUser_status(UserStatus.parseUserStatus(rs.getString("user_status")));
			hvo.setHire_date(rs.getDate("hire_date"));
			hvo.setUser_name(rs.getString("user_name"));
			hvo.setModify_date(rs.getDate("modify_date"));
			hvo.setDepartment_id(rs.getInt("department_id"));
			hvo.setGender(Gender.parseGender(rs.getString("gender")));
			hvo.setBirth(rs.getDate("birth"));
			hvo.setExtension_number(rs.getInt("extension_number"));
			hvo.setTermination_date(rs.getDate("termination_date"));
			hvo.setPosition(rs.getString("position"));
			hvo.setManager_id(rs.getInt("manager_id"));
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbm.close(conn, pstmt, rs);
		}
		return hvo;
	}
	
	
	
	// 인사카드 등록 Insert
		public int insaCardInsert(hrVO hvo) {
			DBManager dbm  = OracleDBManager.getInstance();
			Connection conn = dbm.connect();
			PreparedStatement pstmt = null;
			int rows = 0;
			try {   
				
				String sql = "INSERT INTO app_users(\r\n"
						+ "    USER_SEQ,\r\n"
						+ "    USER_ID,\r\n"
						+ "    USER_PASSWORD,\r\n"
						+ "    EMAIL,\r\n"
						+ "    ADDRESS,\r\n"
						+ "    PHONE_NUMBER,\r\n"
						+ "    REGISTER_DATE,\r\n"
						+ "    USER_STATUS,\r\n"
						+ "    HIRE_DATE,\r\n"
						+ "    USER_NAME,\r\n"
						+ "    MODIFY_DATE,\r\n"
						+ "    DEPARTMENT_ID,\r\n"
						+ "    GENDER,\r\n"
						+ "    BIRTH,\r\n"
						+ "    EXTENSION_NUMBER,\r\n"
						+ "    TERMINATION_DATE,\r\n"
						+ "    POSITION,\r\n"
						+ "    MANAGER_ID\r\n"
						+ ") VALUES (\r\n"
						+ "    app_users_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

				

				pstmt =  conn.prepareStatement(sql);
					pstmt.setString(1, hvo.getUser_id());
					pstmt.setString(2, hvo.getUser_password());
					pstmt.setString(3, hvo.getEmail());
					pstmt.setString(4, hvo.getAddress());
					pstmt.setInt(5, hvo.getPhone_number());
					pstmt.setDate(6, (Date) hvo.getRegister_date() );
					pstmt.setInt(7, hvo.getUser_status().getNum());
					pstmt.setDate(8, (Date) hvo.getHire_date() );
					pstmt.setString(9, hvo.getUser_name());
					pstmt.setDate(10, (Date) hvo.getModify_date());
					pstmt.setInt(11, hvo.getDepartment_id());
					pstmt.setInt(12, hvo.getGender().getNum());
					pstmt.setDate(13, (Date) hvo.getBirth() );
					pstmt.setInt(14, hvo.getExtension_number());
					pstmt.setDate(15, (Date) hvo.getTermination_date() );
					pstmt.setString(16, hvo.getPosition());
					pstmt.setInt(17, hvo.getManager_id());
					
					
				rows = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				dbm.close(conn, pstmt);
			}
			return rows;
		}
	
	// 인사카드 삭제 Delete
	public int insaCardDelete(int user_seq) {
		DBManager dbm  = OracleDBManager.getInstance();
		Connection conn = dbm.connect();
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			String sql = "delete from app_users where user_seq = ?";
			pstmt =  conn.prepareStatement(sql);
			pstmt.setInt(1, user_seq);
			
			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbm.close(conn, pstmt);
		}
		return rows;
	}
	
	
	
	
//    public static void main(String[] args) {
//    	
//        EmployeeCardDAO dao = new EmployeeCardDAO();

//        // 1. 인사카드 목록 페이징 조회 테스트
//        System.out.println("=== 인사카드 페이징 목록 조회 ===");
//        ArrayList<hrVO> pagedList = dao.insaCardSelect(1, 5);
//        for (hrVO vo : pagedList) {
//            System.out.println("인사카드 페이징 조회 - " + vo.toString());
//        }

//        // 2. 인사카드 전체 조회 테스트
//        System.out.println("=== 인사카드 전체 조회 ===");
//        ArrayList<hrVO> fullList = dao.insaCardSelect();
//        for (hrVO vo : fullList) {
//            System.out.println("인사카드 전체 조회 - " + vo.toString());
//        }

//        // 3. 특정 인사카드 조회 테스트
//        System.out.println("=== 특정 인사카드 조회 ===");
//        int userSeq = 1; // 테스트할 user_seq 값
//        hrVO singleCard = dao.insaCardSelect(userSeq);
//        System.out.println(singleCard.toString());

//        // 4. 인사카드 등록 테스트
//        System.out.println("=== 인사카드 등록 테스트 ===");
//        hrVO newCard = new hrVO();
//	        newCard.setUser_id("new_user");
//	        newCard.setUser_password("s@123qwer");
//	        newCard.setEmail("seunghee@example.com");
//	        newCard.setAddress("123 Test Street");
//	        newCard.setPhone_number(123456789);
//	        newCard.setRegister_date(new Date(System.currentTimeMillis()));
//	        newCard.setUser_status(UserStatus.ACTIVE); // 예: UserStatus.ACTIVE로 가정
//	        newCard.setHire_date(new Date(System.currentTimeMillis()));
//	        newCard.setUser_name("장승희");
//	        newCard.setModify_date(new Date(System.currentTimeMillis()));
//	        newCard.setDepartment_id(20);
//	        newCard.setGender(Gender.MALE); // 예: Gender.MALE로 가정
//	        newCard.setBirth(Date.valueOf("1990-01-01"));
//	        newCard.setExtension_number(1234);
//	        newCard.setTermination_date(null); // 퇴직일은 null로 설정
//	        newCard.setPosition("Developer");
//	        newCard.setManager_id(1);
//
//        int insertResult = dao.insaCardInsert(newCard);
//        System.out.println("Insert 결과: " + insertResult);

//        // 5. 인사카드 삭제 테스트
//        System.out.println("=== 인사카드 삭제 테스트 ===");
//        int deleteUserSeq = 3; // 삭제할 user_seq 값
//        int deleteResult = dao.insaCardDelete(deleteUserSeq);
//        System.out.println("Delete 결과: " + deleteResult);
//    }

	

}

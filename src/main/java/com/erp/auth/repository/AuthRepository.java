package com.erp.auth.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;

import com.erp.auth.vo.AuthDTOs.LoginRequestDTO;
import com.erp.auth.vo.AuthDTOs.LoginResponseDTO;
import com.erp.auth.vo.AuthDTOs.RegisterRequestDTO;
import com.erp.common.database.DBManager;
import com.erp.common.database.StatementProvider;
import com.erp.common.database.impl.OracleDBManager;
import com.erp.common.database.impl.StatementProviderDefaultImpl;
import com.erp.common.rest.RestBusinessException;
import com.erp.common.rest.RestBusinessException.StatusCode;

public class AuthRepository{
	
	private static final DBManager db = new OracleDBManager();
	private static final StatementProvider sp = new StatementProviderDefaultImpl();
	
	public void register(RegisterRequestDTO requestDto) {
		try(
				Connection con = db.getConnectionForTransaction();
				PreparedStatement ps 
					= sp.getPreparedStatement(con, requestDto.convertToSql(), requestDto.getAttributeAsObjectArray());
		){
			int rows = ps.executeUpdate(); 
			if(rows == 1) con.commit();
			else {
				con.rollback();
				throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
			}
		} catch (SQLException e) {
			if(e instanceof SQLIntegrityConstraintViolationException) 
				throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
			throw new RestBusinessException(StatusCode.DATABASE_UKNOWN_ERROR, e);
		}
	}
	
	public LoginResponseDTO login(LoginRequestDTO requestDto) {
		try(
				Connection con = db.getConnection();
				PreparedStatement ps = sp.getPreparedStatement(con, requestDto.converToSql(), requestDto.getAttributeAsObjectArray());
				ResultSet rs = ps.executeQuery();
				){
			int userSeq = -1;
			String userPassword = null;
			while(rs.next()) {
				userSeq = rs.getInt("user_seq");
				userPassword = rs.getString("user_password");
			}
			if(userSeq == -1 || userPassword == null || !BCrypt.checkpw(requestDto.getUserPassword(), userPassword)) {
				System.out.println(userSeq);
				System.out.println(userPassword);
				throw new RestBusinessException(StatusCode.INVALID_IP_PASSWORD);
			}
		
			System.out.println(getUserRole(userSeq)[0]);
			return LoginResponseDTO.builder().userSeq(userSeq).roles(getUserRole(userSeq)).build(); 
		} catch (SQLException e) {
			throw new RestBusinessException(StatusCode.DATABASE_UKNOWN_ERROR, e);			
		}
	}
	
	private int[] getUserRole(int userSeq){
		try(
				Connection con = db.getConnection();
				PreparedStatement ps = sp.getPreparedStatement(con, "SELECT user_role_seq FROM user_roles WHERE user_seq = ?", userSeq);
				ResultSet rs = ps.executeQuery();
				){
			List<Integer> roleList = new ArrayList<>();
			while(rs.next()) {
				roleList.add(rs.getInt("user_role_seq"));
			}
			if(roleList.isEmpty()) return new int[] {-1};
			return roleList.stream().mapToInt(Integer::intValue).toArray();
		}catch (SQLException e) {
			throw new RestBusinessException(StatusCode.DATABASE_UKNOWN_ERROR, e);			
		}
	}
	
	/*

*CREATE TABLE user_roles (
    user_role_seq NUMBER NOT NULL PRIMARY KEY,
    order_id NUMBER NOT NULL,
    register_date DATE NOT NULL,
    role_seq NUMBER NOT NULL,
    user_seq NUMBER NOT NULL,
    CONSTRAINT fk_user_roles_role FOREIGN KEY (role_seq) 
    REFERENCES roles(role_seq),
    CONSTRAINT fk_user_roles_user FOREIGN KEY (user_seq) 
    REFERENCES app_users(user_seq)
);
*
*/
	
	
}
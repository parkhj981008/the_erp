package com.erp.facility.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class UserSmallDTO {
	
	private long userSeq;
	private Long phoneNumber;
	private String userName;
	private Long departmentId;
	private String position;

	   
	
	   public static String getUser() {
		   return "SELECT user_seq, user_name ,phone_number, department_id, position "
			       + "FROM app_users "
			       + "WHERE user_seq = ?";
	    }
	   
	   public void testUserSmall() {
		   
	   }
	
	
	   public static UserSmallDTO fromResultSet(ResultSet rs) throws SQLException {
		    return new UserSmallDTO(
		        rs.getLong("user_seq"),
		        rs.getLong("phone_number"), 
		        rs.getString("user_name"), 
		        rs.getLong("department_id"),
		        rs.getString("position")
		    );
		}



}

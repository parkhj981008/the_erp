package com.erp.auth.vo;

import java.time.LocalDateTime;
import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import static com.erp.common.constant.CommonCode.*;

public class AuthDTOs{
	
	@Getter
	@Setter
	@NoArgsConstructor
	@Builder
	@AllArgsConstructor
	public static class RegisterRequestDTO{
		private String userId;
		private String userPassword;
		private String email;
		private String address;
		private int phoneNumber;
		private String userName;
		private Gender gender;
		private Date birth;
		
		public static String convertToSql() {
			
			return "INSERT INTO app_users(user_seq, user_id, user_password, email, address, phone_number, register_date, user_status, hire_date, user_name, modify_date, gender, birth) VALUES(user_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		}
		
		public Object[] getAttributeAsObjectArray() {
			return new Object[] {
					this.userId
					, this.userPassword
					, this.email
					, this.address
					, this.phoneNumber
					, new Date()
					, UserStatus.ACTIVE.getNum()
					, new Date()
					, this.userName
					, new Date()
					, this.gender.getNum()
					, this.birth
			};
		}
	}
}
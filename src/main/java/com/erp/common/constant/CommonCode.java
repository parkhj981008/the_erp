package com.erp.common.constant;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

public class CommonCode{
	public static enum Gender{
		@JsonProperty("남성")
		MALE("남성", 0),
		
		@JsonProperty("여성")
		FEMALE("여성", 1);
		
		
		private final String desc;
		private final int num;
		
		
		Gender(String desc, int num){
			this.desc = desc;
			this.num = num;
		}
		
		public int getNum() {return this.num; }

		public static Gender parseGender(String string) {
			for (Gender gender : Gender.values()) {
		        if (gender.desc.equals(string) || String.valueOf(gender.num).equals(string)) {
		            return gender;
		        }
		    }
		    throw new IllegalArgumentException("Invalid gender: " + string);
		}
	}
	
	public static enum UserStatus{
		ACTIVE("활성", 0)
		, INACTIVE("비활성", 1)
		, SUSPENDED("정지된 계정", 2)
		, DELETED("삭제된 계정", 3)
		, DORMANT("휴먼 계정", 4);
		
		private final String desc;
		private final int num;
		
		
		UserStatus(String desc, int num){
			this.desc = desc;
			this.num = num;
		}
		
		
		public int getNum() {return this.num; }


		public static UserStatus parseUserStatus(String string) {
			for (UserStatus userStatus : UserStatus.values()) {
		        if (userStatus.desc.equals(string) || String.valueOf(userStatus.num).equals(string)) {
		            return userStatus;
		        }
		    }
		    throw new IllegalArgumentException("Invalid userStatus: " + string);
		}
	}
}
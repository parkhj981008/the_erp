package com.erp.common.constant;


public class CommonCode{
	public static enum Gender{
		MALE("남성", 0)
		, FEMALE("여성", 1);
		
		private final String desc;
		private final int num;
		
		
		Gender(String desc, int num){
			this.desc = desc;
			this.num = num;
		}
		
		public int getNum() {return this.num; }


	    public static Gender parseGender(String input) {
	        for (Gender gender : Gender.values()) {
	            if (gender.desc.equals(input) || String.valueOf(gender.num).equals(input)) {
	                return gender;
	            }
	        }
	        throw new IllegalArgumentException("Invalid gender value: " + input);
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


	    public static UserStatus parseUserStatus(String input) {
	        for (UserStatus status : UserStatus.values()) {
	            if (status.desc.equals(input) || String.valueOf(status.num).equals(input)) {
	                return status;
	            }
	        }
	        throw new IllegalArgumentException("Invalid user status value: " + input);
	    }

		
		
	}
}
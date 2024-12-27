package com.erp.auth.vo;
import java.time.LocalDateTime;
//import lombok.*;

//@Getter
//@Setter
public class UserInfoVO {
	
	private long userSeq;
	private String userId;
	private String password;
	private String userName;
	private String email;
	private String address;
	private String phoneNumber;
	private String userStatus;
	private LocalDateTime registerDate;
	private LocalDateTime hireDate;
	private LocalDateTime modifyDate;
	
	
	/*
	 * 내 ide에서 롬복 오류 떠서 이렇게 넣음 
	 * by : 최영범
	 * 
	 */
	
	
	public long getUserSeq() {
		return userSeq;
	}
	
	public UserInfoVO() {}
	public UserInfoVO(String userId, String password, String userName, String email, String address, String phoneNumber,
			String userStatus, LocalDateTime registerDate, LocalDateTime hireDate, LocalDateTime modifyDate) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.email = email;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.userStatus = userStatus;
		this.registerDate = registerDate;
		this.hireDate = hireDate;
		this.modifyDate = modifyDate;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserSeq(long userSeq) {
		this.userSeq = userSeq;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public LocalDateTime getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(LocalDateTime registerDate) {
		this.registerDate = registerDate;
	}
	public LocalDateTime getHireDate() {
		return hireDate;
	}
	public void setHireDate(LocalDateTime hireDate) {
		this.hireDate = hireDate;
	}
	public LocalDateTime getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(LocalDateTime modifyDate) {
		this.modifyDate = modifyDate;
	}
	@Override
	public String toString() {
		return "UserInfoVO [userSeq=" + userSeq + ", password=" + password + ", userName=" + userName + ", email="
				+ email + ", address=" + address + ", phoneNumber=" + phoneNumber + ", userStatus=" + userStatus
				+ ", registerDate=" + registerDate + ", hireDate=" + hireDate + ", modifyDate=" + modifyDate + "]";
	}
	

	

}

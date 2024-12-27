//package com.erp.auth.service;
//
//import org.mindrot.jbcrypt.BCrypt;
//
//import com.erp.auth.endpoint.auth_comm.PasswordEncryptionUtil;
//import com.erp.auth.repository.UserRepository;
//import com.erp.auth.vo.UserInfoVO;
//
//public class UserService {
//	/*
//	 * 
//	 * made by 최영범
//	 * 
//	 */
//	
//	public boolean userGet(String userId, String password) {
//		
//		PasswordEncryptionUtil passEncode = new PasswordEncryptionUtil();
//		UserRepository userRepotisoty = new UserRepository();
//		
//		UserInfoVO user = userRepotisoty.findByUserId(userId);
//		System.out.println(user.getPassword());
//		if(user != null) {
//			String userPassword = user.getPassword();
//			String checkPwd = passEncode.encryptPassword(userPassword);
//			System.out.println(checkPwd);
//			
//			boolean isMatch = BCrypt.checkpw(password, userPassword);
//			if(isMatch) {
//				System.out.println("로그인 성공");
//			}
//		
//			System.out.println("비밀번호 일치 여부: " + isMatch);
//			return true;
//		}
//		
//		// 여기까지 온거면 로그인 실패
//		return false;
//	}
//
//	
//	//유저 가입 
//	//TODO
//	// 유저 중복 검사, 이메일 중복 검사
//	public boolean userSave(UserInfoVO user){
//	
//		//TOOD 
//		// 검증
//		
//		// 비밀번호 암호화
//		PasswordEncryptionUtil passEncode = new PasswordEncryptionUtil();
//		
//		// 비밀번호 암호화
//		String password = "123";
//		
//		
//		user.setPassword(passEncode.encryptPassword(user.getPassword()));
//		String hashedPassword = passEncode.encryptPassword(password);
//		System.out.println("암호화된 비밀번호: " + hashedPassword);
//		UserRepository res = new UserRepository();
//		res.insertUser(user);
//		
//	
//		 
//
//
//		
//		// 여기까지 내려오면 실패한거임
//		return false;
//	}
//	public boolean userLogin(String userId, String password) {
//		
//		UserRepository userRepotisoty = new UserRepository();
//		
//		
//		// 유저 아이디가 있다면 가져오기
//		UserInfoVO user = userRepotisoty.findByUserId(userId);
//		
//		// 가져온 유저값이 NULL이 아니면
//		if(user != null) {
//			// 가져온 유저 이름과 비밀번호가 맞다면 로그인 성공
//			if(user.getUserId().equals(userId) && user.getPassword().equals(password)) {
//				System.out.println("로그인 성공");
//				return true;
//			}	
//		}
//		
//		// 여기까지 내려오면 실패한거임
//		return false;
//	}
//
//}

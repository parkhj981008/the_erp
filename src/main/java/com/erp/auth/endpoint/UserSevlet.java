//package com.erp.auth.endpoint;
//
//import java.io.IOException;
//import java.time.LocalDateTime;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//
//
//import com.erp.auth.endpoint.auth_comm.PasswordEncryptionUtil;
//import com.erp.auth.repository.UserRepository;
//import com.erp.auth.service.UserService;
//import com.erp.auth.vo.UserInfoVO;
//
//
//@WebServlet("/UserSevlet")
//public class UserSevlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
// 
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		
//		UserRepository user = new UserRepository();
//		
//		UserInfoVO u = user.findByUserId("hong123");
//		System.out.println(u);
//			
//		// 로그인
//		UserService userService = new UserService();
//		if(userService.userLogin("hong123", "hong123!@#")) {
//			System.out.println("서블릿에서 로그인 성공");
//		}
//		
//		// 비밀번호 암호화
//		PasswordEncryptionUtil passEncode = new PasswordEncryptionUtil();
//		
//		// 비밀번호 암호화
//		String password = "123";
//		String hashedPassword = passEncode.encryptPassword(password);
//		System.out.println("암호화된 비밀번호: " + hashedPassword);
//
//		// 비밀번호 검증
//		boolean isMatch = passEncode.checkPassword(password, hashedPassword);
//		System.out.println("비밀번호 일치 여부: " + isMatch);
//		
//		
//		
//		
//		LocalDateTime now = LocalDateTime.now();
//		
//
//		// 유저 생성
//		UserInfoVO user1 = new UserInfoVO(
//			    "smith3",                          // userId
//			    "1234",                      // password
//			    "John Doe",                         // userName
//			    "joh654n.doe@email.com",              // email
//			    "서울시 강남구",                      // address
//			    "010-1234-5123",                   // phoneNumber
//			    "ACTIVE",                          // userStatus
//			    now,               // registerDate
//			    now,               // hireDate
//			    now                // modifyDate
//			);
//		
//		// 유저 저장
//		userService.userSave(user1);
//		
//		
////		userService.userGet("smith3", "1234");
//		
//		
//		
//		
//
//		
//	}
//
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}

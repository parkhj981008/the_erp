package com.erp.hr.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//---------------------------------------------------
// 상속관계
// java.lang.Object
// 		javax.servlet.GenericFilter
// 				javax.servlet.http.HttpFilter

// All Implemented Interfaces : 
// 			Serializable, Filter, FilterConfig
//---------------------------------------------------


//***SpringSecurity Filter

//	Authentication (인증)
//		: 사용자 확인 (ID/PW 체크 등)
//	Authorization (인가)
//		: 권한 확인 (유저/어드민 체크 등)


//================================================================================================
//이 모든게 WAS(Tomcat) 안에서 움직이는 것임.
//
//
//									 	 <Spring Container>  여기에 다 정보를 저장해두는 거임.! 얘가 꼭대기.
//										---> SecurityContext <--  
// request --들어오면-->					|						|
// response		<------- AuthenticationFilter -----> AuthorizationFilter ---> Controller
// MyFilter		MySecurity extends (manager)			MyRole
//				id,pw 말고도 + email, token..				(user, admin, tutor)
//=================================================================================================
// 인증필터에서 매니저를 데려와서 나만의시큐리티를 만들것임. 
// (왜만들어? 스프링은 인증과 관련해서 ID/PW말고는 없어서..
// 이 매니저꺼 id/pw 메소드 재정의하고 추가로도 내가하고싶은 email이나 token도 하고싶으니까)


@WebFilter("/*")
//들어오는 모든 주소에 대해서 필터걸어라

public class MyEncodingFilter implements Filter {
		
	public MyEncodingFilter() {}
	

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		
		//인코딩
		request.setCharacterEncoding("UTF-8");
   		response.setContentType("text/html; charset=UTF-8");
   		
   		//필터체인
   		chain.doFilter(request, response);
   		
   		
	}
}





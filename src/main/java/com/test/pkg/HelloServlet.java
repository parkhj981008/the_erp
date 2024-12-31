package com.test.pkg;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet("/HelloServlet")

public class HelloServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.write( "<font color=red>GET메서드에요~~</font>" );
		out.write( "<script>alert('ssss');</script>" );		//알람창 띄우는 것
	}
	
//	get메서드로 하면 주소창에 키값이 그대로 다보임
//	http://localhost:8081/prj_web/HelloServlet
								//	?userid=kim
								//	&userpw=111
								//	&gender=m
								//	&hobby=fish
								//	&hobby=mount
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
   		response.setContentType("text/html; charset=UTF-8");
   		
   		PrintWriter out = response.getWriter();
		out.write( "<font color=blue>POST메서드에요~~</font>" );
   		
   		String 	v_userid = request.getParameter("userid");			//emp_form의 name값이 userid인 것
//   	String[] v_hobby = request.getParameterValues("hobby");		//emp_form의 name값이 hobby인 것
//  	for(String s : v_hobby) {
//   		System.out.println("취미:" + s + "\t");
//   	}
   		
   		System.out.println("회원포인트 입력 10점");
   		System.out.println("아이디 : " + v_userid);		//사용자가 입력한 아이디 저장눌렀을때(submit) 잘 나오나 확인
   		
   		//리다이렉트할 위치
   		//response.sendRedirect(request.getContextPath()+ "/emp_result.jsp?msg="+v_userid);
   		
   		ArrayList<String> alist = new ArrayList<String>();
	   		alist.add("제목1");
	   		alist.add("제목2");
	   		alist.add("제목3");
   
   		//Request에다가 setAttribute로 보낼것 담기 보내고싶은거 다 갖다 붙이면 된다
   		request.setAttribute("MY_LIST_KEY", alist);
   		request.setAttribute("MY_POINT_KEY", 20000);
   		
   		//rd에 갖다붙여라
   		RequestDispatcher rd = request.getRequestDispatcher("/emp_result.jsp");
   		
   		//rd전체를 포워딩 해라~~ (요청, 응답)들고다님
   		rd.forward(request, response);
	}

}




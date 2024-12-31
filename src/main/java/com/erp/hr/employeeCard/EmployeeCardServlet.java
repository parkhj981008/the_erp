package com.erp.hr.employeeCard;

import java.io.*;
import java.sql.Date;

import java.util.ArrayList;
import java.util.HashMap;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.erp.common.constant.CommonCode.Gender;
import com.erp.common.constant.CommonCode.UserStatus;
import com.erp.hr.common.PagingUtil;
//import com.erp.hr.employeeCard.hrVO;
import com.fasterxml.jackson.databind.ObjectMapper;


@WebServlet("/employeeCardServlet")

public class EmployeeCardServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

   		String pageGubun = request.getParameter("pageGubun");
   		EmployeeCardDAO edao = new EmployeeCardDAO();
   	
   		System.out.println("페이지 구분자는 : -" + pageGubun + "-");
   		
   		
   		//	 -------------------------------------------------------- 인사카드 전체 목록보기 (페이징)
   		if (pageGubun == null || pageGubun.equals("")) {
   		
   			int currentPage = 1;
   			
   			String currentPageStr = request.getParameter("currentPage");
   			
   			if(currentPageStr != null && !currentPageStr.equals("")) {
   				currentPage = Integer.parseInt(currentPageStr);
   				//현재페이지 값 세팅
   			}
   			//총게시글수는 DB에 가서 가져와
   			int totRecord = edao.insaCardSelect().size();
   			//내맘대로 보여줄개수 설정
   			int blockCount = 20;
   			int blockPage = 5;
   		
   			PagingUtil pg = new PagingUtil("/employeeCardServlet", currentPage, totRecord, blockCount, blockPage);

   			ArrayList<hrVO> elist = edao.insaCardSelect(pg.getStartSeq(), pg.getEndSeq());
   			request.setAttribute( "MY_KEY_PAGING_HTML", pg.getPagingHtml().toString() );
   			//----------------------------------------------------------------------------
   			request.setAttribute("MY_KEY_ELIST", elist);
   			
   			//목록보기 페이지로 포워딩
   			request.getRequestDispatcher("/employee_list.jsp").forward(request, response);

   		//e.of.null이나공백
   			
   		//   -------------------------------------------------------------- 해당 인사카드 상세보기 T			
   		
   		} else if (pageGubun.equals("T001")) {	//셀렉트
   			
   			int user_seq = 1;
   			
   			// user_seq 받기
   			String user_seqStr = request.getParameter("user_seq");
   			if(user_seqStr != null && !user_seqStr.equals(""))  {
   				user_seq = Integer.parseInt(user_seqStr);
   				
   				hrVO hvo = edao.insaCardSelect(user_seq);
   				request.setAttribute("MY_KEY_HVO", hvo);		// 해당 인사카드 상세내용
   				
   				// 인사카드 상세페이지로 포워딩
   	   			request.getRequestDispatcher("/employee_detail.jsp").forward(request, response);
   	   			
   			} else {
   				response.sendRedirect("/404.html");
   			}
		
   		} //e.of.T001
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
//		request.setCharacterEncoding("UTF-8");
//   	response.setContentType("text/html; charset=UTF-8");
   		
   		PrintWriter out = response.getWriter();
		out.write( "<font color=blue> POST 메서드 호출됨 </font>" );
		System.out.println("POST 메서드 호출됨");

		//페이지 구분자부터 받기
   		String pageGubun = request.getParameter("pageGubun");
   		

   		EmployeeCardDAO edao = new EmployeeCardDAO();
   		System.out.println("-" + pageGubun + "-");
   		

   		if (pageGubun == null) {
   			response.sendRedirect("/500.html");
   			
   		//e.of.null
   			
   		// ----------------------------------------------------------- 인사카드 등록 I

   		} else if (pageGubun.equals("I001")) {
   			
   			
   			StringBuilder jsonData = new StringBuilder();
   		    String line;
   		    try (BufferedReader reader = request.getReader()) {
   		        while ((line = reader.readLine()) != null) {
   		            jsonData.append(line);
   		        }
   		    }
   		    String jsonString = jsonData.toString();
   			System.out.println(jsonString);
   			
   			ObjectMapper om = new ObjectMapper();
   			
   			hrVO vo = om.reader().readValue(jsonString, hrVO.class);
   			System.out.println(vo);
   		    
   	   		String v_userid 		 = request.getParameter("user_id");		//employee_form의 name값이 user_id인 것
   	   		String v_user_password 	 = request.getParameter("user_password");
   	   		String v_email 			 = request.getParameter("email");
   	   		String v_address 		 = request.getParameter("address");
   	   		int v_phone_number 		 = Integer.parseInt(request.getParameter("phone_number").trim());
   	   		Date v_register_date 	 = java.sql.Date.valueOf(request.getParameter("register_date"));
   	   		UserStatus v_user_status = UserStatus.parseUserStatus(request.getParameter("user_status"));
   	   		Date v_hire_date 		 = java.sql.Date.valueOf(request.getParameter("hire_date"));
   	   		String v_user_name 		 = request.getParameter("user_name");
   	   		Date v_modify_date 		 = java.sql.Date.valueOf(request.getParameter("modify_date"));
   	   		int v_department_id 	 = Integer.parseInt(request.getParameter("department_id"));
   	   		Gender v_gender 		 = Gender.parseGender(request.getParameter("gender"));
   	   		Date v_birth 			 = java.sql.Date.valueOf(request.getParameter("birth"));
   	   		int v_extension_number	 = Integer.parseInt(request.getParameter("extension_number"));
   	   		Date v_termination_date  = java.sql.Date.valueOf(request.getParameter("termination_date"));
   	   		String v_position 		 = request.getParameter("position");
   	   		int v_manager_id 		 = Integer.parseInt(request.getParameter("manager_id"));
   			
   			hrVO hvo  = new hrVO();
	   			hvo.setUser_id(v_userid);
				hvo.setUser_password(v_user_password);
				hvo.setEmail(v_email);
				hvo.setAddress(v_address);
				hvo.setPhone_number(v_phone_number);
				hvo.setRegister_date(v_register_date);
				hvo.setUser_status(v_user_status);
				hvo.setHire_date(v_hire_date);
				hvo.setUser_name(v_user_name);
				hvo.setModify_date(v_modify_date);
				hvo.setDepartment_id(v_department_id);
				hvo.setGender(v_gender);
				hvo.setBirth(v_birth);
				hvo.setExtension_number(v_extension_number);
				hvo.setTermination_date(v_termination_date);
				hvo.setPosition(v_position);
				hvo.setManager_id(v_manager_id);
	   			
	   			
   			int res = edao.insaCardInsert(hvo);
   			
   			//정상적으로 입력 된 경우 --> 목록으로 가기
			if(res > 0) {
   				response.sendRedirect("/employeeCardServlet");	//get방식
   			} else {
   				response.sendRedirect("/500.html");
   			}
			//e.of.I001
	
	
   	// ----------------------------------------------------------- 게시글 삭제 D
			
		} else if (pageGubun.equals("D001")) {
			
			int user_seq = 0;
			
			String user_seqStr = request.getParameter("user_seq");
			
			if(user_seqStr != null && !user_seqStr.equals(""))  {
				user_seq = Integer.parseInt(user_seqStr);
				
				int res = edao.insaCardDelete(user_seq);
   			if(res > 0) {
   				//정상적으로 삭제가 된 경우 --> 목록보기로 이동
   				response.sendRedirect("/employeeCardServlet"); //get방식
   			} else { //정상삭제 안되면
   				response.sendRedirect("/500.html");
   			}
			} else { //user_seq가 (null,공백)이면
				response.sendRedirect("/500.html");
			}
			//e.of.D001
			
//		 ----------------------------------------------------------- 그외
		} else {
			response.sendRedirect("/500.html");
		}
	
	
	
		}//e.of.post
	
}	




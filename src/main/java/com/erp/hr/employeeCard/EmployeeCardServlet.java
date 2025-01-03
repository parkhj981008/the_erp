package com.erp.hr.employeeCard;

import java.io.*;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Arrays;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.erp.common.constant.CommonCode.Gender;
import com.erp.common.constant.CommonCode.UserStatus;
import com.erp.hr.common.PagingUtil;
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
   			int blockCount = 10;
   			int blockPage = 5;
   		
   			PagingUtil pg = new PagingUtil("/employeeCardServlet", currentPage, totRecord, blockCount, blockPage);

   			ArrayList<HrVO> elist = edao.insaCardSelect(pg.getStartSeq(), pg.getEndSeq());
   			request.setAttribute( "MY_KEY_PAGING_HTML", pg.getPagingHtml().toString() );
   			//----------------------------------------------------------------------------
   			request.setAttribute("MY_KEY_ELIST", elist);
   			
   			//목록보기 페이지로 포워딩
   			request.getRequestDispatcher("/erp/hr/employeeCard/employeeCard_list.jsp").forward(request, response);

   		//e.of.null이나공백
   			
   		//   -------------------------------------------------------------- 해당 인사카드 상세보기 T			
   		
   		} else if (pageGubun.equals("T001")) {	//셀렉트
   			
   			int user_seq = 1;
   			
   			// user_seq 받기
   			String user_seqStr = request.getParameter("user_seq");
   			if(user_seqStr != null && !user_seqStr.equals(""))  {
   				user_seq = Integer.parseInt(user_seqStr);
   				
   				HrVO hvo = edao.insaCardSelect(user_seq);
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
   		

		System.out.println("POST 메서드 호출됨");

		//페이지 구분자부터 받기
   		String pageGubun = request.getParameter("pageGubun");
   		

   		EmployeeCardDAO edao = new EmployeeCardDAO();
   		System.out.println("페이지 구분자는 : -" + pageGubun + "-");
   		

   		if (pageGubun == null) {
   			response.sendRedirect("/500.html");
   			
   		//e.of.null
   			
   		// ----------------------------------------------------------- 인사카드 등록 I

   		} else if (pageGubun.equals("I001")) {
   			
   			BufferedReader reader = request.getReader();
   			StringBuilder jsonData = new StringBuilder();
   		    String line;
   		    while ( (line = reader.readLine()) != null ) {
   		           jsonData.append(line);
   		    }
   		    
   		    // 요청값이 제대로 들어왔나 확인
   		    String jsonString = jsonData.toString();
   		    System.out.println("요청들어온 값: " + jsonString);
   			
   			ObjectMapper om = new ObjectMapper();
   			
   			//ObjectMapper가 필드를 자동으로 Date 타입으로 변환하도록 추가적인 설정
   			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   			om.setDateFormat(sdf);
   			
   			//JSON 데이터를 Java 객체로 변환
	   		HrVO hvo = om.reader().readValue(jsonString, HrVO.class);
	   		System.out.println("Parsed HrVO: " + hvo);
   		    
//   			HrVO hvo  = new HrVO();
//   			try {
//	   	   		String v_userid 		 = request.getParameter("user_id");		//employeeCard_form의 name값이 user_id인 것
//	   	   		String v_user_password 	 = request.getParameter("user_password");
//	   	   		String v_email 			 = request.getParameter("email");
//	   	   		String v_address 		 = request.getParameter("address");
//	   	   		int v_phone_number 		 = Integer.parseInt(request.getParameter("phone_number").trim());
//	   	   		Date v_register_date 	 = java.sql.Date.valueOf(request.getParameter("register_date"));
//	   	   		UserStatus v_user_status = UserStatus.parseUserStatus(request.getParameter("user_status"));
//	   	   		Date v_hire_date 		 = java.sql.Date.valueOf(request.getParameter("hire_date"));
//	   	   		String v_user_name 		 = request.getParameter("user_name");
//	   	   		Date v_modify_date 		 = java.sql.Date.valueOf(request.getParameter("modify_date"));
//	   	   		int v_department_id 	 = Integer.parseInt(request.getParameter("department_id"));
//	   	   		Gender v_gender 		 = Gender.parseGender(request.getParameter("gender"));
//	   	   		Date v_birth 			 = java.sql.Date.valueOf(request.getParameter("birth"));
//	   	   		String v_position 		 = request.getParameter("position");
//	   	   		int v_manager_id 		 = Integer.parseInt(request.getParameter("manager_id"));
//   		
//	   			hvo.setUser_id(v_userid);
//				hvo.setUser_password(v_user_password);
//				hvo.setEmail(v_email);
//				hvo.setAddress(v_address);
//				hvo.setPhone_number(v_phone_number);
//				hvo.setRegister_date(v_register_date);
//				hvo.setUser_status(v_user_status);
//				hvo.setHire_date(v_hire_date);
//				hvo.setUser_name(v_user_name);
//				hvo.setModify_date(v_modify_date);
//				hvo.setDepartment_id(v_department_id);
//				hvo.setGender(v_gender);
//				hvo.setBirth(v_birth);
//				hvo.setPosition(v_position);
//				hvo.setManager_id(v_manager_id);
//	   			
//   			} catch (IllegalArgumentException e) {
//   				e.printStackTrace();
//   			}
	   			
   			int res = edao.insaCardInsert(hvo);
   			
   			// 응답 타입을 JSON 객체로 설정
   			response.setContentType("application/json; charset=UTF-8");
   	        
			
   			// 정상적으로 DB에 입력시 1 반환, 실패시 0 반환
			if (res > 0) {
				response.getWriter().write("{\"status\":1, \"message\":\"정상 입력됨\"}");
			} else {
				response.getWriter().write("{\"status\":0, \"message\":\"입력 실패\"}");
   			}


	//e.of.I001
			
   	// -------------------------------------------------------- 인사카드 선택 삭제 D001

		} else if (pageGubun.equals("D001")) {
//			request.setCharacterEncoding("UTF-8");
			
	        // 전송된 배열 데이터(valueArr) 받기
	        String[] valueArr = request.getParameterValues("valueArr");
	        int size = valueArr.length;
	        
	        System.out.println(
	        		"삭제할 데이터: " + Arrays.toString(valueArr)
	        		); // valueArr 값 잘 들어왔는지 확인 로그
	        
	        
	        boolean allDeleted = true; // 모두삭제 성공 여부 플래그
	        int res = 0;	//삭제건수
	        
	        if (valueArr != null && valueArr.length > 0) {
		        for(int i=0; i < size; i++) {
		        	// 삭제 처리
		        	res = edao.insaCardDelete(valueArr[i]);
		        	
		        	// 삭제 결과 확인
		        	System.out.println("삭제시도: " + valueArr[i] +"번 사원"+ ", 삭제결과: " + res);
		        	 
		        	
	                if (res <= 0) { // 하나라도 삭제 실패 시
	                    allDeleted = false;
	                    break;		//for 루프를 바로 종료
	                }
		        }
		        
		        // 응답 타입을 JSON 객체로 설정
		        response.setContentType("application/json; charset=UTF-8");
		        
		        // 모든 삭제가 이루어진 후 1 반환, 실패시 0 반환
		        if (allDeleted) {
		        	response.getWriter().write("{\"status\":1, \"message\":\"모두 삭제 성공\"}");
		        
		        } else {
		        	response.getWriter().write("{\"status\":0, \"message\":\"삭제 실패\"}");
		        }
	        
	        } else { // valueArr가 null이거나 비어있다면 에러 페이지로 이동
	        	response.sendRedirect("/500.html");
		    }
		} //e.of.D001
			
//		 ----------------------------------------------------------- 그외
		else {
			response.sendRedirect("/500.html");
		}
	
	}//e.of.post
	
}	




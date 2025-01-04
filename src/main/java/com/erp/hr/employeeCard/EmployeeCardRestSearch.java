package com.erp.hr.employeeCard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;


@WebServlet("/restSearch")

public class EmployeeCardRestSearch extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("UTF-8");
			
		//----------------------------------------------- request : 요청 파라미터
		// searchGubun=user_seq & searchStr=199
		// searchGubun=user_name & searchStr=마동석
		
		String searchGubun = request.getParameter("searchGubun");
		String searchStr   = request.getParameter("searchStr");
		System.out.println(searchGubun + "," + searchStr);
		
		//-----------------------------------------------------------
		//TODO 비즈니스 로직
		EmployeeCardDAO dao = new EmployeeCardDAO();
		
		if (searchGubun.equals("user_seq")) {
			System.out.println("사원번호로 검색");
			int searchInt = Integer.parseInt(searchStr);
			HrVO hvo = dao.insaCardSelect(searchInt);
			//-----------------------------------------------response : JSON 응답 생성
			response.setContentType("application/json; charset=UTF-8");

			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(hvo);
			System.out.println("검색된 사원:" + jsonString);

			PrintWriter out = response.getWriter();
			out.write(jsonString);
		}
		
		ArrayList<HrVO> alist = new ArrayList<HrVO>();
		if (searchGubun.equals("user_name")) {
			System.out.println("이름으로 검색");
			alist = dao.insaCardSelect(searchStr);
		//-----------------------------------------------response : JSON 응답 생성
		response.setContentType("application/json; charset=UTF-8");

		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(alist);
		System.out.println("검색된 사원:" + jsonString);

		PrintWriter out = response.getWriter();
		out.write(jsonString);
		}
		
	}	
}
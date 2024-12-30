package com.erp.facility.endpoint;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.erp.facility.Service.FacilityService;
import com.erp.facility.Service.impl.FacilityServiceImpl;
import com.erp.facility.VO.FacilityDTO;
import static com.erp.facility.common.DtoConverter.convertToDto;


@WebServlet("/facility")
public class FacilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private final FacilityService facilityService = new FacilityServiceImpl();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		System.out.println(facilityService.testDB()); 
		String actionPage = request.getParameter("actiop");
		
		System.out.println("actionPage = "+ actionPage);
		
		facilityService.findAll().forEach(i -> System.out.println(i));
		
		if(actionPage==null) {
			System.out.println("NULL 입니다. ");			
		} 

		System.out.println("Servlet Get End ");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionPage = request.getParameter("actiop");
		
		if(actionPage==null) {
			System.out.println("NULL 입니다. ");
			
		} else if(actionPage.equals("save")) {
			
			// 타입 컨버트, 자동으로 필드 매핑
			FacilityDTO facilityDTO = convertToDto(request, FacilityDTO.class);  
			facilityService.save(facilityDTO);
			
			System.out.println(facilityDTO);
			System.out.println("facilityDTO : 저장완료");
			
		} else if(actionPage.equals("delete")) {
			
			
		}
 		
		System.out.println("Servlet Post End");
	}

}

package com.erp.facility.endpoint;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.erp.facility.Service.FacilityService;
import com.erp.facility.Service.impl.FacilityServiceImpl;
import com.erp.facility.VO.FacilityDTO;


import static com.erp.facility.common.DtoConverter.convertToDto;


@WebServlet("/facility/*")
public class FacilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private final FacilityService facilityService = new FacilityServiceImpl();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String actionPage = request.getParameter("actiop");	
		String pathInfo = request.getPathInfo(); 

		System.out.println("actionPage = "+ actionPage);
		

		if(pathInfo.equals("/list")) {
			String type = request.getParameter("type");	
			if(type == null) {
				List<FacilityDTO> allList = facilityService.findAll();
				allList.forEach(i -> System.out.println(i)); 
				
				request.setAttribute("Fac_LIST", allList );
				request.setAttribute("gift", "QWER" );
				
//				request.getRequestDispatcher("/testqq.jsp").forward(request, response);
				request.getRequestDispatcher("/facility/facility_main.jsp").forward(request, response);
				
			}
		 
		} else if ("/modify".equals(pathInfo)) {
            // 수정 페이지 로직 처리
           response.sendRedirect("/facility/modify.jsp");
           
           
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
			
			
		} else if(actionPage.equals("facilityStatusOperating")) {
			
			// 운영중인 시설 
			// ajax -> json 
			List<FacilityDTO> flist = facilityService.findAllFacilityOperating();
			
			
			
		} else if(actionPage.equals("findAllFacilityNon_Operating")) {
						
			//시설 운영중단 	
			// ajax -> json 
			List<FacilityDTO> flist = facilityService.findAllFacilityNon_Operating();		
			
		}
 		
		System.out.println("Servlet Post End");
	}

}

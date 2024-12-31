package com.erp.facility.endpoint;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.erp.common.rest.RestBusinessException;
import com.erp.common.rest.RestBusinessException.StatusCode;
import com.erp.facility.Service.FacilityService;
import com.erp.facility.Service.impl.FacilityServiceImpl;
import com.erp.facility.VO.FacilityDTO;
import com.erp.facility.dto.FacilityAndNameDTO;
import com.fasterxml.jackson.databind.ObjectMapper;

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
//				allList.forEach(i -> System.out.println(i)); 
				
				request.setAttribute("Fac_LIST", allList );		
				request.getRequestDispatcher("/erp/ga/facility/facility_main.jsp").forward(request, response);				
			    
			} 
		 
		} else if("/details".equals(pathInfo)){
			String seqStr = request.getParameter("facilityId");
			
			if(seqStr != null) {
				int seq = Integer.parseInt(seqStr);	
				
				System.out.println("seqStr = "+ seqStr);
				
				// N + 1  문제 발생 !! 나중에 따로 분리할것 
				FacilityAndNameDTO facility= facilityService.findDetails(seq);
				System.out.println("facility = "+ facility);
				request.setAttribute("FACILITY", facility );		
				request.getRequestDispatcher("/erp/ga/facility/facility_details.jsp").forward(request, response);				
			
			} else {
				throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
			}
			  
			
			 System.out.println("디테일 실행 ");
		}
		
		else if ("/modify".equals(pathInfo)) {
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
			
			
		} else if(actionPage.equals("status")) {
			String status =  request.getParameter("value");
			List<FacilityDTO> flist = null;
			if(status.equals("open")) {
				flist = facilityService.findAllFacilityOperating();
			} else if(status.equals("close")) {
				flist = facilityService.findAllFacilityNon_Operating();					
			}else {
				flist = facilityService.findAll();
			}
//			System.out.print(flist);
			ObjectMapper mapper = new ObjectMapper();			
			PrintWriter out = response.getWriter();			
			mapper.writeValue(out, flist);		
		}
 		
		System.out.println("Servlet Post End");
	}

}

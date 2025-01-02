package com.erp.facility.endpoint;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.erp.common.rest.RestBusinessException;
import com.erp.common.rest.RestBusinessException.StatusCode;
import com.erp.facility.Service.FacilityService;
import com.erp.facility.Service.ManagerService;
import com.erp.facility.Service.impl.FacilityServiceImpl;
import com.erp.facility.Service.impl.ManagerServiceImpl;
import com.erp.facility.VO.FacilityDTO;
import com.erp.facility.VO.ManagerDTO;
import com.erp.facility.dto.FacilityAndNameDTO;
import com.fasterxml.jackson.databind.ObjectMapper;

import static com.erp.facility.common.DtoConverter.convertToDto;




@WebServlet("/facility/*")
public class FacilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final FacilityService facilityService = new FacilityServiceImpl();
	private final ManagerService managerService = new ManagerServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String actionPage = request.getParameter("actiop");
		String pathInfo = request.getPathInfo();

		System.out.println("pathInfo = " + pathInfo);

		// 아무것도 없다면 list로 보내기
		if (pathInfo == null) {

			response.sendRedirect("/facility/list");

			// 시설관리 리스트 보기
		} else if (pathInfo.equals("/list")) {
			List<FacilityDTO> allList = facilityService.findAll();


			request.setAttribute("Fac_LIST", allList);
			request.getRequestDispatcher("/erp/ga/facility/facility_main.jsp").forward(request, response);

		} else if ("/details".equals(pathInfo)) {
			
			// 상세목록 보기 
			String seqStr = request.getParameter("facilityId");

			if (seqStr != null) {
				int seq = Integer.parseInt(seqStr);
 
//				System.out.println("seqStr = " + seqStr);


				FacilityDTO facility = facilityService.findDetailsFacility(seq);
				ManagerDTO manager = managerService.findDetailsManager(seq);
				
			
				request.setAttribute("FACILITY", facility);
				request.setAttribute("MANAGER", manager);
				
				request.getRequestDispatcher("/erp/ga/facility/facility_details.jsp").forward(request, response);
			}else {
				throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
			}
			
		} else if (pathInfo.equals("/create")) {

			request.getRequestDispatcher("/erp/ga/facility/facility_form.jsp").forward(request, response);
		
		
		} else if ("/modify".equals(pathInfo)) {
			// 수정 페이지 로직 처리
			response.sendRedirect("/facility/modify.jsp");

		} else if("/add-manager".equals(pathInfo)){
			
			List<String> fType =  facilityService.facilityType();
			System.out.println("type 실 행 " );
			System.out.println("Size =  "+  fType);
			fType.forEach(i -> System.out.println("type = " + i));
			request.setAttribute("F_TYPE", fType);
			
			request.getRequestDispatcher("/erp/ga/facility/manager_form.jsp").forward(request, response);
			
		}else {
			throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
		}

		System.out.println("Facility Servlet Get End ");
	}

	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionPage = request.getParameter("actiop");

		System.out.println("actiop = " + actionPage);
		
		if (actionPage == null) {
			System.out.println("NULL 입니다. ");
			response.sendRedirect("/facility/list");
			
		} else if (actionPage.equals("save")) {
			
			// 타입 컨버트, 자동으로 필드 매핑	
			FacilityDTO facility = convertToDto(request, FacilityDTO.class);
   			facilityService.save(facility);
			
			System.out.println("facilityDTO : 저장완료");
			response.sendRedirect("/facility/list");

				
		} else if (actionPage.equals("status")) {
			
			String status = request.getParameter("value");
			List<FacilityDTO> flist = null;

			if (status.equals("open")) {
				// 운영중
				flist = facilityService.findAllFacilityOperating();
			} else if (status.equals("close")) {
				// 중단
				flist = facilityService.findAllFacilityNon_Operating();
			} else {
				// 그 외는 전체
				flist = facilityService.findAll();
			}
			ObjectMapper mapper = new ObjectMapper();
			PrintWriter out = response.getWriter();
			mapper.writeValue(out, flist);
		}

		System.out.println("Facility Servlet Post End");
	}

}

package com.erp.facility.endpoint;

import static com.erp.facility.common.DtoConverter.convertToDto;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.erp.facility.Service.InspectionService;
import com.erp.facility.Service.impl.InspectionServiceImpl;
import com.erp.facility.VO.FacilityDTO;
import com.erp.facility.VO.InspectionDTO;




@WebServlet("/inspection")
public class InspectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	private final InspectionService inspectionService = new InspectionServiceImpl();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String actionPage = request.getParameter("actionp");
		if(actionPage == null) {
				
			List<InspectionDTO> alist = inspectionService.findALl();
			
			System.out.println("alist = " + alist.size());
			
			alist.forEach(i -> System.out.println(i)); 
			
			request.setAttribute("INS_LIST", alist );
			request.setAttribute("gift", "QWER" );
			
			request.getRequestDispatcher("/facility/inspection_detail.jsp").forward(request, response);
		}
		
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String actionPage = request.getParameter("actionp");
		if(actionPage.equals("save")) {
			
			// QueryParam 을 DTO로 변
			InspectionDTO inspectionDTO = convertToDto(request, InspectionDTO.class);  
//			System.out.println("inspectionDTO = " + inspectionDTO);
			inspectionService.save(inspectionDTO);
			
		} else if(actionPage.equals("modify")) {
			InspectionDTO inspectionDTO = convertToDto(request, InspectionDTO.class);  
			System.out.println("inspectionDTO = " + inspectionDTO);
			inspectionDTO.setInspectionId(21);
			int result = inspectionService.update(inspectionDTO);

		}		
	}

}

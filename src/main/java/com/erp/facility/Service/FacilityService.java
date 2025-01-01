package com.erp.facility.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.erp.facility.VO.FacilityDTO;
import com.erp.facility.VO.InspectionDTO;
import com.erp.facility.VO.ManagerDTO;
import com.erp.facility.dto.FacilityAndNameDTO;

/**
 * Description : Facility에 관한 서비스 모음 <br>
 * Date : 2024. 12. 28.<br>
 * History :<br>
 * - 작성자 :최영범, 날짜 : 2024. 12. 26. 설명 : Facility에 관한 서비스 모음<br>
 *
 * @author 최영범
 * @version 1.0
 */

public interface FacilityService {
	
	List<FacilityDTO> findAll();	
	int save(FacilityDTO facilityDTO);
	List<FacilityDTO> findAllFacilityOperating();	
	List<FacilityDTO> findAllFacilityNon_Operating();	
	List<FacilityDTO> findAllFacilityType(String type);	
	FacilityDTO findDetailsFacility(int seq);
	List<String> facilityType();
	
}

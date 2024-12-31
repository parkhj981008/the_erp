package com.erp.facility.Service;

import java.util.List;

import com.erp.facility.VO.InspectionDTO;

public interface InspectionService {
	
	int save(InspectionDTO inspectionVO);
	public List<InspectionDTO> findALl();
	int update(InspectionDTO inspectionDTO);

}

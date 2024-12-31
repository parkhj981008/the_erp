package com.erp.facility.Service.impl;

import java.util.List;

import com.erp.facility.Repository.InspectionRepository;
import com.erp.facility.Service.InspectionService;
import com.erp.facility.VO.InspectionDTO;

public class InspectionServiceImpl implements InspectionService{
	
	private static final InspectionRepository inspectionRepotisory= new InspectionRepository();
	
	@Override
	public int save(InspectionDTO inspectionVO) {
		return inspectionRepotisory.save(inspectionVO);
	}

	@Override
	public List<InspectionDTO> findALl() {

		return inspectionRepotisory.findAll();
	}

	@Override
	public int update(InspectionDTO inspectionDTO) {
		return inspectionRepotisory.update(inspectionDTO);
	}

	
	
	

}

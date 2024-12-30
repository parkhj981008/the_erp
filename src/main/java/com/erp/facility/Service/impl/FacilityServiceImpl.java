package com.erp.facility.Service.impl;

import java.util.List;

import com.erp.facility.Repository.FacilityRepository;
import com.erp.facility.Service.FacilityService;
import com.erp.facility.VO.FacilityDTO;
import com.erp.facility.VO.InspectionDTO;

public class FacilityServiceImpl implements FacilityService{

	private static final FacilityRepository facilityRepository = new FacilityRepository();
	
	
	@Override
	public int save(FacilityDTO facilityDTO) {		
		return facilityRepository.save(facilityDTO);	
	}
	
	@Override
	public List<FacilityDTO> findAll() {
		return facilityRepository.findAll();
	}
	
	
	

	
	@Override
	public int save(InspectionDTO inspectionVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<InspectionDTO> findALl() {
		// TODO Auto-generated method stub
		return null;
	}





	
	
	
	
	

	

	
	
	
}

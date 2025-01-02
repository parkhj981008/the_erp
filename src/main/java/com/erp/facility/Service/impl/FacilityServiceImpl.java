package com.erp.facility.Service.impl;

import java.util.List;

import com.erp.facility.Repository.FacilityRepository;
import com.erp.facility.Service.FacilityService;
import com.erp.facility.VO.FacilityDTO;
import com.erp.facility.VO.InspectionDTO;
import com.erp.facility.VO.ManagerDTO;
import com.erp.facility.dto.FacilityAndNameDTO;

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
	
	
	//TODO
	@Override
	public List<FacilityDTO> findAllFacilityType(String type) {
	
		return null;
	}

	@Override
	public FacilityDTO findDetailsFacility(int seq) {
		return facilityRepository.findDetailsFacility(seq);
	}

	@Override
	public List<String> facilityType() {
		return facilityRepository.findFacilityType();
	}

	@Override
	public List<FacilityDTO> findTypeSelectList(String status) {
		
		String selectStatus = null;

		if(status.equals("open")) {
			selectStatus = "운영중";
			
		} else if(status.equals("close")) {
			selectStatus = "중단";
			
		} else {
			return facilityRepository.findAll();
		}
		
		return facilityRepository.findAllFacilityOperatingStatus(selectStatus);
	}

	@Override
	public int updateFacility(FacilityDTO facilityDTO) {
		return facilityRepository.updateFacility(facilityDTO);
	}

	

	
	
}

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
	
	@Override
	public List<FacilityDTO> findAllFacilityOperating() {
		return facilityRepository.findAllFacilityOperating();
	}

	@Override
	public List<FacilityDTO> findAllFacilityNon_Operating() {
		return facilityRepository.findAllFacilityNon_Operating();
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

	

	
	
}

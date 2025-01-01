package com.erp.facility.Service.impl;

import java.util.List;

import com.erp.facility.Repository.FacilityRepository;
import com.erp.facility.Repository.ManagerRepository;
import com.erp.facility.Service.ManagerService;
import com.erp.facility.VO.ManagerDTO;

public class ManagerServiceImpl implements ManagerService{
	private static final ManagerRepository managerRepository = new ManagerRepository();

	
	
	@Override
	public ManagerDTO findDetailsManager(int seq) {
		return managerRepository.findDetailsManager(seq);
	}

	@Override
	public List<ManagerDTO> findAll() {
		return managerRepository.findAll();
	}

	@Override
	public int save(ManagerDTO managerDTO) {
		return managerRepository.save(managerDTO);
	}

}

package com.erp.facility.Service.impl;

import java.util.List;

import com.erp.facility.Repository.FacilityRepository;
import com.erp.facility.Repository.ManagerRepository;
import com.erp.facility.Service.ManagerService;
import com.erp.facility.VO.ManagerDTO;
import com.erp.facility.dto.UserSmallDTO;

public class ManagerServiceImpl implements ManagerService {
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
	public int save(String seq) {

		ManagerDTO dto = new ManagerDTO();
		if (seq != null && !seq.equals("")) {
			UserSmallDTO user = managerRepository.getUserInfo(seq);
			dto.setUserSeq(user.getUserSeq());
			dto.setPhoneNumber(user.getPhoneNumber());
			dto.setName(user.getUserName());
			dto.setDepartment(user.getDepartmentId());
			dto.setPosition(user.getPosition());
		}
		return managerRepository.save(dto);
	}

	@Override
	public List<ManagerDTO> findFacilityIsNull() {
		return managerRepository.findFacilityIsNull();
	}

	@Override
	public boolean checkUser(String seq) {
		return managerRepository.checkUser(seq);
	}

	@Override
	public UserSmallDTO getUserInfo(String seq) {

		return null;
	}

	@Override
	public int update(String userSeq, String facilityId, String currentManagerId) {
		
		if (!userSeq.equals(currentManagerId)) {
			
			return managerRepository.updateManagerFacility(userSeq, facilityId);
		}
		
		return 0;
		
		
	}

}

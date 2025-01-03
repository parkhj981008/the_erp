package com.erp.facility.Service.impl;
import java.util.List;

import com.erp.facility.Repository.MaintenanceRepository;
import com.erp.facility.Service.MaintenanceService;
import com.erp.facility.VO.MaintenanceDTO;

public class MaintenanceServiceImpl implements MaintenanceService{

	private static final MaintenanceRepository maintenanceRepository = new MaintenanceRepository();
	
	
	
	@Override
	public int save(MaintenanceDTO maintenanceDTO) {
		return maintenanceRepository.save(maintenanceDTO);
	}

	@Override
	public List<MaintenanceDTO> findALl(String seq) {
		return maintenanceRepository.findMaintenance(seq);
	}

	@Override
	public int update(MaintenanceDTO maintenanceDTO) {
		// TODO Auto-generated method stub
		return 0;
	}


}

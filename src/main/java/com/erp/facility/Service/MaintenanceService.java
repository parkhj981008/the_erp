package com.erp.facility.Service;

import java.util.List;

import com.erp.facility.VO.MaintenanceDTO;

public interface MaintenanceService {
	int save(MaintenanceDTO maintenanceDTO);
	public List<MaintenanceDTO> findALl();
	int update(MaintenanceDTO maintenanceDTO);

}

package com.erp.facility.Service.impl;
import java.util.List;
import com.erp.facility.VO.MaintenanceDTO;

public interface MaintenanceServiceImpl {

	int save(MaintenanceDTO maintenanceDTO);
	public List<MaintenanceDTO> findALl();
	int update(MaintenanceDTO maintenanceDTO);

}

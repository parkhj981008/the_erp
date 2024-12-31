package com.erp.facility.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class FacilityAndNameDTO {
	
	private long facilityId;
	private String name;
	private String location;
	private int capacity;
	private String operatingStatus;
	private String facilityType;
	private Date completionDate;
	private String workName;
	
	
	public static String findDetails() {
		return "select f.*, m.work_manager\n"
				+ "from (select * from facility where facility_id = ?) f, maintenance m\n"
				+ "where f.facility_id = m.facility_id";
	}
	


	
}

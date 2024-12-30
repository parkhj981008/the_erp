package com.erp.facility.VO;


import java.time.LocalDateTime;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class FacilityDTO {
	
	private long facilityId;
	private String name;
	private String location;
	private int capacity;
	private String operatingStatus;
	private String facilityType;
	private Date completionDate;

	
	public static String findAllFacility() {
		return "select * from facility";
	}
	

	public static String saveFacility() {
	    return "INSERT INTO facility (facility_id, name, location, capacity, operating_status, facility_type, completion_date) " +
	           "VALUES (facility_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";
	}
	
	// 고민
	public static String updateFacility() {
		 return "UPDATE facility SET " +
		           "name = ?, " +
		           "location = ?, " +
		           "capacity = ?, " +
		           "operating_status = ?, " +
		           "facility_type = ?, " +
		           "completion_date = ? " +
		           "WHERE facility_id = ?";
	}

	
	public FacilityDTO(String name, String location, int capacity, String operatingStatus, String facilityType,
			Date completionDate) {
		super();
		this.name = name;
		this.location = location;
		this.capacity = capacity;
		 this.operatingStatus = operatingStatus; 
		this.facilityType = facilityType;
		this.completionDate = completionDate;
	}
	
	public Object[] getAttributeAsObjectArray() {	
	    return new Object[] {
//	    	this.facilityId,
	        this.name,
	        this.location,
	        this.capacity,
	        this.operatingStatus,
	        this.facilityType,
	        this.completionDate
	    };
	}

	
}

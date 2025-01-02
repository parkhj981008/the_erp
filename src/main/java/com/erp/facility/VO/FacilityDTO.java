package com.erp.facility.VO;

import java.sql.ResultSet;
import java.sql.SQLException;
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
	
	

	
	
	public static String getFindDetailsFacilityQuery() {
	    return "select * from facility where facility_id = ?";
	}


	public static String findAllFacility() {
		return "select * from facility";
	}
	
	public static String findAllFacilityOperatingStatus() {
		return "select * from facility where operating_status = ?";
	}

	
	public static String findAllFacilityType() {
		return "select * from facility where facility_type =?";
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

	
	public static FacilityDTO fromResultSet(ResultSet rs) throws SQLException {
	    return new FacilityDTO(
	        rs.getLong("facility_id"),
	        rs.getString("name"),
	        rs.getString("location"),
	        rs.getInt("capacity"),
	        rs.getString("operating_status"),
	        rs.getString("facility_type"),
	        rs.getDate("completion_date")
	    );
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
	
	public Object[] getAttributeAsObjectArraUpdate() {	
		return new Object[] {
//	    	return new Object[] {
		        this.name,
		        this.location,
		        this.capacity,
		        this.operatingStatus,
		        this.facilityType,
		        this.completionDate,
		        this.facilityId
		};
	}

	
}

package com.erp.facility.VO;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InspectionDTO {
	
	private long inspectionId;
	private long facilityId;
	private Date inspectionDate;
	private String inspectionState;
	private String inspectionResult;
	private String workManager;

	
	public static String findAllInspection() {
		return "select * from inspection";
	}
	
	public Object[] getAttributeAsObjectArray() {	
	    return new Object[] {
	        this.facilityId,
	        this.inspectionDate,
	        this.inspectionState,
	        this.inspectionResult,
	        this.workManager
	    };
	}
	
}

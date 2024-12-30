package com.erp.facility.VO;

import java.util.Date;

public class ReservationDTO {
	
	private long reservationId;
	private long facilityId;
	private String userId;
	private Date reservationDate;
	private String reservationStatus;
	
	
	public static String findAllReservation() {
		return "select * from reservation";
	}
	
	public Object[] getAttributeAsObjectArray() {	
	    return new Object[] {
	        this.facilityId,
	        this.userId,
	        this.reservationDate,
	        this.reservationStatus
	    };
	}
}

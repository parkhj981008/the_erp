package com.erp.attendance.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class InsertAttendanceDTO {
	private Date attendanceDate;
	private String userName;
	private String attendanceCode;
	private String vacationName;
	private int daysNumber;
	private String notes;
	private int userSeq;
}

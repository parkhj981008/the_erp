package com.erp.attendance.vo;

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
public class AttendanceDTO {
	private Long attendanceSeq;
	private String attendanceCode;
	private int daysNumber;
//	private String vacationName;
	private String notes;
	private String userName;
}

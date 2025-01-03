package com.erp.attendance.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class AttendanceItemsVO {
	private Long attendanceItemsSeq;
	private String attendanceCode;
	private String attendanceName;
	private Long attendanceSeq;
	
}

package com.erp.attendance.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
public class AttendanceVO {
	private Long attendanceSeq;
	private String attendanceCode;
	private Date attendanceDate;
	private int daysNumber;
//	private String vacationName;
	private String notes;
	private int userSeq;
}

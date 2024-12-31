package com.erp.hr.organizationChart;

import java.util.Date;
import lombok.*;

import com.erp.auth.vo.AuthDTOs;
import com.erp.common.constant.CommonCode.Gender;

public class EmployeeCard {
	
	@Getter
	@Setter
	@NoArgsConstructor
	@Builder
	@AllArgsConstructor
	
public static class Employee {
	private String userId;
	private String userPassword;
	private String email;
	private String address;
	private int phoneNumber;
	private String userName;
	private Gender gender;
	private Date birth;
	}
}

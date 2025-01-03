package com.erp.hr.employeeCard;

import java.util.Date;
//import java.sql.Date;
import com.erp.common.constant.CommonCode.Gender;
import com.erp.common.constant.CommonCode.UserStatus;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
//import lombok.Builder;

	@Getter
	@Setter
	@AllArgsConstructor
	@NoArgsConstructor
	@ToString
	
	public class HrVO {
		private int user_seq;
		private String user_id;				// 아이디
		private String user_password;		// 비밀번호
		private String email;				// 이메일
		private String address;				// 주소
		private int phone_number;			// 핸드폰번호
		private Date register_date;			// 등록일
		private UserStatus user_status;		// 상태코드
		private Date hire_date;				// 입사일
		private String user_name;			// 성명
		private Date modify_date;			// 수정일
		private int department_id;			// 부서번호
		private String department_name;		// 부서명
		private Gender gender;				// 성별
		private Date birth;					// 생년월일
		private int extension_number;		// 내선번호
		private Date termination_date;		// 퇴사일
		private String position;			// 직위
		private int manager_id;				// 사수 번호	
	
}

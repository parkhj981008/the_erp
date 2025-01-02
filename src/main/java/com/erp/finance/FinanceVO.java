package com.erp.finance;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FinanceVO {

	private String account_id;		// 계정ID
	private String account_name;	// 계정명
	private String account_type;	// 계정유형
	private String parent_type;		// 부모계정
	private Long diff;				// 차변과 대변의 차
	
	private String voucher_date;	// 전표날짜
	private String descript;		// 적요
	private Long debit;				// 차변
	private Long credit;			// 대변
	
	
}




package com.erp.common.security;

import com.erp.auth.vo.AuthDTOs;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Builder
@AllArgsConstructor
@Getter
@Setter
public class UserInfo {
	private int userSeq;
	private int[] roles;
}
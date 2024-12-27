package com.erp.common.rest;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
public class RestBusinessException extends RuntimeException {
	private StatusCode statusCode;

	public RestBusinessException(){
		super();
	}
	
	public RestBusinessException(StatusCode statusCode){
		super(statusCode.getDesc());
		this.statusCode = statusCode;
	}
	
	
	
	@AllArgsConstructor
	@Getter
	public static enum StatusCode{
		BAD_REQUEST("잘못된 요청입니다.", 400)
		, CONSTRAINT_VIOLATION("중복된 값을 입력하셨습니다.", 400)
		, UNEXPECTED_ERROR("예상치 못한 오류", 400)
		;
		
		private final String desc;
		private final int statusCode;
	}

	public RestResponse<String> convertToRestResponse() {
		return new RestResponse.RestResponseBuilder()
				.resonseDate(new Date())
				.message(this.statusCode.getDesc())
				.data("error")
				.build();
	}

	
	
}
package com.erp.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;

import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

public class EncodingFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// HttpServletRequest로 형변환하여 URI를 확인
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String uri = httpRequest.getRequestURI();
		String contextPath = httpRequest.getContextPath();
		// 정적 리소스 요청은 필터 제외
		if (uri.startsWith(contextPath + "/erp/css/") || uri.startsWith(contextPath + "/erp/js/")
				|| uri.startsWith(contextPath + "/erp/images/")) {
			chain.doFilter(request, response);
			return;
		}
		// 요청과 응답에 UTF-8 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); // 필터 체인으로 요청을 다음 단계로 전달
		chain.doFilter(request, response);
	}

}
package com.erp.common.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;

import com.erp.common.rest.RestBusinessException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;

public class RestBusinessExceptionHandler implements Filter {
	private static final ObjectMapper om = new ObjectMapper();
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        try {
        	chain.doFilter(request, response);
        } catch(RestBusinessException e) 
        {
        	handleRestBusinessException(e, request, response);
        }
    }
    
    private void handleRestBusinessException 
    	(RestBusinessException e, ServletRequest request, ServletResponse response){
    	HttpServletResponse servletResponse = (HttpServletResponse)response;
    	servletResponse.setStatus(e.getStatusCode().getStatusCode());
    	try {
			servletResponse.getWriter().flush();
			servletResponse.getWriter()
				.write(om.writer().writeValueAsString(e.convertToRestResponse()));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
    	
    }

}

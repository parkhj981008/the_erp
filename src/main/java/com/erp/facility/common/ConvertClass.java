package com.erp.facility.common;

import java.io.BufferedReader;
import javax.servlet.http.HttpServletRequest;

import com.erp.common.rest.RestBusinessException;
import com.erp.common.rest.RestBusinessException.StatusCode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ConvertClass {
	
	public static <T> T JsonToDTO(HttpServletRequest request, Class<T> dtoClass) {
	    try {
	        StringBuilder jsonData = new StringBuilder();
	        String line;
	        
	        try (BufferedReader reader = request.getReader()) {
	            while ((line = reader.readLine()) != null) {
	                jsonData.append(line);
	            }
	        }
	        
	        String jsonString = jsonData.toString();
	        System.out.println("Received JSON: " + jsonString);
	        
	        ObjectMapper om = new ObjectMapper();
	        return om.readValue(jsonString, dtoClass);
	        
	    } catch (Exception e) {
	    	throw new RestBusinessException(StatusCode.BAD_REQUEST);
	    	
	    }
	}


}

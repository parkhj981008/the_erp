package com.erp.auth.endpoint;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.erp.auth.service.AuthService;
import com.erp.auth.service.impl.AuthServiceImpl;
import com.erp.auth.vo.AuthDTOs.LoginRequestDTO;
import com.erp.auth.vo.AuthDTOs.LoginResponseDTO;
import com.erp.auth.vo.AuthDTOs.RegisterRequestDTO;
import com.erp.common.rest.RestBusinessException;
import com.erp.common.util.AES256Util;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import static com.erp.common.rest.RestBusinessException.StatusCode;

/**
 * Servlet implementation class AuthServlet
 */
@WebServlet("/v1/auth/*")
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final AuthService authService = new AuthServiceImpl();
	private final ObjectMapper om = new ObjectMapper();
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!request.getContentType().equals("application/json")) throw new RestBusinessException(StatusCode.BAD_REQUEST);
		StringBuilder jsonData = new StringBuilder();
	    String line;
	    try (BufferedReader reader = request.getReader()) {
	        while ((line = reader.readLine()) != null) {
	            jsonData.append(line);
	        }
	    }
	    String jsonString = jsonData.toString();

		switch(request.getRequestURI()) {
		case "/v1/auth/register" : {
			authService.register(om.reader().readValue(jsonString, RegisterRequestDTO.class));
			response.setStatus(HttpServletResponse.SC_CREATED);
			break;
			}
		case "/v1/auth/login" : {
			LoginResponseDTO responseDto = authService.login(om.reader().readValue(jsonString, LoginRequestDTO.class));
			response.setStatus(HttpServletResponse.SC_OK);
			try {
				Cookie cookie = new Cookie("auth", AES256Util.encrypt(om.writer().writeValueAsString(responseDto)));
				cookie.setMaxAge(3600); 
		        cookie.setPath("/");
		        response.addCookie(cookie);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			}
		default : throw new RestBusinessException(StatusCode.BAD_REQUEST);
		}
		
	}

}

package com.erp.attendance.endpoint;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.erp.attendance.repository.AttendanceRepository;
import com.erp.attendance.vo.AllEmployeeDTO;
import com.erp.attendance.vo.AttendanceDTO;
import com.erp.attendance.vo.AttendanceItemsDTO;
import com.erp.attendance.vo.InsertAttendanceDTO;
import com.erp.auth.vo.AuthDTOs.RegisterRequestDTO;
import com.erp.common.rest.RestBusinessException;
import com.erp.common.rest.RestBusinessException.StatusCode;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/v1/attendance/*")
public class AttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		switch (request.getRequestURI()) {
		// 전체 근태 조회
		case "/v1/attendance/selectAll": {

			AttendanceRepository ar = new AttendanceRepository();
			List<AttendanceDTO> list = ar.selectAll();

			response.setContentType("application/json; charset=UTF-8");

			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(list);

			PrintWriter out = response.getWriter();
			out.write(jsonStr);
			break;
		}
		// 전체 직원 조회
		case "/v1/attendance/selectAllEmployee": {
			AttendanceRepository ar = new AttendanceRepository();
			List<AllEmployeeDTO> list = ar.selectUsersByDepartment();

			response.setContentType("application/json; charset=UTF-8");
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(list);

			PrintWriter out = response.getWriter();
			out.write(jsonStr);
			break;
		}
		// 전체 근태 항목 조회
		case "/v1/attendance/selectAttendanceItems": {
			AttendanceRepository ar = new AttendanceRepository();
			List<AttendanceItemsDTO> list = ar.selectAttendanceItems();

			response.setContentType("application/json; charset=UTF-8");
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(list);

			PrintWriter out = response.getWriter();
			out.write(jsonStr);
			break;
		}

		default:
			throw new RestBusinessException(StatusCode.BAD_REQUEST);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		BufferedReader reader = request.getReader();
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			sb.append(line);
		}

		String jsonData = sb.toString();
		ObjectMapper mapper = new ObjectMapper();
		InsertAttendanceDTO idto = mapper.readValue(jsonData, InsertAttendanceDTO.class);

		switch (request.getRequestURI()) {
		// 근태 입력
		case "/v1/attendance/insert": {
			Date date = null;
			try {
				date = idto.getAttendanceDate();
				System.out.println(date);
			} catch (IllegalArgumentException e) {
				// 형식이 맞지 않는 경우 오류 처리
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				response.getWriter().write("{\"error\": \"Invalid date format. Use yyyy-MM-dd.\"}");
				return;
			}

			System.out.println(idto);
			AttendanceRepository ar = new AttendanceRepository();

			int rows = ar.insertAttendance(idto);

			if (rows > 0) {
				response.setStatus(HttpServletResponse.SC_OK);
			} else {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			}

			response.setContentType("application/json; charset=UTF-8");
			Map<String, String> responseMap = new HashMap<String, String>();
			responseMap.put("status", "success");
			responseMap.put("message", "Attendance record inserted successfully.");

			String jsonStr = mapper.writeValueAsString(responseMap);
			PrintWriter out = response.getWriter();
			out.write(jsonStr);
			break;
		}
		default:
			throw new RestBusinessException(StatusCode.BAD_REQUEST);
		}

	}

}

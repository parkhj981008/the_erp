package com.erp.community.endpoint;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.erp.common.rest.RestBusinessException;
import com.erp.common.rest.RestBusinessException.StatusCode;
import com.erp.community.repository.CommunityRepository;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class ChatServlet
 */
@WebServlet("/api/v1/chat")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ObjectMapper om = new ObjectMapper();
	private final CommunityRepository communityRepository = new CommunityRepository();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.getWriter().write(om.writer().writeValueAsString(communityRepository.getAvailableUsers()));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

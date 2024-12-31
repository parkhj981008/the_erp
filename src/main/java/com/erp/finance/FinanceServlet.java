package com.erp.finance;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChatMsgServlet
 */
@WebServlet("/finance/*")
public class FinanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		FinanceDAO dao = new FinanceDAO();
		String uri = request.getRequestURI();

		List<FinanceVO> fList1 = dao.totalStatementList();

		request.setAttribute("KEY_TOTAL_FLIST", fList1);
		

		
		if (uri.equals("/finance/general_ledger")) {
			request.getRequestDispatcher("/erp/pages/finance/general_ledger.jsp").forward(request, response);
		} else if (uri.equals("/finance/income_Statement")) {
			List<FinanceVO> fList3 = dao.sumIncomeList();
			request.setAttribute("KEY_INCOME_FLIST", fList3);
			request.getRequestDispatcher("/erp/pages/finance/income_Statement.jsp").forward(request, response);
		} else if (uri.equals("/finance/sofp")) {
			List<FinanceVO> fList2 = dao.sumStatementList();
			  System.out.println("fList2 size: " + fList2.size()); // 데이터 개수 출력
			    for (FinanceVO vo : fList2) {
			        System.out.println(vo.getParent_type() + " " + vo.getAccount_name() + " " + vo.getDiff());
			    }
			
			request.setAttribute("KEY_STATE_FLIST", fList2);
			request.getRequestDispatcher(request.getContextPath() + "/erp/pages/finance/sofp.jsp").forward(request, response);}


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

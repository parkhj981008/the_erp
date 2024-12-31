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
		

		//계정관리
		if (uri.equals("/finance/accounts")) {
			List<FinanceVO> fList1 = dao.AccountsList();
			request.setAttribute("KEY_ACCOUNTS_FLIST", fList1);
			request.getRequestDispatcher("/erp/pages/finance/accounts.jsp").forward(request, response);
		//전표관리
		} else if (uri.equals("/finance/general_ledger")) {
			List<FinanceVO> fList2 = dao.SlipList();
			request.setAttribute("KEY_SLIP_FLIST", fList2);
			request.getRequestDispatcher("/erp/pages/finance/general_ledger.jsp").forward(request, response);
		//계정별원장
		} else if (uri.equals("/finance/sum_FinanceList")) {
			List<FinanceVO> fList3 = dao.sumFinanceList();
			request.setAttribute("KEY_SUM_FLIST", fList3);
			request.getRequestDispatcher("/erp/pages/finance/sum_FinanceList.jsp").forward(request, response);
		//재무상태표
		} else if (uri.equals("/finance/sofp")) {
			List<FinanceVO> fList4 = dao.SoFPList();
			request.setAttribute("KEY_STATE_FLIST", fList4);
			request.getRequestDispatcher("/erp/pages/finance/sofp.jsp").forward(request, response);
		//손익계산서
		} else if (uri.equals("/finance/income_Statement")) {
			List<FinanceVO> fList5 = dao.sumIncomeList();
			request.setAttribute("KEY_INCOME_FLIST", fList5);
			request.getRequestDispatcher("/erp/pages/finance/income_Statement.jsp").forward(request, response);
		} 


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

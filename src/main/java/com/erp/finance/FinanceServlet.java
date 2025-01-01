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
			Map<String, List<FinanceVO>> groupedData = dao.getFinanceDataGroupedByAccountId();
			request.setAttribute("groupedData", groupedData);
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

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String uri = request.getRequestURI();
	    FinanceDAO dao = new FinanceDAO();

	    if (uri.equals("/finance/add_voucher")) {

	        String voucherDate = request.getParameter("voucher_date");
	        String descript = request.getParameter("descript");
	        String debitAccountId = request.getParameter("debit_account_id");
	        Long debitAmount = Long.parseLong(request.getParameter("debit"));
	        String creditAccountId = request.getParameter("credit_account_id");
	        Long creditAmount = Long.parseLong(request.getParameter("credit"));
	        String debitAccountName = dao.getAccountNameById(debitAccountId);
	        String creditAccountName = dao.getAccountNameById(creditAccountId);


	        FinanceVO debitVO = FinanceVO.builder()
	                                     .voucher_date(voucherDate)
	                                     .descript(descript)
	                                     .account_id(debitAccountId)
	                                     .account_name(debitAccountName)
	                                     .debit(debitAmount)
	                                     .credit(0L)
	                                     .build();
	        boolean debitSuccess = dao.addVoucher(debitVO);


	        FinanceVO creditVO = FinanceVO.builder()
	                                      .voucher_date(voucherDate)
	                                      .descript(descript)
	                                      .account_id(creditAccountId)
	                                      .account_name(creditAccountName)
	                                      .debit(0L)
	                                      .credit(creditAmount)
	                                      .build();
	        boolean creditSuccess = dao.addVoucher(creditVO);

	        if (debitSuccess && creditSuccess) {
	            response.sendRedirect("/finance/general_ledger");
	        } else {
	            response.getWriter().write("Failed to add voucher");
	        }
	    } else {
	        response.getWriter().write("Unsupported POST request");
	    }
	    if (uri.equals("/finance/delete_voucher")) {
	    	
	        String voucherDate = request.getParameter("voucher_date");
	        String descript = request.getParameter("descript");
	        String accountId = request.getParameter("account_id");

	        boolean isDeleted = dao.deleteVoucher(voucherDate, descript, accountId);

	        if (isDeleted) {
	            response.sendRedirect("/finance/general_ledger"); // 삭제 후 목록으로 리다이렉트
	        } else {
	            response.getWriter().write("Failed to delete voucher");
	        }
	    } else {
	        response.getWriter().write("Unsupported POST request");
	    }
	}
}

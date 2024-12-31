package com.erp.finance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.erp.finance.common.DBManager;
import com.erp.finance.common.OracleDBManager;

public class FinanceDAO {

	private String account_id;
	private String account_name;
	private String account_type;
	private String parent_type;
	private Long diff;
	
	private String voucher_date;
	private String descript;
	private Long debit;
	private Long credit;
	
	// 계정관리
	public ArrayList<FinanceVO> AccountsList()  {
    	DBManager dbm = OracleDBManager.getInstance();  	//new OracleDBManager();
		Connection conn = dbm.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FinanceVO> fList = new ArrayList<FinanceVO>();
		try {
			String query = "SELECT ACCOUNT_ID, ACCOUNT_NAME, ACCOUNT_TYPE, PARENT_TYPE " +
						   "FROM ACCOUNTS " +
						   "ORDER BY ACCOUNT_ID ASC";
        	System.out.println(query);
        	
			pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()) {
            	FinanceVO vo = new FinanceVO();
            	vo.setAccount_id(rs.getString("ACCOUNT_ID"));
            	vo.setAccount_name(rs.getString("ACCOUNT_NAME"));
            	vo.setAccount_type(rs.getString("ACCOUNT_TYPE"));
            	vo.setParent_type(rs.getString("PARENT_TYPE"));
            	fList.add(vo);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
				dbm.close(conn, pstmt, rs);
		}
		return fList;
    }
	
	// 전표관리
	public ArrayList<FinanceVO> SlipList()  {
    	DBManager dbm = OracleDBManager.getInstance();  	//new OracleDBManager();
		Connection conn = dbm.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FinanceVO> fList = new ArrayList<FinanceVO>();
		try {
			String query = "SELECT "
		             + "VOUCHER_DATE, "
		             + "DESCRIPT, "
		             + "ACCOUNT_ID, "
		             + "ACCOUNT_NAME, "
		             + "DEBIT, "
		             + "CREDIT "
		             + "FROM "
		             + "VOUCHER";
        	System.out.println(query);
        	
        	
        	
			pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()) {
            	FinanceVO vo = new FinanceVO();
            	vo.setVoucher_date(rs.getString("VOUCHER_DATE"));
            	vo.setDescript(rs.getString("DESCRIPT"));
            	vo.setAccount_id(rs.getString("ACCOUNT_ID"));
            	vo.setAccount_name(rs.getString("ACCOUNT_NAME"));
            	vo.setDebit(rs.getLong("DEBIT"));
            	vo.setCredit(rs.getLong("CREDIT"));
            	fList.add(vo);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
				dbm.close(conn, pstmt, rs);
		}
		return fList;
    }

	// 계정별원장
	public ArrayList<FinanceVO> sumFinanceList()  {
    	DBManager dbm = OracleDBManager.getInstance();  	//new OracleDBManager();
		Connection conn = dbm.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FinanceVO> fList = new ArrayList<FinanceVO>();
		try {
			String query = "WITH DATA_WITH_DIFF AS ( " +
				    "    SELECT  " +
				    "        J.VOUCHER_DATE, " +
				    "        J.DESCRIPT, " +
				    "        J.ACCOUNT_ID, " +
				    "        A.ACCOUNT_NAME, " +
				    "        NVL(J.DEBIT, 0) AS DEBIT, " + // NULL일 경우 0으로 설정
				    "        NVL(J.CREDIT, 0) AS CREDIT, " + // NULL일 경우 0으로 설정
				    "        NULL AS DIFF " + 
				    "    FROM  " +
				    "        VOUCHER J " +
				    "    JOIN  " +
				    "        ACCOUNTS A ON J.ACCOUNT_ID = A.ACCOUNT_ID " +
				    "    WHERE  " +
				    "        J.ACCOUNT_ID != 9666 " + 
				    "), " +
				    "SUMMARY AS ( " +
				    "    SELECT  " +
				    "        V.ACCOUNT_ID,  " +
				    "        '합계' AS DESCRIPT, " + 
				    "        CASE  " +
				    "            WHEN A.PARENT_TYPE IN ('자산', '매출원가', '판매비및일반관리비', '영업외비용', '그외비용', '법인세비용')  " +
				    "                THEN NVL(SUM(V.DEBIT), 0) - NVL(SUM(V.CREDIT), 0) " + 
				    "            WHEN A.PARENT_TYPE IN ('부채', '자본', '매출', '영업외수익')  " +
				    "                THEN NVL(SUM(V.CREDIT), 0) - NVL(SUM(V.DEBIT), 0) " + 
				    "            ELSE 0 " + 
				    "        END AS DIFF  " +
				    "    FROM  " +
				    "        VOUCHER V " +
				    "    JOIN  " +
				    "        ACCOUNTS A ON V.ACCOUNT_ID = A.ACCOUNT_ID " +
				    "    WHERE  " +
				    "        V.ACCOUNT_ID != 9666 " + 
				    "    GROUP BY  " +
				    "        V.ACCOUNT_ID, A.PARENT_TYPE " +
				    "), " +
				    "COMBINED AS ( " +
				    "    SELECT  " +
				    "        VOUCHER_DATE, " +
				    "        DESCRIPT, " +
				    "        ACCOUNT_ID, " +
				    "        ACCOUNT_NAME, " +
				    "        DEBIT, " +
				    "        CREDIT, " +
				    "        DIFF, " +
				    "        ROW_NUMBER() OVER (PARTITION BY ACCOUNT_ID ORDER BY VOUCHER_DATE NULLS FIRST) AS RN " +
				    "    FROM DATA_WITH_DIFF " +
				    "    UNION ALL " +
				    "    SELECT  " +
				    "        NULL AS VOUCHER_DATE, " +
				    "        '합계' AS DESCRIPT, " +
				    "        ACCOUNT_ID, " +
				    "        NULL AS ACCOUNT_NAME, " +
				    "        NULL AS DEBIT, " +
				    "        NULL AS CREDIT, " +
				    "        NVL(DIFF, 0) AS DIFF, " + // NULL일 경우 0으로 설정
				    "        9999 AS RN " + 
				    "    FROM SUMMARY " +
				    ") " +
				    "SELECT  " +
				    "    NVL(VOUCHER_DATE, TO_DATE('1970-01-01', 'YYYY-MM-DD')) AS VOUCHER_DATE, " + // NULL일 경우 기본값
				    "    NVL(DESCRIPT, '미정') AS DESCRIPT, " + // NULL일 경우 기본값
				    "    NVL(ACCOUNT_ID, 0) AS ACCOUNT_ID, " + // NULL일 경우 0으로 설정
				    "    NVL(ACCOUNT_NAME, 'N/A') AS ACCOUNT_NAME, " + // NULL일 경우 기본값
				    "    NVL(DEBIT, 0) AS DEBIT, " + // NULL일 경우 0으로 설정
				    "    NVL(CREDIT, 0) AS CREDIT, " + // NULL일 경우 0으로 설정
				    "    NVL(DIFF, 0) AS DIFF " + // NULL일 경우 0으로 설정
				    "FROM COMBINED " +
				    "ORDER BY  " +
				    "    ACCOUNT_ID, RN";
        	System.out.println(query);
        	
        	
        	
			pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()) {
            	FinanceVO vo = new FinanceVO();
            	vo.setVoucher_date(rs.getString("VOUCHER_DATE"));
            	vo.setDescript(rs.getString("DESCRIPT"));
            	vo.setAccount_id(rs.getString("ACCOUNT_ID"));
            	vo.setAccount_name(rs.getString("ACCOUNT_NAME"));
            	vo.setDebit(rs.getLong("DEBIT"));
            	vo.setCredit(rs.getLong("CREDIT"));
            	vo.setDiff(rs.getLong("DIFF"));
            	fList.add(vo);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
				dbm.close(conn, pstmt, rs);
		}
		return fList;
    }
	public Map<String, List<FinanceVO>> getFinanceDataGroupedByAccountId() {
	    ArrayList<FinanceVO> fList = sumFinanceList();
	    Map<String, List<FinanceVO>> groupedData = new LinkedHashMap<>();

	    for (FinanceVO vo : fList) {
	        groupedData.computeIfAbsent(vo.getAccount_id(), k -> new ArrayList<>()).add(vo);
	    }

	    return groupedData;
	}
	

	
	// 재무상태표
	public ArrayList<FinanceVO> SoFPList()  {
    	DBManager dbm = OracleDBManager.getInstance();  	//new OracleDBManager();
		Connection conn = dbm.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FinanceVO> fList = new ArrayList<FinanceVO>();
		try {
			String query =   "SELECT a.parent_type, a.account_type, a.account_name, " +
                    "ABS(SUM(NVL(v.debit,0)) - SUM(NVL(v.credit,0))) AS DIFF " +
                    "FROM voucher v " +
                    "JOIN accounts a ON a.account_id = v.account_id " +
                    "WHERE a.parent_type IN ('자산', '부채', '자본') " +
                    "GROUP BY a.account_name, a.account_type, a.parent_type, a.account_id " +
                    "ORDER BY a.account_id";
        	System.out.println(query);
        	
			pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()) {
            	FinanceVO vo = new FinanceVO();
            	vo.setParent_type(rs.getString("PARENT_TYPE"));
            	vo.setAccount_type(rs.getString("ACCOUNT_TYPE"));
            	vo.setAccount_name(rs.getString("ACCOUNT_NAME"));
            	vo.setDiff(rs.getLong("DIFF"));
            	fList.add(vo);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
				dbm.close(conn, pstmt, rs);
		}
		return fList;
    }
	
	// 손익계산서
	public ArrayList<FinanceVO> sumIncomeList()  {
    	DBManager dbm = OracleDBManager.getInstance();  	//new OracleDBManager();
		Connection conn = dbm.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<FinanceVO> fList = new ArrayList<FinanceVO>();
		try {
			String query = "WITH AggregatedData (PARENT_TYPE, ACCOUNT_NAME, DEBIT, CREDIT) AS ( " +
				    "    SELECT a.PARENT_TYPE, " +
				    "           v.ACCOUNT_NAME, " +
				    "           SUM(v.DEBIT) AS DEBIT, " +
				    "           SUM(v.CREDIT) AS CREDIT " +
				    "    FROM voucher v " +
				    "    JOIN ACCOUNTS a " +
				    "      ON v.ACCOUNT_ID = a.ACCOUNT_ID " +
				    "    WHERE a.PARENT_TYPE IN ('매출', '매출원가', '판매비및일반관리비', '영업외수익', '영업외비용', '법인세비용') " +
				    "    GROUP BY a.PARENT_TYPE, v.ACCOUNT_NAME " +
				    "), " +
				    "ComputedTotals1 AS ( " +
				    "    SELECT '매출총이익' AS PARENT_TYPE, " +
				    "           '' AS ACCOUNT_NAME, " +
				    "           NULL AS DEBIT, " +
				    "           (SELECT SUM(CREDIT) FROM AggregatedData WHERE PARENT_TYPE = '매출') " +
				    "           - (SELECT SUM(DEBIT) FROM AggregatedData WHERE PARENT_TYPE = '매출원가') AS CREDIT " +
				    "    FROM DUAL " +
				    "), " +
				    "ComputedTotals2 AS ( " +
				    "    SELECT '영업이익' AS PARENT_TYPE, " +
				    "           '' AS ACCOUNT_NAME, " +
				    "           NULL AS DEBIT, " +
				    "           (SELECT CREDIT FROM ComputedTotals1) " +
				    "           - (SELECT SUM(DEBIT) FROM AggregatedData WHERE PARENT_TYPE = '판매비및일반관리비') AS CREDIT " +
				    "    FROM DUAL " +
				    "), " +
				    "ComputedTotals3 AS ( " +
				    "    SELECT '법인세차감전순이익' AS PARENT_TYPE, " +
				    "           '' AS ACCOUNT_NAME, " +
				    "           NULL AS DEBIT, " +
				    "           (SELECT CREDIT FROM ComputedTotals2) " +
				    "           + (SELECT SUM(CREDIT) FROM AggregatedData WHERE PARENT_TYPE = '영업외수익') " +
				    "           - (SELECT SUM(DEBIT) FROM AggregatedData WHERE PARENT_TYPE = '영업외비용') AS CREDIT " +
				    "    FROM DUAL " +
				    "), " +
				    "ComputedTotals4 AS ( " +
				    "    SELECT '당기순이익' AS PARENT_TYPE, " +
				    "           '' AS ACCOUNT_NAME, " +
				    "           NULL AS DEBIT, " +
				    "           (SELECT CREDIT FROM ComputedTotals3) " +
				    "           - (SELECT SUM(DEBIT) FROM AggregatedData WHERE PARENT_TYPE = '법인세비용') AS CREDIT " +
				    "    FROM DUAL " +
				    "), " +
				    "FinalOutput AS ( " +
				    "    SELECT * FROM AggregatedData " +
				    "    UNION ALL " +
				    "    SELECT * FROM ComputedTotals1 " +
				    "    UNION ALL " +
				    "    SELECT * FROM ComputedTotals2 " +
				    "    UNION ALL " +
				    "    SELECT * FROM ComputedTotals3 " +
				    "    UNION ALL " +
				    "    SELECT * FROM ComputedTotals4 " +
				    ") " +
				    "SELECT PARENT_TYPE, ACCOUNT_NAME, DEBIT, CREDIT " +
				    "FROM FinalOutput " +
				    "ORDER BY  " +
				    "   CASE  " +
				    "       WHEN PARENT_TYPE = '매출' THEN 1 " +
				    "       WHEN PARENT_TYPE = '매출원가' THEN 2 " +
				    "       WHEN PARENT_TYPE = '매출총이익' THEN 3 " +
				    "       WHEN PARENT_TYPE = '판매비및일반관리비' THEN 4 " +
				    "       WHEN PARENT_TYPE = '영업이익' THEN 5 " +
				    "       WHEN PARENT_TYPE = '영업외수익' THEN 6 " +
				    "       WHEN PARENT_TYPE = '영업외비용' THEN 7 " +
				    "       WHEN PARENT_TYPE = '법인세차감전순이익' THEN 8 " +
				    "       WHEN PARENT_TYPE = '법인세비용' THEN 9 " +
				    "       WHEN PARENT_TYPE = '당기순이익' THEN 10 " +
				    "       ELSE 11 " +
				    "   END, " +
				    "   ACCOUNT_NAME";
        	System.out.println(query);
        	
        	pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()) {
            	FinanceVO vo = new FinanceVO();
            	vo.setParent_type(rs.getString("PARENT_TYPE"));
            	vo.setAccount_name(rs.getString("ACCOUNT_NAME"));
            	vo.setDebit(rs.getLong("DEBIT"));
            	vo.setCredit(rs.getLong("CREDIT"));
            	fList.add(vo);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
				dbm.close(conn, pstmt, rs);
		}
		return fList;
    }
	

}

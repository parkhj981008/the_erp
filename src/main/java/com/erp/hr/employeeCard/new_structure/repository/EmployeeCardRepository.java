//package com.erp.hr.employeeCard.repository;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.SQLIntegrityConstraintViolationException;
//
//import com.erp.auth.vo.AuthDTOs.RegisterRequestDTO;
//import com.erp.common.database.DBManager;
//import com.erp.common.database.StatementProvider;
//import com.erp.common.database.impl.OracleDBManager;
//import com.erp.common.database.impl.StatementProviderDefaultImpl;
//import com.erp.common.rest.RestBusinessException;
//import com.erp.common.rest.RestBusinessException.StatusCode;
//import com.erp.hr.employeeCard.vo.HR_DTOs.EmployeeCardDTO;
//import com.sb.board.MyboardVO;
//
//public class EmployeeCardRepository {
//	
//	private static final DBManager db = new OracleDBManager();
//	private static final StatementProvider sp = new StatementProviderDefaultImpl();
//	
//
//	public int save(EmployeeCardDTO edto) {
//		int rows = 0;
//		try(
//			Connection con = db.getConnectionForTransaction();
//			PreparedStatement ps = sp.getPreparedStatement(con, EmployeeCardDTO.selectAllSql(), EmployeeCardDTO.getAttributeAsObjectArray());
//		){
//			rows = ps.executeUpdate(); 
//			
//			if(rows == 1) con.commit();
//			else {
//				con.rollback();
//				throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
//			}
//		} catch (SQLException e) {
//			if(e instanceof SQLIntegrityConstraintViolationException) 
//				throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
//			e.printStackTrace();
//		}
//		return rows;
//	}
//}

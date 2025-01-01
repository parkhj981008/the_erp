package com.erp.facility.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import com.erp.common.database.DBManager;
import com.erp.common.database.StatementProvider;
import com.erp.common.database.impl.OracleDBManager;
import com.erp.common.database.impl.StatementProviderDefaultImpl;
import com.erp.common.rest.RestBusinessException;
import com.erp.common.rest.RestBusinessException.StatusCode;
import com.erp.facility.VO.ManagerDTO;

public class ManagerRepository {
	
	private static final DBManager db = new OracleDBManager();
	private static final StatementProvider sp = new StatementProviderDefaultImpl();
	
	public List<ManagerDTO> findAll() {
	    List<ManagerDTO> managerList = new ArrayList<>();

	    try (
	        Connection con = db.getConnectionForTransaction();
	        PreparedStatement ps = sp.getPreparedStatement(con, ManagerDTO.findAllManager());
	        ResultSet rs = ps.executeQuery()) {
	        while (rs.next()) {
	            managerList.add(ManagerDTO.fromResultSet(rs));
	        }
	        return managerList;

	    } catch (SQLException e) {
	        if (e instanceof SQLIntegrityConstraintViolationException)
	            throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
	        e.printStackTrace();
	        throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
	    }
	}


	public ManagerDTO findDetailsManager(int seq) {
	    try (Connection con = db.getConnectionForTransaction();
	            PreparedStatement ps = sp.getPreparedStatement(con, ManagerDTO.findDetailsManager(), seq);
	            ResultSet rs = ps.executeQuery();) {
	        if (rs.next()) {
	            return ManagerDTO.fromResultSet(rs);
	            
	        } else {
	            return null;
	        }

	    } catch (SQLException e) {
	        if (e instanceof SQLIntegrityConstraintViolationException)
	            throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
	        e.printStackTrace();
	        throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
	    }
	}

	public int save(ManagerDTO managerDTO) {
	    try (
	        Connection con = db.getConnectionForTransaction();
	        PreparedStatement ps = sp.getPreparedStatement(con, ManagerDTO.saveManager(),
	            managerDTO.getAttributeAsObjectArray());) {
	        int rows = ps.executeUpdate();
	        if (rows == 1) {
	            con.commit();
	        } else {
	            con.rollback();
	            throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
	        }
	        return rows;

	    } catch (SQLException e) {
	        if (e instanceof SQLIntegrityConstraintViolationException)
	            throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
	        e.printStackTrace();
	    }
	    return 0;
	}

	

}

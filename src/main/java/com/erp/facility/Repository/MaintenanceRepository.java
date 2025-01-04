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
import com.erp.facility.VO.FacilityDTO;
import com.erp.facility.VO.MaintenanceDTO;

public class MaintenanceRepository {
	
	private static final DBManager db = new OracleDBManager();
	private static final StatementProvider sp = new StatementProviderDefaultImpl();
	
	
	
	
	
	
	public int save(MaintenanceDTO maintenance) {
		try(
			Connection con = db.getConnectionForTransaction();
			PreparedStatement ps 
					= sp.getPreparedStatement(con, MaintenanceDTO.getInsertMaintenanceQuery()  , maintenance.getAttributeAsObjectArray());				
		){
			int rows = ps.executeUpdate(); 
			if(rows == 1) {
				con.commit();
			} else {
				con.rollback();
				throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
			}
			return rows;
			
		} catch (SQLException e) {
			if(e instanceof SQLIntegrityConstraintViolationException) 
				throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
			e.printStackTrace();
			
		}
		return 0;
	}
	
	
	
	public MaintenanceDTO findOneMax(String facilityId) {
	    
	    try (
	        Connection con = db.getConnectionForTransaction();
	        PreparedStatement ps = sp.getPreparedStatement(con, MaintenanceDTO.findAllMaintenance(),facilityId);
	        ResultSet rs = ps.executeQuery()
	    ) {
	    	
	    	if (rs.next()) { // 데이터가 있는지 먼저 확인
				  return MaintenanceDTO.fromResultSet(rs);
			}	    		    	
	        return null;
	        
	    } catch (SQLException e) {
	        if(e instanceof SQLIntegrityConstraintViolationException) 
	            throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
	        e.printStackTrace();
	        throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
	    }
	}
	
	
	
	
	
	public List<MaintenanceDTO> findMaintenance(String facilityId) {
	    List<MaintenanceDTO> maintenanceList = new ArrayList<>();
	    
	    try (
	        Connection con = db.getConnectionForTransaction();
	        PreparedStatement ps = sp.getPreparedStatement(con, MaintenanceDTO.findAllMaintenance(),facilityId);
	        ResultSet rs = ps.executeQuery()
	    ) {
	    	while (rs.next()) {	    		
	    	    maintenanceList.add(MaintenanceDTO.fromResultSet(rs));
	    	}
	        return maintenanceList;
	        
	    } catch (SQLException e) {
	        if(e instanceof SQLIntegrityConstraintViolationException) 
	            throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
	        e.printStackTrace();
	        throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
	    }
	}

}

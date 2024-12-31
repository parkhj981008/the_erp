package com.erp.facility.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.erp.common.database.DBManager;
import com.erp.common.database.StatementProvider;
import com.erp.common.database.impl.OracleDBManager;
import com.erp.common.database.impl.StatementProviderDefaultImpl;
import com.erp.common.rest.RestBusinessException;
import com.erp.common.rest.RestBusinessException.StatusCode;
import com.erp.facility.VO.FacilityDTO;
import com.erp.facility.VO.InspectionDTO;

public class InspectionRepository {

	private static final DBManager db = new OracleDBManager();
	private static final StatementProvider sp = new StatementProviderDefaultImpl();
		
	public int update(InspectionDTO inspectionDTO) {
	    StringBuilder sql = new StringBuilder("UPDATE inspection SET ");
	    List<Object> parameters = new ArrayList<>();
	    
	    sql.append("facility_id = ?, ")
	       .append("inspection_date = ?, ")
	       .append("inspection_state = ?, ")
	       .append("inspection_result = ?, ")
	       .append("work_manager = ? ")
	       .append("WHERE inspection_id = ?");
	    
	    parameters.add(inspectionDTO.getFacilityId());
	    parameters.add(inspectionDTO.getInspectionDate());
	    parameters.add(inspectionDTO.getInspectionState());
	    parameters.add(inspectionDTO.getInspectionResult());
	    parameters.add(inspectionDTO.getWorkManager());
	    parameters.add(inspectionDTO.getInspectionId());
	    
	    try (
	        Connection con = db.getConnectionForTransaction();
	        PreparedStatement ps = sp.getPreparedStatement(con, sql.toString(), 
	                parameters.toArray())
	    ) {
	        int rows = ps.executeUpdate();
	        if (rows == 1) {
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


	
	
	
	public int save(InspectionDTO inspectionDTO) {
		try(
				Connection con = db.getConnectionForTransaction();
				PreparedStatement ps =
						sp.getPreparedStatement(con, InspectionDTO.saveInspection()  , inspectionDTO.getAttributeAsObjectArray());				
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
	
	
	
	public List<InspectionDTO> findAll() {
	    List<InspectionDTO> inspectionList = new ArrayList<>();
	    
	    try (
	        Connection con = db.getConnectionForTransaction();
	        PreparedStatement ps = sp.getPreparedStatement(con, InspectionDTO.findAllInspection());
	        ResultSet rs = ps.executeQuery()
	    ) {
	    	while (rs.next()) {
	    		InspectionDTO inspection = new InspectionDTO(	    				
	    	        rs.getLong("inspection_id"),      
	    	        rs.getLong("facility_id"),           
	    	        rs.getDate("inspection_date"),               
	    	        rs.getString("inspection_state"),
	    	        rs.getString("inspection_result"),
	    	        rs.getString("work_manager")	    	        
	    	    );
	    		  			    		
	    		inspectionList.add(inspection);
	    	}

	        return inspectionList;
	        
	    } catch (SQLException e) {
	        if(e instanceof SQLIntegrityConstraintViolationException) 
	            throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
	        e.printStackTrace();
	        throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
	    }
	}
}

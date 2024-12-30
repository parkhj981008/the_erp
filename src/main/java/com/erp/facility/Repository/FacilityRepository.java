package com.erp.facility.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.*;

import com.erp.common.database.DBManager;
import com.erp.common.database.StatementProvider;
import com.erp.common.database.impl.OracleDBManager;
import com.erp.common.database.impl.StatementProviderDefaultImpl;
import com.erp.common.rest.RestBusinessException;
import com.erp.common.rest.RestBusinessException.StatusCode;
import com.erp.facility.VO.FacilityDTO;


public class FacilityRepository {

	private static final DBManager db = new OracleDBManager();
	private static final StatementProvider sp = new StatementProviderDefaultImpl();
	
	

	
	// =================
	
	public List<FacilityDTO> findAll() {
	    List<FacilityDTO> facilityList = new ArrayList<>();
	    
	    try (
	        Connection con = db.getConnectionForTransaction();
	        PreparedStatement ps = sp.getPreparedStatement(con, FacilityDTO.findAllFacility());
	        ResultSet rs = ps.executeQuery()
	    ) {
	    	while (rs.next()) {
	    	    FacilityDTO facility = new FacilityDTO(
	    	        rs.getLong("facility_id"),      
	    	        rs.getString("name"),           
	    	        rs.getString("location"),       
	    	        rs.getInt("capacity"),          
	    	        rs.getString("operating_status"),  
	    	        rs.getString("facility_type"),  
	    	        rs.getDate("completion_date")   
//	    	        rs.getTimestamp("completion_date").toLocalDateTime()
 
	    	    );
	    	    facilityList.add(facility);
	    	}

	        return facilityList;
	        
	    } catch (SQLException e) {
	        if(e instanceof SQLIntegrityConstraintViolationException) 
	            throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
	        e.printStackTrace();
	        throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
	    }
	}

	
	public int save(FacilityDTO facilityDTO) {
		try(
				Connection con = db.getConnectionForTransaction();
				PreparedStatement ps 
					= sp.getPreparedStatement(con, FacilityDTO.saveFacility()  , facilityDTO.getAttributeAsObjectArray());				
		){
			
			StringBuilder query = new StringBuilder(FacilityDTO.saveFacility());
			Object[] params = facilityDTO.getAttributeAsObjectArray();
			System.out.println("Original SQL: " + query);
			System.out.println("Parameters: " + Arrays.toString(params));

			
			
			System.out.println("query = " + ps.toString());
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
	
}

package com.erp.facility.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
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
	
	
	public int updateFacility(FacilityDTO facilityDTO) {
	    try (Connection con = db.getConnectionForTransaction();
	         PreparedStatement ps = sp.getPreparedStatement(con, FacilityDTO.updateFacility(), facilityDTO.getAttributeAsObjectArraUpdate())) {
	        
	        int rows = ps.executeUpdate();
	        if (rows == 1) {
	            con.commit();
	            return rows;
	        } else {
	            con.rollback();
	            throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
	        }

	    } catch (SQLException e) {
	        if (e instanceof SQLIntegrityConstraintViolationException)
	            throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
	        e.printStackTrace();
	        throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
	    }
	}

	
		
	//시설타입 불러오기 
	public List<String> findFacilityType() {
		
		List<String> fTypeList = new ArrayList<>();		
		String sql = "select * from facility_type";		
		try (
				Connection con = db.getConnectionForTransaction();
				PreparedStatement ps = sp.getPreparedStatement(con, sql);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				fTypeList.add(rs.getString("type_name"));
			}
			return fTypeList;
			
		} catch (SQLException e) {
			if (e instanceof SQLIntegrityConstraintViolationException)
				throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
			e.printStackTrace();
			throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
		}
			
	}
	
	
	
	public FacilityDTO findDetailsFacility(int seq) {
		try (Connection con = db.getConnectionForTransaction();
				PreparedStatement ps = sp.getPreparedStatement(con, FacilityDTO.getFindDetailsFacilityQuery(), seq);
				ResultSet rs = ps.executeQuery();){
			if (rs.next()) { // 데이터가 있는지 먼저 확인
				  return FacilityDTO.fromResultSet(rs);
			}
			
		} catch (SQLException e) {
			if (e instanceof SQLIntegrityConstraintViolationException)
				throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
			e.printStackTrace();
			throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
		}
		throw new RestBusinessException(StatusCode.DATABASE_UKNOWN_ERROR);
	}
	
	
	

	// 건물 유형 종류 
	public List<FacilityDTO> findAllFacilityType(String type) {
		List<FacilityDTO> facilityList = new ArrayList<>();

		try (Connection con = db.getConnectionForTransaction();
				PreparedStatement ps = sp.getPreparedStatement(con, FacilityDTO.findAllFacilityType(),type) ;) {
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				 facilityList.add(FacilityDTO.fromResultSet(rs));
			}

			return facilityList;

		} catch (SQLException e) {
			if (e instanceof SQLIntegrityConstraintViolationException)
				throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
			e.printStackTrace();
			throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
		}
	}
	
	
	// 선택된 상태의 상태 불러오기 
		public List<FacilityDTO> findAllFacilityOperatingStatus(String status) {
			List<FacilityDTO> facilityList = new ArrayList<>();

			try (
					Connection con = db.getConnectionForTransaction();
					PreparedStatement ps = sp.getPreparedStatement(con, FacilityDTO.findAllFacilityOperatingStatus(),status);
					ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					 facilityList.add(FacilityDTO.fromResultSet(rs));
				}

				return facilityList;

			} catch (SQLException e) {
				if (e instanceof SQLIntegrityConstraintViolationException)
					throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
				e.printStackTrace();
				throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
			}
		}
	
	
	public List<FacilityDTO> findAll() {
		List<FacilityDTO> facilityList = new ArrayList<>();

		try (
				Connection con = db.getConnectionForTransaction();
				PreparedStatement ps = sp.getPreparedStatement(con, FacilityDTO.findAllFacility());
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				 facilityList.add(FacilityDTO.fromResultSet(rs));
			}

			return facilityList;

		} catch (SQLException e) {
			if (e instanceof SQLIntegrityConstraintViolationException)
				throw new RestBusinessException(StatusCode.CONSTRAINT_VIOLATION);
			e.printStackTrace();
			throw new RestBusinessException(StatusCode.UNEXPECTED_ERROR);
		}
	}
	
	

	public int save(FacilityDTO facilityDTO) {
		try (
				Connection con = db.getConnectionForTransaction();
				PreparedStatement ps = sp.getPreparedStatement(con, FacilityDTO.saveFacility(),
						facilityDTO.getAttributeAsObjectArray());) {
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

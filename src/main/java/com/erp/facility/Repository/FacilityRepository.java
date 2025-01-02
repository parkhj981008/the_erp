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
		
	//시설타입 불러오기 
	public List<String> findFacilityType() {
		List<String> fTypeList = new ArrayList<>();
		
		String sql = "select * from facility_type";
		try (
				
				Connection con = db.getConnectionForTransaction();
				PreparedStatement ps = sp.getPreparedStatement(con, sql);
				ResultSet rs = ps.executeQuery();
				) 
		
			{ while (rs.next()) {
				String str = rs.getString("type_name");
				System.out.println("str = " + str);
				
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
	
	
	


	public List<FacilityDTO> findAllFacilityType(String status) {
		List<FacilityDTO> facilityList = new ArrayList<>();

		try (Connection con = db.getConnectionForTransaction();
				PreparedStatement ps = sp.getPreparedStatement(con, FacilityDTO.findAllFacilityType(),status) ;) {
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
	
	

	// 운영 중단인 시설불러오기
	public List<FacilityDTO> findAllFacilityNon_Operating() {
		List<FacilityDTO> facilityList = new ArrayList<>();

		try (
				Connection con = db.getConnectionForTransaction();
				PreparedStatement ps = sp.getPreparedStatement(con, FacilityDTO.findAllFacilityNon_Operating());
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
	
	

	// 운영중인 시설 불러오기
	public List<FacilityDTO> findAllFacilityOperating() {
		List<FacilityDTO> facilityList = new ArrayList<>();

		try (
				Connection con = db.getConnectionForTransaction();
				PreparedStatement ps = sp.getPreparedStatement(con, FacilityDTO.findAllFacilityOperating());
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

package com.erp.attendance.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.erp.attendance.vo.AllEmployeeDTO;
import com.erp.attendance.vo.AttendanceDTO;
import com.erp.attendance.vo.AttendanceItemsDTO;
import com.erp.attendance.vo.InsertAttendanceDTO;
import com.erp.common.attendance.DBManager;
import com.erp.common.attendance.OracleDBManager;

public class AttendanceRepository {
	// 전체 근태 조회
	public List<AttendanceDTO> selectAll() {
		List<AttendanceDTO> list = new ArrayList<AttendanceDTO>();

		DBManager dbm = OracleDBManager.getInstance();
		Connection conn = dbm.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT at.attendance_seq, au.user_name, at.attendance_code, at.days_number, NVL(at.notes, ' ') AS notes \r\n"
					+ "FROM attendance at\r\n" + "JOIN app_users au\r\n" + "ON at.user_seq = au.user_seq\r\n"
					+ "ORDER BY at.attendance_seq ASC";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				AttendanceDTO adto = new AttendanceDTO();
				adto.setAttendanceSeq(rs.getLong("attendance_seq"));
				adto.setAttendanceCode(rs.getString("attendance_code"));
				adto.setDaysNumber(rs.getInt("days_number"));
//				adto.setVacationName(rs.getString("vacation_name"));
				adto.setNotes(rs.getString("notes"));
				adto.setUserName(rs.getString("user_name"));
				list.add(adto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbm.close(conn, pstmt, rs);
		}

		return list;
	}

	// 근태 입력
	public int insertAttendance(InsertAttendanceDTO idto) {
		DBManager dbm = OracleDBManager.getInstance();
		Connection conn = dbm.connect();
		PreparedStatement pstmt = null;
		int rows = 0;
		
		try {
			// ATTENDANCE_SEQ, ATTENDANCE_CODE, ATTENDANCE_DATE, DAYS_NUMBER, VACATION_NAME,
			// NOTES, USER_SEQ
			String sql = "INSERT INTO attendance VALUES (attendance_seq.nextval, ?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idto.getAttendanceCode());
			pstmt.setDate(2, idto.getAttendanceDate());
			pstmt.setInt(3, idto.getDaysNumber());
			// pstmt.setString(4, idto.getVacationName());
			pstmt.setString(4, idto.getNotes());
			pstmt.setInt(5, idto.getUserSeq());

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbm.close(conn, pstmt);
		}

		return rows;
	}

	// 부서별 사원 조회
	public List<AllEmployeeDTO> selectUsersByDepartment() {
		List<AllEmployeeDTO> list = new ArrayList<AllEmployeeDTO>();

		DBManager dbm = OracleDBManager.getInstance();
		Connection conn = dbm.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// ATTENDANCE_SEQ, ATTENDANCE_CODE, ATTENDANCE_DATE, DAYS_NUMBER, VACATION_NAME,
			// NOTES, USER_SEQ
			String sql = "SELECT a.user_seq, a.user_name, d.name\r\n" + "FROM app_users a\r\n" + "JOIN department d\r\n"
					+ "ON a.department_id = d.department_id";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				AllEmployeeDTO adto = new AllEmployeeDTO();
				adto.setUserSeq(rs.getLong("user_seq"));
				adto.setUserName(rs.getString("user_name"));
				adto.setName(rs.getString("name"));
				list.add(adto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbm.close(conn, pstmt, rs);
		}

		return list;

	}

	// 근태 항목 조회
	public List<AttendanceItemsDTO> selectAttendanceItems() {
		List<AttendanceItemsDTO> list = new ArrayList<AttendanceItemsDTO>();

		DBManager dbm = OracleDBManager.getInstance();
		Connection conn = dbm.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT \r\n"
					+ "    ROWNUM AS row_number, \r\n"
					+ "    attendance_code, \r\n"
					+ "    attendance_name\r\n"
					+ "FROM (\r\n"
					+ "    SELECT * \r\n"
					+ "    FROM attendance_items \r\n"
					+ "    ORDER BY attendance_items_seq\r\n"
					+ ")";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				AttendanceItemsDTO adto = new AttendanceItemsDTO();
				adto.setRownum(rs.getInt("row_number"));
				adto.setAttendanceCode(rs.getString("attendance_code"));
				adto.setAttendanceName(rs.getString("attendance_name"));
				list.add(adto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbm.close(conn, pstmt, rs);
		}

		return list;
	}

	public static void main(String[] args) {
		AttendanceRepository ar = new AttendanceRepository();
		System.out.println(ar.selectAttendanceItems());
	}
}

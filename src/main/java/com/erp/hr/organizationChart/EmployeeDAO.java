package com.erp.hr.organizationChart;


import java.sql.*;
import java.util.*;

import com.erp.hr.organizationChart.EmployeeCard.Employee;

public class EmployeeDAO {
	
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe"; // 오라클 DB URL
    private static final String DB_USER = "it"; // DB 사용자 이름
    private static final String DB_PASSWORD = "0000"; // DB 비밀번호

    // DB 연결 메서드
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("DB 드라이버 로드 실패");
        }
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    // 조직도 데이터 가져오기
    public Map<String, List<Employee>> getEmployeesByDepartment() {
        Map<String, List<Employee>> departmentMap = new LinkedHashMap<>();
        String sql = "SELECT department, name, position, phone, email FROM app_users ORDER BY department, position";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String department = rs.getString("department");
                String name = rs.getString("name");
                String position = rs.getString("position");
                String phone = rs.getString("phone");
                String email = rs.getString("email");

                // 부서별로 직원 리스트를 추가
                if (!departmentMap.containsKey(department)) {
                    departmentMap.put(department, new ArrayList<>());
                }
                departmentMap.get(department).add(new Employee());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return departmentMap;
    }
}

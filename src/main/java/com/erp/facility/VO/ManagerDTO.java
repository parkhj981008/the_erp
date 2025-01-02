package com.erp.facility.VO;

import java.sql.ResultSet;
import java.sql.SQLException;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ManagerDTO {
    
    private long managerId;
    private long facilityId;
    private long userSeq;
    private String name;
    private long phoneNumber;
    private long department;
    private String position;
    
    
    
    public static String getUser() {
    	return "select user_seq, phone_number, department_id, position"
    			+ "from app_users"
    			+ "where user_seq = ?";
    }
    
    
    public static String findByUserSeq() {
    	return "SELECT  a.USER_SEQ FROM app_users a "
    			+ "WHERE a.user_seq = ? and a.user_status = 1"
    			+ "AND NOT EXISTS ("
    			+ "    SELECT 1 FROM facility_manager m "
    			+ "    WHERE m.user_seq = ? "
    			+ ")";
    }
    
    
    public static String updateManager() {
        return "UPDATE facility_manager SET " +
               "facility_id = ? " +
               "WHERE user_seq = ?";
    }
    
    
    public static String findFacilityIsNull() {
        return "SELECT * FROM facility_manager WHERE facility_id IS NULL";
    }
    
    public static String findAllManager() {
        return "select * from facility_manager";
    }
    
    public static String saveManager() {
        return "INSERT INTO facility_manager(manager_id, facility_id, user_seq, name, phone_number, department, position) " +
               "VALUES (manager_seq.NEXTVAL, NULL , ?, ?, ?, ?, ?)";
    }
    
    public static String findDetailsManager() {
        return "select * from facility_manager where facility_id = ?";
    }
    
    
    public static ManagerDTO fromResultSet(ResultSet rs) throws SQLException {
        return new ManagerDTO(
            rs.getLong("manager_id"),
            rs.getLong("facility_id"),
            rs.getLong("user_seq"),
            rs.getString("name"),
            rs.getLong("phone_number"),
            rs.getLong("department"),
            rs.getString("position")
        );
    }

    
    
    public Object[] getAttributeAsObjectArray() {
        return new Object[] {
            this.userSeq,
            this.name,
            this.phoneNumber,
            this.department,
            this.position
        };
    }

}


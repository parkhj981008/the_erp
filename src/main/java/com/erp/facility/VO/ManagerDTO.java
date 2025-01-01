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
    private String department;
    private String position;
    
    public static String findAllManager() {
        return "select * from facility_manager";
    }
    
    public static String saveManager() {
        return "INSERT INTO facility_manager(manager_id, facility_id, user_seq, name, phone_number, department, position) " +
               "VALUES (manager_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";
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
            rs.getString("department"),
            rs.getString("position")
        );
    }

    
    
    public Object[] getAttributeAsObjectArray() {
        return new Object[] {
            this.facilityId,
            this.userSeq,
            this.name,
            this.phoneNumber,
            this.department,
            this.position
        };
    }
}


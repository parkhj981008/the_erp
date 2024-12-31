package com.erp.facility.VO;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MaintenanceDTO {

	private long maintenanceId;
    private long facilityId;
    private Date workingDate;
    private String workDetail;
    private String workStatus;
    private String workCost;
    private String workManager;

    public static String findAllMaintenance() {
        return "select * from  maintenance";
    }
    
    public static String saveManager() {
        return "INSERT INTO maintenance(maintenance_id, facility_id, working_date, " +
               "work_detail, work_status, work_cost, work_manager) " +
               "VALUES (maintenance_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";
    }


    
    public Object[] getAttributeAsObjectArray() {
        return new Object[] {
            this.facilityId,
            this.workingDate,
            this.workDetail,
            this.workStatus,
            this.workCost,
            this.workManager
        };
    }
}

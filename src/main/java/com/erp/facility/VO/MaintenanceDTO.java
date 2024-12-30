package com.erp.facility.VO;

import java.util.Date;

public class MaintenanceDTO {

	private long maintenanceId;
    private long facilityId;
    private Date workingDate;
    private String workDetail;
    private String workStatus;
    private String workCost;
    private String workManager;

    public static String findAllMaintenance() {
        return "select * from maintenance";
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

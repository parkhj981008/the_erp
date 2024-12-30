package com.erp.facility.VO;

public class ManagerDTO {
	
	private long managerId;
    private String name;
    private int phoneNumber;
    private int department;
    private String position;
    
    public static String findAllManager() {
        return "select * from manager";
    }
    
    public Object[] getAttributeAsObjectArray() {
        return new Object[] {
            this.name,
            this.phoneNumber,
            this.department,
            this.position
        };
    }
}

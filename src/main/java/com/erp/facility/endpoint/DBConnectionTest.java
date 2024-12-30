package com.erp.facility.endpoint;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import com.erp.facility.Repository.FacilityRepository;


public class DBConnectionTest {


	
	public static void main(String[] args) {

		FacilityRepository rps = new FacilityRepository();
		rps.findAll().forEach(i -> System.out.println(i));
		
	}
}

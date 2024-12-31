package com.erp.common.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface DBManager {
		
	Connection getConnection() throws SQLException;
	Connection getConnectionForTransaction() throws SQLException; 
	
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs);
	public void close(Connection conn, PreparedStatement pstmt);
}

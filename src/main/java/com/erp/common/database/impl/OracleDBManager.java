package com.erp.common.database.impl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.erp.common.database.DBManager;


public class OracleDBManager implements DBManager{
	
	@Override
	public Connection getConnection() throws SQLException {
		Properties props = new Properties();
		try {
			props.load(OracleDBManager.class.getClassLoader().getResourceAsStream("mydb.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return DriverManager.getConnection(props.getProperty("oracle.url"), props.getProperty("oracle.id"), props.getProperty("oracle.pw"));
	}

	@Override
	public Connection getConnectionForTransaction() throws SQLException {
		Connection conn = getConnection();
		conn.setAutoCommit(false);
		return conn;
	}
	
	@Override
    public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if(rs != null)      rs.close();
            if(pstmt != null)   pstmt.close();
            if(conn != null)    conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public void close(Connection conn, PreparedStatement pstmt) {
        try {
            if(pstmt != null)   pstmt.close();
            if(conn != null)    conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	
}

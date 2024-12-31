package com.erp.common.attendance;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class OracleDBManager implements DBManager {
	
    private String DB_URL;
    private String DB_ID;
    private String DB_PW;
    
    private static final Properties props = new Properties();
    private static OracleDBManager instance;
    
    // private 생성자
    private OracleDBManager() {
        try {
            props.load(OracleDBManager.class.getClassLoader().getResourceAsStream("mydb2.properties"));
            DB_URL = props.getProperty("oracle.url");
            DB_ID = props.getProperty("oracle.id");
            DB_PW = props.getProperty("oracle.pw");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    // 싱글톤 인스턴스 반환 메소드
    public static OracleDBManager getInstance() {
        if (instance == null) {
            synchronized (OracleDBManager.class) {
                if (instance == null) {
                    instance = new OracleDBManager();
                }
            }
        }
        return instance;
    }
    
    @Override
    public Connection connect() {
        Connection conn = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
            
            if(conn != null)
                System.out.println("오라클 연결성공");
            else
                System.out.println("오라클 연결실패");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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

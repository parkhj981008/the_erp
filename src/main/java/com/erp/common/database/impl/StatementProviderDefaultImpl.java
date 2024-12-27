package com.erp.common.database.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.erp.common.database.StatementProvider;


public class StatementProviderDefaultImpl implements StatementProvider {

    @Override
    public PreparedStatement getPreparedStatement(Connection conn, String sql, Object... objs) throws SQLException {
        int count = 0;
        for (char c : sql.toCharArray()) {
            if (c == '?') count++;
        }

        PreparedStatement resultPS = conn.prepareStatement(sql);

        for (int i = 1; i <= count; i++) {
            Object o = objs[i - 1];
            if (o == null) {
                resultPS.setNull(i, java.sql.Types.NULL); 
            } else if (o instanceof Integer) {
                resultPS.setInt(i, (Integer) o);
            } else if (o instanceof Byte) {
                resultPS.setByte(i, (Byte) o);
            } else if (o instanceof Long) {
                resultPS.setLong(i, (Long) o);
            } else if (o instanceof Float) {
                resultPS.setFloat(i, (Float) o);
            } else if (o instanceof Double) {
                resultPS.setDouble(i, (Double) o);
            } else if (o instanceof String) {
                resultPS.setString(i, (String) o);
            }else if (o instanceof java.util.Date) {
            	java.util.Date utilDate = (java.util.Date)o;
                resultPS.setDate(i, new java.sql.Date(utilDate.getDate()));
            } else if (o instanceof java.sql.Date) {
                resultPS.setDate(i, (java.sql.Date) o);
            } else if (o instanceof java.sql.Timestamp) {
                resultPS.setTimestamp(i, (java.sql.Timestamp) o);
            } else if (o instanceof Boolean) {
                resultPS.setBoolean(i, (Boolean) o);
            } else if (o instanceof java.sql.Time) {
                resultPS.setTime(i, (java.sql.Time) o);
            } else {
                resultPS.setObject(i, o);
            }
        }

        return resultPS;
    }
}

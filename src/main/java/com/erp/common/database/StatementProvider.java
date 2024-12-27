package com.erp.common.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public interface StatementProvider {
	PreparedStatement getPreparedStatement(Connection conn, String sql, Object... objs) throws SQLException;
}

package com.datapro.eibs.reporter.service.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.dbutils.DbUtils;

import com.datapro.eibs.reporter.resources.General;
import com.datapro.eibs.reporter.resources.ResourceManager;

/**
 * @author Luis Crosby
 * @date 2/2012
 * 
 */


public class DBConnectionManager {

	protected Connection conn;
	protected boolean verbose = true;

	protected Connection getConnection() throws SQLException {
		if (conn == null)
			startConnection();
		else if (conn.isClosed())
			startConnection();
		return conn;
	}

	protected void startConnection() {
		String driverClass = ResourceManager.getString("database.driver");
		String dbUrl = ResourceManager.getString("database.url");
		String dbUser = ResourceManager.getString("database.user");
		String dbPassword = ResourceManager.getString("database.password");

		if (verbose)
			General.logEvent("DBConnectionManager: Will connect to DB."
					+ dbUrl + " : " + dbUser + ".");

		try {
			DbUtils.loadDriver(driverClass);
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		} catch (Exception e) {
			if (verbose)
				General
						.logEvent("ProcessReportDAO: Could not connect to database: "
								+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	protected int getMaxIdentifier(String idField, String table) throws SQLException {
		
		int res = -999;
		String sql = "SELECT max(" + idField + ") FROM " + table;
		
		Connection connection = getConnection();

		Statement stmt = connection.createStatement();

		if (verbose)
			General.logEvent("Will launch SQL: " + sql);

		ResultSet rs = stmt.executeQuery(sql);
		General.logEvent("Executed");

		if (rs.next()) {
			res = rs.getInt(1);
		}
		rs.close();
		stmt.close();
		return res;
	}	

	protected void finalize() {
		try {
			DbUtils.closeQuietly(conn);
		} catch (Exception e) {
		}
	}

}

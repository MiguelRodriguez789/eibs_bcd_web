/**
 * @author Luis Crosby R.
 * @date 01JUL2011
 * Updates: 03/01/2012 - Luis Crosby
 */

package com.datapro.eibs.reporter.service.dao;

/**
 * @author Luis Crosby
 * @date 8/2012
 * 
 */


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.datapro.eibs.reporter.model.GlbprmDTO;
import com.datapro.eibs.reporter.model.ModuleDTO;
import com.datapro.eibs.reporter.model.ReportDTO;
import com.datapro.eibs.reporter.resources.General;

import datapro.eibs.beans.ELEERRMessage;


public class GlbprmDAO extends DBConnectionManager {


	private static GlbprmDAO mgr;

	public GlbprmDAO() {
		startConnection();
	}
	
	public static GlbprmDAO getInstance() {
		if (mgr == null)
			mgr = new GlbprmDAO();
		return mgr;
	}

	public GlbprmDTO getParams() throws SQLException {

		String sql = "SELECT * " +
				" FROM LRG_GLBPRM " +
				" fetch first 1 rows only ";

		return loadParams(sql);
	}		
	
	private GlbprmDTO loadParams(String sql) throws SQLException {

		Connection connection = getConnection();

		if (verbose)
			General.logEvent("At GlbprmDAO.loadModules. Launching SQL" + sql);

		
		
		QueryRunner qRunner = new QueryRunner();
		GlbprmDTO params = (GlbprmDTO) qRunner.query(connection, sql, new BeanHandler(
				GlbprmDTO.class));

		if (verbose)
			General.logEvent("Executed");

		return params;		
	}	
	
	public void editParams(GlbprmDTO params) throws SQLException {
			
			String sql = "DELETE FROM LRG_GLBPRM "; 

			Connection connection = getConnection();
			
			QueryRunner qRunner = new QueryRunner();
			qRunner.update(connection, sql);

			sql = "INSERT INTO LRG_GLBPRM (MAXRWS) VALUES (" + params.getMAXRWS() + ")";
			qRunner.update(connection, sql);
	}	
	
}

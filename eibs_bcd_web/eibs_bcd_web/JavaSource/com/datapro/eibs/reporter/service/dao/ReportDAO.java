/**
 * @author Luis Crosby R.
 * @date 01JUL2011
 * Updates: 03/01/2012 - Luis Crosby
 */

package com.datapro.eibs.reporter.service.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.datapro.eibs.reporter.model.ModuleDTO;
import com.datapro.eibs.reporter.model.ReportDTO;
import com.datapro.eibs.reporter.resources.General;

import datapro.eibs.beans.ELEERRMessage;

/**
 * @author Luis Crosby
 * @date 6/2012
 * 
 */

public class ReportDAO extends DBConnectionManager {


	private static ReportDAO mgr;

	public ReportDAO() {
		startConnection();
	}
	
	public static ReportDAO getInstance() {
		if (mgr == null)
			mgr = new ReportDAO();
		return mgr;
	}

	public void reassignReports(String fromUser, String toUser, String updater) throws SQLException {

		String sql = "";
		Connection connection = getConnection();
		connection.setAutoCommit(false);

		try {
			
			sql = " SELECT DISTINCT ID_MOD" +
					" FROM LRG_REPORT WHERE CREUSR = ?" +
					" AND ID_MOD NOT IN" +
					" (SELECT DISTINCT ID_MOD FROM LRG_USRMOD WHERE USRCOD = ?)";
			
			String [] params = {fromUser, toUser};
			
			QueryRunner qRunner = new QueryRunner();
			List list = (List) qRunner.query(connection, sql, new BeanListHandler(
					Integer.class), params);

			if (list.size() > 0)
			{
				//Insert 
				sql = " INSERT INTO LRG_USRMOD (USRCOD, ID_MOD, CREUSR, CREADT) " +
						" VALUES (?, ?, ?, ?) ";
				
				PreparedStatement ps = connection.prepareStatement(sql);
				
				for (Iterator it = list.iterator(); it.hasNext();)
				{
					Integer idMod = (Integer) it.next();
					ps.setString(1, toUser);
					ps.setInt(2, idMod.intValue());
					ps.setString(3, updater);
					ps.setTimestamp(4, new java.sql.Timestamp(Calendar.getInstance()
							.getTime().getTime()));
					ps.addBatch();
				}
				ps.executeBatch();
				ps.close();
			}
			sql = "UPDATE LRG_REPORT SET CREUSR = ? WHERE CREUSR = ? ";
			PreparedStatement ps2 = connection.prepareStatement(sql);
			ps2.setString(1, toUser);
			ps2.setString(2, fromUser);
			
			ps2.execute();			
			ps2.close();
			connection.commit();
		}
		catch (SQLException sqle)
		{
			connection.rollback();
			throw new SQLException(); 
		}		
	}

	public List getReportsByOwner(String textSearch) throws SQLException{
		String sql = "SELECT ID_REP, ID_MOD, RPTTYP, RPTCOD, RPTDSC, PUBREP, CREUSR, CREADT, ACTIVE " +
		" FROM LRG_REPORT " +
		" WHERE CREUSR = ?" +
		" ORDER BY CREADT";

		String [] params = {textSearch};
		
		return getReports(sql, params);
	}
	
	private List getReports(String sql, String[] params) throws SQLException {

		Connection connection = getConnection();

		if (verbose)
			General.logEvent("At ReportDAO.getReports. Launching SQL: " + sql);

		QueryRunner qRunner = new QueryRunner();
		List list = (List) qRunner.query(connection, sql, new BeanListHandler(
				ReportDTO.class), params);

		if (verbose)
			General.logEvent("Executed");

		return list;
	}

	public ReportDTO getReport(int idRep) throws SQLException {
		
			String sql = "";
			Connection connection = getConnection();

			ReportDTO report = null;

			sql = "SELECT * FROM LRG_REPORT"
					+ " WHERE ID_REP = " + idRep;

			if (verbose)
				General.logEvent("Will launch SQL: " + sql);

			QueryRunner qRunner = new QueryRunner();

			report = (ReportDTO) qRunner.query(connection, sql, new BeanHandler(
					ReportDTO.class));

			return report;
		
	}

	public ELEERRMessage editReport(ReportDTO reportUpd) {
			
			ELEERRMessage error = new ELEERRMessage();
			String sql = "UPDATE LRG_REPORT SET " +
					" RPTDSC = ?, PUBREP = ?, ACTIVE = ? " +
					" WHERE ID_REP = ?";
			
			try {
				Connection connection = getConnection();
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setString(1, reportUpd.getRPTDSC());
				ps.setString(2, reportUpd.getPUBREP());
				ps.setString(3, reportUpd.getACTIVE());
				ps.setInt(4, reportUpd.getID_REP());
				ps.execute();
				ps.close();
				error.setERRNUM("0");
				error.setERWRNG("K");
			}
			catch (SQLException sqlex) {
				error.setERRNUM("1");
				error.setERNU01("501");
				error.setERDF01("ENTSTR");
				error.setERDS01("Error de Sintaxis. Revise los parámetros");
			}		
			return error;
	}	
	
}

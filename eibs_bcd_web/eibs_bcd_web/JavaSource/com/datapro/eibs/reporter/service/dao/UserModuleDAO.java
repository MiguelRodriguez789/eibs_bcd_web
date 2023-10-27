package com.datapro.eibs.reporter.service.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.datapro.eibs.reporter.resources.General;
import com.datapro.eibs.reporter.resources.ResourceManager;
import com.datapro.eibs.reporter.forms.LRG000101;
import com.datapro.eibs.reporter.model.LRGUserDTO;
import com.datapro.eibs.reporter.model.ModuleDTO;

/**
 * @author Luis Crosby
 * @date 6/2012
 * 
 */

public class UserModuleDAO extends DBConnectionManager {

	public int validateUser(String userID) throws SQLException {
		
		int result = 0;
		
		Connection connection = getConnection();

		String sql = "SELECT COUNT(*) " + 
				" FROM " + ResourceManager.getString("eibs.table.users") + 
				" WHERE " + ResourceManager.getString("eibs.column.userid") + 
				" = ?";

		if (verbose)
			General.logEvent("At UserModuleDAO.validateUser. Will launch SQL.");

		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, userID);
		ResultSet rs = ps.executeQuery();

		while (rs.next())
		{
			result = rs.getInt(1);
		}
		
		rs.close();
		ps.close();

		if (verbose)
			General.logEvent("Executed");

		return result;
	}
	
	public List loadModules(String userId) throws SQLException {

		Connection connection = getConnection();

		String sql = "SELECT M.ID_MOD as ID_MOD, M.MODCOD as MODCOD, M.MODDSC as MODDSC, M.PUBMOD as PUBMOD"
				+ " FROM LRG_MODULE M, LRG_USRMOD UM"
				+ " WHERE M.ID_MOD = UM.ID_MOD AND UM.USRCOD = ?" +
					" ORDER BY MODDSC";

		String [] params = {userId};
		
		if (verbose)
			General.logEvent("At UserModuleDAO.loadModules. Launching SQL");

		QueryRunner qRunner = new QueryRunner();
		List list = (List) qRunner.query(connection, sql, new BeanListHandler(
				ModuleDTO.class), params);

		if (verbose)
			General.logEvent("Executed");

		return list;
	}

	/**
	 * Returns a list of modules this user still can't access
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	public List loadMissingModules(String userId) throws SQLException {

		Connection connection = getConnection();

		String sql = 
				"SELECT M.ID_MOD as ID_MOD, M.MODCOD as MODCOD, M.MODDSC as MODDSC, M.PUBMOD as PUBMOD"
				+ " FROM LRG_MODULE M"
				+ " EXCEPT"
				+ " SELECT M.ID_MOD as ID_MOD, M.MODCOD as MODCOD, M.MODDSC as MODDSC, M.PUBMOD as PUBMOD"
				+ " FROM LRG_MODULE M, LRG_USRMOD UM"
				+ " WHERE M.ID_MOD = UM.ID_MOD AND UM.USRCOD = ?" +
						" ORDER BY MODDSC";

		String [] params = {userId};
		
		if (verbose)
			General.logEvent("At UserModule.loadMissingModules. Will launch SQL.");

		QueryRunner qRunner = new QueryRunner();
		List list = (List) qRunner.query(connection, sql, new BeanListHandler(
				ModuleDTO.class), params);

		if (verbose)
			General.logEvent("Executed");

		return list;
	}	
	
	private static UserModuleDAO mgr;

	public UserModuleDAO() {
		startConnection();
	}

	public static UserModuleDAO getInstance() {
		if (mgr == null)
			mgr = new UserModuleDAO();
		return mgr;
	}

	public int saveList(LRG000101 msg) throws SQLException{
		int result = -1;
		String sql = "";
		
		String userID = msg.getUserID();
		int[] arrData = msg.getArrSelectedFields();
		
		Connection connection = getConnection();
		connection.setAutoCommit(false);

		Statement statement = connection.createStatement();
		sql = " DELETE FROM LRG_USRMOD WHERE USRCOD='" + userID + "'";
		statement.executeUpdate(sql);
		
		sql = " INSERT INTO LRG_USRMOD (USRCOD, ID_MOD, CREUSR, CREADT, ACTIVE)"
			+ " VALUES (?, ?, ?, ?, ?)";
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		
		for (int i= 0; i<arrData.length; i++)
		{
			preparedStatement.setString(1, userID);
			preparedStatement.setInt(2, arrData[i]);
			preparedStatement.setString(3, msg.getMasterUser());
			preparedStatement.setTimestamp(4, new java.sql.Timestamp(Calendar.getInstance()
					.getTime().getTime()));
			preparedStatement.setString(5, "1");
			preparedStatement.addBatch();
		}
		
		int[] resultUpdate = preparedStatement.executeBatch();
		result = resultUpdate.length; 
		connection.commit();
		connection.setAutoCommit(true);
		preparedStatement.close();
		statement.close();

		return result;
	}

	public List getLRGUserList(String textSearch) throws SQLException {
		
		Connection connection = getConnection();
	
		String sql = " SELECT CREUSR as userCode, BTHF03 as userName, COUNT(CREUSR) as totalReports " +
				" FROM LRG_REPORT, " + ResourceManager.getString("eibs.table.users") + 
				" WHERE CREUSR = " + ResourceManager.getString("eibs.column.userid") + 
				" AND CREUSR LIKE '" + textSearch + "%'" +
				" GROUP BY CREUSR, BTHF03 " +
				" ORDER BY CREUSR";
				
		if (verbose)
			General.logEvent("At UserModule.getLRGUserList. Will launch SQL. " + sql);

		QueryRunner qRunner = new QueryRunner();
		List list = (List) qRunner.query(connection, sql, new BeanListHandler(
				LRGUserDTO.class));

		if (verbose)
			General.logEvent("Executed");

		return list;
	}
	
	public List getAllEibsAdminUsers(String textSearch) throws SQLException {
		
		Connection connection = getConnection();
	
		String sql = " SELECT " + ResourceManager.getString("eibs.column.userid") + " as userCode,  BTHF03 as userName, BTHAUT as authority " +
				" FROM " + ResourceManager.getString("eibs.table.users") +
				" WHERE " + ResourceManager.getString("eibs.column.userid") + " LIKE '" + textSearch + "%' " +
				" AND BTHAUT NOT IN ('I', 'O') " +
				" ORDER BY 1 ";

		if (verbose)
			General.logEvent("At UserModule.getLRGUserList. Will launch SQL. " + sql);

		QueryRunner qRunner = new QueryRunner();
		List list = (List) qRunner.query(connection, sql, new BeanListHandler(
				LRGUserDTO.class));

		if (verbose)
			General.logEvent("Executed");

		return list;
	}	

	public List getAllEibsUsers(String textSearch) throws SQLException {
		
		Connection connection = getConnection();
	
		String sql = " SELECT RTRIM(" + ResourceManager.getString("eibs.column.userid") + ") as userCode,  RTRIM(BTHF03) as userName, BTHAUT as authority " +
				" FROM " + ResourceManager.getString("eibs.table.users") +
				" WHERE " + ResourceManager.getString("eibs.column.userid") + " LIKE '" + textSearch + "%' " +
				" ORDER BY 1 ";

		if (verbose)
			General.logEvent("At UserModule.getAllEibsUsers. Will launch SQL. " + sql);

		QueryRunner qRunner = new QueryRunner();
		List list = (List) qRunner.query(connection, sql, new BeanListHandler(
				LRGUserDTO.class));

		if (verbose)
			General.logEvent("Executed");

		return list;
	}		
	
}

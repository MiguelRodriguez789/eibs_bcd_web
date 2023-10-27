package com.datapro.eibs.reporter.service.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.datapro.eibs.reporter.model.ModuleDTO;
import com.datapro.eibs.reporter.resources.General;

import datapro.eibs.beans.ELEERRMessage;

/**
 * @author Luis Crosby
 * @date 7/2012
 * 
 */


public class ModuleDAO extends DBConnectionManager {

	public List getModulesByCode(String code) throws SQLException {

		String sql = "SELECT ID_MOD, MODCOD, MODDSC, ENTSTR, RELSTR, PUBMOD, ACTIVE " +
				" FROM LRG_MODULE M " +
				" WHERE ID_MOD = ?";

		String [] params = { code };
		
		return loadModules(sql, params);
	}
	
	public List getModulesByDescription(String desc) throws SQLException {

		String sql = "SELECT ID_MOD, MODCOD, MODDSC, ENTSTR, RELSTR, PUBMOD, ACTIVE " +
				" FROM LRG_MODULE M " +
				" WHERE MODDSC LIKE ?";

		String param = desc.concat("%");
		String [] params = { param };
		
		return loadModules(sql, params);
	}	
	
	public ModuleDTO getModule(int mod) throws SQLException {
		String sql = "";
		Connection connection = getConnection();

		ModuleDTO module = null;

		sql = "SELECT * FROM LRG_MODULE"
				+ " WHERE ID_MOD = " + mod;

		if (verbose)
			General.logEvent("Will launch SQL: " + sql);

		QueryRunner qRunner = new QueryRunner();

		module = (ModuleDTO) qRunner.query(connection, sql, new BeanHandler(
				ModuleDTO.class));

		return module;
	}
	
	private List loadModules(String sql, String[] params) throws SQLException {

		Connection connection = getConnection();

		if (verbose)
			General.logEvent("At ModuleDAO.loadModules. Launching SQL");

		QueryRunner qRunner = new QueryRunner();
		List list = (List) qRunner.query(connection, sql, new BeanListHandler(
				ModuleDTO.class), params);

		if (verbose)
			General.logEvent("Executed");

		return list;
	}	
	
	private static ModuleDAO mgr;

	public ModuleDAO() {
		startConnection();
	}

	public static ModuleDAO getInstance() {
		if (mgr == null)
			mgr = new ModuleDAO();
		return mgr;
	}

	public ELEERRMessage testModuleAccess(ModuleDTO module, String fields) {
		
		ELEERRMessage error = new ELEERRMessage();
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "SELECT ";
		sql = sql.concat(fields);
		sql = sql.concat(" FROM ").concat(module.getENTSTR());
		if (module.getRELSTR().trim().length() > 0)
			sql = sql.concat(" WHERE ").concat(module.getRELSTR());
		
		if (fields.trim().length() == 0 || fields.equals("*"))
			fields = "COUNT(*)";
		
		try {
			Connection connection = getConnection();
			st = connection.createStatement();
			rs = st.executeQuery(sql);
			error.setERRNUM("0");
			error.setERWRNG("T");

		} catch (SQLException sqlex) {
			error.setERRNUM("1");
			error.setERNU01("501");
			error.setERDF01("ENTSTR");
			error.setERDS01("Error de Sintaxis. Revise los parámetros");
		}
		finally {
			try {
				rs.close();
				st.close();
			} catch(Exception e) {}
			
		}
		return error;
	}

	public ELEERRMessage editModule(ModuleDTO module) {
		
		ELEERRMessage error = new ELEERRMessage();
		String sql = "UPDATE LRG_MODULE SET " +
				" MODDSC = ?, ENTSTR = ?, RELSTR = ?, PUBMOD = ?, ACTIVE = ? " +
				" WHERE ID_MOD = ?";
		
		try {
			Connection connection = getConnection();
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, module.getMODDSC());
			ps.setString(2, module.getENTSTR());
			ps.setString(3, module.getRELSTR());
			ps.setString(4, module.getPUBMOD());
			ps.setString(5, module.getACTIVE());
			ps.setInt(6, module.getID_MOD());
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

	public int saveModule(ModuleDTO module) throws Exception {
		String sql = " INSERT INTO LRG_MODULE (ID_MOD, MODCOD, MODDSC, ENTSTR,  RELSTR, PUBMOD, ACTIVE, CREUSR, CREADT)" +
				" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		int maxReg = getMaxIdentifier("ID_MOD", "LRG_MODULE") + 1;
		Connection connection = getConnection();
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setInt(1, maxReg);
		ps.setString(2, module.getMODCOD());
		ps.setString(3, module.getMODDSC());
		ps.setString(4, module.getENTSTR());
		ps.setString(5, module.getRELSTR());
		ps.setString(6, module.getPUBMOD());
		ps.setString(7, module.getACTIVE());
		ps.setString(8, module.getCREUSR());
		ps.setTimestamp(9, new Timestamp(System.currentTimeMillis()));		
		ps.execute();
		ps.close();
		return maxReg;
	}
}

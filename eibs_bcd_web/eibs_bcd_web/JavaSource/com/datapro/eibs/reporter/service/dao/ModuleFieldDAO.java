/**
 * @owner Datapro Financial Information Systems
 * @author lcrosby
 * @date 08MAR2011
 */

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
import com.datapro.eibs.reporter.model.ModuleFieldDTO;
import com.datapro.eibs.reporter.resources.General;

import datapro.eibs.beans.ELEERRMessage;

/**
 * @author Luis Crosby
 * @date 7/2012
 * 
 */


public class ModuleFieldDAO extends DBConnectionManager{

	public List getProductTypes(Integer mod) throws SQLException {
		String sql = "";
		Connection connection = getConnection();

		String idModStr = "";
		if (mod != null)
			idModStr = " AND ID_MOD = " + mod.intValue();

		sql = "SELECT * FROM LRG_MODFLD"
				+ " WHERE ALSTNG = '1' AND ACTIVE = '1'" + idModStr
				+ " ORDER BY FLDLBL ";

		if (verbose)
			General.logEvent("Will launch SQL: " + sql);

		QueryRunner qRunner = new QueryRunner();
		General.logEvent("1 ");
		List list = (List) qRunner.query(connection, sql, new BeanListHandler(
				ModuleFieldDTO.class));
		General.logEvent("2 ");

		return list;
	}

	private static ModuleFieldDAO mgr;

	public ModuleFieldDAO() {
		startConnection();
	}

	public static ModuleFieldDAO getInstance() {
		if (mgr == null)
			mgr = new ModuleFieldDAO();
		return mgr;
	}
	
	public List getModuleFields(int idMod) throws SQLException {
		String sql = "";
		Connection connection = getConnection();

		sql = "SELECT * FROM LRG_MODFLD"
				+ " WHERE ID_MOD = " + idMod;

		if (verbose)
			General.logEvent("Will launch SQL: " + sql);

		QueryRunner qRunner = new QueryRunner();
		List list = (List) qRunner.query(connection, sql, new BeanListHandler(
				ModuleFieldDTO.class));

		return list;
	}

	public ModuleFieldDTO getModuleField(int modfld) throws SQLException {
		String sql = "";
		Connection connection = getConnection();

		ModuleFieldDTO moduleField = null;

		sql = "SELECT * FROM LRG_MODFLD " + 
				" WHERE ID_MFL = " + modfld;

		if (verbose)
			General.logEvent("Will launch SQL: " + sql);

		QueryRunner qRunner = new QueryRunner();

		moduleField = (ModuleFieldDTO) qRunner.query(connection, sql, new BeanHandler(
				ModuleFieldDTO.class));

		return moduleField;
	}

	public ELEERRMessage editModuleField(ModuleFieldDTO moduleField) {
		
		ELEERRMessage error = new ELEERRMessage();
		String sql = "UPDATE LRG_MODFLD SET " +
				" DATTYP = ?, DATLNG = ?, ALSTNG = ?, AWHERE = ?, AGRPBY = ?, " +
				" AGRFUN = ?, FLDLBL = ?, MNDTRY = ?, ACTIVE = ? " +
				" WHERE ID_MFL = ?";
		
		try {
			Connection connection = getConnection();
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, moduleField.getDATTYP());
			ps.setInt(2, moduleField.getDATLNG());
			ps.setString(3, moduleField.getALSTNG());
			ps.setString(4, moduleField.getAWHERE());
			ps.setString(5, moduleField.getAGRPBY());
			ps.setString(6, moduleField.getAGRFUN());
			ps.setString(7, moduleField.getFLDLBL());
			ps.setString(8, moduleField.getMNDTRY());
			ps.setString(9, moduleField.getACTIVE());
			ps.setInt(10, moduleField.getID_MFL());
			ps.execute();
			ps.close();
			error.setERRNUM("0");
		}
		catch (SQLException sqlex) {
			error.setERRNUM("1");
			error.setERNU01("601");
			error.setERDF01("FLDLBL");
			error.setERDS01("No se ha podido completar la operación. Revise los parámetros");
		}		
		return error;
	}

	public void saveModuleField(ModuleFieldDTO moduleField) throws Exception {

		String sql = "INSERT INTO LRG_MODFLD (ID_MFL, ID_MOD, FLDDSC, DATTYP, DATLNG, " +
				" ALSTNG, AWHERE, AGRPBY, AGRFUN, FLDLBL, MNDTRY, ACTIVE, CREUSR, CREADT )" +
				" VALUES (?, ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?, ?, ?, ?) ";
		
		int maxReg = getMaxIdentifier("ID_MFL", "LRG_MODFLD") + 1;
		Connection connection = getConnection();
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setInt(1, maxReg);
		ps.setInt(2, moduleField.getID_MOD());
		ps.setString(3, moduleField.getFLDDSC());
		ps.setString(4, moduleField.getDATTYP());
		ps.setInt(5, moduleField.getDATLNG());
		ps.setString(6, moduleField.getALSTNG());
		ps.setString(7, moduleField.getAWHERE());
		ps.setString(8, moduleField.getAGRPBY());
		ps.setString(9, moduleField.getAGRFUN());
		ps.setString(10, moduleField.getFLDLBL());
		ps.setString(11, moduleField.getMNDTRY());
		ps.setString(12, moduleField.getACTIVE());
		ps.setString(13, moduleField.getCREUSR());
		ps.setTimestamp(14, new Timestamp(System.currentTimeMillis()));
		
		ps.execute();
		ps.close();
	}
	
	public ELEERRMessage testModuleFieldAccess(ModuleDTO module,
			String field) throws Exception {
		ELEERRMessage error = new ELEERRMessage();
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "SELECT ";
		sql = sql.concat(field);
		sql = sql.concat(" FROM ").concat(module.getENTSTR());
		if (module.getRELSTR().trim().length() > 0)
			sql = sql.concat(" WHERE ").concat(module.getRELSTR());
		
		try {
			Connection connection = getConnection();
			st = connection.createStatement();
			rs = st.executeQuery(sql);
			error.setERRNUM("0");
			error.setERWRNG("T");
		}
		catch (SQLException sqlex) {
			error.setERRNUM("1");
			error.setERNU01("511");
			error.setERDF01("FLDDSC");
			error.setERDS01("El campo a crear no existe en el catálogo maestro.");
		}
		
		if (!error.getERRNUM().equals("1")) {
			sql = " SELECT COUNT(*) ";
			sql = sql.concat(" FROM LRG_MODFLD ");
			sql = sql.concat(" WHERE ID_MOD = ").concat(module.getID_MOD()+"");
			sql = sql.concat(" AND FLDDSC = '").concat(field).concat("'");
			
			Connection connection = getConnection();
			st = connection.createStatement();
			rs = st.executeQuery(sql);
			
			int count = 0;
			
			while(rs.next()) {
				count = rs.getInt(1);
			}

			if (count > 0 ) {
				error.setERRNUM("1");
				error.setERWRNG("");
				error.setERNU01("512");
				error.setERDF01("FLDDSC");
				error.setERDS01("El campo a crear ya existe en el módulo.");
			}
			try {
				rs.close();
				st.close();
			} catch(Exception e) {}
		}
		return error;
	}
}

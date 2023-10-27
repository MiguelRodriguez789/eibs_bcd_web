/**
 * @author Luis Crosby R.
 * @date 01JUL2011
 * Updates: 03/01/2012 - Luis Crosby
 */

package com.datapro.eibs.reporter.service.dao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.datapro.eibs.reporter.model.DBColumnDTO;
import com.datapro.eibs.reporter.model.DBTableDTO;
import com.datapro.eibs.reporter.resources.General;

/**
 * @author Luis Crosby
 * @date 8/2012
 * 
 */

public class SchemaDAO extends DBConnectionManager {


	private static SchemaDAO mgr;

	public SchemaDAO() {
		startConnection();
	}
	
	public static SchemaDAO getInstance() {
		if (mgr == null)
			mgr = new SchemaDAO();
		return mgr;
	}

	public List getTables(String textSearch) throws SQLException {

		Connection connection = getConnection();

		List list = new ArrayList();
		DBTableDTO dbTable;
		
		if (verbose)
			General.logEvent("At SchemaDAO.getTables. Launching");

		DatabaseMetaData databaseMetaData = connection.getMetaData();
		
		String   catalog          = null;
		String   schemaPattern    = "BNPCYFILES";
		String   tableNamePattern = textSearch + "%";
		String[] types            = {"TABLE"};

		ResultSet result = databaseMetaData.getTables(
		    catalog, schemaPattern, tableNamePattern, types );
		String label = "";
		
		while(result.next()) {
			dbTable = new DBTableDTO();
			dbTable.setTABLE_CAT(result.getString(1));
			dbTable.setTABLE_SCHEM(result.getString(2));
		    dbTable.setTABLE_NAME(result.getString(3));
		    dbTable.setTABLE_TYPE(result.getString(4));
			label = result.getString("REMARKS");
			dbTable.setREMARKS(label);
		    dbTable.setTYPE_NAME(result.getString(8));
		    dbTable.setSELF_REFERENCING_COL_NAME(result.getString(9));
		    dbTable.setREF_GENERATION(result.getString(10));
		    list.add(dbTable);
		}
		
		if (verbose)
			General.logEvent("Executed");

		return list;		
	}

	public List getColumns(String strTable) throws SQLException {
		
		if (strTable==null)
			throw new SQLException();
		else if(strTable.trim().equals(""))
			throw new SQLException();
		
		Connection connection = getConnection();

		List list = new ArrayList();
		DBColumnDTO dbColumn;
		
		if (verbose)
			General.logEvent("At SchemaDAO.getColumns. Launching");

		DatabaseMetaData databaseMetaData = connection.getMetaData();
		
		String   catalog           = null;
		String   schemaPattern     = "BNPCYFILES";
		String   tableNamePattern  = strTable;
		String   columnNamePattern = null;

		ResultSet result = databaseMetaData.getColumns(
		    catalog, schemaPattern, tableNamePattern, columnNamePattern );

		String label = "";

		while(result.next()) {
			
			dbColumn = new DBColumnDTO();
			dbColumn.setTABLE_NAME(result.getString(3));
			dbColumn.setCOLUMN_NAME(result.getString(4));
			dbColumn.setTYPE_NAME(result.getString(6));
			// label = result.getString("REMARKS");
			label = getDefinition(connection, dbColumn.getTABLE_NAME(), dbColumn.getCOLUMN_NAME());
			dbColumn.setREMARKS(label);
		    list.add(dbColumn);
		}

		if (verbose)
			General.logEvent("Executed");

		return list;		
	}	
	
	private String getDefinition(Connection connection, String tableName, String columnName) throws SQLException {
		String result = "";
		
		String sql = "SELECT SSFDSC FROM SSFLD WHERE SSFFIL = '" + tableName + "' AND SSFFLD = '" + columnName + "'";
		
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery(sql);

		while (rs.next())
		{
			result = rs.getString(1);
		}
		
		rs.close();
		statement.close();

		return result;		
	}
}

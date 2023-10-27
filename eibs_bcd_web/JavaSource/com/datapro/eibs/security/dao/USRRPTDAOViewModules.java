/*
 * Created on Jul 5, 2011 by fhernandez
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.security.key.USRRPTKEYViewModules;

/**
 * @author fhernandez
 *
 */
public class USRRPTDAOViewModules extends DAOViewSuper {

	protected String getFindSql() {
		String sql =
			"SELECT DISTINCT RP.IBSPER, RP.IBSMOD " 
				+ "FROM IBSRPT RP "
				+ "INNER JOIN CNTRLBTH C ON C.BTHUSR = ? "
				+ "ORDER BY IBSMOD";
		return sql;
	}

	protected Object[] getFindArguments(Key keyObj) {
		USRRPTKEYViewModules key = (USRRPTKEYViewModules) keyObj;
		Object[] args = {
				formatKeyValue(key.getUSRUID().toString(), new Integer("10"))};
		return args;
	}

	protected String getFindByPrimaryKeySql() {
		return null;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		return null;
	}
}
/*
 * Created on Jul 5, 2011 by fhernandez
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.constants.Reports;
import com.datapro.eibs.security.key.USRRPTKEYViewModulesByPeriod;

/**
 * @author fhernandez
 *
 */
public class USRRPTDAOViewModulesByPeriod extends DAOViewSuper {

	protected String getFindSql() {
		String sql =
			"SELECT DISTINCT RP.IBSMOD FROM IBSRPT RP "
				+ "INNER JOIN CNTRLBTH C ON C.BTHUSR = ? "
				+ "WHERE (RP.IBSPER = '" + Reports.REPORT_PERIOD_ANY + "'" 
				+ "		OR RP.IBSPER LIKE ?) " 
				+ "ORDER BY IBSMOD";
		return sql;
	}

	protected Object[] getFindArguments(Key keyObj) {
		USRRPTKEYViewModulesByPeriod key = (USRRPTKEYViewModulesByPeriod) keyObj;
		Object[] args = {
				key.getUSRUID(), 
				key.getIBSPER() == null ? "%" : key.getIBSPER()};
		return args;
	}

	protected String getFindByPrimaryKeySql() {
		return null;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		return null;
	}
}
/*
 * Created on june 5, 2011 by fhernandez
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.constants.Reports;
import com.datapro.eibs.security.key.USRRPTKEYViewReports;

/**
 * @author fhernandez
 *
 */
public class USRRPTDAOViewReports extends DAOViewSuper {

	protected String getFindSql() {
		String sql =
			"SELECT RP.* FROM USRRPT SG "
				+ "INNER JOIN IBSRPT RP ON SG.USRRPN = RP.IBSRPN AND (RP.IBSPER <> '" + Reports.REPORT_PERIOD_ONDEMAND + "')"
				+ "INNER JOIN CNTRLBTH C ON SG.USRUID = C.BTHUSR OR C.BTHGRP = SG.USRUID "
				+ "WHERE C.BTHUSR = ? AND RP.IBSLIF LIKE ? AND RP.IBSMOD LIKE ? AND " 
				+ "(RP.IBSPER LIKE ? OR RP.IBSPER='" + Reports.REPORT_PERIOD_ANY + "') "
				+ "UNION "
				+ "SELECT RP.* FROM GRPRPT SG "
				+ "INNER JOIN IBSRPT RP ON SG.USRRPN = RP.IBSRPN AND (RP.IBSPER <> '" + Reports.REPORT_PERIOD_ONDEMAND + "')"
				+ "INNER JOIN CNTRLBTH C ON SG.USRUID = C.BTHUSR OR C.BTHGRP = SG.USRUID "
				+ "WHERE C.BTHUSR = ? AND RP.IBSLIF LIKE ? AND RP.IBSMOD LIKE ? AND " 
				+ "(RP.IBSPER LIKE ? OR RP.IBSPER='" + Reports.REPORT_PERIOD_ANY + "') "
				+ "ORDER BY IBSRPN";
		return sql;
	}

	protected Object[] getFindArguments(Key keyObj) {
		USRRPTKEYViewReports key = (USRRPTKEYViewReports) keyObj;
		Object[] args = { 
				key.getUSRUID(),
				key.getIBSLIF() == null ? "%" : key.getIBSLIF(),
				key.getIBSMOD() == null ? "%" : key.getIBSMOD(),
				key.getIBSPER() == null ? "%" : key.getIBSPER(),
				key.getUSRUID(),
				key.getIBSLIF() == null ? "%" : key.getIBSLIF(),
				key.getIBSMOD() == null ? "%" : key.getIBSMOD(),
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
/*
 * Created on june 5, 2011 by fhernandez
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.constants.Reports;
import com.datapro.eibs.security.key.USRRPTKEYViewReportsChecked;

/**
 * @author fhernandez
 *
 */
public class USRRPTDAOViewReportsChecked extends DAOViewSuper {

	protected String getFindSql() {
		String sql =
			"SELECT RP.*, " +
			"CASE WHEN SG.USRRPN IS NULL THEN SU.USRRPN ELSE SG.USRRPN END AS CHECKED, " +
			"CASE WHEN SG.USRRPN IS NULL THEN '' ELSE 'disabled' END AS DISABLED " +
			"FROM IBSRPT RP " +
			"LEFT JOIN USRRPT SU ON RP.IBSRPN = SU.USRRPN AND SU.USRUID = ? " + 
			"LEFT JOIN GRPRPT SG ON RP.IBSRPN = SG.USRRPN AND SG.USRUID = (SELECT DISTINCT BTHGRP FROM CNTRLBTH WHERE BTHUSR = ?) " +
			"WHERE RP.IBSLIF LIKE ? AND RP.IBSMOD LIKE ? AND RP.IBSRPN LIKE ? AND " +
			"	(RP.IBSPER LIKE ? OR RP.IBSPER='" + Reports.REPORT_PERIOD_ANY + "') " +
			"ORDER BY IBSMOD, IBSRPN";
		return sql;
	}

	protected Object[] getFindArguments(Key keyObj) {
		USRRPTKEYViewReportsChecked key = (USRRPTKEYViewReportsChecked) keyObj;
		Object[] args = { 
				key.getUSRUID(),
				key.getUSRUID(),
				key.getIBSLIF() == null ? "%" : key.getIBSLIF(),
				key.getIBSMOD() == null ? "%" : key.getIBSMOD(),
				key.getIBSRPN() == null ? "%" : key.getIBSRPN()+"%",
				key.getIBSPER() == null ? "%" : key.getIBSPER()
		};
		return args;
	}

	protected String getFindByPrimaryKeySql() {
		return null;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		return null;
	}

}
/*
 * Created on Jul 5, 2006 by fhernandez
 * DAO IBSRPTDAOViewUserItems ITM
 * In security
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.constants.EOD;
import com.datapro.eibs.security.key.USRRPTKEYViewEndOfDayReports;
;

/**
 * @author fhernandez
 *
 */
public class USRRPTDAOViewEndOfYearReports extends DAOViewSuper {

	protected String getFindSql() {
		String sql = 
			"SELECT B.IBSDSC, E.EDPDTY, E.EDPDTM, E.EDPDTD, E.EDPPTH, E.EDPRPN, E.EDPFLG " 
			+ "FROM USRRPT A "
			+ "LEFT JOIN IBSRPT B ON A.USRRPN = B.IBSRPN "
			+ "LEFT JOIN EODPDF E ON A.USRRPN = E.EDPRPN " 
			+ "INNER JOIN CNTRLBTH C ON A.USRUID = C.BTHUSR OR C.BTHGRP = A.USRUID "
			+ "WHERE C.BTHUSR = ? AND B.IBSLIF = ? AND B.IBSMOD LIKE ? AND EDPFLG = '" + EOD.END_OF_YEAR_PROCESS + "'" 
			+ "		AND E.EDPDTY = ? AND E.EDPDTM = 12 " 
			+ "UNION "
			+ "SELECT B.IBSDSC, E.EDPDTY, E.EDPDTM, E.EDPDTD, E.EDPPTH, E.EDPRPN, E.EDPFLG " 
			+ "FROM GRPRPT A "
			+ "LEFT JOIN IBSRPT B ON A.USRRPN = B.IBSRPN "
			+ "LEFT JOIN EODPDF E ON A.USRRPN = E.EDPRPN " 
			+ "WHERE A.USRUID = (SELECT DISTINCT BTHGRP FROM CNTRLBTH WHERE BTHUSR = ?) " 
			+ "AND B.IBSLIF = ? AND B.IBSMOD LIKE ? AND EDPFLG = '" + EOD.END_OF_YEAR_PROCESS + "'" 
			+ "		AND E.EDPDTY = ? AND E.EDPDTM = 12 "
			+ "ORDER BY E.EDPRPN";
		return sql;
	}

	protected Object[] getFindArguments(Key keyObj) {
		USRRPTKEYViewEndOfDayReports key = (USRRPTKEYViewEndOfDayReports) keyObj;
		Object[] args = {
				key.getUSRUID(),
				key.getIBSLIF(),
				key.getIBSMOD() == null ? "%" : key.getIBSMOD(),
				key.getEDPDTY(),
				key.getUSRUID(),
				key.getIBSLIF(),
				key.getIBSMOD() == null ? "%" : key.getIBSMOD(),
				key.getEDPDTY()
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
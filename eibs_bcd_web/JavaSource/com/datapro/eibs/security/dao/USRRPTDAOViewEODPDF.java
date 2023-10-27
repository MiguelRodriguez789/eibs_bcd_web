/*
 * Created on Jul 5, 2006 by fhernandez
 * DAO IBSRPTDAOViewUserItems ITM
 * In security
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.security.key.USRRPTKEYViewEODPDF;
import com.datapro.generic.tool.Util;
;

/**
 * @author fhernandez
 *
 */
public class USRRPTDAOViewEODPDF extends DAOViewSuper {

	protected String getFindSql() {
		String sql = 
			"SELECT B.IBSDSC, E.EDPDTY, E.EDPDTM, E.EDPDTD, E.EDPPTH, E.EDPRPN " 
			+ "FROM USRRPT A "
			+ "INNER JOIN IBSRPT B ON A.USRRPN = B.IBSRPN "
			+ "INNER JOIN EODPDF E ON A.USRRPN = E.EDPRPN " 
			+ "INNER JOIN CNTRLBTH C ON A.USRUID = C.BTHUSR "
			+ "WHERE C.BTHUSR = ? AND B.IBSLIF = ? AND B.IBSMOD LIKE ? AND E.EDPRPN = ? "
			+ "	AND ((10000*(E.EDPDTY))+(100*E.EDPDTM)+(E.EDPDTD) >= ? ) "
			+ "	AND ((10000*(E.EDPDTY))+(100*E.EDPDTM)+(E.EDPDTD) <= ? ) "
			+ "UNION "
			+ "SELECT B.IBSDSC, E.EDPDTY, E.EDPDTM, E.EDPDTD, E.EDPPTH, E.EDPRPN " 
			+ "FROM GRPRPT A "
			+ "INNER JOIN IBSRPT B ON A.USRRPN = B.IBSRPN "
			+ "INNER JOIN EODPDF E ON A.USRRPN = E.EDPRPN " 
			+ "WHERE A.USRUID = (SELECT DISTINCT BTHGRP FROM CNTRLBTH WHERE BTHUSR = ?) "
			+ " AND B.IBSLIF = ? AND B.IBSMOD LIKE ? AND E.EDPRPN = ? "
			+ "	AND ((10000*(E.EDPDTY))+(100*E.EDPDTM)+(E.EDPDTD) >= ? ) "
			+ "	AND ((10000*(E.EDPDTY))+(100*E.EDPDTM)+(E.EDPDTD) <= ? ) "
			+ "ORDER BY EDPRPN";
		return sql;
	}

	protected Object[] getFindArguments(Key keyObj) {
		USRRPTKEYViewEODPDF key = (USRRPTKEYViewEODPDF) keyObj;
		Object[] args = {
				key.getUSRUID(),
				key.getIBSLIF(),
				key.getIBSMOD() == null ? "%" : key.getIBSMOD(),
				formatKeyValue(key.getEDPRPN(), new Integer("20")),
				"" + Util.dateToInt(
						key.getFROMDTY(),
						key.getFROMDTM(),
						key.getFROMDTD()),
				"" + Util.dateToInt(
						key.getTODTY(),
						key.getTODTM(),
						key.getTODTD()),
				key.getUSRUID(),
				key.getIBSLIF(),
				key.getIBSMOD() == null ? "%" : key.getIBSMOD(),
				formatKeyValue(key.getEDPRPN(), new Integer("20")),
				"" + Util.dateToInt(
						key.getFROMDTY(),
						key.getFROMDTM(),
						key.getFROMDTD()),
				"" + Util.dateToInt(
						key.getTODTY(),
						key.getTODTM(),
						key.getTODTD())
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
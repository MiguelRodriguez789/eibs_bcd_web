/*
 * Created on Jul 5, 2006 by fhernandez
 * DAO IBSRPTDAOViewUserItems ITM
 * In security
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.security.key.USRRPTKEYViewGeneratedOnDates;
import com.datapro.generic.tool.Util;
;

/**
 * @author fhernandez
 *
 */
public class USRRPTDAOViewGeneratedOnDates extends DAOViewSuper {

	protected String getFindSql() {
		String sql = 
			"SELECT BU.IBSDSC, EU.EDPDTY, EU.EDPDTM, EU.EDPDTD, EU.EDPPTH, EU.EDPRPN " 
			+ "FROM USRRPT AU "
			+ "INNER JOIN IBSRPT BU ON AU.USRRPN = BU.IBSRPN "
			+ "INNER JOIN EODPDF EU ON AU.USRRPN = EU.EDPRPN " 
			+ "INNER JOIN CNTRLBTH CU ON AU.USRUID = CU.BTHUSR OR CU.BTHGRP = AU.USRUID "
			+ "WHERE CU.BTHUSR = ? AND BU.IBSLIF = ? AND BU.IBSMOD LIKE ? AND EU.EDPFLG LIKE ? " 
			+ "	AND ((10000*(EU.EDPDTY))+(100*EU.EDPDTM)+(EU.EDPDTD) >= ? ) "
			+ "	AND ((10000*(EU.EDPDTY))+(100*EU.EDPDTM)+(EU.EDPDTD) <= ? ) "
			+ "UNION "
			+ "SELECT BG.IBSDSC, EG.EDPDTY, EG.EDPDTM, EG.EDPDTD, EG.EDPPTH, EG.EDPRPN " 
			+ "FROM GRPRPT AG "
			+ "INNER JOIN IBSRPT BG ON AG.USRRPN = BG.IBSRPN "
			+ "INNER JOIN EODPDF EG ON AG.USRRPN = EG.EDPRPN " 
			+ "WHERE AG.USRUID = (SELECT DISTINCT BTHGRP FROM CNTRLBTH WHERE BTHUSR = ?) " 
			+ " AND BG.IBSLIF = ? AND BG.IBSMOD LIKE ? AND EG.EDPFLG LIKE ? " 
			+ "	AND ((10000*(EG.EDPDTY))+(100*EG.EDPDTM)+(EG.EDPDTD) >= ? ) "
			+ "	AND ((10000*(EG.EDPDTY))+(100*EG.EDPDTM)+(EG.EDPDTD) <= ? ) "
			+ "ORDER BY EDPRPN";
		return sql;
	}

	protected Object[] getFindArguments(Key keyObj) {
		USRRPTKEYViewGeneratedOnDates key = (USRRPTKEYViewGeneratedOnDates) keyObj;
		Object[] args = {
				key.getUSRUID(),
				key.getIBSLIF(),
				key.getIBSMOD() == null ? "%" : key.getIBSMOD(),
				key.getEDPFLG() == null ? "%" : key.getEDPFLG(),
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
				key.getEDPFLG() == null ? "%" : key.getEDPFLG(),
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
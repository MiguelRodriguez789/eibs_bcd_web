/*
 * Created on Jul 5, 011 by fhernandez
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.security.key.USRRPTKEYViewEndOfDayReports;
import com.datapro.generic.tool.Util;

/**
 * @author fhernandez
 *
 */
public class USRRPTDAOViewEndOfDayReports extends DAOViewSuper {

	protected String getFindSql() {
		String sql = 
			"SELECT B.IBSDSC, E.EDPDTY, E.EDPDTM, E.EDPDTD, E.EDPPTH, E.EDPRPN, E.EDPFLG "
			+ "FROM USRRPT A "
			+ "INNER JOIN IBSRPT B ON A.USRRPN = B.IBSRPN "
			+ "INNER JOIN EODPDF E ON A.USRRPN = E.EDPRPN " 
			+ "INNER JOIN CNTRLBTH C ON A.USRUID = C.BTHUSR OR C.BTHGRP = A.USRUID "
			+ "WHERE C.BTHUSR = ? " 
			+ "AND B.IBSLIF = ? AND B.IBSMOD LIKE ? AND E.EDPFLG LIKE ? "
			+ "AND ((E.EDPBRN = C.BTHUBR) OR ((E.EDPBRN <> C.BTHUBR) AND (C.BTHFL6 <> 'Y' AND E.EDPFL1 <> 'R'))) "
			+ "AND ((10000*(E.EDPDTY))+(100*E.EDPDTM)+(E.EDPDTD) = ? ) "
			+ "UNION "
			+ "SELECT B.IBSDSC, E.EDPDTY, E.EDPDTM, E.EDPDTD, E.EDPPTH, E.EDPRPN, E.EDPFLG "
			+ "FROM GRPRPT A "
			+ "INNER JOIN IBSRPT B ON A.USRRPN = B.IBSRPN "
			+ "INNER JOIN EODPDF E ON A.USRRPN = E.EDPRPN " 
			+ "INNER JOIN CNTRLBTH C ON C.BTHGRP = A.USRUID "
			+ "WHERE A.USRUID = (SELECT DISTINCT BTHGRP FROM CNTRLBTH WHERE BTHUSR = ?) " 
			+ "AND B.IBSLIF = ? AND B.IBSMOD LIKE ? AND E.EDPFLG LIKE ? "
			+ "AND ((E.EDPBRN = C.BTHUBR) OR ((E.EDPBRN <> C.BTHUBR) AND (C.BTHFL6 <> 'Y' AND E.EDPFL1 <> 'R'))) "
			+ "AND ((10000*(E.EDPDTY))+(100*E.EDPDTM)+(E.EDPDTD) = ? ) "
			+ "ORDER BY EDPRPN";
		return sql;
	}

	protected Object[] getFindArguments(Key keyObj) {
		USRRPTKEYViewEndOfDayReports key = (USRRPTKEYViewEndOfDayReports) keyObj;
		Object[] args = {
				key.getUSRUID(),
				key.getIBSLIF(),
				key.getIBSMOD() == null ? "%" : key.getIBSMOD(),
				(key.getEDPFLG() == null ? "%" : key.getEDPFLG()),
				"" + Util.dateToInt(key.getEDPDTY(), key.getEDPDTM(), key.getEDPDTD()),
				key.getUSRUID(),
				key.getIBSLIF(),
				key.getIBSMOD() == null ? "%" : key.getIBSMOD(),
				(key.getEDPFLG() == null ? "%" : key.getEDPFLG()),
				"" + Util.dateToInt(key.getEDPDTY(), key.getEDPDTM(), key.getEDPDTD())
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
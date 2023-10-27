package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuperExt;
import com.datapro.eibs.security.key.WEBCOKEYViewTreeByUser;

/**
 * @author erodriguez
 */
public class WEBCODAOViewTreeByUser extends DAOViewSuperExt {

	protected Object[] getFindArguments(Key arg0) {
		WEBCOKEYViewTreeByUser key =
			(WEBCOKEYViewTreeByUser) arg0;
		Object[] args = { key.getBTHUSR() , key.getCMOSID()};
		return args;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	protected String getFindByPrimaryKeySql() {
		// TODO Auto-generated method stub
		return null;
	}

	protected String getFindSql() {
		String sql = "SELECT B.BTHUSR, A.CMOSID, A.CMODEN, A.CMOLIF, A.CMONDS, " +
				"CASE WHEN G.OGRUSR IS NULL THEN (CASE WHEN U.OUSUSR IS NULL THEN 'N' ELSE 'S' END) ELSE 'S' END AS CMOSTS, " +
				"CASE WHEN G.OGRUSR IS NULL THEN 'RW' ELSE 'RO' END AS CMORWS " +
				"FROM WEBCO A " +
				"LEFT JOIN CNTRLBTH B ON B.BTHLAN = A.CMOLIF " +
				"LEFT JOIN WEBOG G ON G.OGRUSR = B.BTHGRP AND G.OGRSID = A.CMOSID AND G.OGRDEN = A.CMODEN " +
				"LEFT JOIN WEBOU U ON U.OUSUSR = B.BTHUSR AND U.OUSSID = A.CMOSID AND U.OUSDEN = A.CMODEN " +
				"WHERE B.BTHUSR = ? AND A.CMOSID = ? " +
				"ORDER BY CMOSID, CMODEN, CMOSEQ";
		return sql;
	}
	
}

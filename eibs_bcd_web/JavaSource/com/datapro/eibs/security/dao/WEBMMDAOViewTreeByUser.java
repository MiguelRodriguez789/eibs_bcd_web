package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuperExt;
import com.datapro.eibs.security.key.WEBMMKEYViewTreeByUser;

/**
 * @author erodriguez
 */
public class WEBMMDAOViewTreeByUser extends DAOViewSuperExt {

	protected Object[] getFindArguments(Key arg0) {
		WEBMMKEYViewTreeByUser key =
			(WEBMMKEYViewTreeByUser) arg0;
		Object[] args = { key.getBTHUSR(), key.getCMMSID() };
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
		String sql = "SELECT B.BTHUSR, A.CMMSID, A.CMIDEN, A.CMILIF, A.CMENDS, " +
				"CASE WHEN G.OGRUSR IS NULL THEN (CASE WHEN U.OUSUSR IS NULL THEN 'N' ELSE 'S' END) ELSE 'S' END AS CMISTS, " +
				"CASE WHEN G.OGRUSR IS NULL THEN 'RW' ELSE 'RO' END AS CMIRWS " +
				"FROM WEBCM A " +
				"LEFT JOIN CNTRLBTH B ON B.BTHLAN = A.CMILIF " +
				"LEFT JOIN WEBMGR G ON G.OGRUSR = B.BTHGRP AND G.OGRSID = A.CMMSID AND G.OGRDEN = A.CMIDEN " +
				"LEFT JOIN WEBMUS U ON U.OUSUSR = B.BTHUSR AND U.OUSSID = A.CMMSID AND U.OUSDEN = A.CMIDEN " +
				"WHERE B.BTHUSR = ? AND CMMSID = ? " + 
				"ORDER BY CMMSID, CMIDEN";
		return sql;
	}
	
}

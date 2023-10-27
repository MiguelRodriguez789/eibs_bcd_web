/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.security.dao;

/**
 * @author erodriguez
 */
import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.security.key.WEBMMKEYViewByUser;

public class WEBMMDAOViewByUserSecurity extends DAOViewSuper {

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOViewSuper#getFindByPrimaryKeyArguments(com.datapro.access.Key)
	 */
	protected Object[] getFindByPrimaryKeyArguments(Key arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOViewSuper#getFindByPrimaryKeySql()
	 */
	protected String getFindByPrimaryKeySql() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOViewSuper#getFindSql()
	 */
	protected String getFindSql() {
		String sql = "SELECT DISTINCT B.BTHUSR as ESSUSR, 'M' as ESSTYP, A.MMIDEN as ESSSID, " + 
			"' ' as ESSIDE, A.MMENDS as ESSDSC, ' ' as ESSIMG, ' ' as ESSTAD, ' ' as ESSTPO " +
			"FROM WEBMM A " +
			"LEFT JOIN CNTRLBTH B ON B.BTHLAN = A.MMILIF " +
			"INNER JOIN WEBMGR G ON G.OGRUSR = B.BTHGRP AND G.OGRSID = A.MMIDEN " +
			"WHERE B.BTHUSR = ? " + 
			"UNION " +
			"SELECT B.BTHUSR as ESSUSR, 'C' as ESSTYP, A.CMMSID as ESSSID, " + 
			"A.CMIDEN as ESSIDE, A.CMENDS as ESSDSC, A.CMIMFL as ESSIMG, " + 
			"A.CMTGAD as ESSTAD, A.CMTGPO as ESSTPO " +
			"FROM WEBCM A " +
			"LEFT JOIN CNTRLBTH B ON B.BTHLAN = A.CMILIF " +
			"INNER JOIN WEBMGR G ON G.OGRUSR = B.BTHGRP AND G.OGRSID = A.CMMSID AND G.OGRDEN = A.CMIDEN " +
			"WHERE B.BTHUSR = ? " +
			"UNION " +
			"SELECT DISTINCT B.BTHUSR as ESSUSR, 'M' as ESSTYP, A.MMIDEN as ESSSID, " + 
			"' ' as ESSIDE, A.MMENDS as ESSDSC, ' ' as ESSIMG, ' ' as ESSTAD, ' ' as ESSTPO " +
			"FROM WEBMM A " +
			"LEFT JOIN CNTRLBTH B ON B.BTHLAN = A.MMILIF " +
			"INNER JOIN WEBMUS U ON U.OUSUSR = B.BTHUSR AND U.OUSSID = A.MMIDEN " +
			"WHERE B.BTHUSR = ? " + 
			"UNION " +
			"SELECT B.BTHUSR as ESSUSR, 'C' as ESSTYP, A.CMMSID as ESSSID, " + 
			"A.CMIDEN as ESSIDE, A.CMENDS as ESSDSC, A.CMIMFL as ESSIMG, " + 
			"A.CMTGAD as ESSTAD, A.CMTGPO as ESSTPO " +
			"FROM WEBCM A " +
			"LEFT JOIN CNTRLBTH B ON B.BTHLAN = A.CMILIF " +
			"INNER JOIN WEBMUS U ON U.OUSUSR = B.BTHUSR AND U.OUSSID = A.CMMSID AND U.OUSDEN = A.CMIDEN " +
			"WHERE B.BTHUSR = ? " +			
			"ORDER BY ESSSID, ESSIDE";
		return sql;
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOViewSuper#getFindArguments(com.datapro.access.Key)
	 */
	protected Object[] getFindArguments(Key arg0) {
		WEBMMKEYViewByUser key =
			(WEBMMKEYViewByUser) arg0;
		Object[] args = { key.getBTHUSR(), key.getBTHUSR(), key.getBTHUSR(), key.getBTHUSR() };
		return args;
	}
}

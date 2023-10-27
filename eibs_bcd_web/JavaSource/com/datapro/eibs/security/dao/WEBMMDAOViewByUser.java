package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.security.key.WEBMMKEYViewByUser;

public class WEBMMDAOViewByUser extends DAOViewSuper {

	protected Object[] getFindArguments(Key keyObj) {
		WEBMMKEYViewByUser key =
			(WEBMMKEYViewByUser) keyObj;
		Object[] args = { key.getBTHUSR(), key.getBTHUSR() };
		return args;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		// TODO Auto-generated method stub
		return null;
	}

	protected String getFindByPrimaryKeySql() {
		// TODO Auto-generated method stub
		return null;
	}

	protected String getFindSql() {
		String sql = "SELECT B.BTHUSR as ESSUSR, 'M' as ESSTYP, A.MMIDEN as ESSSID, " + 
			"' ' as ESSIDE, A.MMENDS as ESSDSC, ' ' as ESSIMG, ' ' as ESSTAD, ' ' as ESSTPO " +
			"FROM WEBMM A " +
			"RIGHT JOIN CNTRLBTH B ON B.BTHLAN = A.MMILIF " +
			"WHERE B.BTHUSR = ? " + 
			"UNION " +
			"SELECT B.BTHUSR as ESSUSR, 'C' as ESSTYP, A.CMMSID as ESSSID, " + 
			"A.CMIDEN as ESSIDE, A.CMENDS as ESSDSC, A.CMIMFL as ESSIMG, " + 
			"A.CMTGAD as ESSTAD, A.CMTGPO as ESSTPO " +
			"FROM WEBCM A " +
			"RIGHT JOIN CNTRLBTH B ON B.BTHLAN = A.CMILIF " +
			"WHERE B.BTHUSR = ? " +
			"ORDER BY ESSSID, ESSIDE";
		return sql;
	}

}

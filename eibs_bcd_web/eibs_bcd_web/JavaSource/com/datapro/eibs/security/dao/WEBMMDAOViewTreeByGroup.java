package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuperExt;
import com.datapro.eibs.security.key.WEBMMKEYViewTreeByGroup;

/**
 * @author erodriguez
 */
public class WEBMMDAOViewTreeByGroup extends DAOViewSuperExt {

	protected Object[] getFindArguments(Key arg0) {
		WEBMMKEYViewTreeByGroup key =
			(WEBMMKEYViewTreeByGroup) arg0;
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
		String sql = "SELECT B.USEUID AS BTHUSR, A.CMMSID, A.CMIDEN, A.CMILIF, A.CMENDS, " +
				"CASE WHEN G.OGRUSR IS NULL THEN 'N' ELSE 'S' END AS CMISTS " +
				"FROM WEBCM A " +
				"LEFT JOIN USERSL1 B ON B.USEUID = ? " +
				"LEFT JOIN WEBMGR G ON G.OGRUSR = B.USEUID AND G.OGRSID = A.CMMSID AND G.OGRDEN = A.CMIDEN " +
				"WHERE CMMSID = ? " +
				"ORDER BY CMMSID, CMIDEN";
		return sql;
	}

}

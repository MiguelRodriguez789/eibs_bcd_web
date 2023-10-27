package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuperExt;
import com.datapro.eibs.security.key.WEBCOKEYViewTreeByGroup;

/**
 * @author erodriguez
 */
public class WEBCODAOViewTreeByGroup extends DAOViewSuperExt {

	protected Object[] getFindArguments(Key arg0) {
		WEBCOKEYViewTreeByGroup key =
			(WEBCOKEYViewTreeByGroup) arg0;
		Object[] args = { key.getBTHUSR(), key.getCMOSID() };
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
		String sql = "SELECT B.USEUID AS BTHUSR, A.CMOSID, A.CMODEN, A.CMOLIF, A.CMONDS, " +
				"CASE WHEN G.OGRUSR IS NULL THEN 'N' ELSE 'S' END AS CMOSTS, " +
				"'RW' AS CMORWS " +
				"FROM WEBCO A " +
				"LEFT JOIN USERSL1 B ON B.USEUID = ? " +
				"LEFT JOIN WEBOG G ON G.OGRUSR = B.USEUID AND G.OGRSID = A.CMOSID AND G.OGRDEN = A.CMODEN " +
				"WHERE A.CMOSID = ? " +
				"ORDER BY CMOSID, CMODEN, CMOSEQ";
		return sql;
	}

}

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
import com.datapro.eibs.security.key.WEBCOKEYViewByUser;

public class WEBCODAOViewByUserSecurity extends DAOViewSuper {

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
		String sql = "SELECT A.* " +
			"FROM WEBCO A " +
			"LEFT JOIN CNTRLBTH B ON B.BTHLAN = A.CMOLIF " +
			"INNER JOIN WEBOG G ON G.OGRUSR = B.BTHGRP AND G.OGRSID = A.CMOSID AND G.OGRDEN = A.CMODEN " +
			"WHERE B.BTHUSR = ? AND A.CMOCDE = ? " +
			"UNION " +
			"SELECT A.* " +
			"FROM WEBCO A " +
			"LEFT JOIN CNTRLBTH B ON B.BTHLAN = A.CMOLIF " +
			"INNER JOIN WEBOU U ON U.OUSUSR = B.BTHUSR AND U.OUSSID = A.CMOSID AND U.OUSDEN = A.CMODEN " +
			"WHERE B.BTHUSR = ? AND A.CMOCDE = ? " +
			"ORDER BY CMOSID, CMODEN, CMOSEQ ";
		
		return sql;
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOViewSuper#getFindArguments(com.datapro.access.Key)
	 */
	protected Object[] getFindArguments(Key arg0) {
		WEBCOKEYViewByUser key =
			(WEBCOKEYViewByUser) arg0;
		Object[] args = { key.getBTHUSR(), key.getCMOCDE(), key.getBTHUSR(), key.getCMOCDE() };
		return args;
	}
}

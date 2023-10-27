/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.security.key.WEBCOKEYViewByUser;

/**
 * @author fhernandez
 */
public class WEBCODAOViewByUser extends DAOViewSuper {

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
			"RIGHT JOIN CNTRLBTH B ON B.BTHLAN = A.CMOLIF " +
			"WHERE B.BTHUSR = ? AND A.CMOCDE = ? " +
			"ORDER BY CMOSID, CMODEN, CMOSEQ";
		return sql;
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOViewSuper#getFindArguments(com.datapro.access.Key)
	 */
	protected Object[] getFindArguments(Key arg0) {
		WEBCOKEYViewByUser key =
			(WEBCOKEYViewByUser) arg0;
		Object[] args = { key.getBTHUSR(), key.getCMOCDE()};
		return args;
	}
}

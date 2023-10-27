/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewExtendent;
import com.datapro.eibs.images.key.SCNDOCKEYView;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class SCNDOCDAOView extends DAOViewExtendent {

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOViewSuper#getFindSql()
	 */
	protected String getFindSql() {
		String sql = "SELECT TBLPAG, TBLDSC, TBLLMM, TBLLMD, TBLLMY, TBLSSQ, IMGUID, IMGBIN, IMGLEN " +
					 "FROM SCNDOCTBL " +
					 "INNER JOIN SCNDOCIMG ON TBLUID=IMGUID " +
					 "WHERE TBLTYP=? AND TBLNUM=? AND TBLTBN=? AND TBLSEQ=?";
		return sql;
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOViewSuper#getFindByPrimaryKeySql()
	 */
	protected String getFindByPrimaryKeySql() {
		String sql = "SELECT TBLPAG, TBLDSC, TBLLMM, TBLLMD, TBLLMY, TBLSSQ, IMGUID, IMGBIN, IMGLEN " +
					 "FROM SCNDOCTBL " +
					 "INNER JOIN SCNDOCIMG ON TBLUID=IMGUID " +
					 "WHERE TBLUID=?";
		return sql;
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOViewSuper#getFindByPrimaryKeyArguments(com.datapro.access.Key)
	 */
	protected Object[] getFindByPrimaryKeyArguments(Key arg0) {
		SCNDOCKEYView key = (SCNDOCKEYView) arg0;
		Object[] args = { key.getValue(0) };
		return args;
	}

}

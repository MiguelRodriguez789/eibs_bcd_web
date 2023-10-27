/*
 * Created on Jul 10, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewExtendent;
import com.datapro.eibs.images.key.SCNIMGKEYView;

/**
 * @author fhernandez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class SCNIMGDAOViewInquiry extends DAOViewExtendent {

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOViewSuper#getFindSql()
	 */
	protected String getFindSql() {
		String sql = "SELECT TBLPAG, TBLDSC, TBLLMM, TBLLMD, TBLLMY, TBLSSQ, TBLUID, IMGLEN, TBLSTS  " +
					 "FROM SCNDOCTBL " +
					 "INNER JOIN SCNDOCIMG ON TBLUID=IMGUID " +
					 "WHERE TBLTYP=? AND TBLNUM=? AND TBLTBN=? AND TBLSEQ=? " +
					 "	AND (TBLSTS = 'A' OR TBLSTS IS NULL) " +
					 "ORDER BY TBLNUM, TBLTBN, TBLSSQ DESC, TBLPAG";
		return sql;
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOViewSuper#getFindByPrimaryKeySql()
	 */
	protected String getFindByPrimaryKeySql() {
		String sql = "SELECT TBLPAG, TBLDSC, TBLLMM, TBLLMD, TBLLMY, TBLSSQ, IMGBIN, IMGLEN, TBLSTS " +
					 "FROM SCNDOCTBL " +
					 "INNER JOIN SCNDOCIMG ON TBLUID=IMGUID " +
					 "WHERE TBLUID=? AND (TBLSTS = 'A' OR TBLSTS IS NULL) ";
		return sql;
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOViewSuper#getFindByPrimaryKeyArguments(com.datapro.access.Key)
	 */
	protected Object[] getFindByPrimaryKeyArguments(Key arg0) {
		SCNIMGKEYView key = (SCNIMGKEYView) arg0;
		Object[] args = { key.getValue(0) };
		return args;
	}

}

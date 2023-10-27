package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.images.key.SCNDOCTBLKEYViewCount;

/**
 * 
 *
 */
public class SCNDOCTBLDAOViewCount extends DAOViewSuper {

	protected String getFindSql() {
		String sql = null;
		return sql;
	}

	protected Object[] getFindArguments(Key keyObj) {
		Object[] args = null;
		return args;
	}

	protected String getFindByPrimaryKeySql() {
		String sql = "  SELECT COUNT(*) AS COUNTER " + 
					 "	FROM SCNDOCTBL " +
					 "	WHERE TBLTYP = ? AND TBLNUM =  ? AND TBLTBN = ? AND TBLSEQ = ? AND TBLSTS IN ('A', 'D')";
		return sql;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		SCNDOCTBLKEYViewCount key = (SCNDOCTBLKEYViewCount) keyObj;
		Object[] args = {key.getTBLTYP(), key.getTBLNUM(), key.getTBLTBN(), key.getTBLSEQ()};
		return args;
	}

}
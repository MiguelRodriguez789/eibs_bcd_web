package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.images.key.SCNDOCTBLKEYViewLastSequence;

/**
 * 
 *
 */
public class SCNDOCTBLDAOViewLastSequence extends DAOViewSuper {

	protected String getFindSql() {
		String sql = null;
		return sql;
	}

	protected Object[] getFindArguments(Key keyObj) {
		Object[] args = null;
		return args;
	}

	protected String getFindByPrimaryKeySql() {
		String sql = "SELECT MAX(TBLSSQ) AS TBLSSQ, MAX(TBLPAG) AS TBLPAG " +
			"FROM (SELECT TBLSSQ, TBLPAG FROM SCNDOCTBL " +
			"	WHERE TBLSSQ IN (SELECT MAX(TBLSSQ) FROM SCNDOCTBL " +
			"	WHERE TBLTYP = ? AND TBLNUM = ? AND TBLTBN = ? AND TBLSEQ = ? )) A";
		return sql;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		SCNDOCTBLKEYViewLastSequence key = (SCNDOCTBLKEYViewLastSequence) keyObj;
		Object[] args = {key.getTBLTYP(), key.getTBLNUM(), key.getTBLTBN(), key.getTBLSEQ()};
		return args;
	}

}
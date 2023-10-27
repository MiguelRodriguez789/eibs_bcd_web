package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.images.key.SCNIMGKEYViewSignatureRules;

public class SCNIMGDAOViewSignatureRules extends DAOViewSuper {

	protected String getSQL() {
		String sql = "SELECT TBLSSQ,TBLNUM, TBLDSC, TBLUID, TBLLMM, TBLLMD, TBLLMY " 
				+ "FROM SCNDOCTBL  "
				+ "INNER JOIN SCNDOCIMG ON TBLUID = IMGUID ";
		return sql;
	}
	
	@Override
	protected String getFindSql() {
		String sql = getSQL() + "WHERE TBLTYP = ? AND TBLNUM = ? AND TBLDTY = ? AND TBLSSQ = ? AND TBLSTS = 'A'";
		return sql;
	}

	@Override
	protected Object[] getFindArguments(Key keyObj) {
		SCNIMGKEYViewSignatureRules key = (SCNIMGKEYViewSignatureRules) keyObj;
		Object[] args = { key.getTBLTYP(), key.getTBLNUM(), key.getTBLDTY(), key.getTBLSSQ() };
		return args;
	}

	@Override
	protected String getFindByPrimaryKeySql() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		// TODO Auto-generated method stub
		return null;
	}

}

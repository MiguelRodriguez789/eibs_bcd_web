/*
 * Created on Jul 5, 011 by fhernandez
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.security.key.CNTRLBTHKEYViewUsers;

/**
 * @author fhernandez
 *
 */
public class CNTRLBTHDAOViewUsers extends DAOViewSuper {

	protected String getFindSql() {
		String sql = 
			"SELECT BTHGRP, BTHUSR " +
			"FROM CNTRLBTH " +
			"WHERE BTHGRP LIKE ? AND BTHUSR LIKE ? " +
			"ORDER BY BTHGRP, BTHUSR";
		return sql;
	}

	protected Object[] getFindArguments(Key keyObj) {
		CNTRLBTHKEYViewUsers key = (CNTRLBTHKEYViewUsers) keyObj;
		Object[] args = {
				key.getBTHGRP() == null ? "%" : key.getBTHGRP()+"%",
				(key.getBTHUSR() == null ? "%" : key.getBTHUSR()+"%")};
		return args;
	}

	protected String getFindByPrimaryKeySql() {
		String sql = 
			"SELECT BTHGRP, BTHUSR " +
			"FROM CNTRLBTH " +
			"WHERE BTHUSR = ? ";
		return sql;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		CNTRLBTHKEYViewUsers key = (CNTRLBTHKEYViewUsers) keyObj;
		Object[] args = { key.getBTHUSR() };
		return args;
	}
}
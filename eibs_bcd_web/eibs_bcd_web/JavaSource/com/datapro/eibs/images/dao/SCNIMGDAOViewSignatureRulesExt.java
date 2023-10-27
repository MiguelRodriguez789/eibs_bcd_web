package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.images.key.SCNIMGKEYViewSignatureRulesExt;

public class SCNIMGDAOViewSignatureRulesExt extends SCNIMGDAOViewSignatureRules {

	@Override
	protected String getFindSql() {
		String sql = super.getFindSql() + " AND (TBLIDT IS NOT NULL AND TBLIDT <= ?) AND (TBLEDT IS NULL OR TBLEDT >= ?)";
		return sql;
	}

	@Override
	protected Object[] getFindArguments(Key keyObj) {
		SCNIMGKEYViewSignatureRulesExt key = (SCNIMGKEYViewSignatureRulesExt) keyObj;
		Object[] args = { key.getTBLTYP(), key.getTBLNUM(), key.getTBLDTY(), key.getTBLSSQ(), key.getTBLIDT(), key.getTBLEDT() };
		return args;
	}

}

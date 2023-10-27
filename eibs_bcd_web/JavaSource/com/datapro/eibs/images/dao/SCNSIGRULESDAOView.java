package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.images.key.SCNSIGRULESKEYView;

public class SCNSIGRULESDAOView extends DAOViewSuper {

	@Override
	protected String getFindSql() {
		String sql = "SELECT RULEUID, DAYFROM, MONTHFROM, YEARFROM, DAYTO, MONTHTO, YEARTO, AMOUNT, STATUS, SIGRULE "
				+ "FROM SCNSIGRULES "
				+ "WHERE ACCUID = ?";
		return sql;
	}

	@Override
	protected Object[] getFindArguments(Key keyObj) {
		SCNSIGRULESKEYView key = (SCNSIGRULESKEYView) keyObj;
		Object[] args = { key.getACCUID() };
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

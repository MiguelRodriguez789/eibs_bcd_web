package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.security.key.WEBMOKEYViewByDescription;

public class WEBMODAOViewByDescription extends DAOViewSuper {

	@Override
	protected String getFindSql() {
		String sql = 
				"SELECT DISTINCT CMOSID "
				+ "FROM WEBCO "
				+ "WHERE CMONDS LIKE ? ";
			return sql;
	}

	@Override
	protected Object[] getFindArguments(Key keyObj) {
		WEBMOKEYViewByDescription key = (WEBMOKEYViewByDescription) keyObj;
		Object[] args = {
				key.getCMONDS() == null ? "%" : key.getCMONDS()+"%"};
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

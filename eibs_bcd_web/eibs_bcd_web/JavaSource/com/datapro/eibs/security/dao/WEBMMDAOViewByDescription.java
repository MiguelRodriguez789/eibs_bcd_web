package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.security.key.WEBMMKEYViewByDescription;

public class WEBMMDAOViewByDescription extends DAOViewSuper {

	@Override
	protected String getFindSql() {
		String sql = 
				"SELECT DISTINCT CMMSID "
				+ "FROM WEBCM "
				+ "WHERE CMENDS LIKE ? ";
			return sql;
	}

	@Override
	protected Object[] getFindArguments(Key keyObj) {
		WEBMMKEYViewByDescription key = (WEBMMKEYViewByDescription) keyObj;
		Object[] args = {
				key.getCMENDS() == null ? "%" : key.getCMENDS()+"%"};
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

package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuperExt;
import com.datapro.eibs.security.key.USERSKEYViewByGroup;

public class USERSDAOViewByGroup extends DAOViewSuperExt {

	protected Object[] getFindArguments(Key keyObj) {
		// TODO Auto-generated method stub
		return null;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		USERSKEYViewByGroup key = (USERSKEYViewByGroup) keyObj;
		Object[] args = { key.getUSEUID() };
		return args;
	}

	protected String getFindByPrimaryKeySql() {
		String sql = "SELECT * " +
			"FROM USERS " +
			"WHERE USEMNM = ' ' AND USEUID = ? " +
			"ORDER BY USEUID";
		return sql;
	}

	protected String getFindSql() {
		String sql = "SELECT * " +
			"FROM USERS " +
			"WHERE USEMNM = ' ' " +
			"ORDER BY USEUID";
		return sql;
	}

}

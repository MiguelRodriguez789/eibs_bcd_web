package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.security.key.HOLYDKEYView;

public class HOLYDDAOView extends DAOViewSuper {

	protected Object[] getFindArguments(Key keyObj) {
		HOLYDKEYView key = (HOLYDKEYView) keyObj;
		Object[] args = { key.getHOLCTR() };
		return args;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		HOLYDKEYView key = (HOLYDKEYView) keyObj;
		Object[] args = { key.getHOLDAY(), key.getHOLDAM(), key.getHOLDAD() };
		return args;
	}

	protected String getFindByPrimaryKeySql() {
		String sql = "SELECT HOLDAY, HOLDAM, HOLDAD " 
				+ "FROM HOLYD "
				+ "INNER JOIN CNTRLCNT "
				+ "ON CNTCTR = HOLCTR "
				+ "WHERE HOLDAY = ? AND HOLDAM = ? AND HOLDAD = ?";
			
		return sql;
	}

	protected String getFindSql() {
		String sql = "SELECT HOLDAY, HOLDAM, HOLDAD " 
				+ "FROM HOLYD "
				+ "WHERE HOLCTR = ?";
		
		return sql;
	}


}

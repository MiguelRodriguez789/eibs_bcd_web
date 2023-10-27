/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.reports.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.reports.key.IBSRPTKEYViewModules;

/**
 * @author fhernandez
 */
public class IBSRPTDAOViewModules extends DAOViewSuper {

	protected String getFindSql() {
		String sql = 
			"SELECT DISTINCT IBSMOD "
			+ "FROM IBSRPT "
			+ "WHERE IBSRPN LIKE ? ";
		return sql;
	}

	protected Object[] getFindArguments(Key keyObj) {
		IBSRPTKEYViewModules key = (IBSRPTKEYViewModules) keyObj;
		Object[] args = {
				key.getIBSRPN() == null ? "%" : key.getIBSRPN()+"%"};
		return args;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key arg0) {
		return null;
	}

	protected String getFindByPrimaryKeySql() {
		return null;
	}
}

package com.datapro.eibs.teller.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.teller.key.ATTELLUSERSKEYViewByName;

public class ATTELLUSERSDAOViewByName extends DAOViewSuper {

	protected Object[] getFindArguments(Key arg0) {
		// TODO Auto-generated method stub
		ATTELLUSERSKEYViewByName key = (ATTELLUSERSKEYViewByName) arg0;
		
		return new Object[]{key.getUSERNAME()+"%"};
	}

	protected Object[] getFindByPrimaryKeyArguments(Key arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	protected String getFindByPrimaryKeySql() {
		// TODO Auto-generated method stub
		return null;
	}

	protected String getFindSql() {
		// TODO Auto-generated method stub
		return "SELECT * FROM ATTELLUSERS " +
				"WHERE USERNAME LIKE ? ";
	}

	
}
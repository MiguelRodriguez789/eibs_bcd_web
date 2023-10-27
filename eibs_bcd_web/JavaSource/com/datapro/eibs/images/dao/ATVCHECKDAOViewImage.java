package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.images.key.ATVCHECKKEYViewImage;

public class ATVCHECKDAOViewImage extends DAOViewSuper {

	protected Object[] getFindArguments(Key keyObj) {
		ATVCHECKKEYViewImage key = (ATVCHECKKEYViewImage) keyObj;
		Object[] args = { key.getACCOUNT() };
		return args;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		ATVCHECKKEYViewImage key = (ATVCHECKKEYViewImage) keyObj;
		Object[] args = { key.getACCOUNT(), key.getCHECKNUM() };
		return args;
	}

	protected String getFindByPrimaryKeySql() {
		String sql = "SELECT TOP(1) PRESENTERBANK, SCANDATE, ABANUMBER, ACCOUNT, CHECKNUM, CHECKAMOUNT, IMAGEFRONT, IMAGEBACK " +
		 			 "FROM ATVCHECK " +
		 			 "WHERE CAST(LTRIM(RTRIM(ACCOUNT)) AS NUMERIC(16, 0)) = ? AND CHECKNUM = ?";
		return sql;
	}

	protected String getFindSql() {
		String sql = "SELECT PRESENTERBANK, SCANDATE, ABANUMBER, ACCOUNT, CHECKNUM, CHECKAMOUNT, IMAGEFRONT, IMAGEBACK " +
		 			 "FROM ATVCHECK " +
		 			 "WHERE CAST(ACCOUNT AS DECIMAL(16, 0)) = ? ";
		return sql;
	}

}

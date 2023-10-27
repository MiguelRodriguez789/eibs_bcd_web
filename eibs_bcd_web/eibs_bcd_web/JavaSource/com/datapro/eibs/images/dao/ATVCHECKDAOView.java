package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.images.key.ATVCHECKKEYView;
import com.datapro.eibs.images.md.ATVCHECKMDView;

public class ATVCHECKDAOView extends DAOViewSuper {

	protected Object[] getFindArguments(Key keyObj) {
		ATVCHECKKEYView key = (ATVCHECKKEYView) keyObj;
		ATVCHECKMDView md = new ATVCHECKMDView();
		Object[] args = { formatKeyValue(key.getSCANDATE(), md.getSCANDATE()), 
				formatKeyValue(key.getDOCTYPECODE(), md.getDOCTYPECODE()) };
		return args;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		// TODO Auto-generated method stub
		return null;
	}

	protected String getFindByPrimaryKeySql() {
		// TODO Auto-generated method stub
		return null;
	}

	protected String getFindSql() {
		String sql = "SELECT SCANDATE, DOCTYPECODE, SEQUENCEITEM, PRESENTERBANK, CODEBRANCH, CCYCODE, ABANUMBER, ACCOUNT, CHECKNUM, CHECKAMOUNT, CHECKTYPE, CRAMT, DBAMT " +
					 "FROM ATVCHECK " +
					 "WHERE SCANDATE = ? AND DOCTYPECODE = ? AND MARKINGDIGIT = 0 " +
					 "ORDER BY SEQUENCEITEM";
		return sql;
	}

}

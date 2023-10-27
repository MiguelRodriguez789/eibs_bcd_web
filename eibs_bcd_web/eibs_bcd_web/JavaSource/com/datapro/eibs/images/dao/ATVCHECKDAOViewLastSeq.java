package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.images.key.ATVCHECKKEYViewLastSeq;
import com.datapro.eibs.images.md.ATVCHECKMDViewLastSeq;

public class ATVCHECKDAOViewLastSeq extends DAOViewSuper {

	protected Object[] getFindArguments(Key keyObj) {
		return null;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		ATVCHECKKEYViewLastSeq key = (ATVCHECKKEYViewLastSeq) keyObj;
		ATVCHECKMDViewLastSeq md = new ATVCHECKMDViewLastSeq();
		Object[] args = { formatKeyValue(key.getSCANDATE(), md.getSCANDATE()), 
				formatKeyValue(key.getDOCTYPECODE(), md.getDOCTYPECODE()) };
		return args;
	}

	protected String getFindByPrimaryKeySql() {
		String sql = "SELECT MAX(SEQUENCEITEM) AS SEQUENCEITEM " +
					 "FROM ATVCHECK " +
					 "WHERE SCANDATE = ? AND DOCTYPECODE = ? ";
		return sql;
	}

	protected String getFindSql() {
		return null;
	}

}

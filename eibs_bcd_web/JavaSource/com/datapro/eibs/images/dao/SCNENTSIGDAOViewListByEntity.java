package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.images.key.SCNENTSIGKEYViewListByEntity;
import com.datapro.eibs.images.md.SCNENTSIGMDViewListByEntity;

public class SCNENTSIGDAOViewListByEntity extends DAOViewSuper {

	protected Object[] getFindArguments(Key keyObj) {
		SCNENTSIGKEYViewListByEntity key = (SCNENTSIGKEYViewListByEntity) keyObj;
		SCNENTSIGMDViewListByEntity md = new SCNENTSIGMDViewListByEntity();
		Object[] args = { formatKeyValue(key.getENTTYP(), md.getENTTYP()), 
				key.getENTUID() };
		return args;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		return null;
	}

	protected String getFindByPrimaryKeySql() {
		return null;
	}

	protected String getFindSql() {
		String sql = "SELECT ENTTYP, ENTUID, ENTNAM, ENTSEQ, ENTDSC, ENTLMM, ENTLMD, ENTLMY " +
		 			 "FROM SCNENTSIG " +
		 			 "WHERE ENTTYP = ? AND ENTUID = ? ";
		return sql;
	}

}

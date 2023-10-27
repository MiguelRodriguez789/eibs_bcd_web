package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.images.key.SCNENTSIGKEYViewLastSeq;
import com.datapro.eibs.images.md.SCNENTSIGMDViewLastSeq;

public class SCNENTSIGDAOViewLastSeq extends DAOViewSuper {

	protected Object[] getFindArguments(Key keyObj) {
		return null;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		SCNENTSIGKEYViewLastSeq key = (SCNENTSIGKEYViewLastSeq) keyObj;
		SCNENTSIGMDViewLastSeq md = new SCNENTSIGMDViewLastSeq();
		Object[] args = { formatKeyValue(key.getENTTYP(), md.getENTTYP()), 
				key.getENTUID() };
		return args;
	}

	protected String getFindByPrimaryKeySql() {
		String sql = "SELECT MAX(ENTSEQ) AS ENTSEQ " +
					 "FROM SCNENTSIG " +
					 "WHERE ENTTYP = ? AND ENTUID = ? ";
		return sql;
	}

	protected String getFindSql() {
		return null;
	}

}

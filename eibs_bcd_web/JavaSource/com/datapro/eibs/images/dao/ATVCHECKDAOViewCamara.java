package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.images.key.ATVCHECKKEYViewCamara;
import com.datapro.eibs.images.md.ATVCHECKMDViewCamara;

public class ATVCHECKDAOViewCamara extends DAOViewSuper {

	protected Object[] getFindArguments(Key keyObj) {
		ATVCHECKKEYViewCamara key = (ATVCHECKKEYViewCamara) keyObj;
		ATVCHECKMDViewCamara md = new ATVCHECKMDViewCamara();
		
		Object[] args = { formatKeyValue(key.getSCANDATE(), md.getSCANDATE()) };
		return args;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		return null;
	}

	protected String getFindByPrimaryKeySql() {
		return null;
	}

	protected String getFindSql() {
		String sql = "SELECT SCANDATE, CODEBANK, USERIDPOD, SEQUENCEITEM, TRNSEQ, " +
				     "CODEBRANCH, ABANUMBER, ACCOUNT, CHECKNUM, CHECKAMOUNT, IMAGEFRONT, IMAGEBACK " +
		 			 "FROM ATVCHECK2 " +
		 			 "WHERE SCANDATE = ? AND CAMARA = 'P'";
		return sql;
	}

}

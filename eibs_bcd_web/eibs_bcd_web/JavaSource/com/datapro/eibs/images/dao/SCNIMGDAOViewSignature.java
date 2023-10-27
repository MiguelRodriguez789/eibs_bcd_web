package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.images.key.SCNIMGKEYView;
import com.datapro.eibs.images.key.SCNIMGKEYViewSignature;
import com.datapro.eibs.images.md.SCNIMGMDViewSignature;

public class SCNIMGDAOViewSignature extends DAOViewSuper {

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		SCNIMGKEYView key = (SCNIMGKEYView) keyObj;
		Object[] args = { key.getValue(0),key.getValue(1),key.getValue(2), key.getValue(3) };
		return args;
	}


	protected String getFindSql() {
		String sql = "SELECT TBLPAG, TBLDSC, TBLLMM, TBLLMD, TBLLMY, TBLSSQ, TBLUID, IMGLEN, TBLSTS  " +
					 "FROM SCNDOCTBL " +
					 "INNER JOIN SCNDOCIMG ON TBLUID=IMGUID " +
					 "WHERE TBLTYP=? AND TBLNUM=? AND TBLDTY=? AND TBLSTS = 'A'" +
					 "ORDER BY TBLSSQ DESC";
		return sql;
	}

	protected String getFindByPrimaryKeySql() {
		String sql = "SELECT TBLSSQ,TBLNUM, TBLDSC, TBLRUL, TBLUID, TBLLMM, TBLLMD, TBLLMY, IMGLEN, RULEUID  "+
					 "FROM SCNDOCTBL  " + 
					 "INNER JOIN SCNDOCIMG ON TBLUID=IMGUID  " +
					 "INNER JOIN SCNSIGRULES ON ACCUID=TBLNUM AND SIGRULE=TBLRUL AND STATUS='1'  "+
					 "WHERE TBLTYP=? AND TBLNUM=? AND TBLDTY=? AND TBLSSQ =? AND TBLSTS='A'";
		return sql;
	}

	protected Object[] getFindArguments(Key keyObj) {
		SCNIMGKEYView key = (SCNIMGKEYView) keyObj;
		Object[] args = { key.getValue(0),key.getValue(1),key.getValue(2) };
		return args;
	}

}

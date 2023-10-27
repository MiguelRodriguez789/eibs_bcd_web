package com.datapro.eibs.teller.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.teller.key.ATTELLUSERSKEYViewLastBranchSeq;

public class ATTELLUSERSDAOViewLastBranchSeq extends DAOViewSuper {

	protected Object[] getFindArguments(Key arg0) {
		ATTELLUSERSKEYViewLastBranchSeq key = (ATTELLUSERSKEYViewLastBranchSeq) arg0;		
		return new Object[]{key.getCODEBANK(), key.getCODEBRANCH(), key.getCODEBANK(), key.getCODEBRANCH()};
	}

	protected Object[] getFindByPrimaryKeyArguments(Key arg0) {
		ATTELLUSERSKEYViewLastBranchSeq key = (ATTELLUSERSKEYViewLastBranchSeq) arg0;		
		return new Object[]{key.getCODEBANK(), key.getCODEBRANCH(), key.getCODEBANK(), key.getCODEBRANCH()};
	}

	protected String getFindByPrimaryKeySql() {
		return 
			"SELECT MAX(CROW) AS REFPREFIX FROM " +
 			"	(SELECT COUNT(*) AS CROW, A.REFPREFIX FROM " +
 			"		(SELECT REFPREFIX FROM ATTELLUSERS WHERE CODEBANK = ? AND CODEBRANCH = ?) A, " +
 			"		(SELECT REFPREFIX FROM ATTELLUSERS WHERE CODEBANK = ? AND CODEBRANCH = ?) B " +
 			"	WHERE A.REFPREFIX >= B.REFPREFIX  " +
 			"	GROUP BY A.REFPREFIX) T " +
 			"WHERE CROW = REFPREFIX";
	}

	protected String getFindSql() {
		return
			"SELECT MAX(CROW) AS REFPREFIX FROM " +
 			"	(SELECT COUNT(*) AS CROW, A.REFPREFIX FROM " +
 			"		(SELECT REFPREFIX FROM ATTELLUSERS WHERE CODEBANK = ? AND CODEBRANCH = ?) A, " +
 			"		(SELECT REFPREFIX FROM ATTELLUSERS WHERE CODEBANK = ? AND CODEBRANCH = ?) B " +
 			"	WHERE A.REFPREFIX >= B.REFPREFIX  " +
 			"	GROUP BY A.REFPREFIX) T " +
 			"WHERE CROW = REFPREFIX";
	}

	
}
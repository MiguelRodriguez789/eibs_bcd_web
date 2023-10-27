package com.datapro.eibs.images.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.images.key.SCANCHECKKEYView;
import com.datapro.eibs.images.md.SCANCHECKMDView;

public class SCANCHECKDAOView extends DAOViewSuper {

	protected Object[] getFindArguments(Key keyObj) {
		SCANCHECKKEYView key = (SCANCHECKKEYView) keyObj;
		SCANCHECKMDView md = new SCANCHECKMDView();
		Object[] args = { formatKeyValue(key.getACCOUNT(), md.getACCOUNT()) };
		return args;
	}

	protected Object[] getFindByPrimaryKeyArguments(Key keyObj) {
		SCANCHECKKEYView key = (SCANCHECKKEYView) keyObj;
		SCANCHECKMDView md = new SCANCHECKMDView();
		Object[] args = { formatKeyValue(key.getACCOUNT(), md.getACCOUNT()), 
				formatKeyValue(key.getSERIE(), md.getSERIE()) };
		return args;
	}

	protected String getFindByPrimaryKeySql() {
		String sql = "SELECT SCANDATE, ABA, ACCOUNT, SERIE, AMOUNT, IMAGE, BACKIMG " +
					 "FROM SCANCHECK " +
					 "WHERE ISNUMERIC(ACCOUNT) = 1 AND CAST(ACCOUNT AS DECIMAL(12, 0)) = ? AND CAST(SERIE AS DECIMAL(9, 0)) = ? ";
		return sql;
	}

	protected String getFindSql() {
		String sql = "SELECT SCANDATE, ABA, ACCOUNT, SERIE, AMOUNT, IMAGE, BACKIMG " +
					 "FROM SCANCHECK " +
					 "WHERE ISNUMERIC(ACCOUNT) = 1 AND CAST(ACCOUNT AS DECIMAL(12, 0)) = ? " +
					 "ORDER BY SCANDATE, SERIE";
		return sql;
	}

}

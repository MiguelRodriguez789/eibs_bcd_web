package com.datapro.eibs.security.dao;

import com.datapro.access.Key;
import com.datapro.eibs.access.DAOViewSuper;
import com.datapro.eibs.constants.Reports;
import com.datapro.eibs.security.key.GRPRPTKEYViewReportsChecked;

public class GRPRPTDAOViewReportsChecked extends DAOViewSuper {

	protected Object[] getFindArguments(Key keyObj) {
		GRPRPTKEYViewReportsChecked key = (GRPRPTKEYViewReportsChecked) keyObj;
		Object[] args = { 
				key.getUSRUID(),
				key.getIBSLIF() == null ? "%" : key.getIBSLIF(),
				key.getIBSMOD() == null ? "%" : key.getIBSMOD(),
				key.getIBSRPN() == null ? "%" : key.getIBSRPN()+"%",
				key.getIBSPER() == null ? "%" : key.getIBSPER()};
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
		String sql =
			"SELECT RP.*, SG.USRRPN AS CHECKED, '' AS DISABLED " +
			"FROM IBSRPT RP " +
			"LEFT JOIN GRPRPT SG ON RP.IBSRPN=SG.USRRPN AND SG.USRUID = ? " +
			"WHERE RP.IBSLIF LIKE ? AND RP.IBSMOD LIKE ? AND RP.IBSRPN LIKE ? AND " +
			"	(RP.IBSPER LIKE ? OR RP.IBSPER='" + Reports.REPORT_PERIOD_ANY + "') " +
			"ORDER BY RP.IBSMOD, RP.IBSRPN";
		return sql;
	}

}

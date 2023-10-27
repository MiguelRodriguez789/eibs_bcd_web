package com.datapro.eibs.images.dao;

import com.datapro.eibs.access.DAOExtendent;
import com.datapro.eibs.images.vo.PROCESS;

public class PROCESSDAO extends DAOExtendent {

	protected boolean checkDataIntegrity(Object vo, Object bean) {
		// TODO Auto-generated method stub
		return true;
	}

	protected String getFindSql() {
		// TODO Auto-generated method stub
		return null;
	}

	protected void initAuditFields(Object vo) {
		((PROCESS) vo).setPROTMS(this.timestamp);
		((PROCESS) vo).setPRORDM(this.getMonth());
		((PROCESS) vo).setPRORDD(this.getDay());
		((PROCESS) vo).setPRORDY(this.getYear());
		((PROCESS) vo).setPROUSR(this.user);
	}

}

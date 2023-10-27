package com.datapro.eibs.security.dao;

import com.datapro.eibs.access.DAOSuper;
import com.datapro.eibs.security.vo.WEBOG;

public class WEBOGDAO extends DAOSuper {

	protected void initAuditFields(Object vo) {
		
		if (vo != null) {
			//((WEBOG)vo).setOGRLMM(month);
			//((WEBOG)vo).setOGRLMD(day);
			//((WEBOG)vo).setOGRLMY(year);
			((WEBOG)vo).setOGRLMT(timestamp);
			((WEBOG)vo).setOGRLMU(user);
		}
	}
}

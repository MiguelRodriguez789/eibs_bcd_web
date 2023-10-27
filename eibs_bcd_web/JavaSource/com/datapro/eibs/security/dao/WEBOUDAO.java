package com.datapro.eibs.security.dao;

import com.datapro.eibs.access.DAOSuper;
import com.datapro.eibs.security.vo.WEBOU;

public class WEBOUDAO extends DAOSuper {

	protected void initAuditFields(Object vo) {
		
		if (vo != null) {
			((WEBOU)vo).setOUSLMM(month);
			((WEBOU)vo).setOUSLMD(day);
			((WEBOU)vo).setOUSLMY(year);
			((WEBOU)vo).setOUSLMT(timestamp);
			((WEBOU)vo).setOUSLMU(user);
		}	
	}
}

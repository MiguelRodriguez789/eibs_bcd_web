package com.datapro.eibs.security.dao;

import com.datapro.eibs.access.DAOSuper;
import com.datapro.eibs.security.vo.WEBMUS;

public class WEBMUSDAO extends DAOSuper {

	protected void initAuditFields(Object vo) {
		
		if (vo != null) {
			((WEBMUS)vo).setOUSLMM(month);
			((WEBMUS)vo).setOUSLMD(day);
			((WEBMUS)vo).setOUSLMY(year);
			((WEBMUS)vo).setOUSLMT(timestamp);
			((WEBMUS)vo).setOUSLMU(user);
		}	
	}
}

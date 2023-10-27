package com.datapro.eibs.security.dao;

import com.datapro.eibs.access.DAOSuper;
import com.datapro.eibs.security.vo.WEBMGR;

public class WEBMGRDAO extends DAOSuper {

	protected void initAuditFields(Object vo) {
		
		if (vo != null) {
			((WEBMGR)vo).setOGRLMM(month);
			((WEBMGR)vo).setOGRLMD(day);
			((WEBMGR)vo).setOGRLMY(year);
			((WEBMGR)vo).setOGRLMT(timestamp);
			((WEBMGR)vo).setOGRLMU(user);
		}
	}
}

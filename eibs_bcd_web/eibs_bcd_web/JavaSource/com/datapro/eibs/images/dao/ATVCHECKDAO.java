package com.datapro.eibs.images.dao;

import com.datapro.eibs.access.DAOExtendent;
import com.datapro.eibs.images.vo.ATVCHECK;

public class ATVCHECKDAO extends DAOExtendent {

	protected boolean checkDataIntegrity(Object vo, Object bean) {
		// TODO Auto-generated method stub
		return true;
	}

	protected String getFindSql() {
		// TODO Auto-generated method stub
		return null;
	}

	protected void initAuditFields(Object vo) {
		((ATVCHECK) vo).setCODEBANK("0001");
		((ATVCHECK) vo).setCODEBRANCH("000001");
		((ATVCHECK) vo).setUSERIDPOD("EIBS");
		((ATVCHECK) vo).setDOCTYPECODE("9999");
		((ATVCHECK) vo).setSEQUENCHK("000001");
		((ATVCHECK) vo).setSTATUS("0");
		((ATVCHECK) vo).setCCYCODE("0000");
		((ATVCHECK) vo).setMARKINGDIGIT("0");
		((ATVCHECK) vo).setUSERID(this.user);
	}

}

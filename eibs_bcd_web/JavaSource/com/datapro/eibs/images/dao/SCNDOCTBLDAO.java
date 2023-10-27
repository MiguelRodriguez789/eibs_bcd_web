/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.images.dao;

import com.datapro.eibs.access.DAOExtendent;
import com.datapro.eibs.images.vo.SCNDOCTBL;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class SCNDOCTBLDAO extends DAOExtendent {

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOExtendent#setAuditVar(java.lang.Object)
	 */
	protected void initAuditFields(Object vo) {
		((SCNDOCTBL) vo).setTBLTMS(this.timestamp);
		((SCNDOCTBL) vo).setTBLLMM(this.getMonth());
		((SCNDOCTBL) vo).setTBLLMD(this.getDay());
		((SCNDOCTBL) vo).setTBLLMY(this.getYear());
		((SCNDOCTBL) vo).setTBLLMU(this.user);
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOExtendent#checkDataIntegrity(java.lang.Object, java.lang.Object)
	 */
	protected boolean checkDataIntegrity(Object vo, Object bean) {
		// TODO Auto-generated method stub
		return true;
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOExtendent#getFindSql()
	 */
	protected String getFindSql() {
		// TODO Auto-generated method stub
		return null;
	}

}

/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.images.dao;

import com.datapro.eibs.access.DAOExtendent;
import com.datapro.eibs.images.vo.SCNDOCIMG;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class SCNDOCIMGDAO extends DAOExtendent {

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOExtendent#setAuditVar(java.lang.Object)
	 */
	protected void initAuditFields(Object vo) {
		((SCNDOCIMG) vo).setIMGTMS(this.timestamp);
		((SCNDOCIMG) vo).setIMGLMM(this.getMonth());
		((SCNDOCIMG) vo).setIMGLMD(this.getDay());
		((SCNDOCIMG) vo).setIMGLMY(this.getYear());
		((SCNDOCIMG) vo).setIMGLMU(this.user);
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOExtendent#checkDataIntegrity(java.lang.Object, java.lang.Object)
	 */
	protected boolean checkDataIntegrity(Object vo, Object bean) {
		// TODO Auto-generated method stub
		return false;
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOExtendent#getFindSql()
	 */
	protected String getFindSql() {
		// TODO Auto-generated method stub
		return null;
	}

}

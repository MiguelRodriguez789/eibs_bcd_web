/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.ValueObject;
import com.datapro.eibs.access.DAOSuper;
import com.datapro.eibs.security.vo.WEBMGRExtAddAllMenu;
import com.datapro.exception.DAOException;

/**
 * @author fhernandez
 */
public class WEBMGRDAOExtAddAllMenu extends DAOSuper {

	public int insert(ValueObject vo) throws DAOException {
		WEBMGRExtAddAllMenu bean = (WEBMGRExtAddAllMenu) vo;
		
		String sql = 
			"INSERT INTO WEBMGR (OGRUSR, OGRSID, OGRDEN, OGRLIF, OGRLMM, OGRLMD, OGRLMY, OGRLMT, OGRLMU) " +
			"SELECT '" + bean.getOGRUSR() + "', CMMSID, CMIDEN, CMILIF, " + 
			"'" + bean.getOGRLMM() + "', " +
			"'" + bean.getOGRLMD() + "', " +
			"'" + bean.getOGRLMY() + "', CURRENT TIMESTAMP, " +
			"'" + getUser() + "' " +
			"FROM WEBCM WHERE CMILIF = '" + bean.getOGRLIF() + "'";
		
		return super.insertImpl(sql, null);
	}
	
	
}

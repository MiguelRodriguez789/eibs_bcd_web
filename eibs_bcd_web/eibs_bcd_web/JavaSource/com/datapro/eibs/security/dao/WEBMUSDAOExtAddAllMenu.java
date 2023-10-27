/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.ValueObject;
import com.datapro.eibs.access.DAOSuper;
import com.datapro.eibs.security.vo.WEBMUSExtAddAllMenu;
import com.datapro.exception.DAOException;

/**
 * @author fhernandez
 */
public class WEBMUSDAOExtAddAllMenu extends DAOSuper {

	public int insert(ValueObject vo) throws DAOException {
		WEBMUSExtAddAllMenu bean = (WEBMUSExtAddAllMenu) vo;
		
		String sql = 
			"INSERT INTO WEBMUS (OUSUSR, OUSSID, OUSDEN, OUSLIF, OUSLMM, OUSLMD, OUSLMY, OUSLMT, OUSLMU) " +
			"SELECT '" + bean.getOUSUSR() + "', CMMSID, CMIDEN, CMILIF, " + 
			"'" + bean.getOUSLMM() + "', " +
			"'" + bean.getOUSLMD() + "', " +
			"'" + bean.getOUSLMY() + "', CURRENT TIMESTAMP, " +
			"'" + getUser() + "' " +
			"FROM WEBCM WHERE CMILIF = '" + bean.getOUSLIF() + "'";
		
		return super.insertImpl(sql, null);
	}
	
	
}

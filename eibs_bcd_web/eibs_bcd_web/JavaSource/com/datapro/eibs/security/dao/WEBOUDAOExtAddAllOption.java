/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.ValueObject;
import com.datapro.eibs.access.DAOSuper;
import com.datapro.eibs.security.vo.WEBOUExtAddAllOption;
import com.datapro.exception.DAOException;

/**
 * @author fhernandez
 */
public class WEBOUDAOExtAddAllOption extends DAOSuper {

	public int insert(ValueObject vo) throws DAOException {
		WEBOUExtAddAllOption bean = (WEBOUExtAddAllOption) vo;
		
		String sql = 
			"INSERT INTO WEBOU (OUSUSR, OUSSID, OUSDEN, OUSLIF, OUSLMM, OUSLMD, OUSLMY, OUSLMT, OUSLMU) " +
			"SELECT '" + bean.getOUSUSR() + "', CMOSID, CMODEN, CMOLIF, " + 
			"'" + bean.getOUSLMM() + "', " +
			"'" + bean.getOUSLMD() + "', " +
			"'" + bean.getOUSLMY() + "', CURRENT TIMESTAMP, " +
			"'" + getUser() + "' " +
			"FROM WEBCO WHERE CMOLIF = '" + bean.getOUSLIF() + "'";
		
		return super.insertImpl(sql, null);
	}
	
	
}

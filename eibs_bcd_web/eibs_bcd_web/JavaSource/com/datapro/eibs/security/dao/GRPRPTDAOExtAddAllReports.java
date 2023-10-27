/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.security.dao;

import com.datapro.access.ValueObject;
import com.datapro.eibs.access.DAOSuper;
import com.datapro.eibs.security.vo.GRPRPTExtAddAllReports;
import com.datapro.exception.DAOException;

/**
 * @author fhernandez
 */
public class GRPRPTDAOExtAddAllReports extends DAOSuper {

	public int insert(ValueObject vo) throws DAOException {
		GRPRPTExtAddAllReports bean = (GRPRPTExtAddAllReports) vo;
		
		String sql = 
			"INSERT INTO GRPRPT (USRUID, USRRPN) " +
			"SELECT '" + bean.getUSRUID() + "' AS USRUID, IBSRPN AS USRRPN "  +
			"FROM IBSRPT WHERE IBSLIF = '" + bean.getIBSLIF() + "'";
		
		return super.insertImpl(sql, null);
	}
	
	
}

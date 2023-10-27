/*
 * Created on Aug 27, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.access;

import java.util.logging.Logger;

import com.datapro.exception.DAOException;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public abstract class DAOExtendent extends DAOSuper {

	private final static Logger log = Logger.getLogger(DAOExtendent.class.getName());
	
	public int insert(Object[] obj) throws DAOException {
		return super.insertImpl(getFindSql(), (Object[]) obj);
	}

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DISuper#insert(com.datapro.access.ValueObject)
	 */

	public int update(Object[] args) throws DAOException {
		return super.updateImpl(getFindSql(), args);
	}
	
	protected abstract boolean checkDataIntegrity(Object vo, Object bean);
	
	protected abstract String getFindSql();
	
}

/*
 * Created on june 16, 2011 by fhernandez
 */
package com.datapro.eibs.setup.dao;

import com.datapro.access.ValueObject;
import com.datapro.eibs.access.DAORundate;
import com.datapro.eibs.exception.ItemUpdatedByAnotherUser;
import com.datapro.exception.DAOException;

/**
 *
 */
public class CNTRLCNTDAOExtRunDate extends DAORundate {

	public int update(ValueObject vo) throws ItemUpdatedByAnotherUser,
		DAOException {
		throw new DAOException(EXCEPTION_UNIMPLEMENTED_FUNCTION);
	}

	public int insert(ValueObject vo) throws DAOException {
		throw new DAOException(EXCEPTION_UNIMPLEMENTED_FUNCTION);
	}

}
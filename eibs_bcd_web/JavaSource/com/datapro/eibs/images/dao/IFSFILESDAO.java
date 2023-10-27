package com.datapro.eibs.images.dao;

import com.datapro.access.ValueObject;
import com.datapro.eibs.access.DAOSuper;
import com.datapro.eibs.constants.DatabaseAccess;
import com.datapro.eibs.exception.ItemUpdatedByAnotherUser;
import com.datapro.exception.DAOException;


public class IFSFILESDAO extends DAOSuper {

	public int insert(ValueObject arg0) throws DAOException {
		throw new DAOException(DatabaseAccess.EXCEPTION_UNIMPLEMENTED_FUNCTION);
	}

	public int update(ValueObject arg0) throws DAOException, ItemUpdatedByAnotherUser {
		throw new DAOException(DatabaseAccess.EXCEPTION_UNIMPLEMENTED_FUNCTION);
	}
	
}

package com.datapro.eibs.teller.dao;

import com.datapro.access.ValueObject;
import com.datapro.eibs.access.DAOSuper;
import com.datapro.eibs.exception.ItemUpdatedByAnotherUser;
import com.datapro.exception.DAOException;

public class ATTRNTYPEBYTELLUSERSDAO extends DAOSuper {

	public int update(ValueObject bean)
		throws DAOException, ItemUpdatedByAnotherUser {
		throw new DAOException(EXCEPTION_UNIMPLEMENTED_FUNCTION);
	}

}

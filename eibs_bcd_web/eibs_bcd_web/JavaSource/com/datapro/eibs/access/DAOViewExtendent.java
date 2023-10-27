/*
 * Created on Aug 27, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.access;

import com.datapro.access.Key;
import com.datapro.exception.DAOException;
import com.datapro.generic.beanutil.BeanList;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public abstract class DAOViewExtendent extends DAOViewSuper {

	public KeyExtendent keys = new KeyExtendent();

	public BeanList find(Key keyObj) throws DAOException {

		keys = (KeyExtendent) keyObj;
		return super.find(keyObj);
	}

	/**
	 * 
	 */

	/* (non-Javadoc)
	 * @see com.datapro.eibs.access.DAOViewSuper#getFindArguments(com.datapro.access.Key)
	 */
	protected Object[] getFindArguments(Key keyObj) {
		/*
		if ((keyObj != null) && (com.datapro.eibstrade.key.IBSTradeKeys.class.isAssignableFrom(keyObj.getClass()))) {
			keys = ((IBSTradeKeys)keyObj);
		}
		*/
		Object[] args = new Object[keys.getSize()];
		for (int index = 0; index < keys.getSize(); index++) {
			args[index] = keys.getValue(index);
		}
		return args;
	}

	public int delete(String sql, Object[] obj) throws DAOException {
		return super.deleteImpl(sql, obj);
	}

}

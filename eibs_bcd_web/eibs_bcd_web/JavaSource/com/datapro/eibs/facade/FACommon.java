package com.datapro.eibs.facade;

import java.math.BigDecimal;

import com.datapro.eibs.access.DAOFactoryKeys;
import com.datapro.eibs.access.FASuper;
import com.datapro.eibs.access.VOSuper;
import com.datapro.eibs.constants.General;
import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.setup.key.CNTRLCNTKEYExtRunDate;
import com.datapro.eibs.setup.vo.CNTRLCNTExtRunDate;

import datapro.eibs.beans.ESS0030DSMessage;

public class FACommon extends FASuper {
	
	private ESS0030DSMessage sessionUser;
	/**
	 * @return the sessionUser MessageRecord
	 */
	public ESS0030DSMessage getSessionUser() {
		return sessionUser;
	}

	/**
	 * @param sessionUser the sessionUser MessageRecord to set
	 */
	public void setSessionUser(ESS0030DSMessage sessionUser) {
		this.sessionUser = sessionUser;
		String user = getSessionUser().getH01USR();
		if (user != null && !BLANK.equals(user.trim())) {
			setUser(user);
		}
	}

	public String checkBeforeAndAfter(VOSuper vo, String fnRecordType)
			throws FacadeException {
		// TODO Auto-generated method stub
		return null;
	}

	public void monitor(String ouid, String action, Object obj)
			throws FacadeException {
		// TODO Auto-generated method stub

	}

	public String getBankIBSCtr() throws FacadeException {
		String ctr = null;
		CNTRLCNTExtRunDate rDate = null;
		
		setDbConnectionKey(General.DBID_CURRENT_YEAR);
		super.setDaoCreationKey(DAOFactoryKeys.SETUP_CNTRLIBS_EXT_RUN_DATE);
		CNTRLCNTKEYExtRunDate key = new CNTRLCNTKEYExtRunDate();
		key.setCNTBNK(getSessionUser().getE01UBK());
		try {
			rDate = (CNTRLCNTExtRunDate) super.getValue(key);
			ctr = rDate.getCNTINT();
		} catch (ItemNotFoundException e) {
			System.out.println("Error On Method getRunDate()");
			throw new FacadeException(e.toString());
		}
		return ctr;
	}
	
	public CNTRLCNTExtRunDate getRunDate() throws FacadeException {

		CNTRLCNTExtRunDate rDate = null;
		
		setDbConnectionKey(General.DBID_CURRENT_YEAR);
		super.setDaoCreationKey(DAOFactoryKeys.SETUP_CNTRLIBS_EXT_RUN_DATE);
		CNTRLCNTKEYExtRunDate key = new CNTRLCNTKEYExtRunDate();
		key.setCNTBNK(getSessionUser().getE01UBK());
		try {
			rDate = (CNTRLCNTExtRunDate) super.getValue(key);
		} catch (ItemNotFoundException e) {
			System.out.println("Error On Method getRunDate()");
			throw new FacadeException(e.toString());
		}
		return rDate;
	}

	protected BigDecimal bigDecimalParser(String number) {
		
		try {
			return new BigDecimal(number);
		} catch (Exception e) {
			return new BigDecimal("0");
		}
	}

}

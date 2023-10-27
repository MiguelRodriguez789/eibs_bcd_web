package com.datapro.eibs.facade;

import com.datapro.eibs.access.DAOFactoryKeys;
import com.datapro.eibs.access.FASuper;
import com.datapro.eibs.access.VOSuper;
import com.datapro.eibs.constants.General;
import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.exception.ItemUpdatedByAnotherUser;
import com.datapro.eibs.images.key.PROCESSKEY;
import com.datapro.eibs.images.vo.PROCESS;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class FAProcess extends FASuper {
	
	private final static String RUNNIG 	= "A";
	private final static String STOP 	= "C";
	private final static String ERROR 	= "E";
	
	public void register(String uid, String description) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.PROCESS_TABLE);
		
		PROCESS vo = new PROCESS();
		vo.setPROUID(uid);
		vo.setPROSTS(RUNNIG);
		if (description.length() > 30) {
			vo.setPRODSC(description.substring(0, 30));
		} else {
			vo.setPRODSC(description);
		}
		super.insert(vo);
	}
	
	public void kill(String uid) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.PROCESS_TABLE);
		
		PROCESSKEY key = new PROCESSKEY();
		key.setPROUID(uid);
		
		super.delete(key);
	}
	
	public void stop(String uid) throws FacadeException, ItemNotFoundException, ItemUpdatedByAnotherUser {
		super.openTransaction(General.IBS_IMAGE);
		
		try {
			super.setDaoCreationKey(DAOFactoryKeys.PROCESS_TABLE);
			
			PROCESSKEY key = new PROCESSKEY();
			key.setPROUID(uid);
			
			PROCESS vo = (PROCESS) super.getValue(key);
			vo.setPROSTS(STOP);
			super.update(vo);
		} finally {
			super.closeTransaction();
		}
	}
	
	public String result(String uid) throws FacadeException, ItemNotFoundException {
		
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.PROCESS_TABLE);
		
		PROCESSKEY key = new PROCESSKEY();
		key.setPROUID(uid);
		
		PROCESS vo = (PROCESS) super.getValue(key);
		return vo.getPRORES().trim();
	}
	
	public void setResult(String uid, String value) throws FacadeException, ItemUpdatedByAnotherUser, ItemNotFoundException {
		
		super.openTransaction(General.IBS_IMAGE);
		
		try {
			super.setDaoCreationKey(DAOFactoryKeys.PROCESS_TABLE);
			
			PROCESSKEY key = new PROCESSKEY();
			key.setPROUID(uid);
			
			PROCESS vo = (PROCESS) super.getValue(key);
			vo.setPRORES(value);
			super.update(vo);
			
		} finally {	
			super.closeTransaction();
		}	
	}
	
	public void error(String uid) throws FacadeException, ItemNotFoundException, ItemUpdatedByAnotherUser {
		super.openTransaction(General.IBS_IMAGE);
		
		try {
			super.setDaoCreationKey(DAOFactoryKeys.PROCESS_TABLE);
			
			PROCESSKEY key = new PROCESSKEY();
			key.setPROUID(uid);
			
			PROCESS vo = (PROCESS) super.getValue(key);
			vo.setPROSTS(ERROR);
			super.update(vo);
		} finally {
			super.closeTransaction();
		}
	}
	
	public boolean isRunning(String uid) throws FacadeException {
		
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.PROCESS_TABLE);
		
		PROCESSKEY key = new PROCESSKEY();
		key.setPROUID(uid);
		
		try {
			PROCESS vo = (PROCESS) super.getValue(key);
			return vo.getPROSTS().equals(RUNNIG);
		} catch (ItemNotFoundException e) {
			return false;
		}
	}
	

	public boolean hasError(String uid) throws FacadeException {
		
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.PROCESS_TABLE);
		
		PROCESSKEY key = new PROCESSKEY();
		key.setPROUID(uid);
		
		try {
			PROCESS vo = (PROCESS) super.getValue(key);
			return vo.getPROSTS().equals(ERROR);
		} catch (ItemNotFoundException e) {
			return false;
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

}

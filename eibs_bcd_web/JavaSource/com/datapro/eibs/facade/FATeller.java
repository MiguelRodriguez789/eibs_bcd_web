package com.datapro.eibs.facade;

import com.datapro.eibs.access.DAOFactoryKeys;
import com.datapro.eibs.constants.General;
import com.datapro.eibs.exception.DatabaseAccessException;
import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.exception.ItemUpdatedByAnotherUser;
import com.datapro.eibs.images.key.ATVCHECK2KEYReadStatus;
import com.datapro.eibs.images.key.ATVCHECKKEYViewCamara;
import com.datapro.eibs.images.vo.ATVCHECK2ReadStatus;
import com.datapro.eibs.images.vo.ATVCHECKViewCamara;
import com.datapro.eibs.teller.key.ATPARAMETERSKEY;
import com.datapro.eibs.teller.key.ATSHIFTSKEY;
import com.datapro.eibs.teller.key.ATTELLUSERSKEYExtBasic;
import com.datapro.eibs.teller.key.ATTELLUSERSKEYViewByName;
import com.datapro.eibs.teller.key.ATTELLUSERSKEYViewLastBranchSeq;
import com.datapro.eibs.teller.key.ATTRNTYPEBYTELLUSERSKEY;
import com.datapro.eibs.teller.vo.ATTELLUSERSExtBasic;
import com.datapro.eibs.teller.vo.ATTELLUSERSViewLastBranchSeq;
import com.datapro.generic.beanutil.BeanCopier;
import com.datapro.generic.beanutil.BeanList;


public class FATeller extends FACommon {
	
	public int setReadStatus(String scandate) throws FacadeException, ItemUpdatedByAnotherUser {
		
		boolean susceed = false;
		super.openTransaction(General.IBS_TELLER);
		try {
			super.setDaoCreationKey(DAOFactoryKeys.CHK_READER_STATUS_CAMARA);
			ATVCHECK2KEYReadStatus key = new ATVCHECK2KEYReadStatus();
			key.setSCANDATE(scandate);
			BeanList list = super.getList(key);
			if (!list.isEmpty()) {
				list.initRow();
				while (list.getNextRow()) {
					ATVCHECK2ReadStatus vo = (ATVCHECK2ReadStatus) list.getRecord();
					vo.setCAMARA("P");
					super.update(vo);
				}
			}
			susceed = true;
			return list.size();
		} finally {
			if (susceed) {
				super.closeTransaction();
			} else {
				super.cancelTransaction();
			}
		}
		
	}
	
	public int rollbackReadStatus(String scandate) throws FacadeException, ItemUpdatedByAnotherUser {
		
		boolean susceed = false;
		super.openTransaction(General.IBS_TELLER);
		try {
			super.setDaoCreationKey(DAOFactoryKeys.CHK_READER_STATUS_CAMARA);
			ATVCHECK2KEYReadStatus key = new ATVCHECK2KEYReadStatus();
			key.setSCANDATE(scandate);
			BeanList list = super.getList(key);
			if (!list.isEmpty()) {
				list.initRow();
				while (list.getNextRow()) {
					ATVCHECK2ReadStatus vo = (ATVCHECK2ReadStatus) list.getRecord();
					if (vo.getCAMARA().trim().equals("P")) {
						vo.setCAMARA("Y");
						super.update(vo);
					}
				}
			}
			susceed = true;
			return list.size();
		} finally {
			if (susceed) {
				super.closeTransaction();
			} else {
				super.cancelTransaction();
			}
		}
		
	}
	
	public BeanList getCamaraList(String scandate) throws FacadeException {
		
		super.setDbConnectionKey(General.IBS_TELLER);
		super.setDaoCreationKey(
			DAOFactoryKeys.ATVCHECK_CAMARA_VIEW);

		ATVCHECKKEYViewCamara key = new ATVCHECKKEYViewCamara();
		key.setSCANDATE(scandate);

		return super.getList(key);
	}
	
	public int deleteCamaraCheck(String scandate, BeanList list) throws FacadeException {
		
		super.setDbConnectionKey(General.IBS_TELLER);
		super.setDaoCreationKey(
			DAOFactoryKeys.CHK_READER_STATUS_CAMARA);

		if (!list.isEmpty()) {
			list.initRow();
			while (list.getNextRow()) {
				ATVCHECKViewCamara vo = (ATVCHECKViewCamara) list.getRecord();
				ATVCHECK2KEYReadStatus key = new ATVCHECK2KEYReadStatus();
				BeanCopier.populate(vo, key, false);
				super.delete(key);
			}
		}
		return list.size(); 
	}
	
	/**
	 * @param teller
	 * @return
	 * @throws FacadeException
	 * @throws ItemNotFoundException 
	 */
	public ATTELLUSERSExtBasic getTeller(String teller)
		throws FacadeException, ItemNotFoundException {

		super.setDbConnectionKey(General.IBS_TELLER);
		super.setDaoCreationKey(DAOFactoryKeys.TELLER_USER_BASIC);

		ATTELLUSERSKEYExtBasic key = new ATTELLUSERSKEYExtBasic();
		key.setTELLUSERID(teller);

		return (ATTELLUSERSExtBasic) super.getValue(key);
	}
	
	public void newTeller(ATTELLUSERSExtBasic teller)
		throws FacadeException {
	
		super.setDbConnectionKey(General.IBS_TELLER);
		
		try {
			ATTELLUSERSKEYViewLastBranchSeq key = new ATTELLUSERSKEYViewLastBranchSeq();
			key.setCODEBANK(teller.getCODEBANK());
			key.setCODEBRANCH(teller.getCODEBRANCH());
			super.setDaoCreationKey(DAOFactoryKeys.TELLER_USER_LAST_BRANCH_SEQ);
			ATTELLUSERSViewLastBranchSeq seq = (ATTELLUSERSViewLastBranchSeq) super.getValue(key);
			teller.setREFPREFIX(seq.getREFPREFIX().add(ONE));
		} catch (ItemNotFoundException e) {
			teller.setREFPREFIX(ONE);
		}
		
		super.setDaoCreationKey(DAOFactoryKeys.TELLER_USER_BASIC);
		super.insert(teller);
	}
	
	public void updateTeller(ATTELLUSERSExtBasic teller)
		throws FacadeException, ItemUpdatedByAnotherUser {
		
		super.setDbConnectionKey(General.IBS_TELLER);		
		try {
			ATTELLUSERSKEYExtBasic keyTeller = new ATTELLUSERSKEYExtBasic();
			keyTeller.setTELLUSERID(teller.getTELLUSERID());
			super.setDaoCreationKey(DAOFactoryKeys.TELLER_USER_BASIC);
			ATTELLUSERSExtBasic savedTeller = (ATTELLUSERSExtBasic) super.getValue(keyTeller);
			if (!savedTeller.getCODEBRANCH().equals(teller.getCODEBRANCH())) {
				try {
					ATTELLUSERSKEYViewLastBranchSeq key = new ATTELLUSERSKEYViewLastBranchSeq();
					key.setCODEBANK(teller.getCODEBANK());
					key.setCODEBRANCH(teller.getCODEBRANCH());
					super.setDaoCreationKey(DAOFactoryKeys.TELLER_USER_LAST_BRANCH_SEQ);
					ATTELLUSERSViewLastBranchSeq seq = (ATTELLUSERSViewLastBranchSeq) super.getValue(key);
					teller.setREFPREFIX(seq.getREFPREFIX().add(ONE));
				} catch (ItemNotFoundException e) {
					teller.setREFPREFIX(ONE);
				}
			} else {
				teller.setREFPREFIX(savedTeller.getREFPREFIX());
			}
			super.setDaoCreationKey(DAOFactoryKeys.TELLER_USER_BASIC);	
			super.update(teller);
		} catch (ItemNotFoundException e) {
			super.setDaoCreationKey(DAOFactoryKeys.TELLER_USER_BASIC);
			super.insert(teller);
		}
	}
	
	public BeanList searchTellers(String pattern) throws FacadeException {
		
		super.setDbConnectionKey(General.IBS_TELLER);

		ATTELLUSERSKEYViewByName key = new ATTELLUSERSKEYViewByName();
		key.setUSERNAME(pattern);

		super.setDaoCreationKey(DAOFactoryKeys.TELLER_USER_SEARCH);
		return super.getList(key);
	}
	
	public BeanList getParameters(String flag) throws FacadeException {
		
		super.setDbConnectionKey(General.IBS_TELLER);

		ATPARAMETERSKEY key = new ATPARAMETERSKEY();
		key.setATCODEPARAM(flag);

		super.setDaoCreationKey(DAOFactoryKeys.TELLER_PARAMETERS);
		return super.getList(key);
	}
	
	public BeanList getShifts(ATSHIFTSKEY key) throws FacadeException {
		
		super.setDbConnectionKey(General.IBS_TELLER);

		super.setDaoCreationKey(DAOFactoryKeys.TELLER_SHIFTS);
		return super.getList(key);
	}
	
	public BeanList getTransactionsByUser(String user) throws FacadeException {
		
		super.setDbConnectionKey(General.IBS_TELLER);

		ATTRNTYPEBYTELLUSERSKEY key = new ATTRNTYPEBYTELLUSERSKEY();
		key.setTELLUSERID(user);
		super.setDaoCreationKey(DAOFactoryKeys.TELLER_TRANSACTIONS_BY_USERS);
		return super.getList(key);
	}
	
	public void updateTransactionsByUser(String user, BeanList transactions) throws FacadeException {
		
		super.setDbConnectionKey(General.IBS_TELLER);

		try {
			ATTRNTYPEBYTELLUSERSKEY key = new ATTRNTYPEBYTELLUSERSKEY();
			key.setTELLUSERID(user);
			super.setDaoCreationKey(DAOFactoryKeys.TELLER_TRANSACTIONS_BY_USERS);
			
			super.replace(transactions, key);
		} catch (DatabaseAccessException e) {
			throw new FacadeException(e.getMessage());
		}	
		
	}
	
	public void deleteTransactionsByUser(String user) throws FacadeException {
		
		super.setDbConnectionKey(General.IBS_TELLER);

		ATTRNTYPEBYTELLUSERSKEY key = new ATTRNTYPEBYTELLUSERSKEY();
		key.setTELLUSERID(user);
		super.setDaoCreationKey(DAOFactoryKeys.TELLER_TRANSACTIONS_BY_USERS);
		
		super.delete(key);	
	}
	
}

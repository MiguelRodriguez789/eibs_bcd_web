package com.datapro.eibs.facade;

import com.datapro.eibs.access.DAOFactoryKeys;
import com.datapro.eibs.constants.General;
import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.exception.ItemUpdatedByAnotherUser;
import com.datapro.eibs.images.key.ATVCHECKKEY;
import com.datapro.eibs.images.key.ATVCHECKKEYReadStatus;
import com.datapro.eibs.images.key.ATVCHECKKEYView;
import com.datapro.eibs.images.key.ATVCHECKKEYViewImage;
import com.datapro.eibs.images.key.ATVCHECKKEYViewLastSeq;
import com.datapro.eibs.images.key.SCANCHECKKEY;
import com.datapro.eibs.images.key.SCANCHECKKEYView;
import com.datapro.eibs.images.vo.ATVCHECK;
import com.datapro.eibs.images.vo.ATVCHECKReadStatus;
import com.datapro.eibs.images.vo.ATVCHECKViewImage;
import com.datapro.eibs.images.vo.ATVCHECKViewLastSeq;
import com.datapro.eibs.images.vo.SCANCHECK;
import com.datapro.eibs.images.vo.SCANCHECKView;
import com.datapro.generic.beanutil.BeanList;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class FACheckReader extends FACommon {
	
	public BeanList getCheckList(String scandate, String doctypecode) throws FacadeException {
		
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.CHK_READER_LIST);
		ATVCHECKKEYView key = new ATVCHECKKEYView();
		key.setSCANDATE(scandate);
		key.setDOCTYPECODE(doctypecode);
		return super.getList(key);
	}
	
	public int getLastSeqItem(String scandate, String doctypecode) throws FacadeException  {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		
		try {
			super.setDaoCreationKey(DAOFactoryKeys.ATVCHECK_LAST_SEQUENCE);
			
			ATVCHECKKEYViewLastSeq key = new ATVCHECKKEYViewLastSeq();
			key.setSCANDATE(scandate);
			key.setDOCTYPECODE(doctypecode);
		
			ATVCHECKViewLastSeq vo = (ATVCHECKViewLastSeq) super.getValue(key);
			return Integer.parseInt(vo.getSEQUENCEITEM());
		} catch (NumberFormatException e) {
			return 0;
		} catch (ItemNotFoundException e) {
			return 0;
		}
	}
	
	public void setReadStatus(String scandate, String doctypecode, String sequenceitem, String checknum) throws FacadeException, ItemNotFoundException, ItemUpdatedByAnotherUser {
		
		super.openTransaction(General.IBS_IMAGE);
		
		super.setDaoCreationKey(DAOFactoryKeys.CHK_READER_STATUS);
		ATVCHECKKEYReadStatus key = new ATVCHECKKEYReadStatus();
		key.setSCANDATE(scandate);
		key.setDOCTYPECODE(doctypecode);
		key.setCHECKNUM(checknum);
		key.setSEQUENCEITEM(sequenceitem);
		
		ATVCHECKReadStatus vo = (ATVCHECKReadStatus) super.getValue(key);
		vo.setMARKINGDIGIT("1");
		super.update(vo);
		
		super.closeTransaction();
	}
	
	public void insertCheck(String user, ATVCHECK vo) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.ATVCHECK_TABLE);
		super.setUser(user);
		super.insert(vo);
	}

	public void deleteCheck(ATVCHECK vo) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.ATVCHECK_TABLE);
		ATVCHECKKEY key = new ATVCHECKKEY(); 
		key.setSCANDATE(vo.getSCANDATE());
		key.setDOCTYPECODE("9999");
		key.setSEQUENCEITEM(vo.getSEQUENCEITEM());
		super.delete(key);
	}

	public void updateCheck(ATVCHECK vo) throws FacadeException, ItemUpdatedByAnotherUser {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.ATVCHECK_TABLE);
		
		super.update(vo);
	}

	public void updateCheckList(String scandate, BeanList list) throws FacadeException {
		boolean succeed = false;
		
		super.openTransaction(General.IBS_IMAGE);
		
		try {
			super.setDaoCreationKey(DAOFactoryKeys.ATVCHECK_TABLE);
			
			ATVCHECKKEY key = new ATVCHECKKEY(); 
			key.setSCANDATE(scandate);
			key.setDOCTYPECODE("9999");
			super.delete(key);
			super.insertAll(list);
			succeed = true;
			
		} finally {
			 if (succeed) {
				super.closeTransaction();
			   } else {
				super.cancelTransaction();
			   }			
		}
	}
	
	public SCANCHECKView getCheckImage(String account, String serie) throws FacadeException, ItemNotFoundException {
		
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SCANCHECK_IMAGE_VIEW);
		SCANCHECKKEYView key = new SCANCHECKKEYView(); 
		key.setACCOUNT(account);
		key.setSERIE(serie);
		return  (SCANCHECKView) super.getValue(key);
	}

	public ATVCHECKViewImage getATVCheckImage(String account, String serie) throws FacadeException, ItemNotFoundException {
		
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.ATVCHECK_IMAGE_VIEW);
		ATVCHECKKEYViewImage key = new ATVCHECKKEYViewImage(); 
		key.setACCOUNT(account);
		key.setCHECKNUM(serie);
		return  (ATVCHECKViewImage) super.getValue(key);
	}

	public void insertCheck(String user, SCANCHECK vo) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SCANCHECK_TABLE);
		super.setUser(user);
		super.insert(vo);
	}

	public void deleteCheck(SCANCHECK vo) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SCANCHECK_TABLE);
		SCANCHECKKEY key = new SCANCHECKKEY(); 
		key.setSCANDATE(vo.getSCANDATE());
		key.setACCOUNT(vo.getACCOUNT());
		key.setSERIE(vo.getSERIE());
		super.delete(key);
	}

	public void updateCheck(SCANCHECK vo) throws FacadeException, ItemUpdatedByAnotherUser {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SCANCHECK_TABLE);
		
		super.update(vo);
	}


}

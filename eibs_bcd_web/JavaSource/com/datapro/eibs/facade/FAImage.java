/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.facade;

import java.math.BigDecimal;

import com.datapro.eibs.access.DAOFactoryKeys;
import com.datapro.eibs.access.DISuper;
import com.datapro.eibs.constants.General;
import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.exception.ItemUpdatedByAnotherUser;
import com.datapro.eibs.images.dao.SCNDOCTBLDAO;
import com.datapro.eibs.images.dao.SCNDOCTBLDAOViewCount;
import com.datapro.eibs.images.dao.SCNIMGDAOViewInquiry;
import com.datapro.eibs.images.dao.SCNIMGDAOViewSignature;
import com.datapro.eibs.images.dao.SCNIMGDAOViewSignatureRules;
import com.datapro.eibs.images.dao.SCNIMGDAOViewSignatureRulesExt;
import com.datapro.eibs.images.dao.SCNSIGRULESDAOView;
import com.datapro.eibs.images.key.ATVCHECKKEYViewImage;
import com.datapro.eibs.images.key.SCNDOCIMGKEY;
import com.datapro.eibs.images.key.SCNDOCKEYView;
import com.datapro.eibs.images.key.SCNDOCTBLKEY;
import com.datapro.eibs.images.key.SCNDOCTBLKEYViewCount;
import com.datapro.eibs.images.key.SCNDOCTBLKEYViewLastSequence;
import com.datapro.eibs.images.key.SCNENTSIGKEY;
import com.datapro.eibs.images.key.SCNENTSIGKEYViewLastSeq;
import com.datapro.eibs.images.key.SCNENTSIGKEYViewListByEntity;
import com.datapro.eibs.images.key.SCNIMGKEYView;
import com.datapro.eibs.images.key.SCNIMGKEYViewInquiry;
import com.datapro.eibs.images.key.SCNIMGKEYViewSignature;
import com.datapro.eibs.images.key.SCNIMGKEYViewSignatureRules;
import com.datapro.eibs.images.key.SCNIMGKEYViewSignatureRulesExt;
import com.datapro.eibs.images.key.SCNSIGRULESKEY;
import com.datapro.eibs.images.key.SCNSIGRULESKEYView;
import com.datapro.eibs.images.key.SCNSIGRULHIKEY;
import com.datapro.eibs.images.vo.ATVCHECKViewImage;
import com.datapro.eibs.images.vo.SCNDOCIMG;
import com.datapro.eibs.images.vo.SCNDOCTBL;
import com.datapro.eibs.images.vo.SCNDOCTBLViewCount;
import com.datapro.eibs.images.vo.SCNDOCTBLViewLastSequence;
import com.datapro.eibs.images.vo.SCNDOCView;
import com.datapro.eibs.images.vo.SCNENTSIG;
import com.datapro.eibs.images.vo.SCNENTSIGViewLastSeq;
import com.datapro.eibs.images.vo.SCNIMGView;
import com.datapro.eibs.images.vo.SCNIMGViewSignature;
import com.datapro.eibs.images.vo.SCNSIGRULES;
import com.datapro.generic.beanutil.BeanList;
import com.datapro.sql.SerialBlob;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class FAImage extends FACommon {
	
	public int insertImage(SCNDOCTBL tbl, SCNDOCIMG img) throws FacadeException {
		int result = 0;
		boolean succeed = false;
		super.openTransaction(General.IBS_IMAGE);
		try {
			super.setDaoCreationKey(DAOFactoryKeys.DOC_TABLE);
			tbl.setTBLSTS("P");
			result = super.insert(tbl);
			succeed = (result > 0);
			if (succeed) {
				super.setDaoCreationKey(DAOFactoryKeys.DOC_IMAGE);
				result = super.insert(img);
				succeed = (result > 0);
			}
		
		} finally {
			 if (succeed) {
				super.closeTransaction();
			   } else {
				super.cancelTransaction();
			   }			
		}
		return result;
	}
	
	public SCNDOCTBLViewLastSequence getDocLastSequence(SCNDOCTBLKEYViewLastSequence key)
		throws FacadeException, ItemNotFoundException {
		
		super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.DOC_TABLE_VIEW_LAST_SEQUENCE);
			
		SCNDOCTBLViewLastSequence view = (SCNDOCTBLViewLastSequence) super.getValue(key);
		if (view.getTBLSSQ() == null) {
			view.setTBLSSQ(ZERO);
		}
		if (view.getTBLPAG() == null) {
			view.setTBLPAG(ZERO);
		}
		return view;
	}
	
	public BeanList getDocTable(String type, String number, String table, String sequence) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.DOC_TABLE);
		SCNDOCTBLKEY key = new SCNDOCTBLKEY();
		key.setTBLTYP(type);
		key.setTBLNUM(new BigDecimal(number));
		key.setTBLTBN(table);
		key.setTBLSEQ(new BigDecimal(sequence));
		return super.getList(key);
	}	
	
	public SCNDOCTBL getDocTable(String description) throws FacadeException, ItemNotFoundException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.DOC_TABLE);
		SCNDOCTBLKEY key = new SCNDOCTBLKEY();
		key.setTBLDSC(description);
		return (SCNDOCTBL) super.getValue(key);
	}	
	
	public SCNDOCTBL getDocTable(BigDecimal uid) throws FacadeException, ItemNotFoundException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.DOC_TABLE);
		SCNDOCTBLKEY key = new SCNDOCTBLKEY();
		key.setTBLUID(uid);
		return (SCNDOCTBL) super.getValue(key);
	}	
	
	public int deleteImage(String type, String number, String table, String sequence) throws FacadeException {
		int result = 0;
		boolean succeed = false;
		BeanList list = getDocTable(type, number, table, sequence);
		list.initRow();
		if (!list.isEmpty()) {
			super.openTransaction(General.IBS_IMAGE);
			try {
				super.setDaoCreationKey(DAOFactoryKeys.DOC_IMAGE);
				while (list.getNextRow()) {
					SCNDOCTBL vo = (SCNDOCTBL) list.getRecord();
					SCNDOCIMGKEY key = new SCNDOCIMGKEY();
					key.setIMGUID(vo.getTBLUID());
					super.delete(key);
				}
				super.setDaoCreationKey(DAOFactoryKeys.DOC_TABLE);
				SCNDOCTBLKEY key = new SCNDOCTBLKEY();
				key.setTBLTYP(type);
				key.setTBLNUM(bigDecimalParser(number));
				key.setTBLTBN(table);
				key.setTBLSEQ(bigDecimalParser(sequence));
				result = super.delete(key);
				succeed = true;
			} finally {
				 if (succeed) {
					super.closeTransaction();
				   } else {
					super.cancelTransaction();
				   }			
			}
		}
		return result;
	}	

	public int clearDeletedImage(String type, String number, String table, String sequence) throws FacadeException {
		int result = 0;
		boolean succeed = false;
		BeanList list = getDocTable(type, number, table, sequence);
		list.initRow();
		if (!list.isEmpty()) {
			super.openTransaction(General.IBS_IMAGE);
			try {
				super.setDaoCreationKey(DAOFactoryKeys.DOC_IMAGE);
				while (list.getNextRow()) {
					SCNDOCTBL vo = (SCNDOCTBL) list.getRecord();
					if (vo.getTBLSTS().equals("D")) {
						SCNDOCIMGKEY key = new SCNDOCIMGKEY();
						key.setIMGUID(vo.getTBLUID());
						super.delete(key);
					}
				}
				list.initRow();
				super.setDaoCreationKey(DAOFactoryKeys.DOC_TABLE);
				while (list.getNextRow()) {
					SCNDOCTBL vo = (SCNDOCTBL) list.getRecord();
					if (vo.getTBLSTS().equals("D")) {
						SCNDOCTBLKEY key = new SCNDOCTBLKEY();
						key.setTBLTYP(vo.getTBLTYP());
						key.setTBLNUM(vo.getTBLNUM());
						key.setTBLTBN(vo.getTBLTBN());
						key.setTBLSEQ(vo.getTBLSEQ());
						key.setTBLSSQ(vo.getTBLSSQ());
						result = super.delete(key);
					}
				}
				succeed = true;
			} finally {
				 if (succeed) {
					super.closeTransaction();
				   } else {
					super.cancelTransaction();
				   }			
			}
		}
		return result;
	}	

	public boolean approvalImage(String type, String number, String table, String sequence) throws FacadeException, ItemNotFoundException, ItemUpdatedByAnotherUser {
		boolean succeed = false;
			super.openTransaction(General.IBS_IMAGE);
			try {
				super.setDaoCreationKey(DAOFactoryKeys.DOC_TABLE);
				BeanList list = getDocTable(type, number, table, sequence);
				list.initRow();
				while (list.getNextRow()) {
					SCNDOCTBL vo = (SCNDOCTBL) list.getRecord();
					if (vo.getTBLSTS().equals("P")) {
						vo.setTBLSTS("A");
						super.update(vo);
					}
				}
				succeed = true;
			} finally {
				 if (succeed) {
					super.closeTransaction();
				   } else {
					super.cancelTransaction();
				   }			
			}
		return succeed;
	}
	
	public boolean approvePendingDocuments(String type, String number) throws FacadeException, ItemUpdatedByAnotherUser {
		boolean succeed = false;
		super.openTransaction(General.IBS_IMAGE);
		try {
			SCNDOCTBLKEY key = new SCNDOCTBLKEY();
			key.setTBLTYP(type);
			key.setTBLNUM(bigDecimalParser(number));
			
			super.setDaoCreationKey(DAOFactoryKeys.DOC_TABLE);
			initDao(SCNDOCTBLDAO.class);
			
			DISuper dao = getDao();
			dao.openResultSet(key);
			while (dao.hasNext()) {
				SCNDOCTBL vo = (SCNDOCTBL) dao.findNext();
				if (vo.getTBLSTS().equals("P")) {
					vo.setTBLSTS("A");
					dao.update(vo);
				} else if (vo.getTBLSTS().equals("D")) {
					vo.setTBLSTS("C");
					dao.update(vo);
				}
			}
			succeed = true;
			
		} catch (ItemUpdatedByAnotherUser e) {
			throw e;
		} catch (Exception e) {
			throw new FacadeException(e);
		} finally {
			 if (succeed) {
				super.closeTransaction();
			 } else {
				super.cancelTransaction();
			 }
		}
		return succeed;
	}
	
	public boolean approvePendingDocumentsSignatures(String type, String number, String seq, String rule,
			String idt, String edt) throws FacadeException, ItemUpdatedByAnotherUser {
		boolean succeed = false;
		super.openTransaction(General.IBS_IMAGE);
		try {
			SCNDOCTBLKEY key = new SCNDOCTBLKEY();
			key.setTBLTYP(type);
			key.setTBLNUM(bigDecimalParser(number));
			key.setTBLSSQ(bigDecimalParser(seq));
			key.setTBLDTY("SC");
			
			super.setDaoCreationKey(DAOFactoryKeys.DOC_TABLE);
			initDao(SCNDOCTBLDAO.class);
			
			DISuper dao = getDao();
			dao.openResultSet(key);
			while (dao.hasNext()) {
				SCNDOCTBL vo = (SCNDOCTBL) dao.findNext();
				vo.setTBLRUL(rule);
				vo.setTBLIDT(idt);
				vo.setTBLEDT(edt);
				dao.update(vo);
				
			}
			succeed = true;
			
		} catch (ItemUpdatedByAnotherUser e) {
			throw e;
		} catch (Exception e) {
			throw new FacadeException(e);
		} finally {
			 if (succeed) {
				super.closeTransaction();
			 } else {
				super.cancelTransaction();
			 }
		}
		return succeed;
	}
	
	public boolean deletePendingDocuments(String type, String number) throws FacadeException {
		boolean succeed = false;
		super.openTransaction(General.IBS_IMAGE);
		try {
			SCNDOCTBLKEY key = new SCNDOCTBLKEY();
			key.setTBLTYP(type);
			key.setTBLNUM(bigDecimalParser(number));
			
			super.setDaoCreationKey(DAOFactoryKeys.DOC_TABLE);
			initDao(SCNDOCTBLDAO.class);
			
			DISuper dao = getDao();
			dao.openResultSet(key);
			while (dao.hasNext()) {
				SCNDOCTBL vo = (SCNDOCTBL) dao.findNext();
				if (vo.getTBLSTS().equals("P")) {
					dao.delete();
				} else if (vo.getTBLSTS().equals("D")) {
					vo.setTBLSTS("A");
					dao.update(vo);
				}
			}
			succeed = true;
			
		} catch (Exception e) {
			throw new FacadeException(e);
		} finally {
			 if (succeed) {
				super.closeTransaction();
			 } else {
				super.cancelTransaction();
			 }
		}
		return succeed;
	}
		
	public boolean markForDeleteImage(BigDecimal uid) throws FacadeException, ItemNotFoundException, ItemUpdatedByAnotherUser {
		boolean succeed = false;
			super.openTransaction(General.IBS_IMAGE);
			try {
				super.setDaoCreationKey(DAOFactoryKeys.DOC_TABLE);
				SCNDOCTBLKEY key = new SCNDOCTBLKEY();
				key.setTBLUID(uid);
				
				SCNDOCTBL vo = (SCNDOCTBL) super.getValue(key);
				vo.setTBLSTS("D");
				super.update(vo);
				succeed = true;
			} finally {
				 if (succeed) {
					super.closeTransaction();
				   } else {
					super.cancelTransaction();
				   }			
			}
		return succeed;
	}
		
	public int deleteImage(BigDecimal uid) throws FacadeException {
		int result = 0;
		boolean succeed = false;
			super.openTransaction(General.IBS_IMAGE);
			try {
				super.setDaoCreationKey(DAOFactoryKeys.DOC_IMAGE);
				SCNDOCIMGKEY keyimg = new SCNDOCIMGKEY();
				keyimg.setIMGUID(uid);
				super.delete(keyimg);
				super.setDaoCreationKey(DAOFactoryKeys.DOC_TABLE);
				SCNDOCTBLKEY keytbl = new SCNDOCTBLKEY();
				keytbl.setTBLUID(uid);
				result = super.delete(keytbl);
				succeed = true;
			} finally {
				 if (succeed) {
					super.closeTransaction();
				   } else {
					super.cancelTransaction();
				   }			
			}
		return result;
	}
		
	public SCNDOCView getDocImage(String uid) throws FacadeException, ItemNotFoundException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.DOC_IMAGE);
		SCNDOCKEYView key = new SCNDOCKEYView();
		key.setKeyValues("TBLUID", uid);
		return (SCNDOCView) super.getValue(key);
	}	
	
	public BeanList getDocImageList(String type, String number, String table, String sequence) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.DOC_VIEWER);
		SCNDOCKEYView key = new SCNDOCKEYView();
		key.setKeyValues("TBLTYP", type);
		key.setKeyValues("TBLNUM", bigDecimalParser(number));
		key.setKeyValues("TBLTBN", table);
		key.setKeyValues("TBLSEQ", bigDecimalParser(sequence));
		return super.getList(key);
	}	
	
	public BeanList getDocTableList(String type, String number, String table, String sequence) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.IMG_VIEWER);
		SCNIMGKEYView key = new SCNIMGKEYView();
		key.setKeyValues("TBLTYP", type);
		key.setKeyValues("TBLNUM", bigDecimalParser(number));
		key.setKeyValues("TBLTBN", table);
		key.setKeyValues("TBLSEQ", bigDecimalParser(sequence));
		return super.getList(key);
	}
	
	public BeanList getDocTableInqList(String type, String number, String table, String sequence) throws FacadeException {
		try {
			super.setDbConnectionKey(General.IBS_IMAGE);
			
			SCNIMGKEYViewInquiry key = new SCNIMGKEYViewInquiry();
			key.setKeyValues("TBLTYP", type);
			key.setKeyValues("TBLNUM", bigDecimalParser(number));
			key.setKeyValues("TBLTBN", table);
			key.setKeyValues("TBLSEQ", bigDecimalParser(sequence));
			
			initDao(SCNIMGDAOViewInquiry.class);
			return super.getList(key);
			
		} catch (Exception e) {
			throw new FacadeException(e);
		}
	}
	
	public BeanList getDocTableInqListSC(String type, String number, String doctyp) throws FacadeException {
		try {
			super.setDbConnectionKey(General.IBS_IMAGE);
			
			SCNIMGKEYViewInquiry key = new SCNIMGKEYViewInquiry();
			key.setKeyValues("TBLTYP", type);
			key.setKeyValues("TBLNUM", bigDecimalParser(number));
			key.setKeyValues("TBLDTY", doctyp);
			
			initDao(SCNIMGDAOViewSignature.class);
			return super.getList(key);
			
		} catch (Exception e) {
			throw new FacadeException(e);
		}
	}
	
	public BeanList getDocTableInqSCSSQ(String type, String number, String doctyp, String docssq) throws FacadeException {
		try {
			if (super.getDbConnectionKey() == null) 
				super.setDbConnectionKey(General.IBS_IMAGE);

			initDao(SCNIMGDAOViewSignatureRules.class);
			
			SCNIMGKEYViewSignatureRules key = new SCNIMGKEYViewSignatureRules();
			key.setTBLTYP(type);
			key.setTBLNUM(bigDecimalParser(number));
			key.setTBLDTY(doctyp);
			key.setTBLSSQ(bigDecimalParser(docssq));
			return getList(key);
			
		} catch (Exception e) {
			throw new FacadeException(e);
		}
	}
	
	public BeanList getDocTableInqSCRUL(String number) throws FacadeException {
		try {
			super.setDbConnectionKey(General.IBS_IMAGE);
			
			SCNSIGRULESKEYView key = new SCNSIGRULESKEYView();
			key.setACCUID(bigDecimalParser(number));

			initDao(SCNSIGRULESDAOView.class);
			return super.getList(key);
			
		} catch (Exception e) {
			throw new FacadeException(e);
		}
	}
	
	public int countImages(String type, String number, String table, String sequence) throws FacadeException {
		try {
			if (super.getDbConnectionKey() == null) 
				super.setDbConnectionKey(General.IBS_IMAGE);
			super.setDaoCreationKey(DAOFactoryKeys.DOC_IMAGE);
			SCNDOCTBLKEYViewCount key = new SCNDOCTBLKEYViewCount();
			key.setTBLTYP(type);
			key.setTBLNUM(bigDecimalParser(number));
			key.setTBLTBN(table);
			key.setTBLSEQ(bigDecimalParser(sequence));
	
			initDao(SCNDOCTBLDAOViewCount.class);
			SCNDOCTBLViewCount vo = (SCNDOCTBLViewCount) getDao().findByPrimaryKey(key);
			
			return vo.getCOUNTER().intValue();
		} catch (Exception e) {
			throw new FacadeException(e);
		}
	}
	
	
	public SCNIMGView getImage(String uid) throws FacadeException, ItemNotFoundException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.IMG_VIEWER);
		SCNIMGKEYView key = new SCNIMGKEYView();
		key.setKeyValues("TBLUID", bigDecimalParser(uid));
		return (SCNIMGView) super.getValue(key);
	}	
	

	public ATVCHECKViewImage getCheckImage(String account, String serie) throws FacadeException, ItemNotFoundException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.CHK_VIEWER);
		ATVCHECKKEYViewImage key = new ATVCHECKKEYViewImage();
		key.setACCOUNT(account);
		key.setCHECKNUM(serie);
		return (ATVCHECKViewImage) super.getValue(key);
	}
	
	public BeanList getSignatures(String type, String number) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_VIEWER);
		SCNIMGKEYViewSignature key = new SCNIMGKEYViewSignature();
		key.setTBLNUM(bigDecimalParser(number));
		key.setTBLTYP(type);
		
		return super.getList(key);
	}	
	
	public SCNIMGViewSignature getSignature(String number, String table, String sequence) throws FacadeException, ItemNotFoundException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_VIEWER);
		SCNIMGKEYViewSignature key = new SCNIMGKEYViewSignature();
		key.setTBLNUM(bigDecimalParser(number));
		key.setTBLTBN(table);
		key.setTBLSEQ(bigDecimalParser(sequence));
		
		return (SCNIMGViewSignature) super.getValue(key);
	}
	
	public SerialBlob getSignatureImage(String number, String table, String sequence) throws FacadeException, ItemNotFoundException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_VIEWER);
		SCNIMGKEYViewSignature key = new SCNIMGKEYViewSignature();
		key.setTBLNUM(bigDecimalParser(number));
		key.setTBLTBN(table);
		key.setTBLSEQ(bigDecimalParser(sequence));
		
		return new SerialBlob(((SCNIMGViewSignature) super.getValue(key)).getIMGBIN());
	}
	
	public BigDecimal getSignatureSequence(String type, String number) throws FacadeException {
		
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_SEQUENCE);
		
		SCNENTSIGKEYViewLastSeq key = new SCNENTSIGKEYViewLastSeq();
		key.setENTTYP(type);
		key.setENTUID(bigDecimalParser(number));
		
		try {
			SCNENTSIGViewLastSeq vo = (SCNENTSIGViewLastSeq) super.getValue(key);
			return vo.getENTSEQ() == null ? new BigDecimal("0") : vo.getENTSEQ();
		} catch (ItemNotFoundException e) {
			return new BigDecimal("0");
		}
	}
	
	public SCNENTSIG getEntitySignature(String type, String number, String sequence) throws FacadeException, ItemNotFoundException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_ENTITY_VIEWER);
		SCNENTSIGKEY key = new SCNENTSIGKEY();
		key.setENTUID(bigDecimalParser(number));
		key.setENTTYP(type);
		key.setENTSEQ(bigDecimalParser(sequence));
		
		return (SCNENTSIG) super.getValue(key);
	}
	
	public BeanList getEntitySignatureList(String type, String number) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_ENTITY_LIST);
		SCNENTSIGKEYViewListByEntity key = new SCNENTSIGKEYViewListByEntity();
		key.setENTUID(bigDecimalParser(number));
		key.setENTTYP(type);
		return super.getList(key);
	}	
	
	public void deleteEntitySignature(String number, String type, String sequence) throws FacadeException, ItemNotFoundException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_ENTITY_VIEWER);
		SCNENTSIGKEY key = new SCNENTSIGKEY();
		key.setENTUID(bigDecimalParser(number));
		key.setENTTYP(type);
		key.setENTSEQ(bigDecimalParser(sequence));
		
		super.delete(key);
	}
	
	public SCNSIGRULES getSignRule(String accuid, String sigrule, String ccycode) throws FacadeException, ItemNotFoundException  {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_RULES);
		SCNSIGRULESKEY key = new SCNSIGRULESKEY();
		key.setACCUID(bigDecimalParser(accuid));
		key.setSIGRULE(sigrule);
		key.setCCYCODE(ccycode);
		
		return (SCNSIGRULES) super.getValue(key);
	}
	
	public boolean existRule(String accuid, String sigrule, String ccycode) throws FacadeException {
		try {
			SCNSIGRULES vo = getSignRule(accuid, sigrule, ccycode);
			return true;
		} catch (ItemNotFoundException e) {
			return false;
		}
	}
	
	public int insertSignRule(SCNSIGRULES vo) throws FacadeException {
		
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_RULES);
		return super.insert(vo);
	}
	
	public int updateSignRule(SCNSIGRULES vo) throws FacadeException, ItemUpdatedByAnotherUser {
		
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_RULES);
		
		return super.update(vo);
	}
	
	public void deleteSignRule(String accuid, String sigrule, String ccycode) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_RULES);
		SCNSIGRULESKEY key = new SCNSIGRULESKEY();
		key.setACCUID(bigDecimalParser(accuid));
		key.setSIGRULE(sigrule);
		key.setCCYCODE(ccycode);
		
		super.delete(key);
	}
	
	public boolean markForDeleteRule(String accuid, String sigrule, String ccycode) throws FacadeException, ItemNotFoundException, ItemUpdatedByAnotherUser {
		boolean succeed = false;
			super.openTransaction(General.IBS_IMAGE);
			try {
				super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_RULES);
				SCNSIGRULESKEY key = new SCNSIGRULESKEY();
				key.setACCUID(bigDecimalParser(accuid));
				key.setSIGRULE(sigrule);
				key.setCCYCODE(ccycode);
				
				SCNSIGRULES vo = (SCNSIGRULES) super.getValue(key);
				vo.setMODAPPROVED("0");
				vo.setTYPEMAINT("9");
				super.update(vo);
				succeed = true;
			} finally {
				 if (succeed) {
					super.closeTransaction();
				   } else {
					super.cancelTransaction();
				   }			
			}
		return succeed;
	}
		
	public void deleteSignRule(String accuid) throws FacadeException {
		boolean succeed = false;
		super.openTransaction(General.IBS_IMAGE);
		try {
			super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_RULES);
			SCNSIGRULESKEY key = new SCNSIGRULESKEY();
			key.setACCUID(bigDecimalParser(accuid));

			BeanList list = super.getList(key);
			list.initRow();
			while (list.getNextRow()) {
				SCNSIGRULES vo = (SCNSIGRULES) list.getRecord();
				if (vo.getTYPEMAINT().equals("9")) {
					key.setSIGRULE(vo.getSIGRULE());
					key.setCCYCODE(vo.getCCYCODE());
					super.delete(key);
				}
			}
			succeed = true;
		} finally {
			 if (succeed) {
				super.closeTransaction();
			   } else {
				super.cancelTransaction();
			   }			
		}
	}
	
	public boolean approvalRule(String accuid) throws FacadeException, ItemNotFoundException, ItemUpdatedByAnotherUser {
		boolean succeed = false;
		super.openTransaction(General.IBS_IMAGE);
		try {
			super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_RULES);
			SCNSIGRULESKEY key = new SCNSIGRULESKEY();
			key.setACCUID(bigDecimalParser(accuid));
			
			BeanList list = super.getList(key);
			list.initRow();
			while (list.getNextRow()) {
				SCNSIGRULES vo = (SCNSIGRULES) list.getRecord();
				if (!vo.getTYPEMAINT().equals("9")) {
					vo.setMODAPPROVED("1");
					super.update(vo);
				}	
			}
			
			succeed = true;
		} finally {
			 if (succeed) {
				super.closeTransaction();
			   } else {
				super.cancelTransaction();
			   }			
		}
		return succeed;
	}
		
	public BeanList getSignRuleList(String accuid) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_RULES);
		SCNSIGRULESKEY key = new SCNSIGRULESKEY();
		key.setACCUID(bigDecimalParser(accuid));
		return super.getList(key);
	}
	
	public BeanList getSignRuleListHI(String accuid) throws FacadeException {
		if (super.getDbConnectionKey() == null) 
			super.setDbConnectionKey(General.IBS_IMAGE);
		super.setDaoCreationKey(DAOFactoryKeys.SIGNATURE_RULESHIS);
		SCNSIGRULHIKEY key = new SCNSIGRULHIKEY();
		key.setACCUID(bigDecimalParser(accuid));
		return super.getList(key);
	}
	
}

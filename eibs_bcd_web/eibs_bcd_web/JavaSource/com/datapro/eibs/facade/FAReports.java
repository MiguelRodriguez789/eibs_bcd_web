package com.datapro.eibs.facade;

import java.math.BigDecimal;
import java.util.List;

import com.datapro.eibs.access.DAOFactoryKeys;
import com.datapro.eibs.constants.General;
import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.reports.key.IBSRPTKEY;
import com.datapro.eibs.reports.key.IBSRPTKEYExtByModule;
import com.datapro.eibs.reports.key.IBSRPTKEYViewModules;
import com.datapro.eibs.reports.key.IFSFILESKEY;
import com.datapro.eibs.reports.vo.IFSFILES;
import com.datapro.sql.SerialBlob;

public class FAReports extends FACommon {
	
	public IFSFILES getIFSFiles(String fname, String fuserid, String frefer, BigDecimal seq) throws FacadeException, ItemNotFoundException {
		
		super.setDbConnectionKey(General.IBS_SERVER);
		super.setDaoCreationKey(DAOFactoryKeys.IFSFILES);
		IFSFILESKEY key = new IFSFILESKEY();
		key.setFNAME(fname);
		key.setFUSERID(fuserid);
		key.setFREFER(frefer);
		key.setFSEQ(seq);
		
		return (IFSFILES) super.getValue(key);
	}
	
	public SerialBlob getSerialBlob(String fname, String fuserid, String frefer, BigDecimal seq) throws FacadeException, ItemNotFoundException {
		
		super.setDbConnectionKey(General.IBS_SERVER);
		super.setDaoCreationKey(DAOFactoryKeys.IFSFILES);
		IFSFILESKEY key = new IFSFILESKEY();
		key.setFNAME(fname);
		key.setFUSERID(fuserid);
		key.setFREFER(frefer);
		key.setFSEQ(seq);
		
		return new SerialBlob(((IFSFILES) super.getValue(key)).getBINFILE());
	}
	
	public List getAllReports() throws FacadeException {
		super.setDbConnectionKey(General.IBS_SERVER);
		super.setDaoCreationKey(DAOFactoryKeys.REPORTS_DIRECTORY);
		IBSRPTKEY key = new IBSRPTKEY();
		key.setIBSLIF(getSessionUser().getE01LAN());
		return (List) getList(key).getList();
	}
	
	public List getReportsModules(IBSRPTKEYViewModules key) throws FacadeException {
		super.setDbConnectionKey(General.IBS_SERVER);
		super.setDaoCreationKey(DAOFactoryKeys.REPORTS_MODULES);
		return (List) getList(key).getList();
	}
	
	public List getReportsModules() throws FacadeException {
		super.setDbConnectionKey(General.IBS_SERVER);
		super.setDaoCreationKey(DAOFactoryKeys.REPORTS_MODULES);
		IBSRPTKEYViewModules key = new IBSRPTKEYViewModules();
		return (List) getList(key).getList();
	}
	
	public List getReportsByModule(IBSRPTKEYExtByModule key) throws FacadeException {
		super.setDbConnectionKey(General.IBS_SERVER);
		super.setDaoCreationKey(DAOFactoryKeys.REPORTS_BY_MODULES);		
		return (List) getList(key).getList();
	}
}

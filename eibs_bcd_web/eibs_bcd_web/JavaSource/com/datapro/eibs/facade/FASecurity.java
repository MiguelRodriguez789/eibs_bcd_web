package com.datapro.eibs.facade;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import com.datapro.eibs.access.DAOFactoryKeys;
import com.datapro.eibs.access.DISuper;
import com.datapro.eibs.access.KeySuper;
import com.datapro.eibs.access.VOSuper;
import com.datapro.eibs.constants.EOD;
import com.datapro.eibs.constants.General;
import com.datapro.eibs.exception.DatabaseAccessException;
import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.security.dao.HOLYDDAOView;
import com.datapro.eibs.security.dao.USERSDAOViewByGroup;
import com.datapro.eibs.security.dao.WEBCODAO;
import com.datapro.eibs.security.dao.WEBCODAOViewByUserSecurity;
import com.datapro.eibs.security.dao.WEBCODAOViewTreeByGroup;
import com.datapro.eibs.security.dao.WEBCODAOViewTreeByUser;
import com.datapro.eibs.security.dao.WEBMGRDAO;
import com.datapro.eibs.security.dao.WEBMGRDAOExtAddAllMenu;
import com.datapro.eibs.security.dao.WEBMMDAO;
import com.datapro.eibs.security.dao.WEBMMDAOViewByDescription;
import com.datapro.eibs.security.dao.WEBMMDAOViewByUserSecurity;
import com.datapro.eibs.security.dao.WEBMMDAOViewTreeByGroup;
import com.datapro.eibs.security.dao.WEBMMDAOViewTreeByUser;
import com.datapro.eibs.security.dao.WEBMODAO;
import com.datapro.eibs.security.dao.WEBMODAOViewByDescription;
import com.datapro.eibs.security.dao.WEBMUSDAO;
import com.datapro.eibs.security.dao.WEBMUSDAOExtAddAllMenu;
import com.datapro.eibs.security.dao.WEBOGDAO;
import com.datapro.eibs.security.dao.WEBOGDAOExtAddAllOption;
import com.datapro.eibs.security.dao.WEBOUDAO;
import com.datapro.eibs.security.dao.WEBOUDAOExtAddAllOption;
import com.datapro.eibs.security.key.CNTRLBTHKEYViewUsers;
import com.datapro.eibs.security.key.GRPRPTKEY;
import com.datapro.eibs.security.key.GRPRPTKEYViewReportsChecked;
import com.datapro.eibs.security.key.HOLYDKEYView;
import com.datapro.eibs.security.key.USERSKEYViewByGroup;
import com.datapro.eibs.security.key.USRRPTKEY;
import com.datapro.eibs.security.key.USRRPTKEYViewEODPDF;
import com.datapro.eibs.security.key.USRRPTKEYViewEndOfDayReports;
import com.datapro.eibs.security.key.USRRPTKEYViewGeneratedOnDates;
import com.datapro.eibs.security.key.USRRPTKEYViewModules;
import com.datapro.eibs.security.key.USRRPTKEYViewModulesByPeriod;
import com.datapro.eibs.security.key.USRRPTKEYViewReports;
import com.datapro.eibs.security.key.USRRPTKEYViewReportsChecked;
import com.datapro.eibs.security.key.WEBCOKEY;
import com.datapro.eibs.security.key.WEBCOKEYViewByUser;
import com.datapro.eibs.security.key.WEBCOKEYViewByUserSecurity;
import com.datapro.eibs.security.key.WEBCOKEYViewTreeByGroup;
import com.datapro.eibs.security.key.WEBCOKEYViewTreeByUser;
import com.datapro.eibs.security.key.WEBMGRKEY;
import com.datapro.eibs.security.key.WEBMMKEY;
import com.datapro.eibs.security.key.WEBMMKEYViewByDescription;
import com.datapro.eibs.security.key.WEBMMKEYViewByUser;
import com.datapro.eibs.security.key.WEBMMKEYViewByUserSecurity;
import com.datapro.eibs.security.key.WEBMMKEYViewTreeByGroup;
import com.datapro.eibs.security.key.WEBMMKEYViewTreeByUser;
import com.datapro.eibs.security.key.WEBMOKEY;
import com.datapro.eibs.security.key.WEBMOKEYViewByDescription;
import com.datapro.eibs.security.key.WEBMUSKEY;
import com.datapro.eibs.security.key.WEBOGKEY;
import com.datapro.eibs.security.key.WEBOUKEY;
import com.datapro.eibs.security.vo.CNTRLBTHViewUsers;
import com.datapro.eibs.security.vo.GRPRPT;
import com.datapro.eibs.security.vo.GRPRPTExtAddAllReports;
import com.datapro.eibs.security.vo.USRRPT;
import com.datapro.eibs.security.vo.USRRPTExtAddAllReports;
import com.datapro.eibs.security.vo.WEBCO;
import com.datapro.eibs.security.vo.WEBMGR;
import com.datapro.eibs.security.vo.WEBMGRExtAddAllMenu;
import com.datapro.eibs.security.vo.WEBMUS;
import com.datapro.eibs.security.vo.WEBMUSExtAddAllMenu;
import com.datapro.eibs.security.vo.WEBOG;
import com.datapro.eibs.security.vo.WEBOGExtAddAllOption;
import com.datapro.eibs.security.vo.WEBOU;
import com.datapro.eibs.security.vo.WEBOUExtAddAllOption;
import com.datapro.eibs.setup.key.CNTRLCNTKEYExtRunDate;
import com.datapro.eibs.setup.vo.CNTRLCNTExtRunDate;
import com.datapro.exception.DAOException;
import com.datapro.generic.beanutil.BeanList;


public class FASecurity extends FACommon {

	public static FASecurity getInstance() {
		return (FASecurity) new FASecurity();		
	}
	
	public List getOptionsMenu(String lang) throws FacadeException {
		try {
			BeanList list = new BeanList();
			setDbConnectionKey(General.DBID_CURRENT_YEAR);
			WEBCOKEY key = new WEBCOKEY();
			key.setCMOLIF(lang);
			initDao(WEBCODAO.class);
			DISuper dao = getDao();
			dao.openResultSet(key);
			while (dao.hasNext()) {
				list.addRow((WEBCO) dao.findNext());
			}
			return (List) list.getList();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} 
	}
	
	public List getOptionsMenu(String user, String codeName) throws FacadeException {
		try {
			setDbConnectionKey(General.DBID_CURRENT_YEAR);
			WEBCOKEYViewByUser key = new WEBCOKEYViewByUserSecurity();
			key.setBTHUSR(user);
			key.setCMOCDE(codeName);
			initDao(WEBCODAOViewByUserSecurity.class);
			return (List) getList(key).getList();

		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} 
	}
	
	public void newOptionsMenu(String user, WEBCO bean) throws FacadeException {
		try {
			setDbConnectionKey(General.DBID_CURRENT_YEAR);
			initDao(WEBCODAO.class);
			insert(bean);

		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} 
	}
	
	public void insertOptionsMenu(String user, List list) throws FacadeException {
		try {
			open(General.DBID_CURRENT_YEAR);
			initDao(WEBCODAO.class);
			Iterator iter = list.listIterator();
			while (iter.hasNext()) {
				WEBCO vo = (WEBCO) iter.next();
				WEBCOKEY key = new WEBCOKEY();
				key.setCMOSID(vo.getCMOSID());
				key.setCMODEN(vo.getCMODEN());
				key.setCMOSEQ(vo.getCMOSEQ());
				key.setCMOLIF(vo.getCMOLIF());
				try {
					getValue(key);
				} catch (ItemNotFoundException e1) {
					insert(vo);
				}
			}

		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} finally {
			close();
		}
		 
	}
	
	/**
	 * @param user id
	 * @param reportPeriod
	 * @return
	 * @throws FacadeException
	 */
	public BeanList getUserReportsModules(String uid, String reportPeriod)
		throws FacadeException {

		super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
		super.setDaoCreationKey(
			DAOFactoryKeys.SECURITY_REPORTS_VIEW_MODULES_BY_PERIOD);

		USRRPTKEYViewModulesByPeriod key = new USRRPTKEYViewModulesByPeriod();
		key.setUSRUID(uid);
		key.setIBSPER(reportPeriod);

		return super.getList(key);
	}
	
	/**
	 * @param user id
	 * @param reportPeriod
	 * @return
	 * @throws FacadeException
	 */
	public BeanList getUserReportsModules(String uid)
		throws FacadeException {

		super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
		super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_VIEW_MODULES);

		USRRPTKEYViewModules key = new USRRPTKEYViewModules();
		key.setUSRUID(uid);

		return super.getList(key);
	}	
	
	/**
	 * @param group id
	 * @param reportPeriod
	 * @param module
	 * @return
	 * @throws FacadeException
	 */
	public BeanList getUserReports(String uid, String reportPeriod, String module)
		throws FacadeException {

		super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
		super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_VIEW_REPORTS);

		USRRPTKEYViewReports key = new USRRPTKEYViewReports();
		key.setUSRUID(uid);
		key.setIBSLIF(getSessionUser().getE01LAN());
		key.setIBSPER(reportPeriod);
		key.setIBSMOD(module);

		return super.getList(key);
	}
	
	public BeanList getEodGeneratedReports(USRRPTKEYViewReports keyReports)
		throws FacadeException {

		super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
		
		//ESS0030DSMessage sessionUser = getSessionUser();
		CNTRLCNTExtRunDate cntrlibs = getRunDate();
		
		BeanList list = new BeanList();
		
		keyReports.setUSRUID(getUser());
		keyReports.setIBSLIF(getSessionUser().getE01LAN());
		if (keyReports instanceof USRRPTKEYViewGeneratedOnDates) {
			USRRPTKEYViewGeneratedOnDates key = (USRRPTKEYViewGeneratedOnDates) keyReports;
			key.setEDPFLG(keyReports.getIBSPER());
			
			if (EOD.END_OF_MONTH_REPROCESS.equals(keyReports.getIBSPER())
				|| EOD.END_OF_YEAR_REPROCESS.equals(keyReports.getIBSPER())) {
				if (key.getFROMDTY()== null){
					//Returning the reprocess report list
					BigDecimal month = cntrlibs.getCNTRDM();
					BigDecimal year = cntrlibs.getCNTRDY();
					if (cntrlibs.getCNTRDM().intValue() == 1) {
						month = TWELVE;
						year = year.subtract(ONE);
					} else {
						if (EOD.END_OF_YEAR_REPROCESS.equals(keyReports.getIBSPER())) {
							month = TWELVE;
							year = year.subtract(ONE);
						} else {
							month = month.subtract(ONE);
						}
					}
					key.setFROMDTY(year);
					key.setFROMDTM(month);
					key.setFROMDTD(ONE);
					key.setTODTY(year);
					key.setTODTM(month);
					key.setTODTD(new BigDecimal("31"));
				}
				super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_VIEW_GENERATED);
			} else {
				USRRPTKEYViewEODPDF keyByName = (USRRPTKEYViewEODPDF) keyReports;
				if (keyByName.getEDPRPN() == null || "%".equals(keyByName.getEDPRPN())){
					//Report name was not included as a key
					super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_VIEW_GENERATED);
				} else {
					super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_VIEW_EODPDF);
				}
			}
			list = super.getList(key);
		} else {
			USRRPTKEYViewEndOfDayReports key = (USRRPTKEYViewEndOfDayReports) keyReports;
			key.setEDPFLG(keyReports.getIBSPER());
			if (!EOD.END_OF_YEAR_PROCESS.equals(key.getIBSPER())) {
				//If End Of year the End Of Month Process doesn't changes the Run Date
				key.setEDPDTY(cntrlibs.getCNTRDY());
				key.setEDPDTM(cntrlibs.getCNTRDM());
				key.setEDPDTD(cntrlibs.getCNTRDD());
				super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_VIEW_EOD_REPORTS);
				list = super.getList(key);
			}
			if (list.isEmpty()) {
				if (!EOD.END_OF_YEAR_PROCESS.equals(key.getIBSPER())) {
					key.setEDPDTY(cntrlibs.getCNTPDY());
					key.setEDPDTM(cntrlibs.getCNTPDM());
					key.setEDPDTD(cntrlibs.getCNTPDD());
					super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_VIEW_EOD_REPORTS);
					list = super.getList(key);
				} else {
					key.setEDPDTY(cntrlibs.getCNTRDY().subtract(ONE));
					super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_VIEW_EOY_REPORTS);
					list = super.getList(key);
				}
			}
		}
		return list;
	}	
	
	public BeanList getEodGeneratedReports(String user, String flag)
		throws FacadeException {
		USRRPTKEYViewReports key = null;
		if (EOD.END_OF_MONTH_REPROCESS.equals(flag)
				|| EOD.END_OF_YEAR_REPROCESS.equals(flag)) {
			USRRPTKEYViewGeneratedOnDates gKey = new USRRPTKEYViewGeneratedOnDates();
			gKey.setUSRUID(user);
			gKey.setIBSPER(flag);
			key = gKey;
		} else {
			USRRPTKEYViewEndOfDayReports eKey = new USRRPTKEYViewEndOfDayReports();
			eKey.setUSRUID(user);
			eKey.setIBSPER(flag);
			key = eKey;
		}
		return getEodGeneratedReports(key);
	}
	
	public BeanList getEodGeneratedReports(
		String user,
		String reportName,
		BigDecimal fromYear,
		BigDecimal fromMonth,
		BigDecimal fromDay,
		BigDecimal toYear,
		BigDecimal toMonth,
		BigDecimal toDay)
		throws FacadeException {

		USRRPTKEYViewEODPDF key = new USRRPTKEYViewEODPDF(); 
		key.setUSRUID(user);
		key.setEDPRPN(reportName);
		key.setFROMDTY(fromYear);
		key.setFROMDTM(fromMonth);
		key.setFROMDTD(fromDay);
		key.setTODTY(toYear);
		key.setTODTM(toMonth);
		key.setTODTD(toDay);

		return getEodGeneratedReports(key);
	}
	
	public BeanList getUsers(CNTRLBTHKEYViewUsers key)
		throws FacadeException {
	
		super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
		super.setDaoCreationKey(DAOFactoryKeys.SECURITY_VIEW_USERS);
	
		return super.getList(key);
	}
	
	public BeanList getUserAccessToReports(USRRPTKEYViewReportsChecked key)
		throws FacadeException {
	
		super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
		
		if (key instanceof GRPRPTKEYViewReportsChecked) {
			super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_VIEW_GROUP_ACCESS);
		} else {
			super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_VIEW_USER_ACCESS);
		}
		key.setIBSLIF(getSessionUser().getE01LAN());
		return super.getList(key);
	}
	
	public void removeAccessToReports(BeanList list, String type)
		throws FacadeException {
	
		super.setDbConnectionKey(General.DBID_CURRENT_YEAR);

		if ("G".equals(type)) {
			super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_GROUP_ACCESS);
			list.initRow();
			while (list.getNextRow()) {
				GRPRPTKEY key = (GRPRPTKEY) list.getRecord();
				if (key.getUSRUID() == null) {
					throw new FacadeException("Operacion no permitida para todos los usuarios");
				}
				super.delete(key);
			}
		} else {
			super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_USER_ACCESS);
			list.initRow();
			while (list.getNextRow()) {
				USRRPTKEY key = (USRRPTKEY) list.getRecord();
				if (key.getUSRUID() == null) {
					throw new FacadeException("Operacion no permitida para todos los usuarios");
				}
				super.delete(key);
			}
		}
	}
	
	public void addAccessToReports(BeanList list, String type)
		throws FacadeException {
	
		super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
		
		if ("G".equals(type)) {
			super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_GROUP_ACCESS);
			
			list.initRow();
			while (list.getNextRow()) {
				GRPRPT bean = (GRPRPT) list.getRecord();
				GRPRPTKEY key = new GRPRPTKEY();
				key.setUSRUID(bean.getUSRUID());
				key.setUSRRPN(bean.getUSRRPN());
				if (key.getUSRUID() == null) {
					throw new FacadeException("Operacion no permitida para todos los usuarios");
				}			
				super.delete(key);
				super.insert(bean);
			}
		} else {
			super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_USER_ACCESS);
			
			list.initRow();
			while (list.getNextRow()) {
				USRRPT bean = (USRRPT) list.getRecord();
				USRRPTKEY key = new USRRPTKEY();
				key.setUSRUID(bean.getUSRUID());
				key.setUSRRPN(bean.getUSRRPN());
				if (key.getUSRUID() == null) {
					throw new FacadeException("Operacion no permitida para todos los usuarios");
				}			
				super.delete(key);
				super.insert(bean);
			}
		}
	}
	
	public void addAccessToAllReports(String user, String type)
		throws FacadeException, ItemNotFoundException {
	
		if (user.equals(BLANK)) {
			throw new FacadeException("El usuario es mandatorio");
		}
		
		super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
		
		VOSuper bean = null;
		USRRPTKEY key = new USRRPTKEY();
		if ("G".equals(type)) {
			key = new GRPRPTKEY();
		}
	
		key.setUSRUID(user);
		if (key instanceof GRPRPTKEY) {
			super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_GROUP_ACCESS);
			super.delete(key);
			bean = new GRPRPTExtAddAllReports();
			((GRPRPTExtAddAllReports)bean).setUSRUID(user);
			((GRPRPTExtAddAllReports)bean).setIBSLIF(getSessionUser().getE01LAN());
			super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_GROUP_ACCESS_TO_ALL);
			super.insert(bean);
		} else {
			super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_USER_ACCESS);
			super.delete(key);
			bean = new USRRPTExtAddAllReports();
			((USRRPTExtAddAllReports)bean).setUSRUID(user);
			((USRRPTExtAddAllReports)bean).setIBSLIF(getSessionUser().getE01LAN());
			super.setDaoCreationKey(DAOFactoryKeys.SECURITY_REPORTS_USER_ACCESS_TO_ALL);
			super.insert(bean);
		}
	}

	public List getOptionsMainMenu(String lang) throws FacadeException {
		try {
			setDbConnectionKey(General.DBID_CURRENT_YEAR);
			initDao(WEBMODAO.class);
			WEBMOKEY key = new WEBMOKEY();
			key.setMOILIF(lang);
			return (List) getList(key).getList();

		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} 
	}
	
	public List getOptionsSubMenu(String user, String type, String masterid) throws FacadeException {
		try {
			setDbConnectionKey(General.DBID_CURRENT_YEAR);
			KeySuper key;
			if ("G".equals(type)) {
				initDao(WEBCODAOViewTreeByGroup.class);
				key = new WEBCOKEYViewTreeByGroup();
			} else {
				initDao(WEBCODAOViewTreeByUser.class);
				key = new WEBCOKEYViewTreeByUser();
			}
			((WEBCOKEYViewTreeByUser) key).setBTHUSR(user);
			((WEBCOKEYViewTreeByUser) key).setCMOSID(masterid);
			
			return (List) getList(key).getList();

		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} 
	}
	
	public void deleteOptionMenuByUser(String user, BeanList list) throws FacadeException {
		
		VOSuper vo = null;
		KeySuper key = null;
		try {
			setDbConnectionKey(General.DBID_CURRENT_YEAR);
			list.initRow();
			if (list.getNextRow()) {
				vo = (VOSuper) list.getRecord();
				if (vo instanceof WEBOG) {
					initDao(WEBOGDAO.class);
					key = new WEBOGKEY();
					((WEBOGKEY)key).setOGRUSR(user);
				} else {
					initDao(WEBOUDAO.class);
					key = new WEBOUKEY();
					((WEBOUKEY)key).setOUSUSR(user);
				}
				super.delete(key);
			}

		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		}
	}
	
	public void addAccessToAllMenu(String user, String type)
			throws FacadeException, ItemNotFoundException {
		
		try {
			if (user.equals(BLANK)) {
				throw new FacadeException("El usuario es mandatorio");
			}
			
			super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
			
			CNTRLCNTExtRunDate rundate = getRunDate();
			
			VOSuper bean = null;
			KeySuper key = null;
			if ("G".equals(type)) {
				key = new WEBMGRKEY();
			} else {
				key = new WEBMUSKEY();
			}
		
			if (key instanceof WEBMGRKEY) {
				initDao(WEBMGRDAO.class);
				((WEBMGRKEY)key).setOGRUSR(user);
				super.getDao().delete(key);
				bean = new WEBMGRExtAddAllMenu();
				((WEBMGRExtAddAllMenu)bean).setOGRUSR(user);
				((WEBMGRExtAddAllMenu)bean).setOGRLIF(getSessionUser().getE01LAN().toUpperCase());
				((WEBMGRExtAddAllMenu)bean).setOGRLMM(rundate.getCNTRDM());
				((WEBMGRExtAddAllMenu)bean).setOGRLMD(rundate.getCNTRDD());
				((WEBMGRExtAddAllMenu)bean).setOGRLMY(rundate.getCNTRDY());
				
				initDao(WEBMGRDAOExtAddAllMenu.class);
				super.getDao().insert(bean);
			} else {
				initDao(WEBMUSDAO.class);
				((WEBMUSKEY)key).setOUSUSR(user);
				super.getDao().delete(key);
				bean = new WEBMUSExtAddAllMenu();
				((WEBMUSExtAddAllMenu)bean).setOUSUSR(user);
				((WEBMUSExtAddAllMenu)bean).setOUSLIF(getSessionUser().getE01LAN().toUpperCase());
				((WEBMUSExtAddAllMenu)bean).setOUSLMM(rundate.getCNTRDM());
				((WEBMUSExtAddAllMenu)bean).setOUSLMD(rundate.getCNTRDD());
				((WEBMUSExtAddAllMenu)bean).setOUSLMY(rundate.getCNTRDY());
				initDao(WEBMUSDAOExtAddAllMenu.class);
				super.getDao().insert(bean);
			}
		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} catch (DAOException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} finally {
			close();
		}
	}

	public void addAccessToMenu(BeanList list, String type)
			throws FacadeException {
		
		try {
			super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
			
			if ("G".equals(type)) {
				initDao(WEBMGRDAO.class);
				list.initRow();
				while (list.getNextRow()) {
					WEBMGR bean = (WEBMGR) list.getRecord();
					WEBMGRKEY key = new WEBMGRKEY();
					key.setOGRSID(bean.getOGRSID());
					key.setOGRUSR(bean.getOGRUSR());
					key.setOGRDEN(bean.getOGRDEN());
					if (key.getOGRSID() == null) {
						throw new FacadeException("Operacion no permitida para todos los usuarios");
					}			
					super.getDao().delete(key);
					super.getDao().insert(bean);
				}
			} else {
				initDao(WEBMUSDAO.class);
				list.initRow();
				while (list.getNextRow()) {
					WEBMUS bean = (WEBMUS) list.getRecord();
					WEBMUSKEY key = new WEBMUSKEY();
					key.setOUSSID(bean.getOUSSID());
					key.setOUSUSR(bean.getOUSUSR());
					key.setOUSDEN(bean.getOUSDEN());
					if (key.getOUSUSR() == null) {
						throw new FacadeException("Operacion no permitida para todos los usuarios");
					}			
					super.getDao().delete(key);
					super.getDao().insert(bean);
				}
			}
		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} catch (DAOException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} finally {
			close();
		}
	}
		
	public void removeAccessToMenu(BeanList list, String type)
			throws FacadeException {
		
		try {
			super.setDbConnectionKey(General.DBID_CURRENT_YEAR);

			if ("G".equals(type)) {
				initDao(WEBMGRDAO.class);
				list.initRow();
				while (list.getNextRow()) {
					WEBMGRKEY key = (WEBMGRKEY) list.getRecord();
					if (key.getOGRUSR() == null) {
						throw new FacadeException("Operacion no permitida para todos los usuarios");
					}
					super.getDao().delete(key);
				}
			} else {
				initDao(WEBMUSDAO.class);
				list.initRow();
				while (list.getNextRow()) {
					WEBMUSKEY key = (WEBMUSKEY) list.getRecord();
					if (key.getOUSUSR() == null) {
						throw new FacadeException("Operacion no permitida para todos los usuarios");
					}
					super.getDao().delete(key);
				}
			}
		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} catch (DAOException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} finally {
			close();
		}
	}
		
	public void updateOptionMenuByUser(String user, BeanList list) throws FacadeException {
		
		VOSuper vo = null;
		KeySuper key = null;
		try {
			open(General.DBID_CURRENT_YEAR);
			list.initRow();
			if (list.getNextRow()) {
				vo = (VOSuper) list.getRecord();
				if (vo instanceof WEBOG) {
					initDao(WEBOGDAO.class);
					key = new WEBOGKEY();
					((WEBOGKEY)key).setOGRUSR(user);
				} else {
					initDao(WEBOUDAO.class);
					key = new WEBOUKEY();
					((WEBOUKEY)key).setOUSUSR(user);
				}
				//super.delete(key);
				super.insertAll(list, true);
			}

		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} finally {
			close();
		}
	}
	
	public void addAccessToOption(BeanList list, String type)
			throws FacadeException {
		
		try {
			super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
			
			if ("G".equals(type)) {
				initDao(WEBOGDAO.class);
				list.initRow();
				while (list.getNextRow()) {
					WEBOG bean = (WEBOG) list.getRecord();
					WEBOGKEY key = new WEBOGKEY();
					key.setOGRSID(bean.getOGRSID());
					key.setOGRUSR(bean.getOGRUSR());
					key.setOGRDEN(bean.getOGRDEN());
					if (key.getOGRSID() == null) {
						throw new FacadeException("Operacion no permitida para todos los usuarios");
					}			
					super.getDao().delete(key);
					super.getDao().insert(bean);
				}
			} else {
				initDao(WEBOUDAO.class);
				list.initRow();
				while (list.getNextRow()) {
					WEBOU bean = (WEBOU) list.getRecord();
					WEBOUKEY key = new WEBOUKEY();
					key.setOUSSID(bean.getOUSSID());
					key.setOUSUSR(bean.getOUSUSR());
					key.setOUSDEN(bean.getOUSDEN());
					if (key.getOUSUSR() == null) {
						throw new FacadeException("Operacion no permitida para todos los usuarios");
					}			
					super.getDao().delete(key);
					super.getDao().insert(bean);
				}
			}
		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} catch (DAOException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} finally {
			close();
		}
	}
		
	public void removeAccessToOption(BeanList list, String type)
			throws FacadeException {
		
		try {
			super.setDbConnectionKey(General.DBID_CURRENT_YEAR);

			if ("G".equals(type)) {
				initDao(WEBOGDAO.class);
				list.initRow();
				while (list.getNextRow()) {
					WEBOGKEY key = (WEBOGKEY) list.getRecord();
					if (key.getOGRUSR() == null) {
						throw new FacadeException("Operacion no permitida para todos los usuarios");
					}
					super.getDao().delete(key);
				}
			} else {
				initDao(WEBOUDAO.class);
				list.initRow();
				while (list.getNextRow()) {
					WEBOUKEY key = (WEBOUKEY) list.getRecord();
					if (key.getOUSUSR() == null) {
						throw new FacadeException("Operacion no permitida para todos los usuarios");
					}
					super.getDao().delete(key);
				}
			}
		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} catch (DAOException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} finally {
			close();
		}
	}
		
	public void addAccessToAllOption(String user, String type)
			throws FacadeException, ItemNotFoundException {
		
		try {
			if (user.equals(BLANK)) {
				throw new FacadeException("El usuario es mandatorio");
			}
			
			super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
			
			CNTRLCNTExtRunDate rundate = getRunDate();
			
			VOSuper bean = null;
			KeySuper key = null;
			if ("G".equals(type)) {
				key = new WEBOGKEY();
			} else {
				key = new WEBOUKEY();
			}
		
			if (key instanceof WEBOGKEY) {
				initDao(WEBOGDAO.class);
				((WEBOGKEY)key).setOGRUSR(user);
				super.getDao().delete(key);
				bean = new WEBOGExtAddAllOption();
				((WEBOGExtAddAllOption)bean).setOGRUSR(user);
				((WEBOGExtAddAllOption)bean).setOGRLIF(getSessionUser().getE01LAN().toUpperCase());
				((WEBOGExtAddAllOption)bean).setOGRLMM(rundate.getCNTRDM());
				((WEBOGExtAddAllOption)bean).setOGRLMD(rundate.getCNTRDD());
				((WEBOGExtAddAllOption)bean).setOGRLMY(rundate.getCNTRDY());
				
				initDao(WEBOGDAOExtAddAllOption.class);
				super.getDao().insert(bean);
			} else {
				initDao(WEBOUDAO.class);
				((WEBOUKEY)key).setOUSUSR(user);
				super.getDao().delete(key);
				bean = new WEBOUExtAddAllOption();
				((WEBOUExtAddAllOption)bean).setOUSUSR(user);
				((WEBOUExtAddAllOption)bean).setOUSLIF(getSessionUser().getE01LAN().toUpperCase());
				((WEBOUExtAddAllOption)bean).setOUSLMM(rundate.getCNTRDM());
				((WEBOUExtAddAllOption)bean).setOUSLMD(rundate.getCNTRDD());
				((WEBOUExtAddAllOption)bean).setOUSLMY(rundate.getCNTRDY());
				initDao(WEBOUDAOExtAddAllOption.class);
				super.getDao().insert(bean);
			}
		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} catch (DAOException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} finally {
			close();
		}
	}

	public List getGroupList() throws FacadeException {
		try {
			setDbConnectionKey(General.DBID_CURRENT_YEAR);
			initDao(USERSDAOViewByGroup.class);
			return (List) super.getList(new USERSKEYViewByGroup());
		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		}
	}
	
	public List getMainMenu(String user) throws FacadeException {
		try {
			setDbConnectionKey(General.DBID_CURRENT_YEAR);
			WEBMMKEYViewByUser key = new WEBMMKEYViewByUserSecurity();
			key.setBTHUSR(user);
			initDao(WEBMMDAOViewByUserSecurity.class);
			return (List) getList(key).getList();
		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		}
	}
	
	public List getMainMenuHeader(String lang) throws FacadeException {
		try {
			setDbConnectionKey(General.DBID_CURRENT_YEAR);
			initDao(WEBMMDAO.class);
			WEBMMKEY key = new WEBMMKEY();
			key.setMMILIF(lang);
			return (List) getList(key).getList();

		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} 
	}
	
	public List getMainMenuOptions(String user, String type, String masterid) throws FacadeException {
		try {
			setDbConnectionKey(General.DBID_CURRENT_YEAR);
			KeySuper key;
			if ("G".equals(type)) {
				initDao(WEBMMDAOViewTreeByGroup.class);
				key = new WEBMMKEYViewTreeByGroup();
			} else {
				initDao(WEBMMDAOViewTreeByUser.class);
				key = new WEBMMKEYViewTreeByUser();
			}
			((WEBMMKEYViewTreeByUser) key).setBTHUSR(user);
			((WEBMMKEYViewTreeByUser) key).setCMMSID(masterid);
			
			return (List) getList(key).getList();

		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} 
	}
	
	public void updateMainMenuByUser(String user, BeanList list) throws FacadeException {
		
		VOSuper vo = null;
		KeySuper key = null;
		try {
			open(General.DBID_CURRENT_YEAR);
			list.initRow();
			if (list.getNextRow()) {
				vo = (VOSuper) list.getRecord();
				if (vo instanceof WEBMGR) {
					initDao(WEBMGRDAO.class);
					key = new WEBMGRKEY();
					((WEBMGRKEY)key).setOGRUSR(user);
				} else {
					initDao(WEBMUSDAO.class);
					key = new WEBMUSKEY();
					((WEBMUSKEY)key).setOUSUSR(user);
				}
				//super.delete(key);
				super.insertAll(list, true);
			}

		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		} finally {
			close();
		}
	}
	
	public void deleteMainMenuByUser(String user, BeanList list) throws FacadeException {
		VOSuper vo = null;
		KeySuper key = null;
		try {
			setDbConnectionKey(General.DBID_CURRENT_YEAR);
			list.initRow();
			if (list.getNextRow()) {
				vo = (VOSuper) list.getRecord();
				if (vo instanceof WEBMGR) {
					initDao(WEBMGRDAO.class);
					key = new WEBMGRKEY();
					((WEBMGRKEY)key).setOGRUSR(user);
				} else {
					initDao(WEBMUSDAO.class);
					key = new WEBMUSKEY();
					((WEBMUSKEY)key).setOUSUSR(user);
				}
				super.delete(key);
			}

		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		}
	}
	
	public List getMenuModules(WEBMMKEYViewByDescription key) throws FacadeException {
		try {
			setDbConnectionKey(General.DBID_CURRENT_YEAR);
			initDao(WEBMMDAOViewByDescription.class);
			return (List) getList(key).getList();
		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		}
	}
	
	public List getOptionModules(WEBMOKEYViewByDescription key) throws FacadeException {
		try {
			setDbConnectionKey(General.DBID_CURRENT_YEAR);
			initDao(WEBMODAOViewByDescription.class);
			return (List) getList(key).getList();
		} catch (DatabaseAccessException e) {
			e.printStackTrace();
			throw new FacadeException(e.getMessage());
		}
	}
	
	private CNTRLCNTExtRunDate getPreviosEnd(boolean monthly) throws FacadeException {
		
		CNTRLCNTExtRunDate rDate = null;
		setDbConnectionKey(General.DBID_CURRENT_YEAR);
		super.setDaoCreationKey(DAOFactoryKeys.SETUP_CNTRLIBS_EXT_RUN_DATE);
		CNTRLCNTKEYExtRunDate key = new CNTRLCNTKEYExtRunDate();
		key.setCNTBNK(getSessionUser().getE01UBK());
		try {
			rDate = (CNTRLCNTExtRunDate) super.getValue(key);
			if (monthly) {
				rDate.setCNTRDM(rDate.getCNTRDM().subtract(ONE));
			} else {
				rDate.setCNTRDM(TWELVE);
				rDate.setCNTRDY(rDate.getCNTRDY().subtract(ONE));
			}
			Calendar cal = new GregorianCalendar(rDate.getCNTRDY().intValue(), rDate.getCNTRDM().intValue() - 1, 1);
			rDate.setCNTRDD(new BigDecimal(cal.getActualMaximum(Calendar.DAY_OF_MONTH)));
			
			HOLYDKEYView key1 = new HOLYDKEYView();
			while (true) {
				try {
					initDao(HOLYDDAOView.class);
					key1.setHOLDAD(rDate.getCNTRDD());
					key1.setHOLDAM(rDate.getCNTRDM());
					key1.setHOLDAY(rDate.getCNTRDY());
					super.getValue(key1);
					rDate.setCNTRDD(rDate.getCNTRDD().subtract(ONE));
				} catch (ItemNotFoundException e) {
					break;
				}	
			}
			
			return rDate;
			
		} catch (ItemNotFoundException e) {
			System.out.println("Error On Method getPreviosRunDate()");
			throw new FacadeException(e.toString());
		} catch (DatabaseAccessException e) {
			System.out.println("Error On Method getPreviosRunDate()");
			throw new FacadeException(e.toString());
		}
	}
	
	public CNTRLCNTExtRunDate getPreviosEndOfMonth() throws FacadeException {
		return getPreviosEnd(true);
	}

	public CNTRLCNTExtRunDate getPreviosEndOfYear() throws FacadeException {
		return getPreviosEnd(false);
	}

	public boolean hasGroup(String user) throws FacadeException, ItemNotFoundException {
		super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
		super.setDaoCreationKey(DAOFactoryKeys.SECURITY_VIEW_USERS);
		CNTRLBTHKEYViewUsers key = new CNTRLBTHKEYViewUsers();
		key.setBTHUSR(user);
		CNTRLBTHViewUsers vo = (CNTRLBTHViewUsers) getValue(key);
		return !vo.getBTHGRP().trim().equals(""); 
	}

}

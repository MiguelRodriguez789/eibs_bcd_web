package com.datapro.eibs.parameters.loans.object;

/**
 * Insert the type's description here.
 * Creation date: (7/19/00 6:55:55 PM)
 * @author: Ramses
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import java.math.BigDecimal;
import com.datapro.sql.manager.*;
//import com.datapro.eibs.security.access.jdbc.bean.*;
import com.datapro.eibs.parameters.loans.access.jdbc.bean.*;
import com.datapro.eibs.parameters.loans.access.jdbc.dao.*;
import com.datapro.generic.beanutil.*;

import java.sql.Connection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;


public class DealsCntrl {

	/**
	 * 
	 */
	public DealsCntrl() {
		super();
	}
	/**
	 * 
	 */
	public void destroy() {

	}

	

	public DLSPARAMBean getTable(String key) {

		DAODealsCntrl cntrlDao = new DAODealsCntrl("AS400");
		CNTRLDLS dlsBean = null;
		DAODealsFee dlsfeDao = new DAODealsFee("AS400");
		DLSFE feBean = null;
		DLSPARAMBean lnBean = null;
		DynamicDTO dto = new DynamicDTO();
		try {
			
			dlsBean = cntrlDao.select(key);
			feBean = dlsfeDao.select(key,new BigDecimal("0"));
			//userEUPDao.close();
			if (dlsBean != null) {
				if (feBean == null) {
					feBean = new DLSFE();
					feBean.setDLSKEY(dlsBean.getDLSKEY());
				}
				if (dto.load(dlsBean) && dto.load(feBean)) {
					lnBean = new DLSPARAMBean();
					if(! dto.unload(lnBean)) lnBean = null;
				} 
			}	
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		}
				 
		return lnBean;
	}
	
	public DLSPARAMBean getTable(String key, BigDecimal cust) {

		DAODealsCntrl cntrlDao = new DAODealsCntrl("AS400");
		CNTRLDLS dlsBean = null;
		DAODealsFee dlsfeDao = new DAODealsFee("AS400");
		DLSFE feBean = null;
		DLSPARAMBean lnBean = null;
		DynamicDTO dto = new DynamicDTO();
		try {			
			dlsBean = cntrlDao.select(key);						
			if (dlsBean != null) {
				feBean = dlsfeDao.select(key,cust);
				if (feBean != null){
					if (dto.load(dlsBean) && dto.load(feBean)) {
						lnBean = new DLSPARAMBean();
						if(! dto.unload(lnBean)) lnBean = null;
					}
				} 
			}	
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		}
				 
		return lnBean;
	}
	
	public int deleteTable(String key) {
				
		int result = 0;

		try {
			DAODealsCntrl dlsDao = new DAODealsCntrl("AS400");
			result = dlsDao.delete(key);
			if (result != 0) {
				    DAODealsFee dlsfeDao = new DAODealsFee("AS400");
					int result1 = dlsfeDao.delete(key);					
			}
		} catch (Exception e) {
			//flexLog("Error: " + e);
		} 

		return result;
	}
	
	public int deleteTable(String key,BigDecimal cust) {
				
		int result = 0;

		try {			
				    DAODealsFee dlsfeDao = new DAODealsFee("AS400");
					result = dlsfeDao.delete(key,cust);								
		} catch (Exception e) {
			//flexLog("Error: " + e);
		} 

		return result;
	}
	
	public int updateTable(DLSPARAMBean formBean) {
		
		DAODealsCntrl dlsDao = new DAODealsCntrl("AS400");
		DAODealsFee dlsfeDao = new DAODealsFee("AS400");
		CNTRLDLS dlsBean = new CNTRLDLS();
		DLSFE dlsfeBean = new DLSFE();
		
		DynamicDTO dto = new DynamicDTO();
		
		int result=0;
		try {
						
			if (dto.load(formBean)) {
				if(dto.unload(dlsBean) && dto.unload(dlsfeBean)){ 
					result = dlsDao.update(dlsBean);					
					if (result != 0) {
						DLSFE dlsfeBean1 = dlsfeDao.select(dlsBean.getDLSKEY(),new BigDecimal("0"));
						if (dlsfeBean1 != null) result = dlsfeDao.update(dlsfeBean);
						else result = dlsfeDao.insert(dlsfeBean);
					}
				}	
			}	   
		} catch (Exception e) {
			//flexLog("Error: " + e);
		} 
		
		
		return result;
	}
	
	public int updateTableFee(DLSPARAMBean formBean) {
		
		DAODealsFee dlsfeDao = new DAODealsFee("AS400");
		DynamicDTO dto = new DynamicDTO();
		DLSFE dlsfeBean = new DLSFE();
		
		int result=0;
		try {
						
			if (dto.load(formBean)) {
				if(dto.unload(dlsfeBean)) { 		
				result = dlsfeDao.update(dlsfeBean);
				}
			}
			   
		} catch (Exception e) {
			//flexLog("Error: " + e);
		} 
		
		
		return result;
	}
	
	public int addTable(DLSPARAMBean formBean) {
		
		DAODealsFee dlsfeDao = new DAODealsFee("AS400");
		DAODealsCntrl dlsDao = new DAODealsCntrl("AS400");
		CNTRLDLS dlsBean = new CNTRLDLS();
		DLSFE dlsfeBean = new DLSFE();
		
		DynamicDTO dto = new DynamicDTO();
		
		int result=0;
		try {
						
			if (dto.load(formBean)) {
				if(dto.unload(dlsBean) && dto.unload(dlsfeBean)){ 
					result = dlsDao.insert(dlsBean);
					//userBTHDao.close();
					if (result != 0) result = dlsfeDao.insert(dlsfeBean);
					//userEUPDao.close();
				}	
			}	   
		} catch (Exception e) {
			//flexLog("Error: " + e);
		} 
		
		
		return result;
	}
	
	public int addTableFee(DLSPARAMBean formBean) {
		
		DAODealsFee dlsfeDao = new DAODealsFee("AS400");
		DynamicDTO dto = new DynamicDTO();
		DLSFE dlsfeBean = new DLSFE();
		
		int result=0;
		try {	
			if (dto.load(formBean)) {
				if(dto.unload(dlsfeBean)) { 		
				result = dlsfeDao.insert(dlsfeBean);
				}
			}
						    
		} catch (Exception e) {
			//flexLog("Error: " + e);
		} 
		
		
		return result;
	}
	
	public JBObjList getGroupTables(String selBNK, String selBRN) {

		DAODealsCntrl dlsDao = new DAODealsCntrl("AS400");
		
		
		JBObjList dlsParamListBean = new JBObjList();
		JBObjList dlsListBean = new JBObjList();
		try {
			
			dlsListBean = dlsDao.select(selBNK,selBRN);
			if (!dlsListBean.getNoResult()) {
				dlsListBean.initRow();
				CNTRLDLS dlsBean =  null;
				DLSFE dlsfeBean = null;
				
				DAODealsFee dlsfeDao = new DAODealsFee("AS400");
				while (dlsListBean.getNextRow()) {
					dlsBean = (CNTRLDLS) dlsListBean.getRecord();
					dlsfeBean = dlsfeDao.select(dlsBean.getDLSKEY(),new BigDecimal("0"));
					if (dlsfeBean == null) {
						dlsfeBean = new DLSFE();
						dlsfeBean.setDLSKEY(dlsBean.getDLSKEY());
					}
					DynamicDTO dto = new DynamicDTO();
					if (dto.load(dlsBean) && dto.load(dlsfeBean)) {
						DLSPARAMBean paramBean =  new DLSPARAMBean();
						if (dto.unload(paramBean)) dlsParamListBean.addRow(paramBean);			
					}					
				}
			}
			//userDBADao.close();
			
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		}
		 
		return dlsParamListBean;
	}
		
}

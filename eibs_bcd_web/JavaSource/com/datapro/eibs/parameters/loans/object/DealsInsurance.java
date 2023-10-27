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


public class DealsInsurance {

	/**
	 * 
	 */
	public DealsInsurance() {
		super();
	}
	/**
	 * 
	 */
	public void destroy() {

	}

	
	public CNTRLINS getTable(String tbl,String type) {

		DAOInsurance insDao = new DAOInsurance("AS400");
		CNTRLINS insBean = null;
		
		try {
			
			insBean = insDao.select(tbl,type);
			
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		}
				 
		return insBean;
	}
	
	public int deleteTable(String tbl) {
				
		int result = 0;

		try {			
				    DAOInsurance insDao = new DAOInsurance("AS400");
					result = insDao.delete(tbl,"");								
		} catch (Exception e) {
			//flexLog("Error: " + e);
		} 

		return result;
	}
	
	public int updateTable(CNTRLINS formBean) {
		
		DAOInsurance insDao = new DAOInsurance("AS400");
		
		int result=0;
		try {
						
					
			result = insDao.update(formBean);
			
			   
		} catch (Exception e) {
			//flexLog("Error: " + e);
		} 
		
		
		return result;
	}
	
	public int addTable(CNTRLINS formBean) {
		
		DAOInsurance insDao = new DAOInsurance("AS400");
		
		int result=0;
		try {						
			result = insDao.insert(formBean);									    
		} catch (Exception e) {
			//flexLog("Error: " + e);
		} 
		
		
		return result;
	}
	
	public JBObjList getGroupTables() {

		DAOInsurance insDao = new DAOInsurance("AS400");				
		JBObjList insListBean = new JBObjList();
		
		try {			
			insListBean = insDao.select("");
			if (!insListBean.getNoResult()) {
				
			}
			//userDBADao.close();
			
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		}
		 
		return insListBean;
	}
		
}

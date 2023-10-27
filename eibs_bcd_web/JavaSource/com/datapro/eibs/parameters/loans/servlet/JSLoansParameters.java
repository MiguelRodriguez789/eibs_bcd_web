package com.datapro.eibs.parameters.loans.servlet;

/**
 * Insert the type's description here.
 * 
 * @author: Ramses Amaro
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.Socket;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.Set;
import java.util.Iterator;


import com.datapro.eibs.parameters.loans.access.jdbc.bean.*;
import com.datapro.eibs.parameters.loans.object.DealsCntrl;
import com.datapro.generic.beanutil.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.Util;

public class JSLoansParameters extends datapro.eibs.master.SuperServlet {

    //Requests
	protected static final int R_ENTER_TABLE = 1;  //CTRLDLS + DLSFE
	
	
	//Actions
	protected static final int A_ENTER_TABLE = 2; 
	protected static final int A_LIST = 3; 
	protected static final int A_PARAMETERS = 4; 
	
	
	protected static final String PAGE_LN_PARAM_MAINT = "Loans_parameters_maint.jsp";
	protected static final String PAGE_LN_PARAM_ENTER = "Loans_parameters_enter.jsp";
	protected static final String PAGE_LN_PARAM_LIST = "Loans_parameters_list.jsp";
	protected static final String PAGE_LN_PARAM_CONFIRM = "Loans_parameters_confirm.jsp";
	
	protected String LangPath = "S";
	
	/**
	 * JSEODPDF constructor comment.
	 */
	public JSLoansParameters() {
		super();
	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		//dbProp = new DBConnectorProperty();
	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void service(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {

		ESS0030DSMessage msgUser = null;
		HttpSession session = null;

		session = (HttpSession) req.getSession(false);

		if (session == null) {

			try {
				res.setContentType("text/html");
				printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}

		} else {
			try {

				msgUser = (ESS0030DSMessage) session.getAttribute("currUser");

				LangPath = super.rootPath + msgUser.getE01LAN() + "/";
				
				int screen = R_ENTER_TABLE;
				
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}

				switch (screen) {
					case R_ENTER_TABLE :
						procReqLnTableEnter(req, res, session);
						break;
					case A_ENTER_TABLE :
						procActionLnTableEnter(req, res, session);
						break;
					case A_LIST :
						procActionList(req, res, session);
						break;
					case A_PARAMETERS :
						procActionLnTable(req, res, session);
						break;
					default :
						res.sendRedirect(super.srctx + LangPath + super.devPage);
						break;
				}

			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
			}
		}

	}
	
	protected void procReqLnTableEnter(
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
			
		try {
			flexLog("About to call Page: " + LangPath + PAGE_LN_PARAM_ENTER);
			callPage(LangPath + PAGE_LN_PARAM_ENTER, req, res);	
		}
		catch (Exception e) {
			flexLog("Exception calling page " + e);
		}
		
	}
	
	protected void procActionLnTableEnter(
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		DLSPARAMBean lnParam = new DLSPARAMBean();
		DealsCntrl lnMng = new DealsCntrl();
		JBObjList paramLNList = new JBObjList();
		try {
			
			String selBNK = req.getParameter("SELBNK");
			String selTBL = req.getParameter("SELTBL");
			String selPRD = req.getParameter("SELPRD");
			String selTYP = req.getParameter("SELTYP");
			String SELCUN = "";
			String key ="";
			 
			if (selTYP.equals("1")) { //By Product
				if (selTBL.equals("")) {
					paramLNList = lnMng.getGroupTables(selBNK,selPRD);
				} else {
					key =selBNK + selTBL + selPRD;
					lnParam = lnMng.getTable(key);
					if (lnParam != null) paramLNList.addRow(lnParam);
					 
				}	
			} 
			else { //By Client
				key =selBNK + selTBL + selPRD;
				SELCUN = req.getParameter("SELCUN");
				lnParam = lnMng.getTable(key,new BigDecimal(SELCUN));
				if (lnParam != null) paramLNList.addRow(lnParam);
			}
								
			if (paramLNList == null) paramLNList = new JBObjList();
			ses.setAttribute("listLNParam",paramLNList);
			req.setAttribute("SELTYP",selTYP);	
			req.setAttribute("SELBNK",selBNK);
			req.setAttribute("SELTBL",selTBL);
			req.setAttribute("SELPRD",selPRD);
			if (selTYP.equals("2")) req.setAttribute("SELCUN",SELCUN);
			try {
				flexLog("About to call Page: " + LangPath + PAGE_LN_PARAM_LIST);
				callPage(LangPath + PAGE_LN_PARAM_LIST, req, res);	
			}
			catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		} catch (Exception e) {
			flexLog("Error: " + e);
			//change to page of sql error
			res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
		}
	}

	protected void procActionList(
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		DLSPARAMBean lnParam = null;
		DealsCntrl lnMng = new DealsCntrl();
		JBObjList paramLNList = new JBObjList();
		
		try {
			
			String opt = req.getParameter("OPT");
			int row = Integer.parseInt(req.getParameter("ROW"));
			String selBNK = req.getParameter("SELBNK");
			String selTBL = req.getParameter("SELTBL");
			String selPRD = req.getParameter("SELPRD");
			String selTYP = req.getParameter("SELTYP");
			String SELCUN ="0";
			
			if (selTYP.equals("2")) SELCUN = req.getParameter("SELCUN");
			selBNK = Util.addRightChar(' ',2,selBNK);
			selTBL = Util.addRightChar(' ',2,selTBL);
			selPRD = Util.addRightChar(' ',2,selPRD).toUpperCase();
			String key =selBNK + selTBL + selPRD;
			req.setAttribute("OPT",opt);
			if (opt.equals("D")){ //Delete	
				paramLNList = (JBObjList) ses.getAttribute("listLNParam");
				paramLNList.setCurrentRow(row);
				lnParam = (DLSPARAMBean) paramLNList.getRecord();	
				if (selTYP.equals("1")) { //By Product
					lnMng.deleteTable(lnParam.getDLSKEY());
				} else {
						lnMng.deleteTable(lnParam.getDLSKEY(),lnParam.getDLSCUN());
				}
				procActionLnTableEnter(req,res,ses);
			} else {
				if (opt.equals("N")) { //New					
					if (selTYP.equals("2")) { //By Client						
						lnParam = lnMng.getTable(key);
						lnParam.setDLSCUN(new BigDecimal(SELCUN));
					} else {
						lnParam = new DLSPARAMBean();
						if (selTBL.equals("")) key =selBNK + "01" + selPRD; 
						lnParam.setDLSKEY(key);
					}
				} else { //Maintenance
					paramLNList = (JBObjList) ses.getAttribute("listLNParam");
					paramLNList.setCurrentRow(row);
					lnParam = (DLSPARAMBean) paramLNList.getRecord();	
				}
				ses.setAttribute("lnParam",lnParam);
				flexLog("About to call Page: " + LangPath + PAGE_LN_PARAM_LIST);
				callPage(LangPath + PAGE_LN_PARAM_LIST, req, res);
			}
			
			

		} catch (Exception e) {
			flexLog("Error: " + e);
			//change to page of sql error
			res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
		}
	}
	

	
	protected void procActionLnTable(
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
        
        DLSPARAMBean lnParam = new DLSPARAMBean();
		DealsCntrl lnMng = new DealsCntrl();
        
        lnParam = (DLSPARAMBean) ses.getAttribute("lnParam");
        
		BeanParser bp = new BeanParser(lnParam);
		
		int result = 0;
				
		Set ks = bp.getTypes().keySet();
		for (Iterator iter = ks.iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			bp.setString(name, req.getParameter(name));
		}
			
		if (req.getParameter("OPT").equals("N")) {
			if (req.getParameter("SELTYP").equals("1")) result = lnMng.addTable(lnParam);
			else result = lnMng.addTableFee(lnParam);
		} else {
			if (req.getParameter("SELTYP").equals("1")) result = lnMng.updateTable(lnParam);
			else result = lnMng.updateTableFee(lnParam);
		}
        
        ses.setAttribute("lnParam",lnParam);
        if (result !=0) {
        	flexLog("About to call Page: " + LangPath + PAGE_LN_PARAM_CONFIRM);
			callPage(LangPath + PAGE_LN_PARAM_CONFIRM, req, res);
        } else {
        	flexLog("About to call Page: " + LangPath + PAGE_LN_PARAM_MAINT);
			callPage(LangPath + PAGE_LN_PARAM_MAINT, req, res);
        }

	}

}

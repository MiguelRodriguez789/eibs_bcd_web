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
import com.datapro.eibs.parameters.loans.object.DealsInsurance;
import com.datapro.generic.beanutil.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.Util;

public class JSInsurance extends datapro.eibs.master.SuperServlet {

    //Requests
	protected static final int R_ENTER_TABLE = 1;  //CTRLINS
	
	
	//Actions
	protected static final int A_ENTER_TABLE = 2; 
	protected static final int A_LIST = 3; 
	protected static final int A_INSURANCE = 4; 
	
	
	protected static final String PAGE_LN_INS_MAINT = "Loans_insurance_maint.jsp";
	protected static final String PAGE_LN_INS_ENTER = "Loans_insurance_enter.jsp";
	protected static final String PAGE_LN_INS_LIST = "Loans_insurance_list.jsp";
	protected static final String PAGE_LN_INS_CONFIRM = "Loans_insurance_confirm.jsp";
	
	protected String LangPath = "S";
	
	/**
	 * JSInsurance constructor comment.
	 */
	public JSInsurance() {
		super();
	}
	/**
	 * 
	 */
	public void destroy() {

	}
	/**
	 * 
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		//dbProp = new DBConnectorProperty();
	}
	/**
	 * 
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
						procReqInsTableEnter(req, res, session);
						break;
					case A_ENTER_TABLE :						
						procActionInsTableEnter(req, res, session);
						break;
					case A_LIST :
						procActionList(msgUser,req, res, session);
						break;
					case A_INSURANCE :
						procActionInsTable(req, res, session);
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
	/**
	 * 
	 */	
	protected void procReqInsTableEnter(
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
			
		try {
			flexLog("About to call Page: " + LangPath + PAGE_LN_INS_ENTER);
			callPage(LangPath + PAGE_LN_INS_ENTER, req, res);	
		}
		catch (Exception e) {
			flexLog("Exception calling page " + e);
		}
		
	}
	/**
	 * 
	 */	
	protected void procActionInsTableEnter(
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		CNTRLINS insTbl = new CNTRLINS();
		DealsInsurance insMng = new DealsInsurance();
		JBObjList insTblList = new JBObjList();
		try {
			
			String selTBL = req.getParameter("SELTBL");
			String selTYP = req.getParameter("SELTYP");
			
			if (selTBL.equals("")) {
				insTblList = insMng.getGroupTables();
			} else {
				insTbl = insMng.getTable(selTBL,selTYP);
				if (insTbl != null) insTblList.addRow(insTbl);
			}
						
			if (insTblList == null) insTblList = new JBObjList();
			ses.setAttribute("insTblList",insTblList);
			req.setAttribute("SELTYP",selTYP);	
			req.setAttribute("SELTBL",selTBL);
			try {
				flexLog("About to call Page: " + LangPath + PAGE_LN_INS_LIST);
				callPage(LangPath + PAGE_LN_INS_LIST, req, res);	
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
	
	/**
	 * 
	 */
	protected void procActionList(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		CNTRLINS insTbl = null;
		DealsInsurance insMng = new DealsInsurance();
		JBObjList insTblList = new JBObjList();
		
		try {
			
			String opt = req.getParameter("OPT");
			int row = Integer.parseInt(req.getParameter("ROW"));
			String selTBL = req.getParameter("SELTBL");
			String selTYP = req.getParameter("SELTYP");
			
			int result = 0;
			
			req.setAttribute("OPT",opt);
			if (opt.equals("D")){ //Delete	
				insTblList = (JBObjList) ses.getAttribute("insTblList");
				insTblList.setCurrentRow(row);
				insTbl = (CNTRLINS) insTblList.getRecord();	
				
				result = insMng.deleteTable(insTbl.getINSTYP());
				
				procActionInsTableEnter(req,res,ses);
			} else {
				if (opt.equals("N")) { //New										
					insTbl = new CNTRLINS();
					if (selTBL.equals("")) selTBL="01";
					insTbl.setINSTYP(selTBL);
					insTbl.setINSCLS(selTYP);											
				} else { //Maintenance
					insTblList = (JBObjList) ses.getAttribute("insTblList");
					insTblList.setCurrentRow(row);
					insTbl = (CNTRLINS) insTblList.getRecord();		
				}
				
				ses.setAttribute("CURYEAR",Util.formatYear(user.getE01RDY()));
				ses.setAttribute("insTbl",insTbl);
				flexLog("About to call Page: " + LangPath + PAGE_LN_INS_LIST);
				callPage(LangPath + PAGE_LN_INS_LIST, req, res);
			}
			
		} catch (Exception e) {
			flexLog("Error: " + e);
			//change to page of sql error
			res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
		}
	}
	
	/**
	 * 
	 */
	protected void procActionInsTable(
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
        
        CNTRLINS insTbl = new CNTRLINS();
		DealsInsurance insMng = new DealsInsurance();
        
        insTbl = (CNTRLINS) ses.getAttribute("insTbl");
        
		BeanParser bp = new BeanParser(insTbl);
		
		int result = 0;
				
		Set ks = bp.getTypes().keySet();
		for (Iterator iter = ks.iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			bp.setString(name, req.getParameter(name));
		}
			
		if (req.getParameter("OPT").equals("N")) {
			result = insMng.addTable(insTbl);
		} else {
			result = insMng.updateTable(insTbl);
		}
		
        ses.setAttribute("insTbl",insTbl);
        if (result !=0) {
        	flexLog("About to call Page: " + LangPath + PAGE_LN_INS_CONFIRM);
			callPage(LangPath + PAGE_LN_INS_CONFIRM, req, res);
        } else {
        	flexLog("About to call Page: " + LangPath + PAGE_LN_INS_MAINT);
			callPage(LangPath + PAGE_LN_INS_MAINT, req, res);
        }

	}

}

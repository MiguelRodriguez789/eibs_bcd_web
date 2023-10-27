package com.datapro.eibs.internet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.internet.beans.JBLog;
import com.datapro.eibs.internet.databeans.DC_SEARCH;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 * Comercial Letter Of Credit Maintenance
 */
public class JSLogTransSearch extends JSEIBSServlet {

    protected static final int R_TRANSACTION = 1;
    protected static final int A_TRANSACTION = 2;
    protected static final int R_USERS_HELP  = 3;
	
    protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen) {
	        case 1: // '\001'
	            RequestTransactions(user, req, res, session);
	            break;
	        case 2: // '\002'
	            ActionTransactions(user, req, res, session);
	            break;
	        case 3: // '\003'
	            RequestUsersHelp(user, req, res, session);
	            break;
	
	        default:
				forward(devPage, req, res);
	            break;
	        }
	}

	private void RequestUsersHelp(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		JBLog logbean = new JBLog();
		JBObjList lstEntities = logbean.getAllEntities();
		JBList beanList = new JBList();
		
		if (!lstEntities.isEmpty()) {
			StringBuffer myRow = null;
			lstEntities.initRow();
			while (lstEntities.getNextRow()) {
                myRow = new StringBuffer("<TR>");
                myRow.append("<td nowrap><a href=\"javascript:enter('" + lstEntities.getRecord() + "')\">" + lstEntities.getRecord() + "</a></td>");
                myRow.append("</TR>");
			}
		}
        session.setAttribute("lstEntities", beanList);
        forward("DCIBS_users_help.jsp", req, res);
	}

	private void ActionTransactions(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		
		String ENTITY = req.getParameter("ENTITY") == null ? "" : req.getParameter("ENTITY");
		String SEARCH = req.getParameter("SEARCH") == null ? "" : req.getParameter("SEARCH");
		String TRANSCODE = req.getParameter("TRANSCODE") == null ? "" : req.getParameter("TRANSCODE");
		String GTRANSCODE = req.getParameter("GTRANSCODE") == null ? "" : req.getParameter("GTRANSCODE");
		String RTYPE = req.getParameter("RTYPE") == null ? "R" : req.getParameter("RTYPE");
		
        String FD1 = req.getParameter("FD1") != null ? req.getParameter("FD1") : "0";
        String FD2 = req.getParameter("FD2") != null ? req.getParameter("FD2") : "0";
        String FD3 = req.getParameter("FD3") != null ? req.getParameter("FD3") : "0";
        String ED1 = req.getParameter("ED1") != null ? req.getParameter("ED1") : "0";
        String ED2 = req.getParameter("ED2") != null ? req.getParameter("ED2") : "0";
        String ED3 = req.getParameter("ED3") != null ? req.getParameter("ED3") : "0";
        
        DC_SEARCH paramters = new DC_SEARCH();
        
        paramters.setENTITYID(ENTITY);
        paramters.setSEARCH(SEARCH);
        paramters.setTRANSCODE(TRANSCODE);
        paramters.setFD1(FD1);
        paramters.setFD2(FD2);
        paramters.setFD3(FD3);
        paramters.setED1(ED1);
        paramters.setED2(ED2);
        paramters.setED3(ED3);
        
        String FDATE = String.valueOf(Integer.parseInt("20" + FD3) * 10000 + Integer.parseInt(FD1) * 100 + Integer.parseInt(FD2));
        String EDATE = String.valueOf(Integer.parseInt("20" + ED3) * 10000 + Integer.parseInt(ED1) * 100 + Integer.parseInt(ED2));
     
        int FromRecord = 0;
        JBLog logbean = new JBLog();
        JBObjList lstTransactions = new JBObjList();
        
        if ("R".equals(RTYPE)) {
        	if ("00000".equals(TRANSCODE) && "D".equals(SEARCH)) {
        		lstTransactions = logbean.getLogListAllUsersAllTransacByDate(ENTITY, FDATE, EDATE, FromRecord);
        	} else if ("00000".equals(TRANSCODE) && "A".equals(SEARCH)) {
        		lstTransactions = logbean.getLogListAllUsersAll(ENTITY, FromRecord);
        	} else if (!"00000".equals(TRANSCODE) && "D".equals(SEARCH)) {
        		lstTransactions = logbean.getLogListAllUserTransAllDate(ENTITY, TRANSCODE, FDATE, EDATE, FromRecord);
        	} else if (!"00000".equals(TRANSCODE) && "A".equals(SEARCH)) {
        		lstTransactions = logbean.getLogListAllUserTransNoDate(ENTITY, TRANSCODE, FromRecord);
        	}
            session.setAttribute("paramters", paramters);
        	pageName = "DCIBS_log_transaction_list.jsp";
        } else {
        	if ("00000".equals(GTRANSCODE)) {
        		lstTransactions = logbean.getGLogListAllUsersAll1(ENTITY, FromRecord);
        	} else {
        		lstTransactions = logbean.getGLogListAllUsersAll2(GTRANSCODE, FromRecord);
        	}
            session.setAttribute("GTTYPE", paramters);
        	pageName = "DCIBS_log_transaction_graph.jsp";
        }
        session.setAttribute("lstTransactions", lstTransactions);
        forward(pageName, req, res);
	}

	private void RequestTransactions(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		JBLog logbean = new JBLog();
		JBObjList lstEntities = logbean.getAllEntities();
		JBObjList lstTransactions = logbean.getListTrans();
		
        session.setAttribute("userPO", new UserPos());
        session.setAttribute("lstEntities", lstEntities);
        session.setAttribute("lstTransactions", lstTransactions);
        session.setAttribute("error", new ELEERRMessage());
        
        forward("DCIBS_log_transaction.jsp", req, res);
	}

}

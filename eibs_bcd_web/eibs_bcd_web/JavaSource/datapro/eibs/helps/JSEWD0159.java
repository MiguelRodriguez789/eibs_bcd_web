package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0159DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEWD0159 extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException,IOException {
			
		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0159", req);
			EWD0159DSMessage msgHelp = (EWD0159DSMessage) mp.getMessageRecord("EWD0159DS");
			msgHelp.setEWDCNV(req.getParameter("EWDCNV") == null ? "0" : req.getParameter("EWDCNV"));
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0159DSMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<td nowrap align=\"center\"><a href=\"javascript:enter('"
							+ msgHelp.getEWDCNV()
							+ "','"
							+ msgHelp.getEWDSEQ()
							+ "','"
							+ msgHelp.getEWDDES()
							+ "')\">"
							+ msgHelp.getEWDCNV()
							+ "</a></td>");
					myRow.append(
						"<td nowrap align=\"left\"><a href=\"javascript:enter('"
							+ msgHelp.getEWDCNV()
							+ "','"
							+ msgHelp.getEWDSEQ()
							+ "','"
							+ msgHelp.getEWDDES()							
							+ "')\">"
							+ msgHelp.getEWDSEQ()
							+ "</a></td>");
					myRow.append(
							"<td nowrap align=\"left\"><a href=\"javascript:enter('"
							+ msgHelp.getEWDCNV()
							+ "','"
							+ msgHelp.getEWDSEQ()
							+ "','"
							+ msgHelp.getEWDDES()							
							+ "')\">"
							+ msgHelp.getEWDDES()
							+ "</a></td>");					
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("help", beanList);
				pageName = "EWD0159_pagaduria_help.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

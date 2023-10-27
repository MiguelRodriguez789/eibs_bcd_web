package com.datapro.eibs.internet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS204001Message;
import datapro.eibs.beans.ESS204002Message;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 * Comercial Letter Of Credit Maintenance
 */
public class JSESS2040 extends JSEIBSServlet {

	protected static final int A_STATUS 		= 2;
	protected static final int R_STATUS 		= 3;
	protected static final int A_ACTIVATE 		= 4;
	protected static final int R_ACTIVATE 		= 5;
	protected static final int R_VIEW_DETAIL 	= 10;
	protected static final int R_INQ_USER    	= 11;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_STATUS :
				procReqStatus(user, req, res, session);
				break;
			case A_STATUS :
				procActionStatus(user, req, res, session);
				break;
			case R_ACTIVATE :
				procReqActivate(user, req, res, session);
				break;
			case A_ACTIVATE :
				procActionActivate(user, req, res, session);
				break;
			case R_VIEW_DETAIL :
				procReqUserDetail(user, req, res, session);
				break;	
			case R_INQ_USER :
				procInqUserDetail(user, req, res, session);
				break;	
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqUserDetail(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		String USERID = req.getParameter("USERID") == null ? "" : req.getParameter("USERID"); 
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2040", req);
			ESS204002Message msgDetail = (ESS204002Message) mp.getMessageRecord("ESS204002");
			msgDetail.setH02USERID(user.getH01USR());
			msgDetail.setH02PROGRM("ESS2040");
			msgDetail.setH02TIMSYS(getTimeStamp());
			msgDetail.setH02OPECOD("0001");
			msgDetail.setE02EUSUSR(USERID);
			msgDetail.setE02EUSENT("");
            
			mp.sendMessage(msgDetail);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgDetail = (ESS204002Message) mp.receiveMessageRecord("ESS204002");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("userDetail", msgDetail);
				pageName =  "1".equals(msgDetail.getE02EUSCTY()) ? "ESS2040_Details_Corporate.jsp" : "ESS2040_Details_Personal.jsp";
			}
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procInqUserDetail(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		String USERID = req.getParameter("USERID") == null ? "" : req.getParameter("USERID"); 
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2040", req);
			ESS204002Message msgDetail = (ESS204002Message) mp.getMessageRecord("ESS204002");
			msgDetail.setH02USERID(user.getH01USR());
			msgDetail.setH02PROGRM("ESS2040");
			msgDetail.setH02TIMSYS(getTimeStamp());
			msgDetail.setH02OPECOD("0002");
			msgDetail.setE02EUSUSR(USERID);
			msgDetail.setE02EUSENT("");
            
			mp.sendMessage(msgDetail);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgDetail = (ESS204002Message) mp.receiveMessageRecord("ESS204002");
		
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("userDetail", msgDetail);
				pageName =  "1".equals(msgDetail.getE02EUSCTY()) ? "ESS2040_Inq_Details_Corporate.jsp" : "ESS2040_Inq_Details_Personal.jsp";
			}
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionActivate(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String USERID = req.getParameter("USERID") == null ? "" : req.getParameter("USERID"); 
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2040", req);
			ESS204001Message msgList = (ESS204001Message) mp.getMessageRecord("ESS204001");
            msgList.setH01USERID(user.getH01USR());
            msgList.setH01PROGRM("ESS2040");
            msgList.setH01TIMSYS(getTimeStamp());
            msgList.setH01OPECOD("0005");
            msgList.setH01FLGWK1(req.getParameter("AOPT") == null ? "" : req.getParameter("AOPT"));
            msgList.setE01EUSUSR(USERID);
            
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
	            forward("error_viewer.jsp", req, res);
			} else {
				procReqActivate(user, req, res, session);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqActivate(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2040", req);
			ESS204001Message msgList = (ESS204001Message) mp.getMessageRecord("ESS204001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESS2040");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("0016");
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01FINREC");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				list.initRow();
				JBList beanList = new JBList(); 
				StringBuffer myRow = null;
				while (list.getNextRow()) {
					msgList = (ESS204001Message) list.getRecord();
					String sStatus = "";
					if ("1".equals(msgList.getE01EUSSTS())) {
						sStatus = "Activo";
					} else if ("2".equals(msgList.getE01EUSSTS())) {
						sStatus = "Inactivo";
					} else if ("3".equals(msgList.getE01EUSSTS())) {
						sStatus = "Suspendido";
					} else if ("4".equals(msgList.getE01EUSSTS())) {
						sStatus = "Pendiente";
					}
					String sType = "";
					if ("1".equals(msgList.getE01EUSCTY())) {
						sType = "Corporativo";
					} else if ("2".equals(msgList.getE01EUSCTY())) {
						sType = "Personal";
					}	
	                String link = "<a href='javascript:CenterWindow(webapp+\"/servlet/com.datapro.eibs.internet.JSESS2000?SCREEN=409&TYPE=2&CUSID=" + msgList.getE01EUSUSR() + "\",850,850,2)'>";
	                String linkf = "</a>";
	                myRow = new StringBuffer("<TR>");
	                myRow.append("<TD width=10%><input type=\"radio\" name=\"USERID\" checked value=\"" + msgList.getE01EUSUSR() + "\"></TD>");
	                myRow.append("<TD width=20%>" + link + msgList.getE01EUSUSR() + linkf + "</TD>");
	                myRow.append("<TD width=20%>" + msgList.getE01EUSCUN() + "</TD>");
	                myRow.append("<TD width=30%>" + msgList.getE01CUSNA1() + "</TD>");
	                myRow.append("<TD width=10%>" + sStatus + "</TD>");
	                myRow.append("<TD width=10%>" + sType + "</TD>");
	                myRow.append("</TR>");

					beanList.addRow("", myRow.toString());
				}
				
				if (beanList.getNoResult()) {
					pageName = "MISC_no_result.jsp";
				} else {
					beanList.setShowPrev(list.getShowPrev());
					beanList.setShowNext(list.getShowNext());
					
					session.setAttribute("appList", beanList);
					pageName = "ESS2040_activate_list.jsp";
				}
			}
			session.setAttribute("error", msgError);
			
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionStatus(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String USERID = req.getParameter("USERID") == null ? "" : req.getParameter("USERID"); 
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2040", req);
			ESS204001Message msgList = (ESS204001Message) mp.getMessageRecord("ESS204001");
            msgList.setH01USERID(user.getH01USR());
            msgList.setH01PROGRM("ESS2040");
            msgList.setH01TIMSYS(getTimeStamp());
            msgList.setH01OPECOD("0005");
            msgList.setE01EUSUSR(USERID);
            
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
	            forward("error_viewer.jsp", req, res);
			} else {
				procReqStatus(user, req, res, session);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqStatus(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2040", req);
			ESS204001Message msgList = (ESS204001Message) mp.getMessageRecord("ESS204001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESS2040");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("0015");
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01FINREC");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				list.initRow();
				JBList beanList = new JBList(); 
				StringBuffer myRow = null;
				while (list.getNextRow()) {
					msgList = (ESS204001Message) list.getRecord();
					String sStatus = "";
					if ("1".equals(msgList.getE01EUSSTS())) {
						sStatus = "Activo";
					} else if ("2".equals(msgList.getE01EUSSTS())) {
						sStatus = "Inactivo";
					} else if ("3".equals(msgList.getE01EUSSTS())) {
						sStatus = "Suspendido";
					} else if ("4".equals(msgList.getE01EUSSTS())) {
						sStatus = "Pendiente";
					}
					String sType = "";
					if ("1".equals(msgList.getE01EUSCTY())) {
						sType = "Corporativo";
					} else if ("2".equals(msgList.getE01EUSCTY())) {
						sType = "Personal";
					}	
					String link = "<a href='javascript:CenterWindow(webapp+\"/servlet/com.datapro.eibs.internet.JSESS2040?SCREEN=11&USERID=" + msgList.getE01EUSUSR() + "\",850,750,2)'>";
					String linkf = "</a>";
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD width=10%><input type=\"radio\" name=\"USERID\" checked value=\"" + msgList.getE01EUSUSR() + "\"></TD>");
					myRow.append("<TD width=20%>" + link + msgList.getE01EUSUSR() + linkf + "</TD>");
					myRow.append("<TD width=20%>" + link + msgList.getE01EUSCUN() + linkf +  "</TD>");
					myRow.append("<TD width=30%>" + link + msgList.getE01CUSNA1() + linkf +  "</TD>");
					myRow.append("<TD width=10%>" + link + sStatus + linkf +  "</TD>");
					myRow.append("<TD width=10%>" + link + sType + linkf +  "</TD>");		
					myRow.append("</TR>");

					beanList.addRow("", myRow.toString());
				}
				
				if (beanList.getNoResult()) {
					pageName = "MISC_no_result.jsp";
				} else {
					beanList.setShowPrev(list.getShowPrev());
					beanList.setShowNext(list.getShowNext());
					
					session.setAttribute("appList", beanList);
					pageName = "ESS2040_status_list.jsp";
				}
			}
			session.setAttribute("error", msgError);
			
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

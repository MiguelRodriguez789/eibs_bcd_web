package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPR011001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEPR0110 extends JSEIBSServlet {

	protected static final int R_LIST_INCOMING_OPENING = 1;
	protected static final int R_LIST_INCOMING_PAYMENT = 2;
	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_LIST_INCOMING_OPENING :
				procReqListIncomingOpening(user, req, res, session);
				break;
			case R_LIST_INCOMING_PAYMENT :
				procReqListIncomingPayment(user, req, res, session);
				break;	
					
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqListIncomingPayment(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0430", req);
			EPR011001Message msgList = (EPR011001Message) mp.getMessageRecord("EPR011001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01OPECOD("0001"); //Opening
			msgList.setH01FLGWK2("I");
			
			mp.sendMessage(msgList);
			
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "EPR1060_pr_inq_search.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgList = (EPR011001Message) list.getRecord();
					myRow = new StringBuffer("<TR>");
					
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgList.getE01WRTNUM()
							+ "','"
							+ msgList.getE01WRTAMT()
							+ "')\">"
							+ msgList.getE01WRTNUM()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgList.getE01WRTNUM()
							+ "','"
							+ msgList.getE01WRTAMT()
							+ "')\">"
							+ Util.fcolorCCY(msgList.getE01WRTAMT())
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgList.getE01WRTNUM()
							+ "','"
							+ msgList.getE01WRTAMT()
							+ "')\">"
							+ msgList.getE01REMARK()
							+ "</a></td>");
					myRow.append("</TR>");
					
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("epr0110Help", beanList);
				
				pageName = beanList.getNoResult() ? "MISC_no_result.jsp" : "EPR0110_wires_help.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqListIncomingOpening(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0430", req);
			EPR011001Message msgList = (EPR011001Message) mp.getMessageRecord("EPR011001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01OPECOD("0002"); //Opening
			msgList.setH01FLGWK2("I");
			
			mp.sendMessage(msgList);
			
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "EPR1060_pr_inq_search.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgList = (EPR011001Message) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgList.getE01WRTNUM()
							+ "','"
							+ msgList.getE01WRTAMT()
							+ "')\">"
							+ msgList.getE01WRTNUM()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgList.getE01WRTNUM()
							+ "','"
							+ msgList.getE01WRTAMT()
							+ "')\">"
							+ Util.fcolorCCY(msgList.getE01WRTAMT())
 							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgList.getE01WRTNUM()
							+ "','"
							+ msgList.getE01WRTAMT()
							+ "')\">"
							+ msgList.getE01REMARK()
							+ "</a></td>");
					myRow.append("</TR>");
					
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("epr0110Help", beanList);
				
				pageName = beanList.getNoResult() ? "MISC_no_result.jsp" : "EPR0110_wires_help.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

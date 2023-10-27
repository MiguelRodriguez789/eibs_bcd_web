package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0118DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0118 extends JSEIBSServlet {

	protected static final int R_R04M07 = 1;
	protected static final int R_R04M03 = 2;
	protected static final int R_CHKBOOK = 3;
	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			//Request
			case R_R04M07 :
				procReqR04M07(user, req, res, session);
				break;
			case R_R04M03 :
				procReqR04M03(user, req, res, session);
				break;
			case R_CHKBOOK :
				procReqTypChkBook(user, req, res, session);
				break;
		}
	}

	private void procReqTypChkBook(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0118", req);
			EWD0118DSMessage msgHelp = (EWD0118DSMessage) mp.getMessageRecord("EWD0118DS");
			try {
				msgHelp.setEWDATY(req.getParameter("PRODTYP") == null ? "" : req.getParameter("PRODTYP"));
			} catch (Exception e) {
				msgHelp.setEWDATY("");
			}
			if (req.getParameter("CCY2") ==  null ) {
				try {
					msgHelp.setEWDCCY(req.getParameter("CCY") == null ? "" : req.getParameter("CCY"));
				} catch (Exception e) {
					msgHelp.setEWDCCY("");
				}
			}	
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0118Help", list);
				
				pageName = "EWD0118_rt_typ_chkbook_helpmessage.jsp";
			}
			
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqR04M03(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0118", req);
			EWD0118DSMessage msgHelp = (EWD0118DSMessage) mp.getMessageRecord("EWD0118DS");
			
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
					msgHelp = (EWD0118DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDCLS()								
								+ "')\">"
								+ msgHelp.getEWDCCY()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDCLS()								
								+ "')\">"
								+ msgHelp.getEWDATY()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDCLS()								
								+ "')\">"
								+ msgHelp.getEWDTBL()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDCLS()								
								+ "')\">"
								+ msgHelp.getEWDCLS()
								+ "</a></td>");		
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDCLS()								
								+ "')\">"
								+ msgHelp.getEWDDSC()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDCLS()								
								+ "')\">"
								+ msgHelp.getEWDNCK()
								+ "</a></td>");		
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0118Help", beanList);
				
				pageName = "EWD0118_rt_typ_check_helpmessage.jsp";
			}
			
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqR04M07(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0118", req);
			EWD0118DSMessage msgHelp = (EWD0118DSMessage) mp.getMessageRecord("EWD0118DS");
			try {
				msgHelp.setEWDATY(req.getParameter("PRODTYP") == null ? "" : req.getParameter("PRODTYP"));
			} catch (Exception e) {
				msgHelp.setEWDATY("");
			}
			try {
				msgHelp.setEWDCCY(req.getParameter("CCY") == null ? "" : req.getParameter("CCY"));
			} catch (Exception e) {
				msgHelp.setEWDCCY("");
			}
			
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
					msgHelp = (EWD0118DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTCB()
								+ "')\">"
								+ msgHelp.getEWDTCB()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTCB()
								+ "')\">"
								+ msgHelp.getEWDATY()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTCB()
								+ "')\">"
								+ msgHelp.getEWDCCY()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTCB()
								+ "')\">"
								+ msgHelp.getEWDDSC()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTCB()
								+ "')\">"
								+ msgHelp.getEWDNCK()
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0118Help", beanList);
				
				pageName = "EWD0118_rt_typ_check_helpmessage.jsp";
			}
			
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

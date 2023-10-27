package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0012DSMessage;
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
public class JSEWD0012 extends JSEIBSServlet {

	private static final int R_CCY_HELP			 = 1;
	private static final int R_CCY_HELP_LIST 	 = 2;
	private static final int R_PAY_INST_CCY_HELP = 3;

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_CCY_HELP :
				procReqCCYHelp(user, req, res, session);
				break;
			case R_CCY_HELP_LIST :
				procReqCCYHelpList(user, req, res, session);
				break;							
			case R_PAY_INST_CCY_HELP :
				procReqPayInstCCYHelp(user,	req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqPayInstCCYHelp(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0012", req);
			EWD0012DSMessage msgHelp = (EWD0012DSMessage) mp.getMessageRecord("EWD0012DS");
			msgHelp.setEWDSHR(user.getE01UBK());
			
			mp.sendMessage(msgHelp);
            
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				boolean firstTime = true;
				String chk = "";
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0012DSMessage) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<td><input type='radio' name='CCY' value='"
							+ msgHelp.getEWDCCY()
							+ "' onclick=\"javascript:submit();\""
							+ chk
							+ "></td>");
					myRow.append(
						"<td><b>"
							+ msgHelp.getEWDCCY()
							+ "</b> - "
							+ msgHelp.getEWDDSC()
							+ "</td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());

				session.setAttribute("ewd0012Help", beanList);
				pageName = "EWD0012_ccy_list_for_payment_instructions.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqCCYHelpList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0012", req);
			EWD0012DSMessage msgHelp = (EWD0012DSMessage) mp.getMessageRecord("EWD0012DS");
			msgHelp.setEWDSHR(user.getE01UBK());
			
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
					msgHelp = (EWD0012DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelp.getEWDCCY()
							+ "','"								
							+ msgHelp.getEWDDSC()
							+ "')\">"
							+ msgHelp.getEWDCCY()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelp.getEWDCCY()
							+ "','"								
							+ msgHelp.getEWDDSC()
							+ "')\">"
							+ msgHelp.getEWDEXR()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelp.getEWDCCY()
							+ "','"								
							+ msgHelp.getEWDDSC()
							+ "')\">"
							+ msgHelp.getEWDDSC()
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());

				session.setAttribute("ewd0012Help", beanList);
				pageName = "EWD0012_currency_helpmessage_desc.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqCCYHelp(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0012", req);
			EWD0012DSMessage msgHelp = (EWD0012DSMessage) mp.getMessageRecord("EWD0012DS");
			msgHelp.setEWDSHR(user.getE01UBK());
			
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
					msgHelp = (EWD0012DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelp.getEWDCCY()
							+ "')\">"
							+ msgHelp.getEWDCCY()
							+ "</a></td>");
					myRow.append(
						"<td nowrap align='left'><a href=\"javascript:enter('"
							+ msgHelp.getEWDCCY()
							+ "')\">"
							+ msgHelp.getEWDDSC()
							+ "</a></td>");
					myRow.append(
							"<td nowrap align='right' ><a href=\"javascript:enter('"
								+ msgHelp.getEWDCCY()
								+ "')\">"
								+ msgHelp.getEWDEXR()
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());

				session.setAttribute("ewd0012Help", beanList);
				pageName = "EWD0012_currency_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

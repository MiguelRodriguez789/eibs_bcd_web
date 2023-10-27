package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0011DSMessage;
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
public class JSEWD0011 extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0011", req);
			EWD0011DSMessage msgHelp = (EWD0011DSMessage) mp.getMessageRecord("EWD0011DS");
			try {
				msgHelp.setEWDSNU(req.getParameter("BudgetNum").trim());
			} catch (Exception e) {
				msgHelp.setEWDSNU("1");
			}
			try {
				msgHelp.setEWDSBK(req.getParameter("BankNumber").trim());
			} catch (Exception e) {
				msgHelp.setEWDSBK("01");
			}
			try {
				msgHelp.setEWDSCY(req.getParameter("Currency").trim());
			} catch (Exception e) {
				msgHelp.setEWDSCY("USD");
			}
			try {
				msgHelp.setEWDREC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgHelp.setEWDREC("1");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE", "EWDREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0011DSMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td NOWRAP ><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDBNK())
								+ "</a></td>");
					myRow.append(
							"<td NOWRAP ><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "')\">"
								+ Util.formatCell(
									msgHelp.getEWDCCY().toUpperCase())
								+ "</a></td>");
					myRow.append(
							"<td NOWRAP ><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDNUM())
								+ "</a></td>");
					myRow.append(
						"<td NOWRAP ><a href=\"javascript:enter('"
							+ msgHelp.getEWDNUM()
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDCCN())
							+ "</a></td>");
					myRow.append(
						"<td NOWRAP ><a href=\"javascript:enter('"
							+ msgHelp.getEWDNUM()
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDNME())
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				req.setAttribute("FromRecord", req.getParameter("FromRecord"));
				req.setAttribute("BankNumber", req.getParameter("BankNumber"));
				req.setAttribute("Currency", req.getParameter("Currency"));
				req.setAttribute("BudgetNum", req.getParameter("BudgetNum"));
					
				session.setAttribute("ewd0011Help", beanList);
				pageName = "EWD0011_client_help_helpmessage.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

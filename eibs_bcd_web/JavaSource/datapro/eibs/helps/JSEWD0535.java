package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0535DSMessage;
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
public class JSEWD0535 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0535", req);
			EWD0535DSMessage msgHelp = (EWD0535DSMessage) mp.getMessageRecord("EWD0535DS");
			try {
				msgHelp.setEWDBNK(req.getParameter("Bank").trim());
			} catch (Exception e) {
				msgHelp.setEWDBNK("");
			}
			try {
				msgHelp.setEWDBRN(req.getParameter("Branch").trim());
			} catch (Exception e) {
				msgHelp.setEWDBRN("");
			}
			try {
				msgHelp.setEWDTIP(req.getParameter("Type").trim());
			} catch (Exception e) {
				msgHelp.setEWDTIP("");
			}
			try {
				msgHelp.setEWDSUB(req.getParameter("Sub").trim());
			} catch (Exception e) {
				msgHelp.setEWDSUB("");
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
					msgHelp = (EWD0535DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDLOT()
								+ "','"
								+ msgHelp.getEWDBAL()
								+ "','"
								+ msgHelp.getEWDINI()
								+ "','"
								+ msgHelp.getEWDFIN()
								+ "')\">"
								+ msgHelp.getEWDLOT()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDLOT()
								+ "','"
								+ msgHelp.getEWDBAL()
								+ "','"
								+ msgHelp.getEWDINI()
								+ "','"
								+ msgHelp.getEWDFIN()
								+ "')\">"
								+ msgHelp.getEWDBAL()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDLOT()
								+ "','"
								+ msgHelp.getEWDBAL()
								+ "','"
								+ msgHelp.getEWDINI()
								+ "','"
								+ msgHelp.getEWDFIN()
								+ "')\">"
								+ msgHelp.getEWDINI()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDLOT()
								+ "','"
								+ msgHelp.getEWDBAL()
								+ "','"
								+ msgHelp.getEWDINI()
								+ "','"
								+ msgHelp.getEWDFIN()
								+ "')\">"
								+ msgHelp.getEWDFIN()
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0535Help", beanList);
				
				pageName = "EWD0535_value_paper_brlot_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

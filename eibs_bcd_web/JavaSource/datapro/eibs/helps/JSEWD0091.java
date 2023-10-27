package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0091DSMessage;
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
public class JSEWD0091 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0091", req);
			EWD0091DSMessage msgHelp = (EWD0091DSMessage) mp.getMessageRecord("EWD0091DS");
			try {
				msgHelp.setEWDDSC(req.getParameter("NameSearch").toUpperCase());
			} catch (Exception e) {
				msgHelp.setEWDDSC("");
			}
			try {
				msgHelp.setEWDREC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgHelp.setEWDREC("0");
			}
			try {
				msgHelp.setEWDCOD(req.getParameter("shrCode").trim());
			} catch (Exception e) {
				msgHelp.setEWDCOD("");
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
					msgHelp = (EWD0091DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td NOWRAP ><a href=\"javascript:enter('"
								+ msgHelp.getEWDCOD()
								+ "','"
								+ msgHelp.getEWDDSC()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDCOD())
								+ "</a></td>");
					myRow.append(
						"<td NOWRAP ><a href=\"javascript:enter('"
							+ msgHelp.getEWDCOD()
							+ "','"
							+ msgHelp.getEWDDSC()
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDDSC())
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				req.setAttribute("NameSearch", req.getParameter("NameSearch"));
				req.setAttribute("shrSelect", req.getParameter("shrSelect"));
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0091Help", beanList);
				
				pageName = "EWD0091_client_help_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0008DSMessage;
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
public class JSEWD0008T extends JSEIBSServlet {

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
			mp = getMessageProcessor("EWD0008", req);
			EWD0008DSMessage msgHelp = (EWD0008DSMessage) mp.getMessageRecord("EWD0008DS", user.getH01USR(), "");
			msgHelp.setEWDSBK(user.getE01UBK());
			msgHelp.setEWDUSR(user.getH01USR());
			try {
				msgHelp.setEWDSCA(req.getParameter("APPCODE").toUpperCase());
			} catch (Exception e) {
				msgHelp.setEWDSCA("");
			}
			try {
				msgHelp.setEWDSPR(req.getParameter("ATYPE").toUpperCase());
			} catch (Exception e) {
				msgHelp.setEWDSPR("");
			}
			try {
				msgHelp.setEWDTYP(req.getParameter("ATYPE").toUpperCase());
			} catch (Exception e) {
				msgHelp.setEWDTYP("");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				StringBuffer myRow = null;
				JBList beanList = new JBList();
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0008DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td NOWRAP ALIGN=CENTER><a href=\"javascript:enter('"
								+ msgHelp.getEWDCDE()
								+ "','"
								+ msgHelp.getEWDDSC()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDCDE())
								+ "</a></td>");
						myRow.append(
							"<td NOWRAP ALIGN=CENTER><a href=\"javascript:enter('"
								+ msgHelp.getEWDCDE()
								+ "','"
								+ msgHelp.getEWDDSC()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDTYP())
								+ "</a></td>");
						myRow.append(
							"<td NOWRAP ALIGN=CENTER><a href=\"javascript:enter('"
								+ msgHelp.getEWDCDE()
								+ "','"
								+ msgHelp.getEWDDSC()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDCCY())
								+ "</a></td>");
						myRow.append(
							"<td NOWRAP ><a href=\"javascript:enter('"
								+ msgHelp.getEWDCDE()
								+ "','"
								+ msgHelp.getEWDDSC()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDDSC())
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setShowNext(list.getShowNext());
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0008Help", beanList);
				
				pageName = "EWD0008T_client_help_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
		
	}

}

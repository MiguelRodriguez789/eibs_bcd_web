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
public class JSEWD0008 extends JSEIBSServlet {

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
			msgHelp.setEWDUSR(user.getH01USR());
			msgHelp.setEWDSBK(user.getE01UBK());	
			msgHelp.setEWDSCA(req.getParameter("AppCode") == null ? "" : req.getParameter("AppCode").toUpperCase());
			msgHelp.setEWDSBK(req.getParameter("ProductBank") == null ? "" : req.getParameter("ProductBank"));
			msgHelp.setEWDSPR(req.getParameter("srhProduct") == null ? "" : req.getParameter("srhProduct").toUpperCase());
			
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
							+ Util.formatJavascript(msgHelp.getField("EWDDSC"))
							+ "','"
							+ msgHelp.getEWDTYP()
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDCDE())
							+ "</a></td>");
					myRow.append(
						"<td NOWRAP ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getEWDCDE()
							+ "','"
							+ Util.formatJavascript(msgHelp.getField("EWDDSC"))
							+ "','"
							+ msgHelp.getEWDTYP()
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDTYP())
							+ "</a></td>");
					myRow.append(
						"<td NOWRAP ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getEWDCDE()
							+ "','"
							+ Util.formatJavascript(msgHelp.getField("EWDDSC"))
							+ "','"
							+ msgHelp.getEWDTYP()
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDCCY())
							+ "</a></td>");
					myRow.append(
						"<td NOWRAP ><a href=\"javascript:enter('"
							+ msgHelp.getEWDCDE()
							+ "','"
							+ Util.formatJavascript(msgHelp.getField("EWDDSC"))
							+ "','"
							+ msgHelp.getEWDTYP()
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDDSC())
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setShowNext(list.getShowNext());
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0008Help", beanList);
				req.setAttribute(
						"AppCode",
						req.getParameter("AppCode"));
					req.setAttribute(
						"ProductBank",
						req.getParameter("ProductBank"));
					req.setAttribute(
						"srhProduct",
						req.getParameter("srhProduct"));
				
				pageName = "EWD0008_client_help_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
		
	}

}

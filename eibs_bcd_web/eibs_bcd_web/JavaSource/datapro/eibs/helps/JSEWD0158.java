package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0158DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEWD0158 extends JSEIBSServlet { 

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
			mp = getMessageProcessor("EWD0158", req);
			EWD0158DSMessage msgHelp = (EWD0158DSMessage) mp.getMessageRecord("EWD0158DS");
			msgHelp.setEWDUSR(user.getH01USR());
			msgHelp.setEWDDES(req.getParameter("srchCovenioDsc") == null ? "" : req.getParameter("srchCovenioDsc").toUpperCase());
			
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
					msgHelp = (EWD0158DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td NOWRAP ALIGN=CENTER><a href=\"javascript:enter('"
								+ msgHelp.getEWDCDE()
								+ "','"
								+ Util.formatJavascript(msgHelp.getField("EWDDES"))
								+ "','"
								+ Util.formatJavascript(msgHelp.getField("EWDFL1"))
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDCDE())
								+ "</a></td>");
					myRow.append(
						"<td NOWRAP ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getEWDCDE()
							+ "','"
							+ Util.formatJavascript(msgHelp.getField("EWDDES"))
							+ "','"
							+ Util.formatJavascript(msgHelp.getField("EWDFL1"))
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDCTY())
							+ "</a></td>");
					myRow.append(
						"<td NOWRAP ALIGN=LEFT><a href=\"javascript:enter('"
							+ msgHelp.getEWDCDE()
							+ "','"
							+ Util.formatJavascript(msgHelp.getField("EWDDES"))
							+ "','"
							+ Util.formatJavascript(msgHelp.getField("EWDFL1"))
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDDES())
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setShowNext(list.getShowNext());
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0158Help", beanList);
				req.setAttribute("srchCovenioDsc",req.getParameter("srchCovenioDscsrchCovenioDsc"));

				pageName = "EWD0158_Deal_Table.jsp";
			}
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
}


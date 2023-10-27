package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0016DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEWD0016 extends JSEIBSServlet {

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
			mp = getMessageProcessor("EWD0016", req);
			EWD0016DSMessage msgHelp = (EWD0016DSMessage) mp.getMessageRecord("EWD0016DS");
			try{
				msgHelp.setEWDSAC(req.getParameter("AccountNum").trim());
			} catch (Exception e) {
				msgHelp.setEWDSAC("");
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
					msgHelp = (EWD0016DSMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "')\">"
								+ msgHelp.getEWDNUM()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "')\">"
								+ msgHelp.getEWDNME()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "')\">"
								+ Util.formatDate(
									msgHelp.getEWDCO1(),
									msgHelp.getEWDCO2(),
									msgHelp.getEWDCO3())
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("ewd0016Help", beanList);
				pageName = "EWD0016_subaccount_helpmessage.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

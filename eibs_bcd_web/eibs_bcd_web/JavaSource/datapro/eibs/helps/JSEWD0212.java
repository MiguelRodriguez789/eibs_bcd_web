package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0212DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEWD0212 extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0212", req);
			EWD0212DSMessage msgHelp = (EWD0212DSMessage) mp.getMessageRecord("EWD0212DS");
			
			try {
				msgHelp.setEWDCOD(req.getParameter("code"));
			} catch (Exception e) {
				msgHelp.setEWDCOD("");
			}

			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0212DSMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap align=\"center\" width=\"25%\"><a href=\"javascript:enter('"
								+ msgHelp.getEWDCOD()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDCOD())
								+ "</a></td>");
					myRow.append(
							"<td nowrap align=\"center\" width=\"75%\"><a href=\"javascript:enter('"
								+ msgHelp.getEWDCOD()
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
				
				session.setAttribute("EWD0212Help", beanList);
				forward("EWD0212_help_helpmessage.jsp", req, res);
			}	
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

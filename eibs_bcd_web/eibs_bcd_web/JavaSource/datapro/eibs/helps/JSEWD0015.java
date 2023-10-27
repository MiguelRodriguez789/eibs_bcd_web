package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0015DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEWD0015 extends JSEIBSServlet {

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
			mp = getMessageProcessor("EWD0015", req);
			EWD0015DSMessage msgHelp = (EWD0015DSMessage) mp.getMessageRecord("EWD0015DS");
			String type = "";
			String relCust = "0";
			String relLine = "";
			try { 
				msgHelp.setEWDTYP(req.getParameter("type"));
			} catch (Exception e) {
			}
			try { 
				msgHelp.setEWDRCU(req.getParameter("relCust"));
			} catch (Exception e) {
			}
			try { 
				msgHelp.setEWDRNU(req.getParameter("relLine"));
			} catch (Exception e) {
			}
			try{
				msgHelp.setEWDSCU(req.getParameter("CustNum").trim());
			} catch (Exception e) {
				msgHelp.setEWDSCU("0");
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
					msgHelp = (EWD0015DSMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap align=center><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "')\">"
								+ msgHelp.getEWDNUM()
								+ "</a></td>");
						myRow.append(
							"<td nowrap align=\"center\"><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "')\">"
								+ msgHelp.getEWDCCY()
								+ "</a></td>");
						myRow.append(
							"<td nowrap align=center><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "')\">"
								+ msgHelp.getEWDTYL()
								+ "</a></td>");
						myRow.append(
							"<td nowrap align=center><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "')\">"
								+ Util.formatDate(
									msgHelp.getEWDMT1(),
									msgHelp.getEWDMT2(),
									msgHelp.getEWDMT3())
								+ "</a></td>");
						myRow.append(
							"<td nowrap align=\"right\"><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "')\">"
								+ Util.formatCCY(msgHelp.getEWDAMN())
								+ "</a></td>");
						myRow.append(
							"<td nowrap align=\"right\"><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "')\">"
								+ Util.fcolorCCY(msgHelp.getEWDBAL())
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("ewd0015Help", beanList);
				pageName = "EWD0015_creditline_helpmessage.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

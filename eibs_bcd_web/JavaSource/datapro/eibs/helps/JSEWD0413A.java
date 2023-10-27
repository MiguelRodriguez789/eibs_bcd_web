package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0413DSMessage;
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
public class JSEWD0413A extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0413", req);
			EWD0413DSMessage msgHelp = (EWD0413DSMessage) mp.getMessageRecord("EWD0413DS");
			try {
				msgHelp.setEWDTPL(req.getParameter("type").trim());
			} catch (Exception e) {
				msgHelp.setEWDTPL("");
			}
			try {
				msgHelp.setEWDFLG(req.getParameter("codeflag").trim());
			} catch (Exception e) {
				msgHelp.setEWDFLG("");
			}
			try {
				msgHelp.setEWDBRN(req.getParameter("branch").trim());  
			} catch (Exception e)	{
				msgHelp.setEWDBRN("");              	  
			}
			try {
				msgHelp.setEWDUSE(req.getParameter("user").trim());  
			} catch (Exception e)	{
				msgHelp.setEWDUSE("");              	  
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
					msgHelp = (EWD0413DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "','"
								+ msgHelp.getEWDMOX()
								+ "','"
								+ Util.formatYear(msgHelp.getEWDYEX())
								+ "','"
								+ msgHelp.getEWDDAS()
								+ "','"
								+ msgHelp.getEWDMOS()
								+ "','"
								+ msgHelp.getEWDYES()
								+"')\">"
								+ msgHelp.getEWDNUM()
								+ "</a></td>");
						myRow.append(
							"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "','"
								+ msgHelp.getEWDMOX()
								+ "','"
								+ Util.formatYear(msgHelp.getEWDYEX())
								+ "','"
								+ msgHelp.getEWDDAS()
								+ "','"
								+ msgHelp.getEWDMOS()
								+ "','"
								+ msgHelp.getEWDYES()
								+"')\">"
								+ Util.formatCustomDate(user.getE01DTF(), msgHelp.getEWDMOS(), msgHelp.getEWDDAS(), msgHelp.getEWDYES())
								+ "</a></td>");
						myRow.append(
							"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
								+ msgHelp.getEWDNUM()
								+ "','"
								+ msgHelp.getEWDMOX()
								+ "','"
								+ Util.formatYear(msgHelp.getEWDYEX())
								+ "','"
								+ msgHelp.getEWDDAS()
								+ "','"
								+ msgHelp.getEWDMOS()
								+ "','"
								+ msgHelp.getEWDYES()
								+"')\">"
								+ msgHelp.getEWDMOX() + "/" + Util.formatYear(msgHelp.getEWDYEX())
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0413Help", beanList);
				
				pageName = "EWD0413A_cc_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

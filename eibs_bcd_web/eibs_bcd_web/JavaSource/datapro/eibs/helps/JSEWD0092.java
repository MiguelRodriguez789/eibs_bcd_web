package datapro.eibs.helps;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0092DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author fhernandez
 *
 */
public class JSEWD0092 extends JSEIBSServlet {
	
	private static final long serialVersionUID = 6050413570369180699L;

	protected void processRequest(ESS0030DSMessage user,
		HttpServletRequest req, HttpServletResponse res,
		HttpSession session, int screen) throws ServletException,
		IOException {
		switch (screen) {
			case 2:
				actionMessage(user, req, res, session);
				break;
			default:
				main(user, req, res, session);
				break;
		}
	}
	
	protected void main(ESS0030DSMessage user,
		HttpServletRequest req, HttpServletResponse res,
		HttpSession session) throws ServletException,
		IOException {
		
		String shrAcc = req.getParameter("shrAcc");
		String shrCategory = req.getParameter("shrCategory");
		int varGroup = 0;
		if ("ALL".equals(shrCategory)) {
			//if category == blank then group by category
			varGroup = 1;
		} else if ("SUMMARY".equals(shrCategory)) {
			varGroup = 2;
		} else {
			varGroup = 0;
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0092", req);
			EWD0092DSMessage msgHelp = (EWD0092DSMessage) mp.getMessageRecord("EWD0092DS");
			try {
				msgHelp.setEWDNRO(shrAcc.trim());
			} catch (Exception e) {
			}
			msgHelp.setEWDCOD(varGroup == 0 ? "0002" : "0001");
			if (msgHelp.getEWDCOD().equals("0002")) {
				try {
					msgHelp.setEWDPRO(req.getParameter("Seq").trim());
				} catch (Exception e) {
				}
				try {
					msgHelp.setSWDSCA(req.getParameter("Name").trim());
				} catch (Exception e) {
				}
			}
			try {
				msgHelp.setEWDREC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgHelp.setEWDREC("0");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList beanList = mp.receiveMessageRecordList("EWDOPE", "EWDREC");
			
			if (mp.hasError(beanList)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(beanList);
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			} else {
				if (varGroup == 1) {
					session.setAttribute("EWD0092Help", beanList);
					forward("EWD0092_ofac_help_helpmessage.jsp", req, res);
				} else {
					session.setAttribute("EWD0092HelpDetail", beanList);
					if (varGroup == 2) {
						forward("EWD0092_ofac_help_detail.jsp", req, res);
					} else {
						forward("EWD0092_ofac_help_matches.jsp", req, res);
					}					
				}
			}
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	private void closeTopWindow(PrintWriter out){
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>Close</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
		out.println("		top.opener.goAction(top.opener.option)");
		out.println("		top.close()");
		out.println("</SCRIPT>");
		out.println("<P>Close it!!!</P>");
		out.println("</BODY>");
		out.println("</HTML>");
		out.close();
	}

	protected void actionMessage(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws ServletException,
			IOException {
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0092", req);
			EWD0092DSMessage msgHelp = (EWD0092DSMessage) mp.getMessageRecord("EWD0092DS");
			msgHelp.setSWDUSR(user.getH01USR());
			msgHelp.setEWDCOD("0003");
			try {
				msgHelp.setEWDACN(req.getParameter("Number").trim());
			} catch (Exception e) {
			}
			try {
				msgHelp.setEWDNRO(req.getParameter("Seq").trim());
			} catch (Exception e) {
			}
		
			mp.sendMessage(msgHelp);
			
			MessageRecord message = mp.receiveMessageRecord();
			if (mp.hasError(message)) {
				session.setAttribute("error", message);
				forward("error_viewer.jsp", req, res);
			} else {
				closeTopWindow(res.getWriter());
			}
		} finally {
			if (mp != null) mp.close();
		}
	}
}

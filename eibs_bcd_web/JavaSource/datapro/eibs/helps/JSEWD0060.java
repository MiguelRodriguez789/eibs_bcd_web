package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0060DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0060 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0060", req);
			EWD0060DSMessage msgHelp = (EWD0060DSMessage) mp.getMessageRecord("EWD0060DS");
			try {
				msgHelp.setEWDSSH(req.getParameter("NameSearch").toUpperCase());
			} catch (Exception e) {
				msgHelp.setEWDSSH("");
			}
			try {
				msgHelp.setEWDREC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgHelp.setEWDREC("0");
			}
			try {
				msgHelp.setEWDSTY(req.getParameter("Type").trim());
			} catch (Exception e) {
				msgHelp.setEWDSTY("1");
			}
			try {
				msgHelp.setEWDSCY(req.getParameter("Ccy").trim());
			} catch (Exception e) {
				msgHelp.setEWDSCY(" ");
			}
			try {
				msgHelp.setEWDSST(req.getParameter("Sel").trim());
			} catch (Exception e) {
				msgHelp.setEWDSST("D");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE", "EWDREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0060Help", list);
				session.setAttribute("error", new ELEERRMessage());
				req.setAttribute("NameSearch", req.getParameter("NameSearch"));
				req.setAttribute("FromRecord", req.getParameter("FromRecord"));
				req.setAttribute("Type", req.getParameter("Type"));
				req.setAttribute("Ccy", req.getParameter("Ccy"));
				req.setAttribute("Sel", req.getParameter("Sel"));
				
				pageName = "EWD0060_official_checks_helpmessage.jsp";
			}
			
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

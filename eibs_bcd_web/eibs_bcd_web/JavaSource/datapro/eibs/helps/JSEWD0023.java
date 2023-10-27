package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0023DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0023 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0023", req);
			EWD0023DSMessage msgHelp = (EWD0023DSMessage) mp.getMessageRecord("EWD0023DS");
			try {
				msgHelp.setEWDSHR(req.getParameter("NameSearch").toUpperCase());
			} catch (Exception e) {
				msgHelp.setEWDSHR("");
			}
			try {
				msgHelp.setEWDREC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgHelp.setEWDREC("0");
			}
			try {
				msgHelp.setEWDTYP(req.getParameter("Type").trim());
			} catch (Exception e) {
				msgHelp.setEWDTYP("*");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE", "EWDREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0023Help", list);
				session.setAttribute("error", new ELEERRMessage());
				req.setAttribute("NameSearch", req.getParameter("NameSearch"));
				req.setAttribute("FromRecord", req.getParameter("FromRecord"));
				req.setAttribute("Type", req.getParameter("Type"));
				
				pageName = "EWD0023_brkr_help_helpmessage.jsp";
			}
			
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

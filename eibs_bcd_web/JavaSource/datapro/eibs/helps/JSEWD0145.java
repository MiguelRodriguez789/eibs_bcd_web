package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0145DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0145 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		String Opt = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0145", req);
			EWD0145DSMessage msgHelp = (EWD0145DSMessage) mp.getMessageRecord("EWD0145DS");
			try {
				msgHelp.setE01SELLNS(req.getParameter("Account").trim());
			} catch (Exception e) {
				msgHelp.setE01SELLNS("");
			}
			try {
				msgHelp.setE01SELIDE(req.getParameter("id").trim());
			} catch (Exception e) {
				msgHelp.setE01SELIDE("");
			}
			try {
				msgHelp.setE01SELSTS(req.getParameter("Status").trim());
			} catch (Exception e) {
				msgHelp.setE01SELSTS("");
			}
			if (!msgHelp.getE01SELLNS().equals("0")
					|| !msgHelp.getE01SELLNS().trim().equals("")) {
				Opt = "LN";
			} else if (msgHelp.getE01SELIDE().equals("0")
					|| msgHelp.getE01SELIDE().trim().equals("")) {
				Opt = "LN";
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("E01ENDFLD");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				req.setAttribute("Account", req.getParameter("Account"));
				req.setAttribute("Status",	req.getParameter("Status"));
				req.setAttribute("FromRecord",	req.getParameter("FromRecord"));
				req.setAttribute("OPT", Opt);
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0145Help", list);
				
				pageName = "EWD0145_ln_doc_help_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

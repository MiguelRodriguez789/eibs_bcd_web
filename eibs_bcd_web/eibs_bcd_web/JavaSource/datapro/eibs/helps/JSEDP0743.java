package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDP074301Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEDP0743 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EDP0743", req);
			EDP074301Message msgHelp = (EDP074301Message) mp.getMessageRecord("EDP074301");
			msgHelp.setH01USERID(user.getH01USR());
			msgHelp.setH01PROGRM("EDP0743");
			msgHelp.setH01TIMSYS(getTimeStamp());
			msgHelp.setH01OPECOD("0015");
			try {
				msgHelp.setE01APCTYP(req.getParameter("E01APCTYP").trim());
			} catch (Exception e) {
				msgHelp.setE01APCTYP("");
			}
			try {
				msgHelp.setH01FLGWK1(req.getParameter("H01FLGWK1").trim());
			} catch (Exception e) {
				msgHelp.setH01FLGWK1("");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				flexLog("Putting java beans into the session");
				session.setAttribute("edp0743Help", list);
				
				pageName = "EWD_EDP0743_help_message.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

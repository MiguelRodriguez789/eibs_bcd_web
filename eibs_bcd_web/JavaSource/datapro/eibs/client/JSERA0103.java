package datapro.eibs.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ERA010301Message;
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
public class JSERA0103 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("ERA0103", req);
			ERA010301Message msgHelp = (ERA010301Message) mp.getMessageRecord("ERA010301");
			msgHelp.setH01USERID(user.getH01USR());
			msgHelp.setH01PROGRM("ERA0103");
			msgHelp.setH01TIMSYS(getTimeStamp());
			msgHelp.setH01OPECOD("0015");
			try {
				msgHelp.setH01OPECOD(req.getParameter("OPECOD"));
			} catch (Exception e) {
				msgHelp.setH01OPECOD("0015");
			}
			try {
				msgHelp.setE01RESFCL(req.getParameter("cun"));
			} catch (Exception e) {
				msgHelp.setE01RESFCL("0");
			}
			try {
				msgHelp.setE01RESFLN(req.getParameter("line"));
			} catch (Exception e) {
				msgHelp.setE01RESFLN("0");
			}
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				flexLog("Putting java beans into the session");
				session.setAttribute("ERA0103HELP", list);
				pageName = "ERA0103_reserves_by_line_inq.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

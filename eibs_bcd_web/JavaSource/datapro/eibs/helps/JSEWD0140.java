package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0140DSMessage;
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
public class JSEWD0140 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0140", req);
			EWD0140DSMessage msgHelp = (EWD0140DSMessage) mp.getMessageRecord("EWD0140DS");
			msgHelp.setE01SHRNME(Util.getReqParameter("NameSearch", req));
			msgHelp.setE01NUMREC(Util.getReqParameter("FromRecord", req , "0"));
			msgHelp.setE01SHRTYP(Util.getReqParameter("Type", req , "A"));
			msgHelp.setE01SHRCUN(Util.getReqParameter("Cust", req , "0"));

			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				req.setAttribute("NameSearch", req.getParameter("NameSearch"));
				req.setAttribute("FromRecord", req.getParameter("FromRecord"));
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0140Help", list);
				pageName = "EWD0140_acceptant_help_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

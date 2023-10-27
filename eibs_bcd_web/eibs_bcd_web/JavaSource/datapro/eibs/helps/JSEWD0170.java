package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0170DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0170 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0170", req);
			EWD0170DSMessage msgHelp = (EWD0170DSMessage) mp.getMessageRecord("EWD0170DS");
			try {
				msgHelp.setEWDSHO(req.getParameter("SelOld").trim());
			} catch (Exception e) {
				msgHelp.setEWDSHO("");
			}
			try {
				msgHelp.setEWDSHN(req.getParameter("SelNew").trim());
			} catch (Exception e) {
				msgHelp.setEWDSHN("");
			}
			try {
				msgHelp.setEWDREC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgHelp.setEWDREC("0");
			}
			try {
				msgHelp.setEWDRTP(req.getParameter("codeflag").trim());
			} catch (Exception e) {
				msgHelp.setEWDRTP("");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				req.setAttribute("SelOld", req.getParameter("SelOld"));
				req.setAttribute("SelNew", req.getParameter("SelNew"));
				req.setAttribute("FromRecord", req.getParameter("FromRecord"));
				req.setAttribute("Type", req.getParameter("Type"));
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0170Help", list);
				
				pageName = "EWD0170_dft_hlp_acpt_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

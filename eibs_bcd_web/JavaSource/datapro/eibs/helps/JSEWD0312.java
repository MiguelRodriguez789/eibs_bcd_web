package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0312DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0312 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0312", req);
			EWD0312DSMessage msgHelp = (EWD0312DSMessage) mp.getMessageRecord("EWD0312DS");
			try {
				msgHelp.setSWDTYP(req.getParameter("shrType").trim());
			} catch (Exception e) {
				msgHelp.setSWDTYP("");
			}
			try {
				msgHelp.setSWDTBL(req.getParameter("shrTable").trim());
			} catch (Exception e) {
				msgHelp.setSWDTBL("");
			}
			try {
				msgHelp.setSWDCUN(req.getParameter("shrCust").trim());
			} catch (Exception e) {
				msgHelp.setSWDCUN("");
			}
			try {
				msgHelp.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgHelp.setRWDFRC("0");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("SWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0312Help", list);
				
				pageName = "EWD0312_tb_comm_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

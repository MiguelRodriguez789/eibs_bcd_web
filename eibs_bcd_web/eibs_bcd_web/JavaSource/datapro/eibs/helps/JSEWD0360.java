package datapro.eibs.helps; 


/**
 * Insert the type's description here.
 * Creation date: (04/25/08 6:08:55 PM)
 * @author: Frank Hernandez
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0360DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0360 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {

		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EWD0360");
			EWD0360DSMessage msg =
				(EWD0360DSMessage) mp.getMessageRecord("EWD0360DS");

			msg.setRWDUSR(user.getH01USR());
			try {
				msg.setRWDTYP(req.getParameter("Type").trim());
			} catch (Exception e) {
			}
			try {
				msg.setRWDNME(req.getParameter("NameSearch").trim());
			} catch (Exception e) {
			}
			try {
				msg.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msg.setRWDFRC("0");
			}

			mp.sendMessage(msg);
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				session.setAttribute("EWD0360List", list);
				forward("EWD0360_help_message.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}
}
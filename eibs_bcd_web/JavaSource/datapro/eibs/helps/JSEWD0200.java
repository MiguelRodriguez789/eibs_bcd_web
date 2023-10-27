package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0200DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEWD0200 extends JSEIBSServlet{

	private static final long serialVersionUID = 8234711855127356129L;

	
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
			mp = getMessageProcessor("EWD0200", req);
	
			EWD0200DSMessage msgHelp = (EWD0200DSMessage)mp.getMessageRecord("EWD0200DS");
			try {
				msgHelp.setEWDCUN(req.getParameter("CustNum"));
			} catch (Exception e) {
			}

			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			session.setAttribute("helpList", list);
			forward("EWD0200_covenant_request.jsp", req, res);
			
			
		} catch (Exception e) {
			if (mp != null) mp.close();
		}
	}
}
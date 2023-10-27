package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0205DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEWD0205 extends JSEIBSServlet{


	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		String codigo =	req.getParameter("codigo");
		if (codigo!=null && !"".equals(codigo)){
			MessageProcessor mp = null;
			int rows = 0;
		
			try {
				mp = getMessageProcessor("EWD0205", req);
		
				MessageRecord newmessage = null;
				EWD0205DSMessage msgHelp = null;
		               
				// Send Request
				msgHelp = (EWD0205DSMessage)mp.getMessageRecord("EWD0205DS");
				msgHelp.setEWDCDE(codigo);

				mp.sendMessage(msgHelp);
				
				JBObjList list = mp.receiveMessageRecordList("EWDOPE");
				
				session.setAttribute("helpList", list);
				req.setAttribute("searchCode", codigo);
				forward("EWD0205_covenant_form.jsp", req, res);
				
				
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}
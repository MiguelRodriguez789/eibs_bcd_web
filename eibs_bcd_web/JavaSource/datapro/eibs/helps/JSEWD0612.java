package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0612DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

@SuppressWarnings("serial")
public class JSEWD0612 extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException,IOException {
			
		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0612", req);
			EWD0612DSMessage msgHelp = (EWD0612DSMessage) mp.getMessageRecord("EWD0612DS");
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("ewd0612help", list);
				pageName = "EWD0612_cobranza_help.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

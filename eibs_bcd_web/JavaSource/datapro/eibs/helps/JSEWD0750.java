package datapro.eibs.helps;
 
/**
 * This type was created by Catalina Sepulveda.
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0750DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEWD0750 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2142158706669460629L;
	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}


	/**
	 * @author csepulveda
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @param screen
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException,
			IOException {

		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("EWD0750", req);
			
			EWD0750DSMessage  msgHelp = (EWD0750DSMessage) mp.getMessageRecord("EWD0750DS");
			mp.sendMessage(msgHelp);
			
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("SWDOPE");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
			} else {
				session.setAttribute("msgHelp", list);
			}
			forward("EWD0750_available_safedeposit_help.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
}
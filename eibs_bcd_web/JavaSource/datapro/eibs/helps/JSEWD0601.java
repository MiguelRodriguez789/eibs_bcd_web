package datapro.eibs.helps;
 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0601DSMessage;
import datapro.eibs.beans.EWD0602DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEWD0601 extends JSEIBSServlet {


	private static final long serialVersionUID = 2142158706669460629L;
	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		
		MessageProcessor mp = null;
		EWD0601DSMessage msgHelp = null ;

		try {
			
			mp = getMessageProcessor("EWD0601", req);
			msgHelp = (EWD0601DSMessage) mp.getMessageRecord("EWD0601DS");
			
			msgHelp.setEWDTBL( req.getParameter("EWDTBL") );
			
			mp.sendMessage(msgHelp);
			
			
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("EWDOPE");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
			} else {
				session.setAttribute("msgHelp", list);
			}
			//forward("EWD0602_SEPOMEX.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
		
	}



}
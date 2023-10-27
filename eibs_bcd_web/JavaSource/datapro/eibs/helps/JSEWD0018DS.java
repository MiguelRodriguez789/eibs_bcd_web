package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0018DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0018DS extends JSEWD0018 {

	protected static final int R_LIST 		= 1;
	protected static final int A_DELETE 	= 400;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_LIST :							
				main(user, req, res, session);
				break;	
			case A_DELETE :
				procActionDelete(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		JBObjList beanList = (JBObjList) session.getAttribute("msgList");
		
		MessageProcessor mp = null;
		try {
			int row = Integer.parseInt(req.getParameter("CURRENTROW"));
			mp = getMessageProcessor("EWD0018", req);
			EWD0018DSMessage msgHelp = (EWD0018DSMessage) beanList.get(row);
			
			EWD0018DSMessage msgPart = (EWD0018DSMessage) mp.getMessageRecord("EWD0018DS");
			msgPart.setEWDCTC(msgHelp.getEWDCTC());
			msgPart.setRWDUSR(user.getH01USR());
			
			mp.sendMessage(msgPart);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				main(user, req, res, session);
			} else {
				forward("EWD0018DS_county_codes_list.jsp", req, res);
			}
			
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		} finally {
			if (mp != null) mp.close();
		}
	}

	
}

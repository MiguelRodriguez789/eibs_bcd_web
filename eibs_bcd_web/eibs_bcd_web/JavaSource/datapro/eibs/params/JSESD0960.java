package datapro.eibs.params;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Orestes Garcia
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD096001Message;
import datapro.eibs.beans.ESD400001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSESD0960 extends JSEIBSServlet {
	

	protected void processRequest(
		ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession session, int screen )
		throws ServletException, IOException {
		
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;		
		try {
			
			mp = getMessageProcessor("ESD0960", req);

			ESD096001Message msgList = (ESD096001Message) mp.getMessageRecord("ESD096001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0960");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0005");

			setMessageRecord(req, msgList);
			msgList.setE01OLDCIU("");
		 	
			mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (ESD096001Message) mp.receiveMessageRecord();	

			if ( ! "0".equals( msgError.getERRNUM() ) ) {
				session.setAttribute("error", msgError) ;
				res.sendError( HttpServletResponse.SC_NOT_IMPLEMENTED );
			}


		} finally {
			if (mp != null)	mp.close();
		}
		
		
	}

}
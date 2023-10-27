package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EPV015601Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;


public class JSEPV0156 extends JSEIBSServlet {
	
	protected static final int R_ENTER = 100;
	protected static final int A_ENTER = 101;
	protected static final int A_ENTER_TASA = 200;
	protected static final int R_CONSULTA_TASA = 300;


	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen){
			case R_ENTER: 
				procReqEnter(user, req, res, session);
            	break;
			case A_ENTER: 
				procActionEnter(user, req, res, session);
            	break;								
			case A_ENTER_TASA :
				procActionTasa(user, req, res, session);
				break;
			case R_CONSULTA_TASA: 
				procReqConsultaTasa(user, req, res, session);
            	break;		
			default :
				forward(devPage, req, res);
				break;
		}
	}

	protected void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		ELEERRMessage msgError = null;
		
		try {
			
			msgError = new ELEERRMessage();
			userPO.setPurpose("MAINTENANCE");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
	      
			forward("EPV0156_cambio_tasa_search.jsp", req, res);
			
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

	}
	
	protected void procActionEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EPV0156", req);			
			EPV015601Message msgData = (EPV015601Message) mp.getMessageRecord("EPV015601");
			msgData.setH01USERID(user.getH01USR());
			msgData.setH01PROGRM("EPV0156");
			msgData.setH01TIMSYS(getTimeStamp());
			msgData.setH01SCRCOD("01");
			msgData.setH01OPECOD("0002");

			if(!(req.getParameter("E01DEAACC") == null)){
				msgData.setE01DEAACC(req.getParameter("E01DEAACC"));
			} else if(!(userPO.getAccNum() == null)){
				msgData.setE01DEAACC(userPO.getAccNum());
			}
			
			userPO.setAccNum(msgData.getE01DEAACC());

			mp.sendMessage(msgData);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgData = (EPV015601Message) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV0156_cambio_tasa_search.jsp", req, res);				
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("data", msgData);
				forward("EPV0156_cambio_tasa.jsp", req, res);
			}
						
		} finally {
			if(mp !=null)
				mp.close();
		}

	}


	private void procActionTasa(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV0156", req);
			EPV015601Message msg = (EPV015601Message) mp.getMessageRecord("EPV015601");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV0156");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
						
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV015601Message) mp.receiveMessageRecord("EPV015601");

			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("data", msg);
				forward("EPV0156_cambio_tasa.jsp", req, res);
			} else {
				userPO.setAccNum(msg.getE01DEAACC());
				userPO.setPurpose("confirmation");
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("data", msg);
				procReqConsultaTasa(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}		
	}
	
	protected void procReqConsultaTasa(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
	throws ServletException, IOException {
	
	UserPos userPO = getUserPos(req);
	MessageProcessor mp = null;
	
	try {
		mp = getMessageProcessor("EPV0156", req);			
		EPV015601Message msgData = (EPV015601Message) mp.getMessageRecord("EPV015601");
		msgData.setH01USERID(user.getH01USR());
		msgData.setH01PROGRM("EPV0156");
		msgData.setH01TIMSYS(getTimeStamp());
		msgData.setH01SCRCOD("01");
		msgData.setH01OPECOD("0002");

		msgData.setE01DEAACC(userPO.getAccNum());

		mp.sendMessage(msgData);
		
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
		msgData = (EPV015601Message) mp.receiveMessageRecord();

		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			forward("EPV0156_ap_cambio_tasa.jsp", req, res);				
		} else {
			session.setAttribute("userPO", userPO);
			session.setAttribute("data", msgData);			
			forward("EPV0156_ap_cambio_tasa.jsp", req, res);
		}
					
	} finally {
		if(mp !=null)
			mp.close();
	}

}


}

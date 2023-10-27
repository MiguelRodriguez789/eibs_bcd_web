package datapro.eibs.client;

/**
 * Insert the type's description here.
 * Creation date: (14/06/13 11:27:55 AM)
 * @author: Yader Rivas
 */
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD051001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSESD0510 extends JSEIBSServlet {

	// Action 

	
	protected static final int R_ENTER_BANK = 100;
	protected static final int R_NEW = 300;
	protected static final int R_MAINTENANCE = 500;
	protected static final int R_DELETE = 700;
	protected static final int A_MAINTENANCE = 600;
		

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
			
		switch (screen) {
			case R_MAINTENANCE :
				procReqMaintenance(user, req, res, session);
				break;	
			case A_MAINTENANCE :
				procActionMaintenance(user, req, res, session);
				break;	
			case R_NEW :
				procReqNewt(user, req, res, session);
				break;
			case R_ENTER_BANK :
				procReqEnterBank(user, req, res, session);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	
private void procReqEnterBank(ESS0030DSMessage user, 
		                      	HttpServletRequest req, 
		                      	HttpServletResponse res, 
		                      	HttpSession session) 
		                      			throws ServletException, IOException {
	
		forward("ESD0510_bank_setup_basic_enter.jsp", req, res);
}




protected void procReqMaintenance(ESS0030DSMessage user,
									HttpServletRequest req,
									HttpServletResponse res,
									HttpSession session)
											throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp =null;
		try {
			mp =getMessageProcessor("ESD0510", req);
			ESD051001Message msgList = (ESD051001Message) mp.getMessageRecord("ESD051001");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD0510");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0001");
			msgList.setE01FBNK(user.getE01UBK());
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			
		 	//recibiendo error
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
		 	msgList = (ESD051001Message) mp.receiveMessageRecord();
		 	
		 	session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("fatca", msgList);
			
			if (mp.hasError(msgError)) {
				forward("error_viewer.jsp", req, res);
			}else{
				forward("ESD0510_fatca_parameters.jsp", req, res);
			}
			
		} finally{
			if(null != mp){
				mp.close();
			}
		}
  }


protected void procActionMaintenance(ESS0030DSMessage user,
										HttpServletRequest req,
										HttpServletResponse res,
										HttpSession session)
												throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
			
		try {
			String typbank = Util.getReqParameter("TYPBANK", req);
			
			mp = getMessageProcessor("ESD0510", req);
			ESD051001Message msgList = (ESD051001Message) mp.getMessageRecord("ESD051001");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD0510");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0004");
			setMessageRecord(req, msgList);

			msgList.setE01FBNK(Util.getReqParameter("E01FBNK", req));
			msgList.setH01WK1(typbank);
			msgList.setH01OPE(typbank.equals("N") ? "0001" : "0004");
			
			mp.sendMessage(msgList);

			//recibiendo la data
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
		 	msgList = (ESD051001Message) mp.receiveMessageRecord();

		 	session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("fatca", msgList);
			
			if (mp.hasError(msgError)) {
				forward("ESD0510_fatca_parameters.jsp", req, res);
			}else{
				forward("ESD0510_bank_setup_basic_enter.jsp", req, res);
			}
			
		} finally {
			if(null != mp){
				mp.close();
			}
		}
  }

    


protected void procReqNewt(	ESS0030DSMessage user,
								HttpServletRequest req,
								HttpServletResponse res,
								HttpSession session)
										throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ESD0510", req);
			ESD051001Message msgList = (ESD051001Message) mp.getMessageRecord("ESD051001");
			setMessageRecord(req, msgList);
			msgList.setE01FBNK(Util.getReqParameter("CODBANK", req));
			msgList.setH01WK1(Util.getReqParameter("TYPBANK", req));
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD0510");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0002");
						
			mp.sendMessage(msgList);
		 	
		 	//recibiendo error
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (ESD051001Message) mp.receiveMessageRecord();
		 	
		 	session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("fatca", msgList);
			
			if (mp.hasError(msgList)) {
			    forward("ESD0510_bank_setup_basic_enter.jsp", req, res);
			} else {
				forward("ESD0510_fatca_parameters.jsp", req, res);
			}
			
		} finally {
			if(null != mp){
				mp.close();
			}
		}
			
  }

 }	




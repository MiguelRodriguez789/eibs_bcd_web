package datapro.eibs.products;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ERM006001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD081701Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSERM0060 extends JSEIBSServlet {

	//Consulta de Remanentes
	protected static final int R_ENTER_INQUIRY_REMANENTE = 200;
	protected static final int A_ENTER_INQUIRY_REMANENTE = 300;
	protected static final int A_TDS_INQUIRY_REMANENTE = 400;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_ENTER_INQUIRY_REMANENTE :
				procReqEnterInquiry(user, req, res, session);
				break;
			case A_ENTER_INQUIRY_REMANENTE :
				procActEnterInquiry(user, req, res, session);
				break;
			case A_TDS_INQUIRY_REMANENTE :
				procActTDSInquiry(user, req, res, session);
				break;
			default :
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}



	private void procReqEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		
		session.setAttribute("remanentes", new ERM006001Message());
		
		forward("ERM0060_remanentes_enter_inquiry.jsp", req, res);
	}

	protected void procActEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ERM0060", req);

			ERM006001Message msg = (ERM006001Message) mp.getMessageRecord("ERM006001");
			
			//Sets message with page fields
			msg.setH01SCRCOD("01");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0004");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERM006001Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("remanentes", msg);

			if (!mp.hasError(msgError)) {
				ESD081701Message msgTrans = (ESD081701Message) mp.getMessageRecord("ESD081701");
				msgTrans.setH01USERID(user.getH01USR());
			 	msgTrans.setH01SCRCOD("01");
			 	msgTrans.setH01OPECOD("0004");
			 	msgTrans.setE01TRAACC(msg.getE01RMMACC());
			 	
				mp.sendMessage(msgTrans);
			
				JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
				if (mp.hasError(list)) {
					forward("ERM0060_remanentes_enter_inquiry.jsp", req, res);
				} else {
					session.setAttribute("ESD0817List", list);
					//if there are no errors go back to enter
					forward("ERM0060_remanentes_basic_inquiry.jsp", req, res);					
				}
			} else {
				//if there are errors go back to maintenance page and show errors
				forward("ERM0060_remanentes_enter_inquiry.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	

	protected void procActTDSInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ERM0060", req);

			ERM006001Message msg = (ERM006001Message) mp.getMessageRecord("ERM006001");
			
			//Sets message with page fields
			msg.setH01SCRCOD("01");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0005");
			msg.setE01RMMCTC(userPO.getIdentifier());
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERM006001Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("remanentes", msg);

			if (!mp.hasError(msgError)) {
				ESD081701Message msgTrans = (ESD081701Message) mp.getMessageRecord("ESD081701");
				msgTrans.setH01USERID(user.getH01USR());
			 	msgTrans.setH01SCRCOD("01");
			 	msgTrans.setH01OPECOD("0004");
			 	msgTrans.setE01TRAACC(msg.getE01RMMACC());
			 	
				mp.sendMessage(msgTrans);
			
				JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
				if (mp.hasError(list)) {
					//forward("ERM0060_remanentes_enter_inquiry.jsp", req, res);
					forward("ERM0060_remanentes_basic_tds_inquiry.jsp", req, res);
				} else {
					session.setAttribute("ESD0817List", list);
					//if there are no errors go back to enter
					forward("ERM0060_remanentes_basic_tds_inquiry.jsp", req, res);					
				}
			} else {
				forward("ERM0060_remanentes_basic_tds_inquiry.jsp", req, res);
				//if there are errors go back to maintenance page and show errors
				//forward("ERM0060_remanentes_enter_inquiry.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	
}

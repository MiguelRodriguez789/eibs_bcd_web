package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD040001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSESD0400 extends JSEIBSServlet {

	protected static final int R_ENTER = 1;
	protected static final int R_LIST = 2;
	protected static final int A_LIST = 3;

	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_ENTER:
				procReqEnter(user, req, res, session);
				break;
			case R_LIST:
				procReqList(user, req, res, session);
				break;
			case A_LIST:
				procActionList(user, req, res, session);
				break;
			default:
				break;
		}
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		ESD040001Message msg = new ESD040001Message();
		msg.setE01SELMONE("2");
		msg.setE01SELMONT(user.getE01RDM());
		msg.setE01SELYEAR(user.getE01RDY());
		session.setAttribute("msg", msg);
		
		forward("ESD0400_UF_IVP_enter.jsp", req, res);
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
	throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0400", req);
			ESD040001Message msgList = (ESD040001Message) mp.getMessageRecord("ESD040001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0400");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (ESD040001Message) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("ESD0400_UF_IVP_enter.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("msgList", msgList);
				forward("ESD0400_UF_IVP_maint.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0400", req);
			ESD040001Message msgData = (ESD040001Message) mp.getMessageRecord("ESD040001");
			msgData.setH01USERID(user.getH01USR());
			msgData.setH01PROGRM("ESD0400");
			msgData.setH01TIMSYS(getTimeStamp());
			msgData.setH01SCRCOD("01");
			msgData.setH01OPECOD("0005");
			
			setMessageRecord(req, msgData);
			
			mp.sendMessage(msgData);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgData = (ESD040001Message) mp.receiveMessageRecord("ESD040001");

			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("msg", msgData);
				forward("ESD0400_UF_IVP_enter.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("ESD0400_UF_IVP_maint.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}

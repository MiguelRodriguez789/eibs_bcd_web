package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV105801Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSEPV1058 extends JSEIBSServlet {

	protected static final int R_LIST    = 100;
	protected static final int A_LIST    = 101;
	protected static final int R_NEW     = 200;
	protected static final int R_MAINT   = 201;
	protected static final int R_DELETE  = 202;
	protected static final int R_INQUIRY = 203;
	protected static final int A_MAINT   = 600;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_LIST:
				procReqList(user, req, res, session);
				break;
			case A_LIST:
				procActList(user, req, res, session);
				break;
			case R_NEW:
				procReqNew(user, req, res, session);
				break;
			case R_MAINT:
				procReqMaint(user, req, res, session);
				break;
			case R_INQUIRY:
				procReqInquiry(user, req, res, session);
				break;
			case A_MAINT:
				procActMaint(user, req, res, session);
				break;
			case R_DELETE:
				procReqDelete(user, req, res, session);
				break;
			default:
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		UserPos userPO = new UserPos();
		userPO.setOption("TITU");
		userPO.setPurpose("PDN");
		userPO.setHeader10("2");
		userPO.setRedirect("/servlet/datapro.eibs.salesplatform.JSEPV1058?SCREEN=201");
		userPO.setProdCode("10");
		//Others Parameters
		userPO.setHeader1("E01DEAACC");
		userPO.setHeader2("H01FLGWK2");
		
		ses.setAttribute("userPO", userPO);
		
		forward("GENERIC_account_enter.jsp", req, res);
		
	}

	protected void procActList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
	}

	private void procReqMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV105801Message listMessage = null;
		
		try {
			userPO.setHeader20("MAINTENANCE");
			
			mp = getMessageProcessor("EPV1058", req);
	
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV105801List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EPV105801Message)list.get(index);
			}

			EPV105801Message msg = (EPV105801Message) mp.getMessageRecord("EPV105801");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1058");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			
			if (listMessage == null) {
				msg.setE01DEAACC(req.getParameter("E01DEAACC").trim());
			} else {
				msg.setE01DEAACC(listMessage.getE01DEAACC());
			}
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV105801Message) mp.receiveMessageRecord("EPV105801");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				procReqList(user, req, res, session);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec", msg);
				forward("EPV1058_loans_titularizados.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}

	}

	private void procReqInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		
	}
	
	protected void procActMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EPV1058", req);
			EPV105801Message msg = (EPV105801Message) mp.getMessageRecord("EPV105801");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1058");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV105801Message) mp.receiveMessageRecord("EPV105801");

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EPV1058_loans_titularizados.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}

	}

	protected void procReqDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

	}
	
}

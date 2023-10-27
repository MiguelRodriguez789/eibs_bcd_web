package datapro.eibs.params;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD038001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.services.ParametersServices;
import datapro.eibs.sockets.CharacterField;
import datapro.eibs.sockets.MessageRecord;

public class JSESD0380 extends JSEIBSServlet {

	protected static final int R_CODES_LIST		= 100;
	protected static final int A_MAINTENANCE 	= 600;
	protected static final int A_POSITION 		= 800;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_CODES_LIST :
				procReqCodesList(user, req, res, session);
				break;
				// Action
			case A_POSITION :
				procActionPos(user, req, res, session);
				break;
			case A_MAINTENANCE :
				procActionMaintenance(user, req, res, session);
				break;
			default :
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0380", req);
			ESD038001Message msgRT = (ESD038001Message) session.getAttribute("refCodes");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("ESD0030");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01OPECOD("NEW".equals(userPO.getPurpose()) ? "0001" : "0005");
			
			setMessageRecord(req, msgRT);
			((CharacterField)msgRT.getField("E01CNODCN")).setStringUD(req.getParameter("E01CNODCN"));
			
			mp.sendMessage(msgRT);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD038001Message) mp.receiveMessageRecord("ESD038001");
			
			if (mp.hasError(msgError)) {
				flexLog("Putting java beans into the session");
				session.setAttribute("error", msgError);
				session.setAttribute("refCodes", msgRT);
				session.setAttribute("userPO", userPO);
				
				forward("ESD0380_cnof_table_details.jsp", req, res);
			} else {
				flexLog("Putting java beans into the session");
				session.setAttribute("error", msgError);
				session.setAttribute("refCodes", msgRT);
				session.setAttribute("userPO", userPO);
				
				ParametersServices.refreshTables(req);
				
				procReqCodesList(user, req, res, session);
			}
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionPos(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		int inptOPT = 0;
		try {
			inptOPT = Integer.parseInt(req.getParameter("opt").trim());
		} catch (Exception e) {
			inptOPT = 0;
		}
		switch (inptOPT) {
			case 1 : //New
				userPO.setPurpose("NEW");
				session.setAttribute("userPO", userPO);
				procReqNew(user, req, res, session);
				break;
			case 3 : //Deletion
				userPO.setPurpose("DELETE");
				session.setAttribute("userPO", userPO);
				procActionDelete(user, req, res, session);
				break;
			default : //Maintenance
				userPO.setPurpose("MAINTENANCE");
				session.setAttribute("userPO", userPO);
				procReqMaintenance(user, req, res, session);
				break;
		}
	}

	private void procReqMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		
		JBObjList bl = (JBObjList) session.getAttribute("ESD038001Help");
		int idx = 0;
		try {
			idx = Integer.parseInt(req.getParameter("CURRCODE").trim());
		} catch (Exception e) {
			throw new ServletException(e);
		}
		bl.setCurrentRow(idx);
		ESD038001Message msgDoc = (ESD038001Message) bl.getRecord();
					
		flexLog("Putting java beans into the session");
		
		session.setAttribute("refCodes", msgDoc);
		session.setAttribute("userPO", userPO);
		
		int pos = bl.getFirstRec() - 1;
		
		forward("ESD0380_cnof_table_details.jsp?FromRecord=" +  pos, req, res);
	}

	private void procActionDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		JBObjList bl = (JBObjList) session.getAttribute("ESD038001Help");
		int idx = 0;
		try {
			idx = Integer.parseInt(req.getParameter("CURRCODE").trim());
		} catch (Exception e) {
			throw new ServletException(e);
		}
		bl.setCurrentRow(idx);
		ESD038001Message msgRT = (ESD038001Message) bl.getRecord();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0380", req);
			msgRT.setH01OPECOD("0009");
			setMessageRecord(req, msgRT);
			
			mp.sendMessage(msgRT);
			MessageRecord msg = mp.receiveMessageRecord();
			
			ELEERRMessage msgError = new ELEERRMessage();
			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				flexLog("Putting java beans into the session");
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				
				forward("ESD0380_cnof_table_list.jsp", req, res);
			} else {
				flexLog("Putting java beans into the session");
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				
				procReqCodesList(user, req, res, session);
			}
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		flexLog("Putting java beans into the session");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("refCodes", new ESD038001Message());
		
		forward("ESD0380_cnof_table_details.jsp", req, res);
	}

	private void procReqCodesList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		BigDecimal pos;
		try {
			pos = new BigDecimal(req.getParameter("FromRecord"));
		} catch (Exception e) {
			pos = new BigDecimal("0");
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0380", req);
			ESD038001Message msgList = (ESD038001Message) mp.getMessageRecord("ESD038001", user.getH01USR(), "0015");
			msgList.setE01SELLAN(user.getE01LAN());
			msgList.setE01NUMREC(pos);
						
			mp.sendMessage(msgList);
			
			JBObjList list = mp.receiveMessageRecordList("E01CNOOPE", "E01NUMREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				flexLog("Putting java beans into the session");
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);

				forward("error_viewer.jsp", req, res);
			} else {
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ESD038001Help", list);
				session.setAttribute("userPO", userPO);
				
				forward("ESD0380_cnof_table_list.jsp", req, res);
			}
		} finally {
			if (mp != null)	mp.close();
		}
	}

}

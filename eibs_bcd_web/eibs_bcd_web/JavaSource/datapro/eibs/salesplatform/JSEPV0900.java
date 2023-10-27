package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV090001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEPV0900 extends JSEIBSServlet {

	protected static final int R_SIMULCAION = 100;
	protected static final int R_AJAX_LOAD_DEALS = 105;
	protected static final int A_SIMULCAION = 200;
	protected static final int A_SIMULCAION_BACKGROUND = 300;
	
	protected static final int CONVENIO_COMISSION_CALCULATION = 311;
	protected static final int NEW_COMISSION_CALCULATION = 312;	
	protected static final int A_CHG_PAYMENT = 700;
	
	
	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		switch (screen) {
			case R_SIMULCAION:
			case R_AJAX_LOAD_DEALS:	
				procReqSimulacion(user, req, res, session, screen);
				break;
			case A_SIMULCAION:
			case A_SIMULCAION_BACKGROUND:
				procActionSimulacion(user, req, res, session, screen);
				break;
			case A_CHG_PAYMENT:
				procChangePayment(user, req, res, session);
				break;
			case CONVENIO_COMISSION_CALCULATION:				
			case NEW_COMISSION_CALCULATION:
				calculateComissionCharges(user, req, res, session, screen);
				break;				
			default:
				forward(devPage, req, res);
				break;
		}
	}
	
	private void calculateComissionCharges(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
			throws ServletException, IOException {
		MessageProcessor mp = null;
		String opecode = "0000";
		//Find H01OPECOD Value. Determines AS400 SubRoutine
		switch (screen) {
		case CONVENIO_COMISSION_CALCULATION:
			opecode = "0011";
			break;
		case NEW_COMISSION_CALCULATION:		
			opecode = "0012";
			break;
		}		
		
		try {
		
			mp = getMessageProcessor("EPV0900", req);
			EPV090001Message msg = (EPV090001Message) session.getAttribute("msgLoan");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV0900");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD(opecode);
			setMessageRecord(req, msg);
			mp.sendMessage(msg);
						
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JSONObject json = new JSONObject();
			json.put("type", msgError.getERRNUM().equals("0") ? "NO_ERROR": "ERROR");
			sendJSONResponse(res, json);
		}finally{
			if (mp != null)
				mp.close();			
		}
	}	
	
	private void procChangePayment(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

	UserPos userPO = getUserPos(req);
	MessageProcessor mp = null;
	try {
		EPV090001Message msgData = new EPV090001Message();
		setMessageRecord(req, msgData);
		
		session.setAttribute("userPO", userPO);
		session.setAttribute("msgLoan", msgData);
		session.setAttribute("messageName","msgLoan");		//Needed For Plan de Pagos, JSPAYMENT PLAN used in ln-paymentplan.jsp		
		forward("EPV0900_simulacion_credito.jsp", req, res);

	} finally {
		if ( null != mp)
			mp.close();
	}
	
}	
	

	private void procReqSimulacion(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV0900", req);
			EPV090001Message msgData = (EPV090001Message) mp.getMessageRecord("EPV090001");
			msgData.setH01USERID(user.getH01USR());
			msgData.setH01PROGRM("EPV0900");
			msgData.setH01TIMSYS(getTimeStamp());
			msgData.setH01SCRCOD("01");
			msgData.setH01OPECOD("0002");

			setMessageRecord(req, msgData);
			
			mp.sendMessage(msgData);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgData = (EPV090001Message) mp.receiveMessageRecord("EPV090001");
			
			userPO.setAccNum(msgData.getE01DEAACC());

			//Needed For Plan de Pagos, JSPAYMENT PLAN used in ln-paymentplan.jsp	
			session.setAttribute("messageName","msgLoan");			
			if(screen == R_AJAX_LOAD_DEALS){
				JSONObject json = new JSONObject();
				json = Util.getJSON(msgData);
				json.put("type", "FILL_FORM");
				sendJSONResponse(res, json);
			
			} else {
				if (mp.hasError(msgError)) {
					session.setAttribute("userPO", userPO);
					session.setAttribute("error", msgError);		
					forward("EPV0900_simulacion_credito.jsp", req, res);
				} else {
					session.setAttribute("userPO", userPO);
					session.setAttribute("msgLoan", msgData);
					forward("EPV0900_simulacion_credito.jsp", req, res);
				}
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionSimulacion(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV0900", req);
			//EPV090001Message msgData = (EPV090001Message) mp.getMessageRecord("EPV090001");
			EPV090001Message msgData = (EPV090001Message) session.getAttribute("msgLoan");
			msgData.setH01USERID(user.getH01USR());
			msgData.setH01PROGRM("EPV0900");
			msgData.setH01TIMSYS(getTimeStamp());
			msgData.setH01SCRCOD("01");
			msgData.setH01OPECOD("0004");

			setMessageRecord(req, msgData);
			userPO.setAccNum(msgData.getE01DEAACC());
			userPO.setCusNum(msgData.getE01DEACUN());
			userPO.setCusName(msgData.getE01CUSNA1());
			userPO.setProdCode(msgData.getE01DEAPRO());
			userPO.setCurrency(msgData.getE01DEACCY());
			mp.sendMessage(msgData);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgData = (EPV090001Message) mp.receiveMessageRecord("EPV090001");

			//Needed For Plan de Pagos, JSPAYMENT PLAN used in ln-paymentplan.jsp	
			session.setAttribute("messageName","msgLoan");						
			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("msgLoan", msgData);
				session.setAttribute("error", msgError);
				if (screen == A_SIMULCAION_BACKGROUND) {
					JSONObject json = new JSONObject();
					json.put("type", "error");
					sendJSONResponse(res, json);
				} else {
					forward("EPV0900_simulacion_credito.jsp", req, res);
				}
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("msgLoan", msgData);
			
				if (screen == A_SIMULCAION_BACKGROUND) {
					//NEW
					JSONObject json = new JSONObject();
					json = Util.getJSON(msgData);
					json.put("type", "data");
					sendJSONResponse(res, json);
				} else {
					forward("EPV0900_simulacion_credito.jsp", req, res);
				}
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	
}

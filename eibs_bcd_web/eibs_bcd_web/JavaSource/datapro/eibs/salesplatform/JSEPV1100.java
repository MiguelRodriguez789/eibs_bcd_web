package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class JSEPV1100 extends JSEIBSServlet {

	protected static final int R_SALDO_EXCHANGE        = 10;
	
	protected static final int R_DESEMBOLSO_LIST       = 101;
	protected static final int R_DESEMBOLSO_NEW_LIST   = 102;
	protected static final int R_DESEMBOLSO_NEW    	   = 200;
	protected static final int R_DESEMBOLSO_COD        = 201;
	protected static final int R_DESEMBOLSO_MAINT      = 300;
	protected static final int R_DESEMBOLSO_INQ        = 301;
	protected static final int R_DESEMBOLSO_DELETE     = 400;
	protected static final int A_DESEMBOLSO_MAINT      = 500;
	protected static final int A_DESEMBOLSO_COD        = 501;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_SALDO_EXCHANGE:
				requestSaldoExchange(user, req, res, session, screen);
				break;
			case R_DESEMBOLSO_LIST:
				procReqDesembolsoList(user, req, res, session);
				break;
			case R_DESEMBOLSO_NEW_LIST:
				procReqDesembolsoNewList(user, req, res, session);
				break;
			case R_DESEMBOLSO_NEW:
				procReqDesembolsoNew(user, req, res, session);
				break;
			case R_DESEMBOLSO_COD:
				procReqDesembolsoCode(user, req, res, session);
				break;
			case R_DESEMBOLSO_MAINT:
				procReqDesembolsoMaintenance(user, req, res, session);
				break;
			case R_DESEMBOLSO_INQ:
				procReqDesembolsoInquiry(user, req, res, session);
				break;
			case R_DESEMBOLSO_DELETE:
				procReqDesembolsoDelete(user, req, res, session);
				break;
			case A_DESEMBOLSO_MAINT:
				procActionDesembolsoMaintenance(user, req, res, session);
				break;
			case A_DESEMBOLSO_COD:
				procActionDesembolsoCode(user, req, res, session);
				break;
			default:
				break;
		}

	}
	
	private void requestSaldoExchange(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("EPV1100", req);
				EPV110003Message msgData = (EPV110003Message) mp.getMessageRecord("EPV110003");
				msgData.setH03USERID(user.getH01USR());
				msgData.setH03PROGRM("EPV1100");
				msgData.setH03TIMSYS(getTimeStamp());
				msgData.setE03ORGBNK(Util.getReqParameter("LN_BNK", req));
				msgData.setE03ORGCCY(Util.getReqParameter("LN_CCY", req));
				msgData.setE03ORGEXR(Util.getReqParameter("E01PVBEXR", req));
				msgData.setE03ORGAMT(Util.getReqParameter("SALDO", req));
				msgData.setE03DSTBNK(Util.getReqParameter("E01PVBOBK", req));
				msgData.setE03DSTCCY(Util.getReqParameter("E01PVBOCY", req));
				mp.sendMessage(msgData);

				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				msgData = (EPV110003Message) mp.receiveMessageRecord("EPV110003");

				if (mp.hasError(msgError)) {
					session.setAttribute("error", msgError);					
					JSONObject json = new JSONObject();
					json.put("type", "error");
					sendJSONResponse(res, json);
				} else {
					JSONObject json = new JSONObject();
					json = Util.getJSON(msgData);
					json.put("type", "data");
					sendJSONResponse(res, json);
				}
			} finally {
				if (mp != null)
					mp.close();
			}
		}	
	

	private void procReqDesembolsoList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		userPO.setCusNum(Util.getReqParameter("E01PVBCUN", req, userPO.getCusNum()));
		userPO.setPorfNum(Util.getReqParameter("E01PVBNUM", req, userPO.getPorfNum()));
		
		try {
			mp = getMessageProcessor("EPV1100", req);
			EPV110001Message msgDes = (EPV110001Message) mp.getMessageRecord("EPV110001");
			msgDes.setH01USERID(user.getH01USR());
			msgDes.setH01TIMSYS(getTimeStamp());
			msgDes.setH01OPECOD("0015");
			msgDes.setE01PVBCUN(Util.getReqParameter("E01PVBCUN", req, userPO.getCusNum())); 
			msgDes.setE01PVBNUM(Util.getReqParameter("E01PVBNUM", req, userPO.getPorfNum())); 
			
			mp.sendMessage(msgDes);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			session.setAttribute("userPO", userPO);
			session.setAttribute("EPV1100List", list);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
			req.setAttribute("prdCode", req.getParameter("prdCode"));
			forward("EPV1100_desembolso_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqDesembolsoNewList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			userPO.setCusNum(Util.getReqParameter("E02DSBCUN", req, userPO.getCusNum()));
			userPO.setPorfNum(Util.getReqParameter("E02DSBNUM", req, userPO.getPorfNum()));
			userPO.setAccNum(Util.getReqParameter("E02DSBACC", req, userPO.getAccNum()));
			
			mp = getMessageProcessor("EPV1100", req);
			EPV110002Message msgDes = (EPV110002Message) mp.getMessageRecord("EPV110002");
			msgDes.setH02USERID(user.getH01USR());
			msgDes.setH02TIMSYS(getTimeStamp());
			msgDes.setH02OPECOD("0015");
			msgDes.setE02DSBCUN(Util.getReqParameter("E02DSBCUN", req, userPO.getCusNum())); 
			msgDes.setE02DSBNUM(Util.getReqParameter("E02DSBNUM", req, userPO.getPorfNum()));
			msgDes.setE02DSBACC(Util.getReqParameter("E02DSBACC", req, userPO.getAccNum())); 
			
			mp.sendMessage(msgDes);
	
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
	
			session.setAttribute("userPO", userPO);
			session.setAttribute("EPV1100List", list);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
			req.setAttribute("prdCode", req.getParameter("prdCode"));
			forward("EPV1100_desembolso_list_new.jsp", req, res);
	
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqDesembolsoNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			userPO.setHeader20("NEW");
			
			mp = getMessageProcessor("EPV1100", req);
			EPV110001Message msgDes = (EPV110001Message) mp.getMessageRecord("EPV110001");
			msgDes.setH01USERID(user.getH01USR());
			msgDes.setH01PROGRM("EPV1100");
			msgDes.setH01TIMSYS(getTimeStamp());
			msgDes.setH01SCRCOD("01");
			msgDes.setH01OPECOD("0001");

			msgDes.setE01PVBCUN(userPO.getCusNum());
			msgDes.setE01PVBNUM(userPO.getPorfNum());

			mp.sendMessage(msgDes);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgDes = (EPV110001Message) mp.receiveMessageRecord("EPV110001");

			req.setAttribute("prdCode", req.getParameter("prdCode"));
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1100_desembolso_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgDes);
				session.setAttribute("error", msgError);
				forward("EPV1100_desembolso_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqDesembolsoCode(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			
			mp = getMessageProcessor("EPV1100", req);
			EPV110001Message msgDes = (EPV110001Message) mp.getMessageRecord("EPV110001");
			msgDes.setH01USERID(user.getH01USR());
			msgDes.setH01PROGRM("EPV1100");
			msgDes.setH01TIMSYS(getTimeStamp());
			msgDes.setH01SCRCOD("01");
			msgDes.setH01OPECOD("0001");

			msgDes.setE01PVBCUN(userPO.getCusNum());
			msgDes.setE01PVBNUM(userPO.getPorfNum());

			mp.sendMessage(msgDes);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgDes = (EPV110001Message) mp.receiveMessageRecord("EPV110001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1100_desembolso_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgDes);
				session.setAttribute("error", msgError);
				forward("EPV1100_desembolso_code.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}

	}

	private void procReqDesembolsoMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			userPO.setHeader20("MAINTENANCE");

			mp = getMessageProcessor("EPV1100", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EPV1100List");
			int index = Integer.parseInt(req.getParameter("keys").trim());
			
			EPV110001Message listMessage = (EPV110001Message)list.get(index);

			EPV110001Message msgDes = (EPV110001Message) mp.getMessageRecord("EPV110001");
			msgDes.setH01USERID(user.getH01USR());
			msgDes.setH01PROGRM("EPV1100");
			msgDes.setH01TIMSYS(getTimeStamp());
			msgDes.setH01SCRCOD("01");
			msgDes.setH01OPECOD("0002");

			msgDes.setE01PVBCUN(listMessage.getE01PVBCUN());
			msgDes.setE01PVBNUM(listMessage.getE01PVBNUM());
			msgDes.setE01PVBSEQ(listMessage.getE01PVBSEQ());

			mp.sendMessage(msgDes);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgDes = (EPV110001Message) mp.receiveMessageRecord("EPV110001");

			req.setAttribute("prdCode", req.getParameter("prdCode"));
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1100_desembolso_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgDes);
				session.setAttribute("error", msgError);
				forward("EPV1100_desembolso_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqDesembolsoInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV110001Message listMessage = null;
		
		try {
			mp = getMessageProcessor("EPV1100", req);
		
			if (req.getParameter("keys") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV1100List");
				int index = Integer.parseInt(req.getParameter("keys").trim());
				listMessage = (EPV110001Message)list.get(index);
			}
			
			EPV110001Message msgDes = (EPV110001Message) mp.getMessageRecord("EPV110001");
			msgDes.setH01USERID(user.getH01USR());
			msgDes.setH01PROGRM("EPV1100");
			msgDes.setH01TIMSYS(getTimeStamp());
			msgDes.setH01SCRCOD("01");
			msgDes.setH01OPECOD("0004");
		
			if (listMessage == null) {
				msgDes.setE01PVBCUN(req.getParameter("cusNum").trim());
				msgDes.setE01PVBNUM(req.getParameter("PorfNum").trim());
				msgDes.setE01PVBSEQ(req.getParameter("E01PVBSEQ").trim());
			} else {
				msgDes.setE01PVBCUN(listMessage.getE01PVBCUN());
				msgDes.setE01PVBNUM(listMessage.getE01PVBNUM());
				msgDes.setE01PVBSEQ(listMessage.getE01PVBSEQ());
			}
			
			mp.sendMessage(msgDes);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgDes = (EPV110001Message) mp.receiveMessageRecord("EPV110001");
		
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1100_desembolso_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgDes);
				session.setAttribute("error", msgError);
				forward("EPV1100_desembolso_maintenance.jsp?readOnly=true", req, res);
			}
		
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqDesembolsoDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1100", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EPV1100List");
			int index = Integer.parseInt(req.getParameter("keys").trim());
			EPV110001Message listMessage = (EPV110001Message)list.get(index);
			
			EPV110001Message msgDes = (EPV110001Message) mp.getMessageRecord("EPV110001");
			msgDes.setH01USERID(user.getH01USR());
			msgDes.setH01PROGRM("EPV1100");
			msgDes.setH01TIMSYS(getTimeStamp());
			msgDes.setH01SCRCOD("01");
			msgDes.setH01OPECOD("0009");
			
			msgDes.setE01PVBCUN(listMessage.getE01PVBCUN());
			msgDes.setE01PVBNUM(listMessage.getE01PVBNUM());
			msgDes.setE01PVBSEQ(listMessage.getE01PVBSEQ());

			mp.sendMessage(msgDes);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			req.setAttribute("prdCode", req.getParameter("prdCode"));
			if (!mp.hasError(msgError)) {
				procReqDesembolsoList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EPV1100_desembolso_list.jsp", req, res);
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionDesembolsoMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1100", req);
			EPV110001Message msg = (EPV110001Message) mp.getMessageRecord("EPV110001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1100");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);

			msg.setE01PVBCUN(userPO.getCusNum());
			msg.setE01PVBNUM(userPO.getPorfNum());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV110001Message) mp.receiveMessageRecord("EPV110001");
			
			req.setAttribute("prdCode", req.getParameter("prdCode"));
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EPV1100_desembolso_maintenance.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EPV1100_desembolso_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionDesembolsoCode(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1100", req);
			EPV110001Message msg = (EPV110001Message) mp.getMessageRecord("EPV110001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1100");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0006");
			
			setMessageRecord(req, msg);
	
			msg.setE01PVBCUN(userPO.getCusNum());
			msg.setE01PVBNUM(userPO.getPorfNum());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV110001Message) mp.receiveMessageRecord("EPV110001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EPV1100_desembolso_code.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EPV1100_desembolso_code.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
	}

}

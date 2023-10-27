package datapro.eibs.salesplatform;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV116801Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSEPV1168 extends JSEIBSServlet {

	protected static final int R_LIST = 100;
	protected static final int A_LIST = 101;
	protected static final int R_NEW = 200;
	protected static final int R_MAINT = 201;
	protected static final int R_DELETE = 202;	
	protected static final int R_INQUIRY = 203;
	protected static final int A_MAINT = 600;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_LIST:
				procReqTablaList(user, req, res, session);
				break;
			case A_LIST:
				procActionTablaList(user, req, res, session);
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
				procActionMaintenance(user, req, res, session);
				break;
			case R_DELETE:
				procReqDelete(user, req, res, session);
				break;
			default:
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	protected void procReqTablaList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: EPV1168_df_enter_search.jsp");
			forward("EPV1168_df_enter_search.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	
	protected void procActionTablaList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = getMessageProcessor("EPV1168", req);

			EPV116801Message msg = (EPV116801Message) mp.getMessageRecord("EPV116801");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			
			try {
				msg.setE01PDFCUN(req.getParameter("E01PDFCUN").trim());
				userPO.setCusNum(req.getParameter("E01PDFCUN").trim());
			} catch (Exception e) {
				msg.setE01PDFCUN(userPO.getCusNum());
			}
			try {
				msg.setE01PDFNUM(req.getParameter("E01PDFNUM").trim());
				userPO.setPorfNum(req.getParameter("E01PDFNUM").trim());
			} catch (Exception e) {
				msg.setE01PDFNUM(userPO.getPorfNum());
			}
			
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
 
			session.setAttribute("userpPO", userPO);
			session.setAttribute("EPV116801List", list);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
			forwardOnSuccess("EPV1168_df_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			userPO.setHeader20("NEW");
			
			mp = getMessageProcessor("EPV1168", req);
			EPV116801Message msgNew = (EPV116801Message) mp.getMessageRecord("EPV116801");
			msgNew.setH01USERID(user.getH01USR());
			msgNew.setH01PROGRM("EPV1168");
			msgNew.setH01TIMSYS(getTimeStamp());
			msgNew.setH01SCRCOD("01");
			msgNew.setH01OPECOD("0001");
			
			msgNew.setE01PDFCUN(userPO.getCusNum());
			msgNew.setE01PDFNUM(userPO.getPorfNum());
	
			mp.sendMessage(msgNew);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgNew = (EPV116801Message) mp.receiveMessageRecord("EPV116801");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1168_df_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgNew);
				session.setAttribute("error", msgError);
				forward("EPV1168_df_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV116801Message listMessage = null;
		
		try {
			userPO.setHeader20("MAINTENANCE");

			mp = getMessageProcessor("EPV1168", req);
	
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV116801List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EPV116801Message)list.get(index);
			}

			EPV116801Message msgMaint = (EPV116801Message) mp.getMessageRecord("EPV116801");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV1168");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
			msgMaint.setH01OPECOD("0002");
			
			if (listMessage == null) {
				msgMaint.setE01PDFCUN(req.getParameter("cusNum").trim());
				msgMaint.setE01PDFNUM(req.getParameter("PorfNum").trim());
				msgMaint.setE01PDFSEQ(req.getParameter("E01PDFSEQ").trim());
			} else {
				msgMaint.setE01PDFCUN(listMessage.getE01PDFCUN());
				msgMaint.setE01PDFNUM(listMessage.getE01PDFNUM());
				msgMaint.setE01PDFSEQ(listMessage.getE01PDFSEQ());
			}

			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (EPV116801Message) mp.receiveMessageRecord("EPV116801");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1168_df_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				forward("EPV1168_df_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}

	}

	private void procReqInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV116801Message listMessage = null;
		
		try {
			mp = getMessageProcessor("EPV1168", req);
		
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV116801List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EPV116801Message)list.get(index);
			}

			EPV116801Message msgMaint = (EPV116801Message) mp.getMessageRecord("EPV116801");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV1168");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
			msgMaint.setH01OPECOD("0004");
		
			if (listMessage == null) {
				msgMaint.setE01PDFCUN(req.getParameter("cusNum").trim());
				msgMaint.setE01PDFNUM(req.getParameter("PorfNum").trim());
				msgMaint.setE01PDFSEQ(req.getParameter("E01PDFSEQ").trim());
			} else {
				msgMaint.setE01PDFCUN(listMessage.getE01PDFCUN());
				msgMaint.setE01PDFNUM(listMessage.getE01PDFNUM());
				msgMaint.setE01PDFSEQ(listMessage.getE01PDFSEQ());
			}

			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (EPV116801Message) mp.receiveMessageRecord("EPV116801");
		
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1168_df_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				forward("EPV1168_df_maintenance.jsp?readOnly=true", req, res);
			}
		
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procActionMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1168", req);
			EPV116801Message msg = (EPV116801Message) mp.getMessageRecord("EPV116801");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1168");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);

			msg.setE01PDFCUN(userPO.getCusNum());
			msg.setE01PDFNUM(userPO.getPorfNum());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV116801Message) mp.receiveMessageRecord("EPV116801");

			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EPV1168_df_maintenance.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EPV1168_df_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procReqDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1168", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EPV116801List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			EPV116801Message listMessage = (EPV116801Message)list.get(index);
			
			EPV116801Message msgDelete = (EPV116801Message) mp.getMessageRecord("EPV116801");
			msgDelete.setH01USERID(user.getH01USR());
			msgDelete.setH01PROGRM("EPV1168");
			msgDelete.setH01TIMSYS(getTimeStamp());
			msgDelete.setH01SCRCOD("01");
			msgDelete.setH01OPECOD("0009");
			
			msgDelete.setE01PDFCUN(listMessage.getE01PDFCUN());
			msgDelete.setE01PDFNUM(listMessage.getE01PDFNUM());
			msgDelete.setE01PDFSEQ(listMessage.getE01PDFSEQ());

			mp.sendMessage(msgDelete);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionTablaList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EPV1168_df_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}

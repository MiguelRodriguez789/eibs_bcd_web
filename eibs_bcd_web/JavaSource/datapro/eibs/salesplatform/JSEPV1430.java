package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.approval.JOApprovalRedirect;
import datapro.eibs.beans.EDI001002Message;
import datapro.eibs.beans.EDL014001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV143001Message;
import datapro.eibs.beans.EPV143002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

@SuppressWarnings("serial")
public class JSEPV1430 extends JSEIBSServlet {
	
	protected static final int R_PASSWORD = 1;
	protected static final int DEF_LIST    	    = 100;
	protected static final int R_APPROVAL_INQ   = 300;
	protected static final int A_POSITION 		= 800;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
	throws ServletException, IOException {

	switch (screen) {
		case R_PASSWORD :
			procReqPassword(req, res, session);
			break;	
		case DEF_LIST :
			procReqDefList(user, req, res, session);
			break;
		case A_POSITION :
			procActionPos(user, req, res, session);
			break;			
		default :
			forward("MISC_not_available.jsp", req, res);
			break;
	}
}

	
	private void procReqPassword(HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws IOException {
		
		UserPos userPO = getUserPos(req);
		
		String appCode = req.getParameter("appCode") == null ? "" : "&appCode=" + req.getParameter("appCode");
		String typCode = req.getParameter("typCode") == null ? "" : "&typCode=" + req.getParameter("typCode");
		String accNum = req.getParameter("ACCNUM") == null ? "" : "&ACCNUM=" + req.getParameter("ACCNUM");
		
		session.removeAttribute("searchParameters");
		
		userPO.setRedirect(
				"/servlet/datapro.eibs.salesplatform.JSEPV1430?SCREEN="
					+ DEF_LIST
					+ appCode
					+ typCode
					+ accNum);
		session.setAttribute("userPO", userPO);
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}	
	
	
	private void procReqDefList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
	
		try {
			//Set UserPo
			userPO.setHeader10(Util.getReqParameter("appCode", req));
			userPO.setHeader11(Util.getReqParameter("typCode", req));
			
			//Grab Search Parameters
			EPV143001Message searchParameters = (EPV143001Message) session.getAttribute("searchParameters");
			if(null != searchParameters){
				setMessageRecord(req, searchParameters);
			} else {
				searchParameters = new EPV143001Message();
			}			
			
			
			mp = getMessageProcessor("EPV1430", req);
			EPV143001Message msgList = (EPV143001Message) mp.getMessageRecord("EPV143001");		
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EPV1430");
			msgList.setH01TIMSYS(getTimeStamp());
			setMessageRecord(req, msgList);			
	
			mp.sendMessage(msgList);
			
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				session.setAttribute("userPO", userPO);
				forward("error_viewer.jsp", req, res);
			}else{
				session.setAttribute("searchParameters", searchParameters);
				session.setAttribute("EPV14301List", list);
				session.setAttribute("userPO", userPO);
				forward("EPV1430_approval_list.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionPos(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		int inptOPT = 0;
		try {
			inptOPT = Integer.parseInt(req.getParameter("opt").trim());
		} catch (Exception e) {
			inptOPT = 0;
		}
		switch (inptOPT) {
			case 1 : //APPROVE
				userPO.setPurpose("APPROVE");
				session.setAttribute("userPO", userPO);
				procActionApproval(user, req, res, session);
				break;
			case 2 : //REJECT
				userPO.setPurpose("REJECT");
				session.setAttribute("userPO", userPO);
				procActionApproval(user, req, res, session);
				break;
			case 3 : //DELETE
				userPO.setPurpose("DELETE");
				session.setAttribute("userPO", userPO);
				procActionApproval(user, req, res, session);
				break;		
			default:
				session.setAttribute("userPO", userPO);
				procReqDefList(user, req, res, session);			
				break;
		}
	}

	private void procActionApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1430", req);
			JBObjList list = (JBObjList) session.getAttribute("EPV14301List");
			int index = Integer.parseInt(req.getParameter("CURROW").trim());
			EPV143001Message listMessage = (EPV143001Message) list.get(index);
			
			EPV143002Message msgApprv = (EPV143002Message) mp.getMessageRecord("EPV143002");		
			msgApprv.setH02USERID(user.getH01USR());
			msgApprv.setH02PROGRM("EPV1430");
			msgApprv.setH02TIMSYS(getTimeStamp());
			
			if(userPO.getPurpose()=="APPROVE"){
				msgApprv.setE02ACTION("A");
			}
			else if (userPO.getPurpose()=="DELETE"){
				msgApprv.setE02ACTION("D");
			}else{
				msgApprv.setE02ACTION("R");
				msgApprv.setE02MSGTXT(req.getParameter("reason").trim());
			}

			if (listMessage == null) {
				msgApprv.setE02DEAACC(req.getParameter("E01DEAACC").trim());
			} else {
				msgApprv.setE02DEAACC(listMessage.getE01DEAACC());
			}				
	
			mp.sendMessage(msgApprv);

			ELEERRMessage msgError = null;
			MessageRecord msg = null;
			EDI001002Message msgImg = null;
			do {
				msg = mp.receiveMessageRecord();
				if (msg.getFormatName().equals("EDI001002")) { //Update SQL Images
					msgImg = (EDI001002Message) msg;
				}
			} while (!msg.getFormatName().equals("ELEERR"));
			
			msgError = (ELEERRMessage) msg;

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1430_approval_list.jsp", req, res);
			}else{
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				if (msgImg != null) {
					//Update SQL Images
					JOApprovalRedirect action = new JOApprovalRedirect(req, res, msgImg.getE02DCIACD(), msgImg.getE02DCIACC());
					action.action(msgImg.getE02DCITYP(), msgImg.getH02FLGWK3(), "/servlet/datapro.eibs.salesplatform.JSEPV1400?SCREEN=" + DEF_LIST);
				} else {
					procReqDefList(user, req, res, session);			
				}
			}
		} finally {
			if (mp != null)
				mp.close();
		}		
	}





}

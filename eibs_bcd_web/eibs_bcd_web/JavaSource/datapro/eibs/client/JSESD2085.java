package datapro.eibs.client;

/**
 * Servlet for NonClients.
 * External Entities that are not customers of Bank
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.approval.JOApprovalRedirect;
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.MessageRecord;

public class JSESD2085 extends JSEIBSServlet {

	protected static final int R_PASSWORD = 1;
	protected static final int DEF_LIST    	    = 100;
	protected static final int R_APPROVAL_INQ   = 300;
	protected static final int A_POSITION 		= 800;

protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
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
		case R_APPROVAL_INQ :
			procReqInquiry(user, req, res, session);
			break;			
		default :
			forward("MISC_not_available.jsp", req, res);
			break;
	}		
}

private void procReqPassword(HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException {
	
	UserPos userPO = getUserPos(req);
	
	String idNum = "&IDN=" +Util.getReqParameter("IDN", req);
	String entityNum =  "&IDN=" +Util.getReqParameter("ENTNUM", req);
	userPO.setOption("ENTITY");
	userPO.setHeader1("APPROVAL");
	userPO.setRedirect( "/servlet/datapro.eibs.client.JSESD2085?SCREEN=" + DEF_LIST + idNum + entityNum );
	session.setAttribute("userPO", userPO);
	session.removeAttribute("searchParameters");
	res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
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

private void procReqDefList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
	
		try {
			//Set UserPo
			userPO.setCusNum(Util.getReqParameter("ENTNUM", req));
			
			//Grab Search Parameters
			ESD208501Message searchParameters = (ESD208501Message) session.getAttribute("searchParameters");
			if(null != searchParameters){
				setMessageRecord(req, searchParameters);
			} else {
				searchParameters = new ESD208501Message();
			}			
			
			
			mp = getMessageProcessor("ESD2085", req);
			ESD208501Message msgList = (ESD208501Message) mp.getMessageRecord("ESD208501");		
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD208501");
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
				session.setAttribute("ESD2085List", list);
				session.setAttribute("userPO", userPO);
				forward("ESD2085_approval_list.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
	}

protected void procReqInquiry( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		JBObjList list;
		ESD208501Message listMessage = null;
		UserPos userPO = getUserPos(req);
		String source_List = "";
		MessageProcessor mp = null;		
		
		if(!"MAIN".equalsIgnoreCase(Util.getReqParameter("source", req))){
			session.setAttribute("userPO2", userPO);
		}
		try {			
			mp = getMessageProcessor("ESD2080", req);
			
			//Find Source 
			if("APPROVAL".equals(userPO.getHeader1())){     //From Approval List
				source_List	= "ESD2085List";
			}
			
			//Cast Proper Object
			if(source_List != "" && req.getParameter("CURROW") != null){ //Enters if comes from a List
				list = (JBObjList) session.getAttribute(source_List);
				int index = Integer.parseInt(Util.getReqParameter("CURROW", req, "0"));
				
				if(source_List == "ESD2085List"){ //APPROVAL List                   
					listMessage = (ESD208501Message) list.get(index);
				}
			}
			
			ESD208001Message msgInq = (ESD208001Message) mp.getMessageRecord("ESD208001");
			msgInq.setH01USERID(user.getH01USR());
			msgInq.setH01PROGRM("ESD2080");
			msgInq.setH01TIMSYS(getTimeStamp());
			msgInq.setH01SCRCOD("01");
			msgInq.setH01OPECOD("0002");
			msgInq.setH01FLGWK1("A");
			if (null != listMessage) {
				msgInq.setE01CUENUM(listMessage.getE01CUENUM());  //FallBack Coming From Opt Menu
			}			
			mp.sendMessage(msgInq);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
		 	msgInq = (ESD208001Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				userPO.setCusNum(msgInq.getE01CUENUM());
				userPO.setCusName(msgInq.getE01CUENME());
				userPO.setID(msgInq.getE01CUEIDN());
				userPO.setPurpose("APPROVAL_INQ");
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);;
				session.setAttribute("entity", msgInq);
				forward("ESD2080_entity_maintenance.jsp", req, res);
			} else {	
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			}				
		} finally {
			if (mp != null)	mp.close();
		}
  }


private void procActionApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD2085", req);
			JBObjList list = (JBObjList) session.getAttribute("ESD2085List");
			int index = Integer.parseInt(req.getParameter("CURROW").trim());
			ESD208501Message listMessage = (ESD208501Message) list.get(index);
			
			ESD208502Message msgApprv = (ESD208502Message) mp.getMessageRecord("ESD208502");		
			msgApprv.setH02USERID(user.getH01USR());
			msgApprv.setH02PROGRM("ESD2085");
			msgApprv.setH02TIMSYS(getTimeStamp());
			
			if(userPO.getPurpose().equals("APPROVE")){
				msgApprv.setE02ACTION("A");
			}
			else if (userPO.getPurpose().equals("DELETE")){
				msgApprv.setE02ACTION("D");
			}else{
				msgApprv.setE02ACTION("R");
				msgApprv.setE02MSGTXT(req.getParameter("reason").trim());
			}

			if (listMessage == null) {
				msgApprv.setE02CUENUM(req.getParameter("E01CUENUM").trim());
			} else {
				msgApprv.setE02CUENUM(listMessage.getE01CUENUM());
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
				forward("ESD2085_approval_list.jsp", req, res);
			}else{
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				if (msgImg != null) {
					//Update SQL Images
					JOApprovalRedirect action = new JOApprovalRedirect(req, res, msgImg.getE02DCIACD(), msgImg.getE02DCIACC());
					action.action(msgImg.getE02DCITYP(), msgImg.getH02FLGWK3(), "/servlet/datapro.eibs.client.JSESD2085SCREEN=" + DEF_LIST);
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




package datapro.eibs.client;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD400101Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import net.sf.json.JSONObject;

public class JSESD4001 extends JSEIBSServlet {

	// Action 

	protected static final int R_ENTITY_LIST = 100;
	protected static final int A_ENTITY_LIST_HELP = 105;	
	protected static final int R_NEW = 300;
	protected static final int R_MAINTENANCE = 500;
	protected static final int R_DELETE = 700;
	protected static final int A_MAINTENANCE = 600;
	protected static final int R_INQUIRY_LIST = 800;
	protected static final int R_INQUIRY = 900;
	protected static final int R_INQUIRY_JSON = 950;
	protected static final int R_APPROVAL = 200;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case R_ENTITY_LIST :
			case A_ENTITY_LIST_HELP :
				procReqEntityList(user, req, res, session, screen);
				break;
			case R_MAINTENANCE :
				procReqMaintenance(user, req, res, session);
				break;	
			case A_MAINTENANCE :
				procActionMaintenance(user, req, res, session);
				break;	
			case R_NEW :
				procReqNew(user, req, res, session);
				break;
			case R_DELETE :
				procReqDelete(user, req, res, session);
				break;
			case R_INQUIRY_LIST :
				procReqInquiryList(user, req, res, session);
				break;	
			case R_INQUIRY_JSON :
			case R_INQUIRY :
				procReqInquiry(user, req, res, session, screen);
				break;		
			default :
				//forward("MISC_not_available.jsp", req, res);
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}

	protected void procReqEntityList(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session,
		int screen)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD4001", req);

			ESD400101Message msgList = (ESD400101Message) mp.getMessageRecord("ESD400101");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD4001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			msgList.setE01SELCUN(Util.getReqParameter("CUSCUN", req, userPO.getCusNum()));
		 	msgList.setE01SELRTP(Util.getReqParameter("RECTYP", req, userPO.getHeader10()));
		 	msgList.setH01FLGWK1(userPO.getPurpose().equals("INQUIRY") ? "I" : "");

		 	mp.sendMessage(msgList);
		 	
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			list = new JBObjList(Util.sortByField(list, "E01CUMMAN"));

			userPO.setHeader10(msgList.getE01SELRTP());
			
			if (mp.hasError(list)) {
				session.removeAttribute("ESD400101List");
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("ESD400101List", list);
				if (screen == A_ENTITY_LIST_HELP)
					forwardOnSuccess("ESD4001_entity_help_helpmessage.jsp", req, res);
				else
					forward("ESD4001_mail_address_list.jsp", req, res);
			}	

		} finally {
			if (mp != null)	mp.close();
		}
	}


protected void procReqMaintenance(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
	 	JBObjList list = (JBObjList) session.getAttribute("ESD400101List");
	 	ESD400101Message msgElement = null;
	 	if (list != null && list.size() > 0) {
		 	msgElement = (ESD400101Message) list.get(Util.parseInt(req.getParameter("ROW")));			
		}
		
		MessageProcessor mp = null;		
		try {
			
			mp = getMessageProcessor("ESD4001", req);

			ESD400101Message msgList = (ESD400101Message) mp.getMessageRecord("ESD400101");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD4001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0002");
			msgList.setH01FLGWK1(" ");
			if ( userPO.getPurpose().equals("APPROVAL_INQ") || userPO.getPurpose().equals("APPROVAL") )
				msgList.setH01FLGWK1("A");	
			
			msgList.setE01SELCUN(req.getParameter("CUSCUN")!=null ? req.getParameter("CUSCUN") : userPO.getCusNum() );
		 	msgList.setE01SELRTP(req.getParameter("RECTYP") != null ? req.getParameter("RECTYP") : userPO.getHeader10());
		 	
		 	msgList.setE01SELMAN(msgElement != null ? msgElement.getE01CUMMAN() : "1");
		 	
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (ESD400101Message) mp.receiveMessageRecord();
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("entity", msgList);

			if (!mp.hasError(msgError)) {				
				forward("ESD4001_mail_address.jsp", req, res);
			} else {	
				forward("ESD4001_mail_address_list.jsp", req, res);
			}

		} finally {
			if (mp != null)	mp.close();
		}
  }	
  	
protected void procActionMaintenance(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;		
		try {			
			mp = getMessageProcessor("ESD4001", req);
			ESD400101Message msgList = (ESD400101Message) mp.getMessageRecord("ESD400101");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD4001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0005");
			msgList.setE01SELCUN(req.getParameter("CUSCUN")!=null ? req.getParameter("CUSCUN") : userPO.getCusNum() );
		 	msgList.setE01SELRTP(req.getParameter("RECTYP") != null ? req.getParameter("RECTYP") : userPO.getHeader10());
		 	
			setMessageRecord(req, msgList);
			msgList.setE01SELMAN(msgList.getE01CUMMAN());
			
		 	mp.sendMessage(msgList);
		 	
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
		 	msgList = (ESD400101Message) mp.receiveMessageRecord();
            
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("entity", msgList);
			
			if (!mp.hasError(msgError)) {
				if (msgList.getE01CUMRTP().equals("E")) {				
					//E = Garantias
					//Request from ERA0050_ga_basic.jsp
					//This Attribute Writes a JS to reload window location 
					//from Garantias. ERA0050_ga_basic.jsp					
					req.setAttribute("ACT","CLOSE");
					forward("ESD4001_mail_address.jsp", req, res);
				} else {
					redirectToPage("/servlet/datapro.eibs.client.JSESD4001?SCREEN=100&RECTYP=" +userPO.getHeader10(), res);
				}
			} else {	
				forward("ESD4001_mail_address.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
    }

protected void procReqNew(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		try {			
			mp = getMessageProcessor("ESD4001", req);
			ESD400101Message msgList = (ESD400101Message) mp.getMessageRecord("ESD400101");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD4001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0001");
			msgList.setE01SELCUN(req.getParameter("CUSCUN")!=null ? req.getParameter("CUSCUN") : userPO.getCusNum() );
		 	msgList.setE01SELRTP(req.getParameter("RECTYP") != null ? req.getParameter("RECTYP") : userPO.getHeader10());
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (ESD400101Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("entity", msgList);
				forward("ESD4001_mail_address.jsp", req, res);
			} else {	
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
  }	

protected void procReqDelete(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		String REC_TYPE = "";
		ESD400101Message msgElement = null;
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("MAINTENANCE");

		
		MessageProcessor mp = null;		
		try {			
			REC_TYPE = Util.getReqParameter("RECTYP", req , userPO.getHeader10());
			
			if (!REC_TYPE.equals("E")) {
				JBObjList list = (JBObjList) session.getAttribute("ESD400101List");
				msgElement = (ESD400101Message) list.get(Integer.valueOf(Util.getReqParameter("ROW", req , "0")));

			} else {
				//E = Garantias
				//Request from ERA0050_ga_basic.jsp
				msgElement = (ESD400101Message) session.getAttribute("gaAddress"); 
			}			
			
			mp = getMessageProcessor("ESD4001", req);

			ESD400101Message msgList = (ESD400101Message) mp.getMessageRecord("ESD400101");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD4001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setE01SELCUN(req.getParameter("CUSCUN")!=null ? req.getParameter("CUSCUN") : userPO.getCusNum() );
		 	msgList.setE01SELRTP(REC_TYPE);
		 	
		 	msgList.setE01SELMAN(msgElement.getE01CUMMAN());
		 	
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			if (!mp.hasError(msgError)) {
				if (!REC_TYPE.equals("E")) {
					redirectToPage("/servlet/datapro.eibs.client.JSESD4001?SCREEN=100&RECTYP=" +userPO.getHeader10(), res);
				} else {
					//This Attribute Writes a JS to reload window location 
					//from Garantias. ERA0050_ga_basic.jsp
					req.setAttribute("ACT","CLOSE");
					forward("ESD4001_mail_address.jsp", req, res);					
				}
			} else {	
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
  }	

protected void procReqInquiryList(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD4001", req);

			ESD400101Message msgList = (ESD400101Message) mp.getMessageRecord("ESD400101");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD4001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			userPO.setHeader10(req.getParameter("RECTYP"));
			msgList.setE01SELCUN(req.getParameter("CUSCUN")!=null ? req.getParameter("CUSCUN") : userPO.getCusNum() );
		 	msgList.setE01SELRTP(req.getParameter("RECTYP") != null ? req.getParameter("RECTYP") : userPO.getHeader10());
		 	msgList.setH01FLGWK1( userPO.getPurpose().equals("INQUIRY") ? "I" : "");
		 	
		 	mp.sendMessage(msgList);
		 	
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			if (mp.hasError(list)) {
				session.removeAttribute("ESD400101List");
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("ESD400101List", list);
				forwardOnSuccess("ESD4001_mail_address_list.jsp", req, res);
			}	

		} finally {
			if (mp != null)	mp.close();
		}
	}

protected void procReqInquiry(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session, int screen)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		ESD400101Message msgElement = null;
	 	JBObjList list = (JBObjList) session.getAttribute("ESD400101List");
	 	if(screen != R_INQUIRY_JSON) msgElement = (ESD400101Message) list.get(Util.parseInt(req.getParameter("ROW")));
		
		MessageProcessor mp = null;		
		try {			
			mp = getMessageProcessor("ESD4001", req);

			ESD400101Message msgList = (ESD400101Message) mp.getMessageRecord("ESD400101");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD4001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0004");
			msgList.setE01SELCUN(req.getParameter("CUSCUN")!=null ? req.getParameter("CUSCUN") : userPO.getCusNum() );
		 	msgList.setE01SELRTP(req.getParameter("RECTYP") != null ? req.getParameter("RECTYP") : userPO.getHeader10());
		 	
		 	if(screen != R_INQUIRY_JSON) {
		 		msgList.setE01SELMAN(msgElement.getE01CUMMAN());
		 	} else {
		 		msgList.setE01SELMAN("1");//main address
		 	}
		 	
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (ESD400101Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				if(Util.getReqParameter("ReturnOBJ", req).equals("JSON")){
					JSONObject json = Util.getJSON(msgList, new String[]{"E01CUMCUN","SCREEN","E01CUMMAN","E01CUMRTY","E01CUMMLC" ,"E01CUMBNI"});
					sendJSONResponse(res, json);				
				} else {
					session.setAttribute("error", msgError);
					session.setAttribute("userPO", userPO);
					session.setAttribute("entity", msgList);
					forward("ESD4001_mail_address.jsp", req, res);
				}
			} else {	
				if(Util.getReqParameter("ReturnOBJ", req).equals("JSON")){
					JSONObject json = new JSONObject();
					json.put("type", "error");
					sendJSONResponse(res, json);				
				} else {			
					session.setAttribute("error", msgError);
					forward("error_viewer.jsp", req, res);
				}				
			}

		} finally {
			if (mp != null)	mp.close();
		}
  }	

 }	




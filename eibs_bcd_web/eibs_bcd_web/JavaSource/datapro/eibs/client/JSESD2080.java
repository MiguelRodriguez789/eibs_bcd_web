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

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.MessageRecord;

@SuppressWarnings("serial")
public class JSESD2080 extends JSEIBSServlet {
	
	protected static final int RETURN_USERPO = 1;
	protected static final int RETURN_BASIC_INFO = 2;
	
	protected static final int R_NEW_ENTITY = 100;
	protected static final int R_NEW = 300;
	protected static final int R_MAINTENANCE = 500;
	protected static final int R_INQUIRY = 900;
	
	protected static final int A_ENTITY_LIST_HELP = 105;	
	protected static final int A_NEW_ENTITY = 400;
	protected static final int A_MAINTENANCE = 600;
	
	protected static final int ENTER_MAINTENANCE = 1500;
	protected static final int ENTER_INQUIRY = 1900;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case RETURN_USERPO:
				returnUserPO(user, req, res, session, screen);
				break;
			case RETURN_BASIC_INFO:
				returnBasicInfo(user, req, res, session, screen);
				break;
			case R_NEW_ENTITY :
				procReqEnterNew(user, req, res, session, screen);
				break;
			case A_NEW_ENTITY : 
				procActionEnterNew(user, req, res, session);
				break;				
			case ENTER_MAINTENANCE :
				procEnterMaintenance(user, req, res, session);
				break;
			case ENTER_INQUIRY :
				procEnterInquiry(user, req, res, session);
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
			case R_INQUIRY :
				procReqInquiry(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}



	private void returnBasicInfo(ESS0030DSMessage user, HttpServletRequest req,  HttpServletResponse res, HttpSession session, int screen) 
			throws ServletException, IOException {
		forward("ESD2080_entity_maintenance.jsp", req, res);
	}

	private void returnUserPO(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) {
		if(null != session.getAttribute("userPO2")) {
			UserPos userPO = (UserPos) session.getAttribute("userPO2");
			if(!userPO.isEmpty()){
				session.setAttribute("userPO", userPO); //Reassign Top UserPO
			}
		}
	}
	
	private void procActionEnterNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws IOException, ServletException {
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("NEW");
		String pageName = "";
		MessageProcessor mp = null;
		IdentificationData idData = null;
		try {
			mp = getMessageProcessor("ESD2080", req);
			
			idData = new IdentificationData( req.getParameter("IDN"), req.getParameter("COUNTRY"), req.getParameter("TYPE"));
			ESD208001Message msgEntity = (ESD208001Message) mp.getMessageRecord("ESD208001");
		 	msgEntity.setH01USERID(user.getH01USR());
		 	msgEntity.setH01PROGRM("ESD2080");
		 	msgEntity.setH01TIMSYS(getTimeStamp());
		 	msgEntity.setH01SCRCOD("01");
		 	msgEntity.setH01OPECOD("0001");
		 	msgEntity.setE01CUELGT(idData.getLegalType());
	 		msgEntity.setE01CUENUM(Util.getReqParameter("CUN", req , "0"));
			msgEntity.setE01CUETID(Util.getReqParameter("TID", req));
			msgEntity.setE01CUEIDN(idData.getTokenizedId());
			msgEntity.setE01CUEPID(idData.getCountry());
			msgEntity.setE01CUEGEC(idData.getCountry());
			msgEntity.setE01CUEFL2(Util.getReqParameter("E01CFL2", req));
			
			mp.sendMessage(msgEntity);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			if ("ESD208001".equals(newmessage.getFormatName())) {
				msgEntity = (ESD208001Message) newmessage;
				
				userPO.setCusNum(msgEntity.getE01CUENUM());
				userPO.setCusName(msgEntity.getE01CUENME());
				userPO.setID(msgEntity.getE01CUEIDN());
				idData.setCountryDescription(msgEntity.getD01CUEPID());
				idData.setType(msgEntity.getE01CUETID());

				session.setAttribute("entity", msgEntity);
				if (mp.hasError(msgError)) {
					session.setAttribute("idData", idData);
					pageName = "ESD2080_entity_enter_new.jsp";
				} else {
					pageName = "ESD2080_entity_maintenance.jsp";
				}
			} else {
				throw new ServletException("Message " + newmessage.getFormatName() + " received.");
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			req.setAttribute("idData", idData);
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqEnterNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException, IOException {
		UserPos userPO = new UserPos();
		
		session.setAttribute("source", Util.getReqParameter("source", req));
		
		IdentificationData idData = new IdentificationData();
		idData.setCountry(user.getE01CTR());
		idData.setCountryDescription(user.getE01CTD());
		req.setAttribute("idData", idData);
		
		if(!"MAIN".equalsIgnoreCase(Util.getReqParameter("source", req))){
			userPO = getUserPos(req);
			session.setAttribute("userPO2", userPO);
		}
		//New userPO
		userPO = new UserPos();
		userPO.setPurpose("NEW");
		userPO.setOption("ENTITY");
		userPO.setApplicationCode("C1");

		session.setAttribute("userPO", userPO);
		
		forwardOnSuccess("ESD2080_entity_enter_new.jsp", req, res);
	}

protected void procEnterMaintenance(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
	
		UserPos userPO = new UserPos();
		
		if(!"MAIN".equalsIgnoreCase(Util.getReqParameter("source", req))){
			userPO = getUserPos(req);
			session.setAttribute("userPO2", userPO);
		}	
		
		userPO = new UserPos(); 
		userPO.setOption("ENTITY");
		userPO.setApplicationCode("C1");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.client.JSESD2080?SCREEN=500");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("source", null == session.getAttribute("source") ? Util.getReqParameter("source", req) : session.getAttribute("source") );
		session.setAttribute("userPO", userPO);
		session.setAttribute("entity", new ESD208001Message());
		
		forward("ESD2080_client_both_enter.jsp", req, res);
  }	

protected void procEnterInquiry(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
	
		UserPos userPO = new UserPos();
		
		if(!"MAIN".equalsIgnoreCase(Util.getReqParameter("source", req))){
			userPO = getUserPos(req);
			session.setAttribute("userPO2", userPO);
		}	
		userPO = new UserPos(); 
		userPO.setOption("ENTITY");
		userPO.setApplicationCode("C1");
		userPO.setPurpose("INQUIRY");
		userPO.setRedirect("/servlet/datapro.eibs.client.JSESD2080?SCREEN=900");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("source", null == session.getAttribute("source") ? Util.getReqParameter("source", req) : session.getAttribute("source") );
		session.setAttribute("userPO", userPO);
		session.setAttribute("entity", new ESD208001Message());
		
		forward("ESD2080_client_both_enter.jsp", req, res);
  }	


protected void procReqMaintenance( ESS0030DSMessage user,
									HttpServletRequest req,
									HttpServletResponse res,
									HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("MAINTENANCE");
		try {
			
			mp = getMessageProcessor("ESD2080", req);

			ESD208001Message msgList = (ESD208001Message) mp.getMessageRecord("ESD208001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD2080");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0002");
			setMessageRecord(req, msgList);
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (ESD208001Message) mp.receiveMessageRecord();
			
			userPO.setCusNum(msgList.getE01CUENUM());
			userPO.setCusName(msgList.getE01CUENME());
			userPO.setID(msgList.getE01CUEIDN());
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("entity", msgList);

			if (!mp.hasError(msgError)) {				
				forward("ESD2080_entity_maintenance.jsp", req, res);
			} else {	
				forward("ESD2080_client_both_enter.jsp", req, res);
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
			mp = getMessageProcessor("ESD2080", req);
			ESD208001Message msgList = (ESD208001Message) session.getAttribute("entity");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD2080");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0005");
			setMessageRecord(req, msgList);
			
		 	mp.sendMessage(msgList);
		 	
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
		 	msgList = (ESD208001Message) mp.receiveMessageRecord();
            
		 	session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("entity", msgList);
			
			if (!mp.hasError(msgError)) {
				if("MAIN".equalsIgnoreCase((String) session.getAttribute("source"))){
					req.setAttribute("source", "main");
					procEnterMaintenance(user, req, res, session);
					
				} else {
					session.setAttribute("userPO", session.getAttribute("userPO2")); //Reassign Top UserPO
					forward("ESD2080_close_top.jsp", req, res);
				}				
			} else {	
				forward("ESD2080_entity_maintenance.jsp", req, res);
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
			mp = getMessageProcessor("ESD2080", req);
			ESD208001Message msgList = (ESD208001Message) mp.getMessageRecord("ESD208001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD2080");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0001");
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (ESD208001Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("entity", msgList);
				forward("ESD2080_entity_maintenance.jsp", req, res);
			} else {	
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
  }	

protected void procReqInquiry(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session,
		int screen)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);

		MessageProcessor mp = null;		
		try {			
			mp = getMessageProcessor("ESD2080", req);

			ESD208001Message msgList = (ESD208001Message) mp.getMessageRecord("ESD208001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD2080");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0004");
			setMessageRecord(req, msgList);
		 	
			mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (ESD208001Message) mp.receiveMessageRecord();
			session.setAttribute("error", msgError);

			if (!mp.hasError(msgError)) {
				session.setAttribute("entity", msgList);
				userPO.setCusNum(msgList.getE01CUENUM());
				userPO.setCusName(msgList.getE01CUENME());
				userPO.setID(msgList.getE01CUEIDN());
				
				userPO.setPurpose("INQUIRY");
				forward("ESD2080_entity_maintenance.jsp", req, res);
			} else {	
				forward("ESD2080_client_both_enter.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
  }	


}	




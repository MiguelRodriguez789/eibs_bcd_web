package datapro.eibs.salesplatform;
//DADC = EPV0154 Desembolso; Aumento/Decremento; Cambio de Status
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV015401Message;
import datapro.eibs.beans.EPV015402Message;
import datapro.eibs.beans.EPV015404Message;
import datapro.eibs.beans.EPV015405Message;
import datapro.eibs.beans.EPV015406Message;
import datapro.eibs.beans.EPV015407Message;

import datapro.eibs.beans.EPV143001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageField;

@SuppressWarnings("serial")
public class JSEPV0154DADC extends JSEIBSServlet {
		
	protected static final int R_DESEM_ENTER	= 100;
	protected static final int R_INCRE_ENTER	= 125;
	protected static final int R_STATUS_ENTER	= 150;
	protected static final int R_TASA_ENTER		= 175;
	
	protected static final int A_DESEMBOLSO		= 200;
	protected static final int A_INCREMENTO		= 225;
	protected static final int A_Status			= 250;
	protected static final int A_Tasa			= 275;
	
	protected static final int R_EVENTS_ENT		= 300;
	
	protected static final int R_EVENTS_REASON	= 350;
	
	protected static final int A_EVENTS_LIST	= 700;
	protected static final int A_POS_ENTER		= 800;
	
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
			
		switch (screen) {
			case R_DESEM_ENTER:
				procReqDesemEnter(user, req, res, session);
				break;
			case R_INCRE_ENTER:
				procReqIncreEnter(user, req, res, session);
				break;
			case R_STATUS_ENTER:
				procReqStatusEnter(user, req, res, session);
				break;
			case R_TASA_ENTER:
				procReqTasaEnter(user, req, res, session);
				break;
			case R_EVENTS_ENT:
				procReqEventEnter(user, req, res, session);
				break;
			case R_EVENTS_REASON:
				procReqEventReason(user, req, res, session);
				break;				
			case A_DESEMBOLSO:
				procActDes(user, req, res, session);
				break;	
			case A_INCREMENTO:
				procActIncre(user, req, res, session);
				break;	
			case A_Status:
				procActStatus(user, req, res, session);
				break;	
			case A_Tasa:
				procActTasa(user, req, res, session);
				break;	
			case A_EVENTS_LIST:
				procActEventList(user, req, res, session);
				break;				
			case A_POS_ENTER:
				procActPosition(user, req, res, session);
				break;	
			default :
				forward("MISC_not_available.jsp", req, res);
				break;
		}
			
	}


	private void procReqDesemEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		forward ("EPV0154_crotat_desem_enter.jsp",req,res );
	}
	private void procReqIncreEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		forward ("EPV0154_crotat_incre_enter.jsp",req,res );
	}
	private void procReqStatusEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		forward ("EPV0154_crotat_cambio_status_enter.jsp",req,res );
	}
	
	private void procReqTasaEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		forward ("EPV0154_crotat_cambio_tasa_enter.jsp",req,res );
	}
	
	private void procReqEventReason(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		mp = getMessageProcessor("EPV0154", req);
		EPV015407Message msgEvent = (EPV015407Message) mp.getMessageRecord("EPV015407");	
		msgEvent.setE07HEVRMK(req.getParameter("MSG").replaceAll("_", " "));
		msgEvent.setE07DSCMTV(req.getParameter("DSC").replaceAll("_", " "));
		msgEvent.setE07HEVMTV(req.getParameter("MTV"));
		
		session.setAttribute("userPO", userPO);
		session.setAttribute("RecData", msgEvent);
		forward ("EPV0154_crotat_evento_reason.jsp",req,res );
	}	
	
	private void procReqEventEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		mp = getMessageProcessor("EPV0154", req);
		EPV015401Message msgEvent = (EPV015401Message) mp.getMessageRecord("EPV015401");		
		
		msgEvent.setE01DEAACC(userPO.getAccNum()); //Set to be able to use custom Tag
		msgEvent.setE01DEACUN(userPO.getCusNum());
		msgEvent.setE01CUSNA1(userPO.getCusName());
		msgEvent.setE01DEAPRO(userPO.getProdCode());
		msgEvent.setE01DEACCY(userPO.getCurrency());
		msgEvent.setE01DEATYP(userPO.getAccOpt());
		
		session.setAttribute("userPO", userPO);
		session.setAttribute("HeadInfo", msgEvent);
		forward("EPV0154_crotat_eventos_enter.jsp", req, res);
	}	

	@SuppressWarnings("unchecked")
	private void procActDes(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV0154", req);
			EPV015404Message msgDesem = (EPV015404Message) session.getAttribute("RecData");
			msgDesem.setH04USERID(user.getH01USR());
			msgDesem.setH04PROGRM("EPV0154");
			msgDesem.setH04TIMSYS(getTimeStamp());
	    	msgDesem.setH04SCRCOD("01");
	    	msgDesem.setH04OPECOD("");
	    	
		 	java.util.Enumeration enu = msgDesem.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField)enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				}
				catch (Exception e) {
				}	
			}
	    	
			mp.sendMessage(msgDesem);
	
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgDesem = (EPV015404Message) mp.receiveMessageRecord();
	
			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("RecData", msgDesem);
				session.setAttribute("error", msgError);
				forward("EPV0154_crotat_desem_enter.jsp", req, res);
			} else {
				session.setAttribute("RecData", msgDesem);
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EPV0154_crotat_desmb_info.jsp", req, res);
			}
	
			} finally {
				if (mp != null)
					mp.close();
			}				
		
	}
	
	private void procActIncre(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV0154", req);
			EPV015405Message msgIncr = (EPV015405Message) session.getAttribute("RecData");
			msgIncr.setH05USERID(user.getH01USR());
			msgIncr.setH05PROGRM("EPV0154");
			msgIncr.setH05TIMSYS(getTimeStamp());
	    	msgIncr.setH05SCRCOD("01");
	    	msgIncr.setH05OPECOD("");
	    	setMessageRecord(req, msgIncr);
			
			mp.sendMessage(msgIncr);
	
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgIncr = (EPV015405Message) mp.receiveMessageRecord();
	
			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("RecData", msgIncr);
				session.setAttribute("error", msgError);
				forward("EPV0154_crotat_incre_enter.jsp", req, res);
			} else {
				session.setAttribute("RecData", msgIncr);
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EPV0154_crotat_incre_info.jsp", req, res);
			}
	
			} finally {
				if (mp != null)
					mp.close();
			}				
	}	
	
	private void procActStatus(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV0154", req);
			EPV015406Message msgStatus = (EPV015406Message) session.getAttribute("RecData");
			msgStatus.setH06USERID(user.getH01USR());
			msgStatus.setH06PROGRM("EPV0154");
			msgStatus.setH06TIMSYS(getTimeStamp());
	    	msgStatus.setH06SCRCOD("01");
	    	msgStatus.setH06OPECOD("");
	    	msgStatus.setE06REMARK(req.getParameter("E06REMARK"));
	    	msgStatus.setE06NEWSTS(req.getParameter("E06NEWSTS"));
	    	msgStatus.setE06CODMTV(req.getParameter("E06CODMTV"));

			mp.sendMessage(msgStatus);
	
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			msgStatus = (EPV015406Message) mp.receiveMessageRecord();
	
			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("RecData", msgStatus);
				session.setAttribute("error", msgError);
				forward("EPV0154_crotat_cambio_status_enter.jsp", req, res);
			} else {
				session.setAttribute("RecData", msgStatus);
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EPV0154_crotat_cambio_status_info.jsp", req, res);
			}
	
			} finally {
				if (mp != null)
					mp.close();
			}			

	
	}	
	
	private void procActTasa(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		
	}	
	
	private void procActEventList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV0154", req);
			EPV015407Message msgList = (EPV015407Message) mp.getMessageRecord("EPV015407");		
			msgList.setH07USERID(user.getH01USR());
			msgList.setH07PROGRM("EPV0154");
			msgList.setH07TIMSYS(getTimeStamp());
			msgList.setH07OPECOD("");
			msgList.setE07HEVACC(req.getParameter("E01DEAACC"));
			
			try {                                                   //Get Dates From Page
				msgList.setE07FMDTMM(req.getParameter("E07FMDTMM"));
				msgList.setE07FMDTDD(req.getParameter("E07FMDTDD"));
				msgList.setE07FMDTYY(req.getParameter("E07FMDTYY"));
			} catch (Exception e) {
				msgList.setE07FMDTMM("0");
				msgList.setE07FMDTDD("0");
				msgList.setE07FMDTYY("0");
			}
			
			try {
				msgList.setE07TODTMM(req.getParameter("E07TODTMM"));
				msgList.setE07TODTDD(req.getParameter("E07TODTDD"));
				msgList.setE07TODTYY(req.getParameter("E07TODTYY"));
			} catch (Exception e) {
				msgList.setE07TODTMM("0");
				msgList.setE07TODTDD("0");
				msgList.setE07TODTYY("0");
			}
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV0154_crotat_eventos_enter.jsp", req, res);
			}else{
				JBObjList list = mp.receiveMessageRecordList("H07FLGMAS");
				EPV015401Message HeadInfo = (EPV015401Message) mp.getMessageRecord("EPV015401");
				
				HeadInfo.setE01DEAACC(userPO.getAccNum()); 		//Set to be able to use custom Tag
				HeadInfo.setE01DEACUN(userPO.getCusNum());
				HeadInfo.setE01CUSNA1(userPO.getCusName());
				HeadInfo.setE01DEAPRO(userPO.getProdCode());
				HeadInfo.setE01DEACCY(userPO.getCurrency());
				HeadInfo.setE01DEATYP(userPO.getAccOpt());
				
				session.setAttribute("HeadInfo", HeadInfo);
				session.setAttribute("EPV015407List", list);
				session.setAttribute("userPO", userPO);
				forward("EPV0154_crotat_eventos_list.jsp", req, res);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}	
	
	
	private void procActPosition(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {		
		
		UserPos userPO = getUserPos(req);
		int inptOPT = 0;
		try {
			inptOPT = Integer.parseInt(req.getParameter("opt").trim());
		} catch (Exception e) {
			inptOPT = 0;
		}
		switch (inptOPT) {
			case 1 : //Desemboloso
				session.setAttribute("userPO", userPO);
				procReqDesmbolso(user, req, res, session);
				break;
			case 2 : //Aumento o Disminucion
				session.setAttribute("userPO", userPO);
				procReqAumentoDism(user, req, res, session);
				break;				
			case 4 : //Cambio Tasa
				session.setAttribute("userPO", userPO);
				procReqCambioTasa(user, req, res, session);
				break;		
			case 3 : //Cambio Estatus
				session.setAttribute("userPO", userPO);
				procReqCambioEstatus(user, req, res, session);
				break;				
			default :
				session.setAttribute("userPO", userPO);
				forward("MISC_not_available.jsp", req, res);
		}
	}

	private void procReqDesmbolso(ESS0030DSMessage user,HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {	
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		JBObjList list = null;
		EPV143001Message listMessage143 = null;

		try {
			mp = getMessageProcessor("EPV0154", req);
			EPV015404Message msgDesem = (EPV015404Message) mp.getMessageRecord("EPV015404");
			msgDesem.setH04USERID(user.getH01USR());
			msgDesem.setH04PROGRM("EPV0154");
			msgDesem.setH04TIMSYS(getTimeStamp());
	    	msgDesem.setH04SCRCOD("01");
	    	msgDesem.setH04OPECOD("0002");
	    	
	    	if(!userPO.getHeader1().equals("APPROVAL")){                    //From Menu
		    	msgDesem.setE04DEAACC(req.getParameter("E04DEAACC"));
		    	msgDesem.setE04DEAPRO(req.getParameter("E04DEAPRO"));
	    	}else{                                                          //From Approval Page. Must Be Inquiry
				list = (JBObjList) session.getAttribute("EPV14301List");
				int index = Integer.parseInt(req.getParameter("CURROW").trim());
				listMessage143 = (EPV143001Message) list.get(index);
		    	msgDesem.setE04DEAACC(listMessage143.getE01DEAACC());
		    	msgDesem.setE04DEAPRO(listMessage143.getE01DEAPRO());
	    	}
			
	    	mp.sendMessage(msgDesem);
	
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgDesem = (EPV015404Message) mp.receiveMessageRecord();
	
			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("RecData", msgDesem);
				session.setAttribute("error", msgError);
				if(!userPO.getHeader1().equals("APPROVAL")){	
					forward("EPV0154_crotat_desmb_info.jsp", req, res);
				}else{
					forward("EPV0154_crotat_desmb_info.jsp?readOnly=true", req, res);
				}
			} else {
				session.setAttribute("RecData", msgDesem);
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EPV0154_crotat_desem_enter.jsp", req, res);
			}
	
			} finally {
				if (mp != null)
					mp.close();
			}				
		
	}
	

	private void procReqAumentoDism(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {		
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		JBObjList list = null;
		EPV143001Message listMessage143 = null;

		try {
			mp = getMessageProcessor("EPV0154", req);
			EPV015405Message msgIncr = (EPV015405Message) mp.getMessageRecord("EPV015405");
			msgIncr.setH05USERID(user.getH01USR());
			msgIncr.setH05PROGRM("EPV0154");
			msgIncr.setH05TIMSYS(getTimeStamp());
	    	msgIncr.setH05SCRCOD("01");
	    	msgIncr.setH05OPECOD("0002");
	    	
	    	if(!userPO.getHeader1().equals("APPROVAL")){                //From Menu
		    	msgIncr.setE05DEAACC(req.getParameter("E05DEAACC"));
		    	msgIncr.setE05DEAPRO(req.getParameter("E05DEAPRO"));
	    	}else{                                                      //From Approval Page. Must Be Inquiry
				list = (JBObjList) session.getAttribute("EPV14301List");
				int index = Integer.parseInt(req.getParameter("CURROW").trim());
				listMessage143 = (EPV143001Message) list.get(index);
		    	msgIncr.setE05DEAACC(listMessage143.getE01DEAACC());
		    	msgIncr.setE05DEAPRO(listMessage143.getE01DEAPRO());
	    	}
			
	    	mp.sendMessage(msgIncr);
	
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgIncr = (EPV015405Message) mp.receiveMessageRecord();
	
			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("RecData", msgIncr);
				session.setAttribute("error", msgError);
				if(!userPO.getHeader1().equals("APPROVAL")){				
					forward("EPV0154_crotat_incre_info.jsp", req, res);
				}else{
					forward("EPV0154_crotat_incre_info.jsp?readOnly=true", req, res);
				}
			}else{
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EPV0154_crotat_incre_enter.jsp", req, res);
			}
	
			} finally {
				if (mp != null)
					mp.close();
			}				
		
	}

	private void procReqCambioEstatus(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {	
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		JBObjList list = null;
		EPV143001Message listMessage143 = null;

		try {
			mp = getMessageProcessor("EPV0154", req);
			EPV015406Message msgStatus = (EPV015406Message) mp.getMessageRecord("EPV015406");
			msgStatus.setH06USERID(user.getH01USR());
			msgStatus.setH06PROGRM("EPV0154");
			msgStatus.setH06TIMSYS(getTimeStamp());
	    	msgStatus.setH06SCRCOD("01");
	    	msgStatus.setH06OPECOD("0002");
	    	
	    	if(!userPO.getHeader1().equals("APPROVAL")){				//From Menu
		    	msgStatus.setE06DEAACC(req.getParameter("E06DEAACC"));
		    	msgStatus.setE06DEAPRO(req.getParameter("E06DEAPRO"));
	    	}else{														//From Approval Page. Must Be Inquiry
				list = (JBObjList) session.getAttribute("EPV14301List");
				int index = Integer.parseInt(req.getParameter("CURROW").trim());
				listMessage143 = (EPV143001Message) list.get(index);
		    	msgStatus.setE06DEAACC(listMessage143.getE01DEAACC());
		    	msgStatus.setE06DEAPRO(listMessage143.getE01DEAPRO());
	    	}
			
	    	mp.sendMessage(msgStatus);
	
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgStatus = (EPV015406Message) mp.receiveMessageRecord();
	
			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("RecData", msgStatus);
				session.setAttribute("error", msgError);
				if(!userPO.getHeader1().equals("APPROVAL")){				
					forward("EPV0154_crotat_cambio_status_info.jsp", req, res);
				}else{
					forward("EPV0154_crotat_cambio_status_info.jsp?readOnly=true", req, res);
				}
			}else{
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EPV0154_crotat_cambio_status_enter.jsp", req, res);
			}
	
			} finally {
				if (mp != null)
					mp.close();
			}				
		
	}

	private void procReqCambioTasa(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {		
	}
	
}

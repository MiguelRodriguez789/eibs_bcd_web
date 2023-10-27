package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV015002Message;
import datapro.eibs.beans.EPV143001Message;
import datapro.eibs.beans.EPV015301Message;
import datapro.eibs.beans.EPV015302Message;
import datapro.eibs.beans.EPV015303Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;

@SuppressWarnings("serial")
public class JSEPV0153 extends JSEIBSServlet {

	protected static final int R_ENTER    	    = 100;
	protected static final int R_MAINT_ENTER	= 125;
	protected static final int R_INQ_ENTER		= 150;
	protected static final int DEF_LIST    	    = 200;
	protected static final int R_NEW_PROD		= 250;
	protected static final int A_MAINTENANCE 	= 600;
	protected static final int A_POSITION 		= 800;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen) {
			case R_ENTER :
			case R_MAINT_ENTER :	
			case R_INQ_ENTER	:				
				procReqEnter(user, req, res, session,screen);
				break;	
			case DEF_LIST :
				procReqDefList(user, req, res, session);
				break;
			case R_NEW_PROD :
				procReqProductDetails(user, req, res, session);
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
	
	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException{
		UserPos userPO = getUserPos(req);
		String enterPage = getPage(screen,userPO);
		
		session.setAttribute("userPO", userPO);
		
		forward (enterPage,req,res );
	}
	

	private String getPage(int OPTION, UserPos userPO) {
		
		String page;
			switch (OPTION) {
				case R_ENTER :
					userPO.setHeader1("");
					userPO.setHeader11("Ingreso de Credlineas");
					userPO.setRedirect("/servlet/datapro.eibs.salesplatform.JSEPV0153?SCREEN=200");
					page = "EPV0153_client_help_container.jsp";
					return page;
					
				case R_MAINT_ENTER :
					userPO.setHeader1("APPMAINT");
					userPO.setHeader11("Mantenimiento de Credlineas");
					page = "EPV0153_cuplus_maint_enter.jsp";
					return page;
	
				case R_INQ_ENTER	:
					userPO.setHeader1("INQMENU");
					userPO.setHeader11("Consulta de Credlineas");
					page = "EPV0153_cuplus_inq_enter.jsp";
					return page;
	
				default :
					page = SuperServlet.devPage;
					return page;
			}
	}

	
	
	private void procReqDefList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EPV0153", req);
			EPV015302Message msgList = (EPV015302Message) mp.getMessageRecord("EPV015302");		
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EPV0153");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02OPECOD("0015");
			msgList.setE02DEACUN(Util.getReqParameter("E01CUN", req, userPO.getCusNum()));
			
			//Set UserPo 
			userPO.setCusNum(Util.getReqParameter("E01CUN", req));

			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				userPO.setRedirect("/servlet/datapro.eibs.salesplatform.JSEPV0153?SCREEN=200");
				userPO.setHeader1("");
				forward("EPV0153_client_help_container.jsp", req, res);				
	
			}else{
				msgList = (EPV015302Message) mp.receiveMessageRecord("EPV015302");
				JBObjList list = mp.receiveMessageRecordList("H03FLGMAS");
				
				if (list.isEmpty()) {
					procReqProductDetails(user, req, res, session); //If Empty Go Directly to Product Page 
				
				} else {
					session.setAttribute("EPV015303List", list);
					session.setAttribute("HeadInfo", msgList);
					session.setAttribute("userPO", userPO);
					forward("EPV0153_cuplus_list.jsp", req, res);
				}
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}	
		
	private void procReqProductDetails(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException {

		UserPos userPO = getUserPos(req);
		userPO.setHeader9("PV");
				
		res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSESD0711?TYPE=10&GENERIC=I&CUSNUM=" +  userPO.getCusNum());
				 
	}		


	private void procActionPos(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		int inptOPT = Integer.parseInt(Util.getReqParameter("opt", req, "0")); 

		switch (inptOPT) {
			case 1 : //New
				userPO.setPurpose("NEW");
				session.setAttribute("userPO", userPO);
				procReqNew(user, req, res, session);
				break;
			case 2 : //Maintenance
				userPO.setPurpose("MAINTENANCE");
				session.setAttribute("userPO", userPO);
				procReqMaintenance(user, req, res, session);
				break;				
			default : //Inquiry
				userPO.setPurpose("INQUIRY");
				session.setAttribute("userPO", userPO);
				procReqInquiry(user, req, res, session);
				break;				
		}
	}
	
	private void procReqInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException{
		
		UserPos userPO = getUserPos(req);
		EPV143001Message listMessage143 = null;
		EPV015303Message listMessage153 = null;
		MessageProcessor mp = null;
		JBObjList list;
		String source_List = "";
		userPO.setHeader23("I");
		
		//Find Source 
		if("APPROVAL".equals(userPO.getHeader1())){     //From Approval List
			source_List	= "EPV14301List";
			
		}else if("INQMENU".equals(userPO.getHeader1())){//From Main Menu
			source_List ="";
		
		}else if("INGRESSO".equals(userPO.getHeader1())){//From Ingresso
			source_List ="EPV015303List";
		}
		
		//Cast Proper Object
		if(source_List != "" && req.getParameter("CURROW") != null){ //Enters if comes from a List
			list = (JBObjList) session.getAttribute(source_List);
			int index = Integer.parseInt(Util.getReqParameter("CURROW", req, "0"));
			
			if(source_List == "EPV14301List"){                       //APPROVAL
				listMessage143 = (EPV143001Message) list.get(index);
				listMessage153 = null;
			
			}else if(source_List == "EPV015303List"){               //INGRESSO
				listMessage153 = (EPV015303Message) list.get(index);	
				listMessage143 = null;
			
			}else{
				listMessage143 = null;
				listMessage153 = null;
			}
		}		
		
		try {
			mp = getMessageProcessor("EPV0153", req);
			
			EPV015301Message msgInq = (EPV015301Message) mp.getMessageRecord("EPV015301");
			msgInq.setH01USERID(user.getH01USR());
			msgInq.setH01PROGRM("EPV0153");
			msgInq.setH01TIMSYS(getTimeStamp());
			msgInq.setH01SCRCOD("01");
			if(userPO.getHeader1().equals("APPROVAL")){
				msgInq.setH01OPECOD("0002");
				msgInq.setH01FLGWK1("A");
			}else{
				msgInq.setH01OPECOD("0004");
			}
			
			if (listMessage143 == null && listMessage153 == null ) {
				msgInq.setE01DEAPRO(Util.getReqParameter("E01DEAPRO", req, userPO.getProdCode())); //Coming from Main Menu
				msgInq.setE01DEAACC(Util.getReqParameter("E01DEAACC", req, userPO.getAccNum()));  //FallBack Coming From Opt Menu

			} else {	    	
				if (listMessage143 == null){                   //From Ingresso List
					msgInq.setE01DEAPRO(listMessage153.getE03DEAPRO());
					msgInq.setE01DEAACC(listMessage153.getE03DEAACC());
				}else{                                         //From Approval List
					msgInq.setE01DEAPRO(listMessage143.getE01DEAPRO());
					msgInq.setE01DEAACC(listMessage143.getE01DEAACC());
				}
			}
			
	    	mp.sendMessage(msgInq);
	    	
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgInq = (EPV015301Message) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				userPO.setCusNum(msgInq.getE01DEACUN());
				session.setAttribute("userPO", userPO);
				session.setAttribute("RecData", msgInq);
				session.setAttribute("error", msgError);
				forward("EPV0153_cuplus_basic_information_approval.jsp", req, res);
			
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				
				if("INQMENU".equals(userPO.getHeader1())){           //From Menu, so return to Menu
					forward("EPV0153_cuplus_inq_enter.jsp", req, res);
				
				}else if("APPROVAL".equals(userPO.getHeader1())) { //From Approval PopUp
					printClose(res.getWriter());
				
				}else{
					forward("EPV0153_cuplus_list.jsp", req, res);
				}
			}

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
			mp = getMessageProcessor("EPV0153", req);
			EPV015301Message msgMaint = (EPV015301Message) mp.getMessageRecord("EPV015301");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV0153");
			msgMaint.setH01TIMSYS(getTimeStamp());
	    	msgMaint.setH01SCRCOD("01");
	    	msgMaint.setH01OPECOD("0001");
	    	msgMaint.setE01DEAPRO(Util.getReqParameter("E01DEAPRO", req));
	    	msgMaint.setE01DEACUN(Util.getReqParameter("E02DEACUN", req, userPO.getCusNum()));
	    	msgMaint.setE01DEAOAM(Util.getReqParameter("E01DEAOAM", req, "0"));

	    	mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMaint = (EPV015301Message) mp.receiveMessageRecord();
	
			if (!mp.hasError(msgError)) {
				userPO.setCusNum(msgMaint.getE01DEACUN());
				session.setAttribute("userPO", userPO);
				session.setAttribute("RecData", msgMaint);
				session.setAttribute("error", msgError);
				forward("EPV0153_cuplus_basic_info.jsp", req, res);

			} else {
				userPO.setHeader9("PV"); //Platform Venta
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSESD0711?TYPE=10&GENERIC=I&CUSNUM=" +  userPO.getCusNum());
			}
	
		} finally {
			if (mp != null) mp.close();
		}		
	}	

	private void procReqMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV0153", req);
				JBObjList list = (JBObjList) session.getAttribute("EPV015303List");
				EPV015303Message listMessage;				
				if ( list != null ){
					int index = Integer.parseInt(req.getParameter("CURROW").trim());
					listMessage = (EPV015303Message) list.get(index);
				}else{
					listMessage = null; //Happens when Coming from Menu
				}
				EPV015301Message msgMaint = (EPV015301Message) mp.getMessageRecord("EPV015301");
				msgMaint.setH01USERID(user.getH01USR());
				msgMaint.setH01PROGRM("EPV0153");
				msgMaint.setH01TIMSYS(getTimeStamp());
				msgMaint.setH01SCRCOD("01");
				msgMaint.setH01OPECOD("0002");
				
				if (listMessage == null) {
					msgMaint.setE01DEAPRO(Util.getReqParameter("E03DEAPRO", req));
					msgMaint.setE01DEAACC(Util.getReqParameter("E03DEAACC", req));
				} else {
					msgMaint.setE01DEAPRO(listMessage.getE03DEAPRO());
					msgMaint.setE01DEAACC(listMessage.getE03DEAACC());
				}				
		
				mp.sendMessage(msgMaint);
				
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
				msgMaint = (EPV015301Message) mp.receiveMessageRecord();
				
				if (!mp.hasError(msgError)) {
					userPO.setCusNum(msgMaint.getE01DEACUN());
					session.setAttribute("userPO", userPO);
					session.setAttribute("RecData", msgMaint);
					session.setAttribute("error", msgError);
					forward("EPV0153_cuplus_basic_info.jsp", req, res);
				
				} else {
					session.setAttribute("userPO", userPO);
					session.setAttribute("error", msgError);
					
					if("APPMAINT".equals(userPO.getHeader1())){	
						forward("EPV0153_cuplus_maint_enter.jsp", req, res);
					
					} else {
						forward("EPV0153_cuplus_list.jsp", req, res);
					}
				}
							
			} finally {
				if(mp !=null)
					mp.close();
			}		
	}

	private void procActionMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV0153", req);
			EPV015301Message msgRT = (EPV015301Message) session.getAttribute("RecData");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EPV0153");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01OPECOD("");
			msgRT.setE01DEAFTY(Util.getReqParameter("E01DEAFTY", req));
			setMessageRecord(req, msgRT);
			
			mp.sendMessage(msgRT);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EPV015301Message) mp.receiveMessageRecord("EPV015301");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("RecData", msgRT);
				session.setAttribute("userPO", userPO);
				forward("EPV0153_cuplus_basic_info.jsp", req, res);
			
			} else {
				session.setAttribute("error", msgError);
				session.setAttribute("RecData", msgRT);
				session.setAttribute("userPO", userPO);
			
				if(!"APPMAINT".equals(userPO.getHeader1())){
					procReqDefList(user, req, res, session);
				
				} else {
					forward("EPV0153_cuplus_maint_enter.jsp", req, res);
				}
			}
		} finally {
			if (mp != null)	mp.close();
		}
	}	

}

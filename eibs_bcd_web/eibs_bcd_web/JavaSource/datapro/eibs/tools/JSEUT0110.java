package datapro.eibs.tools;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generic.tool.Util;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EUT011001Message;
import datapro.eibs.beans.EUT011002Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.CharacterField;
import datapro.eibs.sockets.MessageField;

public class JSEUT0110 extends JSEIBSServlet {

	
	protected static final int R_MENU_LANGUAGE = 100;
	protected static final int A_MENU_LANGUAGE = 200;
	protected static final int R_MENU_NEW = 1;
	protected static final int R_MENU_MAINTENANCE = 2;
	protected static final int R_MENU_DELETE = 3;
	protected static final int A_MENU_MAINTENANCE = 4;
	protected static final int R_MENU_OPTIONS = 8;

	protected static final int R_OPTION_NEW = 11;
	protected static final int R_OPTION_MAINTENANCE = 12;
	protected static final int R_OPTION_DELETE = 13;
	protected static final int A_OPTION_MAINTENANCE = 14;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_MENU_LANGUAGE :
				procReqMenu(user, req, res, session);
				break;
			case A_MENU_LANGUAGE :
				procReqMenuList(user, req, res, session);
				break;
			case R_MENU_NEW :
				procReqNewMenu(user, req, res, session);
				break;
			case R_MENU_MAINTENANCE :
				procReqMenuMaintenance(user, req, res, session);
				break;
			case R_MENU_DELETE :
				procReqMenuDelete(user, req, res, session);
				break;
			case A_MENU_MAINTENANCE :
				procActionMenuMaintenance(user, req, res, session);
				break;
			case R_MENU_OPTIONS :
				procReqOptionsList(user, req, res, session);
				break;
			case R_OPTION_NEW :
				procReqOptionsNew(user, req, res, session);
				break;
			case R_OPTION_MAINTENANCE :
				procReqOptionsMaintenance(user, req, res, session);
				break;
			case R_OPTION_DELETE :
				procReqOptionsDelete(user, req, res, session);
				break;
			case A_OPTION_MAINTENANCE :
				procAcionOptionsMaintenance(user, req, res, session);
				break;
			default:	
				forward(devPage, req, res);
				break;
		}
	}
	


	private void procReqMenu(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		flexLog("Putting java beans into the session");
		forward("EUT0110_eibs_menu_language.jsp", req, res);

	}	
	
	private void procReqMenuList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EUT0110", req);
			EUT011001Message msgMenu = (EUT011001Message) mp.getMessageRecord("EUT011001");
		 	msgMenu.setH01USERID(user.getH01USR());
		 	msgMenu.setH01PROGRM("EUT0110");
		 	msgMenu.setH01TIMSYS(getTimeStamp());
		 	msgMenu.setH01SCRCOD("01");
		 	msgMenu.setH01OPECOD("0015");
		 	if (req.getParameter("CODLAN")== null){
			 	msgMenu.setE01MMILIF(userPO.getHeader1());
		 	} else {
			 	msgMenu.setE01MMILIF(req.getParameter("CODLAN"));
			 	userPO.setHeader1(req.getParameter("CODLAN"));
		 	}
			if (user.getE01AUT().equals("A")){
				userPO.setOption("Y"); 
			} else {
				userPO.setOption("N"); 
			}
			mp.sendMessage(msgMenu);
			
			//Receive menu list
			JBObjList msglst = mp.receiveMessageRecordList("H01FLGMAS");

			session.setAttribute("userPO", userPO);
			session.setAttribute("msglst", msglst);

			forward("EUT0110_eibs_menu_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqNewMenu(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EUT0110", req);
			EUT011001Message msgMenu = (EUT011001Message) mp.getMessageRecord("EUT011001");
			msgMenu.setH01USERID(user.getH01USR());
			msgMenu.setH01PROGRM("EUT0110");
			msgMenu.setH01TIMSYS(getTimeStamp());
	    	msgMenu.setH01SCRCOD("01");
	    	msgMenu.setH01OPECOD("0001");

			msgMenu.setE01MMILIF(userPO.getHeader1());
			msgMenu.setE01MMIDEN(req.getParameter("E01MMIDEN"));
			
			mp.sendMessage(msgMenu);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMenu = (EUT011001Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				//if there are no errors
				session.setAttribute("userPO", userPO);
				session.setAttribute("refCodes", msgMenu);
				session.setAttribute("error", msgError);
				
				forward("EUT0110_eibs_menu_maintenance.jsp", req, res);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EUT0110_eibs_menu_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	private void procReqMenuMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EUT0110", req);
			
			JBObjList list = (JBObjList)session.getAttribute("msglst");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EUT011001Message listMessage = (EUT011001Message)list.get(index);
			
			EUT011001Message msgMenu = (EUT011001Message) mp.getMessageRecord("EUT011001");
			msgMenu.setH01USERID(user.getH01USR());
			msgMenu.setH01PROGRM("EUT0110");
			msgMenu.setH01TIMSYS(getTimeStamp());
			msgMenu.setH01SCRCOD("01");
			msgMenu.setH01OPECOD("0002");
			msgMenu.setE01MMIDEN(listMessage.getE01MMIDEN());
			msgMenu.setE01MMILIF(listMessage.getE01MMILIF());

			mp.sendMessage(msgMenu);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMenu = (EUT011001Message) mp.receiveMessageRecord();

			session.setAttribute("userPO", userPO);
			session.setAttribute("refCodes", msgMenu);
			session.setAttribute("error", msgError);

			flexLog("Putting java beans into the session");
			forward("EUT0110_eibs_menu_maintenance.jsp", req, res);
						
		} finally {
			if(mp !=null)
				mp.close();
		}
		
	}
	
	private void procReqMenuDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EUT0110", req);
			
			JBObjList list = (JBObjList)session.getAttribute("msglst");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EUT011001Message listMessage = (EUT011001Message)list.get(index);
			
			EUT011001Message msgMenu = (EUT011001Message) mp.getMessageRecord("EUT011001");
		 	msgMenu.setH01USERID(user.getH01USR());
		 	msgMenu.setH01TIMSYS(getTimeStamp());
		 	msgMenu.setH01SCRCOD("01");
		 	msgMenu.setH01OPECOD("0009");	
			msgMenu.setE01MMIDEN(listMessage.getE01MMIDEN());
			msgMenu.setE01MMILIF(listMessage.getE01MMILIF());
		 				
			mp.sendMessage(msgMenu);
			
			//Receive Error
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				procReqMenuList(user, req, res, session);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("EUT0110_eibs_menu_list.jsp", req, res);
			}
		} finally {
			if (mp != null)	mp.close();
		}
}
	
	private void procActionMenuMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EUT0110", req);
			EUT011001Message msgMenu = (EUT011001Message) mp.getMessageRecord("EUT011001");
		 	msgMenu.setH01USERID(user.getH01USR());
		 	msgMenu.setH01PROGRM("EUT0110");
		 	msgMenu.setH01TIMSYS(getTimeStamp());
		 	msgMenu.setH01SCRCOD("01");
			msgMenu.setH01OPECOD("0005");
			
		 	setMessageRecord(req,msgMenu);

		 	try {
				((CharacterField) msgMenu.getField("E01MMENDS")).setStringUD(req.getParameter("E01MMENDS"));
			} catch (Exception e) {
			}
		 	
		 	msgMenu.setE01MMILIF(userPO.getHeader1());
			
			mp.sendMessage(msgMenu);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMenu = (EUT011001Message) mp.receiveMessageRecord();

			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			session.setAttribute("refCodes", msgMenu);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				procReqMenuList(user, req, res, session);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("EUT0110_eibs_menu_maintenance.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqOptionsList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EUT0110", req);

			JBObjList list = (JBObjList)session.getAttribute("msglst");
			int index = Util.parseInt(req.getParameter("key"));
			
			if (req.getParameter("key") != null){
				EUT011001Message listMessage = (EUT011001Message)list.get(index);
			 	userPO.setHeader10(listMessage.getE01MMIDEN());
			 	userPO.setHeader11(listMessage.getE01MMENDS());
			}
			
			EUT011002Message msgMenu = (EUT011002Message) mp.getMessageRecord("EUT011002");
		 	msgMenu.setH02USERID(user.getH01USR());
		 	msgMenu.setH02PROGRM("EUT0110");
		 	msgMenu.setH02TIMSYS(getTimeStamp());
		 	msgMenu.setH02SCRCOD("01");
		 	msgMenu.setH02OPECOD("0015");
		 	msgMenu.setE02CMILIF(userPO.getHeader1());
		 	msgMenu.setE02CMMSID(userPO.getHeader10());
		 	
			mp.sendMessage(msgMenu);
			
			//Receive menu list
			JBObjList msglst = mp.receiveMessageRecordList("H02FLGMAS");

			session.setAttribute("userPO", userPO);
			session.setAttribute("msglst", msglst);

			forward("EUT0110_eibs_menu_option_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqOptionsNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EUT0110", req);
			EUT011002Message msgMenu = (EUT011002Message) mp.getMessageRecord("EUT011002");
			msgMenu.setH02USERID(user.getH01USR());
			msgMenu.setH02PROGRM("EUT0110");
			msgMenu.setH02TIMSYS(getTimeStamp());
			msgMenu.setH02SCRCOD("01");
			msgMenu.setH02OPECOD("0001");			
			msgMenu.setE02CMILIF(userPO.getHeader1());
		 	msgMenu.setE02CMMSID(userPO.getHeader10());
			msgMenu.setE02CMIDEN(req.getParameter("E02CMIDEN"));
									
		 	mp.sendMessage(msgMenu);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMenu = (EUT011002Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				//if there are no errors
				session.setAttribute("userPO", userPO);
				session.setAttribute("refCodes", msgMenu);
				session.setAttribute("error", msgError);

				forward("EUT0110_eibs_menu_option_maintenance.jsp", req, res);
			} else {
				//if there are errors
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EUT0110_eibs_menu_option_list.jsp", req, res);
			}


		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	private void procReqOptionsMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EUT0110", req);
			
			JBObjList list = (JBObjList)session.getAttribute("msglst");
			int index1 = Integer.parseInt(req.getParameter("key1").trim());
			EUT011002Message listMessage = (EUT011002Message)list.get(index1);
			
			EUT011002Message msgMenu = (EUT011002Message) mp.getMessageRecord("EUT011002");
			msgMenu.setH02USERID(user.getH01USR());
			msgMenu.setH02PROGRM("EUT0110");
			msgMenu.setH02TIMSYS(getTimeStamp());
			msgMenu.setH02SCRCOD("01");
			msgMenu.setH02OPECOD("0002");
			msgMenu.setE02CMILIF(listMessage.getE02CMILIF());
			msgMenu.setE02CMMSID(listMessage.getE02CMMSID());
			msgMenu.setE02CMIDEN(listMessage.getE02CMIDEN());
			
			mp.sendMessage(msgMenu);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMenu = (EUT011002Message) mp.receiveMessageRecord();

			session.setAttribute("userPO", userPO);
			session.setAttribute("refCodes", msgMenu);
			session.setAttribute("error", msgError);

			flexLog("Putting java beans into the session");
			forward("EUT0110_eibs_menu_option_maintenance.jsp", req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	private void procReqOptionsDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
	    throws ServletException, IOException {

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EUT0110", req);
			
			JBObjList list = (JBObjList)session.getAttribute("msglst");
			int index1 = Integer.parseInt(req.getParameter("key1").trim());
			EUT011002Message listMessage = (EUT011002Message)list.get(index1);
			
			EUT011002Message msgMenu = (EUT011002Message) mp.getMessageRecord("EUT011002");		
			msgMenu.setH02USERID(user.getH01USR());
		 	msgMenu.setH02TIMSYS(getTimeStamp());
		 	msgMenu.setH02SCRCOD("01");
		 	msgMenu.setH02OPECOD("0009");
			msgMenu.setE02CMILIF(listMessage.getE02CMILIF());
			msgMenu.setE02CMMSID(listMessage.getE02CMMSID());
			msgMenu.setE02CMIDEN(listMessage.getE02CMIDEN());
		 				
			mp.sendMessage(msgMenu);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				procReqOptionsList(user, req, res, session);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("EUT0110_eibs_menu_option_list.jsp", req, res);
			}

		} finally {
			if (mp != null)	mp.close();
		}
}
	
	private void procAcionOptionsMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
	throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EUT0110", req);
			EUT011002Message msgMenu = (EUT011002Message) mp.getMessageRecord("EUT011002");
		 	msgMenu.setH02USERID(user.getH01USR());
		 	msgMenu.setH02PROGRM("EUT0110");
		 	msgMenu.setH02TIMSYS(getTimeStamp());
		 	msgMenu.setH02SCRCOD("01");
		 	msgMenu.setH02OPECOD("0005");
		 			 			 	
		 	setMessageRecord(req,msgMenu);
		 	
		 	msgMenu.setE02CMILIF(userPO.getHeader1());
		 	msgMenu.setE02CMMSID(userPO.getHeader10());
		 	
		 	try {
				((CharacterField) msgMenu.getField("E02CMENDS")).setStringUD(req.getParameter("E02CMENDS"));
				((CharacterField) msgMenu.getField("E02CMTGAD")).setStringUD(req.getParameter("E02CMTGAD"));
				((CharacterField) msgMenu.getField("E02CMTGPO")).setStringUD(req.getParameter("E02CMTGPO").toLowerCase());
			} catch (Exception e) {
			}
		 	
			mp.sendMessage(msgMenu);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMenu = (EUT011002Message) mp.receiveMessageRecord("EUT011002");

			session.setAttribute("userPO", userPO);
			session.setAttribute("msgMenu", msgMenu);
			session.setAttribute("error", msgError);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				procReqOptionsList(user, req, res, session);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("EUT0110_eibs_menu__otion_maintenance.jsp", req, res);
			}
		 
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
}
	
	




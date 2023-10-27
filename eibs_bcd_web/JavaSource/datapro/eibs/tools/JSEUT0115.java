package datapro.eibs.tools;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generic.tool.Util;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EUT011501Message;
import datapro.eibs.beans.EUT011502Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.CharacterField;

public class JSEUT0115 extends JSEIBSServlet {

	
	protected static final int R_PAGINA_LANGUAGE = 100;
	protected static final int A_PAGINA_LANGUAGE = 200;
	protected static final int R_PAGINA_NEW = 1;
	protected static final int R_PAGINA_MAINTENANCE = 2;
	protected static final int R_PAGINA_DELETE = 3;
	protected static final int A_PAGINA_MAINTENANCE = 4;
	protected static final int R_PAGINA_OPTIONS = 8;

	protected static final int R_OPTION_NEW = 11;
	protected static final int R_OPTION_MAINTENANCE = 12;
	protected static final int R_OPTION_DELETE = 13;
	protected static final int A_OPTION_MAINTENANCE = 14;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_PAGINA_LANGUAGE :
				procReqMenu(user, req, res, session);
				break;
			case A_PAGINA_LANGUAGE :
				procReqMenuList(user, req, res, session);
				break;
			case R_PAGINA_NEW :
				procReqNewMenu(user, req, res, session);
				break;
			case R_PAGINA_MAINTENANCE :
				procReqMenuMaintenance(user, req, res, session);
				break;
			case R_PAGINA_DELETE :
				procReqMenuDelete(user, req, res, session);
				break;
			case A_PAGINA_MAINTENANCE :
				procActionMenuMaintenance(user, req, res, session);
				break;
			case R_PAGINA_OPTIONS :
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
		forward("EUT0115_eibs_paginas_language.jsp", req, res);

	}	
	
	private void procReqMenuList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EUT0115", req);
			EUT011501Message msgMenu = (EUT011501Message) mp.getMessageRecord("EUT011501");
		 	msgMenu.setH01USERID(user.getH01USR());
		 	msgMenu.setH01PROGRM("EUT0115");
		 	msgMenu.setH01TIMSYS(getTimeStamp());
		 	msgMenu.setH01SCRCOD("01");
		 	msgMenu.setH01OPECOD("0015");
		 	if (req.getParameter("CODLAN")== null){
			 	msgMenu.setE01MOILIF(userPO.getHeader1());
		 	} else {
			 	msgMenu.setE01MOILIF(req.getParameter("CODLAN"));
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

			forward("EUT0115_eibs_paginas_list.jsp", req, res);

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
			mp = getMessageProcessor("EUT0115", req);
			EUT011501Message msgMenu = (EUT011501Message) mp.getMessageRecord("EUT011501");
			msgMenu.setH01USERID(user.getH01USR());
			msgMenu.setH01PROGRM("EUT0115");
			msgMenu.setH01TIMSYS(getTimeStamp());
	    	msgMenu.setH01SCRCOD("01");
	    	msgMenu.setH01OPECOD("0001");

			msgMenu.setE01MOILIF(userPO.getHeader1());
			msgMenu.setE01MOIDEN(req.getParameter("E01MOIDEN"));
			
			mp.sendMessage(msgMenu);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMenu = (EUT011501Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				//if there are no errors
				session.setAttribute("userPO", userPO);
				session.setAttribute("refCodes", msgMenu);
				session.setAttribute("error", msgError);
				
				forward("EUT0115_eibs_paginas_maintenance.jsp", req, res);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EUT0115_eibs_paginas_list.jsp", req, res);
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
			mp = getMessageProcessor("EUT0115", req);
			
			JBObjList list = (JBObjList)session.getAttribute("msglst");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EUT011501Message listMessage = (EUT011501Message)list.get(index);
			
			EUT011501Message msgMenu = (EUT011501Message) mp.getMessageRecord("EUT011501");
			msgMenu.setH01USERID(user.getH01USR());
			msgMenu.setH01PROGRM("EUT0115");
			msgMenu.setH01TIMSYS(getTimeStamp());
			msgMenu.setH01SCRCOD("01");
			msgMenu.setH01OPECOD("0002");
			if (user.getH01USR().substring(3).equals("DATAPRO")){
				msgMenu.setH01FLGWK1("Y"); 				
			} else {
				msgMenu.setH01FLGWK1("N"); 
			}
			msgMenu.setE01MOIDEN(listMessage.getE01MOIDEN());
			msgMenu.setE01MOILIF(listMessage.getE01MOILIF());

			mp.sendMessage(msgMenu);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMenu = (EUT011501Message) mp.receiveMessageRecord();

			session.setAttribute("userPO", userPO);
			session.setAttribute("refCodes", msgMenu);
			session.setAttribute("error", msgError);

			flexLog("Putting java beans into the session");
			forward("EUT0115_eibs_paginas_maintenance.jsp", req, res);
						
		} finally {
			if(mp !=null)
				mp.close();
		}
		
	}
	
	private void procReqMenuDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EUT0115", req);
			
			JBObjList list = (JBObjList)session.getAttribute("msglst");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EUT011501Message listMessage = (EUT011501Message)list.get(index);
			
			EUT011501Message msgMenu = (EUT011501Message) mp.getMessageRecord("EUT011501");
		 	msgMenu.setH01USERID(user.getH01USR());
		 	msgMenu.setH01TIMSYS(getTimeStamp());
		 	msgMenu.setH01SCRCOD("01");
		 	msgMenu.setH01OPECOD("0009");	
			msgMenu.setE01MOIDEN(listMessage.getE01MOIDEN());
			msgMenu.setE01MOILIF(listMessage.getE01MOILIF());
		 				
			mp.sendMessage(msgMenu);
			
			//Receive Error
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				procReqMenuList(user, req, res, session);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("EUT0115_eibs_paginas_list.jsp", req, res);
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
			mp = getMessageProcessor("EUT0115", req);
			EUT011501Message msgMenu = (EUT011501Message) mp.getMessageRecord("EUT011501");
		 	msgMenu.setH01USERID(user.getH01USR());
		 	msgMenu.setH01PROGRM("EUT0115");
		 	msgMenu.setH01TIMSYS(getTimeStamp());
		 	msgMenu.setH01SCRCOD("01");
			msgMenu.setH01OPECOD("0005");
			
		 	setMessageRecord(req,msgMenu);

  			try {
				((CharacterField) msgMenu.getField("E01MOENDS")).setStringUD(req.getParameter("E01MOENDS"));
				((CharacterField) msgMenu.getField("E01MOCODE")).setStringUD(req.getParameter("E01MOCODE"));
  			} catch (Exception e) {
			}
		 	
		 	msgMenu.setE01MOILIF(userPO.getHeader1());
			
			mp.sendMessage(msgMenu);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMenu = (EUT011501Message) mp.receiveMessageRecord();

			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			session.setAttribute("refCodes", msgMenu);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				procReqMenuList(user, req, res, session);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("EUT0115_eibs_paginas_maintenance.jsp", req, res);
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
			mp = getMessageProcessor("EUT0115", req);

			JBObjList list = (JBObjList)session.getAttribute("msglst");
			int index = Util.parseInt(req.getParameter("key"));
			
			if (req.getParameter("key") != null){
				EUT011501Message listMessage = (EUT011501Message)list.get(index);
			 	userPO.setHeader10(listMessage.getE01MOIDEN());
			 	userPO.setHeader11(listMessage.getE01MOENDS());
			 	userPO.setHeader19(listMessage.getE01MOCODE());
			}
			
			EUT011502Message msgMenu = (EUT011502Message) mp.getMessageRecord("EUT011502");
		 	msgMenu.setH02USERID(user.getH01USR());
		 	msgMenu.setH02PROGRM("EUT0115");
		 	msgMenu.setH02TIMSYS(getTimeStamp());
		 	msgMenu.setH02SCRCOD("01");
		 	msgMenu.setH02OPECOD("0015");
		 	msgMenu.setE02COILIF(userPO.getHeader1());
		 	msgMenu.setE02COMSID(userPO.getHeader10());
		 	//msgMenu.setE02CMOCDE (userPO.getHeader19());
		 	((CharacterField) msgMenu.getField("E02CMOCDE")).setStringUD(userPO.getHeader19());
		 	
			mp.sendMessage(msgMenu);
			
			//Receive menu list
			JBObjList msglst = mp.receiveMessageRecordList("H02FLGMAS");

			session.setAttribute("userPO", userPO);
			session.setAttribute("msglst", msglst);

			forward("EUT0115_eibs_paginas_option_list.jsp", req, res);

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
			mp = getMessageProcessor("EUT0115", req);
			EUT011502Message msgMenu = (EUT011502Message) mp.getMessageRecord("EUT011502");
			msgMenu.setH02USERID(user.getH01USR());
			msgMenu.setH02PROGRM("EUT0115");
			msgMenu.setH02TIMSYS(getTimeStamp());
			msgMenu.setH02SCRCOD("01");
			msgMenu.setH02OPECOD("0001");			
			msgMenu.setE02COILIF(userPO.getHeader1());
		 	msgMenu.setE02COMSID(userPO.getHeader10());
		 	//msgMenu.setE02CMOCDE(userPO.getHeader19());
		 	((CharacterField) msgMenu.getField("E02CMOCDE")).setStringUD(userPO.getHeader19());
			msgMenu.setE02COIDEN(req.getParameter("E02COIDEN"));
									
		 	mp.sendMessage(msgMenu);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMenu = (EUT011502Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				//if there are no errors
				session.setAttribute("userPO", userPO);
				session.setAttribute("refCodes", msgMenu);
				session.setAttribute("error", msgError);
				
				forward("EUT0115_eibs_paginas_option_maintenance.jsp", req, res);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EUT0115_eibs_paginas_option_list.jsp", req, res);
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
			mp = getMessageProcessor("EUT0115", req);
			
			JBObjList list = (JBObjList)session.getAttribute("msglst");
			int index1 = Integer.parseInt(req.getParameter("key1").trim());
			EUT011502Message listMessage = (EUT011502Message)list.get(index1);
			
			EUT011502Message msgMenu = (EUT011502Message) mp.getMessageRecord("EUT011502");
			msgMenu.setH02USERID(user.getH01USR());
			msgMenu.setH02PROGRM("EUT0115");
			msgMenu.setH02TIMSYS(getTimeStamp());
			msgMenu.setH02SCRCOD("01");
			msgMenu.setH02OPECOD("0002");
			msgMenu.setE02COILIF(listMessage.getE02COILIF());
			msgMenu.setE02COMSID(listMessage.getE02COMSID());
			//msgMenu.setE02CMOCDE(listMessage.getE02CMOCDE().toLowerCase());
			((CharacterField) msgMenu.getField("E02CMOCDE")).setStringUD(listMessage.getE02CMOCDE());
			msgMenu.setE02COIDEN(listMessage.getE02COIDEN());
			
			mp.sendMessage(msgMenu);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMenu = (EUT011502Message) mp.receiveMessageRecord();

			session.setAttribute("userPO", userPO);
			session.setAttribute("refCodes", msgMenu);
			session.setAttribute("error", msgError);

			flexLog("Putting java beans into the session");
			forward("EUT0115_eibs_paginas_option_maintenance.jsp", req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	private void procReqOptionsDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
	    throws ServletException, IOException {

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EUT0115", req);
			
			JBObjList list = (JBObjList)session.getAttribute("msglst");
			int index1 = Integer.parseInt(req.getParameter("key1").trim());
			EUT011502Message listMessage = (EUT011502Message)list.get(index1);
			
			EUT011502Message msgMenu = (EUT011502Message) mp.getMessageRecord("EUT011502");		
			msgMenu.setH02USERID(user.getH01USR());
		 	msgMenu.setH02TIMSYS(getTimeStamp());
		 	msgMenu.setH02SCRCOD("01");
		 	msgMenu.setH02OPECOD("0009");
			msgMenu.setE02COILIF(listMessage.getE02COILIF());
			msgMenu.setE02COMSID(listMessage.getE02COMSID());
			//msgMenu.setE02CMOCDE(listMessage.getE02CMOCDE().toLowerCase());
			((CharacterField) msgMenu.getField("E02CMOCDE")).setStringUD(listMessage.getE02CMOCDE());
			msgMenu.setE02COIDEN(listMessage.getE02COIDEN());
		 				
			mp.sendMessage(msgMenu);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				procReqOptionsList(user, req, res, session);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("EUT0115_eibs_paginas_option_list.jsp", req, res);
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
			mp = getMessageProcessor("EUT0115", req);
			EUT011502Message msgMenu = (EUT011502Message) mp.getMessageRecord("EUT011502");
		 	msgMenu.setH02USERID(user.getH01USR());
		 	msgMenu.setH02PROGRM("EUT0115");
		 	msgMenu.setH02TIMSYS(getTimeStamp());
		 	msgMenu.setH02SCRCOD("01");
		 	msgMenu.setH02OPECOD("0005");
		 			 			 	
		 	setMessageRecord(req,msgMenu);
		 	
		 	msgMenu.setE02COILIF(userPO.getHeader1());
		 	msgMenu.setE02COMSID(userPO.getHeader10());
		 	((CharacterField) msgMenu.getField("E02CMOCDE")).setStringUD(userPO.getHeader19());
		 	
		 	try {
				((CharacterField) msgMenu.getField("E02COENDS")).setStringUD(req.getParameter("E02COENDS"));
				((CharacterField) msgMenu.getField("E02COTGAD")).setStringUD(req.getParameter("E02COTGAD").replaceAll("jvscrpt", "javascript"));
				((CharacterField) msgMenu.getField("E02COTGPO")).setStringUD(req.getParameter("E02COTGPO").toLowerCase());
			} catch (Exception e) {
			}
		 	
			mp.sendMessage(msgMenu);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMenu = (EUT011502Message) mp.receiveMessageRecord("EUT011502");

			session.setAttribute("userPO", userPO);
			session.setAttribute("msgMenu", msgMenu);
			session.setAttribute("error", msgError);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				procReqOptionsList(user, req, res, session);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("EUT0115_eibs_paginas_option_maintenance.jsp", req, res);
			}
		 
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
}

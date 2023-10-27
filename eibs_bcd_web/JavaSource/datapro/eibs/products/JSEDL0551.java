package datapro.eibs.products; 

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL0551 extends JSEIBSServlet
{
    protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
		HttpSession session, int screen) throws ServletException, IOException 
    {
	switch (screen) 
	{
		// Requests List
	
		case 0 :
			procReqEnter(user, req, res, session);
			break;
		case 1 :
			procReqList(user, req, res, session);
			break;
		case 2 : // Request new Record
		case 3 : // Request Maintenance Record
			procActionRec(user, req, res, session, screen);
			break;
		case 4 : // Request approve list
			procActionMaint(user, req, res, session);
			break;

		case 9 : // Request Delete Record
			procReqDelete(user, req, res, session);
			break;
			// Requests List 
		case 10 :
			procActionMaintProceso(user, req, res, session);
			break;
		case 11 :
			procReqMainEnter(user, req, res, session);
			break;			
		case 12 :
			procReqListMain(user, req, res, session);
			break;				
		case 13 : // Request Delete Record
			procReqDeleteAdi(user, req, res, session);
			break;			
		case 14 :
			procActionProcesoApr(user, req, res, session);
			break;
		case 15 :
			procReqListMainConsul(user, req, res, session);
			break;			
		default :
			forward(SuperServlet.devPage, req, res);
			break;
	}
    }
    
    protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses) throws ServletException, IOException 
    {
    
    	UserPos	userPO = null;	
    	MessageProcessor mp = null;
    	MessageRecord newmessage = null;
    	ELEERRMessage error = null;
    	try 
    	{
    		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
    		mp = new MessageProcessor("EDL0551");
    		
    		EDL055101Message msg = (EDL055101Message) mp.getMessageRecord("EDL055101");
    					
    		//Send Initial data
    		msg.setH01USERID(user.getH01USR());
    		msg.setH01PROGRM("EDL0551");
    		msg.setH01TIMSYS(getTimeStamp());
    		msg.setH01SCRCOD("01");
    		//0015 command to get a list
    		msg.setH01OPECOD("0015");
    		
    		try {
				msg.setE01SIMCDE(req.getParameter("E01SIMCDE"));
			} catch (Exception e) { 
				msg.setE01SIMCDE(userPO.getHeader1());
			}
    		try {
				userPO.setHeader1(msg.getE01SIMCDE());
			} catch (Exception e) { }
    		// Send Message	
    		mp.sendMessage(msg);
    	
    		//Receive Data H01FLGMAS contains a * 
    		newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDL0551_prov_adi_enter.jsp", req, res);
			} else {	
    		
    		JBSortList list = new JBSortList();
    		
    		JBObjList lst =(JBObjList) mp.receiveMessageRecordList("H01FLGMAS");
    		
    		lst.initRow();
			while (lst.getNextRow()) {
				list.add((datapro.eibs.beans.EDL055101Message) lst.getRecord());
			}
    		
    	//	String[] sortFlds = { "E01TADCPY", "E01TADCPM", "E01TADIND", "E01TADDSC" };
    	//	list.setSortKey(sortFlds);
    	//	list.setSortOrder(JBSortList.DESCENDENTE);
    	//	list.sort();
    
    		JBObjList lista = new JBObjList();
    	  int indexRow=0;
  		  for (indexRow = list.getBaseIdx(); indexRow < list.getSize() && indexRow < list.getBaseIdx() + list.getDisplaySize(); indexRow++) { 
  			lista.add((datapro.eibs.beans.EDL055101Message) list.getData(indexRow));
  		  }
    		
  		  	ses.setAttribute("userPO", userPO);
    		ses.setAttribute("eDL0551List", lista);
    		
    		if(mp.hasError(lst)) 
    		{
    			forward("Under_construction.jsp", req, res);				
    		} 
    		else 
    		{
    			forward("EDL0551_search_sim_masiva_list.jsp", req, res);
    		}
			}
    	} 
    	finally 
    	{
    		if (mp != null)
    			mp.close();
    	}
    }

    protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses, int screen) throws ServletException, IOException 
        {
    	
    	MessageProcessor mp = null;
    	MessageRecord newmessage = null;
    	UserPos userPO = null;
    	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
    	userPO.setPurpose("MAINTENANCE");

    	// Send data
    	try 
    	{
    		mp = new MessageProcessor("EDL0551");
    		EDL055101Message msg = (EDL055101Message) mp.getMessageRecord("EDL055101");
    		
    		//Send Initial data
    		msg.setH01USERID(user.getH01USR());
    		msg.setH01PROGRM("EDL0551");
    		msg.setH01TIMSYS(getTimeStamp());
    		msg.setH01SCRCOD("01");
    		msg.setH01OPECOD("1000");
    		
    		switch (screen) 
    		{
    			case 2 : // Request new Record
    				userPO.setPurpose("NEW");
    				break;
    			case 3 : // Request old Record
    				userPO.setPurpose("MAINT");
    				break;
    		}
    		if(screen != 2)
    		{
    			//Get List from session and get the specific row from the list
    			try
    			{
    				JBObjList list =(JBObjList)ses.getAttribute("eDL0551List");
    				msg = (EDL055101Message)list.get(Integer.parseInt(req.getParameter("ROW")));
    				ses.setAttribute("msg", msg);
    				forward("EDL0551_sim_detail.jsp", req, res);
    			}
    			catch (Exception e)
    			{
    				ses.setAttribute("error", newmessage);
    				forward("EDL0551_search_sim_masiva_list.jsp", req, res);
    			} 
    		}
    		else
    		{
    			EDL055101Message record = new EDL055101Message();
    			ses.setAttribute("msg", record);
    			forward("EDL0551_sim_detail.jsp", req, res);				
    		}
    		
    		ses.setAttribute("userPO", userPO);
    	}
    	finally 
    	{
    	    if (mp != null) 
    		mp.close();
    	}
        }


    private void procReqDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
		throws IOException, ClassCastException, ServletException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL055101", req);
				
			JBObjList list = (JBObjList)session.getAttribute("eDL0551List");
			int index = Integer.parseInt(req.getParameter("ROW").trim());
			
			EDL055101Message listMessage = (EDL055101Message)list.get(index);
			
			EDL055101Message msgList = (EDL055101Message) mp.getMessageRecord("EDL055101");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL055101");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0009");
			
			//
			try {
				msgList.setE01SIMCDE(userPO.getHeader1());
			} catch (Exception e) { }
			msgList.setE01SIMTIP(listMessage.getE01SIMTIP());
			msgList.setE01SIMMOD(listMessage.getE01SIMMOD());
			msgList.setE01SIMCAL(listMessage.getE01SIMCAL());			
			msgList.setE01SIMTPR(listMessage.getE01SIMTPR());			
			msgList.setE01SIMPRO(listMessage.getE01SIMPRO());			
		   
			//
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0551_search_sim_masiva_list.jsp", req, res);
			} else {
				//procReqList(user, req, res, session);
				redirectToPage("/servlet/datapro.eibs.products.JSEDL0551?SCREEN=1&E01SIMCDE=" + userPO.getHeader1() , res);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
		
	}
    private void procReqDeleteAdi(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
		throws IOException, ClassCastException, ServletException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL055102", req);
				
			JBObjList list = (JBObjList)session.getAttribute("eDL0552List");
			int index = Integer.parseInt(req.getParameter("ROW").trim());
			
			EDL055102Message listMessage = (EDL055102Message)list.get(index);
			
			EDL055102Message msgList = (EDL055102Message) mp.getMessageRecord("EDL055102");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL055102");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02SCRCOD("01");
			msgList.setH02OPECOD("0009");
			
			//
			msgList.setE02DLMCDE(listMessage.getE02DLMCDE());
			msgList.setE02DLMACC(listMessage.getE02DLMACC());
			//
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0551_search_sim_masiva_list_maint.jsp", req, res);
			} else {
				//procReqListMain(user, req, res, session);
				redirectToPage("/servlet/datapro.eibs.products.JSEDL0551?SCREEN=12&E02DLMCDE=" + userPO.getHeader1() , res);					
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
		
	}

    protected void procActionMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
		UserPos userPO = (UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0551", req);
			String opeCode= "NEW".equals(userPO.getPurpose())?"0001":"0000";
			EDL055101Message msg = (EDL055101Message) mp.getMessageRecord("EDL055101", user.getH01USR(),opeCode );
			setMessageRecord(req, msg);
			msg.setH01SCRCOD("01");
			
    		try {
    			msg.setE01SIMCDE(userPO.getHeader1());
			} catch (Exception e) { }
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL055101Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			//userPO.setPurpose("MAINTENANCE");
			//userPO.setOption("PR");


			
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0551_sim_detail.jsp";
				forward(PageToCall, req, res);
			} else {
				PageToCall = "EDL0551_search_sim_masiva_list.jsp";
				//procReqList(user, req, res, ses);
				redirectToPage("/servlet/datapro.eibs.products.JSEDL0551?SCREEN=1&E01SIMCDE=" + userPO.getHeader1() , res);				
			}
			//forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
        }

    protected void procActionMaintProceso(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
		UserPos userPO = (UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0551", req);
			EDL055101Message msg = (EDL055101Message) mp.getMessageRecord("EDL055101", user.getH01USR(), "0016");
			setMessageRecord(req, msg);
			msg.setH01SCRCOD("02");
			try {
    			msg.setE01SIMCDE(userPO.getHeader1());
			} catch (Exception e) { }
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL055101Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			userPO.setPurpose("MAINTENANCE");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0551_cal_prov_confirm_error.jsp";
			} else {
				PageToCall = "EDL0551_cal_prov_confirm.jsp";
			}
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
        }
    protected void procActionProcesoApr(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
		UserPos userPO = (UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0551", req);
			EDL055102Message msg = (EDL055102Message) mp.getMessageRecord("EDL055102", user.getH01USR(), "0017");
			setMessageRecord(req, msg);
			msg.setH02SCRCOD("02");
			try {
    			msg.setE02DLMCDE(userPO.getHeader1());
			} catch (Exception e) { }
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL055102Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			userPO.setPurpose("MAINTENANCE");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0551_apr_prov_confirm_error.jsp";
			} else {
				PageToCall = "EDL0551_apr_prov_confirm.jsp";
			}
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
        }    
	// SCREEN = 11 
	// Solicita Datos de Entrada para consulta
	//
	protected void procReqMainEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
	throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos	userPO = null;	
		EDL055102Message msgInc = null;
			try {

				msgError = new datapro.eibs.beans.ELEERRMessage();
				userPO = new datapro.eibs.beans.UserPos();
				msgInc = new datapro.eibs.beans.EDL055102Message();
				userPO.setOption("CONSUL_INCUMP");
				userPO.setPurpose("INQUIRY");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("califica", msgInc);

			} catch (Exception ex) { 
				flexLog("Error: " + ex); 
			}

			try {
				forward("EDL0551_main_prov_adi_enter.jsp", req, res);		
			}
			catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

}
	// SCREEN = 0
	// Solicita Datos de Entrada para consulta
	//
	protected void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
	throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos userPO = new UserPos();
		EDL055101Message msgInc = null;
			try {

				msgError = new datapro.eibs.beans.ELEERRMessage();
				userPO = new datapro.eibs.beans.UserPos();
				msgInc = new datapro.eibs.beans.EDL055101Message();
				userPO.setOption("CONSUL_INCUMP");
				userPO.setPurpose("INQUIRY");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("califica1", msgInc);

			} catch (Exception ex) { 
				flexLog("Error: " + ex); 
			}

			try {
				forward("EDL0551_prov_adi_enter.jsp", req, res);		
			}
			catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

}
	// SCREEN = 12 
	//
	protected void procReqListMain(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		try { 
			mp = new MessageProcessor("EDL0551");
			EDL055102Message msg = (EDL055102Message) mp.getMessageRecord("EDL055102");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("CONSUL_CALIFICA");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0551");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("0001");
			
			try {
				msg.setE02DLMCDE(req.getParameter("E02DLMCDE"));
			} catch (Exception e) { 
				msg.setE02DLMCDE(userPO.getHeader1());
			}

			try {
				userPO.setHeader1(msg.getE02DLMCDE());
			} catch (Exception e) { }
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDL0551_main_prov_adi_enter.jsp", req, res);
			} else {
			
			
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("H02FLGMAS");
			try {
				userPO.setHeader6(msg.getE02MONTOA());
				userPO.setHeader2(msg.getE02TOTMEP());
				userPO.setHeader3(msg.getE02TOTPPR());
				userPO.setHeader4(msg.getE02TOTPAC());
				userPO.setHeader5(msg.getE02TOTPTO());
			} catch (Exception e) { }
			


			try {
			} catch (Exception e) { }
			ses.setAttribute("userPO", userPO);
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
				forwardOnSuccess("EDL0551_main_prov_adi_enter.jsp", req, res);
			} else {
				ses.setAttribute("eDL0552List", list);
				forwardOnSuccess("EDL0551_search_sim_masiva_list_maint.jsp", req, res);
			}
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	// SCREEN = 12 
	//
	protected void procReqListMainConsul(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		try { 
			mp = new MessageProcessor("EDL0551");
			EDL055102Message msg = (EDL055102Message) mp.getMessageRecord("EDL055102");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("CONSUL_CALIFICA");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0551");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("0002");
			
			try {
				msg.setE02DLMCDE(req.getParameter("E02DLMCDE"));
			} catch (Exception e) { 
				msg.setE02DLMCDE(userPO.getHeader1());
			}

			try {
				userPO.setHeader1(msg.getE02DLMCDE());
			} catch (Exception e) { }
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDL0551_main_prov_adi_enter.jsp", req, res);
			} else {
			
			
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("H02FLGMAS");
			try {
				userPO.setHeader6(msg.getE02MONTOA());
				userPO.setHeader2(msg.getE02TOTMEP());
				userPO.setHeader3(msg.getE02TOTPPR());
				userPO.setHeader4(msg.getE02TOTPAC());
				userPO.setHeader5(msg.getE02TOTPTO());
			} catch (Exception e) { }
			


			try {
			} catch (Exception e) { }
			ses.setAttribute("userPO", userPO);
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
				forwardOnSuccess("EDL0551_main_prov_adi_enter.jsp", req, res);
			} else {
				ses.setAttribute("eDL0552List", list);
				forwardOnSuccess("EDL0551_search_sim_masiva_list_maint_consul.jsp", req, res);
			}
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}
    
}

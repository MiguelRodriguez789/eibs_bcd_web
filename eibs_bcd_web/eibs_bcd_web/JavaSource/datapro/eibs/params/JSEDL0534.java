package datapro.eibs.params;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL0534 extends JSEIBSServlet
{
    protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
		HttpSession session, int screen) throws ServletException, IOException 
    {
	switch (screen) 
	{
		// Requests List 
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
			procReqList_Formula(user, req, res, session);
			break;
		case 12 : // Request new Record
		case 13 : // Request Maintenance Record
			procActionRec_Formula(user, req, res, session, screen);
			break;
		case 14 : // Request approve list
			procActionMaint_Formula(user, req, res, session);
			break;

		case 19 : // Request Delete Record
			procReqDelete_Formula(user, req, res, session);
			break;

		
		default :
			forward(SuperServlet.devPage, req, res);
			break;
	}
    }
    
    protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses) throws ServletException, IOException 
    {
    
    	UserPos userPO = new UserPos();
    	MessageProcessor mp = null;
    	MessageRecord record = null;
    	ELEERRMessage error = null;
    	try 
    	{
    		mp = new MessageProcessor("EDL0534");
    		EDL053401Message msg = (EDL053401Message) mp.getMessageRecord("EDL053401");
    					
    		//Send Initial data
    		msg.setH01USERID(user.getH01USR());
    		msg.setH01PROGRM("EDL0534");
    		msg.setH01TIMSYS(getTimeStamp());
    		msg.setH01SCRCOD("01");
    		//0015 command to get a list
    		msg.setH01OPECOD("0015");
    
    		// Send Message	
    		mp.sendMessage(msg);
    	
    		//Receive Data H01FLGMAS contains a * 
    		
    		
    		//JBSortList list = new JBSortList();
    		
    		JBObjList lst =(JBObjList) mp.receiveMessageRecordList("H01FLGMAS");
    		
    	//	lst.initRow();
		//	while (lst.getNextRow()) {
		//		list.add((datapro.eibs.beans.EDL053401Message) lst.getRecord());
		//	}
    		
    	//	String[] sortFlds = { "E01TADCPY", "E01TADCPM", "E01TADIND", "E01TADDSC" };
    	//	list.setSortKey(sortFlds);
    	//	list.setSortOrder(JBSortList.DESCENDENTE);
    	//	list.sort();
    
    	//	JBObjList lista = new JBObjList();
    	//  int indexRow=0;
  		//  for (indexRow = list.getBaseIdx(); indexRow < list.getSize() && indexRow < list.getBaseIdx() + list.getDisplaySize(); indexRow++) { 
  		//	lista.add((datapro.eibs.beans.EDL053401Message) list.getData(indexRow));
  		//  }
    		
  		  	ses.setAttribute("userPO", userPO);
    	//	ses.setAttribute("edl0534List", lista);
    		ses.setAttribute("edl0534List", lst);    		
    		
    		if(mp.hasError(lst)) 
    		{
    			forward("Under_construction.jsp", req, res);				
    		} 
    		else 
    		{
    			forward("EDL0534_search_ind_list.jsp", req, res);
    		}
    		
    	} 
    	finally 
    	{
    		if (mp != null)
    			mp.close();
    	}
    }

    protected void procReqList_Formula(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
        
        	UserPos userPO = new UserPos();
        	MessageProcessor mp = null;
        	MessageRecord record = null;
        	ELEERRMessage error = null;
        	try 
        	{
        		mp = new MessageProcessor("EDL0534");

        		//

        		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

        		
    			JBObjList list2 = (JBObjList)ses.getAttribute("edl0534List");
    			
    			int index = 0;
    			EDL053401Message listMessage=null;
    			try {
    			index = Integer.parseInt(req.getParameter("ROW").trim());
    			listMessage = (EDL053401Message)list2.get(index);
    			}
    			catch (Exception e)
    			{
    			index = -1;	
    			}
        		//
        		
        		EDL053402Message msg = (EDL053402Message) mp.getMessageRecord("EDL053402");
        					
        		//Send Initial data
        		msg.setH02USERID(user.getH01USR());
        		msg.setH02PROGRM("EDL0534");
        		msg.setH02TIMSYS(getTimeStamp());
        		msg.setH02SCRCOD("01");
        		//0015 command to get a list
        		msg.setH02OPECOD("0015");
        
    			if (index!=-1)
    			{
        		msg.setE02INDCDE(listMessage.getE01CNICDE());
    			msg.setD02INDCDE(listMessage.getD01CNICDE());
    			userPO.setHeader21(listMessage.getE01CNICDE());
    			userPO.setHeader22(listMessage.getD01CNICDE());
    			} else
    			{
            		msg.setE02INDCDE(userPO.getHeader21());
        			msg.setD02INDCDE(userPO.getHeader21());
    			}		
    			
        		// Send Message	
        		mp.sendMessage(msg);
        	
        		//Receive Data H01FLGMAS contains a * 
        		
        		
        	//	JBSortList list = new JBSortList();
        		
        		JBObjList lst =(JBObjList) mp.receiveMessageRecordList("H02FLGMAS");
        		
        	//	lst.initRow();
    		//	while (lst.getNextRow()) {
    		//		list.add((datapro.eibs.beans.EDL053402Message) lst.getRecord());
    		//	}
        		
        	//	String[] sortFlds = { "E01TADCPY", "E01TADCPM", "E01TADIND", "E01TADDSC" };
        	//	list.setSortKey(sortFlds);
        	//	list.setSortOrder(JBSortList.DESCENDENTE);
        	//	list.sort();
        
        	//	JBObjList lista = new JBObjList();
        	 // int indexRow=0;
      		//  for (indexRow = list.getBaseIdx(); indexRow < list.getSize() && indexRow < list.getBaseIdx() + list.getDisplaySize(); indexRow++) { 
      		//	lista.add((datapro.eibs.beans.EDL053402Message) list.getData(indexRow));
      		//  }
        		
      		  	ses.setAttribute("userPO", userPO);
        	//	ses.setAttribute("edl0534List", lista);
      			ses.setAttribute("edl0534List", lst);
        		if(mp.hasError(lst)) 
        		{
        			forward("Under_construction.jsp", req, res);				
        		} 
        		else 
        		{
        			forward("EDL0534_search_ind_list_formula.jsp", req, res);
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
    		mp = new MessageProcessor("EDL0534");
    		EDL053401Message msg = (EDL053401Message) mp.getMessageRecord("EDL053401");
    		
    		//Send Initial data
    		msg.setH01USERID(user.getH01USR());
    		msg.setH01PROGRM("EDL0534");
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
    				JBObjList list =(JBObjList)ses.getAttribute("edl0534List");
    				msg = (EDL053401Message)list.get(Integer.parseInt(req.getParameter("ROW")));
    				ses.setAttribute("msg", msg);
    				forward("EDL0534_ind_detail.jsp", req, res);
    			}
    			catch (Exception e)
    			{
    				ses.setAttribute("error", newmessage);
    				forward("EDL0534_search_ind_list.jsp", req, res);
    			} 
    		}
    		else
    		{
    			EDL053401Message record = new EDL053401Message();
    			ses.setAttribute("msg", record);
    			forward("EDL0534_ind_detail.jsp", req, res);				
    		}
    		
    		ses.setAttribute("userPO", userPO);
    	}
    	finally 
    	{
    	    if (mp != null) 
    		mp.close();
    	}
        }

    protected void procActionRec_Formula(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
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
    		mp = new MessageProcessor("EDL0534");
    		EDL053402Message msg = (EDL053402Message) mp.getMessageRecord("EDL053402");
    		
    		//Send Initial data
    		msg.setH02USERID(user.getH01USR());
    		msg.setH02PROGRM("EDL0534");
    		msg.setH02TIMSYS(getTimeStamp());
    		msg.setH02SCRCOD("01");
    		msg.setH02OPECOD("1000");
    		
    		switch (screen) 
    		{
    			case 12 : // Request new Record
    				userPO.setPurpose("NEW");
    				break;
    			case 13 : // Request old Record
    				userPO.setPurpose("MAINT");
    				break;
    		}
    		if(screen != 12)
    		{
    			//Get List from session and get the specific row from the list
    			try
    			{
    				JBObjList list =(JBObjList)ses.getAttribute("edl0534List");
    				msg = (EDL053402Message)list.get(Integer.parseInt(req.getParameter("ROW")));
    				ses.setAttribute("msg", msg);
    				ses.setAttribute("userPO", userPO);
    				forward("EDL0534_ind_detail_formula.jsp", req, res);
    			}
    			catch (Exception e)
    			{
    				ses.setAttribute("userPO", userPO);
    				ses.setAttribute("error", newmessage);
    				forward("EDL0534_search_ind_list_formula.jsp", req, res);
    			} 
    		}
    		else
    		{
    			EDL053402Message record = new EDL053402Message();
    			
    			// recuperar codigo y descripcion
    			
    			
    			record.setE02INDCDE(userPO.getHeader21());
    			record.setD02INDCDE(userPO.getHeader22());
    			
    			ses.setAttribute("msg", record);
    			ses.setAttribute("userPO", userPO);
    			forward("EDL0534_ind_detail_formula.jsp", req, res);				
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
			mp = getMessageProcessor("EDL053401", req);
				
			JBObjList list = (JBObjList)session.getAttribute("edl0534List");
			int index = Integer.parseInt(req.getParameter("ROW").trim());
			
			EDL053401Message listMessage = (EDL053401Message)list.get(index);
			
			EDL053401Message msgList = (EDL053401Message) mp.getMessageRecord("EDL053401");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL053401");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0009");
			
			//
			
			msgList.setE01CNICDE(listMessage.getE01CNICDE());

			//
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0534_search_ind_list.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
		
	}

    private void procReqDelete_Formula(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
		throws IOException, ClassCastException, ServletException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL053402", req);
				
			JBObjList list = (JBObjList)session.getAttribute("edl0534List");
			int index = Integer.parseInt(req.getParameter("ROW").trim());
			
			EDL053402Message listMessage = (EDL053402Message)list.get(index);
			
			EDL053402Message msgList = (EDL053402Message) mp.getMessageRecord("EDL053402");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL053402");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02SCRCOD("01");
			msgList.setH02OPECOD("0009");
			
			//
			
			msgList.setE02INDCDE(listMessage.getE02INDCDE());
			msgList.setE02INDSEQ(listMessage.getE02INDSEQ());

			//
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0534_search_ind_list_formula.jsp", req, res);
			} else {
				procReqList_Formula(user, req, res, session);
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
			mp = getMessageProcessor("EDL0534", req);
			String opeCode= "NEW".equals(userPO.getPurpose())?"0001":"0000";
			EDL053401Message msg = (EDL053401Message) mp.getMessageRecord("EDL053401", user.getH01USR(),opeCode );
			setMessageRecord(req, msg);
			msg.setH01SCRCOD("01");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL053401Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			//userPO.setPurpose("MAINTENANCE");
			//userPO.setOption("PR");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0534_ind_detail.jsp";
				forward(PageToCall, req, res);
			} else {
				PageToCall = "EDL0534_search_ind_list.jsp";
				procReqList(user, req, res, ses);
			}
			//forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
        }
    protected void procActionMaint_Formula(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
		UserPos userPO = (UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0534", req);
			String opeCode= "NEW".equals(userPO.getPurpose())?"0001":"0000";
			EDL053402Message msg = (EDL053402Message) mp.getMessageRecord("EDL053402", user.getH01USR(),opeCode );
			setMessageRecord(req, msg);
			msg.setH02SCRCOD("01");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL053402Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			//userPO.setPurpose("MAINTENANCE");
			//userPO.setOption("PR");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0534_ind_detail_formula.jsp";
				forward(PageToCall, req, res);
			} else {
				PageToCall = "EDL0534_search_ind_list_formula.jsp";
				procReqList_Formula(user, req, res, ses);
			}
			//forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
        }
    
    
}

package datapro.eibs.params;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL0536 extends JSEIBSServlet
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
    		mp = new MessageProcessor("EDL0536");
    		EDL053601Message msg = (EDL053601Message) mp.getMessageRecord("EDL053601");
    					
    		//Send Initial data
    		msg.setH01USERID(user.getH01USR());
    		msg.setH01PROGRM("EDL0536");
    		msg.setH01TIMSYS(getTimeStamp());
    		msg.setH01SCRCOD("01");
    		//0015 command to get a list
    		msg.setH01OPECOD("0015");
    
    		// Send Message	
    		mp.sendMessage(msg);
    	
    		//Receive Data H01FLGMAS contains a * 
    		
    		
    		JBSortList list = new JBSortList();
    		
    		JBObjList lst =(JBObjList) mp.receiveMessageRecordList("H01FLGMAS");
    		
    		lst.initRow();
			while (lst.getNextRow()) {
				list.add((datapro.eibs.beans.EDL053601Message) lst.getRecord());
			}
    		
    	//	String[] sortFlds = { "E01TADCPY", "E01TADCPM", "E01TADIND", "E01TADDSC" };
    	//	list.setSortKey(sortFlds);
    	//	list.setSortOrder(JBSortList.DESCENDENTE);
    	//	list.sort();
    
    		JBObjList lista = new JBObjList();
    	  int indexRow=0;
  		  for (indexRow = list.getBaseIdx(); indexRow < list.getSize() && indexRow < list.getBaseIdx() + list.getDisplaySize(); indexRow++) { 
  			lista.add((datapro.eibs.beans.EDL053601Message) list.getData(indexRow));
  		  }
    		
  		  	ses.setAttribute("userPO", userPO);
    		ses.setAttribute("edl0536List", lista);
    		
    		if(mp.hasError(lst)) 
    		{
    			forward("Under_construction.jsp", req, res);				
    		} 
    		else 
    		{
    			forward("EDL0536_search_ind_list.jsp", req, res);
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
        		mp = new MessageProcessor("EDL0536");

        		//

        		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

        		
    			JBObjList list2 = (JBObjList)ses.getAttribute("edl0536List");
    			
    			int index = 0;
    			EDL053601Message listMessage=null;
    			try {
    			index = Integer.parseInt(req.getParameter("ROW").trim());
    			listMessage = (EDL053601Message)list2.get(index);
    			}
    			catch (Exception e)
    			{
    			index = -1;	
    			}
        		//
        		
        		EDL053602Message msg = (EDL053602Message) mp.getMessageRecord("EDL053602");
        					
        		//Send Initial data
        		msg.setH02USERID(user.getH01USR());
        		msg.setH02PROGRM("EDL0536");
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
        		
        		
        		JBSortList list = new JBSortList();
        		
        		JBObjList lst =(JBObjList) mp.receiveMessageRecordList("H02FLGMAS");
        		
        		lst.initRow();
    			while (lst.getNextRow()) {
    				list.add((datapro.eibs.beans.EDL053602Message) lst.getRecord());
    			}
        		
        	//	String[] sortFlds = { "E01TADCPY", "E01TADCPM", "E01TADIND", "E01TADDSC" };
        	//	list.setSortKey(sortFlds);
        	//	list.setSortOrder(JBSortList.DESCENDENTE);
        	//	list.sort();
        
        		JBObjList lista = new JBObjList();
        	  int indexRow=0;
      		  for (indexRow = list.getBaseIdx(); indexRow < list.getSize() && indexRow < list.getBaseIdx() + list.getDisplaySize(); indexRow++) { 
      			lista.add((datapro.eibs.beans.EDL053602Message) list.getData(indexRow));
      		  }
        		
      		  	ses.setAttribute("userPO", userPO);
        		ses.setAttribute("edl0536List", lista);
        		
        		if(mp.hasError(lst)) 
        		{
        			forward("Under_construction.jsp", req, res);				
        		} 
        		else 
        		{
        			forward("EDL0536_search_ind_list_formula.jsp", req, res);
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
    		mp = new MessageProcessor("EDL0536");
    		EDL053601Message msg = (EDL053601Message) mp.getMessageRecord("EDL053601");
    		
    		//Send Initial data
    		msg.setH01USERID(user.getH01USR());
    		msg.setH01PROGRM("EDL0536");
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
    				JBObjList list =(JBObjList)ses.getAttribute("edl0536List");
    				msg = (EDL053601Message)list.get(Integer.parseInt(req.getParameter("ROW")));
    				ses.setAttribute("msg", msg);
    				forward("EDL0536_ind_detail.jsp", req, res);
    			}
    			catch (Exception e)
    			{
    				ses.setAttribute("error", newmessage);
    				forward("EDL0536_search_ind_list.jsp", req, res);
    			} 
    		}
    		else
    		{
    			EDL053601Message record = new EDL053601Message();
    			ses.setAttribute("msg", record);
    			forward("EDL0536_ind_detail.jsp", req, res);				
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
    		mp = new MessageProcessor("EDL0536");
    		EDL053602Message msg = (EDL053602Message) mp.getMessageRecord("EDL053602");
    		
    		//Send Initial data
    		msg.setH02USERID(user.getH01USR());
    		msg.setH02PROGRM("EDL0536");
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
    				JBObjList list =(JBObjList)ses.getAttribute("edl0536List");
    				msg = (EDL053602Message)list.get(Integer.parseInt(req.getParameter("ROW")));
    				ses.setAttribute("msg", msg);
    				ses.setAttribute("userPO", userPO);
    				forward("EDL0536_ind_detail_formula.jsp", req, res);
    			}
    			catch (Exception e)
    			{
    				ses.setAttribute("userPO", userPO);
    				ses.setAttribute("error", newmessage);
    				forward("EDL0536_search_ind_list_formula.jsp", req, res);
    			} 
    		}
    		else
    		{
    			EDL053602Message record = new EDL053602Message();
    			
    			// recuperar codigo y descripcion
    			
    			
    			record.setE02INDCDE(userPO.getHeader21());
    			record.setD02INDCDE(userPO.getHeader22());
    			
    			ses.setAttribute("msg", record);
    			ses.setAttribute("userPO", userPO);
    			forward("EDL0536_ind_detail_formula.jsp", req, res);				
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
			mp = getMessageProcessor("EDL053601", req);
				
			JBObjList list = (JBObjList)session.getAttribute("edl0536List");
			int index = Integer.parseInt(req.getParameter("ROW").trim());
			
			EDL053601Message listMessage = (EDL053601Message)list.get(index);
			
			EDL053601Message msgList = (EDL053601Message) mp.getMessageRecord("EDL053601");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL053601");
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
				forward("EDL0536_search_ind_list.jsp", req, res);
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
			mp = getMessageProcessor("EDL053602", req);
				
			JBObjList list = (JBObjList)session.getAttribute("edl0536List");
			int index = Integer.parseInt(req.getParameter("ROW").trim());
			
			EDL053602Message listMessage = (EDL053602Message)list.get(index);
			
			EDL053602Message msgList = (EDL053602Message) mp.getMessageRecord("EDL053602");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL053602");
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
				forward("EDL0536_search_ind_list_formula.jsp", req, res);
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
			mp = getMessageProcessor("EDL0536", req);
			String opeCode= "NEW".equals(userPO.getPurpose())?"0001":"0000";
			EDL053601Message msg = (EDL053601Message) mp.getMessageRecord("EDL053601", user.getH01USR(),opeCode );
			setMessageRecord(req, msg);
			msg.setH01SCRCOD("01");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL053601Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			//userPO.setPurpose("MAINTENANCE");
			//userPO.setOption("PR");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0536_ind_detail.jsp";
				forward(PageToCall, req, res);
			} else {
				PageToCall = "EDL0536_search_ind_list.jsp";
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
			mp = getMessageProcessor("EDL0536", req);
			String opeCode= "NEW".equals(userPO.getPurpose())?"0001":"0000";
			EDL053602Message msg = (EDL053602Message) mp.getMessageRecord("EDL053602", user.getH01USR(),opeCode );
			setMessageRecord(req, msg);
			msg.setH02SCRCOD("01");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL053602Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			//userPO.setPurpose("MAINTENANCE");
			//userPO.setOption("PR");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0536_ind_detail_formula.jsp";
				forward(PageToCall, req, res);
			} else {
				PageToCall = "EDL0536_search_ind_list_formula.jsp";
				procReqList_Formula(user, req, res, ses);
			}
			//forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
        }
    
    
}

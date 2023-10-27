package datapro.eibs.params;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL0528 extends JSEIBSServlet
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

		
		case 5 : // Request submit approve 	
			//procSubApp(user, req, res, session, screen);
			break;
		case 6 : // Request submit reject	
			//procSubRej(user, req, res, session, screen);
			break;
		case 7 : // Request submit delete	
			//procSubDel(user, req, res, session, screen);
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
    		mp = new MessageProcessor("EDL0528");
    		EDL052801Message msg = (EDL052801Message) mp.getMessageRecord("EDL052801");
    					
    		//Send Initial data
    		msg.setH01USERID(user.getH01USR());
    		msg.setH01PROGRM("EDL0528");
    		msg.setH01TIMSYS(getTimeStamp());
    		msg.setH01SCRCOD("01");
    		//0015 command to get a list
    		msg.setH01OPECOD("0015");
    
    		// Send Message	
    		mp.sendMessage(msg);
    	
    		//Receive Data H01FLGMAS contains a * 
    		
    		
    		JBSortList list = new JBSortList();
    		
    		JBObjList lst =(JBObjList) mp.receiveMessageRecordList("E01TADOPE");
    		
    		lst.initRow();
			while (lst.getNextRow()) {
				list.add((datapro.eibs.beans.EDL052801Message) lst.getRecord());
			}
    		
    		String[] sortFlds = { "E01TADCPY", "E01TADCPM", "E01TADIND", "E01TADDSC" };
    		list.setSortKey(sortFlds);
    		list.setSortOrder(JBSortList.DESCENDENTE);
    		list.sort();
    
    		JBObjList lista = new JBObjList();
    	  int indexRow=0;
  		  for (indexRow = list.getBaseIdx(); indexRow < list.getSize() && indexRow < list.getBaseIdx() + list.getDisplaySize(); indexRow++) { 
  			lista.add((datapro.eibs.beans.EDL052801Message) list.getData(indexRow));
  		  }
    		
  		  	ses.setAttribute("userPO", userPO);
    		ses.setAttribute("edl0528List", lista);
    		
    		if(mp.hasError(lst)) 
    		{
    			forward("Under_construction.jsp", req, res);				
    		} 
    		else 
    		{
    			forward("EDL0528_search_ind_list.jsp", req, res);
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
    		mp = new MessageProcessor("EDL0528");
    		EDL052801Message msg = (EDL052801Message) mp.getMessageRecord("EDL052801");
    		
    		//Send Initial data
    		msg.setH01USERID(user.getH01USR());
    		msg.setH01PROGRM("EDL0528");
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
    				JBObjList list =(JBObjList)ses.getAttribute("edl0528List");
    				msg = (EDL052801Message)list.get(Integer.parseInt(req.getParameter("ROW")));
    				ses.setAttribute("msg", msg);
    				forward("EDL0528_ind_detail.jsp", req, res);
    			}
    			catch (Exception e)
    			{
    				ses.setAttribute("error", newmessage);
    				forward("EDL0528_search_ind_list.jsp", req, res);
    			} 
    		}
    		else
    		{
    			EDL052801Message record = new EDL052801Message();
    			ses.setAttribute("msg", record);
    			forward("EDL0528_ind_detail.jsp", req, res);				
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
			mp = getMessageProcessor("EDL052801", req);
				
			JBObjList list = (JBObjList)session.getAttribute("edl0528List");
			int index = Integer.parseInt(req.getParameter("ROW").trim());
			
			EDL052801Message listMessage = (EDL052801Message)list.get(index);
			
			EDL052801Message msgList = (EDL052801Message) mp.getMessageRecord("EDL052801");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL052401");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0009");
			
			//
			
			msgList.setE01TADIND(listMessage.getE01TADIND());
			msgList.setE01TADCPY(listMessage.getE01TADCPY());
			msgList.setE01TADCPM(listMessage.getE01TADCPM());

			//
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0528_search_ind_list.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
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
			mp = getMessageProcessor("EDL0528", req);
			String opeCode= "NEW".equals(userPO.getPurpose())?"0001":"0000";
			EDL052801Message msg = (EDL052801Message) mp.getMessageRecord("EDL052801", user.getH01USR(),opeCode );
			setMessageRecord(req, msg);
			msg.setH01SCRCOD("01");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL052801Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			//userPO.setPurpose("MAINTENANCE");
			//userPO.setOption("PR");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0528_ind_detail.jsp";
				forward(PageToCall, req, res);
			} else {
				PageToCall = "EDL0528_search_ind_list.jsp";
				procReqList(user, req, res, ses);
			}
			//forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
        }
    
    protected void procAppList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses) throws ServletException, IOException 
{

	UserPos userPO = null;
	MessageProcessor mp = null;
	MessageRecord record = null;
	ELEERRMessage error = null;
	try 
	{
		mp = new MessageProcessor("EDL1528");
		//EDL152801Message msg = (EDL152801Message) mp.getMessageRecord("EDL152801");
					
		//Send Initial data
		//msg.setH01USERID(user.getH01USR());
		//msg.setH01PROGRM("EDL1528");
		//msg.setH01TIMSYS(getTimeStamp());
		//msg.setH01SCRCOD("01");
		//0015 command to get a list
		//msg.setH01OPECOD("0015");

		// Send Message	
		//mp.sendMessage(msg);
	
		//Receive Data H01FLGMAS contains a * 
		JBObjList list =(JBObjList) mp.receiveMessageRecordList("H01FLGMAS");

		ses.setAttribute("edl1528AppList", list);
		
		if(mp.hasError(list)) 
		{
			forward("Under_construction.jsp", req, res);				
		} 
		else 
		{
			forward("EDL0528_app_ind_list.jsp", req, res);
		}
		
	} 
	finally 
	{
		if (mp != null)
			mp.close();
	}
}
    
}

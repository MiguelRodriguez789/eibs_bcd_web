package datapro.eibs.params;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL0529 extends JSEIBSServlet
{
    protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
		HttpSession session, int screen) throws ServletException, IOException 
    {
	switch (screen) 
	{
		// Requests List 
		case 1 : // Request Maintenance Record
			procActionRec(user, req, res, session, screen);
			break;
		case 2 : // Request approve list
			procActionMaint(user, req, res, session);
			break;
		default :
			forward(SuperServlet.devPage, req, res);
			break;
	}
    }
  /*  
    protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses) throws ServletException, IOException 
    {
    
    	UserPos userPO = new UserPos();
    	MessageProcessor mp = null;
    	MessageRecord record = null;
    	ELEERRMessage error = null;
    	try 
    	{
    		mp = new MessageProcessor("EDL0529");
    		EDL052901Message msg = (EDL052901Message) mp.getMessageRecord("EDL052901");
    					
    		//Send Initial data
    		msg.setH01USERID(user.getH01USR());
    		msg.setH01PROGRM("EDL0529");
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
				list.add((datapro.eibs.beans.EDL052901Message) lst.getRecord());
			}
    		
    		String[] sortFlds = { "E01TADCPY", "E01TADCPM", "E01TADIND", "E01TADDSC" };
    		list.setSortKey(sortFlds);
    		list.setSortOrder(JBSortList.DESCENDENTE);
    		list.sort();
    
    		JBObjList lista = new JBObjList();
    	  int indexRow=0;
  		  for (indexRow = list.getBaseIdx(); indexRow < list.getSize() && indexRow < list.getBaseIdx() + list.getDisplaySize(); indexRow++) { 
  			lista.add((datapro.eibs.beans.EDL052901Message) list.getData(indexRow));
  		  }
    		
  		  	ses.setAttribute("userPO", userPO);
    		ses.setAttribute("EDL0529List", lista);
    		
    		if(mp.hasError(lst)) 
    		{
    			forward("Under_construction.jsp", req, res);				
    		} 
    		else 
    		{
    			forward("EDL0529_search_ind_list.jsp", req, res);
    		}
    		
    	} 
    	finally 
    	{
    		if (mp != null)
    			mp.close();
    	}
    }*/
    
    protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses, int screen) throws ServletException, IOException 
        {
    	
    	UserPos userPO = null;
    	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
    	userPO.setPurpose("MAINTENANCE");
		ses.setAttribute("userPO", userPO);
    	forward("EDL0529_det_met.jsp", req, res);				
   		
        }
    
    protected void procActionMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
		UserPos userPO = (UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0529", req);
			EDL052901Message msg = (EDL052901Message) mp.getMessageRecord("EDL052901", user.getH01USR(), "0001");
			setMessageRecord(req, msg);
			msg.setH02SCRCOD("01");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL052901Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			userPO.setPurpose("MAINTENANCE");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			 
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0529_det_met.jsp";
			} else {
				PageToCall = "EDL0529_det_met.jsp";
			}
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
        }
    
  /*  protected void procAppList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
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
			forward("EDL0529_app_ind_list.jsp", req, res);
		}
		
	} 
	finally 
	{
		if (mp != null)
			mp.close();
	}
}*/
    
}

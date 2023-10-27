package datapro.eibs.params;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL1529 extends JSEIBSServlet
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
		case 2 : // 
			procActionMaint(user, req, res, session);
			break;
		default :
			forward(SuperServlet.devPage, req, res);
			break;
	}
    }
 
    protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses, int screen) throws ServletException, IOException 
        {
    	
    	UserPos userPO = null;
    	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
    	userPO.setPurpose("MAINTENANCE");
		ses.setAttribute("userPO", userPO);
    	forward("EDL1529_chg_met.jsp", req, res);				
   		
        }
    
    protected void procActionMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
		UserPos userPO = (UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL1529", req);
			EDL152901Message msg = (EDL152901Message) mp.getMessageRecord("EDL152901", user.getH01USR(), "0001");
			setMessageRecord(req, msg);
			msg.setH02SCRCOD("01");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL152901Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			userPO.setPurpose("MAINTENANCE");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL1529_chg_met.jsp";
			} else {
				PageToCall = "EDL1529_chg_met.jsp";
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

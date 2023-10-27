package datapro.eibs.params;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL0525 extends JSEIBSServlet
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
				case 4 : // Request Inquiry Record	
					procSubmitRec(user, req, res, session, screen);
					break;
				case 9 : // Request Delete Record	
					procActionRecDel(user, req, res, session, screen);
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
		
	}
	
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses) throws ServletException, IOException 
	{

		UserPos userPO = null;
		MessageProcessor mp = null;
		MessageRecord record = null;
		ELEERRMessage error = null;
		try 
		{
			mp = new MessageProcessor("EDL0525");
			EDL052501Message msg = (EDL052501Message) mp.getMessageRecord("EDL052501");
						
			//Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0525");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			//0015 command to get a list
			msg.setH01OPECOD("0015");

			// Send Message	
			mp.sendMessage(msg);
		
			//Receive Data H01FLGMAS contains a * 
			JBObjList list =(JBObjList) mp.receiveMessageRecordList("H01FLGMAS");

			ses.setAttribute("EDL0525List", list);
			
			if(mp.hasError(list)) 
			{
				forward("Under_construction.jsp", req, res);				
			} 
			else 
			{
				forward("EDL0525_failure_rate_list.jsp", req, res);
			}
			
		} 
		finally 
		{
			if (mp != null)
				mp.close();
		}
	}
	
	/*
	SCREEN = 2,3
	Get new or old Record  
	*/
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
			mp = new MessageProcessor("EDL0525");
			EDL052501Message msg = (EDL052501Message) mp.getMessageRecord("EDL052501");
			
			//Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0525");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			
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
//				//Get List from session and get the specific row from the list
				try
				{
					JBObjList list =(JBObjList)ses.getAttribute("EDL0525List");
					msg = (EDL052501Message)list.get(Integer.parseInt(req.getParameter("ROW")));
					ses.setAttribute("EDL0525Record", msg);
					forward("EDL0525_failure_rate_table.jsp", req, res);
				}
				catch (Exception e)
				{
					ses.setAttribute("error", newmessage);
					forward("EDL0525_failure_rate_list.jsp", req, res);
				} 
			}
			else
			{
				EDL052501Message record = new EDL052501Message();
				ses.setAttribute("EDL0525Record", record);
				forward("EDL0525_failure_rate_table.jsp", req, res);				
			}
			
			ses.setAttribute("userPO", userPO);
        } 
		finally 
		{
			if (mp != null) 
				mp.close();
		}
	}
	
	//	 SCREEN = 4
	// 	Process the Record  
	//
	protected void procSubmitRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen) throws ServletException, IOException 
	{

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		boolean success = true;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try 
		{
			mp = new MessageProcessor("EDL0525");
			EDL052501Message msg = (EDL052501Message) mp.getMessageRecord("EDL052501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0525");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			if(userPO.getPurpose().equals("MAINT"))
			{
				//0005 operation code for maintenance
				msg.setH01OPECOD("0005");
			}
			else
			{
				//0001 operation code for new table
				msg.setH01OPECOD("0001");
			}
		
			// Get all fields in page
			try 
			{
				super.setMessageRecord(req, msg);
			} 
			catch (Exception e) {	}
					
			ses.setAttribute("EDL0525Record", msg);
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) 
			{
				ses.setAttribute("error", newmessage);
				ses.setAttribute("EDL0525Record", msg);
				success = false;				
			}
				
			newmessage = mp.receiveMessageRecord();
			if(newmessage.getFormatName().equals("EDL052501"))
			{
				ses.setAttribute("EDL0525Record", newmessage);	
			}
			
			if(success)
			{				
				//forward("EDL0525_failure_rate_list.jsp", req, res);
				//Retrieve the List with new values from the database
				procReqList(user, req, res, ses);
			}
			else
			{
				forward("EDL0525_failure_rate_table.jsp", req, res);
			}
	    } 
		finally
		{
			if (mp != null) 
				mp.close();
		}
	}
	//SCREEN = 9
	//Delete record  
	//aqui
	protected void procActionRecDel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen) throws ServletException, IOException 
	{

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		boolean success = true;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("DELETE");

		// Send data
		try 
		{
			mp = new MessageProcessor("EDL0525");
			EDL052501Message msg = (EDL052501Message) mp.getMessageRecord("EDL052501");
			
		
			
//				//Get List from session and get the specific row from the list
				try
				{
					JBObjList list =(JBObjList)ses.getAttribute("EDL0525List");
					msg = (EDL052501Message)list.get(Integer.parseInt(req.getParameter("ROW")));
					//Send Initial data
					msg.setH01USERID(user.getH01USR());
					msg.setH01PROGRM("EDL0525");
					msg.setH01TIMSYS(getTimeStamp());
					msg.setH01SCRCOD("01");
					msg.setH01OPECOD("0009");
					
					ses.setAttribute("EDL0525Record", msg);
					//forward("EDL0525_failure_rate_table.jsp", req, res);
					mp.sendMessage(msg);
					ses.setAttribute("userPO", userPO);
					// Receive Error Message or Data Message (Optional)
				
					newmessage = mp.receiveMessageRecord();
					if (mp.hasError(newmessage)) 
					{
						ses.setAttribute("error", newmessage);
						ses.setAttribute("EDL0525Record", msg);
						success = false;				
					}
						
					//newmessage = mp.receiveMessageRecord();
					if(newmessage.getFormatName().equals("EDL052501"))
					{
						ses.setAttribute("EDL0525Record", newmessage);	
					}
					
					if(success)
					{				
						//forward("EDL0525_failure_rate_list.jsp", req, res);
						//Retrieve the List with new values from the database
						procReqList(user, req, res, ses);
					}
					else
					{
						forward("EDL0525_failure_rate_table.jsp", req, res);
					}
					
					
					
				}
				catch (Exception e)
				{
					ses.setAttribute("error", newmessage);
					forward("EDL0525_failure_rate_list.jsp", req, res);
				} 
			
			
			ses.setAttribute("userPO", userPO);
        } 
		finally 
		{
			if (mp != null) 
				mp.close();
		}
	}
	
}

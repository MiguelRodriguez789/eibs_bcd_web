package datapro.eibs.params;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL0524 extends JSEIBSServlet
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
				case 2 : // Create new Record 
				case 3 : // Modify Record
					procActionRec(user, req, res, session, screen);
					break;
				case 4 : // Request Inquiry Record	
					procSubmitRec(user, req, res, session, screen);
					break;
				case 9 : // Request Delete Record
					procReqDelete(user, req, res, session);
					break;					
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
		
	}
	
    //	 SCREEN = 1 
	// Send List of ACH Operators  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses) throws ServletException, IOException 
	{

		MessageProcessor mp = null;
		MessageRecord record = null;
		ELEERRMessage error = null;
		
		try 
		{
			mp = new MessageProcessor("EDL0524");
			EDL052401Message msg = (EDL052401Message) mp.getMessageRecord("EDL052401");
			
			//Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0524");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0015");

			// Send Message	
			mp.sendMessage(msg);
		
			//Receive Data
			JBObjList list =(JBObjList) mp.receiveMessageRecordList("H01FLGMAS");

			if(mp.hasError(list)) 
			{
				forward("Under_construction.jsp", req, res);				
			} 
			else 
			{
				ses.setAttribute("EDL0524List", list);
				forward("EDL0524_failure_probability_tables_list.jsp", req, res);
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
			mp = new MessageProcessor("EDL0524");
			EDL052401Message msg = (EDL052401Message) mp.getMessageRecord("EDL052401");
			
			//Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0524");
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
				//Get List from session and get the specific row from the list
				try
				{
					JBObjList list =(JBObjList)ses.getAttribute("EDL0524List");
					msg = (EDL052401Message)list.get(Integer.parseInt(req.getParameter("ROW")));
					ses.setAttribute("EDL0524Record", msg);
					forward("EDL0524_failure_probability_table.jsp", req, res);
				}
				catch (Exception e)
				{
					ses.setAttribute("error", newmessage);
					forward("EDL0524_failure_probability_tables_list.jsp", req, res);
				} 
			}
			else
			{
				EDL052401Message record = new EDL052401Message();
				ses.setAttribute("EDL0524Record", record);
				forward("EDL0524_failure_probability_table.jsp", req, res);				
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
			mp = getMessageProcessor("EDL052401", req);
				
			JBObjList list = (JBObjList)session.getAttribute("EDL0524List");
			int index = Integer.parseInt(req.getParameter("ROW").trim());
			
			EDL052401Message listMessage = (EDL052401Message)list.get(index);
			
			EDL052401Message msgList = (EDL052401Message) mp.getMessageRecord("EDL052401");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL052401");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setE01CPITES(listMessage.getE01CPITES());
			msgList.setE01CPIMAT(listMessage.getE01CPIMAT());
			msgList.setE01CPICAL(listMessage.getE01CPICAL());

			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0524_failure_probability_tables_list.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}
			
		} finally {
			if (mp != null)	mp.close();
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
			mp = new MessageProcessor("EDL0524");
			EDL052401Message msg = (EDL052401Message) mp.getMessageRecord("EDL052401");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0524");
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
					
			ses.setAttribute("EDL0524Record", msg);
			// Send Message 
			mp.sendMessage(msg);
			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) 
			{
				ses.setAttribute("error", newmessage);
				ses.setAttribute("EDL0524Record", msg);
				success = false;				
			}
				
			newmessage = mp.receiveMessageRecord();
			if(newmessage.getFormatName().equals("EDL052401"))
			{
				ses.setAttribute("EDL0524Record", newmessage);	
			}
			
			if(success)
			{				
				//forward("EDL0524_failure_probability_tables_list.jsp", req, res);
				//Retrieve the List with new values from the database
				procReqList(user, req, res, ses);
			}
			else
			{
				forward("EDL0524_failure_probability_table.jsp", req, res);
			}
		}
		finally
		{
			if (mp != null) 
				mp.close();
		}
	}
}

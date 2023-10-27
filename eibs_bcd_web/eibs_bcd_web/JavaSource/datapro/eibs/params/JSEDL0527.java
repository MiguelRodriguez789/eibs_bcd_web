package datapro.eibs.params;

import java.io.IOException;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import datapro.eibs.beans.EDL052701Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0527 extends JSEIBSServlet
{
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen) throws ServletException, IOException 
	{
		switch (screen) 
		{
			case 1 ://Search Customer
				procNewCust(user, req, res, session);
				break;
			case 2 : //Request a list with the customer accounts information 
				procReqList(user, req, res, session);
				break;
			case 3 : // Get a record from the list
				procActionRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}
	
	//Screen 1 
	protected void procNewCust(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses) throws ServletException, IOException 
	{
		MessageProcessor mp = null;
		MessageRecord record = null;
		ELEERRMessage error = null;
		UserPos userPO = null;
		
		try 
		{
			mp = new MessageProcessor("EDL0527");
			EDL052701Message msg = (EDL052701Message) mp.getMessageRecord("EDL052701");
			error = new ELEERRMessage();
			ses.setAttribute("userPO", userPO);
			
			forward("EDL0527_search_cust.jsp", req, res);
		} 
		finally 
		{
			if (mp != null)
				mp.close();
		}
		
	}
	
	public int compare2Objects(JBObjList list , EDL052701Message a , int j)
	{
		EDL052701Message b = (EDL052701Message)list.get(j-1);
		
		if(b.getE01CPVACC().compareTo(a.getE01CPVACC()) > 0)
		{
		  return 1;
		}
		//if the accounts numbers are equals then compare by year
		if( b.getE01CPVACC().equals(a.getE01CPVACC()) )
		{
			if( b.getE01CPVDTY().compareTo(a.getE01CPVDTY()) > 0)
			{
				return 1;
			}
			if( b.getE01CPVDTY().equals(a.getE01CPVDTY()))
			{
				//if years are equals then comparing by month
				if(Integer.parseInt(b.getE01CPVDTM()) > Integer.parseInt(a.getE01CPVDTM()) )
				{
					return 1;
		  		} 
				if(Integer.parseInt(b.getE01CPVDTM()) == Integer.parseInt(a.getE01CPVDTM()) )
				{
					return 0;
				}
		   	}	
		}
		return -1;
	}
	
	private void sortJBObjList(JBObjList list)
	{
		for (int i = 1; i < list.size(); i++)
		{
			int j = i;
			EDL052701Message temp = (EDL052701Message)list.get(i);
			 while ((j > 0) && (compare2Objects(list , temp , j) > 0))
			 {
				 list.set(j,list.get(j-1));
				 j--;
			 }
			 list.set(j,temp);
		}
	}
	
	// SCREEN = 2 
	// Send List of ACH Operators  
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses) throws ServletException, IOException 
	{

		UserPos userPO = null;
		MessageProcessor mp = null;
		MessageRecord record = null;
		ELEERRMessage error = null;
				
		try 
		{
			mp = new MessageProcessor("EDL0527");
			EDL052701Message msg = (EDL052701Message) mp.getMessageRecord("EDL052701");
			
			//Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0527");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0015");

			try {
				msg.setE01RECNUM(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01RECNUM("0"); 
			}
			
			//Get customer Number
			try 
			{
				msg.setE01CPVCUN(req.getParameter("E01CPVCUN"));
			} 
			catch (Exception e) 
			{
				msg.setE01CPVCUN("");
			}
			try {
				userPO.setHeader1(msg.getE01CPVCUN());
			} catch (Exception e) { }
			try 
			{
				msg.setE01AYOSOL(req.getParameter("E01AYOSOL"));
			} 
			catch (Exception e) 
			{
				msg.setE01AYOSOL("0");
			}
			try {
				userPO.setHeader2(msg.getE01AYOSOL());
			} catch (Exception e) { }
			//Get Month
			try 
			{
				msg.setE01MESSOL(req.getParameter("E01MESSOL"));
			} 
			catch (Exception e) 
			{
			}
			try {
				userPO.setHeader3(msg.getE01MESSOL());
			} catch (Exception e) { }
			// Send Message	
			mp.sendMessage(msg);
		
			//Receive Data
			JBObjList list =(JBObjList) mp.receiveMessageRecordList("H01FLGMAS","E01RECNUM");
			
			if(!list.getNoResult())
			{
				//Sorting the list by account number,year, and month
	          	sortJBObjList(list);
			}
          	
			ses.setAttribute("EDL0527List", list);
			
			if(mp.hasError(list)) 
			{
				forward("EDL0527_search_cust.jsp", req, res);				
			} 
			else 
			{
				forward("EDL0527_search_cust_acc_list.jsp", req, res);
			}
			
		} 
		finally 
		{
			if (mp != null)
				mp.close();
		}
	}
	
	/*
	SCREEN = 3
	Get record from list  
	*/
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen) throws ServletException, IOException 
	{
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		
		// Send data
		try 
		{
			mp = new MessageProcessor("EDL0527");
			EDL052701Message msg = (EDL052701Message) mp.getMessageRecord("EDL052701");
			
			//Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0527");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			//Get List from session and get the specific row from the list
			try
			{
				JBObjList list =(JBObjList)ses.getAttribute("EDL0527List");
				msg = (EDL052701Message)list.get(Integer.parseInt(req.getParameter("ROW")));
				ses.setAttribute("EDL0527Record", msg);
				forward("EDL0527_search_cust_acc_table.jsp", req, res);
			}
			catch (Exception e)
			{
				ses.setAttribute("error", newmessage);
				forward("EDL0527_search_cust_acc_list.jsp", req, res);
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

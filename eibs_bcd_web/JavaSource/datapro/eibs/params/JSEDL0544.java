package datapro.eibs.params;

import java.io.IOException;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import datapro.eibs.beans.EDL054401Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0544 extends JSEIBSServlet
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
			mp = new MessageProcessor("EDL0544");
			EDL054401Message msg = (EDL054401Message) mp.getMessageRecord("EDL054401");
			error = new ELEERRMessage();
			ses.setAttribute("userPO", userPO);
			
			forward("EDL0544_search_cust.jsp", req, res);
		} 
		finally 
		{
			if (mp != null)
				mp.close();
		}
		
	}
	
	public int compare2Objects(JBObjList list , EDL054401Message a , int j)
	{
		EDL054401Message b = (EDL054401Message)list.get(j-1);
		
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
			EDL054401Message temp = (EDL054401Message)list.get(i);
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
		MessageRecord newmessage = null;
				
		try 
		{
			mp = new MessageProcessor("EDL0544");
			EDL054401Message msg = (EDL054401Message) mp.getMessageRecord("EDL054401");
			
			//Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0544");
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
			//Get A�O
			try 
			{
				msg.setE01FECPRY(req.getParameter("E01FECPRY"));
			} 
			catch (Exception e) 
			{
				msg.setE01FECPRY("");
			}
			try {
				userPO.setHeader2(msg.getE01FECPRY());
			} catch (Exception e) { }
			//Get MES
			try 
			{
				msg.setE01FECPRM(req.getParameter("E01FECPRM"));
			} 
			catch (Exception e) 
			{
				msg.setE01FECPRM("");
			}
			try {
				userPO.setHeader3(msg.getE01FECPRM());
			} catch (Exception e) { }
			//Get DIA
			try 
			{
				msg.setE01FECPRD(req.getParameter("E01FECPRD"));
			} 
			catch (Exception e) 
			{
				msg.setE01FECPRD("");
			}
			try {
				userPO.setHeader4(msg.getE01FECPRD());
			} catch (Exception e) { }
			// Send Message	
			mp.sendMessage(msg);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDL0544_search_cust.jsp", req, res);	
			} else {
			//Receive Data
			JBObjList list =(JBObjList) mp.receiveMessageRecordList("H01FLGMAS","E01RECNUM");
			
			if(!list.getNoResult())
			{
				//Sorting the list by account number,year, and month
	          	//sortJBObjList(list);
			}
			
			ses.setAttribute("EDL0544List", list);
			
			if(mp.hasError(list)) 
			{
				forward("EDL0544_search_cust.jsp", req, res);				
			} 
			else 
			{
				forward("EDL0544_search_cust_acc_list.jsp", req, res);
			}
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
			mp = new MessageProcessor("EDL0544");
			EDL054401Message msg = (EDL054401Message) mp.getMessageRecord("EDL054401");
			
			//Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0544");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			//Get List from session and get the specific row from the list
			try
			{
				JBObjList list =(JBObjList)ses.getAttribute("EDL0544List");
				msg = (EDL054401Message)list.get(Integer.parseInt(req.getParameter("ROW")));
				ses.setAttribute("EDL0544Record", msg);
				forward("EDL0544_search_cust_acc_table.jsp", req, res);
			}
			catch (Exception e)
			{
				ses.setAttribute("error", newmessage);
				forward("EDL0544_search_cust_acc_list.jsp", req, res);
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

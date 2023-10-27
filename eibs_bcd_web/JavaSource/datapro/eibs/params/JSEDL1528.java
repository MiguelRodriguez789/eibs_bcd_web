package datapro.eibs.params;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL1528 extends JSEIBSServlet
{
    protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
		HttpSession session, int screen) throws ServletException, IOException 
    {
	switch (screen) 
	{
		// Requests List 
		case 1 :
			procAppList(user, req, res, session);
			break;
		case 2 : // Request submit approve 	
			procSubApp(user, req, res, session);
			break;
		case 3 : // Request submit reject	
			procSubRej(user, req, res, session);
			break;
		case 4 : // Request submit delete	
			procSubDel(user, req, res, session);
			break;
		default :
			forward(SuperServlet.devPage, req, res);
			break;
	}
    }
    
    protected void procSubApp(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
		UserPos userPO = (UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL1528", req);
			EDL152802Message msg = (EDL152802Message) mp.getMessageRecord("EDL152802", user.getH01USR(), "0001");
			setMessageRecord(req, msg);
			msg.setH02SCRCOD("01");
			msg.setE02ACTION("A");

			String[] key= req.getParameter("ROW").split("_");
			
			msg.setE02TADIND(key[0]); 
			msg.setE02TADCPY(key[1]); 
			msg.setE02TADCPM(key[2]);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
//			msg = (EDL152802Message) mp.receiveMessageRecord();
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			//ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL1528_app_ind_list.jsp";
				forward(PageToCall, req, res);
				//procAppList(user, req, res, ses);
			} else {
				procAppList(user, req, res, ses);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
        }
    
    protected void procSubDel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
		UserPos userPO = (UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL1528", req);
			EDL152802Message msg = (EDL152802Message) mp.getMessageRecord("EDL152802", user.getH01USR(), "0001");
			setMessageRecord(req, msg);
			msg.setH02SCRCOD("01");
			msg.setE02ACTION("D");

			String[] key= req.getParameter("ROW").split("_");
			
			msg.setE02TADIND(key[0]); 
			msg.setE02TADCPY(key[1]); 
			msg.setE02TADCPM(key[2]);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
//			msg = (EDL152802Message) mp.receiveMessageRecord();
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			//ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL1528_app_ind_list.jsp";
				forward(PageToCall, req, res);
				//procAppList(user, req, res, ses);
			} else {
				procAppList(user, req, res, ses);
			}
			
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
		EDL152801Message msg = (EDL152801Message) mp.getMessageRecord("EDL152801");
					
		//Send Initial data
		msg.setH01USERID(user.getH01USR());
		msg.setH01PROGRM("EDL1528");
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
			list.add((datapro.eibs.beans.EDL152801Message) lst.getRecord());
		}
		
		String[] sortFlds = { "E01TADCPY", "E01TADCPM", "E01TADIND", "E01TADDSC" };
		list.setSortKey(sortFlds);
		list.setSortOrder(JBSortList.DESCENDENTE);
		list.sort();

		JBObjList lista = new JBObjList();
	  int indexRow=0;
		  for (indexRow = list.getBaseIdx(); indexRow < list.getSize() && indexRow < list.getBaseIdx() + list.getDisplaySize(); indexRow++) { 
			lista.add((datapro.eibs.beans.EDL152801Message) list.getData(indexRow));
		  }

		ses.setAttribute("edl1528AppList", lista);
		
		if(mp.hasError(lst)) 
		{
			forward("Under_construction.jsp", req, res);				
		} 
		else 
		{
			forward("EDL1528_app_ind_list.jsp", req, res);
		}
		
	} 
	finally 
	{
		if (mp != null)
			mp.close();
	}
}
    
    protected void procSubRej(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
		UserPos userPO = (UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL1528", req);
			EDL152802Message msg = (EDL152802Message) mp.getMessageRecord("EDL152802", user.getH01USR(), "0001");
			setMessageRecord(req, msg);
			msg.setH02SCRCOD("01");
			msg.setE02ACTION("X");

			String[] key= req.getParameter("ROW").split("_");
			
			msg.setE02TADIND(key[0]); 
			msg.setE02TADCPY(key[1]); 
			msg.setE02TADCPM(key[2]);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
//			msg = (EDL152802Message) mp.receiveMessageRecord();
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			//ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL1528_app_ind_list.jsp";
				forward(PageToCall, req, res);
			} else {
				procAppList(user, req, res, ses);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
        }
    
}

package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;

public class JSESD0980 extends JSEIBSServlet
{
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
	HttpSession session, int screen) throws ServletException, IOException 
	{
		switch (screen) 
		{
			case 100:
				procActionReq(user, req, res, session);
				break;
			case 200:
				procXchgReq(user, req, res, session);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}
	
	protected void procActionReq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
	HttpSession ses) throws ServletException, IOException 
	{
	   	String pageToCall = "ESD0980_official_xchg.jsp";
		UserPos userPO = new UserPos();
		ses.setAttribute("userPO", userPO);
		
		ESD098001Message msg = new ESD098001Message();
		msg.setE01CHGCUS("X");
		msg.setE01CHGACM("X");
		msg.setE01CHGLCM("X");
		msg.setE01CHGDCM("X");
		msg.setE01CHGROC("X");
		msg.setE01CHGLNS("X");
		msg.setE01CHGDEP("X");
		msg.setE01CHGLNC("X");
		ses.setAttribute("msgXchg", msg);
		forward(pageToCall, req, res);
	}
	
	protected void procXchgReq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
	HttpSession ses) throws ServletException, IOException 
	{
		MessageProcessor mp = null;
		
		try 
		{
			mp = new MessageProcessor("ESD0980");
			ESD098001Message msg = (ESD098001Message) mp.getMessageRecord("ESD098001");
			//Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0980");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			setMessageRecord(req,msg);
			// Send Message	
			mp.sendMessage(msg);
		
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ESD098001Message) mp.receiveMessageRecord();

			ses.setAttribute("msgXchg", msg);
			
			if(mp.hasError(msgError)) 
			{
				ses.setAttribute("error", msgError);
				forward("ESD0980_official_xchg.jsp", req, res);				
			} 
			else 
			{
				forward("ESD0980_confi.jsp", req, res);
			}
			
		} 
		finally 
		{
			if (mp != null)
				mp.close();
		}
	}
}

package datapro.eibs.tools;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.beans.UserPos;
import datapro.eibs.beans.EDD081201Message;

public class JSEDD0812 extends JSEIBSServlet
{
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen) throws ServletException, IOException 
	{
			switch (screen) 
			{
				case 1:
				case 2:
					procSearchAcc(user, req, res, session,screen);
					break;
				case 3:
				case 4:
					procActReq(user, req, res, session,screen);
					break;
			
			}
	}
	
	protected void procSearchAcc(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
	HttpSession ses, int screen) throws ServletException, IOException 
	{
		UserPos userPO = getUserPos(ses);
		if(screen == 1)
		{
			userPO.setPurpose("MAINTENANCE");
		}
		if(screen == 2)
		{
			userPO.setPurpose("CONSULT");
		}
		ses.setAttribute("userPO", userPO);
		forward("EDD0812_search_acc.jsp", req, res);
	}
	
	protected void procActReq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
	HttpSession ses, int screen) throws ServletException, IOException 
	{
		UserPos userPO = getUserPos(ses);
		MessageProcessor mp = null;
		String PageToCall = "";
		String opeCod ="";
		
		if(screen == 3)
		{
			if(userPO.getPurpose().equals("MAINTENANCE"))
			{
				opeCod = "0001";
			}
			if(userPO.getPurpose().equals("CONSULT"))
			{
				opeCod = "0003";
			}
		}
		
		try 
		{
			String acc = req.getParameter("E01MDEACC")== null?"":req.getParameter("E01MDEACC");
			String sts = req.getParameter("E01MDESTS")== null?"":req.getParameter("E01MDESTS");
			mp = getMessageProcessor("EDD0812", req);
			EDD081201Message msg = (EDD081201Message) mp.getMessageRecord("EDD081201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDD0812");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setE01MDEACC(acc);
			if(screen==4)
			{
				opeCod = "0004";
				msg.setE01MDESTS(sts);
			}
			msg.setH01OPECOD(opeCod);
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDD081201Message) mp.receiveMessageRecord();
				
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msgDendoso", msg);
			ses.setAttribute("userPO", userPO);
				
			if (mp.hasError(msgError)) 
			{
				PageToCall = "EDD0812_search_acc.jsp";
			}
			else
			{
				if(screen==4)
				{
					PageToCall = "EDD0812_search_acc.jsp";
				}
				else
				{
					PageToCall = "EDD0812_double_endorsement_detail.jsp";
				}
			}
			forward(PageToCall, req, res);
				
		} 
		finally 
		{
			if (mp != null)	mp.close();
		}
		
	}
}

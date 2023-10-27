/* Double Master for Banesco */
package com.datapro.eibs.internet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generics.BeanList;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS210101Message;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

public class JSESS2101 extends SuperServlet {
	
    protected static final int R_LIST_STATUS    = 100;
    protected static final int R_ACTION         = 200;
    protected static final int R_PROCESS_STATUS = 300;
    protected String LangPath;
    
    public JSESS2101() {
        LangPath = "E";
    }

    public void destroy() {
        flexLog("free resources used by JSESS2000");
    }

    public void init(ServletConfig config)   throws ServletException  {
        super.init(config);
    }

    public void service(HttpServletRequest req, HttpServletResponse res)    throws ServletException, IOException   {
        MessageContext mc = null;
        ESS0030DSMessage msgUser = null;
        HttpSession session = null;
        session = req.getSession(false);
        if(session == null){
            try {
                res.setContentType("text/html");
                printLogInAgain(res.getWriter());
            } catch(Exception e) {
                e.printStackTrace();
                flexLog("Exception ocurred. Exception = " + e);
            }
        } else  {
            int screen = 0;
            try  {
                msgUser = (ESS0030DSMessage)session.getAttribute("currUser");
                LangPath = SuperServlet.rootPath + msgUser.getE01LAN() + "/";
                try  {
                    flexLog("Opennig Socket Connection");
                    mc = new MessageContext(super.getMessageHandler("ESS2101", req));
                    try
                    {
                        screen = Integer.parseInt(req.getParameter("SCREEN"));
                    }
                    catch(Exception e)
                    {
                        flexLog("Screen set to default value");
                    }
                    switch(screen)
                    {
                    case R_LIST_STATUS: 
						procListStatus(mc, msgUser, req, res, session);
                        break;
					
                    case R_ACTION: 
						procMaintenance(mc, msgUser, req, res, session);
                        break;
					
                    case R_PROCESS_STATUS:
						procExecute(mc, msgUser, req, res, session);
                        break;
					
                    default:
                        res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.devPage);
                        break;
                    }
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                    flexLog("Socket not Open(" + mc.toString() + "). Error: " + e);
                    res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.sckNotOpenPage);
                }
                finally
                {
                    mc.close();
                }
            }
            catch(Exception e)
            {
                flexLog("Error: " + e);
                res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.sckNotRespondPage);
            }
        }
    }
	/*
	 * List Status
	 */
	protected void procListStatus(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException   {
				
		MessageRecord newmessage = null;
		UserPos userPO = null;	
		ELEERRMessage msgError = null;
		ESS210101Message msg = new ESS210101Message();
		BeanList msgList = new BeanList();
		boolean IsNotError = false;
		boolean GoIn = false;
		
		try{
			msg = (ESS210101Message)mc.getMessageRecord("ESS210101");
			msg.setH01USR(user.getH01USR());
			msg.setH01PGM("ESS2101");
			msg.setH01OPE("0100");
			msg.setH01TIM(SuperServlet.getTimeStamp());
			msg.send();
			msg.destroy();
		}catch(Exception es){
			es.printStackTrace();
			flexLog("Error: " + es);
			throw new RuntimeException("Socket Communication Error Sending Data");
		}
		try{
			newmessage = mc.receiveMessage();
			if(newmessage.getFormatName().equals("ELEERR"))	{
				msgError = (ELEERRMessage)newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else	{
				flexLog("Error Message " + newmessage.getFormatName() + " received. Waiting Error");
			}
			newmessage = mc.receiveMessage();
			if(newmessage.getFormatName().equals("ESS210101"))	{
				msg = (ESS210101Message)newmessage;
				while(!msg.getH01MAS().equals("*")){
					msgList.addRow(msg);
					newmessage = mc.receiveMessage();
					msg = (ESS210101Message)newmessage;
				}
			}else{
				flexLog("Error Message " + newmessage.getFormatName() + " received. Waiting ESS210101");
			}
			
		}catch(Exception er){
			er.printStackTrace();
			flexLog("Error: " + er);
			throw new RuntimeException("Socket Communication Error Receiving Data");			
		}
		ses.setAttribute("CCRStatusList", msgList);
		callPage(LangPath + "ESS2101_status_list.jsp", req, res);
	}
    
    protected void procMaintenance(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
        throws ServletException, IOException   {
		
			ESS210101Message msg = new ESS210101Message();
			BeanList msgList = new BeanList();
			
			String ACTION = req.getParameter("ACTION");
			if(!ACTION.trim().equals("N")){
				String STSTUS = req.getParameter("STS");
				String ACCSTS = STSTUS.substring(0,STSTUS.indexOf("|"));
				String CCRSTS = STSTUS.substring(STSTUS.indexOf("|")+1);
				msgList = (BeanList) ses.getAttribute("CCRStatusList");
				msgList.initRow();
				while(msgList.getNextRow()){
					msg = (ESS210101Message) msgList.getRecord();
					if(msg.getE01ACCSTS().trim().equals(ACCSTS) && msg.getE01CCRSTS().trim().equals(CCRSTS.trim())){
						break;
					}
				}				
			}
			msg.setE01DATA4(ACTION);
			ses.setAttribute("CCRStatusData", msg);
			callPage(LangPath + "ESS2101_status_maintenance.jsp", req, res);			
    }

	protected void procExecute(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		 throws ServletException, IOException   {
			MessageRecord newmessage = null;
			UserPos userPO = null;	
			ELEERRMessage msgError = null;
			ESS210101Message msg = new ESS210101Message();
			ESS210101Message msgD = new ESS210101Message();
			BeanList msgList = new BeanList();
			boolean IsNotError = false;
			 		
			msgD.setE01ACCSTS(req.getParameter("E01ACCSTS").trim());
			msgD.setE01CCRSTS(req.getParameter("E01CCRSTS").trim());
			msgD.setE01CCDSC(req.getParameter("E01CCDSC").trim());
			//msgD.setE01CCMODE(req.getParameter("E01CCMODE").trim());
			msgD.setE01DATA4(req.getParameter("E01DATA4").trim());

			try{
				msg = (ESS210101Message)mc.getMessageRecord("ESS210101");
				msg.setH01USR(user.getH01USR());
				msg.setH01PGM("ESS2101");
				msg.setH01OPE("0300");
				msg.setH01TIM(SuperServlet.getTimeStamp());
				msg.setE01ACCSTS(msgD.getE01ACCSTS().trim());
				msg.setE01CCRSTS(msgD.getE01CCRSTS().trim());
				msg.setE01CCDSC(msgD.getE01CCDSC().trim());
				msg.setE01CCMODE(msgD.getE01CCMODE().trim());
				msg.setE01DATA4(msgD.getE01DATA4().trim());
				msg.send();
				msg.destroy();
			}catch(Exception es){
				es.printStackTrace();
				flexLog("Error: " + es);
				throw new RuntimeException("Socket Communication Error Sending Data");
			}
			try{
				newmessage = mc.receiveMessage();
				if(newmessage.getFormatName().equals("ELEERR"))	{
					msgError = (ELEERRMessage)newmessage;
					IsNotError = msgError.getERRNUM().equals("0");
					flexLog("IsNotError = " + IsNotError);
					showERROR(msgError);					
				} else	{
					flexLog("Error Message " + newmessage.getFormatName() + " received. Waiting Error");
				}			
			}catch(Exception er){
				er.printStackTrace();
				flexLog("Error: " + er);
				throw new RuntimeException("Socket Communication Error Receiving Data");			
			}
			if(IsNotError){
				res.sendRedirect(SuperServlet.srctx + "/servlet/com.datapro.eibs.internet.JSESS2101?SCREEN=100");
			}else{
				ses.setAttribute("CCRStatusData", msgD);
				callPage(LangPath + "ESS2101_status_maintenance.jsp", req, res);	
			}			 			
	 }


    protected void showERROR(ELEERRMessage m)  {
        if(SuperServlet.logType != 0)  {
            flexLog("ERROR received.");
            flexLog("ERROR number:" + m.getERRNUM());
            flexLog("ERR001 = " + m.getERNU01() + " desc: " + m.getERDS01() + " code : " + m.getERDF01());
            flexLog("ERR002 = " + m.getERNU02() + " desc: " + m.getERDS02() + " code : " + m.getERDF02());
            flexLog("ERR003 = " + m.getERNU03() + " desc: " + m.getERDS03() + " code : " + m.getERDF03());
            flexLog("ERR004 = " + m.getERNU04() + " desc: " + m.getERDS04() + " code : " + m.getERDF04());
            flexLog("ERR005 = " + m.getERNU05() + " desc: " + m.getERDS05() + " code : " + m.getERDF05());
            flexLog("ERR006 = " + m.getERNU06() + " desc: " + m.getERDS06() + " code : " + m.getERDF06());
            flexLog("ERR007 = " + m.getERNU07() + " desc: " + m.getERDS07() + " code : " + m.getERDF07());
            flexLog("ERR008 = " + m.getERNU08() + " desc: " + m.getERDS08() + " code : " + m.getERDF08());
            flexLog("ERR009 = " + m.getERNU09() + " desc: " + m.getERDS09() + " code : " + m.getERDF09());
            flexLog("ERR010 = " + m.getERNU10() + " desc: " + m.getERDS10() + " code : " + m.getERDF10());
        }
    }
}

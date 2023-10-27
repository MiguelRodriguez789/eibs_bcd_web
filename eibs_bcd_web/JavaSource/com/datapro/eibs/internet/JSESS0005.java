
package com.datapro.eibs.internet;

import datapro.eibs.beans.*;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;
import java.io.*;
import java.net.Socket;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSESS0005 extends SuperServlet{

    public JSESS0005(){
        LangPath = "S";
    }

    public JSESS0005(int logType){
        super(logType);
        LangPath = "S";
    }
    
	protected String LangPath;
	protected static final int R_LIST = 1;
	protected static final int A_LIST = 2;
	
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException  {
        MessageContext mc = null;
        ESS0030DSMessage msgUser = null;
        HttpSession session = null;
        session = req.getSession(false);
        if(session == null){
            try{
                res.setContentType("text/html");
                printLogInAgain(res.getWriter());
            }catch(Exception e){
                e.printStackTrace();
                flexLog("Exception ocurred. Exception = " + e);
            }
        } else {
            int screen = 1;
            try {
                msgUser = (ESS0030DSMessage)session.getAttribute("currUser");
                LangPath = SuperServlet.rootPath + msgUser.getE01LAN() + "/";
                try
                {
                    flexLog("Opennig Socket Connection");
                    mc = new MessageContext(super.getMessageHandler("ESS0005", req));
                    try{
                        screen = Integer.parseInt(req.getParameter("SCREEN"));
                    }catch(Exception e){
                        flexLog("Screen set to default value");
                    }
                    switch(screen){
                    	case R_LIST: 
							procReqFilter(mc, msgUser, req, res, session);
                        	break;

                    	case A_LIST: 
							actGetCustomers(mc, msgUser, req, res, session);
                        	break;
                    default:
                        res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.devPage);
                        break;
                    }
                }
                catch(Exception e){
                    e.printStackTrace();
                    flexLog("Socket not Open(" + mc.toString() + "). Error: " + e);
                    res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.sckNotOpenPage);
                }finally {
                    mc.close();
                }
            }catch(Exception e){
                flexLog("Error: " + e);
                res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.sckNotRespondPage);
            }
        }
    }

    protected void procReqFilter(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
		try{
			flexLog("About to call Page: " + LangPath + "ESS0005_client_help_container.jsp");
			callPage(LangPath + "ESS0005_client_help_container.jsp", req, res);
		}catch(Exception e){
			flexLog("Exception calling page " + e);
		}
    }

	protected void actGetCustomers(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
		JBList beanList = null;
		UserPos userPO = null;
		ESS0005DSMessage msgHelp = null;
		MessageRecord newmessage = null;
		ESS0030DSMessage msgUser = (datapro.eibs.beans.ESS0030DSMessage) ses.getAttribute("currUser");
		String Custype = "";			
		String Type = req.getParameter("Type");	
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		try {
			msgHelp = (ESS0005DSMessage) mc.getMessageRecord("ESS0005DS");
			msgHelp.setESSUSR(msgUser.getH01USR());
			msgHelp.setESSSHR(req.getParameter("NameSearch").toUpperCase());
			msgHelp.setESSSEL(Type);
			if(Type.trim().equals("A")){
				msgHelp.setESSACC(msgHelp.getESSSHR().trim());
			}
			if(Type.trim().equals("C")){
				msgHelp.setESSCUN(msgHelp.getESSSHR().trim());
			}
			
			try{
				msgHelp.setESSREC(req.getParameter("FromRecord"));	
			}catch(Exception e){
				msgHelp.setESSREC("0");
			}						
			try {
				Custype =(req.getParameter("CusType") == null)? "": req.getParameter("CusType");
			} catch (Exception e) {
				Custype = "";
			}
			msgHelp.send();
			msgHelp.destroy();
			flexLog("ESSS0005 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
			return;
		}

		// Receiving
		try {
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ESS0005DS")) {
				beanList = new JBList();
				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				String chk = "";

				while (true) {
					msgHelp = (ESS0005DSMessage) newmessage;
					marker = msgHelp.getESSOPE();
					if (marker.equals("*")) {
						beanList.setShowNext(false);				
						break;
					} else {
						if (firstTime) {
							firstTime = false;
							beanList.setFirstRec(
							Integer.parseInt(msgHelp.getESSREC()));
							chk = "checked";
						} else {
							chk = "";
						}  
						String linki = "<a href=\"javascript:Action('" + msgHelp.getESSUSR() + "','" + msgHelp.getESSTYP() + "')\">";
						String linkf = "</a>";
						myRow = new StringBuffer("<TR>");
						myRow.append("<td nowrap>" + linki + msgHelp.getESSCUN() + linkf + "</td>");
						myRow.append("<td nowrap>" + linki + msgHelp.getESSNA1() + linkf + "</td>");						
						myRow.append("<td nowrap>" + linki + msgHelp.getESSIDN() + linkf + "</td>");
						myRow.append("<td nowrap>" + linki + msgHelp.getESSUSR() + linkf + "</td>");
						myRow.append("<td nowrap>" + linki + msgHelp.getESSSTS() + linkf + "</td>");
						myRow.append("</TR>");
						beanList.addRow(myFlag, myRow.toString());
						if (marker.equals("+")) {
							beanList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}

				flexLog("Putting java beans into the session");
				ses.setAttribute("ess0005Help", beanList);
				try {
					req.setAttribute("NameSearch",req.getParameter("NameSearch"));
					req.setAttribute("Type", req.getParameter("Type"));
					req.setAttribute("CusType", Custype);
					flexLog("About to call Page: "	+ LangPath	+ "ESS0005_client_help_helpmessage.jsp");
					callPage(LangPath + "ESS0005_client_help_helpmessage.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
		}
			
	}



    protected void showERROR(ELEERRMessage m)
    {
        if(SuperServlet.logType != 0)
        {
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

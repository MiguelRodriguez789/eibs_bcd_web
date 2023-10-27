package com.datapro.eibs.internet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.Socket;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generics.BeanList;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS580101Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSESS5801 extends SuperServlet {
	
    protected static final int R_ENTER  		     = 100;
    protected static final int R_LIST_TRANS_VENDORS  = 200;
    
    protected String LangPath;
    int screen;
    public JSESS5801() {
        LangPath = "E";
    }

    public void destroy() {
        flexLog("free resources used by JSESS5801");
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
            screen = 0;
            try  {
                msgUser = (ESS0030DSMessage)session.getAttribute("currUser");
                LangPath = SuperServlet.rootPath + msgUser.getE01LAN() + "/";
                try  {
                    flexLog("Opennig Socket Connection");
                    mc = new MessageContext(super.getMessageHandler("ESS5801", req));
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
                    case R_ENTER:
                        try  {
                            flexLog("About to call Page: " + LangPath + "ESS2000_client_personal_new.jsp");
                            callPage(LangPath + "ESS5801_enter_customer.jsp", req, res);
                        }
                        catch(Exception e)
                        {
                            flexLog("Exception calling page " + e);
                        }
                        break;
					
                    case R_LIST_TRANS_VENDORS: 
						procListTransacc(mc, msgUser, req, res, session);
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
    
    protected void procListTransacc(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
        throws ServletException, IOException   {		
			MessageRecord newmessage = null;
			ELEERRMessage msgError = null;
			ESS580101Message msg = new ESS580101Message();
			BeanList msgList = new BeanList();
			boolean IsNotError = false;
			String PageToCall = "ESS5801_enter_customer.jsp";
			try{
				int SYY = Integer.parseInt(req.getParameter("SYY")) - 2000;
				int EYY = Integer.parseInt(req.getParameter("EYY")) - 2000;
				String CUSTOMER = req.getParameter("E01INPCUN");
				msg = (ESS580101Message)mc.getMessageRecord("ESS580101");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ESS5801");
				msg.setH01OPECOD("0100");
				msg.setE01INPCUN(CUSTOMER.trim());
				msg.setE01INPFAY(""+SYY);
				msg.setE01INPFAM(req.getParameter("SMM"));
				msg.setE01INPFAD(req.getParameter("SDD"));
				msg.setE01INPEAY(""+EYY);
				msg.setE01INPEAM(req.getParameter("EMM"));
				msg.setE01INPEAD(req.getParameter("EDD"));
				msg.send();
				msg.destroy();
			}catch(Exception es){
				es.printStackTrace();
				flexLog("Error: " + es);
				throw new RuntimeException("Socket Communication Error Sending Data");
			}
			try{
				newmessage = mc.receiveMessage();
				if(newmessage.getFormatName().equals("ELEERR")){
	                msgError = (ELEERRMessage)newmessage;
	                IsNotError = msgError.getERRNUM().equals("0");
	                if(IsNotError){
	                	newmessage = mc.receiveMessage();
	                	PageToCall = "ESS5801_transactions_list.jsp";
    					msg = (ESS580101Message)newmessage;
    					while(!msg.getH01FLGMAS().equals("*")){
    						msgList.addRow(msg);
    						newmessage = mc.receiveMessage();
    						msg = (ESS580101Message)newmessage;
    					}
	                }
	            }							
			}catch(Exception er){
				er.printStackTrace();
				flexLog("Error: " + er);
				throw new RuntimeException("Socket Communication Error Receiving Data");			
			}
			ses.setAttribute("ESS5801List", msgList);
			callPage(LangPath + PageToCall, req, res);
    }
	
}

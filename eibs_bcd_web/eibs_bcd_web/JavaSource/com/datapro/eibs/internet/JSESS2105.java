/*
 * Vendors Transactions History
 */
package com.datapro.eibs.internet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.Socket;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generics.BeanList;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS210501Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

public class JSESS2105 extends SuperServlet {
	
    protected static final int R_LIST_VENDORS         = 100;
    protected static final int R_LIST_TRANS_VENDORS   = 200;
    
	protected static final int R_LIST_VENDORS_REGISTER   = 400;
	protected static final int R_LIST_VENDORS_REGISTERED = 500;
    protected String LangPath;
    int screen;
    public JSESS2105() {
        LangPath = "E";
    }

    public void destroy() {
        flexLog("free resources used by JSESS2105");
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
                    mc = new MessageContext(super.getMessageHandler("ESS2105", req));
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
                    case R_LIST_VENDORS:
					case R_LIST_VENDORS_REGISTER:
						procListVendors(mc, msgUser, req, res, session);
                        break;
					
                    case R_LIST_TRANS_VENDORS: 
						procListTransacc(mc, msgUser, req, res, session);
                        break;
								
					case R_LIST_VENDORS_REGISTERED:
						procListGegisteredVendors(mc, msgUser, req, res, session);
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
	protected void procListVendors(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException   {
				
		MessageRecord newmessage = null;
		UserPos userPO = null;	
		ELEERRMessage msgError = null;
		ESS210501Message msg = new ESS210501Message();
		BeanList msgList = new BeanList();
		boolean IsNotError = false;
		boolean GoIn = false;
		
		try{
			msg = (ESS210501Message)mc.getMessageRecord("ESS210501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESS2105");
			msg.setH01OPECOD("0100");
			msg.send();
			msg.destroy();
		}catch(Exception es){
			es.printStackTrace();
			flexLog("Error: " + es);
			throw new RuntimeException("Socket Communication Error Sending Data");
		}
		try{
			newmessage = mc.receiveMessage();
			if(newmessage.getFormatName().equals("ESS210501"))	{
				msg = (ESS210501Message)newmessage;
				while(!msg.getH01FLGMAS().equals("*")){
					msgList.addRow(msg);
					newmessage = mc.receiveMessage();
					msg = (ESS210501Message)newmessage;
				}
			}else{
				flexLog("Error Message " + newmessage.getFormatName() + " received. Waiting ESS210501");
			}
			
		}catch(Exception er){
			er.printStackTrace();
			flexLog("Error: " + er);
			throw new RuntimeException("Socket Communication Error Receiving Data");			
		}
		
		ses.setAttribute("VendorList", msgList);
		if(screen == R_LIST_VENDORS ){
			callPage(LangPath + "ESS2105_vendor_list.jsp", req, res);	
		}else{
			callPage(LangPath + "ESS2105_vendor_list_register.jsp", req, res);
		}		
	}
    
    protected void procListTransacc(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
        throws ServletException, IOException   {		
			MessageRecord newmessage = null;
			UserPos userPO = null;	
			ELEERRMessage msgError = null;
			ESS210501Message msg = new ESS210501Message();
			BeanList msgList = new BeanList();
			boolean IsNotError = false;
			boolean GoIn = false;		
			int SDD = Integer.parseInt(req.getParameter("SDD"));
			int SMM = Integer.parseInt(req.getParameter("SMM"));
			int SYY = Integer.parseInt(req.getParameter("SYY"));
			int EDD = Integer.parseInt(req.getParameter("EDD"));
			int EMM = Integer.parseInt(req.getParameter("EMM"));
			int EYY = Integer.parseInt(req.getParameter("EYY"));
			String  Vendor = req.getParameter("VENDOR");
			int BegDate = (SYY * 10000) + (SMM * 100) + SDD;
			int EndDate = (EYY * 10000) + (EMM * 100) + EDD;
			
			try{
				msg = (ESS210501Message)mc.getMessageRecord("ESS210501");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ESS2105");
				msg.setH01OPECOD("0200");
				msg.setE01VENNUM(Vendor);
				msg.setE01VENDATB(new BigDecimal(BegDate));
				msg.setE01VENDATE(new BigDecimal(EndDate));
				msg.send();
				msg.destroy();
			}catch(Exception es){
				es.printStackTrace();
				flexLog("Error: " + es);
				throw new RuntimeException("Socket Communication Error Sending Data");
			}
			try{
				newmessage = mc.receiveMessage();
				if(newmessage.getFormatName().equals("ESS210501"))	{
					msg = (ESS210501Message)newmessage;
					while(!msg.getH01FLGMAS().equals("*")){
						msgList.addRow(msg);
						newmessage = mc.receiveMessage();
						msg = (ESS210501Message)newmessage;
					}
				}else{
					flexLog("Error Message " + newmessage.getFormatName() + " received. Waiting ESS210501");
				}
			
			}catch(Exception er){
				er.printStackTrace();
				flexLog("Error: " + er);
				throw new RuntimeException("Socket Communication Error Receiving Data");			
			}
			ses.setAttribute("VendorTransac", msgList);
			callPage(LangPath + "ESS2105_vendor_transactions.jsp", req, res);
    }

	protected void procListGegisteredVendors(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException   {		
			MessageRecord newmessage = null;
			UserPos userPO = null;	
			ELEERRMessage msgError = null;
			ESS210501Message msg = new ESS210501Message();
			BeanList msgList = new BeanList();
			boolean IsNotError = false;
			boolean GoIn = false;		
			int SDD = Integer.parseInt(req.getParameter("SDD"));
			int SMM = Integer.parseInt(req.getParameter("SMM"));
			int SYY = Integer.parseInt(req.getParameter("SYY"));
			int EDD = Integer.parseInt(req.getParameter("EDD"));
			int EMM = Integer.parseInt(req.getParameter("EMM"));
			int EYY = Integer.parseInt(req.getParameter("EYY"));
			String  Vendor = req.getParameter("VENDOR");
			int BegDate = (SYY * 10000) + (SMM * 100) + SDD;
			int EndDate = (EYY * 10000) + (EMM * 100) + EDD;
			
			try{
				msg = (ESS210501Message)mc.getMessageRecord("ESS210501");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ESS2105");
				msg.setH01OPECOD("0500");
				msg.setE01VENNUM(Vendor);
				msg.setE01VENDATB(new BigDecimal(BegDate));
				msg.setE01VENDATE(new BigDecimal(EndDate));
				msg.send();
				msg.destroy();
			}catch(Exception es){
				es.printStackTrace();
				flexLog("Error: " + es);
				throw new RuntimeException("Socket Communication Error Sending Data");
			}
			try{
				newmessage = mc.receiveMessage();
				if(newmessage.getFormatName().equals("ESS210501"))	{
					msg = (ESS210501Message)newmessage;
					while(!msg.getH01FLGMAS().equals("*")){
						msgList.addRow(msg);
						newmessage = mc.receiveMessage();
						msg = (ESS210501Message)newmessage;
					}
				}else{
					flexLog("Error Message " + newmessage.getFormatName() + " received. Waiting ESS210501");
				}
			
			}catch(Exception er){
				er.printStackTrace();
				flexLog("Error: " + er);
				throw new RuntimeException("Socket Communication Error Receiving Data");			
			}
			ses.setAttribute("VendorRegistered", msgList);
			callPage(LangPath + "ESS2105_vendor_register.jsp", req, res);
	}

	
}

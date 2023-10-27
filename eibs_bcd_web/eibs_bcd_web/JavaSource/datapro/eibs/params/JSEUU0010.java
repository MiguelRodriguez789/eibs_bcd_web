package datapro.eibs.params;
/*********************************************************************************************************************************/
/**  Creado     por          :  Patricia Cataldo L.                 DATAPRO                                                     **/
/**  Identificacion          :  PCL01                                                                                           **/
/**  Fecha                   :  29/03/2012                                                                                      **/
/**  Objetivo                :  Servicio para ingreso/Mantenimiento de Tasa Maxima Permitida                                  **/
/**                                                                                                                             **/
/*********************************************************************************************************************************/

import datapro.eibs.beans.*;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.*;
import java.io.*;
import java.net.Socket;
import java.util.Enumeration;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEUU0010 extends SuperServlet {

    protected static final int R_MAINTENANCE = 1;
    protected static final int A_MAINTENANCE = 2;
    protected static final int A_TB_ENTER = 3;
    protected static final int R_LIST = 100;
    protected static final int A_LIST = 200;
	protected static final int R_LIST_READ	= 500;
    protected String LangPath;

    public JSEUU0010() {
        LangPath = "S";
    }

    public void destroy() {
        flexLog("free resources used by JSEUU0010");
    }

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    protected void procActionTableMaint(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
        MessageRecord newmessage = null;
        EUU001002Message msgRate = null;
        EUU001001Message msgRate1 = null;
        ELEERRMessage msgError = null;
        UserPos userPO = null;
        boolean IsNotError = false;
        userPO = (UserPos)ses.getAttribute("userPO");
        //Enviar mensaje a AS400 
        try {
            flexLog("Send Initial Data");
            msgRate = (EUU001002Message)mc.getMessageRecord("EUU001002");
            msgRate.setH02USERID(user.getH01USR());
            msgRate.setH02PROGRM("EUU0010");
            msgRate.setH02TIMSYS(SuperServlet.getTimeStamp());
            msgRate.setH02SCRCOD("01");
			if (userPO.getPurpose().equals("DELETE  ")) 
			{
				msgRate.setH02OPECOD("0004");
			} else 
			{
				msgRate.setH02OPECOD("0003");
			}
            Enumeration enu = msgRate.fieldEnumeration();
            MessageField field = null;
            String value = null;
            while(enu.hasMoreElements())  
            {
                field = (MessageField)enu.nextElement();
                try {
                    value = req.getParameter(field.getTag()).toUpperCase();
                    if(value != null)
                        field.setString(value);
                    }
                catch(Exception exception) { }
            }
            flexLog("EUU001002 Message Sent = " + msgRate);            
            msgRate.send();
            msgRate.destroy();
            
            //Recibir Mensaje de error siempre
            try 
            {
            	newmessage = mc.receiveMessage();
            	if(newmessage.getFormatName().equals("ELEERR")) 
            	{
            		msgError = (ELEERRMessage)newmessage;
            		IsNotError = msgError.getERRNUM().equals("0");
            		flexLog("IsNotError = " + IsNotError);
            		showERROR(msgError);
            	} 
            	else 
				{
            		flexLog("Message " + newmessage.getFormatName() + " received.");
				}
            }
            catch(Exception e) 
            {
            	 flexLog("Exception calling page " + e);
            }            	
            //Recibir Mensaje de respuesta     
            try
            {
            	newmessage = mc.receiveMessage();
            	if(newmessage.getFormatName().equals("EUU001002")) 
            	{
            		msgRate = (EUU001002Message)newmessage;
                    flexLog("Putting java beans into the session");
                    userPO.setHeader1("");
                    ses.setAttribute("error", msgError);
                    ses.setAttribute("userPO", userPO);
                    try 
                    {
    					if (IsNotError) {                             //No hay errores
    						try {
                                flexLog("About to call Page: " + LangPath + "EUU0010_rate_table_confirm.jsp");
                                callPage(LangPath + "EUU0010_rate_table_confirm.jsp", req, res);
    						} catch (Exception e) {
    							flexLog("Exception calling page " + e);
    						}
                        } else {                                    // Si hay errores
                            ses.setAttribute("tbRate", msgRate);
                            flexLog("About to call Page: " + LangPath + "EUU0010_rate_table_maint.jsp");
                            callPage(LangPath + "EUU0010_rate_table_maint.jsp", req, res);
                        }
                    }
                    catch(Exception e) {
                        flexLog("Exception calling page " + e);
                    }
                 } else {
                    flexLog("Message " + newmessage.getFormatName() + " received.");
                }
              }
                catch(Exception e) {
                    flexLog("Exception calling page " + e);
                }
            }
        catch(Exception e) {
            e.printStackTrace();
            flexLog("Error: " + e);
            throw new RuntimeException("Socket Communication Error");
        }
    }

    protected void procActionTableEnter(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
        MessageRecord newmessage = null;
        EUU001002Message msgRate = null;
        ELEERRMessage msgError = null;
        UserPos userPO = null;
        boolean IsNotError = false;
        userPO = (UserPos)ses.getAttribute("userPO");
        try {
			 flexLog("Send Initial Data");
			 msgRate = (EUU001002Message)mc.getMessageRecord("EUU001002");
			 msgRate.setH02USERID(user.getH01USR());
			 msgRate.setH02PROGRM("EUU0010");
			 msgRate.setH02TIMSYS(SuperServlet.getTimeStamp());
			 msgRate.setH02SCRCOD("01");
			 msgRate.setH02OPECOD("0001");
			 try {
			      msgRate.setE02USUBNK(req.getParameter("E01USUBNK"));
			      msgRate.setE02USUCCY(req.getParameter("E01USUCCY"));
			      msgRate.setE02USUDDD(req.getParameter("E01USUDDD"));
			      msgRate.setE02USUDMM(req.getParameter("E01USUDMM"));
			      msgRate.setE02USUDYY(req.getParameter("E01USUDYY"));
			      msgRate.setE02USUPZO(req.getParameter("E01USUPZO"));
			      msgRate.setE02USURCY(req.getParameter("E01USURCY"));
			      msgRate.setE02USUBSE(req.getParameter("E01USUBSE"));
			     }
			 catch(Exception exception) { }
			 
			 msgRate.send();
			 msgRate.destroy();
			 flexLog("EUU001002 Message Sent");
			 userPO.setPurpose("MAINTENANCE");
             newmessage = mc.receiveMessage();
			 if(newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage)newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else {
				flexLog("Message " + newmessage.getFormatName() + " received.");
			}
            newmessage = mc.receiveMessage();
            if(newmessage.getFormatName().equals("EUU001002")) {
                msgRate = (EUU001002Message)newmessage;
                flexLog("Putting java beans into the session");
                userPO.setHeader1("");
                ses.setAttribute("error", msgError);
                ses.setAttribute("userPO", userPO);
                try {
                    if(IsNotError) {
                        ses.setAttribute("tbRate", msgRate);
                        flexLog("About to call Page: " + LangPath + "EUU0010_rate_table_maint.jsp");
                        callPage(LangPath + "EUU0010_rate_table_maint.jsp", req, res);
                    } else {
                        flexLog("About to call Page: " + LangPath + "EUU0010_rate_table_enter.jsp");
                        callPage(LangPath + "EUU0010_rate_table_enter.jsp", req, res);
                    }
                }
                catch(Exception e) {
                    flexLog("Exception calling page " + e);
                }
            } else
            if(newmessage.getFormatName().equals("EUU001001")) {
                msgRate = (EUU001002Message)newmessage;
                flexLog("Putting java beans into the session");
                ses.setAttribute("error", msgError);
                ses.setAttribute("userPO", userPO);
                try {
                    flexLog("About to call Page: " + LangPath + "EUU0010_rate_table_enter.jsp");
                    callPage(LangPath + "EUU0010_rate_table_enter.jsp", req, res);
                }
                catch(Exception e) {
                    flexLog("Exception calling page " + e);
                }
            } else {
                flexLog("Message " + newmessage.getFormatName() + " received.");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
            flexLog("Error: " + e);
            throw new RuntimeException("Socket Communication Error");
        }
    }

 
    protected void procReqTableList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
        MessageRecord newmessage = null;
        EUU001001Message msgRate = null;
        ELEERRMessage msgError = null;
        UserPos userPO = null;
        boolean IsNotError = false;
        userPO = new UserPos();
        
		String purpose = (String) ses.getAttribute("Purpose");
		if (purpose.equals("READONLY")) {
			userPO.setPurpose(purpose);
		} 
        try {
            msgRate = (EUU001001Message)mc.getMessageRecord("EUU001001");
            msgRate.setH01USERID(user.getH01USR());
            msgRate.setH01PROGRM("EUU0010");
            msgRate.setH01TIMSYS(SuperServlet.getTimeStamp());
            msgRate.setH01SCRCOD("01");
            msgRate.setH01OPECOD("0015");
            msgRate.send();
            msgRate.destroy();
            newmessage = mc.receiveMessage();
            if(newmessage.getFormatName().equals("ELEERR")) {
                msgError = (ELEERRMessage)newmessage;
                IsNotError = msgError.getERRNUM().equals("0");
                flexLog("IsNotError = " + IsNotError);
                showERROR(msgError);
            } else {
                flexLog("Message " + newmessage.getFormatName() + " received.");
            }
            newmessage = mc.receiveMessage();
            if(newmessage.getFormatName().equals("EUU001001")) {
                String marker = "";
                JBObjList beanList = new JBObjList();
                do {
                    msgRate = (EUU001001Message)newmessage;
                    marker = msgRate.getH01FLGMAS();
                    msgRate.setHandler(null);
                    if(marker.equals("*")) {
                        beanList.setShowNext(false);
                        break;
                    }
                    beanList.addRow(msgRate);
                    if(marker.equals("+")) {
                        beanList.setShowNext(true);
                        break;
                    }
                    newmessage = mc.receiveMessage();
                }
                while(true);
                flexLog("Putting java beans into the session");
                ses.setAttribute("tbRateList", beanList);
                ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
                try {
                    flexLog("About to call Page: " + LangPath + "EUU0010_rate_table_list.jsp");
                    callPage(LangPath + "EUU0010_rate_table_list.jsp", req, res);
                }
                catch(Exception e) {
                    flexLog("Exception calling page " + e);
                }
            } else {
                flexLog("Message " + newmessage.getFormatName() + " received.");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
            flexLog("Error: " + e);
            throw new RuntimeException("Socket Communication Error");
        }
    }


    protected void procReqTable(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
        MessageRecord newmessage = null;
        ELEERRMessage msgError = null;
        EUU001002Message msgRate = null;
        boolean IsNotError = false;
        UserPos userPO = null;
        userPO = (UserPos)ses.getAttribute("userPO");
        try {
            flexLog("Send Initial Data");
            msgRate = (EUU001002Message)ses.getAttribute("tbRate");
            msgRate.setH02USERID(user.getH01USR());
            msgRate.setH02PROGRM("EUU0010");
            msgRate.setH02TIMSYS(SuperServlet.getTimeStamp());
            msgRate.setH02SCRCOD("01");
            msgRate.setH02OPECOD("0002");
            mc.sendMessage(msgRate);
            msgRate.destroy();
            flexLog("EUU001002 Message Sent");
            newmessage = mc.receiveMessage();
			if(newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage)newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else {
				flexLog("Message " + newmessage.getFormatName() + " received.");
			}
            newmessage = mc.receiveMessage();
            if(newmessage.getFormatName().equals("EUU001002")) {
                msgRate = (EUU001002Message)newmessage;
                ses.setAttribute("userPO", userPO);
                ses.setAttribute("tbRate", msgRate);
                ses.setAttribute("error", msgError);
                try {
                    flexLog("About to call Page: " + LangPath + "EUU0010_rate_table_maint.jsp");
                    callPage(LangPath + "EUU0010_rate_table_maint.jsp", req, res);
                }
                catch(Exception e) {
                    flexLog("Exception calling page " + e);
                }
            } else {
                flexLog("Message " + newmessage.getFormatName() + " received.");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
            flexLog("Error: " + e);
            throw new RuntimeException("Socket Communication Error");
        }
    }

    protected void procActionTableList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
        UserPos userPO = null;
        ELEERRMessage msgError = null;
        JBObjList tbList = null;
        try {
            msgError = new ELEERRMessage();
            userPO = (UserPos)ses.getAttribute("userPO");
            int row = 0;
			if (req.getParameter("opt").equals("M") || req.getParameter("opt").equals("D")|| req.getParameter("opt").equals("E")) {	
                row = Integer.parseInt(req.getParameter("ROW"));
                tbList = (JBObjList)ses.getAttribute("tbRateList");
                tbList.setCurrentRow(row);
                EUU001001Message tbRate1 = (EUU001001Message)tbList.getRecord();
				if (req.getParameter("opt").equals("M")) {
					userPO.setPurpose("MAINTENANCE");
				} else {
					if (req.getParameter("opt").equals("E")) {
						userPO.setPurpose("DELETE  ");
					} else {					
					userPO.setPurpose("READONLY");
					}
				}
                EUU001002Message tbRate = new EUU001002Message();
                tbRate.setE02USUBNK(tbRate1.getE01USUBNK());
                tbRate.setE02USUCCY(tbRate1.getE01USUCCY());
                tbRate.setE02USUDDD(tbRate1.getE01USUDDD());
                tbRate.setE02USUDMM(tbRate1.getE01USUDMM());
                tbRate.setE02USUDYY(tbRate1.getE01USUDYY());
                tbRate.setE02USUPZO(tbRate1.getE01USUPZO());
                tbRate.setE02USURCY(tbRate1.getE01USURCY());
                tbRate.setE02USUBSE(tbRate1.getE01USUBSE());
                ses.setAttribute("userPO", userPO);
                ses.setAttribute("tbRate", tbRate);
                procReqTable(mc, user, req, res, ses);
            } else {
                if(req.getParameter("opt").equals("N"))
                    userPO.setPurpose("NEW");
                else
                    userPO.setPurpose("COPY");
                ses.setAttribute("error", msgError);
                ses.setAttribute("userPO", userPO);
                try {
                    flexLog("About to call Page: " + LangPath + "EUU0010_rate_table_enter.jsp");
                    callPage(LangPath + "EUU0010_rate_table_enter.jsp", req, res);
                }
                catch(Exception e) {
                    flexLog("Exception calling page " + e);
                }
            }
        }
        catch(Exception ex) {
            flexLog("Error: " + ex);
        }
    }


    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        MessageContext mc = null;
        ESS0030DSMessage msgUser = null;
        HttpSession session = null;
        session = req.getSession(false);
        if(session == null) {
            try {
                res.setContentType("text/html");
                printLogInAgain(res.getWriter());
            }
            catch(Exception e) {
                e.printStackTrace();
                flexLog("Exception ocurred. Exception = " + e);
            }
        } else {
            int screen = R_LIST;
            try {
                msgUser = (ESS0030DSMessage)session.getAttribute("currUser");
                LangPath = SuperServlet.rootPath + msgUser.getE01LAN() + "/";
                try {
                    flexLog("Opennig Socket Connection");
                    mc = new MessageContext(super.getMessageHandler("EUU0010", req));
                    try {
                        screen = Integer.parseInt(req.getParameter("SCREEN"));
                    }
                    catch(Exception e) {
                        flexLog("Screen set to default value");
                    }
                    
                    switch(screen) {
                    case R_LIST: // 'd'
						session.setAttribute("Purpose", "");
                        procReqTableList(mc, msgUser, req, res, session);
                        break;

					case R_LIST_READ :
						session.setAttribute("Purpose", "READONLY");
						procReqTableList(mc, msgUser, req, res, session);
						break;
						
                    case A_LIST: 
                        procActionTableList(mc, msgUser, req, res, session);
                        break;

                    case A_TB_ENTER: // '\003'
                        procActionTableEnter(mc, msgUser, req, res, session);
                        break;

                    case A_MAINTENANCE: // '\002'
                        procActionTableMaint(mc, msgUser, req, res, session);
                        break;

                    default:
                        res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.devPage);
                        break;

                    }
                }
                catch(Exception e) {
                    e.printStackTrace();
                    int sck = SuperServlet.iniSocket + 1;
                    flexLog("Socket not Open(Port " + sck + "). Error: " + e);
                    res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.sckNotOpenPage);
                }
                finally {
                    mc.close();
                }
            }
            catch(Exception e) {
                flexLog("Error: " + e);
                res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.sckNotRespondPage);
            }
        }
    }

    protected void showERROR(ELEERRMessage m) {
        if(SuperServlet.logType != 0) {
            flexLog("ERROR received.");
            flexLog("ERROR number:" + m.getERRNUM());
            flexLog("ERR001 = " + m.getERNU01() + " desc: " + m.getERDS01());
            flexLog("ERR002 = " + m.getERNU02() + " desc: " + m.getERDS02());
            flexLog("ERR003 = " + m.getERNU03() + " desc: " + m.getERDS03());
            flexLog("ERR004 = " + m.getERNU04() + " desc: " + m.getERDS04());
            flexLog("ERR005 = " + m.getERNU05() + " desc: " + m.getERDS05());
            flexLog("ERR006 = " + m.getERNU06() + " desc: " + m.getERDS06());
            flexLog("ERR007 = " + m.getERNU07() + " desc: " + m.getERDS07());
            flexLog("ERR008 = " + m.getERNU08() + " desc: " + m.getERDS08());
            flexLog("ERR009 = " + m.getERNU09() + " desc: " + m.getERDS09());
            flexLog("ERR010 = " + m.getERNU10() + " desc: " + m.getERDS10());
        }
    }
}

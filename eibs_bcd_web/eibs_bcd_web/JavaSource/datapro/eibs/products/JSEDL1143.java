// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   JSEDL1143.java

package datapro.eibs.products;        

import datapro.eibs.beans.*;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;
import java.io.*;
import java.math.BigDecimal;
import java.net.Socket;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL1143 extends SuperServlet
{

    public JSEDL1143()
    {
        LangPath = "S";
    }

    public void destroy()
    {
        flexLog("free resources used by JSEDL1143");
    }

    public void init(ServletConfig config)
        throws ServletException
    {
        super.init(config);
    }

    protected void procActionSelection(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
        throws ServletException, IOException
    {
        UserPos userPO = null;
        userPO = (UserPos)ses.getAttribute("userPO");
        userPO.setHeader7(req.getParameter("E01INFTYP"));
        try
        {
            userPO.setHeader9(req.getParameter("E01FRDTEM"));
            userPO.setHeader10(req.getParameter("E01FRDTED"));
            userPO.setHeader11(req.getParameter("E01FRDTEY"));
        }
        catch(Exception e)
        {
            flexLog("ERROR DATE 1");
        }
        try
        {
            userPO.setHeader12(req.getParameter("E01TODTEM"));
            userPO.setHeader13(req.getParameter("E01TODTED"));
            userPO.setHeader14(req.getParameter("E01TODTEY"));
        }
        catch(Exception e)
        {
            flexLog("ERROR DATE 2");
        }
        ses.setAttribute("userPO", userPO);
        procReqList(mc, user, req, res, ses);
    }

    protected void procReqList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
        throws ServletException, IOException
    {
        MessageRecord newmessage = null;
        ELEERRMessage msgError = null;
        EDL114301Message msgSearch = null;
        EDL114301Message msgList = null;
        EDL114302Message msgHeader = null;
        JBList beanList = null;
        UserPos userPO = null;
        userPO = (UserPos)ses.getAttribute("userPO");
        int startPos = 0;
        try
        {
            flexLog("Send Initial Data");
            msgSearch = (EDL114301Message)mc.getMessageRecord("EDL114301");
            msgSearch.setH01USERID(user.getH01USR());
            msgSearch.setH01PROGRM("EDL1143");
            msgSearch.setH01TIMSYS(SuperServlet.getTimeStamp());
            msgSearch.setH01SCRCOD("01");
            msgSearch.setH01OPECOD("0004");
            try
            {
                try
                {
                    msgSearch.setE01NUMREC(req.getParameter("Pos"));
                    startPos = Integer.parseInt(req.getParameter("Pos"));
                }
                catch(Exception e)
                {
                    flexLog("E01NUMPOS");
                }
                msgSearch.setE01INFTYP(userPO.getHeader7());
                try
                {
                    msgSearch.setE01FRDTEM(userPO.getHeader9());
                    msgSearch.setE01FRDTED(userPO.getHeader10());
                    msgSearch.setE01FRDTEY(userPO.getHeader11());
                }
                catch(Exception e)
                {
                    flexLog("DATE 1");
                }
                try
                {
                    msgSearch.setE01TODTEM(userPO.getHeader12());
                    msgSearch.setE01TODTED(userPO.getHeader13());
                    msgSearch.setE01TODTEY(userPO.getHeader14());
                }
                catch(Exception e)
                {
                    flexLog("DATE 2");
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
                flexLog("Input data error " + e);
            }
            msgSearch.send();
            msgSearch.destroy();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            flexLog("Error: " + e);
            throw new RuntimeException("Socket Communication Error");
        }
        try
        {
            newmessage = mc.receiveMessage();
            if(newmessage.getFormatName().equals("ELEERR"))
            {
                try
                {
                    msgError = new ELEERRMessage();
                }
                catch(Exception ex)
                {
                    flexLog("Error: " + ex);
                }
                msgError = (ELEERRMessage)newmessage;
                flexLog("Putting java beans into the session");
                ses.setAttribute("error", msgError);
                try
                {
                    flexLog("About to call Page: " + LangPath + "EDL1143_chg_selection.jsp");
                    callPage(LangPath + "EDL1143_chg_selection.jsp", req, res);
                }
                catch(Exception e)
                {
                    flexLog("Exception calling page " + e);
                }
            } else
            if(newmessage.getFormatName().equals("EDL114302"))
            {
                try
                {
                    msgHeader = new EDL114302Message();
                }
                catch(Exception ex)
                {
                    flexLog("Error: " + ex);
                }
                msgHeader = (EDL114302Message)newmessage;
                flexLog("Putting java beans into the session");
                ses.setAttribute("chgInfo", msgHeader);
                newmessage = mc.receiveMessage();
                if(newmessage.getFormatName().equals("EDL114301"))
                {
                    try
                    {
                        beanList = new JBList();
                    }
                    catch(Exception ex)
                    {
                        flexLog("Error: " + ex);
                    }
                    boolean firstTime = true;
                    String marker = "";
                    String myFlag = "";
                    StringBuffer myRow = null;
                    String strCpaid = "";
                    String strBkpaid = "";
                    BigDecimal Cpaid = new BigDecimal(0.0D);
                    BigDecimal Bkpaid = new BigDecimal(0.0D);
                    do
                    {
                        msgList = (EDL114301Message)newmessage;
                        marker = msgList.getE01INDOPE();
                        if(marker.equals("*"))
                        {
                            beanList.setShowNext(false);
                            break;
                        }
                        if(firstTime)
                        {
                            firstTime = false;
                            int pos = Integer.parseInt(msgList.getE01NUMREC());
                            beanList.setFirstRec(pos);
                        }
                        if(msgList.getE01INFTYP().equals("1"))
                        {
                            myRow = new StringBuffer("<TR>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01NROPRE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01INIDTE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01LIQDTE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01PERPAG()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01CEDULA()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01NOMBRE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01PROVIN()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01CORREG()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01NFINCA()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01VALTER()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01VALMEJ()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01VALTOT()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01MONPRE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TASREF()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TASPAC()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TRAMOP()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01REGFOR()) + "</TD>");
                            myRow.append("</TR>");
                            beanList.addRow(myFlag, myRow.toString());
                        }
                        if(msgList.getE01INFTYP().equals("2"))
                        {
                            myRow = new StringBuffer("<TR>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01ANTRUC()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01ANTDIG()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01INIDTE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01ANTPRE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01NROPRE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01CEDULA()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01NOMBRE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01INIDTE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01LIQDTE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01PERPAG()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01MONPRE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TASREF()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TASPAC()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TRAMOP()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01REGFOR()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01INFTYP()) + "</TD>");
                            myRow.append("</TR>");
                            beanList.addRow(myFlag, myRow.toString());
                        }
                        if(msgList.getE01INFTYP().equals("3"))
                        {
                            myRow = new StringBuffer("<TR>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01NROPRE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01INIDTE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01LIQDTE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01SALINI()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01SALFIN()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01SALMED()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TASPRO()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01INGREF()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01INGEFE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01DIFEFE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01LIMTOP()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01DIFTOP()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01MONPRE()) + "</TD>");
                            myRow.append("</TR>");
                            beanList.addRow(myFlag, myRow.toString());
                        }
                        if(marker.equals("+"))
                        {
                            beanList.setShowNext(true);
                            break;
                        }
                        newmessage = mc.receiveMessage();
                    } while(true);
                    userPO.setHeader19(Util.fcolorCCY(Cpaid.toString()));
                    userPO.setHeader20(Util.fcolorCCY(Bkpaid.toString()));
                    flexLog("Putting java beans into the session");
                    ses.setAttribute("userPO", userPO);
                    ses.setAttribute("chgList", beanList);
                    try
                    {
                        flexLog("About to call Page: " + LangPath + "EDL1143_chg_list.jsp");
                        callPage(LangPath + "EDL1143_chg_list.jsp", req, res);
                    }
                    catch(Exception e)
                    {
                        flexLog("Exception calling page " + e);
                    }
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            flexLog("Error: " + e);
            throw new RuntimeException("Socket Communication Error");
        }
    }

    protected void procReqPrintList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
        throws ServletException, IOException
    {
        MessageRecord newmessage = null;
        ELEERRMessage msgError = null;
        EDL114301Message msgSearch = null;
        EDL114301Message msgList = null;
        EDL114302Message msgHeader = null;
        JBList beanList = null;
        UserPos userPO = null;
        userPO = (UserPos)ses.getAttribute("userPO");
        int startPos = 0;
        try
        {
            flexLog("Send Initial Data");
            msgSearch = (EDL114301Message)mc.getMessageRecord("EDL114301");
            msgSearch.setH01USERID(user.getH01USR());
            msgSearch.setH01PROGRM("EDL1143");
            msgSearch.setH01TIMSYS(SuperServlet.getTimeStamp());
            msgSearch.setH01SCRCOD("01");
            msgSearch.setH01OPECOD("0004");
            msgSearch.setH01FLGWK1("P");
            try
            {
                try
                {
                    msgSearch.setE01NUMREC(req.getParameter("Pos"));
                    startPos = Integer.parseInt(req.getParameter("Pos"));
                }
                catch(Exception e)
                {
                    flexLog("E01NUMPOS");
                }
                msgSearch.setE01INFTYP(userPO.getHeader7());
                try
                {
                    msgSearch.setE01FRDTEM(userPO.getHeader9());
                    msgSearch.setE01FRDTED(userPO.getHeader10());
                    msgSearch.setE01FRDTEY(userPO.getHeader11());
                }
                catch(Exception e)
                {
                    flexLog("DATE 1");
                }
                try
                {
                    msgSearch.setE01TODTEM(userPO.getHeader12());
                    msgSearch.setE01TODTED(userPO.getHeader13());
                    msgSearch.setE01TODTEY(userPO.getHeader14());
                }
                catch(Exception e)
                {
                    flexLog("DATE 2");
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
                flexLog("Input data error " + e);
            }
            msgSearch.send();
            msgSearch.destroy();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            flexLog("Error: " + e);
            throw new RuntimeException("Socket Communication Error");
        }
        try
        {
            newmessage = mc.receiveMessage();
            if(newmessage.getFormatName().equals("ELEERR"))
            {
                try
                {
                    msgError = new ELEERRMessage();
                }
                catch(Exception ex)
                {
                    flexLog("Error: " + ex);
                }
                msgError = (ELEERRMessage)newmessage;
                flexLog("Putting java beans into the session");
                ses.setAttribute("error", msgError);
            } else
            if(newmessage.getFormatName().equals("EDL114302"))
            {
                try
                {
                    msgHeader = new EDL114302Message();
                }
                catch(Exception ex)
                {
                    flexLog("Error: " + ex);
                }
                msgHeader = (EDL114302Message)newmessage;
                flexLog("Putting java beans into the session");
                ses.setAttribute("chgInfo", msgHeader);
                newmessage = mc.receiveMessage();
                if(newmessage.getFormatName().equals("EDL114301"))
                {
                    try
                    {
                        beanList = new JBList();
                    }
                    catch(Exception ex)
                    {
                        flexLog("Error: " + ex);
                    }
                    boolean firstTime = true;
                    String marker = "";
                    String myFlag = "";
                    StringBuffer myRow = null;
                    String strCpaid = "";
                    String strBkpaid = "";
                    BigDecimal Cpaid = new BigDecimal(0.0D);
                    BigDecimal Bkpaid = new BigDecimal(0.0D);
                    int countCpaid = 0;
                    int countBkpaid = 0;
                    do
                    {
                        msgList = (EDL114301Message)newmessage;
                        marker = msgList.getE01INDOPE();
                        if(marker.equals("*"))
                        {
                            beanList.setShowNext(false);
                            break;
                        }
                        if(firstTime)
                        {
                            firstTime = false;
                            int pos = Integer.parseInt(msgList.getE01NUMREC());
                            beanList.setFirstRec(pos);
                        }
                        if(msgList.getE01INFTYP().equals("1"))
                        {
                            myRow = new StringBuffer("<TR>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01NROPRE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01INIDTE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01LIQDTE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01PERPAG()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01CEDULA()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01NOMBRE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01PROVIN()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01CORREG()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01NFINCA()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01VALTER()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01VALMEJ()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01VALTOT()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01MONPRE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TASREF()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TASPAC()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TRAMOP()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01REGFOR()) + "</TD>");
                            myRow.append("</TR>");
                            beanList.addRow(myFlag, myRow.toString());
                        }
                        if(msgList.getE01INFTYP().equals("2"))
                        {
                            myRow = new StringBuffer("<TR>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01GLMATY()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01GLMATY()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01GLMATY()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01GLMATY()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01NROPRE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01CEDULA()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01NOMBRE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01INIDTE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01LIQDTE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01PERPAG()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01MONPRE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TASREF()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TASPAC()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TRAMOP()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01REGFOR()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01INFTYP()) + "</TD>");
                            myRow.append("</TR>");
                            beanList.addRow(myFlag, myRow.toString());
                        }
                        if(msgList.getE01INFTYP().equals("3"))
                        {
                            myRow = new StringBuffer("<TR>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01NROPRE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01INIDTE()) + "</TD>");
                            myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01LIQDTE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01SALINI()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01SALFIN()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01SALMED()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TASPRO()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01INGREF()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01INGEFE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01DIFEFE()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01LIMTOP()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01DIFTOP()) + "</TD>");
                            myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01MONPRE()) + "</TD>");
                            myRow.append("</TR>");
                            beanList.addRow(myFlag, myRow.toString());
                        }
                        if(marker.equals("+"))
                        {
                            beanList.setShowNext(true);
                            break;
                        }
                        newmessage = mc.receiveMessage();
                    } while(true);
                    userPO.setHeader19(Util.fcolorCCY(Cpaid.toString()));
                    userPO.setHeader20(Util.fcolorCCY(Bkpaid.toString()));
                    userPO.setHeader21(msgList.getE01ENDBAL());
                    userPO.setHeader22(countCpaid + "");
                    userPO.setHeader23(countBkpaid + "");
                    flexLog("Putting java beans into the session");
                    ses.setAttribute("userPO", userPO);
                    ses.setAttribute("chgList", beanList);
                    try
                    {
                        flexLog("About to call Page: " + LangPath + "EDL1143_chg_list_print.jsp");
                        callPage(LangPath + "EDL1143_chg_list_print.jsp", req, res);
                    }
                    catch(Exception e)
                    {
                        flexLog("Exception calling page " + e);
                    }
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            flexLog("Error: " + e);
            throw new RuntimeException("Socket Communication Error");
        }
    }

    protected void procReqSelection(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
        throws ServletException, IOException
    {
        ELEERRMessage msgError = null;
        UserPos userPO = null;
        try
        {
            msgError = new ELEERRMessage();
            userPO = new UserPos();
            userPO.setOption("GL");
            userPO.setPurpose("STATEMENT");
            ses.setAttribute("error", msgError);
            ses.setAttribute("userPO", userPO);
        }
        catch(Exception ex)
        {
            flexLog("Error: " + ex);
        }
        try
        {
            flexLog("About to call Page: " + LangPath + "EDL1143_chg_selection.jsp");
            callPage(LangPath + "EDL1143_chg_selection.jsp", req, res);
        }
        catch(Exception e)
        {
            flexLog("Exception calling page " + e);
        }
    }

    public void service(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        MessageContext mc = null;
        ESS0030DSMessage msgUser = null;
        HttpSession session = null;
        session = req.getSession(false);
        if(session == null)
        {
            try
            {
                res.setContentType("text/html");
                printLogInAgain(res.getWriter());
            }
            catch(Exception e)
            {
                e.printStackTrace();
                flexLog("Exception ocurred. Exception = " + e);
            }
        } else
        {
            int screen = 100;
            try
            {
                msgUser = (ESS0030DSMessage)session.getAttribute("currUser");
                LangPath = SuperServlet.rootPath + msgUser.getE01LAN() + "/";
                try
                {
                    flexLog("Opennig Socket Connection");
                    mc = new MessageContext(super.getMessageHandler("EDL1143", req));
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
                    case 1: // '\001'
                        procReqList(mc, msgUser, req, res, session);
                        break;

                    case 3: // '\003'
                        procReqPrintList(mc, msgUser, req, res, session);
                        break;

                    case 100: // 'd'
                        procReqSelection(msgUser, req, res, session);
                        break;

                    case 200: 
                        procActionSelection(mc, msgUser, req, res, session);
                        break;

                    default:
                        res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.devPage);
                        break;
                    }
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                    int sck = SuperServlet.getInitSocket(req) + 1;
                    flexLog("Socket not Open(Port " + sck + "). Error: " + e);
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

    protected static final int R_LIST = 1;
    protected static final int R_PRINT = 3;
    protected static final int R_SELECTION = 100;
    protected static final int A_SELECTION = 200;
    protected String LangPath;
}

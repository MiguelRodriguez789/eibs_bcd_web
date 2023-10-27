/*
 * Created on Jun 12, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.approval;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import datapro.eibs.beans.EDC014001Message;
import datapro.eibs.beans.EDC014002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 * Comercial Letter Of Credit Maintenance
 */
public class JSEDC0140 extends SuperServlet {

    String LangPath = "s/";

    public JSEDC0140() {
        super();
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null) {
            try {
                res.setContentType("text/html");
                super.printLogInAgain(res.getWriter());
            } catch (Exception e) {
                e.printStackTrace();
                flexLog("Exception ocurred. Exception = " + e);
            }
        } else {
            int screen = -1;

            ESS0030DSMessage user = (datapro.eibs.beans.ESS0030DSMessage) session.getAttribute("currUser");
            // Here we should get the path from the user profile
            LangPath = SuperServlet.rootPath + user.getE01LAN() + "/";

            MessageContext mc = null;
            try {
                mc = new MessageContext(super.getMessageHandler("EDC0140", req));

                try {
                    screen = Integer.parseInt(req.getParameter("SCREEN"));
                    flexLog("Screen  Number: " + screen);
                } catch (Exception e) {
                    flexLog("Screen set to default value");
                }

                String PageToCall = "";

                switch (screen) {
                    case 5 :
                    case 15 :
                        procReqApprovalList(mc, user, req, res, screen);
                        break;
                    case 7 :
                        procInquiryPayment(mc, user, req, res, screen);
                        break;
                    case 8:
                        procInquiryPaymentHis(mc, user, req, res, screen);
                        break;	
                    case 9 :
                        procPaymentRejectApproval(mc, user, req, res, screen);
                        break;
                    default :
                        PageToCall = "MISC_not_available.jsp";
                    callPage(PageToCall, req, res);
                    break;
                }

            } catch (Exception e) {
                e.printStackTrace();
                flexLog("Error: " + e);
                res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.sckNotRespondPage);
            } finally {
                if (mc != null) {
                    mc.close();
                }
                flexLog("Socket used by JSEDC0140 closed.");
            }
        }	
    }

    /**
     * @param req
     * @param res
     * @param screen
     * @throws ServletException 
     */
    private void procPaymentRejectApproval(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        UserPos userPO = getUserPos(req);

        String PageToCall = "EDC0140_payments_list.jsp";
        try {
            MessageProcessor msgHandle = new MessageProcessor(mc);
            EDC014001Message msg01 = (EDC014001Message) msgHandle.getMessageRecord("EDC014001");
            msg01.setH01USERID(user.getH01USR());
            msg01.setH01OPECOD("0009");
            try {
                msg01.setE01DCMACC(req.getParameter("E01DCMACC").trim());
			} catch (Exception e) {
				msg01.setE01DCMACC("0");
			}
            try {
                msg01.setE01PMTNUM(req.getParameter("E01PMTNUM").trim());
			} catch (Exception e) {
				msg01.setE01PMTNUM("0");
			}
            try {
                msg01.setH01FLGWK1(req.getParameter("E02ACTION").trim());
			} catch (Exception e) {
	            msg01.setH01FLGWK1("");
			}
            try {
                msg01.setE01MSGTXT(req.getParameter("reason").trim());
			} catch (Exception e) {
	            msg01.setE01MSGTXT("");
			}
            msgHandle.sendMessage(msg01);
            MessageRecord msgError = msgHandle.receiveMessageRecord();
            if (!msgHandle.hasError(msgError)) {
                procReqApprovalList(mc, user, req, res, screen);	
            } else {
                session.setAttribute("error", msgError);
                session.setAttribute("userPO", userPO);
                session.setAttribute("msg01", msg01);
                callPage(PageToCall, req, res);
            }

        } catch (Exception e) {
            throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
        }
    }

    /**
     * @param req
     * @param res
     * @param screen
     * @throws ServletException 
     */
    private void procInquiryPayment(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        UserPos userPO = getUserPos(req);

        String PageToCall = "EDC0140_coll_payment_inquiry.jsp";
        try {
            MessageProcessor msgHandle = new MessageProcessor(mc);
            EDC014001Message msg01 = (EDC014001Message) msgHandle.getMessageRecord("EDC014001");
            msg01.setH01USERID(user.getH01USR());
            msg01.setH01OPECOD("0002");
            msg01.setE01DCMACC(req.getParameter("E01DCMACC") == null ? "" : req.getParameter("E01DCMACC").trim());
            userPO.setAccNum(msg01.getE01DCMACC());
            msg01.setE01PMTNUM(req.getParameter("E01PMTNUM") == null ? "" : req.getParameter("E01PMTNUM").trim());
            msg01.setE01DCMACD(req.getParameter("E01DCMACD") == null ? "" : req.getParameter("E01DCMACD").trim());
            userPO.setType(msg01.getE01DCMACD());
            
            msg01.setE01PRINUM(req.getParameter("E01PRINUM") == null ? "" : req.getParameter("E01PRINUM").trim());
            userPO.setHeader10(msg01.getE01PRINUM());
            
			userPO.setApplicationCode(msg01.getE01DCMACD());
			userPO.setIdentifier(msg01.getE01DCMACC());
 
            msgHandle.sendMessage(msg01);
            
            MessageRecord msgError = msgHandle.receiveMessageRecord();
            if (!msgHandle.hasError(msgError)) {
                //Receive General Data
                msg01 = (EDC014001Message) msgHandle.receiveMessageRecord("EDC014001");
                session.setAttribute("msg01", msg01);                
                
                //Receive Transaction Data
                JBObjList list = msgHandle.receiveMessageRecordList("H02FLGMAS");
                session.setAttribute("msg02", list);
                
            }		
            session.setAttribute("error", msgError);
            session.setAttribute("userPO", userPO);
            callPage(PageToCall, req, res);

        } catch (Exception e) {
            throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
        }
    }
    private void procInquiryPaymentHis(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req,
            HttpServletResponse res, int screen) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        UserPos userPO = getUserPos(req);

        String PageToCall = "EDC0140_coll_payment_inquiryHIS.jsp";
        try {
            MessageProcessor msgHandle = new MessageProcessor(mc);
            EDC014001Message msg01 = (EDC014001Message) msgHandle.getMessageRecord("EDC014001");
            msg01.setH01USERID(user.getH01USR());
            msg01.setH01OPECOD("0002");
            msg01.setE01DCMACC(req.getParameter("E02DCLACC") == null ? "" : req.getParameter("E02DCLACC").trim());
            msg01.setE01PMTNUM(req.getParameter("E02DCLTNO") == null ? "" : req.getParameter("E02DCLTNO").trim());
            msg01.setH01FLGWK3("H");
            msgHandle.sendMessage(msg01);
            MessageRecord msgError = msgHandle.receiveMessageRecord();
            if (!msgHandle.hasError(msgError)) {
                // Receive General Data
                msg01 = (EDC014001Message) msgHandle.receiveMessageRecord("EDC014001");
                session.setAttribute("msg01", msg01);

                userPO.setHeader1(req.getParameter("E01DSCTTP"));
                userPO.setHeader2(req.getParameter("E01DCMOPR"));
                try {
                    userPO.setHeader3(Util.formatCustomDate(user.getE01DTF(), req.getParameter("E01DCMTDM"), req.getParameter("E01DCMTDD"), req
                            .getParameter("E01DCMTDY"))
                            + " " + Util.formatTime(req.getParameter("E01DCMTTM")));
                } catch (Exception e) {
                }
                userPO.setHeader4(req.getParameter("E01APPREJ"));
                userPO.setHeader5(req.getParameter("E01DCMSUP"));
                try {
                    userPO.setHeader6(Util.formatCustomDate(user.getE01DTF(), req.getParameter("E01DCMADM"), req.getParameter("E01DCMADD"), req
                            .getParameter("E01DCMADY"))
                            + " " + Util.formatTime(req.getParameter("E01DCMATM")));
                } catch (Exception e) {
                }

                userPO.setType(msg01.getE01DCMTYP());
                // Receive Transaction Data
                EDC014002Message msg02 = (EDC014002Message) msgHandle.receiveMessageRecord("EDC014002");
                session.setAttribute("msg02", msg02);

            }
            session.setAttribute("error", msgError);
            session.setAttribute("userPO", userPO);
            callPage(PageToCall, req, res);

        } catch (Exception e) {
            throw new ServletException(e.getClass().getName() + " --> " + e.getMessage(), e);
        }
    }
    /**
     * @param req
     * @param res
     * @param screen
     * @throws ServletException 
     */
    private void procReqApprovalList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        UserPos userPO = getUserPos(req);
        String PageToCall = screen == 15 ? "EDC0140_payments_help_list.jsp" : "EDC0140_payments_list.jsp";
        try {
            MessageProcessor msgHandle = new MessageProcessor(mc);
            EDC014001Message msg01 = (EDC014001Message) msgHandle.getMessageRecord("EDC014001");
            msg01.setH01USERID(user.getH01USR());
            msg01.setH01OPECOD("0015");
            if (screen == 15) {
            	msg01.setH01FLGWK2("M");
            }
            msgHandle.sendMessage(msg01);
            JBObjList jbList = msgHandle.receiveMessageRecordList("H01FLGMAS");
            session.setAttribute("userPO", userPO);
            session.setAttribute("appList", jbList);
            callPage(PageToCall, req, res);

        } catch (Exception e) {
            throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
        }
    }

    @Override
    public void callPage(String page, HttpServletRequest req, HttpServletResponse res) {
        try {
            super.callPage(LangPath + page, req, res);
        } catch (Exception e) {
            flexLog("Exception calling page " + e.toString() + e.getMessage());
        }
        return; 
    }

}

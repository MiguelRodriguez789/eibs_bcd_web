/*
 * Created on Apr 8, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDC006001Message;
import datapro.eibs.beans.EDC006002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageContextHandler;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 * Comercial Letter Of Credit Maintenance
 */
public class JSEDC0060 extends SuperServlet {

    String LangPath = "s/";

    protected static final int R_PAYMENT_ENTER = 1;
    protected static final int R_PAYMENT_DETAIL = 15;
    protected static final int R_PAYMENT = 2;
    protected static final int VALID_PAYMENT = 3;
    protected static final int SAVE_PAYMENT = 4;
    protected static final int R_NEGOTIATION = 5;
    protected static final int A_NEGOTIATION = 6;

    public JSEDC0060() {
        super();
    }

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

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
				 mc = new MessageContext(super.getMessageHandler("EDC0060", req));

                try {
                    screen = Integer.parseInt(req.getParameter("SCREEN"));
                    flexLog("Screen  Number: " + screen);
                } catch (Exception e) {
                    flexLog("Screen set to default value");
                }

                String PageToCall = "";

                switch (screen) {
                    case R_PAYMENT_ENTER :
                        procReqEnterPayment(mc, user, req, res, screen);
                        break;
                    case R_PAYMENT_DETAIL :
                        procReqEnterPaymentDetail(mc, user, req, res, screen);
                        break;	
                    case R_PAYMENT:
                        procReqPayment(mc, user, req, res, screen);
                        break;
                    case R_NEGOTIATION:
                        procReqNegotiation(mc, user, req, res, screen);
                        break;
                    case VALID_PAYMENT:
                        reqValidPayment(mc, user, req, res, screen);
                        break;
                    case SAVE_PAYMENT:
                        reqSavePayment(mc, user, req, res, screen);
                        break;	
                    case A_NEGOTIATION:
                        procValNegotiation(mc, user, req, res, screen);
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
                flexLog("Socket used by JSEDC0060 closed.");
            }
        }	
    }

    /**
     * @param req
     * @param res
     * @param screen
     * @throws ServletException 
     */
    private void reqSavePayment(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        String PageToCall = "";
        UserPos userPO = getUserPos(req);

        try {
            String ACCION = req.getParameter("H02FLGWK1");
			EDC006001Message dcPag = (EDC006001Message) session.getAttribute("dcPag");
			if (!"Y".equals(ACCION)) {
                if (dcPag.getE01DCMTYP().equals("I")) {
                    PageToCall = "EDC0060_coll_enter_detail_incoming.jsp";
                } else {
                    PageToCall = "EDC0060_coll_enter_detail_outgoing.jsp";
                }
			} else {
                MessageContextHandler msgHandle = new MessageContextHandler(mc);
                dcPag = (EDC006001Message) msgHandle.initMessage(dcPag, user.getH01USR(), "0003");
                initTransaction(userPO, String.valueOf(screen), "MAINTENANCE");
                msgHandle.sendMessage(dcPag);
                ELEERRMessage msgError = msgHandle.receiveErrorMessage();
                boolean isNotError = msgError.getERRNUM().equals("0");
                // Receive Data to Confirm
                dcPag = (EDC006001Message) msgHandle.receiveMessage();
                if (isNotError) { // There are no errors 
					if (dcPag.getE01PRIPVI().equals("3") 
							|| dcPag.getE01PRIPVI().equals("5")
							|| dcPag.getE01PRIPVI().equals("7")) {
                        res.sendRedirect(SuperServlet.srctx + "/servlet/datapro.eibs.products.JSEPR0000?SCREEN=0003&REFNUM=" + dcPag.getE01PRINUM());
                        return;
                    } else {
                        PageToCall = "EDC0060_coll_enter_maint.jsp";
                    }
                } else {
                    PageToCall = "EDC0060_coll_payment_conf.jsp";
                }
                session.setAttribute("dcPag", dcPag);
                putDataInSession(session, userPO, msgError);
            }
            callPage(PageToCall, req, res);

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
    private void reqValidPayment(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        String PageToCall = "";
        UserPos userPO = getUserPos(req);

        try {
            MessageContextHandler msgHandle = new MessageContextHandler(mc);
            EDC006001Message dcPag = (EDC006001Message)	session.getAttribute("dcPag");  
            dcPag.setH01USERID(user.getH01USR());
            dcPag.setH01TIMSYS(SuperServlet.getTimeStamp());
            dcPag.setH01SCRCOD("01");
            dcPag.setH01OPECOD("0005");
            initTransaction(userPO, String.valueOf(screen), "MAINTENANCE");
            msgHandle.setFieldsFromPage(req, dcPag);
            msgHandle.sendMessage(dcPag);
            ELEERRMessage msgError = msgHandle.receiveErrorMessage();
            boolean isNotError = msgError.getERRNUM().equals("0");
            // Receive Data to Confirm
            dcPag = (EDC006001Message) msgHandle.receiveMessage();
            if (isNotError) { // There are no errors 
                // Receive Transaction
                JBObjList list = msgHandle.receiveMessageList("H02FLGMAS");
                session.setAttribute("rcPag", list);
                PageToCall = "EDC0060_coll_payment_conf.jsp";
            } else {
                if (dcPag.getE01DCMTYP().equals("I")) {
                    PageToCall = "EDC0060_coll_enter_detail_incoming.jsp";
            } else {
                    PageToCall = "EDC0060_coll_enter_detail_outgoing.jsp";
                }
			}
			session.setAttribute("dcPag", dcPag);
            putDataInSession(session, userPO, msgError);
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
    private void procReqPayment(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        String PageToCall = "";
        UserPos userPO = getUserPos(req);

        try {
            MessageContextHandler msgHandle = new MessageContextHandler(mc);
            EDC006001Message dcPag = (EDC006001Message)  msgHandle.initMessage("EDC006001", user.getH01USR(), "0002");
            initTransaction(userPO, String.valueOf(screen), "MAINTENANCE");
            dcPag.setH01SCRCOD("01");
            msgHandle.setFieldsFromPage(req, dcPag);
            msgHandle.sendMessage(dcPag);
            ELEERRMessage msgError = msgHandle.receiveErrorMessage();
            boolean isNotError = msgError.getERRNUM().equals("0");
            dcPag = (EDC006001Message) msgHandle.receiveMessage();
            session.setAttribute("dcPag", dcPag);
            putDataInSession(session, userPO, msgError);
            if (isNotError) { // There are no errors 
                PageToCall = "EDC0060_coll_payment.jsp";
            } else {
                if (dcPag.getE01DCMTYP().equals("I")) {
                    PageToCall = "EDC0060_coll_enter_detail_incoming.jsp";
                } else {
                    PageToCall = "EDC0060_coll_enter_detail_outgoing.jsp";				
                }
            }
            callPage(PageToCall, req, res);

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
    private void procReqNegotiation(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        UserPos userPO = getUserPos(req);
        initTransaction(userPO, String.valueOf(screen), "MAINTENANCE");
        String PageToCall = "EDC0060_coll_nego_enter_maint.jsp";
        userPO.setPrevPage(PageToCall);
        putDataInSession(session, userPO, null);	
        callPage(PageToCall, req, res);
    }	

    /**
     * @param req
     * @param res
     * @param screen
     * @throws ServletException 
     */
    private void procValNegotiation(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        String PageToCall = "";
        UserPos userPO = getUserPos(req);

        try {
            MessageContextHandler msgHandle = new MessageContextHandler(mc);
            EDC006001Message dcPag = (EDC006001Message)  msgHandle.initMessage("EDC006001", user.getH01USR(), "0006");
            initTransaction(userPO, String.valueOf(screen), "MAINTENANCE");
            dcPag.setH01SCRCOD("01");
            msgHandle.setFieldsFromPage(req, dcPag);
            msgHandle.sendMessage(dcPag);
            ELEERRMessage msgError = msgHandle.receiveErrorMessage();
            boolean isNotError = msgError.getERRNUM().equals("0");
            dcPag = (EDC006001Message) msgHandle.receiveMessage();
            session.setAttribute("dcPag", dcPag);
            putDataInSession(session, userPO, msgError);
            if (isNotError) { // There are no errors
                if (dcPag.getE01DCMTYP().equals("I")) {
                    PageToCall = "EDC0060_coll_nego_enter_detail_incoming.jsp";
                } else {
                    PageToCall = "EDC0060_coll_nego_enter_detail_outgoing.jsp";
                }
            } else {
                PageToCall = "EDC0060_coll_nego_enter_maint.jsp";
            }
            callPage(PageToCall, req, res);

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
    private void procReqEnterPayment(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        UserPos userPO = getUserPos(req);

        try {
            MessageContextHandler msgHandle = new MessageContextHandler(mc);
            EDC006001Message dcPag = (EDC006001Message)  msgHandle.initMessage("EDC006001", user.getH01USR(), "");
            String PageToCall = "EDC0060_coll_enter_maint.jsp";
            initTransaction(userPO, String.valueOf(screen), "MAINTENANCE");
            session.setAttribute("dcPag", dcPag);
            putDataInSession(session, userPO, null);
            callPage(PageToCall, req, res);
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
    private void procReqEnterPaymentDetail(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {

        HttpSession session = req.getSession(false);
        String PageToCall = "";
        UserPos userPO = getUserPos(req);

        try {
            MessageContextHandler msgHandle = new MessageContextHandler(mc);
            EDC006001Message dcPag = (EDC006001Message)  msgHandle.initMessage("EDC006001", user.getH01USR(), "0001");
            initTransaction(userPO, String.valueOf(screen), "MAINTENANCE");
            dcPag.setH01SCRCOD("01");
            msgHandle.setFieldsFromPage(req, dcPag);
            msgHandle.sendMessage(dcPag);
            ELEERRMessage msgError = msgHandle.receiveErrorMessage();
            boolean isNotError = msgError.getERRNUM().equals("0");
            dcPag = (EDC006001Message) msgHandle.receiveMessage();
            session.setAttribute("dcPag", dcPag);
            putDataInSession(session, userPO, msgError);
            if (isNotError) { // There are no errors
                if (dcPag.getE01DCMTYP().equals("I")) {
                    PageToCall = "EDC0060_coll_enter_detail_incoming.jsp";
                } else {
                    PageToCall = "EDC0060_coll_enter_detail_outgoing.jsp";
                }
            } else {
                PageToCall = "EDC0060_coll_enter_maint.jsp";
            }
            callPage(PageToCall, req, res);

        } catch (Exception e) {
            throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
        }		
    }	

    private void initTransaction(UserPos userPO, String optMenu, String purpose) {
        if (!optMenu.equals("")) {
            userPO.setOption(optMenu);
        }
        if (!purpose.equals("")) {
            userPO.setPurpose(purpose);
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

    private void putDataInSession(HttpSession session, UserPos userPO, ELEERRMessage msgError) {
        flexLog("Putting java beans into the session");
        if (msgError == null) {
            msgError = new ELEERRMessage(); 
        }
        session.setAttribute("error", msgError);
        if(userPO == null) {
            userPO = new UserPos();
        }
        session.setAttribute("userPO", userPO);
    }


}
package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (6/28/12 6:30:23 PM)
 * @author: Luis Crosby
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC065001Message;
import datapro.eibs.beans.ELC065002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSELC0650 extends JSEIBSServlet {

    protected static final int R_SEARCH = 1;
    protected static final int A_SEARCH = 2;
    protected static final int R_MAINT = 103;
    protected static final int R_INQ = 106;
    protected static final int A_MAINT = 200;
    protected static final int R_APPROVAL = 7;
    protected static final int R_APPROVAL_COLL = 9;

    protected void processRequest(ESS0030DSMessage user,
            HttpServletRequest req, HttpServletResponse res,
            HttpSession session, int screen) throws ServletException,
            IOException {
        switch (screen) {
            case R_SEARCH:
                procReqSearch(user, req, res, session);
                break;
            case A_SEARCH:
                procActionSearch(user, req, res, session, screen);
                // procReqCollSearch(user, req, res, session, screen);
                break;
            case R_MAINT:
            case R_INQ:
                procReqMaint(user, req, res, session, screen);
                break;
            case A_MAINT:
                procActionMaintenance(user, req, res, session, screen);
                break;			
        }
    }

    /**
     * LCrosby
     */
    private void procReqSearch(ESS0030DSMessage user, HttpServletRequest req,
            HttpServletResponse res, HttpSession ses) throws ServletException {
        String PageToCall = "";
        try {
            PageToCall = "ELC0650_sc_prod_enter.jsp";
            callPage(getLangPath(req, res) + PageToCall, req, res);

        } catch (Exception e) {
            throw new ServletException(e.getClass().getName() + " --> "
                    + e.getMessage());
        }
    }

    /**
     * LCrosby
     */
    protected void procActionSearch(ESS0030DSMessage user,
            HttpServletRequest req, HttpServletResponse res,
            HttpSession session, int screen) throws ServletException,
            IOException {

        UserPos userPO = (datapro.eibs.beans.UserPos) session
        .getAttribute("userPO");

        MessageProcessor mp = null;

        try {
            mp = getMessageProcessor("ELC0650", req);

            ELC065001Message msgList = (ELC065001Message) mp.getMessageRecord(
                    "ELC065001", user.getH01USR(), "0015");
            msgList.setH01OPECOD("0015");
            msgList.setH01USERID(user.getH01USR());
            setMessageRecord(req, msgList);
            msgList.setH01FLGWK1("1");

            userPO.setAccNum(msgList.getE01LCAATY());

            mp.sendMessage(msgList);

            ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
            JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

            if (mp.hasError(list)) {
                session.setAttribute("error", mp.getError(list));
                forward("error_viewer.jsp", req, res);
            } else {
                session.setAttribute("userPO", userPO);
                session.setAttribute("jbList", list);

                if ((screen == JSELC0650.R_APPROVAL) || (screen == JSELC0650.R_APPROVAL_COLL)) {
                    forwardOnSuccess("ELC0650_sc_prod_approval_list.jsp", req,
                            res);
                } else {
                    forwardOnSuccess("ELC0650_sc_prod_list.jsp", req, res);
                }
            }

        } finally {
            if (mp != null) {
                mp.close();
            }
        }
    }

    /**
     * LCrosby
     */
    protected void procReqMaint(ESS0030DSMessage user, HttpServletRequest req,
            HttpServletResponse res, HttpSession session, int screen)
    throws ServletException, IOException {

        UserPos userPO = (datapro.eibs.beans.UserPos) session
        .getAttribute("userPO");

        MessageProcessor mp = null;
        try {
            mp = getMessageProcessor("ELC0650", req);

            ELC065002Message msg = (ELC065002Message) mp.getMessageRecord(
                    "ELC065002", user.getH01USR(), "0002");
            msg.setH02FLGWK1("1");
            if (screen == JSELC0650.R_MAINT) {
                userPO.setPurpose("MAINT");
            } else {
                userPO.setPurpose("INQUIRY");
            }

            setMessageRecord(req, msg);
            msg.setE02LCABNK(req.getParameter("BNK") == null ? "" : req.getParameter("BNK").trim());
            msg.setE02LCATAR(req.getParameter("STN") == null ? "" : req.getParameter("STN").trim());
            msg.setE02LCAATY(req.getParameter("ATY") == null ? "" : req.getParameter("ATY").trim());
            msg.setE02LCACUN(req.getParameter("CUN") == null ? "" : req.getParameter("CUN").trim());

            mp.sendMessage(msg);

            ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
            msg = (ELC065002Message) mp.receiveMessageRecord();

            session.setAttribute("error", msgError);
            session.setAttribute("userPO", userPO);
            session.setAttribute("lnParam", msg);

            forward("ELC0650_sc_maint.jsp", req, res);

        } finally {
            if (mp != null) {
                mp.close();
            }
        }
    }


    /**
     * LCrosby
     */
    protected void procActionMaintenance(ESS0030DSMessage user,
            HttpServletRequest req, HttpServletResponse res,
            HttpSession session, int screen) throws ServletException,
            IOException {

        UserPos userPO = (datapro.eibs.beans.UserPos) session
        .getAttribute("userPO");
        MessageProcessor mp = null;

        try {
            mp = getMessageProcessor("ELC0650", req);

            ELC065002Message msg = (ELC065002Message) mp.getMessageRecord(
                    "ELC065002", user.getH01USR(), "0005");

            setMessageRecord(req, msg);

            String bank = msg.getE02LCABNK();
            String id = msg.getE02LCAATY();

            msg.setH02FLGWK1("1");

            userPO.setAccNum(msg.getE02LCAATY());

            mp.sendMessage(msg);

            ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();


            boolean isNotError = msgError.getERRNUM().equals("0");
            msg = (ELC065002Message) mp.receiveMessageRecord();

            if (isNotError) {
                ELC065001Message msgList = (ELC065001Message) mp.getMessageRecord(
                        "ELC065001", user.getH01USR(), "0015");

                msgList.setH01FLGWK1("1");
                msgList.setE01LCABNK(bank);
                msgList.setE01LCAATY(id);
                userPO.setAccNum(id);

                mp.sendMessage(msgList);

                msgError = (ELEERRMessage) mp.receiveMessageRecord();
                JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

                if (mp.hasError(list)) {
                    session.setAttribute("error", mp.getError(list));
                    forward("error_viewer.jsp", req, res);
                } else {
                    session.setAttribute("userPO", userPO);
                    session.setAttribute("jbList", list);

                    if ((screen == JSELC0650.R_APPROVAL) || (screen == JSELC0650.R_APPROVAL_COLL)) {
                        forwardOnSuccess("ELC0650_sc_prod_approval_list.jsp", req,
                                res);
                    } else {
                        forwardOnSuccess("ELC0650_sc_prod_list.jsp", req, res);
                    }
                }
            } else {
                session.setAttribute("error", msgError);
                session.setAttribute("userPO", userPO);
                session.setAttribute("lnParam", msg);
                forward("ELC0650_sc_maint.jsp", req, res);
            }			

        } finally {
            if (mp != null) {
                mp.close();
            }
        }			
    }	
}
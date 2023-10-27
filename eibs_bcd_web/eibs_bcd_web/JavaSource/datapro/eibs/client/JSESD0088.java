package datapro.eibs.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD008801Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSESD0088 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen) throws ServletException,
			IOException {

        switch(screen) {
		
		case 100: // Request Portfolio Maintenance Selection Screen
			procReqEnter(user, req, res, ses);
			break;
			
		case 200: // Submit Selection and Shows Basic Screen 
			procActionReqEnter(user, req, res, ses);
			break;
			
        case 300: // Submit Maintenance 
			procActionMaintenance(user, req, res, ses);
			break;
		case 500:   // Portfolio Inquiry
		case 501:	// Portfolio Inquiry for Approval
		case 502:	// Portfolio Inquiry from Customer Position
			proInqDetail(user, req, res, ses, screen);
			break;
        default:
            forward(devPage, req, res);
            break;

        }
	}

	private void proInqDetail(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("INQUIRY");
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0088", req);
			ESD008801Message msg = (ESD008801Message) mp.getMessageRecord("ESD008801");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0088");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0003");
			
			msg.setE01PRFNUM(userPO.getCusNum());
			msg.setE01PRFCUN(userPO.getIdentifier());
			
			if (screen == 502) {
				msg.setE01PRFCUN("0");	
				msg.setE01PRFNUM((req.getParameter("PORTFOLIO") == null ? "0" : req.getParameter("PORTFOLIO")));
			} else if (screen == 501) {
				msg.setH01OPECOD("0002"); 
				userPO.setPurpose("APPROVAL");
				msg.setE01PRFCUN((req.getParameter("CUSTOMER") == null ? "0" : req.getParameter("CUSTOMER")));
				msg.setE01PRFNUM((req.getParameter("PORTFOLIO") == null ? "0" : req.getParameter("PORTFOLIO")));
			}
			userPO.setCusNum(msg.getE01PRFNUM());
			userPO.setIdentifier(msg.getE01PRFCUN());
			userPO.setHeader10("Q");
			userPO.setCusType("P");	// Portfolio Account				

			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg = (ESD008801Message) mp.receiveMessageRecord("ESD008801");

			if (mp.hasError(msgError)) {
				ses.setAttribute("error", msgError);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSEWD0300?SCREEN=100" + "&CODE=" + msg.getE01PRFNUM() + "&CUSTOMER=" + msg.getE01PRFCUN());
			} else {
				userPO.setHeader3(msg.getE01PRFDSC());
				ses.setAttribute("cusPort", msg);
				ses.setAttribute("userPO", userPO);

				forward("ESD0088_cus_port_basic.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0088", req);
			ESD008801Message msg = (ESD008801Message) ses.getAttribute("cusPort");
            msg.setH01USERID(user.getH01USR());
            msg.setH01PROGRM("ESD0088");
            msg.setH01TIMSYS(getTimeStamp());
            msg.setH01SCRCOD("01");
            msg.setH01OPECOD("0005");
            
            setMessageRecord(req, msg);

			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg = (ESD008801Message) mp.receiveMessageRecord("ESD008801");

			if (mp.hasError(msgError)) {
				pageName = "ESD0088_cus_port_basic.jsp";
			} else {
				if ("NEW".equals(userPO.getPurpose())) {
                    userPO.setPurpose("MAINTENANCE");
                    userPO.setCusNum(msg.getE01PRFNUM());
                    userPO.setIdentifier(msg.getE01PRFCUN());
                    userPO.setHeader1(msg.getE01PRFCUN());
                    userPO.setHeader2(msg.getE01PRFNUM());
                    userPO.setHeader10("Q");
					pageName = "ESD0088_cus_port_basic.jsp";
				} else {
					pageName = "ESD0088_cus_enter_port_new.jsp";
				}
			}

			ses.setAttribute("error", msgError);
			ses.setAttribute("cusPort", msg);
			ses.setAttribute("userPO", userPO);
			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionReqEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		String opCode = "0002";
		try {
			opCode = req.getParameter("OPCODE").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0088", req);
			ESD008801Message msg = (ESD008801Message) mp.getMessageRecord("ESD008801");
            msg.setH01USERID(user.getH01USR());
            msg.setH01PROGRM("ESD0088");
            msg.setH01TIMSYS(getTimeStamp());
            msg.setH01SCRCOD("01");
            msg.setH01OPECOD(opCode);
            msg.setE01PRFCUN((req.getParameter("E01PRFCUN") == null ? userPO.getIdentifier() : req.getParameter("E01PRFCUN")));
			msg.setE01PRFNUM((req.getParameter("E01PRFNUM") == null ? userPO.getCusNum() : req.getParameter("E01PRFNUM")));
			msg.setD01CUSNA1((req.getParameter("D01CUSNA1") == null ? " ": req.getParameter("D01CUSNA1")));
      
			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg = (ESD008801Message) mp.receiveMessageRecord("ESD008801");

			if (mp.hasError(msgError)) {
				pageName = "ESD0088_cus_enter_port_new.jsp";
			} else {
                if(opCode.equals("0001") || msg.getH01OPECOD().equals("0001")) {
                    userPO.setPurpose("NEW");
                } else {
                    userPO.setPurpose("MAINTENANCE");
                    userPO.setCusNum(msg.getE01PRFNUM());
                    userPO.setIdentifier(msg.getE01PRFCUN());
                    userPO.setHeader1(msg.getE01PRFCUN());
                    userPO.setHeader2(msg.getE01PRFNUM());
					userPO.setHeader3(msg.getE01PRFDSC());
					userPO.setCusType("P");
					userPO.setHeader10("Q");
                }
				pageName = "ESD0088_cus_port_basic.jsp";
			}

			ses.setAttribute("error", msgError);
			ses.setAttribute("cusPort", msg);
			ses.setAttribute("userPO", userPO);
			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setOption("PR");
		
		forward("ESD0088_cus_enter_port_new.jsp", req, res);
	}

}

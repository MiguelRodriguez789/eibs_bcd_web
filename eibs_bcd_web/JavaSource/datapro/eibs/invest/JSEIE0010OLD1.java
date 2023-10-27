package datapro.eibs.invest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EIE001001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEIE0010OLD1 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen) {
		
		case 1: // Investment Profile - Maintenance
			procActionReqEnter(user, req, res, session);
			break;
			
        case 300: // Submit Maintenance 
			procActionMaintenance(user, req, res, session);
			break;
		case 500:   // Portfolio Inquiry
		case 501:	// Portfolio Inquiry for Approval
			proInqDetail(user, req, res, session, screen);
			break;
        default:
            forward(devPage, req, res);
            break;

        }
	}

	private void proInqDetail(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("INQUIRY");
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EIE0010", req);
			EIE001001Message msgPortfolio = (EIE001001Message) mp.getMessageRecord("EIE001001");
			msgPortfolio.setH01USERID(user.getH01USR());
			msgPortfolio.setH01PROGRM("EIE0010");
			msgPortfolio.setH01TIMSYS(getTimeStamp());
			msgPortfolio.setH01SCRCOD("01");
			msgPortfolio.setH01OPECOD("0003");
			
			msgPortfolio.setE01PRFCUN(userPO.getCusNum());
			msgPortfolio.setE01PRFNUM(userPO.getIdentifier());
			
			if (screen == 502) {
				msgPortfolio.setE01PRFCUN("0");	
				try {
					msgPortfolio.setE01PRFNUM(req.getParameter("PORTFOLIO").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
			} else if (screen == 501) {
				msgPortfolio.setH01OPECOD("0002"); 
				userPO.setPurpose("APPROVAL");
				try {
					msgPortfolio.setE01PRFCUN(req.getParameter("CUSTOMER").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgPortfolio.setE01PRFNUM(req.getParameter("PORTFOLIO").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			userPO.setCusNum(msgPortfolio.getE01PRFCUN());
			userPO.setIdentifier(msgPortfolio.getE01PRFNUM());
			userPO.setCusType("P");	// Portfolio Account				

			mp.sendMessage(msgPortfolio);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgPortfolio = (EIE001001Message) mp.receiveMessageRecord("EIE001001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSEWD0300?SCREEN=100" + "&CODE=" + msgPortfolio.getE01PRFNUM() + "&CUSTOMER=" + msgPortfolio.getE01PRFCUN());
			} else {
				userPO.setHeader3(msgPortfolio.getE01PRFDSC());
				session.setAttribute("cusPort", msgPortfolio);

				forward("EIE0010_cus_port_basic.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EIE0010", req);
			EIE001001Message msgPortfolio = (EIE001001Message) session.getAttribute("cusPort");
            msgPortfolio.setH01USERID(user.getH01USR());
            msgPortfolio.setH01PROGRM("EIE0010");
            msgPortfolio.setH01TIMSYS(getTimeStamp());
            msgPortfolio.setH01SCRCOD("01");
            msgPortfolio.setH01OPECOD("0005");
            
            setMessageRecord(req, msgPortfolio);

			mp.sendMessage(msgPortfolio);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgPortfolio = (EIE001001Message) mp.receiveMessageRecord("EIE001001");

			if (mp.hasError(msgError)) {
				pageName = "EIE0010_cus_port_basic.jsp";
			} else {
				if ("NEW".equals(userPO.getPurpose())) {
                    userPO.setPurpose("MAINTENANCE");
                    userPO.setCusNum(msgPortfolio.getE01PRFCUN());
                    userPO.setIdentifier(msgPortfolio.getE01PRFNUM());
					pageName = "EIE0010_cus_port_basic.jsp";
				} else {
					pageName = "EIE0010_cus_enter_port_new.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("cusPort", msgPortfolio);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionReqEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setOption("PR");
		String pageName = "";
		String opCode = "0002";
		try {
			opCode = req.getParameter("OPCODE").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EIE0010", req);
			EIE001001Message msgPortfolio = (EIE001001Message) mp.getMessageRecord("EIE001001");
            msgPortfolio.setH01USERID(user.getH01USR());
            msgPortfolio.setH01PROGRM("EIE0010");
            msgPortfolio.setH01TIMSYS(getTimeStamp());
            msgPortfolio.setH01SCRCOD("01");
            msgPortfolio.setH01OPECOD(opCode);
            try {
                msgPortfolio.setE01PRFCUN(req.getParameter("E01PRFCUN").trim());                
            } catch(Exception e) {
				msgPortfolio.setE01PRFCUN(userPO.getCusNum());
            }
            try {
                msgPortfolio.setD01CUSNA1(req.getParameter("D01CUSNA1").trim());
            } catch(Exception e) { 
            	//msgPortfolio.setD01CUSNA1(userPO.getCusName());
            }
            try {
                msgPortfolio.setE01PRFNUM(req.getParameter("E01PRFNUM").trim());
            } catch(Exception e) { 
				msgPortfolio.setE01PRFNUM(userPO.getIdentifier());
            }

			mp.sendMessage(msgPortfolio);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgPortfolio = (EIE001001Message) mp.receiveMessageRecord("EIE001001");

			if (mp.hasError(msgError)) {
				pageName = "EIE0010_cus_enter_port_new.jsp";
			} else {
                if(opCode.equals("0001") 
                		|| msgPortfolio.getH01OPECOD().equals("0001")) {
                    userPO.setPurpose("NEW");
                } else {
                    userPO.setPurpose("MAINTENANCE");
                    userPO.setCusNum(msgPortfolio.getE01PRFCUN());
                    userPO.setIdentifier(msgPortfolio.getE01PRFNUM());
					userPO.setHeader3(msgPortfolio.getE01PRFDSC());
					userPO.setCusType("P");
                }
				pageName = "EIE0010_cus_port_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("cusPort", msgPortfolio);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}
package datapro.eibs.products;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL013001Message;
import datapro.eibs.beans.EDL013009Message;
import datapro.eibs.beans.EDL016001Message;
import datapro.eibs.beans.EFT000010Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEXEDL0130 extends JSEDL0130 {

	protected void procReqEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("INQUIRY");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDL0130?SCREEN=600");
		userPO.setProdCode("CD");
			//Others Parameters
		userPO.setHeader1("E01DEAACC");
		userPO.setHeader2("H01FLGWK2");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("GENERIC_account_enter.jsp", req, res);
	}

	protected void procActionEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL016001Message msgCD = (EDL016001Message) mp.getMessageRecord("EDL016001");
		 	msgCD.setH01USERID(user.getH01USR());
		 	msgCD.setH01PROGRM("EDL0160");
			flexLog("header 4 timestamp = " + getTimeStamp());
		 	msgCD.setH01TIMSYS(getTimeStamp());
		 	msgCD.setH01SCRCOD("01");
		 	msgCD.setH01OPECOD("0002");
		 	msgCD.setE01DEAACD("11");
			try {
				msgCD.setE01DEAACC(req.getParameter("E01DEAACC").trim());
			} catch (Exception e) {
				msgCD.setE01DEAACC("0");
			}

			mp.sendMessage(msgCD);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "GENERIC_account_enter.jsp";
			} else {
				msgCD = (EDL016001Message) msg;
				userPO.setAccNum(msgCD.getE01DEAACC());
				userPO.setBank(msgCD.getE01DEABNK());
				userPO.setBranch(msgCD.getE01DEABRN());
				userPO.setProdCode(msgCD.getE01DEAPRO());
				userPO.setCusNum(msgCD.getE01DEACUN());
				userPO.setCusName(msgCD.getE01CUSNA1());
				userPO.setCurrency(msgCD.getE01DEACCY());
				userPO.setType(msgCD.getE01DEATYP());
				pageName = "EDL0160_cd_inquiry.jsp";
			}

			session.setAttribute("userPO", userPO);
			session.setAttribute("cdInquiry", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDL0130?SCREEN=500");
		userPO.setProdCode("11");
		//Others Parameters
		userPO.setHeader1("E01DEAACC");
		userPO.setHeader2("H01FLGWK2");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("GENERIC_account_enter.jsp", req, res);
	}

	protected void procReqEnterMaintBono(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			ELEERRMessage msgError = null;
			UserPos userPO = null;
			//EDL013001Message msgCD = null;

			try {

				msgError = new ELEERRMessage();
				userPO = new UserPos();
				userPO.setOption("12");
				userPO.setPurpose("MAINTENANCE");
				userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDL0130?SCREEN=500");
				userPO.setProdCode("12");
				//Others Parameters
				userPO.setHeader1("E01DEAACC");
				userPO.setHeader2("H01FLGWK2");
				//msgCD = new EDL013001Message();
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				//ses.setAttribute("cdMant", msgCD);

			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			try {
				forward("GENERIC_account_enter.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		}
		
	
	
	protected void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String option = userPO.getOption();
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013001Message msgCD = (EDL013001Message) mp.getMessageRecord("EDL013001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("EDL0130");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0002");
			try {
				msgCD.setE01DEAACC(req.getParameter("E01DEAACC").trim());
			} catch (Exception e) {
			}
			try {
				msgCD.setH01FLGWK2(req.getParameter("H01FLGWK2").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013001Message) mp.receiveMessageRecord("EDL013001");

			if (mp.hasError(msgError)) {
				pageName = "GENERIC_account_enter.jsp";
			} else {
				userPO = new UserPos();
				userPO.setOption("CD");
				if (!option.equals(""));
					userPO.setOption(option);
				userPO.setPurpose("MAINTENANCE");						
				userPO.setAccNum(msgCD.getE01DEAACC());
				userPO.setProdCode(msgCD.getE01DEAPRO());
				userPO.setCusNum(msgCD.getE01DEACUN());
				userPO.setCusName(msgCD.getE01CUSNA1());
				userPO.setApplicationCode(msgCD.getE01DEAACD());
				userPO.setCurrency(msgCD.getE01DEACCY());
				userPO.setIdentifier(userPO.getAccNum());
				userPO.setType(msgCD.getE01DEATYP());
				pageName = "EDL0130_cd_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdMant", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String action = req.getParameter("ACTION") == null ? "F" : req.getParameter("ACTION").trim();
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013001Message msgCD = (EDL013001Message) session.getAttribute("cdMant");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("EDL0130");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0005");
			if (action.equals("C"))	{
				msgCD.setH01OPECOD("0006");
			}	
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			MessageRecord newmessage = mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				msgCD = (EDL013001Message) newmessage;
				session.setAttribute("cdMant", msgCD);
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				pageName = "EDL0130_cd_maint.jsp";
				forward(pageName, req, res);
			} else {
				if (newmessage.getFormatName().equals("EDL013009")) {
					EDL013009Message msgCDInt = (EDL013009Message) newmessage;

					userPO.setAccNum(msgCDInt.getE09DEAACC());
					userPO.setProdCode(msgCDInt.getE09DEAPRO());
					userPO.setCurrency(msgCDInt.getE09TRNCCY());
					userPO.setCusName(msgCDInt.getE09CUSNA1());
					userPO.setCusNum(msgCDInt.getE09DEACUN());
					session.setAttribute("cdIntPrep", msgCDInt);
					pageName = "EDL0130_cd_prep_int.jsp";
					forward(pageName, req, res);
				} else if (newmessage.getFormatName().equals("EFT000010")) {
					EFT000010Message msgCDNew = (EFT000010Message) newmessage;
					
					userPO.setAccNum(msgCDNew.getE10DEAACC());
					
					session.setAttribute("cdFinish", msgCDNew);
					pageName = "EDL0130_cd_confirm.jsp";
					forward(pageName, req, res);
				} else if (newmessage.getFormatName().equals("EDL013001")) {
					msgCD = (EDL013001Message) newmessage;
					
					userPO.setAccNum(msgCD.getE01DEAACC());
					
					session.setAttribute("cdMant", msgCD);
					 
					if (!action.equals("C")) {
						if(userPO.getOption().equals("CD"))
							procReqEnterMaint(user, req, res, session);
						else
							procReqEnterMaintBono(user, req, res, session);
					} else {
						pageName = "EDL0130_cd_maint.jsp";
						forward(pageName, req, res);
					}
				}
				
				userPO.setIdentifier(userPO.getAccNum());
				session.setAttribute("userPO", userPO);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}

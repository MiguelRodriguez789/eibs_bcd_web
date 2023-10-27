package datapro.eibs.trade;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import datapro.eibs.beans.EDC000002Message;
import datapro.eibs.beans.EDC001002Message;
import datapro.eibs.beans.EDC011001Message;
import datapro.eibs.beans.EDC011005Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBLCHist;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEDC0110 extends JSELC0450 {
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		//Inquiry Options
		case R_COMMISSIONS_INQ :
			procReqCommissionsInq(user, req, res, session);
			break;
		default :
			super.processRequest(user, req, res, session, screen);	
			break;
		}	
	}		

	private void procReqCommissionsInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("APPROVAL");
		
		String pageName = "";
		ELEERRMessage msgError = null;
		MessageRecord newmsg = null;
		MessageProcessor mp = null;
		try {
			if ("51".equals(userPO.getType())) { //Documentary Collection
    			mp = getMessageProcessor("EDC0000", req);

    			EDC000002Message msg = (EDC000002Message) mp.getMessageRecord("EDC000002");
                msg.setH02USERID(user.getH01USR());
                msg.setH02PROGRM("EDC0000");
                msg.setH02TIMSYS(getTimeStamp());
                msg.setH02SCRCOD("01");
                msg.setH02OPECOD("0004");
                msg.setH02FLGWK1("A");
                msg.setE02DCMACC(userPO.getAccNum());
                msg.setE02DCMPRO(userPO.getProdCode());

				mp.sendMessage(msg);
				msgError = (ELEERRMessage) mp
						.receiveMessageRecord("ELEERR");
				msg = (EDC000002Message) mp.receiveMessageRecord("EDC000002");

				if (mp.hasError(msgError)) {
					pageName = "error_viewer.jsp";
				} else {
					newmsg = msg;
                    pageName = "EDC0110_doc_commissions.jsp";
				}
			} else { //Simple Collection
    			mp = getMessageProcessor("EDC0010", req);

    			EDC001002Message msg = (EDC001002Message) mp.getMessageRecord("EDC001002");
                msg.setH02USERID(user.getH01USR());
                msg.setH02PROGRM("EDC0010");
                msg.setH02TIMSYS(getTimeStamp());
                msg.setH02SCRCOD("01");
                msg.setH02OPECOD("0004");
                msg.setH02FLGWK1("A");
                msg.setE02DCMACC(userPO.getAccNum());
                msg.setE02DCMPRO(userPO.getProdCode());

				mp.sendMessage(msg);
				msgError = (ELEERRMessage) mp
						.receiveMessageRecord("ELEERR");
				msg = (EDC001002Message) mp.receiveMessageRecord("EDC001002");

				if (mp.hasError(msgError)) {
					pageName = "error_viewer.jsp";
				} else {
					newmsg = msg;
					pageName = "EDC0110_sing_commissions.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("dcNew2", newmsg);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procActionEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0110", req);
			EDC011001Message msg = (EDC011001Message) mp.getMessageRecord("EDC011001", user.getH01USR(), "0002");
            msg.setH01SCRCOD("01");
            msg.setE01DCMACD("DC");
            try {
                msg.setE01DCMACC(req.getParameter("E01LCMACC").trim());
            } catch (Exception e) {
                msg.setE01DCMACC("0");
            }

			mp.sendMessage(msg);
			MessageRecord newmsg = mp.receiveMessageRecord();

			if (mp.hasError(newmsg)) {
				msgError = (ELEERRMessage) newmsg;
				pageName = "EDC0110_lc_enter_inquiry.jsp";
			} else {
				msgError = new ELEERRMessage();
				msg = (EDC011001Message) newmsg;
                userPO.setIdentifier(msg.getE01DCMACC());
                userPO.setAccNum(msg.getE01DCMACC());
                userPO.setBank(msg.getE01DCMBNK());
                userPO.setProdCode(msg.getE01DCMPRO());
                userPO.setHeader1(msg.getE01DCMPRO());
                userPO.setHeader2(msg.getE01DCMCUN());
                userPO.setHeader3(msg.getE01CUSNA1());
                userPO.setCurrency(msg.getE01DCMCCY());
                userPO.setHeader22(msg.getE01DCMTAR());
                userPO.setHeader21(msg.getE01DCMATY());
				
				pageName = "EDC0110_lc_inq_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("lcBasic", msg);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procReqHistoryDetail(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0460", req);
			EDC011001Message msg046001 = (EDC011001Message) mp.getMessageRecord("EDC011001", user.getH01USR(), "0004");
			
			if (screen == R_HISTORY_DETAIL_FM) {
				JBLCHist bLCHist = (JBLCHist) session.getAttribute("bLCHist");
                msg046001.setE01DCMACC(bLCHist.getACC());
				msg046001.setE01DCMTDY(bLCHist.getTDY());
				msg046001.setE01DCMTDM(bLCHist.getTDM());
				msg046001.setE01DCMTDD(bLCHist.getTDD());
				msg046001.setE01DCMTTM(bLCHist.getTTM());
				msg046001.setE01DCMADM(bLCHist.getAD1());
				msg046001.setE01DCMADD(bLCHist.getAD2());
				msg046001.setE01DCMADY(bLCHist.getAD3());
				msg046001.setE01DCMATM(bLCHist.getATM());
				msg046001.setE01DSCTTP(bLCHist.getDSCTTP());
				msg046001.setE01DCMOPR(bLCHist.getOPR());
				msg046001.setE01APPREJ(bLCHist.getAPPREJ());
				msg046001.setE01DCMSUP(bLCHist.getSUP());
				msg046001.setE01DCMCCY(bLCHist.getCCY());
				msg046001.setE01DCMPRO(bLCHist.getPRO());
				msg046001.setE01DCMBNK(bLCHist.getBNK());
			} else {
				try {
					msg046001.setE01DCMACC(req.getParameter("E01DCMACC").trim());
				} catch (Exception e) {
					msg046001.setE01DCMACC(userPO.getAccNum().trim());
				}
				try {
					msg046001.setE01DSCTTP(req.getParameter("E01DSCTTP").trim());
				} catch (Exception e) {
					msg046001.setE01DSCTTP(userPO.getHeader1().trim());
				}
				try {
					msg046001.setE01DCMOPR(req.getParameter("E01DCMOPR").trim());
				} catch (Exception e) {
					msg046001.setE01DCMOPR(userPO.getHeader2().trim());
				}
				try {
					msg046001.setE01APPREJ(req.getParameter("E01APPREJ").trim());
				} catch (Exception e) {
					msg046001.setE01APPREJ(userPO.getHeader4().trim());
				}
				try {
					msg046001.setE01DCMSUP(req.getParameter("E01DCMSUP").trim());
				} catch (Exception e) {
					msg046001.setE01DCMSUP(userPO.getHeader5().trim());
				}
				try {
					msg046001.setE01DCMTDM(req.getParameter("E01DCMTDM").trim());
				} catch (Exception e) {
					msg046001.setE01DCMTDM(userPO.getHeader10().trim());
				}
				try {
					msg046001.setE01DCMTDD(req.getParameter("E01DCMTDD").trim());
				} catch (Exception e) {
					msg046001.setE01DCMTDD(userPO.getHeader11().trim());
				}
				try {
					msg046001.setE01DCMTDY(req.getParameter("E01DCMTDY").trim());
				} catch (Exception e) {
					msg046001.setE01DCMTDY(userPO.getHeader12().trim());
				}
				try {
					msg046001.setE01DCMADM(req.getParameter("E01DCMADM").trim());
				} catch (Exception e) {
					msg046001.setE01DCMADM(userPO.getHeader13().trim());
				}
				try {
					msg046001.setE01DCMADD(req.getParameter("E01DCMADD").trim());
				} catch (Exception e) {
					msg046001.setE01DCMADD(userPO.getHeader14().trim());
				}
				try {
					msg046001.setE01DCMADY(req.getParameter("E01DCMADY").trim());
				} catch (Exception e) {
					msg046001.setE01DCMADY(userPO.getHeader15().trim());
				}
				try {
					msg046001.setE01DCMTTM(req.getParameter("E01DCMTTM").trim());
				} catch (Exception e) {
					msg046001.setE01DCMTTM(userPO.getHeader16().trim());
				}
				try {
					userPO.setID(req.getParameter("E02LCLTNO").trim());
				} catch (Exception e) {
					userPO.setID("0");
				}
			}
			msg046001.setH01FLGWK1("A");

			mp.sendMessage(msg046001);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg046001 = (EDC011001Message) mp.receiveMessageRecord("EDC011001");

			if (mp.hasError(msgError)) {
				pageName = "EDC0110_dc_inquiry_list.jsp";
			} else {
				JBLCHist bLCHist = new JBLCHist();
				bLCHist.setACC(msg046001.getE01DCMACC());
				try {
					bLCHist.setTNO(req.getParameter("E02LCLTNO").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				bLCHist.setTDY(msg046001.getE01DCMTDY());
				bLCHist.setTDM(msg046001.getE01DCMTDM());
				bLCHist.setTDD(msg046001.getE01DCMTDD());
				bLCHist.setTTM(msg046001.getE01DCMTTM());
				bLCHist.setAD1(msg046001.getE01DCMADM());
				bLCHist.setAD2(msg046001.getE01DCMADD());
				bLCHist.setAD3(msg046001.getE01DCMADY());
				bLCHist.setATM(msg046001.getE01DCMATM());
				bLCHist.setDSCTTP(msg046001.getE01DSCTTP());
				bLCHist.setOPR(msg046001.getE01DCMOPR());
				bLCHist.setAPPREJ(msg046001.getE01APPREJ());
				bLCHist.setSUP(msg046001.getE01DCMSUP());
				bLCHist.setCCY(msg046001.getE01DCMCCY());
				bLCHist.setPRO(msg046001.getE01DCMPRO());
				bLCHist.setBNK(msg046001.getE01DCMBNK());;
				
				session.setAttribute("bLCHist", bLCHist);	
				
				userPO.setAccNum(msg046001.getE01DCMACC()); //Account
				userPO.setHeader1(msg046001.getE01DSCTTP()); //Operation Type
				userPO.setHeader2(msg046001.getE01DCMOPR()); //Operator
				userPO.setHeader3(Util.formatCustomDate(user.getE01DTF(),msg046001.getE01DCMTDM(), msg046001.getE01DCMTDD(), msg046001.getE01DCMTDY()) 
						+ " " +  Util.formatTime(msg046001.getE01DCMTTM())); //Date Time.
				userPO.setHeader4(msg046001.getE01APPREJ()); //Approval
				userPO.setHeader5(msg046001.getE01DCMSUP()); //Supervisor
				userPO.setHeader6(Util.formatCustomDate(user.getE01DTF(),msg046001.getE01DCMADM(), msg046001.getE01DCMADD(), msg046001.getE01DCMADY()) 
						+ " " +  Util.formatTime(msg046001.getE01DCMATM())); // Date Time
				
                if (msg046001.getE01DCMTYP().equals("O")) {
                    if ("Y".equals(req.getParameter("E01DOMFLG"))) {
                        if (msg046001.getE01DCMTYP().equals("I")) {
                        	pageName = "EDC0110_sing_inq_incoming.jsp";
                        } else {
                        	pageName = "EDC0110_sing_inq_outgoing.jsp";
                        }
                    } else {
                        // PageToCall = "EDC0110_sing_inq.jsp";
                        if (msg046001.getE01DCMTYP().equals("I")) {
                        	pageName = "EDC0110_sing_inq_incoming.jsp";
                        } else {
                        	pageName = "EDC0110_sing_inq_outgoing.jsp";
                        }
                    }
                    if (msg046001.getE01DCMSTY().compareTo("D") == 0) {
                        if (msg046001.getE01DCMTYP().equals("I")) {
                        	pageName = "EDC0110_doc_inq_incoming.jsp";
                        } else {
                        	pageName = "EDC0110_doc_inq_outgoing.jsp";
                        }
                    }
                } else if (msg046001.getE01DCMTYP().equals("D")) {
                	pageName = "EDC0110_doc_inq.jsp";
                } else if (msg046001.getE01DCMTYP().equals("I")) {
                	pageName = "EDC0110_sing_inq.jsp";
                } else if (msg046001.getE01DCMTYP().equals("S")) {
                	pageName = "EDC0110_lc_inq_basic_outgoing_sb.jsp";
                } else if (msg046001.getE01DCMTYP().equals("R")) {
                	pageName = "EDC0110_lc_inq_basic_incoming_sb.jsp";
                }
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("dcNew", msg046001);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procReqTransferHist(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "", "INQUIRY");
		userPO.setID(user.getE01INT()); //Country Code
		
		String opCode = req.getParameter("opCode") == null ? "0004" : req.getParameter("opCode").trim();
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0110", req);
			EDC011005Message msg05 = (EDC011005Message) mp.getMessageRecord("EDC011005", user.getH01USR(), opCode);
            msg05.setH05SCRCOD("01");
            msg05.setH05FLGWK3("T");
            try {
                msg05.setE05LCDACC(req.getParameter("E02LCLACC").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
            try {
                msg05.setE05LCDTDY(req.getParameter("E02LCLTDY").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
            try {
                msg05.setE05LCDTDM(req.getParameter("E02LCLTDM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
            try {
                msg05.setE05LCDTDD(req.getParameter("E02LCLTDD").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
            try {
                msg05.setE05LCDTTM(req.getParameter("E02LCLTTM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg05.setE05LCDTDM(req.getParameter("E02LCLADM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05LCDTDD(req.getParameter("E02LCLADD").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05LCDTDY(req.getParameter("E02LCLADY").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05LCDTTM(req.getParameter("E02LCLATM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05DSCTTP(req.getParameter("E02DSCTTP").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05DCMOPR(req.getParameter("E02LCLOPR").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05APPREJ(req.getParameter("E02APPREJ").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05DCMSUP(req.getParameter("E02LCLSUP").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05LCDPRO(req.getParameter("E02LCLPRO").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05LCDBNK(req.getParameter("E02LCLBNK").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msg05);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg05 = (EDC011005Message) mp.receiveMessageRecord("EDC011005");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				try {
	                userPO.setHeader1(req.getParameter("E01DSCTTP"));
	                userPO.setHeader2(req.getParameter("E01LCDOPR"));
	                userPO.setHeader3(Util.formatCustomDate(user.getE01DTF(), req.getParameter("E01LCDTDM"),req.getParameter("E01LCDTDD"), req.getParameter("E01LCDTDY")) + 
	                		" " +  Util.formatTime(req.getParameter("E01LCDTTM")));
	                userPO.setHeader4(req.getParameter("E01APPREJ"));
	                userPO.setHeader5(req.getParameter("E01LCDSUP"));
	                userPO.setHeader6(Util.formatCustomDate(user.getE01DTF(), req.getParameter("E01LCDADM"), req.getParameter("E01LCDADD"), req.getParameter("E01LCDADY")) + 
	                		" " +  Util.formatTime(req.getParameter("E01LCDATM")));
				} catch (Exception e) {
					// TODO: handle exception
				}
				
                pageName = "EDC0110_lc_transfer.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("msg046005", msg05);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procReqAssignHist(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "", "INQUIRY");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0110", req);
			EDC011005Message msg05 = (EDC011005Message) mp.getMessageRecord("EDC011005", user.getH01USR(), "0004");
            msg05.setH05FLGWK3("A");
            msg05.setH05SCRCOD("01");
            try {
                msg05.setE05LCDACC(req.getParameter("E02LCLACC").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
            try {
                msg05.setE05LCDTDY(req.getParameter("E02LCLTDY").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
            try {
                msg05.setE05LCDTDM(req.getParameter("E02LCLTDM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
            try {
                msg05.setE05LCDTDD(req.getParameter("E02LCLTDD").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
            try {
                msg05.setE05LCDTTM(req.getParameter("E02LCLTTM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg05.setE05LCDTDM(req.getParameter("E02LCLADM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05LCDTDD(req.getParameter("E02LCLADD").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05LCDTDY(req.getParameter("E02LCLADY").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05LCDTTM(req.getParameter("E02LCLATM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05DSCTTP(req.getParameter("E02DSCTTP").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05DCMOPR(req.getParameter("E02LCLOPR").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05APPREJ(req.getParameter("E02APPREJ").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05DCMSUP(req.getParameter("E02LCLSUP").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05LCDPRO(req.getParameter("E02LCLPRO").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msg05.setE05LCDBNK(req.getParameter("E02LCLBNK").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msg05);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg05 = (EDC011005Message) mp.receiveMessageRecord("EDC011005");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				try {
		            userPO.setHeader1(req.getParameter("E01DSCTTP"));
		            userPO.setHeader2(req.getParameter("E01LCDOPR"));
		            userPO.setHeader3(Util.formatCustomDate(user.getE01DTF(), req.getParameter("E01LCDTDM"), req.getParameter("E01LCDTDD"), req.getParameter("E01LCDTDY")) + 
		            		" " +  Util.formatTime(req.getParameter("E01LCDTTM")));
		            userPO.setHeader4(req.getParameter("E01APPREJ"));
		            userPO.setHeader5(req.getParameter("E01LCDSUP"));
		            userPO.setHeader6(Util.formatCustomDate(user.getE01DTF(), req.getParameter("E01LCDADM"), req.getParameter("E01LCDADD"), req.getParameter("E01LCDADY")) + 
		            		" " +  Util.formatTime(req.getParameter("E01LCDATM")));
				} catch (Exception e) {
					// TODO: handle exception
				}
				
	            pageName = "EDC0110_lc_assignment.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("msg046005", msg05);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}

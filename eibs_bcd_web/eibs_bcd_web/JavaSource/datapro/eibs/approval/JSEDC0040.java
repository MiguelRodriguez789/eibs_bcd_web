package datapro.eibs.approval;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDC000001Message;
import datapro.eibs.beans.EDC000002Message;
import datapro.eibs.beans.EDC000005Message;
import datapro.eibs.beans.EDC001001Message;
import datapro.eibs.beans.EDC001002Message;
import datapro.eibs.beans.EDC001005Message;
import datapro.eibs.beans.EDC004001Message;
import datapro.eibs.beans.EDC004002Message;
import datapro.eibs.beans.EDI001002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */

public class JSEDC0040 extends JSEIBSServlet {

    protected static final int R_APPROVAL				= 5;
    protected static final int A_DELETE					= 4;
    protected static final int A_REJECTED				= 14;
    protected static final int A_APPROVAL				= 2;
    protected static final int R_APPROVAL_INQ			= 3;
    protected static final int R_PASSWORD				= 1;

    protected static final int R_COMMISSIONS_INQ		= 6;
    protected static final int R_CODES_INQ				= 7;
    protected static final int R_SPECIAL_INST_INQ		= 8;

    protected static final int R_OPTION_DOC_MENU_INQ	= 500;
    protected static final int R_OPTION_SIM_MENU_INQ	= 501;

    protected static final int R_TRANS					= 600;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch (screen)	{
            case R_PASSWORD :
                procReqPassword(req, res, session);
                break;
            case R_APPROVAL :
                procReqApproval(user, req, res, session);
                break;
            case A_APPROVAL :
                procActionApproval(user, req, res, session);
                break;
            case A_DELETE :
                procActionDelete(user, req, res, session);
                break;
            case A_REJECTED :
                procActionRejected(user, req, res, session);
                break;
            case R_APPROVAL_INQ :
                procReqApprovalInq(user, req, res, session);
                break;
            case R_COMMISSIONS_INQ :
                procReqCommissionsInq(user, req, res, session);
                break;
            case R_CODES_INQ :
                procReqSpecialCodesInq(user, req, res, session);
                break;
            case R_SPECIAL_INST_INQ :
                procReqSpecialInstInq(user, req, res, session);
                break;
            case R_OPTION_DOC_MENU_INQ: // this will handle all requests
                // made from option menu
                procRecOptionDocMenu(user, req, res, session);
                break;
            case R_OPTION_SIM_MENU_INQ: // this will handle all requests
                // made from option menu
                procRecOptionSimMenu(user, req, res, session);
                break;
            case R_TRANS:
                procReqTrans(user, req, res, session);
                break;
			default :
				forward(devPage, req, res);
				break;
        }	
    }

	private void procReqPassword(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("APPROVAL");
		
		String nivAp = "";
		try {
			nivAp = req.getParameter("nivAp").trim();
		} catch (Exception e) {
			nivAp = "0";
		}
		userPO.setHeader10(nivAp);
		nivAp = "&nivAp=" + nivAp;
		String acc = "";
		try {
			acc = "&ACCNUM=" + req.getParameter("ACCNUM").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
        userPO.setRedirect("/servlet/datapro.eibs.approval.JSEDC0040?SCREEN=" + R_APPROVAL + acc + nivAp); 	
   		redirect("/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7", res);		
	}

	private void procActionApproval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("APPROVAL");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0040", req);
			EDC004002Message msgAcc = (EDC004002Message) mp.getMessageRecord("EDC004002");
			msgAcc.setH02USERID(user.getH01USR());
			msgAcc.setH02PROGRM("EDC0040");
			msgAcc.setH02TIMSYS(getTimeStamp());
			msgAcc.setH02SCRCOD("01");
			msgAcc.setE02ACTION("A");
            try {
            	msgAcc.setE02DCMACC(req.getParameter("E01DCMACC").trim());
            } catch (Exception e) {
                // TODO: handle exception
            }
            try {
            	msgAcc.setE02MSGTXT(req.getParameter("reason").trim());
            } catch (Exception e) {

            }

			mp.sendMessage(msgAcc);
			
			ELEERRMessage msgError = null;
			MessageRecord msg = null;
			EDI001002Message msgImg = null;
			do {
				msg = mp.receiveMessageRecord();
				if (msg.getFormatName().equals("EDI001002")) { //Update SQL Images
					msgImg = (EDI001002Message) msg;
				}
			} while (!msg.getFormatName().equals("ELEERR"));
			
			msgError = (ELEERRMessage) msg;

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDC0040_approval_list.jsp", req, res);
			} else {
				if (msgImg != null) {
					//Update SQL Images
					JOApprovalRedirect action = new JOApprovalRedirect(req, res, msgImg.getE02DCIACD(), msgImg.getE02DCIACC());
					action.action(msgImg.getE02DCITYP(), msgImg.getH02FLGWK3(), "/servlet/datapro.eibs.approval.JSEDC0040?SCREEN=" + R_APPROVAL);
				} else {
					procReqApproval(user, req, res, session);
				}
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("APPROVAL");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0040", req);
			EDC004002Message msg = (EDC004002Message) mp.getMessageRecord("EDC004002");
            msg.setH02USERID(user.getH01USR());
            msg.setH02PROGRM("EDC0040");
            msg.setH02TIMSYS(getTimeStamp());
            msg.setH02SCRCOD("01");
            msg.setE02ACTION("D");
            try {
                msg.setE02DCMACC(req.getParameter("E01DCMACC").trim());
            } catch (Exception e) {
                // TODO: handle exception
            }
            try {
                msg.setE02MSGTXT(req.getParameter("reason").trim());
            } catch (Exception e) {

            }

			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");

			session.setAttribute("error", msgError);
			
			if (mp.hasError(msgError)) {
				forward("EDC0040_approval_list.jsp", req, res);
			} else {
				procReqApproval(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionRejected(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("APPROVAL");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0040", req);
			EDC004002Message msg = (EDC004002Message) mp.getMessageRecord("EDC004002");
            msg.setH02USERID(user.getH01USR());
            msg.setH02PROGRM("EDC0040");
            msg.setH02TIMSYS(getTimeStamp());
            msg.setH02SCRCOD("01");
            msg.setE02ACTION("R");
            try {
                msg.setE02DCMACC(req.getParameter("E01DCMACC").trim());
            } catch (Exception e) {
                // TODO: handle exception
            }
            try {
                msg.setE02MSGTXT(req.getParameter("reason").trim());
            } catch (Exception e) {

            }

			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");

			session.setAttribute("error", msgError);
			
			if (mp.hasError(msgError)) {
				forward("EDC0040_approval_list.jsp", req, res);
			} else {
				procReqApproval(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqApproval(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("APPROVAL");
		userPO.setOption("DC");
		
		String nivAp = "";
		try {
			nivAp = req.getParameter("nivAp").trim();
			userPO.setHeader10(nivAp);
		} catch (Exception e) {
			nivAp = userPO.getHeader10();
		}
		
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0040", req);
			EDC004001Message msg = (EDC004001Message) mp.getMessageRecord("EDC004001");
            msg.setH01USERID(user.getH01USR());
            msg.setH01PROGRM("EDC0040");
            msg.setH01TIMSYS(getTimeStamp());
            msg.setH01SCRCOD("01");
            //msg.setE01DCMNAP(nivAp);

			mp.sendMessage(msg);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				if (list.getNoResult()) {
					pageName = "MISC_no_result.jsp";
				} else {
					session.setAttribute("appList", list);
					pageName = "EDC0040_approval_list.jsp";
				}
			}

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqApprovalInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("APPROVAL");
		
		String apcode = null;
		try {
			apcode = req.getParameter("E01DCMACD").trim();
		} catch (Exception e) {
			apcode = userPO.getType();
		}
		
		String pageName = "";
		ELEERRMessage msgError = null;
		MessageRecord newmsg = null;
		MessageProcessor mp = null;
		try {
			if ("51".equals(apcode)) { //Documentary Collection
				mp = getMessageProcessor("EDC0000", req);
    			EDC000001Message msg = (EDC000001Message) mp.getMessageRecord("EDC000001");
                msg.setH01USERID(user.getH01USR());
                msg.setH01PROGRM("EDC0000");
                msg.setH01TIMSYS(getTimeStamp());
                msg.setH01SCRCOD("01");
                msg.setH01OPECOD("0004");
                msg.setH01FLGWK1("A");
                try {
                    msg.setE01DCMACC(req.getParameter("E01DCMACC").trim());
				} catch (Exception e) {
                    msg.setE01DCMACC(userPO.getAccNum());
				}

				mp.sendMessage(msg);
				msgError = (ELEERRMessage) mp
						.receiveMessageRecord("ELEERR");
				msg = (EDC000001Message) mp.receiveMessageRecord("EDC000001");

				if (mp.hasError(msgError)) {
					pageName = "error_viewer.jsp";
				} else {
					newmsg = msg;
					userPO.setApplicationCode(msg.getE01DCMACX());
                    userPO.setAccNum(msg.getE01DCMACC());
                    userPO.setIdentifier(msg.getE01DCMACC());
                    userPO.setBank(msg.getE01DCMBNK());
                    userPO.setProdCode(msg.getE01DCMPRO());
                    userPO.setType("51");
                    userPO.setAccOpt(msg.getE01DCMOPT());
                    if (msg.getE01DCMTYP().equals("I")) {
                    	pageName = "EDC0000_dc_opening_incoming.jsp";
                    } else {
                    	pageName = "EDC0000_dc_opening_outgoing.jsp";
                    }
				}
			} else { //Simple Collection
				mp = getMessageProcessor("EDC0010", req);
    			EDC001001Message msg = (EDC001001Message) mp.getMessageRecord("EDC001001");
                msg.setH01USERID(user.getH01USR());
                msg.setH01PROGRM("EDC0010");
                msg.setH01TIMSYS(getTimeStamp());
                msg.setH01SCRCOD("01");
                msg.setH01OPECOD("0004");
                msg.setH01FLGWK1("A");
                try {
                    msg.setE01DCMACC(req.getParameter("E01DCMACC").trim());
				} catch (Exception e) {
					msg.setE01DCMACC(userPO.getAccNum());
				}

				mp.sendMessage(msg);
				msgError = (ELEERRMessage) mp
						.receiveMessageRecord("ELEERR");
				msg = (EDC001001Message) mp.receiveMessageRecord("EDC001001");

				if (mp.hasError(msgError)) {
					pageName = "error_viewer.jsp";
				} else {
					newmsg = msg;
					userPO.setApplicationCode(msg.getE01DCMACX());
                    userPO.setAccNum(msg.getE01DCMACC());
                    userPO.setIdentifier(msg.getE01DCMACC());
                    userPO.setBank(msg.getE01DCMBNK());
                    userPO.setProdCode(msg.getE01DCMPRO());
                    userPO.setType("50");
                    userPO.setAccOpt(msg.getE01DCMOPT());
                    userPO.setSource("COBRANZA_SIMPLE");
                    if (msg.getE01DCMTYP().equals("I")) {
                    	pageName = "EDC0010_dc_opening_incoming.jsp";
                    } else {
                    	pageName = "EDC0010_dc_opening_outgoing.jsp";
                    }
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("dcNew", newmsg);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
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
                    pageName = "EDC0040_doc_commissions.jsp";
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
					pageName = "EDC0040_sing_commissions.jsp";
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

	private void procReqSpecialCodesInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("APPROVAL");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0000", req);
            ESD000002Message msg = (ESD000002Message) mp.getMessageRecord("ESD000002");
            msg.setH02USR(user.getH01USR());
            msg.setH02PGM("EDC0000");
            msg.setH02TIM(getTimeStamp());
            msg.setH02SCR("01");
            msg.setH02OPE("0002");
            msg.setE02ACC(userPO.getAccNum());

			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg = (ESD000002Message) mp.receiveMessageRecord("ESD000002");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				if ("51".equals(userPO.getType())) { //Documentary Collection
					pageName = "EDC0040_doc_codes.jsp";
				} else { //Simple Collection
					pageName = "EDC0040_sing_codes.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("dcCodes", msg);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqSpecialInstInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("APPROVAL");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0000", req);
            ESD000005Message msg = (ESD000005Message) mp.getMessageRecord("ESD000005");
            msg.setH05USR(user.getH01USR());
            msg.setH05PGM("EDC0000");
            msg.setH05TIM(getTimeStamp());
            msg.setH05SCR("01");
            msg.setH05OPE("0004");
            msg.setE05ACC(userPO.getAccNum());

			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg = (ESD000005Message) mp.receiveMessageRecord("ESD000005");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				if ("51".equals(userPO.getType())) { //Documentary Collection
					pageName = "EDC0040_doc_special_inst.jsp";
				} else { //Simple Collection
					pageName = "EDC0040_sing_special_inst.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("dcInst", msg);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procRecOptionDocMenu(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("APPROVAL");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0000", req);
			EDC000005Message msg = (EDC000005Message) mp.getMessageRecord("EDC000005");
			msg.setH05USERID(user.getH01USR());
			msg.setH05PROGRM("EDC0000");
			msg.setH05TIMSYS(getTimeStamp());
			msg.setH05SCRCOD("01");
			msg.setH05OPECOD("0002");

			userPO.setID(user.getE01INT()); // Country Code
            msg.setH05SCRCOD("01");
            try {
                msg.setE05LCDACC(req.getParameter("E01DCMACC").trim());
			} catch (Exception e) {
                msg.setE05LCDACC(userPO.getAccNum());
			}
            try {
                msg.setE05LCDPRO(req.getParameter("E01DCMPRO").trim());
			} catch (Exception e) {
                msg.setE05LCDPRO(userPO.getProdCode());
			}
            try {
                msg.setE05LCDBNK(req.getParameter("E01DCMBNK").trim());
            } catch (NullPointerException npe) {
                msg.setE05LCDBNK(userPO.getBank());
            }
            try {
                msg.setE05LCDFCD(req.getParameter("CODE").trim());
			} catch (Exception e) {
	            msg.setE05LCDFCD("");
			}

			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg = (EDC000005Message) mp.receiveMessageRecord("EDC000005");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "EDC0000_dc_field_info.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg", msg);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procRecOptionSimMenu(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("APPROVAL");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0010", req);
			EDC001005Message msg = (EDC001005Message) mp.getMessageRecord("EDC001005");
			msg.setH05USERID(user.getH01USR());
			msg.setH05PROGRM("EDC0010");
			msg.setH05TIMSYS(getTimeStamp());
			msg.setH05SCRCOD("01");
			msg.setH05OPECOD("0002");

            userPO.setID(user.getE01INT()); // Country Code
            msg.setH05SCRCOD("01");
            try {
                msg.setE05LCDACC(req.getParameter("E01DCMACC").trim());
			} catch (Exception e) {
                msg.setE05LCDACC(userPO.getAccNum());
			}
            try {
                msg.setE05LCDPRO(req.getParameter("E01DCMPRO").trim());
			} catch (Exception e) {
                msg.setE05LCDPRO(userPO.getProdCode());
			}
            try {
                msg.setE05LCDBNK(req.getParameter("E01DCMBNK").trim());
            } catch (NullPointerException npe) {
                msg.setE05LCDBNK(userPO.getBank());
            }
            try {
                msg.setE05LCDFCD(req.getParameter("CODE").trim());
			} catch (Exception e) {
				msg.setE05LCDFCD("");
			}


			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg = (EDC001005Message) mp.receiveMessageRecord("EDC001005");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "EDC0010_dc_field_info.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg", msg);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqTrans(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("APPROVAL");
		
		String apcode = null;
		try {
			apcode = req.getParameter("E01DCMACD").trim();
		} catch (Exception e) {
			apcode = userPO.getType();
		}
		
		String pageName = "";
		ELEERRMessage msgError = null;
		MessageRecord newmsg = null;
		MessageProcessor mp = null;
		try {
			if ("51".equals(apcode)) { //Documentary Collection
				mp = getMessageProcessor("EDC0000", req);
    			EDC000001Message msg = (EDC000001Message) mp.getMessageRecord("EDC000001");
    			msg.setH01USERID(user.getH01USR());
    			msg.setH01PROGRM("EDC0000");
    			msg.setH01TIMSYS(getTimeStamp());
    			msg.setH01SCRCOD("01");
    			msg.setH01OPECOD("0004");
                msg.setH01FLGWK1("A");
                try {
                    msg.setE01DCMACC(req.getParameter("E01DCMACC").trim());
				} catch (Exception e) {
					msg.setE01DCMACC(userPO.getAccNum());
				}

				mp.sendMessage(msg);
				msgError = (ELEERRMessage) mp
						.receiveMessageRecord("ELEERR");
				msg = (EDC000001Message) mp.receiveMessageRecord("EDC000001");

				if (mp.hasError(msgError)) {
					pageName = "error_viewer.jsp";
				} else {
					newmsg = msg;
                    userPO.setAccNum(msg.getE01DCMACC());
                    userPO.setBank(msg.getE01DCMBNK());
                    userPO.setProdCode(msg.getE01DCMPRO());
                    userPO.setType("51");
					
                    pageName = "EDC0000_dc_trans_doc.jsp";
				}
			} else { //Simple Collection
				mp = getMessageProcessor("EDC0010", req);
    			EDC001001Message msg = (EDC001001Message) mp.getMessageRecord("EDC001001");
    			msg.setH01USERID(user.getH01USR());
    			msg.setH01PROGRM("EDC0010");
    			msg.setH01TIMSYS(getTimeStamp());
    			msg.setH01SCRCOD("01");
    			msg.setH01OPECOD("0004");
                msg.setH01SCRCOD("01");
                msg.setH01FLGWK1("A");
                try {
                    msg.setE01DCMACC(req.getParameter("E01DCMACC").trim());
				} catch (Exception e) {
					msg.setE01DCMACC(userPO.getAccNum());
				}

				mp.sendMessage(msg);
				msgError = (ELEERRMessage) mp
						.receiveMessageRecord("ELEERR");
				msg = (EDC001001Message) mp.receiveMessageRecord("EDC001001");

				if (mp.hasError(msgError)) {
					pageName = "error_viewer.jsp";
				} else {
					newmsg = msg;
                    userPO.setAccNum(msg.getE01DCMACC());
                    userPO.setBank(msg.getE01DCMBNK());
                    userPO.setProdCode(msg.getE01DCMPRO());
                    userPO.setType("50");
                    
					pageName = "EDC0010_dc_trans_single.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("dcNew", newmsg);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}	

}
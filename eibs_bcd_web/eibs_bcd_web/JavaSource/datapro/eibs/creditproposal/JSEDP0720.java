package datapro.eibs.creditproposal;

/**
 * Insert the type's description here.
 * Creation date: (04/25/05 6:08:55 PM)
 * @author: John Andrade
 */
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDP020001Message;
import datapro.eibs.beans.EDP072001Message;
import datapro.eibs.beans.EDP072101Message;
import datapro.eibs.beans.EDP072201Message;
import datapro.eibs.beans.EDP072401Message;
import datapro.eibs.beans.EDP072601Message;
import datapro.eibs.beans.EDP073701Message;
import datapro.eibs.beans.EDP074601Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBCreditProposalComm;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEDP0720 extends JSEIBSServlet {

	// entering options
	protected static final int R_FILTER = 100; //
	protected static final int R_LIST = 200; //

	protected static final int R_ENTER_NEW_PROPOSAL = 301;
	protected static final int R_NEW_PROPOSAL = 302;

	protected static final int R_HEADER = 300;
	protected static final int R_SAVE_HEADER = 350;

	protected static final int R_DETAIL_PRODUCT = 400;
	protected static final int RNEWPROD = 410; //
	protected static final int RDETPROD = 420; //

	protected static final int RSAVEPROD = 460;
	protected static final int RFMTHEADER = 470;

	protected static final int R_NEXT_ACTIVITY = 500;
	protected static final int RPRIORACTIV = 540; //
	protected static final int R_SAVE_NEXT_ACTIVITY = 600; //

	protected static final int RUPDGUAR = 710; //
	protected static final int RETCUSINF = 720; //
	protected static final int PRINTPROP = 730; //
	protected static final int RETPRDINF = 740; //

	protected static final int RLISTDOFA = 800; //
	protected static final int RACTDOFA = 810; //
	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		case R_FILTER :
			procReqFilter(user, req, res, session);
			break;
		case R_LIST :
			procActionEnter(user, req, res, session);
			break;
		case R_ENTER_NEW_PROPOSAL :
			procReqEnterNewProposal(user, req, res, session);
			break;
		case R_NEW_PROPOSAL :
			procReqNewProposal(user, req, res, session);
			break;

		case R_DETAIL_PRODUCT :
			procProductPos(user, req, res, session);
			break;
		case RNEWPROD :
			procRNewProd(user, req, res, session);
			break;
		case RDETPROD :
			procRDetProd(user, req, res, session);
			break;

		case RFMTHEADER :
			procRFmtHeader(user, req, res, session);
			break;
		case RSAVEPROD :
			procRSaveProd(user, req, res, session);
			break;
		case R_SAVE_HEADER :
			procSave400(user, req, res, session);
			break;

		case R_NEXT_ACTIVITY :
			procReqNext_Activity(user, req, res, session);
			break;
		case RPRIORACTIV :
			procRPriorActiv(user, req, res, session);
			break;
		case R_SAVE_NEXT_ACTIVITY :
			procSave400Ruta(user, req, res, session);
			break;

		case RUPDGUAR :
			procRUPDGUAR(user, req, res, session);
			break;
		case RETCUSINF :
			//procRETCUSINFuser, req, res, session);
			break;
		case PRINTPROP :
			procPRINTPROP(user, req, res, session);
			break;
		case RETPRDINF :
			procRETPRDINF(user, req, res, session);
			break;
		case RLISTDOFA :
			procRLISTDOFA(user, req, res, session);
			break;
		case RACTDOFA :
			procACTDOFA(user, req, res, session);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
		
	}


	private void procACTDOFA(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0724", req);
			EDP072401Message msgL0724 = (EDP072401Message) mp.getMessageRecord("EDP072401");
			msgL0724.setH01USERID(user.getH01USR());
			msgL0724.setH01PROGRM("EDP0724");
			msgL0724.setH01TIMSYS(getTimeStamp());
			msgL0724.setH01SCRCOD("01");
			msgL0724.setH01OPECOD("0005");
			msgL0724.setE01DPANPR(userPO.getIdentifier());
			try {
				msgL0724.setE01DPATIP(req.getParameter("opt").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgL0724.setE01DPAM24(req.getParameter("E01DPAM24").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
			    msgL0724.setE01DPAM25(req.getParameter("E01DPAM25").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgL0724.setE01DPAM27(req.getParameter("E01DPAM27").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgL0724);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
			} else {
				ELEERRMessage error = null;
				msgError = new ELEERRMessage();
				
				// SALVA COMENTARIOS DOFA
				String npr = userPO.getIdentifier();
				String sq = "0";
				String prd = "";
				String typ = "";
				String comm;
				JBCreditProposalComm bComments = (JBCreditProposalComm) session.getAttribute("bComments");
				if(bComments == null) bComments = new JBCreditProposalComm();
				
				try {
					comm = req.getParameter("E01DPAM21").trim();
					bComments.setNumeroEmpleados(comm);
					error = procSaveComments(mp, user, req, npr, sq, prd, typ, "21", comm);
					if (mp.hasError(error)) {
						addError(error, msgError);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				try {
					comm = req.getParameter("E01DPAM22").trim();
					bComments.setPrestamosVigentes(comm);
					error = procSaveComments(mp, user, req, npr, sq, prd, typ, "22", comm);
					if (mp.hasError(error)) {
						addError(error, msgError);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				try {
					comm = req.getParameter("E01DPAM23").trim();
					bComments.setInstruccionesLegalesCredito(comm);
					error = procSaveComments(mp, user, req, npr, sq, prd, typ, "23", comm);
					if (mp.hasError(error)) {
						addError(error, msgError);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				try {
					comm = req.getParameter("E01DPAM26").trim();
					bComments.setComAreaRiesgoCredito(comm);
					error = procSaveComments(mp, user, req, npr, sq, prd, typ, "26", comm);
					if (mp.hasError(error)) {
						addError(error, msgError);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				session.setAttribute("bComments", bComments);
				
				error = procReqProductsList(mp, user, req, res, session);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
				error = procReqGuaranteeList(mp, user, req, res, session);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
				
				procReqCommentsList(mp, user, req, res, session);
				
				error = procReqRecaudosN(mp, user, req, res, session);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				pageName = "EDP0720_proposals_dofa.jsp";
			} else {
				pageName = "EDP0720_proposals_header_maintenance.jsp";
			}

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void procRLISTDOFA(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0724", req);
			EDP072401Message msgL0724 = (EDP072401Message) mp.getMessageRecord("EDP072401");
			msgL0724.setH01USERID(user.getH01USR());
			msgL0724.setH01PROGRM("EDP0724");
			msgL0724.setH01TIMSYS(getTimeStamp());
			msgL0724.setH01SCRCOD("01");
			msgL0724.setH01OPECOD("0015");
			msgL0724.setE01DPANPR(userPO.getIdentifier());
			try {
				msgL0724.setE01DPATIP(req.getParameter("opt").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgL0724);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01OPECDE");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "EDP0720_proposals_header_maintenance.jsp";
			} else {
				if (!list.isEmpty()) {
					msgL0724 = (EDP072401Message) list.get(0);
					getCommentsDofa(mp, msgL0724, userPO, user, req, res, session);
					session.setAttribute("msgL0724", msgL0724);
				}
				pageName = "EDP0720_proposals_dofa.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void getCommentsDofa(MessageProcessor mp, EDP072401Message msgL0724,
			UserPos userPO, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		// TRAER COMENTARIOS PARA PANTALLA DOFA'
		JBCreditProposalComm bComments = (JBCreditProposalComm) session.getAttribute("bComments");

		if(bComments == null)
			bComments = new JBCreditProposalComm();
		
		String propuesta = userPO.getIdentifier();
		String typeProd = "";//msgRT.getE01DPETYP();
		String codProd = "";//msgRT.getE01PLPPRO();
		String SeqFacil = "0";//sgRT.getE01PLPSEQ();
		JBListRec beanComm = procGetComments(mp, user, req, res, session, "02",	propuesta, SeqFacil, typeProd, codProd);
		
		
		bComments.setNumeroEmpleados(msgL0724.getE01DPAM21());
		bComments.setPrestamosVigentes(msgL0724.getE01DPAM22());
		bComments.setInstruccionesLegalesCredito(msgL0724.getE01DPAM23());
		bComments.setComAreaRiesgoCredito(msgL0724.getE01DPAM26());
		beanComm.initRow();
		while (beanComm.getNextRow()) {
			String comm=beanComm.getRecord(1);
			if ("21".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {
				bComments.setNumeroEmpleados(comm);
			}
			if ("22".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {
				bComments.setPrestamosVigentes(comm);
			}
			if ("23".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {
				bComments.setInstruccionesLegalesCredito(comm);
			}
			if ("26".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {
				bComments.setComAreaRiesgoCredito(comm);
			}
			
		}
		session.setAttribute("bComments", bComments);
	}


	private void procPRINTPROP(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0720", req);
			EDP072001Message msgRT = (EDP072001Message) mp.getMessageRecord("EDP072001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDP0720");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0020");
			try {
				msgRT.setE01PLPNPR(req.getParameter("PROP").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgRT);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
			}
			
			if ("L".equals(req.getParameter("FMT"))) {
				userPO.setPurpose("INQUIRY");
				pageName = "EDP0720_proposals_list.jsp";
			} else if ("H".equals(req.getParameter("FMT"))) {
				pageName = "EDP0720_proposals_header_maintenance.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void procRETPRDINF(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0721", req);
			EDP072101Message msgList = (EDP072101Message) mp.getMessageRecord("EDP072101");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDP0721");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0007");
			
			setMessageRecord(req, msgList);

			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgList = (EDP072101Message) mp.receiveMessageRecord("EDP072101");

			if (mp.hasError(msgError)) {
				pageName = "EDP0720_proposals_product_enter_maint.jsp";
			} else {
				try {
					msgList.setE01PLTCN4(req.getParameter("E01PLPCN2").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgList.setE01PLTCN3(req.getParameter("E01PLPCN3").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				msgList.setE01PLTDST(userPO.getHeader4());
				
				session.setAttribute("msgList", msgList);
				
				EDP072201Message msgRTC = (EDP072201Message) mp.getMessageRecord("EDP072201");
				msgRTC.setH02USERID(user.getH01USR());
				msgRTC.setH02PROGRM("EDP072201");
				msgRTC.setH02TIMSYS(getTimeStamp());
				msgRTC.setH02SCRCOD("01");
				msgRTC.setH02OPECOD("0007");
				
				setMessageRecord(req, msgRTC);
				
				msgRTC.setE02DPJBNK(userPO.getBank());
				msgRTC.setE02DPANPR(userPO.getIdentifier());
				msgRTC.setE01XXXCUN(userPO.getCusNum());
				try {
					msgRTC.setE02DPATYP(req.getParameter("E01PLTTYP").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgRTC.setE02DPAPRO(req.getParameter("E01PLTPRO").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				mp.sendMessage(msgRTC);
				msgError = (ELEERRMessage) mp
						.receiveMessageRecord("ELEERR");
				msgRTC = (EDP072201Message) mp.receiveMessageRecord("EDP072201");
				
				EDP072001Message msgRT = (EDP072001Message) session.getAttribute("msgRT");
				populate(msgRTC, msgRT);
				
				session.setAttribute("msgRTC", msgRTC);
				
				String appCode = req.getParameter("E01PLTACD") == null ? "" : req.getParameter("E01PLTACD").trim();
				
				if (msgRT.getH01FLGWK3().equals("3")) {
					if (userPO.getType().equals("7")) {
						pageName = "EDP0720_proposals_product_inq_others.jsp";
					} else if (userPO.getType().equals("9")) {
						pageName = "EDP0720_proposals_product_inq_renews.jsp";
					} else {
						if (appCode.equals("10")) {
							pageName = "EDP0720_proposals_product_inq_loans.jsp";
						} else if (appCode.equals("40")) {
							pageName = "EDP0720_proposals_product_inq_letters.jsp";
						} else if (appCode.equals("43")) {
							pageName = "EDP0720_proposals_product_inq_bailgranted.jsp";
						} else if (appCode.equals("90")) {
							pageName = "EDP0720_proposals_product_inq_lines.jsp";
						}
					}
				} else {
					if (userPO.getType().equals("7")) {
						pageName = "EDP0720_proposals_product_maint_others.jsp";
					} else if (userPO.getType().equals("9")) {
						pageName = "EDP0720_proposals_product_maint_renews.jsp";
					} else {
						if (appCode.equals("10")) {
							pageName = "EDP0720_proposals_product_maint_loans.jsp";
						} else if (appCode.equals("40")) {
							pageName = "EDP0720_proposals_product_maint_letters.jsp";
						} else if (appCode.equals("43")) {
							pageName = "EDP0720_proposals_product_maint_bailgranted.jsp";
						} else if (appCode.equals("90")) {
							pageName = "EDP0720_proposals_product_maint_loans.jsp";
						} else if (appCode.equals("")) {
							pageName = "EDP0720_proposals_product_maint_loans.jsp";
						}
					}
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procRUPDGUAR(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0720", req);
			EDP072601Message msgL26 = (EDP072601Message) mp.getMessageRecord("EDP072601");
			msgL26.setH01USERID(user.getH01USR());
			msgL26.setH01PROGRM("EDP072601");
			msgL26.setH01TIMSYS(getTimeStamp());
			msgL26.setH01SCRCOD("01");
			msgL26.setH01OPECOD("0005");
			msgL26.setE01DPEBNK(userPO.getBank());
			
			if ("G".equals(req.getParameter("TGAR"))) {
				try {
					msgL26.setE01DPENPR(req.getParameter("E01PLPNPR").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgL26.setE01DPEPRD(req.getParameter("PRDG").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgL26.setE01DPETYP(req.getParameter("TYPG").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgL26.setE01DPEREG(req.getParameter("REGG").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
			} else if ("T".equals(req.getParameter("TGAR"))) {
				try {
					msgL26.setE01DPZNPR(req.getParameter("E01PLPNPR").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgL26.setE01DPZGRT(req.getParameter("TYPG").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgL26.setE01DPZDGA(req.getParameter("REGG").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
			}

			mp.sendMessage(msgL26);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01OPECDE");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				int colNum = 10;
				int gaColNum = 6;
				JBListRec gcode0726 = new JBListRec();
				gcode0726.init(gaColNum);

				JBListRec gcode0726T = new JBListRec();
				gcode0726T.init(gaColNum);
				String myGaCode[] = new String[gaColNum];
				for (int i = 0; i < gaColNum; i++) {
					myGaCode[i] = "";
				}
				String myRow[] = new String[colNum];
				for (int i = 0; i < colNum; i++) {
					myRow[i] = "";
				}
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msgL26 = (EDP072601Message) iterator.next();
					if (msgL26.getH01FLGWK2().equals("G")) {
						myGaCode[0] = msgL26.getE01DPEREG();
						myGaCode[1] = msgL26.getE01DPEDRE();
						myGaCode[2] =
							msgL26.getE01DPEFAD()
								+ "/"
								+ msgL26.getE01DPEFAM()
								+ "/"
								+ msgL26.getE01DPEFAY();
						myGaCode[3] = "";
						myGaCode[4] = "";
						myGaCode[5] = "";

						gcode0726.addRow("", myGaCode);
					} else if (msgL26.getH01FLGWK2().equals("T")) {
						myGaCode[0] = msgL26.getE01DPZGRT();
						myGaCode[1] = msgL26.getE01DPZDRE();
						myGaCode[2] = msgL26.getE01DPZDGA();
						myGaCode[3] =
							msgL26.getE01DPZFAD()
								+ "/"
								+ msgL26.getE01DPZFAM()
								+ "/"
								+ msgL26.getE01DPZFAY();
						myGaCode[4] = "";
						myGaCode[5] = "";

						gcode0726T.addRow("", myGaCode);
					}
					session.setAttribute("EDP072601Help", list);
					session.setAttribute("ga0726", gcode0726);
					session.setAttribute("ga0726T", gcode0726T);
					
					EDP072001Message msgRT = (EDP072001Message) mp.getMessageRecord("EDP072001");
					setMessageRecord(req, msgRT);
					session.setAttribute("msgRT", msgRT);
				}
				pageName = "EDP0720_proposals_header_maintenance.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void procSave400Ruta(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		
		JBObjList bl = (JBObjList) session.getAttribute("EDP073701Help");
		JBCreditProposalComm bComments = (JBCreditProposalComm) session.getAttribute("bComments");
		if (bComments == null) bComments = new JBCreditProposalComm();
		
		// SALVA COMENTARIOS header
		String npr = userPO.getIdentifier();
		String sq = "0";
		String prd = "";
		String typ = "";
		
		ELEERRMessage error = null;
		ELEERRMessage msgError = new ELEERRMessage();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0720", req);
			try {
				String comm = req.getParameter("E02DPAC99").trim();
				bComments.setCapacidadPago(comm.replace("\r\n", "�"));
				error = procSaveComments(mp, user, req, npr, sq, prd, typ, "99", comm);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				String comm = req.getParameter("E01DPSCOM").trim();
				bComments.setComRecomendacionesInstanciasResolutivas(comm.replace("\r\n", "�"));
				error = procSaveComments(mp, user, req, npr, sq, prd, typ, "98", comm);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			session.setAttribute("bComments", bComments);
			
			int numrec = Util.parseInt(req.getParameter("RECNUM"));
			try {
				userPO.setBank(req.getParameter("E01PLPBNK").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				userPO.setIdentifier(req.getParameter("E01PLPNPR").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			for (int i = 1; i < numrec; i++) {
				bl.setCurrentRow(i);
				EDP073701Message msgList = (EDP073701Message) mp.getMessageRecord("EDP073701");
				msgList.setH01USERID(user.getH01USR());
				msgList.setH01PROGRM("EDP0737");
				msgList.setH01TIMSYS(getTimeStamp());
				msgList.setH01OPECOD("0005");
				msgList.setE01PLPBNK(userPO.getBank());
				msgList.setE01PLTNPR(userPO.getIdentifier());
				try {
					msgList.setE01PLTPRO(req.getParameter("E01PLTPRO" + i).trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgList.setE01DPDD01(req.getParameter("E01DPDD" + i).trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgList.setE01DPDT01(req.getParameter("E01DPDT" + i).trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgList.setE01DPFR01(req.getParameter("E01DPFR" + i).trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgList.setE01DPUB01(req.getParameter("E01DPUB" + i).trim());
				} catch (Exception e) {
					msgList.setE01DPUB01("");
				}
				try {
					msgList.setE01DPOBSR(req.getParameter("E01DPOB" + i).trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgList.setE01PLPCN2(req.getParameter("E01PLPCN4").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgList.setE01PLPCN3(req.getParameter("E01PLPCN3").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				mp.sendMessage(msgList);
				MessageRecord msg = mp.receiveMessageRecord();
			}
			
			String opecode = "";
			if (userPO.getPurpose().equals("NEW")) {
				opecode = "0001";
			} else {
				try {
					opecode = req.getParameter("OPECOD").trim();
					if (opecode.equals("")) opecode = "0002";
				} catch (Exception e) {
					opecode = "0002";
				}
			}
			
			EDP072001Message msgRT = (EDP072001Message) session.getAttribute("msgRT");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDP0720");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD(opecode);
			
			setMessageRecord(req, msgRT);
			
			mp.sendMessage(msgRT);
			
			error = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgRT = (EDP072001Message) mp.receiveMessageRecord("EDP072001");
			
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
			
			if (mp.hasError(msgError)) {
				error = procReqProductsList(mp, user, req, res, session);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
				
				session.setAttribute("msgRT", msgRT);
				session.setAttribute("error", msgError);
				
				forward("EDP0720_proposals_header_maintenance.jsp", req, res);
			} else {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.creditproposal.JSEDP0720?SCREEN=100&OPTION=" + userPO.getOption());
			}
			
			
		} finally {
			if (mp != null) mp.close();
		}
	}


	private void procRPriorActiv(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		EDP072001Message msgRT = (EDP072001Message) session.getAttribute("msgRT");
		setMessageRecord(req, msgRT);
		session.setAttribute("msgRT", msgRT);
		
		forward("EDP0720_proposals_header_maintenance.jsp", req, res);
	}


	private void procReqNext_Activity(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		int inptOPT = 0;
		try {
			inptOPT = Integer.parseInt(req.getParameter("opt"));
			userPO.setHeader16("" + inptOPT);
		} catch (Exception e) {
			inptOPT = Integer.parseInt(userPO.getHeader16());
		}
		
		switch (inptOPT) {
		case 1 : // Apertura
			//userPO.setPurpose("NEW");
			//ses.setAttribute("userPO", userPO);
			procNext_Activity(user, req, res, session);
			break;
		case 2 : // Mext Activity		
			//userPO.setPurpose("NEXT ACTIVITY");
			//ses.setAttribute("userPO", userPO);
			procNext_Activity(user, req, res, session);
			break;
		case 5 : // Mext Activity Inquiry
			//userPO.setPurpose("INQUIRY");
			//ses.setAttribute("userPO", userPO);
			procNext_Activity(user, req, res, session);
			break;
		case 7 : // Forzar		
			//userPO.setPurpose("FORCE");
			//ses.setAttribute("userPO", userPO);
			procNext_Activity(user, req, res, session);
			break;
		case 9 : // Mext Activity	
			//userPO.setPurpose("NEXT ACTIVITY");
			//ses.setAttribute("userPO", userPO);
			procNext_Activity(user, req, res, session);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}


	private void procNext_Activity(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opt = userPO.getHeader16();
		
		String opecode = "0012";
		if (opt.equals("7")) {
			//FORZAR
			opecode = "0016";
		}
		try {
			userPO.setHeader22(req.getParameter("OPECOD").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			int idx = Integer.parseInt(req.getParameter("CURRCODE"));
			JBObjList bl = (JBObjList) session.getAttribute("EDP072001Help");
			EDP072001Message msgRT = (EDP072001Message) bl.get(idx);
			userPO.setIdentifier(msgRT.getE01PLPNPR());
			userPO.setType(msgRT.getE01PLPPTY());
			userPO.setBank(msgRT.getE01PLPBNK());
			userPO.setCusNum(msgRT.getE01PLPCUN());
			userPO.setHeader1(msgRT.getE01PLTPR0());
			userPO.setHeader2(msgRT.getE01CUSCUN());
			userPO.setHeader3(msgRT.getE01CUSNA1());
			userPO.setCusName(msgRT.getE01CUSNA1());
			userPO.setOfficer(msgRT.getE01XXXEJE());
			userPO.setCurrency(msgRT.getE01PLTCCY());
		} catch (Exception e) {
			// TODO: handle exception
		}
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0720", req);
			EDP072001Message msgRT = (EDP072001Message) mp.getMessageRecord("EDP072001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDP0720");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD(opecode);
			try {
				msgRT.setE01PLPNPR(req.getParameter("PROP").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			msgRT.setE01FILPRD(userPO.getProdCode());
			msgRT.setE01FILTYP(userPO.getType());
			msgRT.setE01FILEST(userPO.getHeader20());
			
			msgRT.setH01FLGWK3(req.getParameter("opt"));

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgRT = (EDP072001Message) mp.receiveMessageRecord("EDP072001");

			if (mp.hasError(msgError)) {
				userPO.setPurpose("INQUIRY");
				pageName = "EDP0720_proposals_list.js";
			} else {
				ELEERRMessage error = procReqProductsList(mp, user, req, res, session);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
				error = procReqGuaranteeList(mp, user, req, res, session);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
				procReqCommentsList(mp, user, req, res, session);
				
				error = procReqRecaudosN(mp, user, req, res, session);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
				
				if (mp.hasError(msgError)) {
					userPO.setPurpose("INQUIRY");
					pageName = "EDP0720_proposals_list.js";
				} else {
					JBList beanLP4 = getNextActivityJBList(msgRT);
					session.setAttribute("optLP4", beanLP4);
					
					pageName = "EDP0720_proposals_header_maintenance.jsp";
				}
				
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msgRT", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void procReqCommentsList(MessageProcessor mp,
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		getCommentsHeader(mp, user, req, res, session);
	}


	private void getCommentsHeader(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		// TRAER COMENTARIOS PARA PANTALLA DOFA'
		JBCreditProposalComm bComments = (JBCreditProposalComm) session.getAttribute("bComments");
		if (bComments == null) bComments = new JBCreditProposalComm();
		
		String propuesta = userPO.getIdentifier();
		String typeProd = "";//msgRT.getE01DPETYP();
		String codProd = "";//msgRT.getE01PLPPRO();
		String SeqFacil = "0";//sgRT.getE01PLPSEQ();
		JBListRec beanComm = procGetComments(mp, user, req, res, session, "80",	propuesta, SeqFacil, typeProd, codProd);
		beanComm.initRow();
		while (beanComm.getNextRow()) {
			String comm = beanComm.getRecord(1);
			if ("99".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {
				bComments.setCapacidadPago(comm.replace("\r\n", "�"));
			}
			if ("98".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {
				bComments.setComRecomendacionesInstanciasResolutivas(comm.replace("\r\n", "�"));
			}
		}
		session.setAttribute("bComments", bComments);
	}


	private void procSave400(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0720", req);
			EDP072001Message msgRT = (EDP072001Message) mp.getMessageRecord("EDP072001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDP072001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0099");
			try {
				msgRT.setH01FLGWK1(req.getParameter("opt").trim());
				userPO.setHeader16(req.getParameter("opt").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgRT = (EDP072001Message) mp.receiveMessageRecord("EDP072001");

			if (mp.hasError(msgError)) {
				pageName = "EDP0704_recaudos_maintenance.jsp";
				session.setAttribute("error", msgError);
				session.setAttribute("brnDetails", msgRT);

				forward(pageName, req, res);
			} else {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.creditproposal.JSEDP0720?SCREEN=400&opt=" + userPO.getHeader16());
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}


	private void procRSaveProd(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String prod = req.getParameter("E01PLTPRO") == null ? "" : req.getParameter("E01PLTPRO");
		String type = req.getParameter("E01PLTTYP") == null ? "" : req.getParameter("E01PLTTYP");
		
		EDP072001Message msgRT = (EDP072001Message) session.getAttribute("msgRT");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0721", req);
			EDP072101Message msgList = (EDP072101Message) session.getAttribute("msgList");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDP0721");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0005");
			
			setMessageRecord(req, msgList);
			
			msgList.setH01FLGWK1(userPO.getType());
			msgList.setE01PLPBNK(userPO.getBank());
			msgList.setE01PLTNPR(userPO.getIdentifier());
			msgList.setE01PLTCUN(userPO.getCusNum());
			msgList.setE01PLTPRO(prod);
			try {
				msgList.setE01PLTRRE(req.getParameter("E01PLTRREA1").trim());
			} catch (Exception e) {
			}
			msgRT.setE01DEAOBL(msgList.getE01DEAOBL());
			session.setAttribute("msgRT", msgRT);
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgList = (EDP072101Message) mp.receiveMessageRecord("EDP072101");

			if (!mp.hasError(msgError)) {
				ELEERRMessage error = procReqProductsList(mp, user, req, res, session);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
				error = procReqGuaranteeList(mp, user, req, res, session);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
				error = procReqRecaudosN(mp, user, req, res, session);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
				
				try {
					msgList.setE01PLTCN4(req.getParameter("E01PLPCN2").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgList.setE01PLTCN3(req.getParameter("E01PLPCN3").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				if (userPO.getPurpose().equals("NEW")) {
					msgRT.setE01PLTTY0(type);
					msgRT.setE01PLTPR0(prod);
					procReqProposalRouteDetails(mp, user, msgRT, session);
				}
				
				// SALVA COMENTARIOS 
				JBCreditProposalComm bComments = (JBCreditProposalComm) session.getAttribute("bComments");
				if( bComments == null) bComments = new JBCreditProposalComm();
				
				String npr = userPO.getIdentifier();
				String sq = "0";
				String prd = "";
				String typ = "";
				String comm;
				try {
					comm = req.getParameter("E02DPAC02").trim();
					bComments.setInfoGeneralSolicitante(comm);
					error = procSaveComments(mp, user, req, npr, sq, prd, typ, "02", comm);
					if (mp.hasError(error)) {
						addError(error, msgError);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					comm = req.getParameter("E02DPAC00").trim();
					bComments.setPrincipalesClientes(comm);
					error = procSaveComments(mp, user, req, npr, sq, prd, typ, "00", comm);
					if (mp.hasError(error)) {
						addError(error, msgError);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					comm = req.getParameter("E02DPAC05").trim();
					bComments.setPrincipalesProveedores(comm);
					error = procSaveComments(mp, user, req, npr, sq, prd, typ, "05", comm);
					if (mp.hasError(error)) {
						addError(error, msgError);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					comm = req.getParameter("E02DPAC01").trim();
					bComments.setDescInfraestructuraNegocio(comm);
					error = procSaveComments(mp, user, req, npr, sq, prd, typ, "10", comm);
					if (mp.hasError(error)) {
						addError(error, msgError);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					comm = req.getParameter("E02DPAC04").trim();
					bComments.setComImportantesNegocio(comm);
					error = procSaveComments(mp, user, req, npr, sq, prd, typ, "11", comm);
					if (mp.hasError(error)) {
						addError(error, msgError);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					comm = req.getParameter("E02DPAC06").trim();
					bComments.setResumenAnalisisSituacionFinanciera(comm);
					error = procSaveComments(mp, user, req, npr, sq, prd, typ, "06", comm);
					if (mp.hasError(error)) {
						addError(error, msgError);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					comm = req.getParameter("E02DPAC03").trim();
					bComments.setDescPropositoCredito(comm);
					error = procSaveComments(mp, user, req, npr, sq, prd, typ, "03", comm);
					if (mp.hasError(error)) {
						addError(error, msgError);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					comm = req.getParameter("E02DPAC09").trim();
					bComments.setAnalisisGarantias(comm);
					error = procSaveComments(mp, user, req, npr, sq, prd, typ, "09", comm);
					if (mp.hasError(error)) {
						addError(error, msgError);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				session.setAttribute("bComments", bComments);
			}
			
			if (mp.hasError(msgError)) {
				String appCode = msgList.getE01PLTACD();
				if (msgRT.getH01FLGWK3().equals("3")) {
					if (userPO.getType().equals("7")) {
						pageName = "EDP0720_proposals_product_inq_others.jsp";
					} else if (userPO.getType().equals("9")) {
						pageName = "EDP0720_proposals_product_inq_renews.jsp";
					} else {
						if (appCode.equals("10")) {
							pageName =	"EDP0720_proposals_product_inq_loans.jsp";
						} else if (appCode.equals("40")) {
							pageName =	"EDP0720_proposals_product_inq_letters.jsp";
						} else if (appCode.equals("43")) {
							pageName =	"EDP0720_proposals_product_inq_bailgranted.jsp";
						} else if (appCode.equals("90")) {
							pageName =	"EDP0720_proposals_product_inq_lines.jsp";
						}
					}
				} else {
					if (userPO.getType().equals("7")) {
						pageName = "EDP0720_proposals_product_maint_others.jsp";
					} else if (userPO.getType().equals("9")) {
						pageName = "EDP0720_proposals_product_maint_renews.jsp";
					} else {
						if (appCode.equals("10")) {
							pageName = "EDP0720_proposals_product_maint_loans.jsp";
						} else if (appCode.equals("40")) {
							pageName = "EDP0720_proposals_product_maint_letters.jsp";
						} else if (appCode.equals("43")) {
							pageName = "EDP0720_proposals_product_maint_bailgranted.jsp";
						} else if (appCode.equals("90")) {
							pageName = "EDP0720_proposals_product_maint_loans.jsp";
						}
					}
				}
			} else {
				pageName = "EDP0720_proposals_header_maintenance.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msgList", msgList);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private ELEERRMessage procSaveComments(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, String npr, String sq, String prd,
			String typ, String type, String comm) throws IOException {

		EDP020001Message msg200 = (EDP020001Message) mp.getMessageRecord("EDP020001");
		msg200.setH01USERID(user.getH01USR());
		msg200.setH01PROGRM("EDP0200");
		msg200.setH01TIMSYS(getTimeStamp());
		msg200.setH01SCRCOD("01");
		msg200.setH01OPECOD("0005");
		msg200.setE01DPANPR(npr);
		msg200.setE01DPASEF(sq);
		msg200.setE01DPAPRO(prd);
		msg200.setE01DPATYP(typ);
		msg200.setE01DPAMNS(type);
		msg200.setE01DPACOM(comm);

		mp.sendMessage(msg200);
		return (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
	}


	private ELEERRMessage procReqProposalRouteDetails(MessageProcessor mp,
			ESS0030DSMessage user, EDP072001Message msgRT, HttpSession session) throws IOException {
		
		msgRT.setH01USERID(user.getH01USR());
		msgRT.setH01PROGRM("EDP0720");
		msgRT.setH01TIMSYS(getTimeStamp());
		msgRT.setH01SCRCOD("01");
		msgRT.setH01OPECOD("0006"); //099

		mp.sendMessage(msgRT);
		ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
		msgRT = (EDP072001Message) mp.receiveMessageRecord("EDP072001");
		
		JBList beanLP4 = getNextActivityJBList(msgRT);
		
		session.setAttribute("optLP4", beanLP4);
		session.setAttribute("msgRT", msgRT);
		
		return msgError;
	}


	private JBList getNextActivityJBList(EDP072001Message msgDoc) {
		String myFlagP4 = "";
		String myOptionP4 = "";
		JBList beanLP4 = new JBList();

		if (msgDoc.getE01DPPD01().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP01()
					+ "\">"
					+ msgDoc.getE01DPPP01()
					+ " - "
					+ msgDoc.getE01DPPD01()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD02().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP02()
					+ "\">"
					+ msgDoc.getE01DPPP02()
					+ " - "
					+ msgDoc.getE01DPPD02()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD03().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP03()
					+ "\">"
					+ msgDoc.getE01DPPP03()
					+ " - "
					+ msgDoc.getE01DPPD03()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD04().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP04()
					+ "\">"
					+ msgDoc.getE01DPPP04()
					+ " - "
					+ msgDoc.getE01DPPD04()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD05().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP05()
					+ "\">"
					+ msgDoc.getE01DPPP05()
					+ " - "
					+ msgDoc.getE01DPPD05()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD06().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP06()
					+ "\">"
					+ msgDoc.getE01DPPP06()
					+ " - "
					+ msgDoc.getE01DPPD06()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD07().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP07()
					+ "\">"
					+ msgDoc.getE01DPPP07()
					+ " - "
					+ msgDoc.getE01DPPD07()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD08().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP08()
					+ "\">"
					+ msgDoc.getE01DPPP08()
					+ " - "
					+ msgDoc.getE01DPPD08()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD09().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP09()
					+ "\">"
					+ msgDoc.getE01DPPP09()
					+ " - "
					+ msgDoc.getE01DPPD09()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD10().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP10()
					+ "\">"
					+ msgDoc.getE01DPPP10()
					+ " - "
					+ msgDoc.getE01DPPD10()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD11().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP11()
					+ "\">"
					+ msgDoc.getE01DPPP11()
					+ " - "
					+ msgDoc.getE01DPPD11()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD12().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP12()
					+ "\">"
					+ msgDoc.getE01DPPP12()
					+ " - "
					+ msgDoc.getE01DPPD12()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD13().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP14()
					+ "\">"
					+ msgDoc.getE01DPPP14()
					+ " - "
					+ msgDoc.getE01DPPD14()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD14().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP15()
					+ "\">"
					+ msgDoc.getE01DPPP15()
					+ " - "
					+ msgDoc.getE01DPPD15()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD15().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP16()
					+ "\">"
					+ msgDoc.getE01DPPP16()
					+ " - "
					+ msgDoc.getE01DPPD16()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD16().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP17()
					+ "\">"
					+ msgDoc.getE01DPPP17()
					+ " - "
					+ msgDoc.getE01DPPD17()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD17().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP18()
					+ "\">"
					+ msgDoc.getE01DPPP18()
					+ " - "
					+ msgDoc.getE01DPPD18()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD18().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP19()
					+ "\">"
					+ msgDoc.getE01DPPP19()
					+ " - "
					+ msgDoc.getE01DPPD19()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD19().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP20()
					+ "\">"
					+ msgDoc.getE01DPPP20()
					+ " - "
					+ msgDoc.getE01DPPD20()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD20().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP21()
					+ "\">"
					+ msgDoc.getE01DPPP21()
					+ " - "
					+ msgDoc.getE01DPPD21()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD21().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP22()
					+ "\">"
					+ msgDoc.getE01DPPP22()
					+ " - "
					+ msgDoc.getE01DPPD22()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD22().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP23()
					+ "\">"
					+ msgDoc.getE01DPPP23()
					+ " - "
					+ msgDoc.getE01DPPD23()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		if (msgDoc.getE01DPPD23().length() != 0) {
			myOptionP4 =
				"<option value=\""
					+ msgDoc.getE01DPPP24()
					+ "\">"
					+ msgDoc.getE01DPPP24()
					+ " - "
					+ msgDoc.getE01DPPD24()
					+ "</option>";
			beanLP4.addRow(myFlagP4, myOptionP4);
		}
		return beanLP4;
	}


	private ELEERRMessage procReqRecaudosN(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		EDP073701Message msgList = (EDP073701Message) mp.getMessageRecord("EDP073701");
		msgList.setH01USERID(user.getH01USR());
		msgList.setH01PROGRM("EDP0737");
		msgList.setH01TIMSYS(getTimeStamp());
		msgList.setH01OPECOD("0015");
   	  	msgList.setE01PLPBNK(userPO.getBank());
		msgList.setE01PLTNPR(userPO.getIdentifier());
		try {
			msgList.setE01PLPCN2(req.getParameter("E01PLPCN2").trim());
		} catch (Exception e) {
			try {
				msgList.setE01PLPCN2(req.getParameter("E01PLPCN4").trim());
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		try {
			msgList.setE01PLPCN3(req.getParameter("E01PLPCN3".trim()));
		} catch (Exception e) {
			// TODO: handle exception
		}

		mp.sendMessage(msgList);
		ELEERRMessage msgError = (ELEERRMessage) mp
				.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");

		session.setAttribute("EDP073701Help", list);

		return msgError;
	}


	private ELEERRMessage procReqGuaranteeList(MessageProcessor mp,
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		EDP072601Message msgL26 = (EDP072601Message) mp.getMessageRecord("EDP072601");
		msgL26.setH01USERID(user.getH01USR());
		msgL26.setH01PROGRM("EDP072601");
		msgL26.setH01TIMSYS(getTimeStamp());
		msgL26.setH01SCRCOD("01");
		msgL26.setH01OPECOD("0015");
		msgL26.setE01DPENPR(userPO.getIdentifier());
		msgL26.setE01DPEBNK(userPO.getBank());

		mp.sendMessage(msgL26);
		ELEERRMessage msgError = (ELEERRMessage) mp
				.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");

		if (!mp.hasError(msgError)) {
			int colNum = 10;
			int gaColNum = 6;
			String myGaCode[] = new String[gaColNum];
			for (int i = 0; i < gaColNum; i++) {
				myGaCode[i] = "";
			}
			String myRow[] = new String[colNum];
			for (int i = 0; i < colNum; i++) {
				myRow[i] = "";
			}
			JBListRec gcode0726 = new JBListRec();
			gcode0726.init(gaColNum);
			JBListRec gcode0726T = new JBListRec();
			gcode0726T.init(gaColNum);
			
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msgL26 = (EDP072601Message) iterator.next();
				if ("G".equals(msgL26.getH01FLGWK2())) {
					myGaCode[0] = msgL26.getE01DPEREG();
					myGaCode[1] = msgL26.getE01DPEDRE();
					myGaCode[2] = Util.formatCustomDate(user.getE01DTF(),msgL26.getE01DPEFAD(), msgL26.getE01DPEFAM(), msgL26.getE01DPEFAY());
					myGaCode[3] = "";
					myGaCode[4] = "";
					myGaCode[5] = "";

					gcode0726.addRow("", myGaCode);
				} else if ("T".equals(msgL26.getH01FLGWK2())) {
					myGaCode[0] = msgL26.getE01DPZGRT();
					myGaCode[1] = msgL26.getE01DPZDRE();
					myGaCode[2] = msgL26.getE01DPZDGA();
					myGaCode[3] = Util.formatCustomDate(user.getE01DTF(),msgL26.getE01DPZFAD(), msgL26.getE01DPZFAM(), msgL26.getE01DPZFAY());
					myGaCode[4] = "";
					myGaCode[5] = "";

					gcode0726T.addRow("", myGaCode);
				}
			}
			session.setAttribute("EDP072601Help", list);
			session.setAttribute("ga0726", gcode0726);
			session.setAttribute("ga0726T", gcode0726T);
		}

		return msgError;
	}


	private ELEERRMessage procReqProductsList(MessageProcessor mp,
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		
		EDP072101Message msgL21 = (EDP072101Message) mp.getMessageRecord("EDP072101");
		msgL21.setH01USERID(user.getH01USR());
		msgL21.setH01PROGRM("EDP072101");
		msgL21.setH01TIMSYS(getTimeStamp());
		msgL21.setH01SCRCOD("01");
		msgL21.setH01OPECOD("0015");
		msgL21.setE01PLTNPR(userPO.getIdentifier());
		msgL21.setE01PLPBNK(userPO.getBank());

		mp.sendMessage(msgL21);
		ELEERRMessage msgError = (ELEERRMessage) mp
				.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");

		if (!mp.hasError(msgError)) {
			int colNum = 10;
			int gaColNum = 6;
			String myGaCode[] = new String[gaColNum];
			for (int i = 0; i < gaColNum; i++) {
				myGaCode[i] = "";
			}
			String myRow[] = new String[colNum];
			for (int i = 0; i < colNum; i++) {
				myRow[i] = "";
			}
			
			JBListRec gcodeList = new JBListRec();
			gcodeList.init(gaColNum);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msgL21 = (EDP072101Message) iterator.next();
				myGaCode[0] = msgL21.getE01PLTPRO();
				myGaCode[1] = msgL21.getE01PLTPRD();
				myGaCode[2] = msgL21.getE01PLTTYP();
				myGaCode[3] = msgL21.getE01PLTAMN();
				myGaCode[4] = msgL21.getE01PLTMAP();
				myGaCode[5] = msgL21.getE01PLTRU0() + " " + msgL21.getE01PLTRU1();
				gcodeList.addRow("", myGaCode);
			}
			session.setAttribute("gaCodeList", gcodeList);
			session.setAttribute("EDP072101Help", list);
		}

		return msgError;
	}


	private void procRFmtHeader(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("EDP0720_proposals_header_maintenance.jsp", req, res);
	}


	private void procRDetProd(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		
		EDP072001Message msgRT = (EDP072001Message) session.getAttribute("msgRT");
		setMessageRecord(req, msgRT);
		try {
			msgRT.setH01FLGWK3(req.getParameter("optH").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		msgRT.setE01PLPPTY(userPO.getType());
		session.setAttribute("msgRT", msgRT);
		
		JBObjList bl = (JBObjList) session.getAttribute("EDP072101Help");
		try {
			int idx = Integer.parseInt(req.getParameter("COLLCOD"));
			EDP072101Message msgList = (EDP072101Message) bl.get(idx);
			setMessageRecord(req, msgList);
			msgList.setE01PLTNPR(userPO.getIdentifier());
			msgList.setE01PLTPTY(userPO.getType());
			try {
				msgList.setE01PLTCN4(req.getParameter("E01PLPCN2").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgList.setE01PLTCN3(req.getParameter("E01PLPCN3").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			session.setAttribute("msgList", msgList);

			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("EDP0722", req);
				//EDP072201Message msgRTC = (EDP072201Message) session.getAttribute("msgRTC");
				EDP072201Message msgRTC = (EDP072201Message) mp.getMessageRecord("EDP072201");
				msgRTC.setH02USERID(user.getH01USR());
				msgRTC.setH02PROGRM("EDP0722");
				msgRTC.setH02TIMSYS(getTimeStamp());
				msgRTC.setH02SCRCOD("01");
				msgRTC.setH02OPECOD("0007");

				setMessageRecord(req, msgRTC);
				
				msgRTC.setE01PLTPTY(userPO.getType());
				msgRTC.setE02DPJBNK(userPO.getBank());
				msgRTC.setE02DPANPR(userPO.getIdentifier());
				
				msgRTC.setE02DPAPRO(msgList.getE01PLTPRO());
				msgRTC.setE02DPATYP(msgList.getE01PLTTYP());
				
				
				mp.sendMessage(msgRTC);
				ELEERRMessage msgError = (ELEERRMessage) mp
						.receiveMessageRecord("ELEERR");
				msgRTC = (EDP072201Message) mp.receiveMessageRecord("EDP072201");

				msgRTC.setE01PLTMNO(msgList.getE01PLTMNO());
				msgRTC.setE01PLTRA1(msgList.getE01PLTRA1());
				msgRTC.setE01PLTRA2(msgList.getE01PLTRA2());
				msgRTC.setE01PLTRA3(msgList.getE01PLTRA3());
				msgRTC.setE01PLTRV1(msgList.getE01PLTRV1());
				msgRTC.setE01PLTRV2(msgList.getE01PLTRV2());
				msgRTC.setE01PLTRV3(msgList.getE01PLTRV3());
				msgRTC.setE01PLTBL1(msgList.getE01PLTBL1());
				msgRTC.setE01PLTRRE(msgList.getE01PLTRRE());
				
				if (mp.hasError(msgError)) {
					session.setAttribute("error", msgError);
					pageName = "EDP0720_proposals_header_maintenance.jsp";
				} else {
					session.setAttribute("msgRTC", msgRTC);
					if (getCommentsProduct(mp, userPO, user, req, res, session)) {
						String appCode = msgList.getE01PLTACD();
						if (msgRT.getH01FLGWK3().equals("3")) {
							if (userPO.getType().equals("7")) {
								pageName = "EDP0720_proposals_product_inq_others.jsp";
							} else if (userPO.getType().equals("9")) {
								pageName = "EDP0720_proposals_product_inq_renews.jsp";
							} else {
								if (appCode.equals("10")) {
									pageName = "EDP0720_proposals_product_inq_loans.jsp";
								} else if (appCode.equals("40")) {
									pageName =	"EDP0720_proposals_product_inq_letters.jsp";
								} else if (appCode.equals("43")) {
									pageName =	"EDP0720_proposals_product_inq_bailgranted.jsp";
								} else if (appCode.equals("90")) {
									pageName = "EDP0720_proposals_product_inq_lines.jsp";
								}
							}
						} else {
							if (userPO.getType().equals("7")) {
								pageName = "EDP0720_proposals_product_maint_others.jsp";
							} else if (userPO.getType().equals("9")) {
								pageName = "EDP0720_proposals_product_maint_renews.jsp";
							} else {
								if (appCode.equals("10")) {
									pageName =	"EDP0720_proposals_product_maint_loans.jsp";
								} else if (appCode.equals("40")) {
									pageName =	"EDP0720_proposals_product_maint_letters.jsp";
								} else if (appCode.equals("43")) {
									pageName =	"EDP0720_proposals_product_maint_bailgranted.jsp";
								} else if (appCode.equals("90")) {
									pageName =	"EDP0720_proposals_product_maint_loans.jsp";
								}
							}
						}
					} else {//Error
						pageName = "EDP0720_proposals_header_maintenance.jsp";
					}
				}
				
				forward(pageName, req, res);
				
			} finally {
				if (mp != null)
					mp.close();
			}
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
	}


	private boolean getCommentsProduct(MessageProcessor mp, UserPos userPO, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		// TRAER COMENTARIOS PARA PANTALLA Product'
		JBCreditProposalComm bComments = (JBCreditProposalComm) session.getAttribute("bComments");

		if(bComments == null)
			bComments = new JBCreditProposalComm();
		
		String propuesta = userPO.getIdentifier();
		String typeProd = "";//msgRT.getE01DPETYP();
		String codProd = "";//msgRT.getE01PLPPRO();
		String SeqFacil = "0";//sgRT.getE01PLPSEQ();
		JBListRec beanComm = procGetComments(mp, user, req, res, session, "11",	propuesta, SeqFacil, typeProd, codProd);
		
		if (beanComm != null) {
			beanComm.initRow();
			while (beanComm.getNextRow()) {
				String comm=beanComm.getRecord(1);
				if ("02".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {
					bComments.setInfoGeneralSolicitante(comm);
				}
				if ("00".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {
					bComments.setPrincipalesClientes(comm);
				}
				if ("05".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {
					bComments.setPrincipalesProveedores(comm);
				}
				if ("10".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {//01
					bComments.setDescInfraestructuraNegocio(comm);
				}
				if ("11".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {//04
					bComments.setComImportantesNegocio(comm);
				}
				if ("06".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {
					bComments.setResumenAnalisisSituacionFinanciera(comm);
				}
				if ("03".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {
					bComments.setDescPropositoCredito(comm);
				}
				if ("09".equals(beanComm.getRecord(0)) && !"".equals(beanComm.getRecord(1))) {
					bComments.setAnalisisGarantias(comm);
				}
			}
			session.setAttribute("bComments", bComments);
			return true;
		} else {
			return false;
		}
	}


	private JBListRec procGetComments(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String type, String propuesta,
			String seqFacil, String typeProd, String codProd) throws IOException {
		
		EDP020001Message msg200 = (EDP020001Message) mp.getMessageRecord("EDP020001");
		msg200.setH01USERID(user.getH01USR());
		msg200.setH01PROGRM("EDP0200");
		msg200.setH01TIMSYS(getTimeStamp());
		msg200.setH01SCRCOD("01");
		msg200.setH01OPECOD("0015");
		msg200.setE01DPANPR(propuesta);
		msg200.setE01DPASEF(seqFacil);
		msg200.setE01DPAPRO(codProd);
		msg200.setE01DPATYP(typeProd);
		msg200.setE01DPATCO(type);

		mp.sendMessage(msg200);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
			return null;
		} else {
			int gaColNum = 2;
			JBListRec gcode200 = new JBListRec();
			gcode200.init(gaColNum);
			String myGaCode[] = new String[gaColNum];
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msg200 = (EDP020001Message) iterator.next();
				myGaCode[0] = msg200.getE01DPAMNS();
				myGaCode[1] = msg200.getE01DPACOM();

				gcode200.addRow("", myGaCode);
			}
			return gcode200;
		}
	}


	private void procRNewProd(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		EDP072001Message msgRT = (EDP072001Message) session.getAttribute("msgRT");
		
		setMessageRecord(req, msgRT);
		
		try {
			msgRT.setH01FLGWK3(req.getParameter("optH").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			msgRT.setE01PLPCN4(req.getParameter("E01PLPCN2").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			msgRT.setE01PLPCN3(req.getParameter("E01PLPCN3").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		session.setAttribute("msgRT", msgRT);
		
		forward("EDP0720_proposals_product_enter_maint.jsp", req, res);
	}


	private void procProductPos(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		int inptOPT = Util.parseInt(req.getParameter("opt"));
		switch (inptOPT) {
		case 1 : //new
			userPO.setHeader17("0");
			userPO.setHeader18("0");
			break;
		case 2 : //Maintenance
			userPO.setHeader17("1");
			userPO.setHeader18("0");
			//procReqMaintenance(user, req, res, ses);
			break;
		case 3 : //Delete
			userPO.setHeader17("1");
			userPO.setHeader18("1");
			//procReqDelete(user, req, res, ses);
			break;
		case 5 : //Consulta
			userPO.setHeader17("1");
			userPO.setHeader18("1");
			//procReqConsulta(user, req, res, ses);
			break;
		default :
			//Consulta
			res.sendRedirect(srctx + "/servlet/datapro.eibs.creditproposer.JSEDP0704?SCREEN=500");
			break;
		}
	}


	private void procReqNewProposal(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("NEW");
		try {
			userPO.setType(req.getParameter("E01PLPPTY").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setCusNum(req.getParameter("E01CUSCUN").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setHeader4(req.getParameter("E01PLPCN3").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setHeader5(req.getParameter("E01XXXEST").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0720", req);
			EDP072001Message msgRT = (EDP072001Message) mp.getMessageRecord("EDP072001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDP0720");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0003");
			msgRT.setH01FLGWK3("");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgRT = (EDP072001Message) mp.receiveMessageRecord("EDP072001");

			if (mp.hasError(msgError)) {
				pageName = "EDP0720_proposals_enter_maintenance.jsp";
			} else {
				userPO.setIdentifier(msgRT.getE01PLPNPR());
				try {
					msgRT.setE01PLPCN4(req.getParameter("E01PLPCN2").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgRT.setE01PLPCN3(req.getParameter("E01PLPCN3").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				pageName = "EDP0720_proposals_new.jsp?NEW=N";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msgRT", msgRT);
			
			JBListRec gaCodeList = new JBListRec();
			gaCodeList.init(0);
			session.setAttribute("gaCodeList", gaCodeList);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void procReqEnterNewProposal(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("NEW");
		
		forward("EDP0720_proposals_enter_maintenance.jsp", req, res);
	}


	private void procActionEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		
		String DESINCORPORADAS = req.getParameter("E01YYYFIL") == null ? "" : req.getParameter("E01YYYFIL").trim();
		String RENOVAR = req.getParameter("E01XXXFIL") == null ? "" : req.getParameter("E01XXXFIL").trim();
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0720", req);
			EDP072001Message msgList = (EDP072001Message) mp.getMessageRecord("EDP072001");
			
			try {
				userPO.setBank(req.getParameter("BNK").trim());
			} catch (Exception e) {
				try {
					userPO.setBank(req.getParameter("E01PLPBNK").trim());
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			try {
				userPO.setProdCode(req.getParameter("E01FILPRD").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				userPO.setBranch(req.getParameter("E01FILBRN").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				userPO.setCusNum(req.getParameter("E01FILCUN").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				userPO.setID(req.getParameter("E01FILUSR").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				userPO.setAccOpt(req.getParameter("E01FILRUT").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				userPO.setHeader19(req.getParameter("E01FILTYP").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				userPO.setHeader20(req.getParameter("E01FILEST").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				userPO.setCusName(req.getParameter("D01FILCUN").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDP0720");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			setMessageRecord(req, msgList);
			
			msgList.setE01PLPBNK(userPO.getBank());
			msgList.setE01PLPBRN(userPO.getBranch());
			msgList.setE01PLPRUT(userPO.getHeader15());
			msgList.setE01FILCUN(userPO.getCusNum());
			msgList.setE01FILPRD(userPO.getProdCode());
			msgList.setE01FILTYP(userPO.getType());
			msgList.setE01FILBRN(userPO.getBranch());
			msgList.setE01PLPCN4(userPO.getAccOpt());
			msgList.setE01PLPUAP(userPO.getID());
			msgList.setE01FILEST(userPO.getHeader20());
			try {
				msgList.setE01PLPCN4(req.getParameter("E01FILRUT").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgList.setE01PLPUAP(req.getParameter("E01FILUSR").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgList.setE01RECPOS("" + Integer.parseInt(req.getParameter("Pos")));
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			if (userPO.getOption().equals("1")) {
				if (DESINCORPORADAS.equals("0")) {
					msgList.setH01FLGWK2("1");
				} else if (DESINCORPORADAS.equals("1")) {
					if (RENOVAR.equals("1")) {
						msgList.setH01FLGWK2("5");
						userPO.setOption("5");
					} else {
						msgList.setH01FLGWK2("3");
						userPO.setOption("3");
					}
				} else {
					msgList.setH01FLGWK2("1");
				}
			} else if (userPO.getOption().equals("2")) {
				if (DESINCORPORADAS.equals("0")) {
					msgList.setH01FLGWK2("2");
				} else if (DESINCORPORADAS.equals("1")) {
					if (RENOVAR.equals("1")) {
						msgList.setH01FLGWK2("5");
						userPO.setOption("5");
					} else {
						msgList.setH01FLGWK2("4");
						userPO.setOption("4");
					}
				} else {
					msgList.setH01FLGWK2("1");
				}
			} else if (userPO.getOption().equals("5")) {
				msgList.setH01FLGWK2("5");
			}

			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList beanList = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(msgError)) {
				pageName = "EDP0720_proposals_filter.jsp";
			} else {
				pageName = "EDP0720_proposals_list.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("EDP072001Help", beanList);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void procReqFilter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		
		int option = 0;
		try {
			option = Integer.parseInt(req.getParameter("OPTION"));
			userPO.setOption(req.getParameter("OPTION").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		userPO.setPurpose(option == 1 ? "MAINTENANCE" : "INQUIRY");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0746", req);
			EDP074601Message msgList746 = (EDP074601Message) mp.getMessageRecord("EDP074601");
			msgList746.setH01USERID(user.getH01USR());
			msgList746.setH01PROGRM("EDP0746");
			msgList746.setH01TIMSYS(getTimeStamp());
			msgList746.setH01OPECOD("0015");

			mp.sendMessage(msgList746);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList746 = new JBList();
				String myOption = "<option value=\"\"></option>";
				beanList746.addRow("", myOption);
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msgList746 = (EDP074601Message) iterator.next();
					myOption =
							"<option value=\"" 	
							+ msgList746.getE01BTHUSR() + "\">"
								+ msgList746.getE01BTHUSR()
								+ " - " + msgList746.getE01BTHNME()
								+ "</option>";
					beanList746.addRow("", myOption);				
				}
				session.setAttribute("optList746", beanList746);
				pageName = "EDP0720_proposals_filter.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}
package datapro.eibs.client;

/**
* Insert the type's description here.
* Creation date: (1/19/00 6:08:55 PM)
* Fixed by: erodriguez
*/

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ERA001102Message;
import datapro.eibs.beans.ERA005000Message;
import datapro.eibs.beans.ERA005501Message;
import datapro.eibs.beans.ERA006001Message;
import datapro.eibs.beans.ERA006101Message;
import datapro.eibs.beans.ERA006203Message;
import datapro.eibs.beans.ERA006401Message;
import datapro.eibs.beans.ERA006501Message;
import datapro.eibs.beans.ERA006601Message;
import datapro.eibs.beans.ERA006701Message;
import datapro.eibs.beans.ERA006801Message;
import datapro.eibs.beans.ERA006901Message;
import datapro.eibs.beans.ERA007201Message;
import datapro.eibs.beans.ERA007301Message;
import datapro.eibs.beans.ERA007401Message;
import datapro.eibs.beans.ERA007601Message;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

public class JSERA0050 extends JSEIBSServlet {

	protected static final int A_ENTER_NEW = 400;	
	protected static final int A_NEW = 500;
	protected static final int A_MAINTENANCE = 200;
	
	protected static final int A_DELETE = 600;
	protected static final int R_RELEASE = 700;
	protected static final int A_RELEASE = 750;
	protected static final int A_GA_BASIC = 2;
	protected static final int A_GA_DETAIL_LIST = 4;

	protected static final int A_GA_NONE_ACC = 8;
	protected static final int A_INST_SPECIAL = 12;
	protected static final int A_SPECIAL_COD = 10;
	protected static final int A_TR_COLL = 14;
	// options
	protected static final int R_GA_BASIC = 1;
	protected static final int R_GA_DETAIL_LIST = 3;
	protected static final int R_INST_SPECIAL = 11;
	protected static final int R_SPECIAL_COD = 9;
	protected static final int R_ELIMINAR = 16;
	
	// Mantenimiento Inmuebles 'B'
	protected static final int REQ_B = 101;
	protected static final int ACT_B = 201;
	
	// Mantenimiento Prenda Vehiculos 'V'
	protected static final int REQ_V = 102;
	protected static final int ACT_V = 202;
	
	// Mantenimiento Prenda Prenda Industrial 'F'
	protected static final int REQ_F = 103;
	protected static final int ACT_F = 203;
	
	// Mantenimiento Prenda Avales 'I'
	protected static final int REQ_I = 104;
	protected static final int ACT_I = 204;
	
	// Mantenimiento Prenda Avales 'C' depositos en cuenta
	protected static final int REQ_C = 105;
	protected static final int ACT_C = 205;
	
	// Mantenimiento Cesion de Derechos economicos '1'
	protected static final int REQ_1 = 106;
	protected static final int ACT_1 = 206;
	
	// Mantenimiento Fiducias '4' '5'
	protected static final int REQ_4 = 107;
	protected static final int ACT_4 = 207;

	// Mantenimiento Pignoracion de rentas '8'
	protected static final int REQ_8 = 108;
	protected static final int ACT_8 = 208;

	// Mantenimiento Acciones y Otros Titulos Valores
	protected static final int REQ_9 = 109;
	protected static final int ACT_9 = 209;

	// Mantenimiento Garantias FNG
	protected static final int REQ_10 = 110;
	protected static final int ACT_10 = 210;

	// Mantenimiento Seguros 
	protected static final int REQ_INS = 111;
	protected static final int ACT_INS = 211;

	// entering options
	protected static final int R_ENTER = 100;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		// Request
		case R_GA_BASIC :
			procReqCollBasic(user, req, res, session);
			break;
		case R_ELIMINAR :
			procReqDeleteCollBasic(user, req, res, session);
			break;
		case R_GA_DETAIL_LIST :
			procReqCollListDet(user, req, res, session);
			break;
		case R_SPECIAL_COD :
			procReqCodes(user, req, res, session);
			break;
			//entering options
		case R_ENTER :
			procReqEnter(user, req, res, session);
			break;
		case R_INST_SPECIAL :
			procReqEspInst(user, req, res, session);
			break;
			// action options
		case A_GA_BASIC :
			procActionCollBasic(user, req, res, session);
			break;
		case A_GA_DETAIL_LIST :
			procActionCollListDet(user, req, res, session);
			break;
		case A_ENTER_NEW :
			procActionEnterNew(user, req, res, session);
			break;
		case A_NEW :
			procActionNew(user, req, res, session);
			break;
		case A_MAINTENANCE :
		case A_GA_NONE_ACC :
			procActionEnter(user, req, res, session);
			break;
		case A_DELETE :
			procActionDelete(user, req, res, session);
			break;
			//LIBERACION GARANTIAS 
		case R_RELEASE :
			procReqRelease(user, req, res, session);
			break;
		case A_RELEASE :
			procActionRelease(user, req, res, session);
			break;
		case A_TR_COLL :
			//procActionAddDetail(mc,user, req, res, session);
			break;
		case A_SPECIAL_COD :
			procActionCodes(user, req, res, session);
			break;
		case A_INST_SPECIAL :
			procActionEspInst(user, req, res, session);
			break;
		//NUEVO DESARROLLO
		case REQ_B : //INMUEBLES
		case REQ_V : //PRENDA VEHICULOS 'V'
		case REQ_F : //PRENDA INDUSTRIAL 'G'
		case REQ_I : //AVALES 'I'
		case REQ_C : //AVALES 'C'
		case REQ_1 : //CESION DERECHOS ECONOMICOS '1'
		case REQ_4 : //FIDUCIA EN GARANTIA Y FIDUCIA ADMON Y FTE DE PAGO '4'/'5'
		case REQ_8 : //PIGNORACION DE RENTAS
		case REQ_9 : //PIGNORACION DE RENTAS
		case REQ_10 : //GARANTIAS FNG
			procUpdConsGar(user, req, res, session, screen);
			break;
		case ACT_B :
			procActionB(user, req, res, session);
			break;
			//SEGUROS
		case REQ_INS :
		case ACT_INS :
			procActionIns(user, req, res, session);
			break;
		case ACT_V :
			procActionV(user, req, res, session);
			break;
		case ACT_F :
			procActionF(user, req, res, session);
			break;
		case ACT_I :
			procActionI(user, req, res, session);
			break;
		case ACT_C :
			procActionC(user, req, res, session);
			break;
		case ACT_1 :
			procAction1(user, req, res, session);
			break;
		case ACT_4 :
			procAction4(user, req, res, session);
			break;
		case ACT_8 :
			procAction8(user, req, res, session);
			break;
		case ACT_9 :
			procAction9(user, req, res, session);
			break;
		case ACT_10 :
			procAction10(user, req, res, session);
			break;
		//FIN NUEVO DESARROLLO						
		default :
			forward(devPage, req, res);
			break;
		}
	}

	//NUEVO DESARROLLO
	private void procAction10(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0061", req);
			procAction10(mp, user, req, res, session);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procAction10(MessageProcessor mp, ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "";
		String opecode = "";
		try {
			opecode = req.getParameter("OPECOD").trim();
		} catch (Exception e) {
			opecode = "0004";
		}
		String refere = "";
		try {
			refere = req.getParameter("E01ROCREF").trim();
		} catch (Exception e) {
			refere = "";
		}
		String seqbien = "";
		try {
			seqbien = req.getParameter("SEQBIEN").trim();
		} catch (Exception e) {
			seqbien = "";
		}
		String coltyp = "";
		try {
			coltyp = req.getParameter("E01ROCTYP").trim();
		} catch (Exception e) {
			coltyp = req.getParameter("E01R02TYP");
		}
		String colprd = "";
		try {
			colprd = req.getParameter("E01ROCPRD").trim();
		} catch (Exception e) {
			colprd = req.getParameter("E01R02PRD");
		}
		String isConfec = "N";
		try {
			isConfec = req.getParameter("E01ROCRGK").trim();
		} catch (Exception e) {
			isConfec = userPO.getOption();
		}
		String purpose = "";
		try {
			purpose = req.getParameter("PURPOSE").trim();
		} catch (Exception e) {
			purpose = "";
		}

		String inqMnt = "";
		if (purpose.equals("INQUIRY")) {
			inqMnt = "05";
		} else if (purpose.equals("APPROVE")) {
			inqMnt = "04";
		} else {
			inqMnt = "01";
		}
		
		ERA006101Message msgL61 = (ERA006101Message) mp.getMessageRecord("ERA006101");
		msgL61.setH01USERID(user.getH01USR());
		msgL61.setH01PROGRM("ERA0061");
		msgL61.setH01TIMSYS(getTimeStamp());
		msgL61.setH01SCRCOD(inqMnt);
		msgL61.setH01OPECOD(opecode);
		msgL61.setE01R02REF(refere);
		msgL61.setE01R02SEQ(seqbien);
		msgL61.setE01R02TYP(coltyp);
		if (opecode.equals("0001")) {
			try {
				msgL61.setE01R02NRE(req.getParameter("E01RESNRE").trim());
			} catch (Exception e) {
				msgL61.setE01R02NRE("0");
			}
		} else if (opecode.equals("0002")) {
			setMessageRecord(req, msgL61);
		}

		
		ELEERRMessage msgError = new ELEERRMessage();
		ELEERRMessage error = null;
		
		if (isConfec.equals("Y") || isConfec.equals("S")) {
			error = procReqConfFld(mp, user, req, res, session, msgL61.getE01R02BNK(), refere, coltyp, colprd, seqbien, opecode, inqMnt);
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
		}
		
		mp.sendMessage(msgL61);
		error = (ELEERRMessage) mp
				.receiveMessageRecord("ELEERR");
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		msgL61 = (ERA006101Message) mp.receiveMessageRecord("ERA006101");

		error = procReqExtFld(mp, user, req, res, session, msgL61.getE01R02BNK(), msgL61.getE01R02REF(), msgL61.getE01R02TYP(), msgL61.getE01R02PRD(), msgL61.getE01R02SEQ(), opecode, inqMnt);
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		session.setAttribute("gaDetail", msgL61);
		session.setAttribute("error", msgError);
		
		if (mp.hasError(msgError)) {
			if (msgL61.getE01R02TYP().equals("Y")) {
				pageName = "ERA0061_ga_detail_FNG.jsp";
			} else if (msgL61.getE01R02TYP().equals("X")) {
				pageName = "ERA0061_ga_detail_FAG.jsp";
			} else {
				pageName = "error_viewer.jsp";
			}
			forward(pageName, req, res);
		} else {
			//procReqListIns(mp, user, req, res, session, msgL69.getE01R07BNK(), msgL69.getE01R07REF(), msgL69.getE01R07SEQ(), inqMnt);
			if (opecode.equals("0002") || opecode.equals("0003")) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0050?SCREEN=200&REF=" + refere + "&PURPOSE=" + purpose);
			} else { // Check it?
				if (msgL61.getE01R02TYP().equals("Y")) {
					pageName = "ERA0061_ga_detail_FNG.jsp";
				} else if (msgL61.getE01R02TYP().equals("X")) {
					pageName = "ERA0061_ga_detail_FAG.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
				forward(pageName, req, res);
			}
		}
	}

	private void procAction9(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0074", req);
			procAction9(mp, user, req, res, session);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procAction9(MessageProcessor mp, ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "";
		String opecode = "";
		try {
			opecode = req.getParameter("OPECOD").trim();
		} catch (Exception e) {
			opecode = "0004";
		}
		String refere = "";
		try {
			refere = req.getParameter("E01ROCREF").trim();
		} catch (Exception e) {
			refere = "";
		}
		String seqbien = "";
		try {
			seqbien = req.getParameter("SEQBIEN").trim();
		} catch (Exception e) {
			seqbien = "";
		}
		String isConfec = "N";
		try {
			isConfec = req.getParameter("E01ROCRGK").trim();
		} catch (Exception e) {
			isConfec = userPO.getOption();
		}
		String purpose = "";
		try {
			purpose = req.getParameter("PURPOSE").trim();
		} catch (Exception e) {
			purpose = "";
		}

		String inqMnt = "";
		if (purpose.equals("INQUIRY")) {
			inqMnt = "05";
		} else if (purpose.equals("APPROVE")) {
			inqMnt = "04";
		} else {
			inqMnt = "01";
		}
		
		ERA007401Message msgL74 = (ERA007401Message) mp.getMessageRecord("ERA007401");
		msgL74.setH01USERID(user.getH01USR());
		msgL74.setH01PROGRM("ERA0074");
		msgL74.setH01TIMSYS(getTimeStamp());
		msgL74.setH01SCRCOD(inqMnt);
		msgL74.setH01OPECOD(opecode);
		msgL74.setE01R09REF(refere);
		msgL74.setE01R09SEQ(seqbien);
		
		if (opecode.equals("0002")) {
			setMessageRecord(req, msgL74);
		}
		String coltyp = "";
		try {
			coltyp = req.getParameter("E01ROCTYP").trim();
		} catch (Exception e) {
			coltyp = msgL74.getE01R09TYP();
		}
		String colprd = "";
		try {
			colprd = req.getParameter("E01ROCPRD").trim();
		} catch (Exception e) {
			colprd = msgL74.getE01R09PRD();
		}
		
		ELEERRMessage msgError = new ELEERRMessage();
		ELEERRMessage error = null;
		
		if (isConfec.equals("Y") || isConfec.equals("S")) {
			error = procReqConfFld(mp, user, req, res, session, msgL74.getE01R09BNK(), refere, coltyp, colprd, seqbien, opecode, inqMnt);
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
		}
		
		mp.sendMessage(msgL74);
		error = (ELEERRMessage) mp
				.receiveMessageRecord("ELEERR");
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		msgL74 = (ERA007401Message) mp.receiveMessageRecord("ERA007401");

		error = procReqExtFld(mp, user, req, res, session, msgL74.getE01R09BNK(), msgL74.getE01R09REF(), msgL74.getE01R09TYP(), msgL74.getE01R09PRD(), msgL74.getE01R09SEQ(), opecode, inqMnt);
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		session.setAttribute("gaDetail", msgL74);
		session.setAttribute("error", msgError);

		if (mp.hasError(msgError)) {
			if (msgL74.getE01R09TYP().equals("7")) {
				pageName = "ERA0074_ga_detail_otros_titulos_7.jsp";
			} else if (msgL74.getE01R09TYP().equals("9")) {
				pageName = "ERA0074_ga_detail_acciones_9.jsp";
			} else {
				pageName = "error_viewer.jsp";
			}
			forward(pageName, req, res);
		} else {
			//procReqListIns(mp, user, req, res, session, msgL69.getE01R07BNK(), msgL69.getE01R07REF(), msgL69.getE01R07SEQ(), inqMnt);
			if (opecode.equals("0002") || opecode.equals("0003")) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0050?SCREEN=200&REF=" + refere + "&PURPOSE=" + purpose);
			} else { // Check it?
				if (msgL74.getE01R09TYP().equals("7")) {
					pageName = "ERA0074_ga_detail_otros_titulos_7.jsp";
				} else if (msgL74.getE01R09TYP().equals("9")) {
					pageName = "ERA0074_ga_detail_acciones_9.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
				forward(pageName, req, res);
			}
		}
	}

	private void procAction8(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0069", req);
			procAction8(mp, user, req, res, session);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procAction8(MessageProcessor mp, ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String opecode = "";
		try {
			opecode = req.getParameter("OPECOD").trim();
		} catch (Exception e) {
			opecode = "0004";
		}
		String refere = "";
		try {
			refere = req.getParameter("E01ROCREF").trim();
		} catch (Exception e) {
			refere = "";
		}
		String seqbien = "";
		try {
			seqbien = req.getParameter("SEQBIEN").trim();
		} catch (Exception e) {
			seqbien = "";
		}
		String isConfec = "N";
		try {
			isConfec = req.getParameter("E01ROCRGK").trim();
		} catch (Exception e) {
			isConfec = userPO.getOption();
		}
		String purpose = "";
		try {
			purpose = req.getParameter("PURPOSE").trim();
		} catch (Exception e) {
			purpose = "";
		}

		String inqMnt = "";
		if (purpose.equals("INQUIRY")) {
			inqMnt = "05";
		} else if (purpose.equals("APPROVE")) {
			inqMnt = "04";
		} else {
			inqMnt = "01";
		}

		ERA007301Message msgL73 = (ERA007301Message) mp.getMessageRecord("ERA007301");
		msgL73.setH01USERID(user.getH01USR());
		msgL73.setH01PROGRM("ERA0069");
		msgL73.setH01TIMSYS(getTimeStamp());
		msgL73.setH01SCRCOD(inqMnt);
		msgL73.setH01OPECOD(opecode);
		msgL73.setE01R08REF(refere);
		msgL73.setE01R08SEQ(seqbien);
		
		if (opecode.equals("0002")) {
			setMessageRecord(req, msgL73);
		}
		String coltyp = "";
		try {
			coltyp = req.getParameter("E01ROCTYP").trim();
		} catch (Exception e) {
			coltyp = msgL73.getE01R08TYP();
		}
		String colprd = "";
		try {
			colprd = req.getParameter("E01ROCPRD").trim();
		} catch (Exception e) {
			colprd = msgL73.getE01R08PRD();
		}

		ELEERRMessage msgError = new ELEERRMessage();
		ELEERRMessage error = null;
		
		if (isConfec.equals("Y") || isConfec.equals("S")) {
			error = procReqConfFld(mp, user, req, res, session, msgL73.getE01R08BNK(), refere, coltyp, colprd, seqbien, opecode, inqMnt);
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
		}
		
		mp.sendMessage(msgL73);
		error = (ELEERRMessage) mp
				.receiveMessageRecord("ELEERR");
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		msgL73 = (ERA007301Message) mp.receiveMessageRecord("ERA007301");

		error = procReqExtFld(mp, user, req, res, session, msgL73.getE01R08BNK(), msgL73.getE01R08REF(), msgL73.getE01R08TYP(), msgL73.getE01R08PRD(), msgL73.getE01R08SEQ(), opecode, inqMnt);
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		session.setAttribute("error", msgError);
		session.setAttribute("gaDetail", msgL73);
		
		if (mp.hasError(msgError)) {
			forward("ERA0073_ga_detail_pignoracion_8.jsp", req, res);
		} else {
			//procReqListIns(mp, user, req, res, session, msgL69.getE01R07BNK(), msgL69.getE01R07REF(), msgL69.getE01R07SEQ(), inqMnt);
			if (opecode.equals("0002") || opecode.equals("0003")) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0050?SCREEN=200&REF=" + refere + "&PURPOSE=" + purpose);
			} else { // Check it?
				forward("ERA0073_ga_detail_pignoracion_8.jsp", req, res);
			}
		}
	}

	private void procAction4(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0068", req);
			procAction4(mp, user, req, res, session);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procAction4(MessageProcessor mp, ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "";
		String opecode = "";
		try {
			opecode = req.getParameter("OPECOD").trim();
		} catch (Exception e) {
			opecode = "0004";
		}
		String refere = "";
		try {
			refere = req.getParameter("E01ROCREF").trim();
		} catch (Exception e) {
			refere = "";
		}
		String seqbien = "";
		try {
			seqbien = req.getParameter("SEQBIEN").trim();
		} catch (Exception e) {
			seqbien = "";
		}
		String isConfec = "N";
		try {
			isConfec = req.getParameter("E01ROCRGK").trim();
		} catch (Exception e) {
			isConfec = userPO.getOption();
		}
		String purpose = "";
		try {
			purpose = req.getParameter("PURPOSE").trim();
		} catch (Exception e) {
			purpose = "";
		}

		String inqMnt = "";
		if (purpose.equals("INQUIRY")) {
			inqMnt = "05";
		} else if (purpose.equals("APPROVE")) {
			inqMnt = "04";
		} else {
			inqMnt = "01";
		}

		ERA006901Message msgL69 = (ERA006901Message) mp.getMessageRecord("ERA006901");
		msgL69.setH01USERID(user.getH01USR());
		msgL69.setH01PROGRM("ERA0069");
		msgL69.setH01TIMSYS(getTimeStamp());
		msgL69.setH01SCRCOD(inqMnt);
		msgL69.setH01OPECOD(opecode);
		msgL69.setE01R07REF(refere);
		msgL69.setE01R07SEQ(seqbien);
		
		if (opecode.equals("0002")) {
			setMessageRecord(req, msgL69);
		}
		String coltyp = "";
		try {
			coltyp = req.getParameter("E01ROCTYP").trim();
		} catch (Exception e) {
			coltyp = msgL69.getE01R07TYP();
		}
		String colprd = "";
		try {
			colprd = req.getParameter("E01ROCPRD").trim();
		} catch (Exception e) {
			colprd = msgL69.getE01R07PRD();
		}
		
		ELEERRMessage msgError = new ELEERRMessage();
		ELEERRMessage error = null;
		
		if (isConfec.equals("Y") || isConfec.equals("S")) {
			error = procReqConfFld(mp, user, req, res, session, msgL69.getE01R07BNK(), refere, coltyp, colprd, seqbien, opecode, inqMnt);
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
		}
		
		mp.sendMessage(msgL69);
		error = (ELEERRMessage) mp
				.receiveMessageRecord("ELEERR");
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		msgL69 = (ERA006901Message) mp.receiveMessageRecord("ERA006901");

		error = procReqExtFld(mp, user, req, res, session, msgL69.getE01R07BNK(), msgL69.getE01R07REF(), msgL69.getE01R07TYP(), msgL69.getE01R07PRD(), msgL69.getE01R07SEQ(), opecode, inqMnt);
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		session.setAttribute("gaDetail", msgL69);
		session.setAttribute("error", msgError);
		
		if (mp.hasError(msgError)) {
			if (msgL69.getE01R07TYP().equals("4")) {
				pageName = "ERA0069_ga_detail_fiducia_4.jsp";
			} else if (msgL69.getE01R07TYP().equals("5")) {
				pageName = "ERA0069_ga_detail_fiducia_5.jsp";
			} else {
				pageName = "error_viewer.jsp";
			}
			forward(pageName, req, res);
		} else {
			//procReqListIns(mp, user, req, res, session, msgL69.getE01R07BNK(), msgL69.getE01R07REF(), msgL69.getE01R07SEQ(), inqMnt);
			if (opecode.equals("0002") || opecode.equals("0003")) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0050?SCREEN=200&REF=" + refere + "&PURPOSE=" + purpose);
			} else { // Check it?
				if (msgL69.getE01R07TYP().equals("4")) {
					pageName = "ERA0069_ga_detail_fiducia_4.jsp";
				} else if (msgL69.getE01R07TYP().equals("5")) {
					pageName = "ERA0069_ga_detail_fiducia_5.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
				forward(pageName, req, res);
			}
		}
	}

	private void procAction1(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0068", req);
			procAction1(mp, user, req, res, session);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procAction1(MessageProcessor mp, ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String opecode = "";
		try {
			opecode = req.getParameter("OPECOD").trim();
		} catch (Exception e) {
			opecode = "0004";
		}
		String refere = "";
		try {
			refere = req.getParameter("E01ROCREF").trim();
		} catch (Exception e) {
			refere = "";
		}
		String seqbien = "";
		try {
			seqbien = req.getParameter("SEQBIEN").trim();
		} catch (Exception e) {
			seqbien = "";
		}
		String isConfec = "N";
		try {
			isConfec = req.getParameter("E01ROCRGK").trim();
		} catch (Exception e) {
			isConfec = userPO.getOption();
		}
		String purpose = "";
		try {
			purpose = req.getParameter("PURPOSE").trim();
		} catch (Exception e) {
			purpose = "";
		}

		String inqMnt = "";
		if (purpose.equals("INQUIRY")) {
			inqMnt = "05";
		} else if (purpose.equals("APPROVE")) {
			inqMnt = "04";
		} else {
			inqMnt = "01";
		}
		
		ERA006801Message msgL68 = (ERA006801Message) mp.getMessageRecord("ERA006801");
		msgL68.setH01USERID(user.getH01USR());
		msgL68.setH01PROGRM("ERA0068");
		msgL68.setH01TIMSYS(getTimeStamp());
		msgL68.setH01SCRCOD(inqMnt);
		msgL68.setH01OPECOD(opecode);
		msgL68.setE01R10REF(refere);
		msgL68.setE01R10SEQ(seqbien);
		
		if (opecode.equals("0002")) {
			setMessageRecord(req, msgL68);
		}
		String coltyp = "";
		try {
			coltyp = req.getParameter("E01ROCTYP").trim();
		} catch (Exception e) {
			coltyp = msgL68.getE01R10TYP();
		}
		String colprd = "";
		try {
			colprd = req.getParameter("E01ROCPRD").trim();
		} catch (Exception e) {
			colprd = msgL68.getE01R10PRD();
		}

		ELEERRMessage msgError = new ELEERRMessage();
		ELEERRMessage error = null;
		
		if (isConfec.equals("Y") || isConfec.equals("S")) {
			error = procReqConfFld(mp, user, req, res, session, msgL68.getE01R10BNK(), refere, coltyp, colprd, seqbien, opecode, inqMnt);
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
		}
		
		mp.sendMessage(msgL68);
		error = (ELEERRMessage) mp
				.receiveMessageRecord("ELEERR");
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		msgL68 = (ERA006801Message) mp.receiveMessageRecord("ERA006801");

		error = procReqExtFld(mp, user, req, res, session, msgL68.getE01R10BNK(), msgL68.getE01R10REF(), msgL68.getE01R10TYP(), msgL68.getE01R10PRD(), msgL68.getE01R10SEQ(), opecode, inqMnt);
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		session.setAttribute("error", msgError);
		session.setAttribute("gaDetail", msgL68);
		
		if (mp.hasError(msgError)) {
			forward("ERA0068_ga_detail_cesion_1.jsp", req, res);
		} else {
			procReqListIns(mp, user, req, res, session, msgL68.getE01R10BNK(), msgL68.getE01R10REF(), msgL68.getE01R10SEQ(), inqMnt);
			if (opecode.equals("0002") || opecode.equals("0003")) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0050?SCREEN=200&REF=" + refere + "&PURPOSE=" + purpose);
			} else { // Check it?
				forward("ERA0068_ga_detail_cesion_1.jsp", req, res);
			}
		}
	}

	private void procActionC(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0067", req);
			procActionC(mp, user, req, res, session);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionC(MessageProcessor mp, ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "";
		String opecode = "";
		try {
			opecode = req.getParameter("OPECOD").trim();
		} catch (Exception e) {
			opecode = "0004";
		}
		String refere = "";
		try {
			refere = req.getParameter("E01ROCREF").trim();
		} catch (Exception e) {
			refere = "";
		}
		String seqbien = "";
		try {
			seqbien = req.getParameter("SEQBIEN").trim();
		} catch (Exception e) {
			seqbien = "";
		}
		String isConfec = "N";
		try {
			isConfec = req.getParameter("E01ROCRGK").trim();
		} catch (Exception e) {
			isConfec = userPO.getOption();
		}
		String purpose = "";
		try {
			purpose = req.getParameter("PURPOSE").trim();
		} catch (Exception e) {
			purpose = "";
		}

		String inqMnt = "";
		if (purpose.equals("INQUIRY")) {
			inqMnt = "05";
		} else if (purpose.equals("APPROVE")) {
			inqMnt = "04";
		} else {
			inqMnt = "01";
		}

		ERA006701Message msgL67 = (ERA006701Message) mp.getMessageRecord("ERA006701");
		msgL67.setH01USERID(user.getH01USR());
		msgL67.setH01PROGRM("ERA0067");
		msgL67.setH01TIMSYS(getTimeStamp());
		msgL67.setH01SCRCOD(inqMnt);
		msgL67.setH01OPECOD(opecode);
		msgL67.setE01R06REF(refere);
		msgL67.setE01R06SEQ(seqbien);
		
		if (opecode.equals("0002")) {
			setMessageRecord(req, msgL67);
		}
		String coltyp = "";
		try {
			coltyp = req.getParameter("E01ROCTYP").trim();
		} catch (Exception e) {
			coltyp = msgL67.getE01R06TYP();
		}
		String colprd = "";
		try {
			colprd = req.getParameter("E01ROCPRD").trim();
		} catch (Exception e) {
			colprd = msgL67.getE01R06PRD();
		}
		
		ELEERRMessage msgError = new ELEERRMessage();
		ELEERRMessage error = null;
		
		if (isConfec.equals("Y") || isConfec.equals("S")) {
			error = procReqConfFld(mp, user, req, res, session, msgL67.getE01R06BNK(), refere, coltyp, colprd, seqbien, opecode, inqMnt);
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
		}
		
		mp.sendMessage(msgL67);
		error = (ELEERRMessage) mp
				.receiveMessageRecord("ELEERR");
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		msgL67 = (ERA006701Message) mp.receiveMessageRecord("ERA006701");

		error = procReqExtFld(mp, user, req, res, session, msgL67.getE01R06BNK(), msgL67.getE01R06REF(), msgL67.getE01R06TYP(), msgL67.getE01R06PRD(), msgL67.getE01R06SEQ(), opecode, inqMnt);
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		session.setAttribute("gaDetail", msgL67);
		session.setAttribute("error", msgError);
		
		if (mp.hasError(msgError)) {
			String[] listAvalC = {"A", "W"};
			for (int i = 0; i < listAvalC.length; i++) {
				if (listAvalC[i].equals(msgL67.getE01R06TYP())) {
					pageName = "ERA0067_ga_detail_CDT_W.jsp";
					break;
				}
			}
			if (pageName.equals("")) {
				if (msgL67.getE01R06TYP().equals("C")) {
					pageName = "ERA0067_ga_detail_deposit_C.jsp";
				} else {
					if (msgL67.getE01R06TYP().equals("P")) {
						pageName = "ERA0067_ga_detail_deposit_P.jsp";
					} else {
						pageName = "error_viewer.jsp";
					}
				}
			}
			forward(pageName, req, res);
		} else {
			//procReqListIns(mp, user, req, res, session, msgL67.getE01R06BNK(), msgL67.getE01R06REF(), msgL67.getE01R06SEQ(), inqMnt);
			if (opecode.equals("0002") || opecode.equals("0003")) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0050?SCREEN=200&REF=" + refere + "&PURPOSE=" + purpose);
			} else { // Check it?
				String[] listAvalC = {"A", "W"};
				for (int i = 0; i < listAvalC.length; i++) {
					if (listAvalC[i].equals(msgL67.getE01R06TYP())) {
						pageName = "ERA0067_ga_detail_CDT_W.jsp";
						break;
					}
				}
				if (pageName.equals("")) {
					if (msgL67.getE01R06TYP().equals("C")) {
						pageName = "ERA0067_ga_detail_deposit_C.jsp";
					} else {
						if (msgL67.getE01R06TYP().equals("P")) {
							pageName = "ERA0067_ga_detail_deposit_P.jsp";
						} else {
						pageName = "error_viewer.jsp";
						}
					}
				}
				forward(pageName, req, res);
			}
		}
	}

	private void procActionI(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0066", req);
			procActionI(mp, user, req, res, session);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionI(MessageProcessor mp, ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "";
		String opecode = "";
		try {
			opecode = req.getParameter("OPECOD").trim();
		} catch (Exception e) {
			opecode = "0004";
		}
		String refere = "";
		try {
			refere = req.getParameter("E01ROCREF").trim();
		} catch (Exception e) {
			refere = "";
		}
		String seqbien = "";
		try {
			seqbien = req.getParameter("SEQBIEN").trim();
		} catch (Exception e) {
			seqbien = "";
		}
		String isConfec = "N";
		try {
			isConfec = req.getParameter("E01ROCRGK").trim();
		} catch (Exception e) {
			isConfec = userPO.getOption();
		}
		String purpose = "";
		try {
			purpose = req.getParameter("PURPOSE").trim();
		} catch (Exception e) {
			purpose = "";
		}

		String inqMnt = "";
		if (purpose.equals("INQUIRY")) {
			inqMnt = "05";
		} else if (purpose.equals("APPROVE")) {
			inqMnt = "04";
		} else {
			inqMnt = "01";
		}
		
		ERA006601Message msgL66 = (ERA006601Message) mp.getMessageRecord("ERA006601");
		msgL66.setH01USERID(user.getH01USR());
		msgL66.setH01PROGRM("ERA0066");
		msgL66.setH01TIMSYS(getTimeStamp());
		msgL66.setH01SCRCOD(inqMnt);
		msgL66.setH01OPECOD(opecode);
		msgL66.setE01R05REF(refere);
		msgL66.setE01R05SEQ(seqbien);
		
		if (opecode.equals("0002")) {
			setMessageRecord(req, msgL66);
		}
		
		String coltyp = "";
		try {
			coltyp = req.getParameter("E01ROCTYP").trim();
		} catch (Exception e) {
			coltyp = msgL66.getE01R05TYP();
		}
		String colprd = "";
		try {
			colprd = req.getParameter("E01ROCPRD").trim();
		} catch (Exception e) {
			colprd = msgL66.getE01R05PRD();
		}
		
		
		ELEERRMessage msgError = new ELEERRMessage();
		ELEERRMessage error = null;
		
		if (isConfec.equals("Y") || isConfec.equals("S")) {
			error = procReqConfFld(mp, user, req, res, session, msgL66.getE01R05BNK(), refere, coltyp, colprd, seqbien, opecode, inqMnt);
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
		}
		
		mp.sendMessage(msgL66);
		error = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		msgL66 = (ERA006601Message) mp.receiveMessageRecord("ERA006601");

		error = procReqExtFld(mp, user, req, res, session, msgL66.getE01R05BNK(), msgL66.getE01R05REF(), msgL66.getE01R05TYP(), msgL66.getE01R05PRD(), msgL66.getE01R05SEQ(), opecode, inqMnt);
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		session.setAttribute("gaDetail", msgL66);
		session.setAttribute("error", msgError);

		if (mp.hasError(msgError)) {
			String[] listAval = {"H", "P", "Q", "R", "S", "U"};
			for (int i = 0; i < listAval.length; i++) {
				if (listAval[i].equals(msgL66.getE01R05TYP())) {
					pageName = "ERA0066_ga_detail_aval_H.jsp";
					break;
				}
			}
			if (pageName.equals("")) {
				String[] listAvalI = {"I", "J", "Q", "K", "N", "O", "6", "G"};
				// Search for element in list
				for (int i = 0; i < listAvalI.length; i++) {
					if (listAvalI[i].equals(msgL66.getE01R05TYP())) {
						pageName = "ERA0066_ga_detail_aval_I.jsp";
						break;
					}
				}
			}
			if (pageName.equals("")) {
				if (msgL66.getE01R05TYP().equals("0")) {
					pageName = "ERA0066_ga_detail_aval_0.jsp";
				} else if (msgL66.getE01R05TYP().equals("L")) {
					pageName = "ERA0066_ga_detail_aval_L.jsp";
				} else if (msgL66.getE01R05TYP().equals("M")) {
					pageName = "ERA0066_ga_detail_aval_M.jsp";
				} else if (msgL66.getE01R05TYP().equals("3")) {
					pageName = "ERA0066_ga_detail_aval_3.jsp";
				} else if (msgL66.getE01R05TYP().equals("Z")) {
					pageName = "ERA0066_ga_detail_aval_Z.jsp";
				} else if (msgL66.getE01R05TYP().equals("2")) {
					pageName = "ERA0066_ga_detail_aval_2.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			}
			forward(pageName, req, res);
		} else {
			procReqListIns(mp, user, req, res, session, msgL66.getE01R05BNK(), msgL66.getE01R05REF(), msgL66.getE01R05SEQ(), inqMnt);
			if (opecode.equals("0002") || opecode.equals("0003")) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0050?SCREEN=200&REF=" + refere + "&PURPOSE=" + purpose);
			} else { // Check it?
				String[] listAval = {"H", "P", "Q", "R", "S", "U"};
				for (int i = 0; i < listAval.length; i++) {
					if (listAval[i].equals(msgL66.getE01R05TYP())) {
						pageName = "ERA0066_ga_detail_aval_H.jsp";
						break;
					}
				}
				if (pageName.equals("")) {
					String[] listAvalI = {"I", "J", "Q", "K", "N", "O", "6", "G"};
					// Search for element in list
					for (int i = 0; i < listAvalI.length; i++) {
						if (listAvalI[i].equals(msgL66.getE01R05TYP())) {
							pageName = "ERA0066_ga_detail_aval_I.jsp";
							break;
						}
					}
				}
				if (pageName.equals("")) {
					if (msgL66.getE01R05TYP().equals("0")) {
						pageName = "ERA0066_ga_detail_aval_0.jsp";
					} else if (msgL66.getE01R05TYP().equals("L")) {
						pageName = "ERA0066_ga_detail_aval_L.jsp";
					} else if (msgL66.getE01R05TYP().equals("M")) {
						pageName = "ERA0066_ga_detail_aval_M.jsp";
					} else if (msgL66.getE01R05TYP().equals("3")) {
						pageName = "ERA0066_ga_detail_aval_3.jsp";
					} else if (msgL66.getE01R05TYP().equals("Z")) {
						pageName = "ERA0066_ga_detail_aval_Z.jsp";
					} else if (msgL66.getE01R05TYP().equals("2")) {
						pageName = "ERA0066_ga_detail_aval_2.jsp";
					} else if (msgL66.getE01R05TYP().equals("H")) {
						pageName = "ERA0066_ga_detail_aval_H.jsp";
					} else {
						pageName = "error_viewer.jsp";
					}
				}
				forward(pageName, req, res);
			}
		}
	}

	private void procActionF(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0065", req);
			procActionF(mp, user, req, res, session);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionF(MessageProcessor mp, ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "";
		String opecode = "";
		try {
			opecode = req.getParameter("OPECOD").trim();
		} catch (Exception e) {
			opecode = "0004";
		}
		String refere = "";
		try {
			refere = req.getParameter("E01ROCREF").trim();
		} catch (Exception e) {
			refere = "";
		}
		String seqbien = "";
		try {
			seqbien = req.getParameter("SEQBIEN").trim();
		} catch (Exception e) {
			seqbien = "";
		}
		String isConfec = "N";
		try {
			isConfec = req.getParameter("E01ROCRGK").trim();
		} catch (Exception e) {
			isConfec = userPO.getOption();
		}
		String purpose = "";
		try {
			purpose = req.getParameter("PURPOSE").trim();
		} catch (Exception e) {
			purpose = "";
		}

		String inqMnt = "";
		if (purpose.equals("INQUIRY")) {
			inqMnt = "05";
		} else if (purpose.equals("APPROVE")) {
			inqMnt = "04";
		} else {
			inqMnt = "01";
		}

		mp = null;
		try {
			mp = getMessageProcessor("ERA0065", req);
			ERA006501Message msgL65 = (ERA006501Message) mp.getMessageRecord("ERA006501");
			msgL65.setH01USERID(user.getH01USR());
			msgL65.setH01PROGRM("ERA0065");
			msgL65.setH01TIMSYS(getTimeStamp());
			msgL65.setH01SCRCOD(inqMnt);
			msgL65.setH01OPECOD(opecode);
			msgL65.setE01R04REF(refere);
			msgL65.setE01R04SEQ(seqbien);
			
			if (opecode.equals("0002")) {
				setMessageRecord(req, msgL65);
			}
			String coltyp = "";
			try {
				coltyp = req.getParameter("E01ROCTYP").trim();
			} catch (Exception e) {
				coltyp = msgL65.getE01R04TYP();
			}
			String colprd = "";
			try {
				colprd = req.getParameter("E01ROCPRD").trim();
			} catch (Exception e) {
				colprd = msgL65.getE01R04PRD();
			}
			
			ELEERRMessage msgError = new ELEERRMessage();
			ELEERRMessage error = null;
			
			if (isConfec.equals("Y") || isConfec.equals("S")) {
				error = procReqConfFld(mp, user, req, res, session, msgL65.getE01R04BNK(), refere, coltyp, colprd, seqbien, opecode, inqMnt);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
			}
			
			mp.sendMessage(msgL65);
			error = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
			msgL65 = (ERA006501Message) mp.receiveMessageRecord("ERA006501");
	
			error = procReqExtFld(mp, user, req, res, session, msgL65.getE01R04BNK(), msgL65.getE01R04REF(), msgL65.getE01R04TYP(), msgL65.getE01R04PRD(), msgL65.getE01R04SEQ(), opecode, inqMnt);
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
			if (msgL65.getE01R04TYP().equals("F")) {
				pageName = "ERA0065_ga_detail_prenda_f.jsp";
			} else if (msgL65.getE01R04TYP().equals("D")) {
				pageName = "ERA0065_ga_detail_prenda_d.jsp";
			} else if (msgL65.getE01R04TYP().equals("E")) {
				pageName = "ERA0065_ga_detail_prenda_e.jsp";
			}
	
			session.setAttribute("gaDetail", msgL65);
			session.setAttribute("error", msgError);
			
			if (mp.hasError(msgError)) {
				forward(pageName, req, res);
			} else {
				procReqListIns(mp, user, req, res, session, msgL65.getE01R04BNK(), msgL65.getE01R04REF(), msgL65.getE01R04SEQ(), inqMnt);
				if (opecode.equals("0002") || opecode.equals("0003")) {
					res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0050?SCREEN=200&REF=" + refere + "&PURPOSE=" + purpose);
				} else { // Check it?
					forward(pageName, req, res);
				}
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionIns(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");
		
		String opecode = "";
		try {
			opecode = req.getParameter("OPECOD").trim();
		} catch (Exception e) {
			opecode = "0004";
		}
		String bnk = "";
		try {
			bnk = req.getParameter("E01ROCBNK").trim();
		} catch (Exception e) {
			bnk = "";
		}
		String refere = "";
		try {
			refere = req.getParameter("E01ROCREF").trim();
		} catch (Exception e) {
			refere = "";
		}
		String seqbien = "";
		try {
			seqbien = req.getParameter("SEQBIEN").trim();
		} catch (Exception e) {
			seqbien = "";
		}
		String poliza = "";
		try {
			poliza = req.getParameter("POLIZA").trim();
		} catch (Exception e) {
			poliza = "";
		}
		String isConfec = "N";
		try {
			isConfec = req.getParameter("E01ROCRGK").trim();
		} catch (Exception e) {
			isConfec = userPO.getOption();
		}
		String purpose = "";
		try {
			purpose = req.getParameter("PURPOSE").trim();
		} catch (Exception e) {
			purpose = "MAINTENANCE";
		}
		userPO.setPurpose(purpose);

		String inqMnt = "";
		if (purpose.equals("INQUIRY")) {
			inqMnt = "05";
		} else if (purpose.equals("APPROVE")) {
			inqMnt = "04";
		} else {
			inqMnt = "01";
		}

		String pageName = "ERA0062_ga_detail_insurance.jsp";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0062", req);
			ERA006203Message msgL62 = (ERA006203Message) mp.getMessageRecord("ERA006203");
			msgL62.setH03USERID(user.getH01USR());
			msgL62.setH03PROGRM("ERA0062");
			msgL62.setH03TIMSYS(getTimeStamp());
			msgL62.setH03SCRCOD(inqMnt);
			msgL62.setH03OPECOD(opecode);
			msgL62.setE03ROCBNK(bnk);
			msgL62.setE03ROCREF(refere);
			msgL62.setE03ROCSQR(seqbien);
			msgL62.setE03ROCCIN(poliza);
			
			if (opecode.equals("0002")) {
				setMessageRecord(req, msgL62);
			}

			String coltyp = "";
			try {
				coltyp = req.getParameter("E01ROCTYP").trim();
			} catch (Exception e) {
				coltyp = msgL62.getE03ROCTYP();
			}
			String colprd = "";
			try {
				colprd = req.getParameter("E01ROCPRD").trim();
			} catch (Exception e) {
				colprd = msgL62.getE03ROCPRD();
			}
			
			ELEERRMessage msgError = new ELEERRMessage();
			ELEERRMessage error = null;
			
			if (isConfec.equals("Y") || isConfec.equals("S")) {
				error = procReqConfFld(mp, user, req, res, session, msgL62.getE03ROCBNK(), refere, coltyp, colprd, seqbien, opecode, inqMnt);
				if (mp.hasError(error)) {
					addError(error, msgError);
				}
			}
			
			mp.sendMessage(msgL62);
			error = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
			msgL62 = (ERA006203Message) mp.receiveMessageRecord("ERA006203");
// SEGUROS NO PUEDEN TENER CAMPOS DE USUARIO. SOLO PARA GARANTIAS.
//			error = procReqExtFld(mp, user, req, res, session, msgL62.getE03ROCBNK(), msgL62.getE03ROCREF(), msgL62.getE03ROCTYP(), msgL62.getE03ROCPRD(), msgL62.getE03ROCSQR(), opecode, inqMnt);
//			if (mp.hasError(error)) {
//				addError(error, msgError);
//			}
			session.setAttribute("error", msgError);
			session.setAttribute("gaPoliza", msgL62);

			if (mp.hasError(msgError)) {
				forward(pageName, req, res);
			} else {
				if (opecode.equals("0002")
						|| opecode.equals("0003")) {
					PrintWriter  out = res.getWriter();
					out.println("<HTML>");
					out.println("<HEAD>");
					out.println("<TITLE>Close</TITLE>");
					out.println("</HEAD>");
					out.println("<BODY>");
					out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
					out.println(" var myOpener= top.opener;");
					if (seqbien.equals("0")) {
						out.println("top.opener.goRefresh();");
					}else{
						out.println("top.opener.goRefreshIns();");
					}
					out.println("		top.close();");
					out.println("</SCRIPT>");
					out.println("<P>Close it!!!</P>");
					out.println("</BODY>");
					out.println("</HTML>");
					out.close();
				} else {
					forward(pageName, req, res);
				}
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionV(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0064", req);
			procActionV(mp, user, req, res, session);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionV(MessageProcessor mp, ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "ERA0064_ga_detail_prenda_v.jsp";
		String opecode = "";
		try {
			opecode = req.getParameter("OPECOD").trim();
		} catch (Exception e) {
			opecode = "0004";
		}
		String refere = "";
		try {
			refere = req.getParameter("E01ROCREF").trim();
		} catch (Exception e) {
			refere = "";
		}
		String seqbien = "";
		try {
			seqbien = req.getParameter("SEQBIEN").trim();
		} catch (Exception e) {
			seqbien = "";
		}
		String isConfec = "N";
		try {
			isConfec = req.getParameter("E01ROCRGK").trim();
		} catch (Exception e) {
			isConfec = userPO.getOption();
		}
		String purpose = "";
		try {
			purpose = req.getParameter("PURPOSE").trim();
		} catch (Exception e) {
			purpose = "";
		}

		String inqMnt = "";
		if (purpose.equals("INQUIRY")) {
			inqMnt = "05";
		} else if (purpose.equals("APPROVE")) {
			inqMnt = "04";
		} else {
			inqMnt = "01";
		}

		ERA006401Message msgL64 = (ERA006401Message) mp.getMessageRecord("ERA006401");
		msgL64.setH01USERID(user.getH01USR());
		msgL64.setH01PROGRM("ERA0064");
		msgL64.setH01TIMSYS(getTimeStamp());
		msgL64.setH01SCRCOD(inqMnt);
		msgL64.setH01OPECOD(opecode);
		msgL64.setE01R03REF(refere);
		msgL64.setE01R03SEQ(seqbien);
		
		if (opecode.equals("0002")) {
			setMessageRecord(req, msgL64);
		}
		String coltyp = "";
		try {
			coltyp = req.getParameter("E01ROCTYP").trim();
		} catch (Exception e) {
			coltyp = msgL64.getE01R03TYP();
		}
		String colprd = "";
		try {
			colprd = req.getParameter("E01ROCPRD").trim();
		} catch (Exception e) {
			colprd = msgL64.getE01R03PRD();
		}

		ELEERRMessage msgError = new ELEERRMessage();
		ELEERRMessage error = null;
		
		if (isConfec.equals("Y") || isConfec.equals("S")) {
			error = procReqConfFld(mp, user, req, res, session, msgL64.getE01R03BNK(), refere, coltyp, colprd, seqbien, opecode, inqMnt);
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
		}
		
		mp.sendMessage(msgL64);
		error = (ELEERRMessage) mp
				.receiveMessageRecord("ELEERR");
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		msgL64 = (ERA006401Message) mp.receiveMessageRecord("ERA006401");

		error = procReqExtFld(mp, user, req, res, session, msgL64.getE01R03BNK(), msgL64.getE01R03REF(), msgL64.getE01R03TYP(), msgL64.getE01R03PRD(), msgL64.getE01R03SEQ(), opecode, inqMnt);
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		session.setAttribute("gaDetail", msgL64);
		session.setAttribute("error", msgError);
		
		if (mp.hasError(msgError)) {
			forward(pageName, req, res);
		} else {
			procReqListIns(mp, user, req, res, session, msgL64.getE01R03BNK(), msgL64.getE01R03REF(), msgL64.getE01R03SEQ(), inqMnt);
			if (opecode.equals("0002") || opecode.equals("0003")) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0050?SCREEN=200&REF=" + refere + "&PURPOSE=" + purpose);
			} else { // Check it?
				forward(pageName, req, res);
			}
		}
	}

	private void procActionB(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0060", req);
			procActionB(mp, user, req, res, session);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionB(MessageProcessor mp, ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "ERA0060_ga_detail_realstate.jsp";
		String opecode = "";
		try {
			opecode = req.getParameter("OPECOD").trim();
		} catch (Exception e) {
			opecode = "0004";
		}
		String refere = "";
		try {
			refere = req.getParameter("E01ROCREF").trim();
		} catch (Exception e) {
			refere = "";
		}
		String seqbien = "";
		try {
			seqbien = req.getParameter("SEQBIEN").trim();
		} catch (Exception e) {
			seqbien = "";
		}
		String isConfec = "N";
		try {
			isConfec = req.getParameter("E01ROCRGK").trim();
		} catch (Exception e) {
			isConfec = userPO.getOption();
		}
		String purpose = "";
		try {
			purpose = req.getParameter("PURPOSE").trim();
		} catch (Exception e) {
			purpose = "";
		}

		String inqMnt = "";
		if (purpose.equals("INQUIRY")) {
			inqMnt = "05";
		} else if (purpose.equals("APPROVE")) {
			inqMnt = "04";
		} else {
			inqMnt = "01";
		}

		ERA006001Message msgL60 = (ERA006001Message) mp.getMessageRecord("ERA006001");
		msgL60.setH01USERID(user.getH01USR());
		msgL60.setH01PROGRM("ERA0060");
		msgL60.setH01TIMSYS(getTimeStamp());
		msgL60.setH01SCRCOD(inqMnt);
		msgL60.setH01OPECOD(opecode);
		msgL60.setE01R01REF(refere);
		msgL60.setE01R01SEQ(seqbien);
		
		if (opecode.equals("0002")) {
			setMessageRecord(req, msgL60);
		}
		String coltyp = "";
		try {
			coltyp = req.getParameter("E01ROCTYP").trim();
		} catch (Exception e) {
			coltyp = msgL60.getE01R01TYP();
		}
		String colprd = "";
		try {
			colprd = req.getParameter("E01ROCPRD").trim();
		} catch (Exception e) {
			colprd = msgL60.getE01R01PRD();
		}

		ELEERRMessage msgError = new ELEERRMessage();
		ELEERRMessage error = null;
		
		if (isConfec.equals("Y") || isConfec.equals("S")) {
			error = procReqConfFld(mp, user, req, res, session, msgL60.getE01R01BNK(), refere, coltyp, colprd, seqbien, opecode, inqMnt);
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
		}
		
		mp.sendMessage(msgL60);
		error = (ELEERRMessage) mp
				.receiveMessageRecord("ELEERR");
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		msgL60 = (ERA006001Message) mp.receiveMessageRecord("ERA006001");

		error = procReqExtFld(mp, user, req, res, session, msgL60.getE01R01BNK(), msgL60.getE01R01REF(), msgL60.getE01R01TYP(), msgL60.getE01R01PRD(), msgL60.getE01R01SEQ(), opecode, inqMnt);
		if (mp.hasError(error)) {
			addError(error, msgError);
		}
		session.setAttribute("error", msgError);
		session.setAttribute("gaDetail", msgL60);

		if (mp.hasError(msgError)) {
			forward(pageName, req, res);
		} else {
			procReqListIns(mp, user, req, res, session, msgL60.getE01R01BNK(), msgL60.getE01R01REF(), msgL60.getE01R01SEQ(), inqMnt);
			if (opecode.equals("0002") || opecode.equals("0003")) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0050?SCREEN=200&REF=" + refere + "&PURPOSE=" + purpose);
			} else { // Check it?
				forward(pageName, req, res);
			}
		}
	}

	private ELEERRMessage procReqExtFld(MessageProcessor mp,
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, 
			String bnk, String referencia, String type, 
			String prod, String sec, String opecode, String inqMnt) throws IOException {

		mp = null; 
		mp = getMessageProcessor("ERA0072", req);
		ERA007201Message msgL72 = (ERA007201Message) mp.getMessageRecord("ERA007201");
		msgL72.setH01USERID(user.getH01USR());
		msgL72.setH01PROGRM("ERA0072");
		msgL72.setH01TIMSYS(getTimeStamp());
		msgL72.setH01SCRCOD(inqMnt);
		msgL72.setH01OPECOD(opecode);
		msgL72.setE01TBLTYP(type);
		msgL72.setE01TBLCDE(prod);
		msgL72.setE01EXTREF(referencia);
		msgL72.setE01EXTSEQ(sec);

		if (opecode.equals("0002")) {
			setMessageRecord(req, msgL72);
		}
		
		mp.sendMessage(msgL72);
		ELEERRMessage msgError = (ELEERRMessage) mp
				.receiveMessageRecord("ELEERR");
		msgL72 = (ERA007201Message) mp.receiveMessageRecord("ERA007201");
		
		session.setAttribute("gaUserFld", msgL72);
		return msgError;
	}

	
	private ELEERRMessage procReqConfFld(MessageProcessor mp,
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, String bnk, 
			String referencia, String type, String prod, String sec, 
			String opecode, String inqMnt) throws IOException {

		mp = null;
		try {
			mp = getMessageProcessor("ERA0076", req);
			ERA007601Message msgL76 = (ERA007601Message) mp.getMessageRecord("ERA007601");
			msgL76.setH01USERID(user.getH01USR());
			msgL76.setH01PROGRM("ERA0076");
			msgL76.setH01TIMSYS(getTimeStamp());
			msgL76.setH01SCRCOD(inqMnt);
			msgL76.setH01OPECOD(opecode);
			msgL76.setE01EXCTYP(type);
			msgL76.setE01EXCCDE(prod);
			msgL76.setE01EXCREF(referencia);
			msgL76.setE01EXCSEQ(sec);
			
			if (opecode.equals("0002")) {
				setMessageRecord(req, msgL76);
			}
			
			mp.sendMessage(msgL76);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgL76 = (ERA007601Message) mp.receiveMessageRecord("ERA007601");
			
			session.setAttribute("gaConfFld", msgL76);
			return msgError;
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	
	private void procUpdConsGar(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen) throws IOException, ServletException {
		
		ELEERRMessage msgError = new ELEERRMessage();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0050", req);
			if (!"999999999999".equals(req.getParameter("E01ROCREF"))) {
				// ACTUALIZAR LISTA DE GARANTIZADOS Y CONSTITUYENTES
//				if ("1".equals(req.getParameter("UPDCONST"))) {
//					ELEERRMessage msgErrorConst = procUpdConst(mp, user, req, res, session, req.getParameter("E01ROCREF"), "L");
//					if (mp.hasError(msgErrorConst)) {
//						addError(msgErrorConst, msgError);
//					}
//				}
//				if ("1".equals(req.getParameter("UPDGARANT"))) {
//					ELEERRMessage msgErrorGarant = procUpdGarant(mp, user, req, res, session, req.getParameter("E01ROCREF"), "Y");
//					if (mp.hasError(msgErrorGarant)) {
//						addError(msgErrorGarant, msgError);
//					}
//				}

			}
			
			if (mp.hasError(msgError)) {
				//TODO ????????
			} else {
				switch (screen) {
				case REQ_B:
					procActionB(mp, user, req, res, session);
					break;
				case REQ_V :
					procActionV(mp, user, req, res, session);
				case REQ_F :
					procActionF(mp, user, req, res, session);
					break;
				case REQ_I :
					procActionI(mp, user, req, res, session);
					break;
				case REQ_C :
					procActionC(mp, user, req, res, session);
					break;
				case REQ_1 :
					procAction1(mp, user, req, res, session);
					break;
				case REQ_4 :
					procAction4(mp, user, req, res, session);
					break;
				case REQ_8 :
					procAction8(mp, user, req, res, session);
					break;
				case REQ_9 :
					procAction9(mp, user, req, res, session);
					break;
				case REQ_10 :
					procAction10(mp, user, req, res, session);
					break;

				default:
					break;
				}
			}
			
		} finally {
			if (mp != null) mp.close();
		}
		
	}
	//FIN NUEVO DESARROLLO
	
	private void procActionEspInst(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("", req);
			ESD000005Message msgGA = (ESD000005Message) session.getAttribute("gaInst");
			msgGA.setH05USR(user.getH01USR());
			msgGA.setH05PGM("EDL0130");
			msgGA.setH05TIM(getTimeStamp());
			msgGA.setH05SCR("01");
			msgGA.setH05OPE("0003");
			msgGA.setE05ACC(userPO.getIdentifier());
			msgGA.setE05ACD("91");
			msgGA.setH05WK1("M");
			
			setMessageRecord(req, msgGA);

			mp.sendMessage(msgGA);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgGA = (ESD000005Message) mp.receiveMessageRecord("ESD000005");

			if (mp.hasError(msgError)) {
				pageName = "ERA0011_ga_special_inst.jsp";
			} else {
				userPO.setIdentifier(msgGA.getE05ACC());
				pageName = "ERA0050_ga_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("gaInst", msgGA);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionCodes(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0011", req);
			ESD000002Message msgGA = (ESD000002Message) session.getAttribute("gaCodes");
			msgGA.setH02USR(user.getH01USR());
			msgGA.setH02PGM("ERA0011");
			msgGA.setH02TIM(getTimeStamp());
			msgGA.setH02SCR("01");
			msgGA.setH02OPE("0003");
			msgGA.setE02ACC(userPO.getIdentifier());
			
			setMessageRecord(req, msgGA);

			mp.sendMessage(msgGA);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgGA = (ESD000002Message) mp.receiveMessageRecord("ESD000002");

			userPO.setIdentifier(msgGA.getE02ACC());
			
			if (mp.hasError(msgError)) {
				pageName = "ERA0011_ga_codes.jsp";
			} else {
				pageName = "ERA0011_ga_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("gaCodes", msgGA);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionRelease(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		
		String opecode = "";
		try {
			opecode = req.getParameter("OPECOD").trim();
		} catch (Exception e) {
			opecode = "0007";
		}
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0050", req);
			ERA005000Message msgGa = (ERA005000Message) mp.getMessageRecord("ERA005000");
			msgGa.setH01USERID(user.getH01USR());
			msgGa.setH01PROGRM("ERA0050");
			msgGa.setH01TIMSYS(getTimeStamp());
			msgGa.setH01SCRCOD("01");
			msgGa.setH01OPECOD(opecode);
			try {
				msgGa.setE01ROCREF(req.getParameter("E01ROCREF").trim());
			} catch (Exception e) {
			}
			
			if (opecode.equals("0008")) {
				setMessageRecord(req, msgGa);
			}

			mp.sendMessage(msgGa);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgGa = (ERA005000Message) mp.receiveMessageRecord("ERA005000");

			userPO.setCusName(msgGa.getE01CUSNA1());
			userPO.setCusNum(msgGa.getE01ROCCUN());
			userPO.setType(msgGa.getE01ROCTYP());
			userPO.setBank(msgGa.getE01ROCBNK());
			
			if (mp.hasError(msgError)) {
				if (opecode.equals("0008")) {
					pageName = "ERA0050_ga_release.jsp";
				} else {
					pageName = "ERA0050_ga_enter_release.jsp";
				}
			} else {
				if (opecode.equals("0008")) {
					pageName = "ERA0050_ga_confirm_release.jsp";
				} else {
					pageName = "ERA0050_ga_release.jsp";
				}
			}

			session.setAttribute("gaMant", msgGa);
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqRelease(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		try {
			userPO.setPurpose(req.getParameter("PURPOSE").trim());
		} catch (Exception e) {
			userPO.setPurpose("MAINTENANCE");
		}
		session.setAttribute("userPO", userPO);
		forward("ERA0050_ga_enter_release.jsp", req, res);
	}

	private void procActionDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0050", req);
			ERA005000Message msgGa = (ERA005000Message) mp.getMessageRecord("ERA005000");
			msgGa.setH01USERID(user.getH01USR());
			msgGa.setH01PROGRM("ERA0050");
			msgGa.setH01TIMSYS(getTimeStamp());
			msgGa.setH01SCRCOD("01");
			msgGa.setH01OPECOD("0009");

			try {
				msgGa.setE01ROCREF(req.getParameter("REFNUM").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgGa);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				forward("ERA0011_ga_acc_list.jsp", req, res);
			} else {
				//!!! Error this screen is undefined in servlet !!!
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0050?SCREEN=7");
			}


		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		try {
			userPO.setCusNum(req.getParameter("CUSNUM").trim());
		} catch (Exception e) {
			userPO.setCusNum("0");
		}
		try {
			userPO.setHeader18(req.getParameter("REF").trim());
			userPO.setAccNum(req.getParameter("REF").trim());
			userPO.setIdentifier(req.getParameter("REF").trim());
		} catch (Exception e) {
		}
		try {
			userPO.setPurpose(req.getParameter("PURPOSE").trim());
		} catch (Exception e) {
			userPO.setPurpose("INQUIRY");
		}
		procReqCollBasic(user, req, res, session);
	}

	private void procActionNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0050", req);
			ERA005000Message msgGa = (ERA005000Message) mp.getMessageRecord("ERA005000");
			msgGa.setH01USERID(user.getH01USR());
			msgGa.setH01PROGRM("ERA0050");
			msgGa.setH01TIMSYS(getTimeStamp());
			msgGa.setH01SCRCOD("01");
			msgGa.setH01OPECOD("0005");

			setMessageRecord(req, msgGa);
			
			mp.sendMessage(msgGa);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgGa = (ERA005000Message) mp.receiveMessageRecord("ERA005000");

			if (mp.hasError(msgError)) {
				procRefreshList1(mp, user, req, res, session, msgGa.getE01ROCREF(), "L");
				procRefreshList2(mp, user, req, res, session, msgGa.getE01ROCREF(), "Y");
				pageName = "ERA0050_ga_basic.jsp";
			} else {
				userPO.setPurpose("MAINTENANCE");
				userPO.setCusName(msgGa.getE01CUSNA1());
				userPO.setCusNum(msgGa.getE01ROCCUN());
				userPO.setCurrency(msgGa.getE01ROCCCY());
				userPO.setType(msgGa.getE01ROCTYP());
				userPO.setIdentifier(msgGa.getE01ROCREF());
				pageName = "ERA0050_ga_confirm.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("gaMant", msgGa);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procRefreshList2(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String e01rocref, String string) {
		
		int maxRow = 0;
		try {
			maxRow = Integer.parseInt(req.getParameter("RECNUMDB"));
		} catch (Exception e) {
			maxRow = 0;
		}
		String checked = "";
		String RCN = "";

		int colNumAcc = 48;
		String myGrpAcc[] = new String[colNumAcc];
		JBListRec grpAccList = new JBListRec();
		grpAccList.init(colNumAcc);
		
		// ACTUALIZA LISTA DE INFORMACION GENERAL
		for (int row = 0; row < maxRow; row++) {
			try {
				checked = req.getParameter("SELGARANT_" + row).trim();
			} catch (Exception e) {
				checked = "";
			}
			if (checked.equals("")) {
				try {
					RCN = req.getParameter("E01CUMRCN_" + row).trim();
				} catch (Exception e) {
					RCN = "";
				}
				if (!RCN.equals("")) {
					myGrpAcc[0] = req.getParameter("E02CUMMAN_" + row);
					myGrpAcc[1] = req.getParameter("E02CUMRCN_" + row);
					myGrpAcc[2] = req.getParameter("E02CUMMA1_" + row);
					myGrpAcc[3] = req.getParameter("E02CUMBNI_" + row);
					myGrpAcc[4] = req.getParameter("E02CUMBSX_" + row);
					myGrpAcc[5] = req.getParameter("E02CUMAM1_" + row);
					myGrpAcc[7] = "0";
					myGrpAcc[9] = "";
					try {
						myGrpAcc[41] = req.getParameter("E01CUMNME_" + row).trim();
					} catch (Exception e) {
						myGrpAcc[41] = "";
					}
					myGrpAcc[42] = req.getParameter("E02CUMFL1_" + row);
					myGrpAcc[44] = req.getParameter("E02CUMPOB_" + row);
					myGrpAcc[45] = req.getParameter("E02CUMAM2_" + row);
					myGrpAcc[46] = req.getParameter("E02CUMINC_" + row);
					myGrpAcc[47] = "";
					grpAccList.addRow("", myGrpAcc);
				
				}
			}
		}
		session.setAttribute("listGarant", grpAccList);
	}

	private void procRefreshList1(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String e01rocref, String string) {
		
		int maxRow = 0;
		try {
			maxRow = Integer.parseInt(req.getParameter("RECNUMDB"));
		} catch (Exception e) {
			maxRow = 0;
		}
		String checked = "";
		String RCN = "";

		int colNumAcc = 48;
		String myGrpAcc[] = new String[colNumAcc];
		JBListRec grpAccList = new JBListRec();
		grpAccList.init(colNumAcc);
		
		// ACTUALIZA LISTA DE INFORMACION GENERAL
		for (int row = 0; row < maxRow; row++) {
			try {
				checked = req.getParameter("SELCONST_" + row).trim();
			} catch (Exception e) {
				checked = "";
			}
			if (checked.equals("")) {
				try {
					RCN = req.getParameter("E01CUMRCN_" + row).trim();
				} catch (Exception e) {
					RCN = "";
				}
				if (!RCN.equals("")) {
					myGrpAcc[0] = req.getParameter("E01CUMMAN_" + row);
					myGrpAcc[1] = req.getParameter("E01CUMRCN_" + row);
					myGrpAcc[2] = req.getParameter("E01CUMMA1_" + row);
					myGrpAcc[3] = req.getParameter("E01CUMBNI_" + row);
					myGrpAcc[4] = req.getParameter("E01CUMBSX_" + row);
					myGrpAcc[5] = req.getParameter("E01CUMAM1_" + row);
					myGrpAcc[7] = "0";
					myGrpAcc[9] = "";
					try {
						myGrpAcc[41] = req.getParameter("E01CUMNME_" + row).trim();
					} catch (Exception e) {
						myGrpAcc[41] = "";
					}
					myGrpAcc[42] = req.getParameter("E01CUMFL1_" + row);
					myGrpAcc[44] = req.getParameter("E01CUMPOB_" + row);
					myGrpAcc[45] = req.getParameter("E01CUMAM2_" + row);
					myGrpAcc[46] = req.getParameter("E01CUMINC_" + row);
					myGrpAcc[47] = "";
					grpAccList.addRow("", myGrpAcc);
				
				}
			}
		}
		session.setAttribute("listConst", grpAccList);
	}

	private void procActionEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setPurpose("NEW");
		
		JBListRec beanList = (JBListRec) session.getAttribute("gaList");
		
		String pageName = "";
		int pos = 0;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0011", req);
			ERA005000Message msgGa = (ERA005000Message) mp.getMessageRecord("ERA005000");
			msgGa.setH01USERID(user.getH01USR());
			msgGa.setH01PROGRM("ERA0011");
			msgGa.setH01TIMSYS(getTimeStamp());
			msgGa.setH01SCRCOD("01");
			msgGa.setH01OPECOD("0001");

			try {
				msgGa.setE01ROCCUN(req.getParameter("CUSNUM").trim());
			} catch (Exception e) {
			}
			try {
				msgGa.setE01ROCSTN(req.getParameter("REFERE").trim());
			} catch (Exception e) {
			}
			try {
				msgGa.setE01ROCPRD(req.getParameter("PRODUCT").trim());
			} catch (Exception e) {
			}
			try {
				msgGa.setE01ROCBNK(req.getParameter("bank").trim());
			} catch (Exception e) {
			}
			try {
				msgGa.setE01ROCREF(req.getParameter("accnum").trim());
			} catch (Exception e) {
			}
			try {
				pos = Integer.parseInt(req.getParameter("ROW"));
				beanList.setCurrentRow(pos);
				msgGa.setE01ROCGLN(beanList.getRecord(3));
				msgGa.setE01ROCCCY(beanList.getRecord(6));
				msgGa.setE01ROCBRN(beanList.getRecord(8));
				msgGa.setE01ROCBNK(beanList.getRecord(7));
				msgGa.setE01ROCPRD(beanList.getRecord(0));
				msgGa.setE01ROCTYP(beanList.getRecord(0));
				msgGa.setE01ROCDPR(beanList.getRecord(5));
				msgGa.setE01ROCDCC(beanList.getRecord(1));
			} catch (Exception e) {
			}
			try {
				msgGa.setE01ROCUC9(req.getParameter("ICOD").trim());
			} catch (Exception e) {
			}
			try {
				msgGa.setE01ROCCUN(req.getParameter("CUSNUM").trim());
			} catch (Exception e) {
			}
			try {
				msgGa.setE01ROCSTN(req.getParameter("REFERE").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgGa);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgGa = (ERA005000Message) mp.receiveMessageRecord("ERA005000");

			if (mp.hasError(msgError)) {
				pageName = "ERA0050_ga_enter_new.jsp?ROW=" + pos; //Warning, this page not exist.
			} else {
				pageName = "ERA0050_ga_basic.jsp";
			}

			session.setAttribute("gaMant", msgGa);
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionCollListDet(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");
		
		JBObjList collList = (JBObjList) session.getAttribute("collList");
		int option = 0;
		try {
			option = Integer.parseInt(req.getParameter("opt"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		int row = Util.parseInt(req.getParameter("ROW"));
		switch (option) {
		case 3 : // Delete
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ERA0011", req);
				ERA001102Message msgColl = (ERA001102Message) collList.get(row);
				msgColl.setH02USERID(user.getH01USR());
				msgColl.setH02PROGRM("ERA0011");
				msgColl.setH02TIMSYS(getTimeStamp());
				msgColl.setH02SCRCOD("01");
				msgColl.setH02OPECOD("0009");
				msgColl.setE02RODREF(userPO.getIdentifier());
				msgColl.setE02RODBNK(userPO.getBank());

				mp.sendMessage(msgColl);
				MessageRecord msg = mp.receiveMessageRecord();

				if (mp.hasError(msg)) {
					session.setAttribute("error", msg);
					forward("ERA0011_ga_list_detail.jsp?ROW=" + row, req, res);
				} else {
					procReqCollListDet(user, req, res, session);				
				}

			} finally {
				if (mp != null)
					mp.close();
			}
			break;
		case 1 : // New
			int seq = collList.getNoResult() ? 1 : 0;
			userPO.setHeader19(seq + "");
			userPO.setHeader20("DO_NEW");
			userPO.setHeader21("ERA0011_ga_detail.jsp");
			session.setAttribute("collDet", new ERA001102Message());
			forward("ERA0011_ga_list_detail.jsp?ROW=" + row, req, res);
			break;
		case 2 : // Maintenance
			userPO.setHeader20("DO_MAINT");
			userPO.setHeader21("ERA0011_ga_detail.jsp?ROW=" + row);
			forward("ERA0011_ga_list_detail.jsp?ROW=" + row, req, res);
			break;
		case 4 : // Inquiry
			collList.setCurrentRow(row);
			ERA001102Message msgColl = (ERA001102Message) collList.getRecord();
			userPO.setHeader20("DO_INQURY");
			userPO.setHeader21("ERA0011_ga_detail_inquiry.jsp");
			session.setAttribute("collDet", msgColl);
			forward("ERA0011_ga_detail_inquiry.jsp?ROW=" + row, req, res);
			break;
		default :
			procReqCollListDet(user, req, res, session);				
			break;
		}
	}

	private void procActionCollBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "";
		String inqMnt = "01";
		String inqMntCG = "01";
		int screen;
		try {
			screen = Integer.parseInt(req.getParameter("SCREEN"));
		} catch (Exception ex) {
			screen = 0;
		}

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0050", req);
			ERA005000Message msgGa = (ERA005000Message) mp.getMessageRecord("ERA005000");
			msgGa.setH01USERID(user.getH01USR());
			msgGa.setH01PROGRM("ERA0050");
			msgGa.setH01TIMSYS(getTimeStamp());
			msgGa.setH01SCRCOD("01");
			if (userPO.getPurpose().equals("INQUIRY")) {
				msgGa.setH01SCRCOD("05");
				inqMnt = "05";
			}
			if (userPO.getPurpose().equals("APPROVE")) {
				msgGa.setH01SCRCOD("04");
				inqMnt = "04";
				inqMntCG = "01";
			}
			msgGa.setH01OPECOD("0003");
			msgGa.setE01ROCREF(userPO.getIdentifier());

			setMessageRecord(req, msgGa);

			if (screen != 2) { // FORZAR ACTUALIZACION DATOS GENERALES GARANTIA CON ERRORES
				msgGa.setH01FLGMAS("A");
			}
			
			mp.sendMessage(msgGa);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgGa = (ERA005000Message) mp.receiveMessageRecord("ERA005000");

			// ACTUALIZAR LISTA DE GARANTIZADOS Y CONSTITUYENTES
			if (userPO.getPurpose().equals("MAINTENANCE")) {
//				if (req.getParameter("UPDCONST").equals("1")||(!msgGa.getE01ROCREF().equals("999999999999"))) {
//					ELEERRMessage error = procUpdConst(mp, user, req, res, session, req.getParameter("E01ROCREF"), "L");
//					if (mp.hasError(error))	addError(error, msgError);
//				}
//				if (req.getParameter("UPDGARANT").equals("1")||(!msgGa.getE01ROCREF().equals("999999999999"))) {
//					ELEERRMessage error = procUpdGarant(mp, user, req, res, session, req.getParameter("E01ROCREF"), "Y");
//					if (mp.hasError(error))	addError(error, msgError);
//				}
			}	

			if (mp.hasError(msgError)) {

				// TRAER LISTA DE CONSTITUYENTES
//				procReqConst(mp, user, req, res, session, msgGa.getE01ROCREF(), "L", inqMntCG);
				// TRAER LISTA DE GARANTIZADOS
//				procReqConst(mp, user, req, res, session, msgGa.getE01ROCREF(), "Y", inqMntCG);
				
				pageName = "ERA0050_ga_basic.jsp";
			} else {
				userPO.setCusName(msgGa.getE01CUSNA1());
				userPO.setCusNum(msgGa.getE01ROCCUN());
				userPO.setCurrency(msgGa.getE01ROCCCY());
				userPO.setType(msgGa.getE01ROCTYP());
				userPO.setBank(msgGa.getE01ROCBNK());

				pageName = "ERA0050_ga_enter_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("gaMant", msgGa);

			if (screen == 2) { // solo desde 'enviar' pantalla principal para actualizar y salir del programa
				if (!mp.hasError(msgError)) { //  There are no errors
					pageName = "ERA0050_ga_enter_maint.jsp";
				} else { //There are errors
					// TRAER LISTA DE CONSTITUYENTES
//					procReqConst(mp, user, req, res, session, msgGa.getE01ROCREF(), "L", inqMntCG);

					// TRAER LISTA DE GARANTIZADOS
//					procReqConst(mp, user, req, res, session, msgGa.getE01ROCREF(), "Y", inqMntCG);

					pageName = "ERA0050_ga_basic.jsp";

				}
			}
			
			if (!userPO.getHeader4().equals("")){//From Garantias
				if (mp != null){  mp.close(); mp = null; }
				
				String opt = userPO.getHeader21().equals("5") ? "5" : "2";
				res.sendRedirect(srctx + "/servlet/datapro.eibs.creditproposal.JSEDP0725?SCREEN=200&NPR=" +  userPO.getHeader4() 
																												+"&CUN="
																												+ userPO.getCusNum()
																												+"&NAM="
																												+ userPO.getCusName()
																												+ "&opt="
																												+ opt);
			} else {
				forward(pageName, req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}


	private void procReqEspInst(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0000", req);
			ESD000005Message msgGA = (ESD000005Message) mp.getMessageRecord("ESD000005");
			msgGA.setH05USR(user.getH01USR());
			msgGA.setH05PGM("ESD0000");
			msgGA.setH05TIM(getTimeStamp());
			msgGA.setH05SCR("01");
			msgGA.setH05OPE("0002");
			msgGA.setE05ACC(userPO.getIdentifier());
			msgGA.setE05ACD("91");
			msgGA.setH05WK1("M");

			mp.sendMessage(msgGA);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgGA = (ESD000005Message) mp.receiveMessageRecord("ESD000005");

			if (mp.hasError(msgError)) {
				pageName = "ERA0050_ga_basic.jsp";
			} else {
				pageName = "ERA0050_ga_special_inst.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("gaInst", msgGA);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		try {
			userPO.setPurpose(req.getParameter("PURPOSE").trim());
		} catch (Exception e) {
			userPO.setPurpose("MAINTENANCE");
		}
		userPO.setOption("CO");
		
		session.setAttribute("userPO", userPO);
		
		if ("INQUIRY".equals(userPO.getPurpose())) {
			forward("ERA0050_collateral_none_acc_enter.jsp", req, res);
		} else {
			forward("ERA0050_ga_enter_maint.jsp", req, res);
		}
	}

	private void procReqCodes(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String opCode = "MAINTENANCE".equals(userPO.getPurpose()) ? "0002" : "0004";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0011", req);
			ESD000002Message msgGa = (ESD000002Message) mp.getMessageRecord("ESD000002");
			msgGa.setH02USR(user.getH01USR());
			msgGa.setH02PGM("ERA0011");
			msgGa.setH02TIM(getTimeStamp());
			msgGa.setH02SCR("01");
			msgGa.setH02OPE(opCode);
			msgGa.setE02ACC(userPO.getIdentifier());
			msgGa.setH02WK1("M");

			mp.sendMessage(msgGa);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgGa = (ESD000002Message) mp.receiveMessageRecord("ESD000002");

			if (mp.hasError(msgError)) {
				pageName = "ERA0050_ga_codes.jsp";
			} else {
				pageName = "ERA0050_ga_codes.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("gaCodes", msgGa);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqCollListDet(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0011", req);
			ERA001102Message msgColl = (ERA001102Message) mp.getMessageRecord("ERA001102");
			msgColl.setH02USERID(user.getH01USR());
			msgColl.setH02PROGRM("ERA0011");
			msgColl.setH02TIMSYS(getTimeStamp());
			msgColl.setH02SCRCOD("01");
			msgColl.setH02OPECOD("0006");
			// Get Parameters here	
			msgColl.setE02RODREF(userPO.getIdentifier());
			msgColl.setE02RODBNK(userPO.getBank());
			msgColl.setE02RODCUN(userPO.getCusNum());

			mp.sendMessage(msgColl);
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("collList", list);
				pageName = "ERA0050_ga_list_detail.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqDeleteCollBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0050", req);
			ERA005000Message msgGa = (ERA005000Message) mp.getMessageRecord("ERA005000");
			msgGa.setH01USERID(user.getH01USR());
			msgGa.setH01PROGRM("ERA0050");
			msgGa.setH01TIMSYS(getTimeStamp());
			msgGa.setH01SCRCOD("01");
			msgGa.setH01OPECOD("0009");
			msgGa.setE01ROCREF(userPO.getIdentifier());

			mp.sendMessage(msgGa);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgGa = (ERA005000Message) mp.receiveMessageRecord("ERA005000");

			if (mp.hasError(msgError)) {
				pageName = "ERA0050_ga_enter_maint.jsp";
			} else {
				userPO.setPurpose("MAINTENANCE");
				userPO.setCusName(msgGa.getE01CUSNA1());
				userPO.setCusNum(msgGa.getE01ROCCUN());
				userPO.setType(msgGa.getE01ROCTYP());
				userPO.setBank(msgGa.getE01ROCBNK());
				//userPO.setOption(msgGa.getE01ROCRGK()); //Tipo de Garantia mobiliaria  "Confecamara"
				//userPO.setSource(msgGa.getE01ROCDDT()); //Existen Datos Dinamicos
				pageName = "ERA0050_ga_del_confirm.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("gaMant", msgGa);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqCollBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		userPO.setOption("CO");
		try {
			userPO.setPurpose(req.getParameter("PURPOSE").trim());
		} catch (Exception e) {
			userPO.setPurpose("MAINTENANCE");
		}

		String pageName = "";
		String inqMnt = "01";
		String inqMntCG = "01";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0050", req);
			ERA005000Message msgGa = (ERA005000Message) mp.getMessageRecord("ERA005000");
			msgGa.setH01USERID(user.getH01USR());
			msgGa.setH01PROGRM("ERA0050");
			msgGa.setH01TIMSYS(getTimeStamp());
			msgGa.setH01SCRCOD("01");
			msgGa.setH01OPECOD("0002");

			if(!"".equals(Util.getReqParameter("REF4rmPROP", req))){
				//Comes from Propuesta de Credito module.
				msgGa.setE01ROCREF(Util.getReqParameter("REF4rmPROP", req));
			} else {
				try {
					msgGa.setE01ROCREF(userPO.getIdentifier().trim());
				} catch (Exception e) {
				}
			}
			if (userPO.getPurpose().equals("INQUIRY")) {
				msgGa.setH01SCRCOD("05");
				inqMnt = "05";
				inqMntCG = "05";
			}
			if (userPO.getPurpose().equals("APPROVE")) {
				msgGa.setH01SCRCOD("04");
				inqMnt = "04";
				inqMntCG = "01";
			}

			mp.sendMessage(msgGa);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgGa = (ERA005000Message) mp.receiveMessageRecord("ERA005000");

			if (mp.hasError(msgError)) {
				if (userPO.getPurpose().equals("INQUIRY")) {
					pageName = "ERA0050_collateral_none_acc_enter.jsp";
				} else {
					pageName = "ERA0050_ga_enter_maint.jsp";
				}
			} else {
				userPO.setCusName(msgGa.getE01CUSNA1());
				userPO.setCusNum(msgGa.getE01ROCCUN());
				userPO.setType(msgGa.getE01ROCTYP());
				userPO.setBank(msgGa.getE01ROCBNK());
				//userPO.setOption(msgGa.getE01ROCRGK()); //Tipo de Garantia mobiliaria  "Confecamara"
				//userPO.setSource(msgGa.getE01ROCDDT()); //Existen Datos Dinamicos
				userPO.setHeader18(msgGa.getE01ROCCNL()); //Document Table Number
				
				// FORZA CONSULTA SI LA GARANTIA ESTA CANCELADA
				if (msgGa.getE01ROCSTS().equals("4")) {
					userPO.setPurpose("INQUIRY");
					inqMnt = "05";
				}
				
				// TRAER LISTA DE CONSTITUYENTES
//				procReqConst(mp, user, req, res, session, msgGa.getE01ROCREF(), "L",inqMntCG);

				// TRAER LISTA DE GARANTIZADOS
//				procReqConst(mp, user, req, res, session, msgGa.getE01ROCREF(), "Y",inqMntCG);
				
				//Traer las Direccion
				// procReqAddress(mp, user, req, res, session, msgGa.getE01ROCREF(), inqMnt);

				// TRAER LISTA DE BIENES ASOCIADOS, INMUEBLES
				if (msgGa.getE01ROCTYP().equals("B")) {
					procReqListBien(mp, user, req, res, session, msgGa.getE01ROCREF(), inqMnt);
					procReqListIns(mp, user, req, res, session, msgGa.getE01ROCBNK(), msgGa.getE01ROCREF(), "0", inqMnt);
				}
				// TRAER LISTA DE BIENES ASOCIADOS, LEASING INMOBILIARIO
				if (msgGa.getE01ROCTYP().equals("T")) {
					procReqListBien(mp, user, req, res, session, msgGa.getE01ROCREF(), inqMnt);
					procReqListIns(mp, user, req, res, session, msgGa.getE01ROCBNK(), msgGa.getE01ROCREF(), "0", inqMnt);
				}
				// TRAER LISTA DE BIENES ASOCIADOS, PRENDA VEHICULOS
				if (msgGa.getE01ROCTYP().equals("V")) {
					procReqListPrendaV(mp, user, req, res, session, msgGa.getE01ROCREF(), inqMnt);
					procReqListIns(mp, user, req, res, session, msgGa.getE01ROCBNK(), msgGa.getE01ROCREF(), "0", inqMnt);
				}
				// TRAER LISTA DE BIENES ASOCIADOS, PRENDA INDUSTRIAL
				if (msgGa.getE01ROCTYP().equals("F")) {
					procReqListPrendaF(mp, user, req, res, session, msgGa.getE01ROCREF(), inqMnt);
					procReqListIns(mp, user, req, res, session, msgGa.getE01ROCBNK(), msgGa.getE01ROCREF(), "0",inqMnt);
				}
				// TRAER LISTA DE BIENES ASOCIADOS, OTRAS PRENDAS
				if (msgGa.getE01ROCTYP().equals("D")) {
					procReqListPrendaF(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
				}
				// TRAER LISTA DE BIENES PRENDA ESTABLEC. COMERCIO
				if (msgGa.getE01ROCTYP().equals("E")) {
					procReqListPrendaF(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
					procReqListIns(mp, user, req, res, session, msgGa.getE01ROCBNK(), msgGa.getE01ROCREF(), "0",inqMnt);
				}
				// TRAER LISTA DE DEPOSITOS EN EFECTIVO EN GARANTIA
				if (msgGa.getE01ROCTYP().equals("C")) {
					procReqListC(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
				}
				// TRAER LISTA CDT OTRAS INSTITUCIONES
				if (msgGa.getE01ROCTYP().equals("A")) {
					procReqListC(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
				}
				// TRAER LISTA CDT GARANTIA
				if (msgGa.getE01ROCTYP().equals("W")) {
					procReqListC(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
				}
				// TRAER LISTA DEPOSITOS EN OTRAS INSTITUCIONES
				if (msgGa.getE01ROCTYP().equals("P")) {
					procReqListC(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
				}
	
				// TRAER LISTA DE GARANTIAS I, J, K, M, L, N, O, 3, Z
				String[] listAval = {"0", "H", "I", "J", "K","L", "M", "N", "O", "Q", "R", "S", "U", "3", "Z", "6", "G", "2"};
				// Search for element in list
				for (int i = 0; i < listAval.length; i++) {
					if (listAval[i].equals(msgGa.getE01ROCTYP())) {
						procReqListAval(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
						break;
					}
				}
				// TRAER LISTA CESION DERECHOS ECONOMICOS
				if (msgGa.getE01ROCTYP().equals("1")) {
					procReqList1(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
					procReqListIns(mp, user, req, res, session, msgGa.getE01ROCBNK(), msgGa.getE01ROCREF(), "0",inqMnt);
				}
				// TRAER LISTA FIDUCIA 4
				if (msgGa.getE01ROCTYP().equals("4")) {
					procReqList4(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
				}
				// TRAER LISTA FIDUCIA 5
				if (msgGa.getE01ROCTYP().equals("5")) {
					procReqList4(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
				}
				// TRAER LISTA PIGNORACION 8
				if (msgGa.getE01ROCTYP().equals("8")) {
					procReqList8(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
				}
				// TRAER OTROS TITULOS VALORES
				if (msgGa.getE01ROCTYP().equals("7")) {
					procReqList9(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
				}
				// TRAER PRENDA ACCIONES
				if (msgGa.getE01ROCTYP().equals("9")) {
					procReqList9(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
				}
				// TRAER FNG
				if (msgGa.getE01ROCTYP().equals("Y")||msgGa.getE01ROCTYP().equals("X")) {
					procReqList10(mp, user, req, res, session, msgGa.getE01ROCREF(),inqMnt);
				}
				pageName = "ERA0050_ga_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("gaMant", msgGa);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	//process FNG
	private void procReqList10(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String referencia, String inqMnt) throws IOException {
		
		ERA006101Message msgL61 = (ERA006101Message) mp.getMessageRecord("ERA006101");
		msgL61.setH01USERID(user.getH01USR());
		msgL61.setH01PROGRM("ERA0061");
		msgL61.setH01TIMSYS(getTimeStamp());
		msgL61.setH01SCRCOD(inqMnt);
		msgL61.setH01OPECOD("0015");
		msgL61.setE01R02REF(referencia);
		
		mp.sendMessage(msgL61);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
		} else {
			int gaColNum = 6;
			String myGaCode[] = new String[gaColNum];
			JBListRec gcodeList = new JBListRec();
			gcodeList.init(gaColNum);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msgL61 = (ERA006101Message) iterator.next();
				
				myGaCode[0] = msgL61.getE01R02SEQ();

				gcodeList.addRow("", myGaCode);
			}
			session.setAttribute("ERA006101Help", list);
			session.setAttribute("gaListBien", gcodeList);
		}	
	}

	//process otros titulos valores
	private void procReqList9(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String referencia, String inqMnt) throws IOException {
		
		ERA007401Message msgL74 = (ERA007401Message) mp.getMessageRecord("ERA007401");
		msgL74.setH01USERID(user.getH01USR());
		msgL74.setH01PROGRM("ERA0074");
		msgL74.setH01TIMSYS(getTimeStamp());
		msgL74.setH01SCRCOD(inqMnt);
		msgL74.setH01OPECOD("0015");
		msgL74.setE01R09REF(referencia);
		
		mp.sendMessage(msgL74);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
		} else {
			int gaColNum = 6;
			String myGaCode[] = new String[gaColNum];
			JBListRec gcodeList = new JBListRec();
			gcodeList.init(gaColNum);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msgL74 = (ERA007401Message) iterator.next();
				
				myGaCode[0] = msgL74.getE01R09SEQ();

				gcodeList.addRow("", myGaCode);
			}
			session.setAttribute("ERA007401Help", list);
			session.setAttribute("gaListBien", gcodeList);
		}	
	}

	//process pignoracion de rentas
	private void procReqList8(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String referencia, String inqMnt) throws IOException {
		
		ERA007301Message msgL73 = (ERA007301Message) mp.getMessageRecord("ERA007301");
		msgL73.setH01USERID(user.getH01USR());
		msgL73.setH01PROGRM("ERA0073");
		msgL73.setH01TIMSYS(getTimeStamp());
		msgL73.setH01SCRCOD(inqMnt);
		msgL73.setH01OPECOD("0015");
		msgL73.setE01R08REF(referencia);
		
		mp.sendMessage(msgL73);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
		} else {
			int gaColNum = 6;
			String myGaCode[] = new String[gaColNum];
			JBListRec gcodeList = new JBListRec();
			gcodeList.init(gaColNum);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msgL73 = (ERA007301Message) iterator.next();
				
				myGaCode[0] = msgL73.getE01R08SEQ();

				gcodeList.addRow("", myGaCode);
			}
			session.setAttribute("ERA007301Help", list);
			session.setAttribute("gaListBien", gcodeList);
		}	
	}

	//process fiducia en garantia y admon. fte de pago
	private void procReqList4(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String referencia, String inqMnt) throws IOException {
		
		ERA006901Message msgL69 = (ERA006901Message) mp.getMessageRecord("ERA006901");
		msgL69.setH01USERID(user.getH01USR());
		msgL69.setH01PROGRM("ERA0069");
		msgL69.setH01TIMSYS(getTimeStamp());
		msgL69.setH01SCRCOD(inqMnt);
		msgL69.setH01OPECOD("0015");
		msgL69.setE01R07REF(referencia);
		
		mp.sendMessage(msgL69);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
		} else {
			int gaColNum = 6;
			String myGaCode[] = new String[gaColNum];
			JBListRec gcodeList = new JBListRec();
			gcodeList.init(gaColNum);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msgL69 = (ERA006901Message) iterator.next();
				
				myGaCode[0] = msgL69.getE01R07SEQ();

				gcodeList.addRow("", myGaCode);
			}
			session.setAttribute("ERA006901Help", list);
			session.setAttribute("gaListBien", gcodeList);
		}	
	}

	//process collateral   (CESION DERECHOS ECONOMICOS)
	private void procReqList1(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String referencia, String inqMnt) throws IOException {
		
		ERA006801Message msgL68 = (ERA006801Message) mp.getMessageRecord("ERA006801");
		msgL68.setH01USERID(user.getH01USR());
		msgL68.setH01PROGRM("ERA0068");
		msgL68.setH01TIMSYS(getTimeStamp());
		msgL68.setH01SCRCOD(inqMnt);
		msgL68.setH01OPECOD("0015");
		msgL68.setE01R10REF(referencia);
		
		mp.sendMessage(msgL68);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
		} else {
			int gaColNum = 6;
			String myGaCode[] = new String[gaColNum];
			JBListRec gcodeList = new JBListRec();
			gcodeList.init(gaColNum);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msgL68 = (ERA006801Message) iterator.next();
				
				myGaCode[0] = msgL68.getE01R10SEQ();

				gcodeList.addRow("", myGaCode);
			}
			session.setAttribute("ERA006801Help", list);
			session.setAttribute("gaListBien", gcodeList);
		}	
	}

	//process collateral   (AVALES ''H', 'I', 'J', 'K', 'L', 'M', 'N')
	private void procReqListAval(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String referencia, String inqMnt) throws IOException {
		
		ERA006601Message msgL66 = (ERA006601Message) mp.getMessageRecord("ERA006601");
		msgL66.setH01USERID(user.getH01USR());
		msgL66.setH01PROGRM("ERA0066");
		msgL66.setH01TIMSYS(getTimeStamp());
		msgL66.setH01SCRCOD(inqMnt);
		msgL66.setH01OPECOD("0015");
		msgL66.setE01R05REF(referencia);
		
		mp.sendMessage(msgL66);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
		} else {
			int gaColNum = 6;
			String myGaCode[] = new String[gaColNum];
			JBListRec gcodeList = new JBListRec();
			gcodeList.init(gaColNum);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msgL66 = (ERA006601Message) iterator.next();
				
				myGaCode[0] = msgL66.getE01R05SEQ();

				gcodeList.addRow("", myGaCode);
			}
			session.setAttribute("ERA006601Help", list);
			session.setAttribute("gaListBien", gcodeList);
		}	
	}

	//process collateral   (DEPOSITOS DE EFECTIVO EN GARANTIA 'C')
	private void procReqListC(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String referencia, String inqMnt) throws IOException {
		
		ERA006701Message msgL67 = (ERA006701Message) mp.getMessageRecord("ERA006701");
		msgL67.setH01USERID(user.getH01USR());
		msgL67.setH01PROGRM("ERA0067");
		msgL67.setH01TIMSYS(getTimeStamp());
		msgL67.setH01SCRCOD(inqMnt);
		msgL67.setH01OPECOD("0015");
		msgL67.setE01R06REF(referencia);
		
		mp.sendMessage(msgL67);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
		} else {
			int gaColNum = 6;
			String myGaCode[] = new String[gaColNum];
			JBListRec gcodeList = new JBListRec();
			gcodeList.init(gaColNum);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msgL67 = (ERA006701Message) iterator.next();
				
				myGaCode[0] = msgL67.getE01R06SEQ();

				gcodeList.addRow("", myGaCode);
			}
			session.setAttribute("ERA006701Help", list);
			session.setAttribute("gaListBien", gcodeList);
		}	
	}

	//process collateral   (PRENDA INDUSTRIAL 'F' Y OTRAS PRENDAS 'D', 'E')
	private void procReqListPrendaF(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String referencia, String inqMnt) throws IOException {
		
		ERA006501Message msgL65 = (ERA006501Message) mp.getMessageRecord("ERA006501");
		msgL65.setH01USERID(user.getH01USR());
		msgL65.setH01PROGRM("ERA0065");
		msgL65.setH01TIMSYS(getTimeStamp());
		msgL65.setH01SCRCOD(inqMnt);
		msgL65.setH01OPECOD("0015");
		msgL65.setE01R04REF(referencia);
		
		mp.sendMessage(msgL65);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
		} else {
			int gaColNum = 6;
			String myGaCode[] = new String[gaColNum];
			JBListRec gcodeList = new JBListRec();
			gcodeList.init(gaColNum);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msgL65 = (ERA006501Message) iterator.next();
				
				myGaCode[0] = msgL65.getE01R04SEQ();

				gcodeList.addRow("", myGaCode);
			}
			session.setAttribute("ERA006501Help", list);
			session.setAttribute("gaListBien", gcodeList);
		}	
	}

	//process collateral   (PRENDA VEHICULOS)
	private void procReqListPrendaV(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String referencia, String inqMnt) throws IOException {
		
		ERA006401Message msgL64 = (ERA006401Message) mp.getMessageRecord("ERA006401");
		msgL64.setH01USERID(user.getH01USR());
		msgL64.setH01PROGRM("ERA0064");
		msgL64.setH01TIMSYS(getTimeStamp());
		msgL64.setH01SCRCOD(inqMnt);
		msgL64.setH01OPECOD("0015");
		msgL64.setE01R03REF(referencia);
		
		mp.sendMessage(msgL64);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
		} else {
			int gaColNum = 6;
			String myGaCode[] = new String[gaColNum];
			JBListRec gcodeList = new JBListRec();
			gcodeList.init(gaColNum);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msgL64 = (ERA006401Message) iterator.next();
				
				myGaCode[0] = msgL64.getE01R03SEQ();

				gcodeList.addRow("", myGaCode);
			}
			session.setAttribute("ERA006401Help", list);
			session.setAttribute("gaListBien", gcodeList);
		}	
	}

	private void procReqListIns(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String bnk, String referencia,
			String sec, String inqMnt) throws IOException {
		
		mp = null; 
		mp = getMessageProcessor("ERA0062", req);
		ERA006203Message msgL62 = (ERA006203Message) mp.getMessageRecord("ERA006203");
		msgL62.setH03USERID(user.getH01USR());
		msgL62.setH03PROGRM("ERA0062");
		msgL62.setH03TIMSYS(getTimeStamp());
		msgL62.setH03SCRCOD(inqMnt);
		msgL62.setH03OPECOD("0015");
		msgL62.setE03ROCBNK(bnk);
		msgL62.setE03ROCREF(referencia);
		msgL62.setE03ROCSQR(sec);
		
		mp.sendMessage(msgL62);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E03OPECDE");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
		} else {
			int gaColNum = 6;
			String myGaCode[] = new String[gaColNum];
			JBListRec gcodeList = new JBListRec();
			gcodeList.init(gaColNum);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msgL62 = (ERA006203Message) iterator.next();
				
				myGaCode[0] = msgL62.getE03ROCSQR();

				gcodeList.addRow("", myGaCode);
			}
			session.setAttribute("ERA006203Help", list);
			session.setAttribute("gaListIns", gcodeList);
		}	
	}

	//process collateral B (REAL ESTATE) (BIENES INMUEBLES)
	private void procReqListBien(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String referencia, String inqMnt) throws IOException {
		mp = null;
		try {
			mp = getMessageProcessor("ERA0060", req);
			ERA006001Message msgL60 = (ERA006001Message) mp.getMessageRecord("ERA006001");
			msgL60.setH01USERID(user.getH01USR());
			msgL60.setH01PROGRM("ERA0060");
			msgL60.setH01TIMSYS(getTimeStamp());
			msgL60.setH01SCRCOD(inqMnt);
			msgL60.setH01OPECOD("0015");
			msgL60.setE01R01REF(referencia);
			
			mp.sendMessage(msgL60);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01OPECDE");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
			} else {
				int gaColNum = 6;
				String myGaCode[] = new String[gaColNum];
				JBListRec gcodeList = new JBListRec();
				gcodeList.init(gaColNum);
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msgL60 = (ERA006001Message) iterator.next();
					
					myGaCode[0] = msgL60.getE01R01SEQ();
	
					gcodeList.addRow("", myGaCode);
				}
				session.setAttribute("ERA006001Help", list);
				session.setAttribute("gaListBien", gcodeList);
			}	
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private ELEERRMessage procUpdConst(MessageProcessor mp,
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, String reference, String cumrtp) throws IOException {
		
		int colNum = 18;
		String myRow[] = new String[colNum];
		JBListRec pmntList = new JBListRec();
		pmntList.init(colNum);
		
		int maxRow = 0;
		try {
			if (cumrtp.equals("L")) {
				maxRow = Integer.parseInt(req.getParameter("RECNUMDB"));
			}
		} catch (Exception e) {
			maxRow = 0;
		}
		String checked = "";
		String RCN = "";
		// ACTUALIZA LISTA DE INFORMACION GENERAL
		for (int row = 0; row < maxRow; row++) {
			try {
				checked = req.getParameter("SELCONST_" + row);
			} catch (Exception e) {
				checked = "";
			}
			if (req.getParameter("SELCONST_" + row) == null) {
				checked = "";
			}
			if (checked.equals("")) {
				RCN = req.getParameter("E01CUMRCN_" + row);
				if (!RCN.equals("")) {
					myRow[1] = req.getParameter("E01CUMRCN_" + row);
					myRow[2] = req.getParameter("E01CUMMA1_" + row);
					myRow[3] = req.getParameter("E01CUMBNI_" + row);
					myRow[4] = req.getParameter("E01CUMBSX_" + row);
					myRow[5] = req.getParameter("E01CUMAM1_" + row);
					myRow[7] = "0";
					if (req.getParameter("E01CUMNME_" + row) != null) {
						myRow[11] = req.getParameter("E01CUMNME_" + row);
					}
					myRow[9] = "";
					myRow[13] = req.getParameter("E01CUMFL1_" + row);
					myRow[14] = req.getParameter("E01CUMTAR_" + row);
					myRow[15] = req.getParameter("E01CUMPOB_" + row);
					myRow[16] = req.getParameter("E01CUMAM2_" + row);
					myRow[17] = req.getParameter("E01CUMINC_" + row);

					pmntList.addRow("", myRow);
				}
			}
		}
		ERA005501Message msg201 = (ERA005501Message) mp.getMessageRecord("ERA005501");
		msg201.setH01USERID(user.getH01USR());
		msg201.setH01PROGRM("ERA0055");
		msg201.setH01TIMSYS(getTimeStamp());
		msg201.setH01SCRCOD("01");
		msg201.setH01OPECOD("0005");
		msg201.setE01CUMRTP(cumrtp);
		msg201.setE01CUMCUN(reference);
		msg201.setH01FLGMAS("*");
		if (pmntList.getNoResult()) {
			msg201.setH01FLGWK2("N");
		}

		mp.sendMessage(msg201);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		if (mp.hasError(msgError)) {
			return msgError;
		} else {
		
		pmntList.initRow();
		while (pmntList.getNextRow()) {
			msg201 = (ERA005501Message) mp.getMessageRecord("ERA005501");
			msg201.setH01USERID(user.getH01USR());
			msg201.setH01PROGRM("ERA0055");
			msg201.setH01TIMSYS(getTimeStamp());
			msg201.setH01SCRCOD("01");
			msg201.setH01OPECOD("0005");
			msg201.setH01FLGWK2("N");
			msg201.setE01CUMRTP(cumrtp);
			msg201.setE01CUMCUN(reference);
			try {
				msg201.setE01CUMRCN(pmntList.getRecord(1));
			} catch (Exception e) {
			}
			try {
				msg201.setE01CUMMA1(pmntList.getRecord(2));
			} catch (Exception e) {
			}
			try {
				msg201.setE01CUMBNI(pmntList.getRecord(3));
			} catch (Exception e) {
			}

			try {
				msg201.setE01CUMBSX(pmntList.getRecord(4));
			} catch (Exception e) {
			}
			try {
				msg201.setE01CUMAM1(pmntList.getRecord(5));
			} catch (Exception e) {
			}
			try {
				msg201.setE01CUMAM2(pmntList.getRecord(16));
			} catch (Exception e) {
			}
			try {
				msg201.setE01CUMNME(pmntList.getRecord(11));
			} catch (Exception e) {
			}
			msg201.setE01CUMZPC(pmntList.getRecord(9));
			if (cumrtp.equals("H")) {
				msg201.setE01CUMFL1(pmntList.getRecord(13));
				msg201.setE01CUMPOB(pmntList.getRecord(15));
				msg201.setE01CUMAM2(pmntList.getRecord(16));
				msg201.setE01CUMINC(pmntList.getRecord(17));
			}
			msg201.setH01FLGMAS("");
			
			mp.sendMessage(msg201);
			msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		}	
		msg201 = (ERA005501Message) mp.getMessageRecord("ERA005501");
		msg201.setH01USERID(user.getH01USR());
		msg201.setH01PROGRM("ERA0055");
		msg201.setH01TIMSYS(getTimeStamp());
		msg201.setH01SCRCOD("01");
		msg201.setH01OPECOD("0005");
		msg201.setE01CUMRTP(cumrtp);
		try {
			msg201.setE01CUMCUN(reference);
		} catch (Exception e) {
		}
		msg201.setH01FLGMAS("*");
		msg201.setH01FLGWK2("");
		
		mp.sendMessage(msg201);
		return (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		}
	}

	private ELEERRMessage procUpdGarant(MessageProcessor mp,
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, String reference, String cumrtp) throws IOException {
		
		int colNum = 18;
		String myRow[] = new String[colNum];
		JBListRec pmntList = new JBListRec();
		pmntList.init(colNum);
		
		int maxRow = 0;
		try {
			if (cumrtp.equals("Y")) {
				maxRow = Integer.parseInt(req.getParameter("RECNUMGAR"));
			}
		} catch (Exception e) {
			maxRow = 0;
		}
		String checked = "";
		String RCN = "";
		// ACTUALIZA LISTA DE INFORMACION GENERAL
		for (int row = 0; row < maxRow; row++) {
			try {
				checked = req.getParameter("SELGARANT_" + row);
			} catch (Exception e) {
				checked = "";
			}
			if (req.getParameter("SELGARANT_" + row) == null) {
				checked = "";
			}
			if (checked.equals("")) {
				RCN = req.getParameter("E02CUMRCN_" + row);
				if (!RCN.equals("")) {
					myRow[1] = req.getParameter("E02CUMRCN_" + row);
					myRow[2] = req.getParameter("E02CUMMA1_" + row);
					myRow[3] = req.getParameter("E02CUMBNI_" + row);
					myRow[4] = req.getParameter("E02CUMBSX_" + row);
					myRow[5] = req.getParameter("E02CUMAM1_" + row);
					myRow[7] = "0";
					if (req.getParameter("E02CUMNME_" + row) != null) {
						myRow[11] = req.getParameter("E02CUMNME_" + row);
					}
					myRow[9] = "";
					myRow[13] = req.getParameter("E02CUMFL1_" + row);
					myRow[14] = req.getParameter("E02CUMTAR_" + row);
					myRow[15] = req.getParameter("E02CUMPOB_" + row);
					myRow[16] = req.getParameter("E02CUMAM2_" + row);
					myRow[17] = req.getParameter("E02CUMINC_" + row);

					pmntList.addRow("", myRow);
				}
			}
		}
		ERA005501Message msg201 = (ERA005501Message) mp.getMessageRecord("ERA005501");
		msg201.setH01USERID(user.getH01USR());
		msg201.setH01PROGRM("ERA0055");
		msg201.setH01TIMSYS(getTimeStamp());
		msg201.setH01SCRCOD("01");
		msg201.setH01OPECOD("0005");
		msg201.setE01CUMRTP(cumrtp);
		msg201.setE01CUMCUN(reference);
		msg201.setH01FLGMAS("*");
		if (pmntList.getNoResult()) {
			msg201.setH01FLGWK2("N");
		}
		mp.sendMessage(msg201);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");

		pmntList.initRow();
		while (pmntList.getNextRow()) {
			msg201 = (ERA005501Message) mp.getMessageRecord("ERA005501");
			msg201.setH01USERID(user.getH01USR());
			msg201.setH01PROGRM("ERA0055");
			msg201.setH01TIMSYS(getTimeStamp());
			msg201.setH01SCRCOD("01");
			msg201.setH01OPECOD("0005");
			msg201.setH01FLGWK2("N");
			msg201.setE01CUMRTP(cumrtp);
			msg201.setE01CUMCUN(reference);
			try {
				msg201.setE01CUMRCN(pmntList.getRecord(1));
			} catch (Exception e) {
			}
			try {
				msg201.setE01CUMMA1(pmntList.getRecord(2));
			} catch (Exception e) {
			}
			try {
				msg201.setE01CUMBNI(pmntList.getRecord(3));
			} catch (Exception e) {
			}

			try {
				msg201.setE01CUMBSX(pmntList.getRecord(4));
			} catch (Exception e) {
			}
			try {
				msg201.setE01CUMAM1(pmntList.getRecord(5));
			} catch (Exception e) {
			}
			try {
				msg201.setE01CUMAM2(pmntList.getRecord(16));
			} catch (Exception e) {
			}
			try {
				msg201.setE01CUMNME(pmntList.getRecord(11));
			} catch (Exception e) {
			}
			msg201.setH01FLGMAS("");
			
			mp.sendMessage(msg201);
			msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		}	
		msg201 = (ERA005501Message) mp.getMessageRecord("ERA005501");
		msg201.setH01USERID(user.getH01USR());
		msg201.setH01PROGRM("ERA0055");
		msg201.setH01TIMSYS(getTimeStamp());
		msg201.setH01SCRCOD("01");
		msg201.setH01OPECOD("0005");
		msg201.setE01CUMRTP(cumrtp);
		try {
			msg201.setE01CUMCUN(reference);
		} catch (Exception e) {
		}
		msg201.setH01FLGMAS("*");
		msg201.setH01FLGWK2("");
		
		mp.sendMessage(msg201);
		return (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
	}

	private void procReqConst(MessageProcessor mp, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String referencia, String cumrtp, String inqMnt) throws IOException {
		
		ERA005501Message mL0055 = (ERA005501Message) mp.getMessageRecord("ERA005501");
		mL0055.setH01USERID(user.getH01USR());
		mL0055.setH01PROGRM("ERA0055");
		mL0055.setH01TIMSYS(getTimeStamp());
		mL0055.setH01SCRCOD(inqMnt);
		mL0055.setH01OPECOD("0015");
		mL0055.setE01CUMCUN(referencia);
		mL0055.setE01CUMRTP(cumrtp);
		
		mp.sendMessage(mL0055);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
		} else {
			int colNumAcc = 48;
			String myGrpAcc[] = new String[colNumAcc];
			JBListRec grpAccList = new JBListRec();
			grpAccList.init(colNumAcc);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				mL0055 = (ERA005501Message) iterator.next();
				
				myGrpAcc[0] = mL0055.getE01CUMMAN();
				myGrpAcc[1] = mL0055.getE01CUMRCN();
				myGrpAcc[2] = mL0055.getE01CUMMA1();
				myGrpAcc[3] = mL0055.getE01CUMBNI();
				myGrpAcc[4] = mL0055.getE01CUMBSX();
				myGrpAcc[5] = mL0055.getE01CUMAM1();
				myGrpAcc[6] = referencia;
				myGrpAcc[7] = mL0055.getH01FLGWK1();
				myGrpAcc[9] = mL0055.getE01CUMZPC();
				myGrpAcc[41] = mL0055.getE01CUMNME();
				myGrpAcc[42] = mL0055.getE01CUMFL1();
				myGrpAcc[44] = mL0055.getE01CUMPOB();
				myGrpAcc[45] = mL0055.getE01CUMAM2();
				myGrpAcc[46] = mL0055.getE01CUMINC();
				myGrpAcc[47] = mL0055.getE01CUMBMS();
				grpAccList.addRow("", myGrpAcc);
			}
			
			if (cumrtp.equals("L")) {
				session.setAttribute("listConst", grpAccList);
			}
			if (cumrtp.equals("Y")) {
				session.setAttribute("listGarant", grpAccList);
			}
		}
	}
	
}
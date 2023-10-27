package datapro.eibs.forex;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EFE0120DSMessage;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.TrOption;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEFE0120P extends JSEIBSServlet {

	// Foreign Exchange 
	protected static final int R_SPOT				= 1;	
	protected static final int R_MAINTENANCE		= 3;
	protected static final int A_MAINTENANCE		= 4;
	protected static final int R_FINISH				= 37;
	protected static final int A_FINISH				= 38;
	protected static final int A_MAINT_DEAL       	= 40;
	
	// Spots
	protected static final int A_SPOT				= 2;
	protected static final int A_FAST_SPOT			= 10;
	protected static final int A_OPTION				= 12;
	protected static final int A_FORWARD			= 14;
	protected static final int A_SWAP				= 16;
	protected static final int A_NDF				= 18;
	protected static final int A_CNG_SPOT			= 20;
		
	// entering options
	protected static final int R_ENTER_SPOT 		= 100;
	protected static final int R_ENTER_MAINT 		= 300;
	protected static final int A_ENTER_SPOT	 		= 200;
	protected static final int A_ENTER_MAINT		= 400;
	protected static final int A_ENTER_FAST_SPOT	= 600;
	protected static final int A_ENTER_OPTION		= 800;
	protected static final int A_ENTER_FORWARD		= 1000;
	protected static final int A_ENTER_SWAP			= 1200;
	protected static final int A_ENTER_ND_FORWARD	= 1400;
	protected static final int A_ENTER_CNG_SPOT		= 1600;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		// BEGIN 
		// Action
		case A_SPOT :
			procActionMaintenance(user, req, res, session);
			break;
		case A_FAST_SPOT :
			procActionFastSpot(user, req, res, session);
			break;
		case A_OPTION :
			procActionOption(user, req, res, session);
			break;	
		case A_FORWARD :
			procActionForward(user, req, res, session);
			break;					
		case A_SWAP :
			procActionSwap(user, req, res, session);
			break;	
		case A_NDF :
			procActionNDForward(user, req, res, session);
			break;					
		// END ACTIONS

		// BEGIN Entering
		// Request
		case R_ENTER_SPOT : 
			procReqEnterNew(user, req, res, session);
			break;
		case R_ENTER_MAINT : 
			procReqEnterMaint(user, req, res, session);
			break;
		
		// Action 
		case A_ENTER_SPOT : 
			procActionEnterNew(user, req, res, session);
			break;
		case A_ENTER_FAST_SPOT : 
			procActionEnterFastSpot(user, req, res, session);
			break;
		case A_ENTER_OPTION : 
			procActionEnterOption(user, req, res, session);
			break;
		case A_ENTER_FORWARD : 
			procActionEnterForward(user, req, res, session);
			break;
		case A_ENTER_SWAP : 
			procActionEnterSwap(user, req, res, session);
			break;					
		case A_MAINT_DEAL : 
			procActionMaintDeal(user, req, res, session);
			break;	
		case A_ENTER_ND_FORWARD : 
			procActionEnterNDForward(user, req, res, session);
			break;
							
			
		// END Entering

		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procActionEnterNDForward(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String opCode = "0001";
		String ref = "";
		try {
			ref = req.getParameter("E01FESREF").trim();
			if (ref.length() > 0) opCode = "0002";
		} catch (Exception e) {
			ref = "0";
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120P", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) mp.getMessageRecord("EFE0120DS");
		 	msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD(opCode);

			try {
				msgFex.setE01FESTIN(req.getParameter("E01FESTIN").trim());
			} catch (Exception e)	{
				msgFex.setE01FESTIN("0");
			}

			try {
				msgFex.setE01FESCUN(req.getParameter("E01FESCUN").trim());
			} catch (Exception e)	{
				msgFex.setE01FESCUN("0");
			}

			try {
				msgFex.setE01FESTYP(req.getParameter("E01FESTYP").trim());
			} catch (Exception e)	{
				msgFex.setE01FESTYP("OPTI");
			}
			
			try {
				msgFex.setE01FESDID(req.getParameter("E01FESDID").trim());
			} catch (Exception e)	{
				msgFex.setE01FESDID("");
			}
			
			msgFex.setE01FESREF(ref);
		 	
			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0000?SCREEN=100");		
			} else {
				session.setAttribute("fex", msgFex);
				forward("EFE0120P_fe_basic_nd_forward.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionMaintDeal(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		TrOption trOption = (TrOption) session.getAttribute("trOption");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120P", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) mp.getMessageRecord("EFE0120DS");
		 	msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0002");

			try {
				msgFex.setE01FESTIN(req.getParameter("E01FESTIN").trim());
			} catch (Exception e)	{
				msgFex.setE01FESTIN("0");
			}

			try {
				msgFex.setE01FESREF(req.getParameter("E01FESREF").trim());
			} catch (Exception e)	{
				msgFex.setE01FESCUN("0");
			}

			try {
				msgFex.setE01FESDID(req.getParameter("E01FESDID").trim());
			} catch (Exception e)	{
				msgFex.setE01FESDID("");
			}
			
			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0000?SCREEN=100");		
			} else {
				if ("OPTI".equals(msgFex.getE01FESTYP())) {
					trOption.setHeader1("5");
					pageName = "EFE0120P_fe_basic_opt.jsp";
				} else if ("SPOT".equals(msgFex.getE01FESTYP())) {
					trOption.setHeader1("2");				
					pageName = "EFE0120P_fe_basic_sf.jsp";
				} else if ("FWRD".equals(msgFex.getE01FESTYP())) {
					trOption.setHeader1("3");				
					pageName = "EFE0120P_fe_basic_forward.jsp";
				} else if ("SWAP".equals(msgFex.getE01FESTYP())) {
					trOption.setHeader1("4");				
					pageName = "EFE0120P_fe_basic_swap.jsp";
				} else if ("FSP".equals(msgFex.getE01FESTYP())) {
					trOption.setHeader1("1");				
					pageName = "EFE0120P_fe_basic_fast_spot.jsp";
				} else {
					pageName = devPage;
				}
				
				session.setAttribute("fex", msgFex);
				forward(pageName, req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionEnterSwap(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String opCode = "0001";
		String ref = "";
		try {
			ref = req.getParameter("E01FESREF").trim();
			if (ref.length() > 0) opCode = "0002";
		} catch (Exception e) {
			ref = "0";
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120P", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) mp.getMessageRecord("EFE0120DS");
		 	msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD(opCode);

			try {
				msgFex.setE01FESTIN(req.getParameter("E01FESTIN").trim());
			} catch (Exception e)	{
				msgFex.setE01FESTIN("0");
			}

			try {
				msgFex.setE01FESCUN(req.getParameter("E01FESCUN").trim());
			} catch (Exception e)	{
				msgFex.setE01FESCUN("0");
			}

			try {
				msgFex.setE01FESTYP(req.getParameter("E01FESTYP").trim());
			} catch (Exception e)	{
				msgFex.setE01FESTYP("OPTI");
			}
			
			try {
				msgFex.setE01FESDID(req.getParameter("E01FESDID").trim());
			} catch (Exception e)	{
				msgFex.setE01FESDID("");
			}
			
			msgFex.setE01FESREF(ref);
		 	
			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0000?SCREEN=100");		
			} else {
				session.setAttribute("fex", msgFex);
				forward("EFE0120P_fe_basic_swap.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionEnterForward(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String opCode = "0001";
		String ref = "";
		try {
			ref = req.getParameter("E01FESREF").trim();
			if (ref.length() > 0) opCode = "0002";
		} catch (Exception e) {
			ref = "0";
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120P", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) mp.getMessageRecord("EFE0120DS");
		 	msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD(opCode);

			try {
				msgFex.setE01FESTIN(req.getParameter("E01FESTIN").trim());
			} catch (Exception e)	{
				msgFex.setE01FESTIN("0");
			}

			try {
				msgFex.setE01FESCUN(req.getParameter("E01FESCUN").trim());
			} catch (Exception e)	{
				msgFex.setE01FESCUN("0");
			}

			try {
				msgFex.setE01FESTYP(req.getParameter("E01FESTYP").trim());
			} catch (Exception e)	{
				msgFex.setE01FESTYP("OPTI");
			}
			
			try {
				msgFex.setE01FESDID(req.getParameter("E01FESDID").trim());
			} catch (Exception e)	{
				msgFex.setE01FESDID("");
			}
			
			msgFex.setE01FESREF(ref);
		 	
			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0000?SCREEN=100");		
			} else {
				session.setAttribute("fex", msgFex);
				forward("EFE0120P_fe_basic_forward.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionEnterOption(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String opCode = "0001";
		String ref = "";
		try {
			ref = req.getParameter("E01FESREF").trim();
			if (ref.length() > 0) opCode = "0002";
		} catch (Exception e) {
			ref = "0";
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120P", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) mp.getMessageRecord("EFE0120DS");
		 	msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD(opCode);

			try {
				msgFex.setE01FESTIN(req.getParameter("E01FESTIN").trim());
			} catch (Exception e)	{
				msgFex.setE01FESTIN("0");
			}

			try {
				msgFex.setE01FESCUN(req.getParameter("E01FESCUN").trim());
			} catch (Exception e)	{
				msgFex.setE01FESCUN("0");
			}

			try {
				msgFex.setE01FESTYP(req.getParameter("E01FESTYP").trim());
			} catch (Exception e)	{
				msgFex.setE01FESTYP("OPTI");
			}
			
			try {
				msgFex.setE01FESDID(req.getParameter("E01FESDID").trim());
			} catch (Exception e)	{
				msgFex.setE01FESDID("");
			}
			
			msgFex.setE01FESREF(ref);
		 	
			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0000?SCREEN=100");	
			} else {
				session.setAttribute("fex", msgFex);
				forward("EFE0120P_fe_basic_opt.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionEnterFastSpot(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String opCode = "0001";
		String ref = "";
		try {
			ref = req.getParameter("E01FESREF").trim();
			if (ref.length() > 0) opCode = "0002";
		} catch (Exception e) {
			ref = "0";
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120P", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) mp.getMessageRecord("EFE0120DS");
		 	msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD(opCode);

			try {
				msgFex.setE01FESTIN(req.getParameter("E01FESTIN").trim());
			} catch (Exception e)	{
				msgFex.setE01FESTIN("0");
			}

			try {
				msgFex.setE01FESCUN(req.getParameter("E01FESCUN").trim());
			} catch (Exception e)	{
				msgFex.setE01FESCUN("0");
			}

			try {
				msgFex.setE01FESTYP(req.getParameter("E01FESTYP").trim());
			} catch (Exception e)	{
				msgFex.setE01FESTYP("SPOT");
			}
			
			try {
				msgFex.setE01FESDID(req.getParameter("E01FESDID").trim());
			} catch (Exception e)	{
				msgFex.setE01FESDID("");
			}
			
			msgFex.setE01FESREF(ref);
		 	
			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0000?SCREEN=100");	
			} else {
				session.setAttribute("fex", msgFex);
				forward("EFE0120P_fe_basic_fast_spot.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		
		String opCode = "0001";
		String ref = "";
		try {
			ref = req.getParameter("E01FESREF").trim();
			if (ref.length() > 0) opCode = "0002";
		} catch (Exception e) {
			ref = "0";
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120P", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) mp.getMessageRecord("EFE0120DS");
		 	msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD(opCode);

			try {
				msgFex.setE01FESTIN(req.getParameter("E01FESTIN").trim());
			} catch (Exception e)	{
				msgFex.setE01FESTIN("0");
			}

			try {
				msgFex.setE01FESCUN(req.getParameter("E01FESCUN").trim());
			} catch (Exception e)	{
				msgFex.setE01FESCUN("0");
			}

			try {
				msgFex.setE01FESTYP(req.getParameter("E01FESTYP").trim());
			} catch (Exception e)	{
				msgFex.setE01FESTYP("SPOT");
			}
			
			try {
				msgFex.setE01FESDID(req.getParameter("E01FESDID").trim());
			} catch (Exception e)	{
				msgFex.setE01FESDID("");
			}
			
			msgFex.setE01FESREF(ref);
		 	
			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0000?SCREEN=100");	
			} else {
				if ("OPTI".equals(msgFex.getE01FESTYP())) {
					pageName = "EFE0120P_fe_basic_opt.jsp";
				} else {
					pageName = "EFE0120P_fe_basic_sf.jsp";
				}
				session.setAttribute("fex", msgFex);

				forward(pageName, req, res);

			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("FE");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EFE0120P_fe_enter_maint.jsp", req, res);
	}

	private void procReqEnterNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("FE");
		userPO.setPurpose("NEW");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EFE0120P_fe_enter_new.jsp", req, res);
	}

	private void procActionNDForward(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120P", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) session.getAttribute("fex");
			msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0005");
		 	
		 	setMessageRecord(req, msgFex);

			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");

			if (mp.hasError(msgError)) {
				pageName = "EFE0120P_fe_basic_nd_forward.jsp";
			} else {
				userPO.setHeader1(getFullTime());
				userPO.setIdentifier(msgFex.getE01FESREF());
				
				pageName = "EFE0120P_fe_confirm_nd_forward.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fex", msgFex);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionSwap(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120P", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) session.getAttribute("fex");
			msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0005");
		 	
		 	setMessageRecord(req, msgFex);

			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");

			if (mp.hasError(msgError)) {
				pageName = "EFE0120P_fe_basic_swap.jsp";
			} else {
				pageName = "EFE0120P_fe_confirm_swap.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fex", msgFex);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionForward(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120P", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) session.getAttribute("fex");
			msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0005");

		 	setMessageRecord(req, msgFex);
		 	
			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");

			if (mp.hasError(msgError)) {
				pageName = "EFE0120P_fe_basic_forward.jsp";
			} else {
				pageName = "EFE0120P_fe_confirm_forward.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fex", msgFex);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionOption(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120P", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) session.getAttribute("fex");
			msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0005");
		 	
		 	setMessageRecord(req, msgFex);

			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");

			if (mp.hasError(msgError)) {
				pageName = "EFE0120P_fe_basic_opt.jsp";
			} else {
				pageName = "EFE0120P_fe_confirm_opt.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fex", msgFex);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionFastSpot(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120P", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) session.getAttribute("fex");
			msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0005");
			msgFex.setE01FESTYP("FSP ");
			
			setMessageRecord(req, msgFex);

			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");

			if (mp.hasError(msgError)) {
				pageName = "EFE0120P_fe_basic_fast_spot.jsp";
			} else {
				pageName = "EFE0120P_fe_confirm_fast_spot.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fex", msgFex);

			forward(pageName, req, res);

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
			mp = getMessageProcessor("EFE0120P", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) session.getAttribute("fex");
			msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0005");
		 	
		 	setMessageRecord(req, msgFex);

			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");

			if (mp.hasError(msgError)) {
				if ("OPTI".equals(msgFex.getE01FESTYP())) {
					pageName = "EFE0120P_fe_basic_opt.jsp";
				} else {
					pageName = "EFE0120P_fe_basic_sf.jsp";
				}
			} else {
				userPO.setHeader1(getFullTime());				
				userPO.setIdentifier(msgFex.getE01FESREF());
				
				pageName = "EFE0120P_fe_confirm_spot.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fex", msgFex);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
}
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

import datapro.eibs.beans.EFE0325DSMessage;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEFE0325 extends JSEIBSServlet {

	// Foreign Exchange 
	protected static final int R_NEW				= 1;
	protected static final int A_NEW				= 2;	
	protected static final int R_MAINTENANCE		= 3;
	protected static final int A_MAINTENANCE		= 4;
		

	// entering options
	protected static final int R_ENTER_NEW 		= 100;
	protected static final int R_ENTER_MAINT 		= 300;
	
	protected static final int A_ENTER_NEW	 	= 200;
	protected static final int A_ENTER_MAINT		= 400;
	protected static final int A_ENTER_DELETE		= 600;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		// BEGIN Fex
		// Action
		case A_MAINTENANCE :
			procActionMaint(user, req, res, session);
			break;
		case A_NEW :
			procActionNew(user, req, res, session);
			break;					
							
		// END CD

		// BEGIN Entering
		// Action 
		case A_ENTER_NEW : 
			procActionEnterNew(user, req, res, session);
			break;
		case A_ENTER_DELETE : 
			procActionEnterDelete(user, req, res, session);
			break;
		case A_ENTER_MAINT : 
			procActionEnterMaint(user, req, res, session);
			break;	
						
			
		// END Entering

		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String customer = "";
		try {
			customer = req.getParameter("E01FEOCUN").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0325", req);
			EFE0325DSMessage msgFex = (EFE0325DSMessage) mp.getMessageRecord("EFE0325DS");
		 	msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0325");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0002");
		 	
		 	setMessageRecord(req, msgFex);

			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0325DSMessage) mp.receiveMessageRecord("EFE0325DS");

			if (mp.hasError(msgError)) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0322S?SCREEN=1&E01FESCUN=" + customer);
			} else {
				session.setAttribute("error", msgError);
				session.setAttribute("fex", msgFex);

				forward("EFE0325_fe_lim_basic_maint.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionEnterDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String customer = "";
		try {
			customer = req.getParameter("E01FEOCUN").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0325", req);
			EFE0325DSMessage msgFex = (EFE0325DSMessage) mp.getMessageRecord("EFE0325DS");
		 	msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0325");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0004");
		 	
		 	setMessageRecord(req, msgFex);

			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0325DSMessage) mp.receiveMessageRecord("EFE0325DS");

			if (mp.hasError(msgError)) {
				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.forex.JSEWD0322S?SCREEN=1&E01FESCUN=" + customer);
			} else {
				session.setAttribute("error", msgError);
				session.setAttribute("fex", msgFex);

				forward("EFE0325_fe_lim_basic_confirm_delete.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0325", req);
			EFE0325DSMessage msgFex = (EFE0325DSMessage) mp.getMessageRecord("EFE0325DS");
		 	msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0325");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0001");
			msgFex.setE01FEOCUN(userPO.getCusNum());
			try {
				msgFex.setE01FEOBNK(req.getParameter("E01FEOBNK").trim());
			} catch (Exception e) {
				msgFex.setE01FEOBNK("01");
			}
			String customer = "";
			try {
				customer = req.getParameter("E01FEOCUN").trim();
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0325DSMessage) mp.receiveMessageRecord("EFE0325DS");

			if (mp.hasError(msgError)) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0322S?SCREEN=1&E01FESCUN=" + customer);
			} else {
				session.setAttribute("error", msgError);
				session.setAttribute("fex", msgFex);

				forward("EFE0325_fe_lim_basic_new.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0325", req);
			EFE0325DSMessage msgFex = (EFE0325DSMessage) session.getAttribute("fex");
			msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0325");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0005");
		 	
		 	setMessageRecord(req, msgFex);

			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0325DSMessage) mp.receiveMessageRecord("EFE0325DS");

			if (mp.hasError(msgError)) {
				pageName = "EFE0325_fe_lim_basic_new.jsp";
			} else {
				pageName = "EFE0325_fe_lim_basic_confirm_new.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fex", msgFex);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionMaint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0325", req);
			EFE0325DSMessage msgFex = (EFE0325DSMessage) session.getAttribute("fex");
			msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0325");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0005");
		 	
		 	setMessageRecord(req, msgFex);

			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgFex = (EFE0325DSMessage) mp.receiveMessageRecord("EFE0325DS");

			if (mp.hasError(msgError)) {
				pageName = "EFE0325P_fe_lim_basic_maint.jsp";
			} else {
				pageName = "EFE0325_fe_lim_basic_confirm.jsp";
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
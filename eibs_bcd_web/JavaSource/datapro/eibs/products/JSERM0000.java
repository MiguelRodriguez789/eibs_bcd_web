package datapro.eibs.products;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ERM000001Message;
import datapro.eibs.beans.ERM000003Message;
import datapro.eibs.beans.ELEERRMessage;
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
public class JSERM0000 extends JSEIBSServlet {

	//Mantenedor de Remanentes
	protected static final int R_NEW_REMANENTE = 100;
	protected static final int R_ENTER_MANT_REMANENTE = 200;
	protected static final int A_ENTER_MANT_REMANENTE = 300;
	protected static final int A_MANT_REMANENTE = 400;
	protected static final int R_ENTER_TRANSAC_REMANENTE = 600;
	protected static final int A_ENTER_TRANSAC_REMANENTE = 700;
	protected static final int A_TRANSAC_REMANENTE = 800;

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_NEW_REMANENTE :
				procReqNewRemanente(user, req, res, session);
				break;
			case R_ENTER_MANT_REMANENTE :
				procReqEnterMaint(user, req, res, session);
				break;
			case A_ENTER_MANT_REMANENTE :
				procActEnterMaint(user, req, res, session);
				break;
			case A_MANT_REMANENTE :
				procActionMaintenance(user, req, res, session);
				break;
			case R_ENTER_TRANSAC_REMANENTE :
				procReqEnterTransac(user, req, res, session);
				break;
			case A_ENTER_TRANSAC_REMANENTE :
				procActEnterTransac(user, req, res, session);
				break;
			case A_TRANSAC_REMANENTE :
				procActionTransaction(user, req, res, session);
				break;
			default :
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}


	private void procReqNewRemanente(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = new UserPos();
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERM0000", req);
			ERM000001Message msg = (ERM000001Message) mp.getMessageRecord("ERM000001", user.getH01USR(), "0001");
			msg.setE01RMMACD("97");
			msg.setE01RMMPRD(req.getParameter("E01RMMPRD") == null ? "0" : req.getParameter("E01RMMPRD"));
			msg.setE01RMMACC(req.getParameter("E01RMMACC") == null ? "" : req.getParameter("E01RMMACC"));
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ERM000001Message) mp.receiveMessageRecord("ERM000001");
			
			session.setAttribute("error", msgError);
			session.setAttribute("remanentes", msg);
			
			if (mp.hasError(msgError)) { // There are errors
				flexLog("About to call Page: /servlet/datapro.eibs.products.JSESD0711?TYPE=97");
				String firstLink =
						webAppPath
						+ getLangPath(user)
						+ "ESD0711_products_detail.jsp?appcode="
						+ req.getParameter("appcode").trim()
						+ "&typecode="
						+ req.getParameter("typecode").trim()
						+ "&generic="
						+ req.getParameter("generic").trim()
						+ "&title="
						+ req.getParameter("title").trim()
						+ "&bank="
						+ req.getParameter("bank").trim();
				res.setContentType("text/html");
				res.setHeader("Pragma", "No-cache");
				res.setDateHeader("Expires", 0);
				res.setHeader("Cache-Control", "no-cache");
				PrintWriter out = res.getWriter();
				printProdFrame(out, firstLink, getLangPath(user));
			} else { // There are no errors
				userPO.setPurpose("NEW");
				session.setAttribute("userPO", userPO);
				
				forward("ERM0000_remanentes_basic.jsp", req, res);
			}
		
		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		
		session.setAttribute("remanentes", new ERM000001Message());
		
		forward("ERM0000_remanentes_enter_maint.jsp", req, res);
	}

	protected void procActEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ERM0000", req);

			ERM000001Message msg = (ERM000001Message) mp.getMessageRecord("ERM000001", user.getH01USR(), "0002");
			
			//Sets message with page fields
			msg.setH01SCRCOD("01");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERM000001Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("remanentes", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to enter
				forward("ERM0000_remanentes_basic.jsp", req, res);
			} else {
				//if there are errors go back to maintenance page and show errors
				forward("ERM0000_remanentes_enter_maint.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ERM0000", req);

			ERM000001Message msg = (ERM000001Message) mp.getMessageRecord("ERM000001", user.getH01USR(), "0005");
			
			//Sets message with page fields
			msg.setH01SCRCOD("01");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERM000001Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("remanentes", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to enter
				forward("ERM0000_remanentes_enter_maint.jsp", req, res);
			} else {
				//if there are errors go back to maintenance page and show errors
				forward("ERM0000_remanentes_basic.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}


	private void procReqEnterTransac(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		
		session.setAttribute("transaction", new ERM000003Message());
		
		forward("ERM0000_remanentes_enter_transac.jsp", req, res);
	}


	protected void procActEnterTransac(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ERM0000", req);

			ERM000003Message msg = (ERM000003Message) mp.getMessageRecord("ERM000003", user.getH01USR(), "0002");
			
			//Sets message with page fields
			msg.setH03SCRCOD("01");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERM000003Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("transaction", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to enter
				forward("ERM0000_remanentes_transaccion.jsp", req, res);
			} else {
				//if there are errors go back to maintenance page and show errors
				forward("ERM0000_remanentes_enter_transac.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}


	protected void procActionTransaction(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ERM0000", req);

			ERM000003Message msg = (ERM000003Message) mp.getMessageRecord("ERM000003", user.getH01USR(), "0005");
			
			//Sets message with page fields
			msg.setH03SCRCOD("01");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERM000003Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("transaction", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to enter
				forward("ERM0000_remanentes_enter_transac.jsp", req, res);
			} else {
				//if there are errors go back to maintenance page and show errors
				forward("ERM0000_remanentes_transaccion.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}



}

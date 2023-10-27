package datapro.eibs.client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD080001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESD0800 extends JSEIBSServlet {

	protected static final int R_SET_CUST 			= 100;
	protected static final int A_SET_CUST	 		= 200;
	protected static final int R_GET_CUST	 		= 300;
	protected static final int A_SET_CUST_ASYNC		= 400;
	protected static final int A_REMOVE_CUST		= 500;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			// Request
			case R_SET_CUST : 
				procReqSetCustomer(user, req, res, session);
				break;
			
			case A_SET_CUST : 
				procActionSetCustomer(user, req, res, session);
				break;
				
			case R_GET_CUST : 
				procReqGetCustomer(user, req, res, session);
				break;
				
			case A_SET_CUST_ASYNC : 
				procActionSetCustomerAsync(user, req, res, session);
				break;
				
			case A_REMOVE_CUST : 
				procActionRemoveCustomer(user, req, res, session);
				break;
			
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionRemoveCustomer(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		setNoCacheHeaders(res);
		PrintWriter out = res.getWriter();
		session.setAttribute("currClient", null);
		out.write("eraseCurrClientFields();");
	}

	private void procActionSetCustomerAsync(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0800", req);
			ESD080001Message msgClient = (ESD080001Message) mp.getMessageRecord("ESD080001");
			msgClient.setH01USR(user.getH01USR());
			msgClient.setH01PGM("ESD0800");
			msgClient.setH01TIM(getTimeStamp());
			msgClient.setH01SCR("01");
			msgClient.setH01OPE("0002");
			try {
				msgClient.setE01CUSCUN(req.getParameter("E01CUSCUN").trim());
			} catch (Exception e) {
				msgClient.setE01CUSCUN("0");
			}
			try {
			 	msgClient.setE01CUSIDN(req.getParameter("E01CUSIDN").trim());
			} catch (Exception e) {
				msgClient.setE01CUSIDN("");
			}
			
			mp.sendMessage(msgClient);
			MessageRecord msg = mp.receiveMessageRecord();
			
			PrintWriter out = res.getWriter();
			setNoCacheHeaders(res);
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				out.write("showErrors();");
			} else {
				msgClient = (ESD080001Message) msg;
				msgClient.setH01WK1("1");
				session.setAttribute("currClient", msgClient);
				session.setAttribute("error", new ELEERRMessage());
				out.write("updateCurrClient('" + 
						msgClient.getE01CUSIDN() + "','" +
						msgClient.getE01CUSNA1() + "','" +
						msgClient.getE01RELBAN() + "');");
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void setNoCacheHeaders(HttpServletResponse res) {
		res.setHeader("Pragma", "no-cache");
		res.setDateHeader("Expires", -1);
		res.setHeader("Cache-Control", "no-cache");
		res.addHeader("Cache-Control", "max-age=0");
		res.addHeader("Cache-Control", "s-maxage=0");
	}

	private void procReqGetCustomer(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0800", req);
			ESD080001Message msgClient = (ESD080001Message) mp.getMessageRecord("ESD080001");
		 	msgClient.setH01USR(user.getH01USR());
		 	msgClient.setH01PGM("ESD0800");
		 	msgClient.setH01TIM(getTimeStamp());
		 	msgClient.setH01SCR("01");
		 	msgClient.setH01OPE("0002");
		 	msgClient.setE01CUSCUN("0");
			msgClient.setE01CUSIDN("");
			try {
			 	msgClient.setE01ACCNUM(req.getParameter("ACC").trim());
			} catch (Exception e) {
				msgClient.setE01ACCNUM("0");
			}
			mp.sendMessage(msgClient);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
			} else {
				msgClient = (ESD080001Message) msg;
				msgClient.setH01WK1("1");
				session.setAttribute("selClient", msgClient);
				session.setAttribute("error", new ELEERRMessage());
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionSetCustomer(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0800", req);
			ESD080001Message msgClient = (ESD080001Message) mp.getMessageRecord("ESD080001");
		 	msgClient.setH01USR(user.getH01USR());
		 	msgClient.setH01PGM("ESD0800");
		 	msgClient.setH01TIM(getTimeStamp());
		 	msgClient.setH01SCR("01");
		 	msgClient.setH01OPE("0002");
		 	try {
			 	msgClient.setE01CUSCUN(req.getParameter("E01CUSCUN").trim());
			} catch (Exception e) {
				msgClient.setE01CUSCUN("0");
			}
			try {
			 	msgClient.setE01CUSIDN(req.getParameter("E01CUSIDN").trim());
			} catch (Exception e) {
				msgClient.setE01CUSIDN("");
			}
			
			mp.sendMessage(msgClient);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "ESD0800_client_enter.jsp";
			} else {
				msgClient = (ESD080001Message) msg;
				msgClient.setH01WK1("1");
				session.setAttribute("currClient", msgClient);
				session.setAttribute("error", new ELEERRMessage());
				pageName = "ESD0800_client_enter.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqSetCustomer(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		ESD080001Message msgClient = new ESD080001Message(); 
		msgClient.setH01WK1("0");
		
		session.setAttribute("currClient", msgClient);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("ESD0800_client_enter.jsp", req, res);
	}

}

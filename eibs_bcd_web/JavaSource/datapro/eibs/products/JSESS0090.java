package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS009001Message;
import datapro.eibs.beans.ESS009002Message;
import datapro.eibs.beans.ESS009003Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESS0090 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5706894622958846693L;
	
	protected static final int R_INIT_MSG = 0;
	protected static final int R_VIEW_MSG = 1;
	protected static final int A_VIEW_MSG = 2;
	protected static final int R_CHECK_MSG = 3;

	protected static final String CHECK_MSG_PAGE = "ESS0090_message_checker.jsp";
	protected static final String MSG_LIST_PAGE = "ESS0090_message_list.jsp";
	
	public void service(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {
	
		ESS0030DSMessage msgUser = null;
		
		HttpSession session = getSession(req, res);
	    
		if (session != null) {
			int screen;
			try {
				screen = Integer.parseInt(req.getParameter("SCREEN"));
			} catch (Exception e) {
				screen = R_INIT_MSG;
			}
	        msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
			// Here we should get the path from the user profile
			try {
				processRequest(msgUser, req, res, session, screen);
			} catch (Exception e) {
				e.printStackTrace();
				forward(sckNotOpenPage, req, res);
			}
		} else {
	        res.setContentType("text/html");
	        printLogInAgain(res.getWriter());
		}
	}

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_CHECK_MSG :
				procReqCheckMsg(user, req, res, session);
				break;
			case R_VIEW_MSG :
				procReqViewMsg(user, req, res, session);
				break;
			case A_VIEW_MSG :
				procActionViewMsg(user, req, res, session);
				break;
	
			default :
				forward(CHECK_MSG_PAGE, req, res);
				break;
		}
	}

	private void procActionViewMsg(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		int option;

		try {
			option = Integer.parseInt(req.getParameter("opt"));
		} catch (Exception e) {
			throw new ServletException(e);
		}
		switch (option) {
			case 1 : // Goto Action
				procActionGoto(user, req, res, session);
				break;
			case 2 : // Set it Fixed
				procActionFixed(user, req, res, session);
				break;
			case 3 : // Set it Readied
				procActionReadied(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}
	
	private void procActionReadied(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0090", req);
			ESS009003Message msgFixed = (ESS009003Message) mp.getMessageRecord("ESS009003");
			msgFixed.setH03USERID(user.getH01USR());
			msgFixed.setH03PROGRM("ESS0090");
			msgFixed.setH03TIMSYS(getTimeStamp());
			msgFixed.setH03OPECOD("0009");

			String acc = req.getParameter("ACCNUM") == null ? "0" : req.getParameter("ACCNUM");
			msgFixed.setE03MSGACC(acc);
			msgFixed.setE03ACTION("F");
			
			mp.sendMessage(msgFixed);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				forward("error_viewer.jsp", req, res);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}


	private void procActionFixed(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			JBObjList list = (JBObjList) session.getAttribute("msgList");			
			if (list != null) {
				ESS009002Message msgPart = (ESS009002Message) list.get(Util.parseInt(req.getParameter("ROW")));
				mp = getMessageProcessor("ESS0090", req);
				
				ESS009003Message msgFixed = (ESS009003Message) mp.getMessageRecord("ESS009003");
				msgFixed.setH03USERID(user.getH01USR());
				msgFixed.setH03PROGRM("ESS0090");
				msgFixed.setH03TIMSYS(getTimeStamp());
				
				msgFixed.setE03MSGACC(msgPart.getE02MSGACC());
				msgFixed.setE03MSGCUN(msgPart.getE02MSGCUN());
				msgFixed.setE03MSGNUM(msgPart.getE02MSGNUM());
				msgFixed.setE03MSGTXT(req.getParameter("reason") == null ? "" : req.getParameter("reason"));
				msgFixed.setE03ACTION("F");
				
				mp.sendMessage(msgFixed);
				MessageRecord msg = mp.receiveMessageRecord();
				
				if (mp.hasError(msg)) {
					session.setAttribute("error", msg);
					forward("error_viewer.jsp", req, res);
				}				
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionGoto(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		char msgCode = req.getParameter("msgCode") == null || req.getParameter("msgCode").trim().equals("") 
							? ' ' : req.getParameter("msgCode").charAt(0);
		int appCode;
		try {
			appCode = Integer.parseInt(req.getParameter("appCode"));
		} catch (Exception e) {
			appCode = 0;
		}
		
		JBObjList list = (JBObjList) session.getAttribute("msgList");
		ESS009002Message msgPart = (ESS009002Message) list.get(Util.parseInt(req.getParameter("ROW")));
		
		JOActionRedirect red = null;
		
		switch (appCode) {
			case 90:
				red =
					new JOActionRedirect(
						msgPart.getE02MSGACC(),
						appCode,
						msgPart.getE02MSGCUN(),
						getLangPath(user),
						session);
				break;
			case 75:
				red =
					new JOActionRedirect(
						msgPart.getE02MSGCUN(),
						5,
						appCode,
						msgPart.getE02MSGACC(),
						getLangPath(user),
						session);
				break;		
			default:
				red =
					new JOActionRedirect(
						appCode,
						msgPart.getE02MSGACC(),
						getLangPath(user),
						session);
				break;
		}

		switch (msgCode) {
			case 'A' : // Account Approval
				red.setOption(ACC_APPROVAL);
				res.sendRedirect(srctx + red.action());
				break;
			case 'E' : // Account Maintenance
				red.setOption(ACC_MAINTENANCE);
				res.sendRedirect(srctx + red.action());
				break;
			default :
				forward(devPage, req, res);
		}
		
	}

	private void procReqViewMsg(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0090", req);
			ESS009002Message msgList = (ESS009002Message) mp.getMessageRecord("ESS009002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("ESS0090");
			msgList.setH02TIMSYS(getTimeStamp());
			
			mp.sendMessage(msgList);
			
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
			
			if (mp.hasError(list)) {
				res.setContentType("text/html");
				printClose(res.getWriter());
			} else {
				session.setAttribute("msgList", list);
				forward(MSG_LIST_PAGE, req, res);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqCheckMsg(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		if (userPO == null) userPO = new UserPos();
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0090", req);
			ESS009001Message msgCheck = (ESS009001Message) mp.getMessageRecord("ESS009001");
			msgCheck.setH01USERID(user.getH01USR());
			
			mp.sendMessage(msgCheck);
			
			MessageRecord msg = mp.receiveMessageRecord();
			
			if ("ESS009001".equals(msg.getFormatName())) {
				msgCheck = (ESS009001Message) msg;
				userPO.setThereIsMsg("Y".equalsIgnoreCase(msgCheck.getE01MSGFLG()));
			} else {
				userPO.setThereIsMsg(false);
			}
			
            forward(CHECK_MSG_PAGE, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

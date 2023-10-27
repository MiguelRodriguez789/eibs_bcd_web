package datapro.eibs.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS013001Message;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESS0130 extends JSEIBSServlet {

	protected static final int R_ENTER_USER_GROUP = 1;
	protected static final int A_ENTER_USER_GROUP = 2;
	protected static final int A_MAINT_USER_GROUP = 3;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			//Request
			case R_ENTER_USER_GROUP :
				procReqEnterUserGroup(user, req, res, session);
				break;
				//Actions
			case A_ENTER_USER_GROUP :
				procActionEnterUserGroup(user, req, res, session);
				break;
			case A_MAINT_USER_GROUP :
				procActionMaintUserGroup(user, req, res, session);
				break;
				// END Entering
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionMaintUserGroup(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0130", req);
			ESS013001Message msgUsr = (ESS013001Message) mp.getMessageRecord("ESS013001");
			msgUsr.setH01USERID(user.getH01USR());
			msgUsr.setH01PROGRM("ESS0130");
			msgUsr.setH01TIMSYS(getTimeStamp());
			msgUsr.setH01SCRCOD("01");
			try {
				msgUsr.setH01OPECOD(req.getParameter("E01OPETYP") == null ? "0002" : req.getParameter("E01OPETYP"));
			} catch (Exception e) {
				msgUsr.setH01OPECOD("0002");
			}

			try {
				msgUsr.setE01USEUID(req.getParameter("E01USEUID") == null ? "" : req.getParameter("E01USEUID"));
			} catch (Exception e) {
				msgUsr.setE01USEUID("");
			}
			
			try {
				msgUsr.setE01USECLS(req.getParameter("E01USECLS") == null ? "" : req.getParameter("E01USECLS"));
			} catch (Exception e) {
				msgUsr.setE01USECLS("");
			}
			
			mp.sendMessage(msgUsr);
				
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgUsr = (ESS013001Message) mp.receiveMessageRecord("ESS013001");
				
			if (mp.hasError(msgError)) {
				pageName = "ESS0130_user_group_maint.jsp";
			} else {
				pageName = "ESS0130_user_group_maint_enter.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("user", msgUsr);
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionEnterUserGroup(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0130", req);
			ESS013001Message msgUsr = (ESS013001Message) mp.getMessageRecord("ESS013001");
			msgUsr.setH01USERID(user.getH01USR());
			msgUsr.setH01PROGRM("ESS0130");
			msgUsr.setH01TIMSYS(getTimeStamp());
			msgUsr.setH01SCRCOD("01");
			try {
				msgUsr.setH01OPECOD(req.getParameter("E01OPETYP") == null ? "0002" : req.getParameter("E01OPETYP"));
			} catch (Exception e) {
				msgUsr.setH01OPECOD("0002");
			}

			try {
				msgUsr.setE01USEUID(req.getParameter("E01USEUID") == null ? "" : req.getParameter("E01USEUID"));
			} catch (Exception e) {
				msgUsr.setE01USEUID("");
			}
			
			ELEERRMessage msgError = new ELEERRMessage(); 
			
			if ("0001".equals(msgUsr.getH01OPECOD())) {
				pageName = "ESS0130_user_group_maint.jsp";
			} else {
				mp.sendMessage(msgUsr);
				
				msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				msgUsr = (ESS013001Message) mp.receiveMessageRecord("ESS013001");
				
				if (mp.hasError(msgError)) {
					pageName = "ESS0130_user_group_maint_enter.jsp";
				} else {
					pageName = "ESS0130_user_group_maint.jsp";
				}
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("user", msgUsr);
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEnterUserGroup(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", new UserPos());
		
		forward("ESS0130_user_group_maint_enter.jsp", req, res);
	}

}

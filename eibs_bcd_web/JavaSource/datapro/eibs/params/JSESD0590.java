package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD059001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESD0590 extends JSEIBSServlet {

	protected static final int R_ENTER 			= 1;
	protected static final int R_BRANCH_LIST 	= 100;
	protected static final int R_NEW 			= 300;
	protected static final int R_MAINTENANCE 	= 500;
	protected static final int A_MAINTENANCE 	= 600;
	protected static final int R_DELETE 		= 700;
	protected static final int A_POSITION 		= 800;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			//Request
			case R_ENTER :
				 procReqEnterBranch(user, req, res, session);							
				 break;
			case R_BRANCH_LIST :
				procReqBranchList(user, req, res, session);
				break;
			case R_NEW :
				 procReqNew(user, req, res, session);							
				break;	
			case R_MAINTENANCE :
				procReqMaintenance(user, req, res, session);							
				break;
			case R_DELETE :
				procReqBranchListDelete(user, req, res, session);
				break;
				// Action
			case A_POSITION :
				procActionPos(user, req, res, session);
				break;
			case A_MAINTENANCE :
				 procActionMaintenance(user, req, res, session);							
				break;
				// END Entering
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0590", req);
			ESD059001Message msgRT = (ESD059001Message) session.getAttribute("brnDetails");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("ESD0590");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0005");
			
			setMessageRecord(req, msgRT);
			
			mp.sendMessage(msgRT);
            ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
            msgRT = (ESD059001Message) mp.receiveMessageRecord("ESD059001");
			
            if (mp.hasError(msgError)) {
				flexLog("Putting java beans into the session");
				session.setAttribute("error", msgError);
				session.setAttribute("brnDetails", msgRT);
				session.setAttribute("userPO", userPO);
                forward("ESD0590_branch_maintenance.jsp", req, res);
            } else {
            	procReqBranchList(user, req, res, session);
            }
            
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionPos(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException {
		
		try {
			int inptOPT = Integer.parseInt(req.getParameter("opt"));
			switch (inptOPT) {
				case 1 : //New
					procReqNew(user, req, res, session);
					break;
				case 2 : //Maintenance
					procReqMaintenance(user, req, res, session);
					break;
				case 3 : //Delete
					procReqBranchListDelete(user, req, res, session);
					break;
				default :
					procReqMaintenance(user, req, res, session);
					break;
			}
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}

	private void procReqBranchListDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		JBObjList bl = (JBObjList) session.getAttribute("ESD059001Help");
		try {
			mp = getMessageProcessor("ESD0590", req);
			int idx = Integer.parseInt(req.getParameter("CURRCODE"));
			ESD059001Message msgList = (ESD059001Message) bl.get(idx);
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0590");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0003");
			
			mp.sendMessage(msgList);
            ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
            if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
            	forward("ESD0590_branch_list.jsp", req, res);
            } else {
            	procReqBranchList(user, req, res, session);
            }
			
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("MAINTENANCE");
		
		JBObjList bl = (JBObjList) session.getAttribute("ESD059001Help");
		try {
			int idx = Integer.parseInt(req.getParameter("CURRCODE"));
			ESD059001Message msgDoc = (ESD059001Message) bl.get(idx);
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("brnDetails", msgDoc);
			
            forward("ESD0590_branch_maintenance.jsp", req, res);
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("NEW");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0590", req);
			ESD059001Message msgRT = (ESD059001Message) mp.getMessageRecord("ESD059001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("ESD0590");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0001");
			msgRT.setE01BRNBNK(userPO.getBank());
			try {
				msgRT.setE01BRNNUM(req.getParameter("E01BRNNUM") == null ? "" : req.getParameter("E01BRNNUM"));
			} catch (Exception e) {
				msgRT.setE01BRNNUM("");
			}
			
			mp.sendMessage(msgRT);
            ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
            msgRT = (ESD059001Message) mp.receiveMessageRecord("ESD059001");
		
            if (mp.hasError(msgError)) {
            	pageName = "ESD0590_branch_list.jsp";
            } else {
            	pageName = "ESD0590_branch_maintenance.jsp";
            }
            session.setAttribute("error", msgError);
			session.setAttribute("brnDetails", msgRT);
			session.setAttribute("userPO", userPO);
            
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqBranchList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		if (req.getParameter("E01BRNBNK") != null) {
			userPO.setBank(req.getParameter("E01BRNBNK"));
		}
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0590", req);
			ESD059001Message msgList = (ESD059001Message) mp.getMessageRecord("ESD059001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0590");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			msgList.setE01BRNBNK(userPO.getBank());
			
			mp.sendMessage(msgList);
            ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
            JBObjList list = mp.receiveMessageRecordList("E01OPECDE"); 
            
            if (mp.hasError(msgError)) {
            	pageName = "error_viewer.jsp";
            } else {
            	pageName = "ESD0590_branch_list.jsp";
            }
            session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("ESD059001Help", list);
            
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEnterBranch(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", new UserPos());
		
		forward("ESD0590_branch_enter.jsp", req, res);
	}

}

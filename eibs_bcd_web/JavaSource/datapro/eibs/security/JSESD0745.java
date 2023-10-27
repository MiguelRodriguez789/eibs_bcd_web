package datapro.eibs.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD074501Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESD0745 extends JSEIBSServlet {

	protected static final int R_LIST 	= 1;
	protected static final int A_LIST 	= 2;
	protected static final int A_MAINT 	= 3;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_LIST :
				procReqList(user, req, res, session);
				break;
			case A_LIST :
				procActionList(user, req, res, session);
				break;
			case A_MAINT :
				procActionMaintenance(user, req, res, session);
				break;
	
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String opt = req.getParameter("OPT") == null ? "" : req.getParameter("OPT");
		String opeCode = "N".equals(opt) ? "0001" : "0005";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0745", req);
			ESD074501Message msgList = (ESD074501Message) mp.getMessageRecord("ESD074501");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0745");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD(opeCode);
			
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD074501Message) mp.receiveMessageRecord("ESD074501");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("pp", msgList);
				forward("ESD0745_parameter_password_basic.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		String opt = req.getParameter("opt") == null ? "" : req.getParameter("opt");
		userPO.setPurpose(opt);
		
		ESD074501Message msgList = new ESD074501Message();  

	    if ("M".equals(userPO.getPurpose())) {
	      JBObjList beanList = (JBObjList)session.getAttribute("ppList");
	      msgList = (ESD074501Message)beanList.get(Util.parseInt(req.getParameter("ROW1")));
	    }

		flexLog("Putting java beans into the session");
		session.setAttribute("pp", msgList);
		session.setAttribute("userPO", userPO);
		
		forward("ESD0745_parameter_password_basic.jsp", req, res);
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(session);
		String pageName = "";
		String typ = req.getParameter("TYP") == null ? "SBS" : req.getParameter("TYP");
		userPO.setType(typ);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ESD0745", req);
			ESD074501Message msgList = (ESD074501Message) mp.getMessageRecord("ESD074501");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0745");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = new ELEERRMessage(); 			
			JBObjList list = mp.receiveMessageRecordList("E01EPROPE");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0745_parameter_password_list.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("ppList", list);
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

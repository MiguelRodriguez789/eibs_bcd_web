package datapro.eibs.ach;
/**
 * ACH Inquiry for Incoming or Outgoing Transactions 
 * Creation date: (09/23/09)
 * @author: Carlos Castillo
 * ACH Inquiry
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send screen for selection parameters
 *	// SCREEN =    2    Send List with results for inquiry
 *	// SCREEN =    3    Send Transaction Detail 
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEACH500 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			//  
		case 1 : // Request Search Parameters 
			procReqSrhPrm(user, req, res, session);
			break;
		case 2 :
			procReqList(user, req, res, session);
			break;
		case 3 :
			procReqDetail(user, req, res, session);
			break;	
		default :
			forward(SuperServlet.devPage, req, res);
			break;
		}
	}

	// SCREEN = 1 
	// Send Screen for Search Parameters  
	//
	protected void procReqSrhPrm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("ENTER");
		ses.setAttribute("userPO", userPO);
		forwardOnSuccess("EACH500_IN_OUT_Inquiry.jsp", req, res);
		
	}
	
	// SCREEN = 2 
	// Send List with Search Results  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EACH500");
			EACH50001Message msg = (EACH50001Message) mp.getMessageRecord("EACH50001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EACH500");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			userPO.setPurpose("INQUIRY");
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01REQTYP((req.getParameter("E01REQTYP") == null ? "I" : req.getParameter("E01REQTYP")));
			msg.setE01REQORD((req.getParameter("E01REQORD") == null ? "D" : req.getParameter("E01REQORD")));
			msg.setE01REQSTS((req.getParameter("E01REQSTS") == null ? "*" : req.getParameter("E01REQSTS")));
			msg.setE01REQFRM((req.getParameter("E01REQFRM") == null ? "0" : req.getParameter("E01REQFRM")));
			msg.setE01REQPDM((req.getParameter("E01REQPDM") == null ? "0" : req.getParameter("E01REQPDM")));
			msg.setE01REQPDD((req.getParameter("E01REQPDD") == null ? "0" : req.getParameter("E01REQPDD")));
			msg.setE01REQPDY((req.getParameter("E01REQPDY") == null ? "0" : req.getParameter("E01REQPDY")));
			
			userPO.setType(msg.getE01REQTYP());
			userPO.setHeader1(msg.getE01REQORD());
			userPO.setHeader2(msg.getE01REQSTS());
			userPO.setHeader3(msg.getE01REQFRM());
			userPO.setHeader4(msg.getE01REQPDM());
			userPO.setHeader5(msg.getE01REQPDD());
			userPO.setHeader6(msg.getE01REQPDY());
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EACH500List", list);
			}
			forwardOnSuccess("EACH500_ach_inquiry_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	// SCREEN = 3 
	// Send Screen with ACH Detail  
	//
	protected void procReqDetail(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		try {
			mp = new MessageProcessor("EACH500");
			EACH50002Message msg = (EACH50002Message) mp.getMessageRecord("EACH50002");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EACH500");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("0005");
			userPO.setPurpose("INQUIRY");
			
			try {
				msg.setE02REQTYP(req.getParameter("E01REQTYP"));
			} catch (Exception e) { 
				msg.setE02REQTYP("I");
			}
			try {
				msg.setE02REQSTS(req.getParameter("E01REQSTS"));
			} catch (Exception e) { 
				msg.setE02REQTYP("*");
			}
			try {
				msg.setE02REQNUM(req.getParameter("E01ACHNRO"));
			} catch (Exception e) { 
				msg.setE02REQNUM("0");
			}
			userPO.setType(msg.getE02REQTYP());
			userPO.setHeader2(msg.getE02REQSTS());
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (!mp.hasError(newmessage)) {
				ses.setAttribute("EACH500Record", newmessage);
				forwardOnSuccess("EACH500_ach_detail.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}
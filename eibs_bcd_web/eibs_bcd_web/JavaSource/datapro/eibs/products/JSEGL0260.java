package datapro.eibs.products;
/**
 * G/L - Borra Transacciones de Cuentas Reconciliables
 * Creation date: (10/24/11)
 * @author: Carlos J. Moran
 * 	// List of Options
 * 	//
 *	// SCREEN =    4    Reject Payment  
 * **/

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEGL0260 extends JSEIBSServlet { 
	 
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
		case 2 :  // Send list with results for Process
			procReqList(user, req, res, session, screen);
			break;
       	case 4 : // Delete 
            procActionRec(user, req, res, session, screen);
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

		ses.setAttribute("error", new ELEERRMessage());
		
		EGL026001Message msg = ses.getAttribute("msg") == null ?  new EGL026001Message() : (EGL026001Message) ses.getAttribute("msg");
		ses.setAttribute("msg", msg);
		
		forwardOnSuccess("EGL0260_recons_delete_search.jsp", req, res);
	}
	
	
	// SCREEN = 2 
	// Send Recons List  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(ses);
		userPO.setPurpose("LIST");
		String pageName = "";
		
		int pos = 0;
		try {
			pos = Integer.parseInt(req.getParameter("pos"));
		} catch (Exception e) {
			pos = 0; 
		}
		
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EGL0260");
			EGL026001Message msg = (EGL026001Message) mp.getMessageRecord("EGL026001", user.getH01USR(), "0001");
			// Send Initial data
			msg.setH01SCRCOD("01");
			msg.setE01NUMREC("" + pos);
			
			setMessageRecord(req, msg);
			
			userPO.setBank(msg.getE01TRABNK());
			userPO.setBranch(msg.getE01TRABRN());
			userPO.setCurrency(msg.getE01TRACCY());
			userPO.setAccNum(msg.getE01TRAGLN());
			userPO.setIdentifier(msg.getE01TRAACC());			
						
			// Send Message	
			mp.sendMessage(msg);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			ELEERRMessage msgError = new ELEERRMessage();
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				msg = (EGL026001Message) mp.getMessageRecord("EGL026001", user.getH01USR(), "0001");
				msg.setE01TRABNK(userPO.getBank());
				msg.setE01TRABRN(userPO.getBranch());
				msg.setE01TRACCY(userPO.getCurrency());
				msg.setE01TRAGLN(userPO.getAccNum());
				msg.setE01TRAACC(userPO.getIdentifier());			
				ses.setAttribute("msg", msg);
				pageName = "EGL0260_recons_delete_search.jsp";
			} else {
				ses.setAttribute("EGL0260List", list);
				pageName = "EGL0260_recons_delete_list.jsp";
			}
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	//	 SCREEN = 4
	// Get or Process Record  
	//
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(ses);
		
		JBObjList list = (JBObjList) ses.getAttribute("EGL0260List");
		int size = list.size();
		
		ELEERRMessage msgError = new ELEERRMessage();
		
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EGL0260");
			for (int i = 0; i < size; i++) {
				if (req.getParameter("E01ACT_" + i) != null) {
					EGL026001Message msg = (EGL026001Message) list.get(i);
					msg.setH01SCRCOD("01");
					msg.setH01OPECOD("0003");
					
					mp.sendMessage(msg);
					
					msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
					if (mp.hasError(msgError)) {
						break;
					}
				}
			}
			
			EGL026001Message msg = (EGL026001Message) mp.getMessageRecord("EGL026001", user.getH01USR(), "0001");
			msg.setE01TRABNK(userPO.getBank());
			msg.setE01TRABRN(userPO.getBranch());
			msg.setE01TRACCY(userPO.getCurrency());
			msg.setE01TRAGLN(userPO.getAccNum());
			msg.setE01TRAACC(userPO.getIdentifier());			
			msg.setE01NUMREC("0");
			
			mp.sendMessage(msg);
			// Receive List
			list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
			}
			ses.setAttribute("EGL0260List", list);
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			forward("EGL0260_recons_delete_list.jsp", req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

}
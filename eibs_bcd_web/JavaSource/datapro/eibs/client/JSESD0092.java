package datapro.eibs.client;
/**
 * Maintenance of Economic Groups 
 * Creation date: (03/14/14)
 * @author: Carlos Castillo
 * 
 *  
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSESD0092 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 :
			case 6 :
				procReqList(user, req, res, session, screen);
				break;
			case 2 : // Request new Record - Header
			case 3 : // Request old Record - Header
			case 4 : // Delete record - Header
			case 5 : // Submit the Record for update - Header
			case 12: // Request new Record - Detail
			case 13: // Request old Record - Detail
			case 14: // Delete record - Detail
			case 15: // Submit the Record for update Detail
	
				procActionRec(user, req, res, session, screen);
				break;
				// Requests List with components
			case 10 :
			case 16 :	
				procReqListDetail(user, req, res, session, screen);
				
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1, 6
	// Send List - Headers
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ESD0092");
			ESD009201Message msg = (ESD009201Message) mp.getMessageRecord("ESD009201");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0092");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
				msg.setH01OPECOD("0001");
			} else {
				userPO.setPurpose("INQUIRY");
				msg.setH01OPECOD("0011");
			}
			msg.setE01NUMREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
			msg.setE01GEMMST(req.getParameter("SEARCHMST") == null ? "0" : req.getParameter("SEARCHMST"));
			msg.setE01GEMCUN(req.getParameter("SEARCHCDE") == null ? "0" : req.getParameter("SEARCHCDE"));
			userPO.setPorfNum(msg.getE01GEMMST());
			userPO.setCusNum(msg.getE01GEMCUN());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("ESD0092List", list);
			}
			forward("ESD0092_client_groups_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 2,3,4,5, 12,13,14,15
	// Get or Process the Record  
	//
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("ESD0092");
			ESD009201Message msg = (ESD009201Message) mp.getMessageRecord("ESD009201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0092");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			String rdrscreen = "1";
			String pageList = "ESD0092_client_groups_list.jsp";
			String pageDtl = "ESD0092_client_group_header.jsp";
			if (screen > 9 ) {
				rdrscreen = "10";
				pageList = "ESD0092_client_group_filial_list.jsp";
				pageDtl = "ESD0092_client_group_filial.jsp";
			}
			switch (screen) {
				case 2 : // Request new Record
					msg.setH01OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 3 : // Request old Record
					msg.setH01OPECOD("0003");
					break;
				case 4 : // Delete Record
					msg.setH01OPECOD("0004");
					break;
				case 5 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					break;
				case 12: // Request new Record
					msg.setH01OPECOD("0012");
					userPO.setPurpose("NEW");
					break;
				case 13: // Request old Record
					msg.setH01OPECOD("0013");
					break;
				case 14: // Delete Record
					msg.setH01OPECOD("0014");
					break;
				case 15: // Submit the Record for update
					msg.setH01OPECOD("0015");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			msg.setE01GEMGRP(req.getParameter("E01GEMGRP") == null ? "" : req.getParameter("E01GEMGRP"));
			String grp = msg.getE01GEMGRP();
			msg.setE01GEMMST(req.getParameter("E01GEMMST") == null ? "0" : req.getParameter("E01GEMMST"));
			String mst = msg.getE01GEMMST();
			msg.setE01GEMCUN(req.getParameter("E01GEMCUN") == null ? "0" : req.getParameter("E01GEMCUN"));
			msg.setE01GEMCUM(req.getParameter("E01GEMCUM") == null ? "0" : req.getParameter("E01GEMCUM"));
			
			if (screen == 5 || screen == 15) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4 || screen == 12 || screen == 13 || screen == 14) {
					forward(pageList, req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("ESD0092Record", newmessage);
					forward(pageDtl, req, res);
				}
			} else {
				if (screen == 4 || screen == 5 || screen == 14 || screen == 15) {
					redirectToPage("/servlet/datapro.eibs.client.JSESD0092?SCREEN=" + rdrscreen + "&E01GEMGRP=" + grp + "&E01GEMMST=" + mst + "&FromRecord=0", res);
				} else {
					ses.setAttribute("ESD0092Record", newmessage);
					forward(pageDtl, req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 10, 16
	// Send Detail List   
	//
	protected void procReqListDetail(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ESD0092");
			ESD009201Message msg = (ESD009201Message) mp.getMessageRecord("ESD009201");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0092");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0010");
			if (screen == 10) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			} 
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0");  
			}
			try {
				msg.setE01GEMMST(req.getParameter("E01GEMMST"));
			} catch (Exception e) {
				msg.setE01GEMMST(userPO.getCusNum());
			}
			try {
				msg.setE01GEMGRP(req.getParameter("E01GEMGRP"));
			} catch (Exception e) {
				msg.setE01GEMGRP(" ");
			}
			try {
				msg.setE01GEMCUN(req.getParameter("SEARCHCUN"));
			} catch (Exception e) {
				msg.setE01GEMCUN("0");
			}
			userPO.setCusNum(msg.getE01GEMCUN());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("ESD0092List", list);
			}
			forward("ESD0092_client_group_filial_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
}
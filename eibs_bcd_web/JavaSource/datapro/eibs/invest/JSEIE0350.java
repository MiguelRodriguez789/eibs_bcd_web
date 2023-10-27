package datapro.eibs.invest;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sound.sampled.spi.FormatConversionProvider;

import datapro.eibs.beans.*;

import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

import datapro.eibs.sockets.*;

public class JSEIE0350 extends datapro.eibs.master.JSEIBSServlet {

	// Limits Inquiry
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected static final int R_SELECT    	 	= 100;
	protected static final int A_LIST_TOTAL  	= 200;
	protected static final int A_UPDATE_TOTAL	= 300;
	protected static final int A_SELECT_DETAIL	= 400;
	protected static final int A_UPDATE_DETAIL	= 500;
	protected static final int R_APPROVAL_LIST	= 600;
	protected static final int A_APPROVAL		= 700;
	
	
	protected String LangPath = "S";


	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		MessageContext mc = null;

				switch (screen) {
					// Requests
					case R_SELECT :
						procReqPosition(mc, user, req, res, session);
					break;
					case A_LIST_TOTAL :
						procReqPositionTotal(mc, user, req, res, session);		
					break;
					case A_UPDATE_TOTAL :
						procUpdTotal(mc, user, req, res, session);
					break;
					case A_SELECT_DETAIL :
						procReqPositionDetail(mc, user, req, res, session);
					break;
					case R_APPROVAL_LIST :
						procReqApprovalList(mc, user, req, res, session);
					break;
					case A_UPDATE_DETAIL :
						procUpdDetail(mc, user, req, res, session);
					break;
					case A_APPROVAL :
						procApproval(mc, user, req, res, session);
					break;
					default :
						res.sendRedirect(super.srctx + LangPath + super.devPage);
					break;
				}


	}
	protected void procReqPosition(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {
		
		MessageRecord newmessage = null;
		EIE032002Message msgList = null;
		ELEERRMessage msgError = null;
		JBList beanList = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError =new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		forward("EIE0350_sel_position.jsp", req, res);
		
	}
	protected void procReqPositionTotal(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			EIE005001Message msgInst = null;
			ELEERRMessage msgError  = new ELEERRMessage();
			UserPos userPO = null;
			EIE035001Message msgList = null;
			JBObjList objList = new JBObjList();

			boolean IsNotError = false;

			try {
				msgError = new datapro.eibs.beans.ELEERRMessage();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			// Send Initial data
			try {
				mp = getMessageProcessor("EIE0350", req);
				msgList = (EIE035001Message) mp.getMessageRecord("EIE035001");
				
				msgList.setH01USERID(user.getH01USR());
				msgList .setH01OPECOD("0001");	
				
				
				try { // Search Investment Class
					msgList.setE01SELTYP(req.getParameter("E01SELTYP"));
					
				} catch (Exception e) {

				}
				try { // Search Investment Status
					msgList.setE01SELSTS(req.getParameter("E01SELSTS"));
					
				} catch (Exception e) {

				}
				userPO.setOption(req.getParameter("E01SELTYP"));
				userPO.setAccOpt(req.getParameter("E01SELSTS"));
				mp.sendMessage(msgList);
				// Receive Error Message
				objList = mp.receiveMessageRecordList("H01FLGMAS");
				if (mp.hasError(objList)) {
					msgError = (ELEERRMessage) newmessage;
					ses.setAttribute("error", msgError);
					forward("EIE0350_sel_position.jsp", req, res);
				} else {
					// Receive Data
					ses.setAttribute("list", objList);
					ses.setAttribute("userPO", userPO);
					forward("EIE0350_inv_position_list.jsp", req, res);
				}
				
				
				

				
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			} finally {
				if(mp != null)mp.close();
			}
	}

	protected void procUpdTotal(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			EIE005001Message msgInst = null;
			ELEERRMessage msgError  = new ELEERRMessage();
			UserPos userPO = null;
			EIE035001Message msgList = null;
			JBObjList objList = new JBObjList();

			boolean IsNotError = false;

			try {
				msgError = new datapro.eibs.beans.ELEERRMessage();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send Initial data
			try {
				mp = getMessageProcessor("EIE0350", req);
				msgList = (EIE035001Message) mp.getMessageRecord("EIE035001");
				
				msgList.setH01USERID(user.getH01USR());
				msgList.setH01OPECOD("0002");	
				try {
					msgList.setE01SELTYP(userPO.getOption());
					
				} catch (Exception e) {

				}
				try {
					msgList.setE01SELSTS(userPO.getAccOpt());
					
				} catch (Exception e) {

				}
				try { // Search Investment Class
					msgList.setE01UPDTYP(req.getParameter("TYPE"));
					
				} catch (Exception e) {

				}
				try { // Search Investment Class
					msgList.setE01UPDSTS(userPO.getAccOpt());
					
				} catch (Exception e) {

				}
				try { // Action
					msgList.setE01ACTION(req.getParameter("E01ACTION"));
					
				} catch (Exception e) {

				}
				try { // Search Instrument
					msgList.setE01ISINUM(req.getParameter("INSTRUMENT"));
					
				} catch (Exception e) {

				}
				mp.sendMessage(msgList);
				objList = mp.receiveMessageRecordList("H01FLGMAS");
				if (mp.hasError(objList)) {
					msgError = (ELEERRMessage) newmessage;
					ses.setAttribute("error", msgError);
					forward("EIE0350_inv_position_list.jsp", req, res);
				} else {
					// Receive Data
					ses.setAttribute("list", objList);
					ses.setAttribute("userPO", userPO);
					forward("EIE0350_inv_position_list.jsp", req, res);
				}
				
				
				

				
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			} finally {
				if(mp != null)mp.close();
			}
	}
	protected void procReqPositionDetail(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			EIE005001Message msgInst = null;
			ELEERRMessage msgError  = new ELEERRMessage();
			UserPos userPO = null;
			EIE035001Message msgList = null;
			JBObjList objList = new JBObjList();

			boolean IsNotError = false;

			try {
				msgError = new datapro.eibs.beans.ELEERRMessage();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			// Send Initial data
			try {
				mp = getMessageProcessor("EIE0350", req);
				msgList = (EIE035001Message) mp.getMessageRecord("EIE035001");
				
				msgList.setH01USERID(user.getH01USR());
				msgList.setH01OPECOD("0003");
				try {
					userPO.setOption(req.getParameter("TYPE"));
				} catch (Exception e) {

				}
				msgList.setE01SELTYP(userPO.getOption());
				try {
					userPO.setIdentifier(req.getParameter("INSTRUMENT"));
				} catch (Exception e) {

				}
				try { // Search Investment Class
					msgList.setE01ISINUM(req.getParameter("INSTRUMENT"));
					
				} catch (Exception e) {

				}

				mp.sendMessage(msgList);
				// Receive Error Message
				objList = mp.receiveMessageRecordList("H01FLGMAS");
				if (mp.hasError(objList)) {
					msgError = (ELEERRMessage) newmessage;
					ses.setAttribute("error", msgError);
					forward("EIE0350_inv_position.jsp", req, res);
				} else {
					// Receive Data
					ses.setAttribute("list", objList);
					ses.setAttribute("userPO", userPO);
					forward("EIE0350_inv_position_detail_list.jsp", req, res);
				}
				
				
				

				
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			} finally {
				if(mp != null)mp.close();
			}
	}
	protected void procReqApprovalList(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			EIE005001Message msgInst = null;
			ELEERRMessage msgError  = new ELEERRMessage();
			UserPos userPO = null;
			EIE035001Message msgList = null;
			JBObjList objList = new JBObjList();

			boolean IsNotError = false;

			try {
				msgError = new datapro.eibs.beans.ELEERRMessage();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			// Send Initial data
			try {
				mp = getMessageProcessor("EIE0350", req);
				msgList = (EIE035001Message) mp.getMessageRecord("EIE035001");
				
				msgList.setH01USERID(user.getH01USR());
				msgList.setH01OPECOD("0010");
				msgList.setE01SELTYP(userPO.getOption());
				
				mp.sendMessage(msgList);
				// Receive Error Message
				objList = mp.receiveMessageRecordList("H01FLGMAS");
				if (mp.hasError(objList)) {
					msgError = (ELEERRMessage) newmessage;
					ses.setAttribute("error", msgError);
					forward("EIE0350_inv_position_approval_list.jsp", req, res);
				} else {
					// Receive Data
					ses.setAttribute("list", objList);
					ses.setAttribute("userPO", userPO);
					forward("EIE0350_inv_position_approval_list.jsp", req, res);
				}
				
				
				

				
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			} finally {
				if(mp != null)mp.close();
			}
	}
	protected void procUpdDetail(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			ELEERRMessage msgError  = new ELEERRMessage();
			UserPos userPO = null;
			EIE035001Message msgList = null;
			JBObjList objList = new JBObjList();

			boolean IsNotError = false;

			try {
				msgError = new datapro.eibs.beans.ELEERRMessage();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			// Send Initial data
			try {
				mp = getMessageProcessor("EIE0350", req);
				String[] selAcc = req.getParameterValues("selectedAcc");

				for (int x = 0; x < selAcc.length; x++) {
						msgList = (EIE035001Message) mp.getMessageRecord("EIE035001");
						msgList.setH01USERID(user.getH01USR());
						msgList .setH01OPECOD("0004");
						msgList.setE01DEAACC(selAcc[x]);
						try { // Search Investment Class
							msgList.setE01ACTION(req.getParameter("E01ACTION"));
							
						} catch (Exception e) {

						}
						try { // Search Investment Class
							msgList.setE01SELTYP(userPO.getOption());
							
						} catch (Exception e) {

						}
						try { // Search Investment Class
							msgList.setE01SELSTS(userPO.getAccOpt());
							
						} catch (Exception e) {

						}
						try { 
							msgList.setE01ISINUM(userPO.getIdentifier());
							
						} catch (Exception e) {

						}
						mp.sendMessage(msgList);
					}
				msgList.setH01USERID(user.getH01USR());
				msgList .setH01OPECOD("0004");
				msgList.setE01DEAACC("0");
				msgList.setH01FLGMAS("*");
				try { // Search Investment Class
					msgList.setE01SELTYP(userPO.getOption());
					
				} catch (Exception e) {

				}
				try { // Search Investment Class
					msgList.setE01SELSTS(userPO.getAccOpt());
					
				} catch (Exception e) {

				}
				try { // Search Instrument
					msgList.setE01ISINUM(userPO.getIdentifier());
					
				} catch (Exception e) {

				}
				mp.sendMessage(msgList);

				
				// Receive Error Message
				objList = mp.receiveMessageRecordList("H01FLGMAS");
				if (mp.hasError(objList)) {
					msgError = (ELEERRMessage) newmessage;
					ses.setAttribute("error", msgError);
					forward("EIE0350_inv_position_detail_list.jsp", req, res);
				} else {
					// Receive Data
					ses.setAttribute("list", objList);
					ses.setAttribute("userPO", userPO);
					forward("EIE0350_inv_position_detail_list.jsp", req, res);
				}
				try { // Action
					msgList.setE01ACTION(req.getParameter("E01ACTION"));
					
				} catch (Exception e) {

				}
				
				

				
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			} finally {
				if(mp != null)mp.close();
			}
	}
	protected void procApproval(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			ELEERRMessage msgError  = new ELEERRMessage();
			UserPos userPO = null;
			EIE035001Message msgList = null;
			JBObjList objList = new JBObjList();

			boolean IsNotError = false;
			String allDocs = "";
			try {
				msgError = new datapro.eibs.beans.ELEERRMessage();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			try {
				allDocs = req.getParameter("E01ACTION");
			} catch (Exception e) {
				
			}
			// Send Initial data
			try {
				mp = getMessageProcessor("EIE0350", req);
				String[] selAcc = req.getParameterValues("selectedAcc");

				for (int x = 0; x < selAcc.length; x++) {
						msgList = (EIE035001Message) mp.getMessageRecord("EIE035001");
						msgList.setH01USERID(user.getH01USR());
						msgList .setH01OPECOD("0011");
						msgList.setE01DEAACC(selAcc[x]);
						try { // Search Investment Class
							msgList.setE01ACTION(req.getParameter("E01ACTION"));
							
						} catch (Exception e) {

						}
						try { // Search Investment Class
							msgList.setE01SELTYP(userPO.getOption());
							
						} catch (Exception e) {

						}
						try { // Search Investment Class
							msgList.setE01SELSTS(userPO.getAccOpt());
							
						} catch (Exception e) {

						}
						try { 
							msgList.setE01ISINUM(userPO.getIdentifier());
							
						} catch (Exception e) {

						}
						mp.sendMessage(msgList);
					}
					msgList.setH01USERID(user.getH01USR());
					msgList .setH01OPECOD("0011");
					msgList.setE01DEAACC("0");
					msgList.setH01FLGMAS("*");
	
				try { // Search Investment Class
					msgList.setE01SELTYP(userPO.getOption());
					
				} catch (Exception e) {

				}
				try { // Search Investment Class
					msgList.setE01SELSTS(userPO.getAccOpt());
					
				} catch (Exception e) {

				}
				try { // Search Instrument
					msgList.setE01ISINUM(userPO.getIdentifier());
					
				} catch (Exception e) {

				}
				mp.sendMessage(msgList);

				
				// Receive Error Message
				objList = mp.receiveMessageRecordList("H01FLGMAS");
				if (mp.hasError(objList)) {
					msgError = (ELEERRMessage) newmessage;
					ses.setAttribute("error", msgError);
					forward("EIE0350_inv_position_approval_list.jsp", req, res);
				} else {
					// Receive Data
					ses.setAttribute("list", objList);
					ses.setAttribute("userPO", userPO);
					forward("EIE0350_inv_position_approval_list.jsp", req, res);
				}
				try { // Action
					msgList.setE01ACTION(req.getParameter("E01ACTION"));
					
				} catch (Exception e) {

				}
				
				

				
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			} finally {
				if(mp != null)mp.close();
			}
	}
}
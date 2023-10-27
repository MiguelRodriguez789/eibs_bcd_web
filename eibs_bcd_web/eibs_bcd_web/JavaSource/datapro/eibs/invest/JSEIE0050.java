package datapro.eibs.invest;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EIE005001Message;
import datapro.eibs.beans.EIE005002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEIE0050 extends JSEIBSServlet {

	// Action
	protected static final int A_MAINTENANCE 			= 2;

	protected static final int A_ENTER_NEW 				= 200;
	protected static final int A_ENTER_MAINT 			= 400;
	protected static final int A_ENTER_DELETE 			= 600;
	protected static final int A_ENTER_INQUIRY 			= 800;
	protected static final int A_ENTER_APPROVAL 		= 1000;
	protected static final int R_BLOOMBERG_INPUTS 		= 100;
	protected static final int R_BLOOMBERG_MAINTENANCE 	= 300;
	protected static final int A_BLOOMBERG_MAINTENANCE 	= 500;
	protected static final int R_BLOOMBERG_DELETE 		= 700;

	static final int R_ENTER_LIST = 34;

	/**
	 * procActionEnterNew
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EIE005001Message msgInst = null;
		ELEERRMessage msgError  = new ELEERRMessage();
		UserPos userPO = null;
		
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send Initial data
		try {
			mp = getMessageProcessor("EIE0050", req);
			
			msgInst = (EIE005001Message) mp.getMessageRecord("EIE005001");
			msgInst.setH01USERID(user.getH01USR());
			msgInst.setH01PROGRM("EIE0000");
			msgInst.setH01TIMSYS(getTimeStamp());
			msgInst.setH01SCRCOD("01");
			msgInst.setH01OPECOD("0001");
			msgInst.setE01ISIPTY(req.getParameter("TYPE")==null?"BND":req.getParameter("TYPE"));
			
			mp.sendMessage(msgInst);
			// Receive Error Message
			newmessage = mp.receiveMessageRecord();

			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				redirect("/servlet/datapro.eibs.invest.JSEWD0308P?SCREEN=100", res);
			} else {
				// Receive Data
				msgInst = (EIE005001Message) mp.receiveMessageRecord("EIE005001");
				userPO.setPurpose("N");

				ses.setAttribute("invInst", msgInst);
				ses.setAttribute("userPO", userPO);
				forward("EIE0050_inv_inst_basic.jsp", req,res);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			if(mp != null)mp.close();
		}
	}

	/**
	 * procActionEnterMaint
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionEnterMaint(
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EIE005001Message msgInst = null;
		ELEERRMessage msgError = new ELEERRMessage();
		UserPos userPO = null;
		
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EIE0050", req);
			
			msgInst = (EIE005001Message) mp.getMessageRecord("EIE005001");
			msgInst.setH01USERID(user.getH01USR());
			msgInst.setH01PROGRM("EIE0000");
			msgInst.setH01TIMSYS(getTimeStamp());
			msgInst.setH01SCRCOD("01");
			msgInst.setH01OPECOD("0002");

			msgInst.setE01ISIIIC(req.getParameter("CODE")==null?userPO.getIdentifier():req.getParameter("CODE"));
			
			mp.sendMessage(msgInst);
		
			// Receive Error Message
			newmessage = mp.receiveMessageRecord();

			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				redirect("/servlet/datapro.eibs.invest.JSEWD0308P?SCREEN=100", res);
			} else {
				// Receive Data
				msgInst = (EIE005001Message) mp.receiveMessageRecord("EIE005001");
	
				userPO.setPurpose("M");
				userPO.setIdentifier(msgInst.getE01ISIIIC());
					
				ses.setAttribute("invInst", msgInst);
				ses.setAttribute("userPO", userPO);
				forward("EIE0050_inv_inst_basic.jsp", req, res);
			} 
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			if(mp != null)mp.close();
		}
	}

	/**
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionEnterInquiry(
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EIE005001Message msgInst = null;
		ELEERRMessage msgError = new ELEERRMessage();
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EIE0050", req);
			
			msgInst = (EIE005001Message) mp.getMessageRecord("EIE005001");
			msgInst.setH01USERID(user.getH01USR());
			msgInst.setH01PROGRM("EIE0000");
			msgInst.setH01TIMSYS(getTimeStamp());
			msgInst.setH01SCRCOD("01");
			msgInst.setH01OPECOD("0003");
			msgInst.setE01ISIIIC(req.getParameter("CODE")==null?userPO.getIdentifier():req.getParameter("CODE"));
			mp.sendMessage(msgInst);
			
			// Receive Error Message
			newmessage = mp.receiveMessageRecord();

			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				redirect("/servlet/datapro.eibs.invest.JSEWD0308P?SCREEN=100", res);
			} else {
				// Receive Data
				msgInst = (EIE005001Message) mp.receiveMessageRecord("EIE005001");

				userPO.setPurpose("I");
				userPO.setIdentifier(msgInst.getE01ISIIIC());
				ses.setAttribute("invInst", msgInst);
				ses.setAttribute("userPO", userPO);
				forward("EIE0050_inv_inst_basic.jsp",req, res);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			if(mp != null)mp.close();
		}
	}

	/**
	 * procActionEnterApproval
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionEnterApproval(
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EIE005001Message msgInst = null;
		ELEERRMessage msgError = new ELEERRMessage();
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EIE0050", req);
			
			msgInst = (EIE005001Message) mp.getMessageRecord("EIE005001");
			
			msgInst.setH01USERID(user.getH01USR());
			msgInst.setH01PROGRM("EIE0000");
			msgInst.setH01TIMSYS(getTimeStamp());
			msgInst.setH01SCRCOD("01");
			msgInst.setH01OPECOD("0003");
			msgInst.setE01ISIIIC(req.getParameter("CODE")==null?userPO.getIdentifier():req.getParameter("CODE"));
			mp.sendMessage(msgInst);

			// Receive Error Message
			newmessage = mp.receiveMessageRecord();

			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				redirect("/servlet/datapro.eibs.invest.JSEIE0051?SCREEN=1", res);
			} else {
				// Receive Data
				msgInst = (EIE005001Message) mp.receiveMessageRecord("EIE005001");
				userPO.setPurpose("I");
				userPO.setIdentifier(msgInst.getE01ISIIIC());
					
				ses.setAttribute("invInst", msgInst);
				ses.setAttribute("userPO", userPO);
				forward("EIE0050_inv_inst_basic.jsp", req, res);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			if(mp != null)mp.close();
		}
	}

	/**
	 * procActionEnterDelete
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionEnterDelete(
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException,
			IOException {
		
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EIE005001Message msgInst = null;
		ELEERRMessage msgError = new ELEERRMessage();
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EIE0050", req);
			msgInst = (EIE005001Message) mp.getMessageRecord("EIE005001");
			msgInst.setH01USERID(user.getH01USR());
			msgInst.setH01PROGRM("EIE0000");
			msgInst.setH01TIMSYS(getTimeStamp());
			msgInst.setH01SCRCOD("01");
			msgInst.setH01OPECOD("0004");

			msgInst.setE01ISIIIC(req.getParameter("CODE")==null?"0":req.getParameter("CODE"));
			mp.sendMessage(msgInst);
			
			// Receive Error Message
			newmessage = mp.receiveMessageRecord();

			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				redirect("/servlet/datapro.eibs.invest.JSEWD0308P?SCREEN=100", res);
			} else {
				// Receive Data
				msgInst = (EIE005001Message) mp.receiveMessageRecord("EIE005001");
				userPO.setPurpose("D");
				userPO.setIdentifier(msgInst.getE01ISIIIC());

				ses.setAttribute("invInst", msgInst);
				ses.setAttribute("userPO", userPO);
				forward("EIE0050_inv_inst_del_confirm.jsp",	req, res);											
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			if(mp != null)mp.close();
		}
	}

	/**
	 * procActionMaintenance
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EIE005001Message msgInst = null;
		ELEERRMessage msgError = new ELEERRMessage();
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EIE0050", req);
			msgInst = (EIE005001Message) ses.getAttribute("invInst");
			msgInst.setH01USERID(user.getH01USR());
			msgInst.setH01PROGRM("EIE000001");
			msgInst.setH01TIMSYS(getTimeStamp());
			msgInst.setH01SCRCOD("01");
			msgInst.setH01OPECOD("0005");
			setMessageRecord(req, msgInst);
			
			mp.sendMessage(msgInst);
			
			// Receive Error Message
			newmessage = mp.receiveMessageRecord();
			
			// Receive Data
			msgInst = (EIE005001Message)mp.receiveMessageRecord("EIE005001");
			ses.setAttribute("invInst", msgInst);
			
			userPO.setIdentifier(msgInst.getE01ISIIIC());
		
			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				forward("EIE0050_inv_inst_basic.jsp", req, res);
			} else {	
				ses.setAttribute("userPO", userPO);
				forward("EIE0050_inv_inst_basic_confirm.jsp",req, res);
			}

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			if(mp != null)mp.close();
		}
	}

	/**
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	private synchronized void procReqEnterSearch(
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException,
			IOException {
		forward("EIE0050_inv_enter_inst.jsp", req, res);
	}
	
	/**
	 * procActionEnterNew
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqBlommbergList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EIE005002Message msgInst = null;
		ELEERRMessage msgError  = new ELEERRMessage();
		UserPos userPO = null;
		JBObjList objList = new JBObjList();
		
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send Initial data
		try {
			mp = getMessageProcessor("EIE0050", req);
			
			msgInst = (EIE005002Message) mp.getMessageRecord("EIE005002");
			msgInst.setH02USERID(user.getH01USR());
			msgInst.setH02PROGRM("EIE0000");
			msgInst.setH02TIMSYS(getTimeStamp());
			msgInst.setH02SCRCOD("01");
			msgInst.setH02OPECOD("0015");
			
			mp.sendMessage(msgInst);
			// Receive Error Message
			objList = mp.receiveMessageRecordList("H02FLGMAS");

			if (mp.hasError(objList)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				redirect("/servlet/datapro.eibs.invest.JSEWD0308P?SCREEN=100", res);
			} else {
				// Receive Data
				ses.setAttribute("bloombergList", objList);
				ses.setAttribute("userPO", userPO);
				forward("EIE0050_inv_bloomberg_list.jsp", req,res);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			if(mp != null)mp.close();
		}
	}
	
	/**
	 * procActionBloombergMaintenance
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqBloombergMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		EIE005002Message msgInst = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		JBObjList objList = (JBObjList)ses.getAttribute("bloombergList");

		// Send Initial data
		try {
			mp = getMessageProcessor("EIE0050", req);
			int row = req.getParameter("selectedRow")== null?0:Integer.parseInt(req.getParameter("selectedRow"));
			
			msgInst = (EIE005002Message)objList.get(row);
			
			ses.setAttribute("invInst", msgInst);
			ses.setAttribute("userPO", userPO);
			forward("EIE0050_inv_bloomberg_maintenance.jsp",req, res);
			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			if(mp != null)mp.close();
		}
	}
	
	/**
	 * procActionBloombergMaintenance
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionBloombergMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EIE005002Message msgInst = null;
		ELEERRMessage msgError = new ELEERRMessage();
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EIE0050", req);
			msgInst = (EIE005002Message) ses.getAttribute("invInst");
			setMessageRecord(req, msgInst);
			msgInst.setH02USERID(user.getH01USR());
			msgInst.setH02PROGRM("EIE000002");
			msgInst.setH02TIMSYS(getTimeStamp());
			msgInst.setH02SCRCOD("01");
			msgInst.setH02OPECOD("0006");
			
			
			mp.sendMessage(msgInst);
			
			// Receive Error Message
			newmessage = mp.receiveMessageRecord();
			
			// Receive Data
			msgInst = (EIE005002Message)mp.receiveMessageRecord("EIE005002");
			userPO.setIdentifier(msgInst.getE02ISIIIC());
		
			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				ses.setAttribute("invInst", msgInst);
				ses.setAttribute("userPO", userPO);
				forward("EIE0050_inv_bloomberg_maintenance.jsp", req, res);
			} else {	
				procReqBlommbergList(user, req, res, ses);
			}

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			if(mp != null)mp.close();
		}
	}
	
	/**
	 * procActionBloombergMaintenance
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionBloombergDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EIE005002Message msgInst = null;
		ELEERRMessage msgError = new ELEERRMessage();
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		JBObjList objList = (JBObjList)ses.getAttribute("bloombergList");

		// Send Initial data
		try {
			mp = getMessageProcessor("EIE0050", req);
			int row = req.getParameter("selectedRow")== null?0:Integer.parseInt(req.getParameter("selectedRow"));
			
			msgInst = (EIE005002Message)objList.get(row);
			msgInst.setH02USERID(user.getH01USR());
			msgInst.setH02PROGRM("EIE000002");
			msgInst.setH02TIMSYS(getTimeStamp());
			msgInst.setH02SCRCOD("01");
			msgInst.setH02OPECOD("0004");
			
			
			
			mp.sendMessage(msgInst);
			
			// Receive Error Message
			newmessage = mp.receiveMessageRecord();
			
			// Receive Data
			msgInst = (EIE005002Message)mp.receiveMessageRecord("EIE005002");
			userPO.setIdentifier(msgInst.getE02ISIIIC());
		
			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				ses.setAttribute("invInst", msgInst);
				ses.setAttribute("userPO", userPO);
				forward("EIE0050_inv_bloomberg_list.jsp", req, res);
			} else {	
				procReqBlommbergList(user, req, res, ses);
			}

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			if(mp != null)mp.close();
		}
	}

	/**
	 * MAIN PROCESS
	 */
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			// Action
			case A_MAINTENANCE:
				procActionMaintenance(user, req, res, session);
				break;
			case A_ENTER_NEW:
				procActionEnterNew(user, req, res, session);
				break;
			case A_ENTER_MAINT:
				procActionEnterMaint(user, req, res, session);
				break;
			case A_ENTER_DELETE:
				procActionEnterDelete(user, req, res, session);
				break;
			case A_ENTER_INQUIRY:
				procActionEnterInquiry(user, req, res, session);
				break;
			case A_ENTER_APPROVAL:
				procActionEnterApproval(user, req, res, session);
				break;
			case R_ENTER_LIST:
				procReqEnterSearch(user, req, res, session);
				break;
			case R_BLOOMBERG_INPUTS:
				procReqBlommbergList(user, req, res, session);
				break;
			case R_BLOOMBERG_MAINTENANCE:
				procReqBloombergMaintenance(user, req, res, session);
				break;
			case A_BLOOMBERG_MAINTENANCE:
				procActionBloombergMaintenance(user, req, res, session);
				break;
			case R_BLOOMBERG_DELETE:
				procActionBloombergDelete(user, req, res, session);
				break;
			default:
				redirect(super.devPage, res);
				break;
		}

	}
}

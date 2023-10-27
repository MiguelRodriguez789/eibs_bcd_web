package datapro.eibs.taxes;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

import datapro.eibs.beans.EDD009801Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD003002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelResultSet;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.services.ExcelXLSXResultSet;
import datapro.eibs.sockets.DecimalField;
import datapro.eibs.sockets.MessageRecord;

public class JSEDD0098 extends JSEIBSServlet {

	private ServletConfig config = null;
	
	protected static final int R_ENTER_MAINT = 1;
	protected static final int R_MAINT_LOAN  = 2;
	protected static final int A_NEW_DETAILS = 3;
	protected static final int A_ACMTX_ACTION_S = 5;   
	protected static final int A_ACMTX_APPROVAL = 9;
	protected static final int A_ACMTX_DELETE = 10;	
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		switch (screen) {
			case R_ENTER_MAINT:
				procReqEnterMaint(user, req, res, session);
				break;
			case R_MAINT_LOAN:
				procReqMaintLoan(user, req, res, session);
				break;
			case A_NEW_DETAILS:
				procActionProductDetails(user, req, res, session);
				break;
			case A_ACMTX_ACTION_S :
	        	procAcmActSearcS(user, req, res, session, screen);
				break;
	        case A_ACMTX_APPROVAL :
	        	procActApproval(user, req, res, session, screen);
				break;
	        case A_ACMTX_DELETE :
	        	procActDelete(user, req, res, session, screen);
				break;	
			default:
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqEnterMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("ST");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.taxes.JSEDD0098?SCREEN=2");
		userPO.setProdCode("04");
		//Others Parameters
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());					
		
		
		forward("GENERIC_account_enter.jsp", req, res);
		
	}
	
	private void procReqMaintLoan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		String accNum = "";
		
		try {
			mp = getMessageProcessor("EDD0098", req);
			
			userPO.setPurpose("MAINTENANCE");
			userPO.setOption("ST");
			
			EDD009801Message msgLoan = (EDD009801Message) mp.getMessageRecord("EDD009801");
			msgLoan.setH01USERID(user.getH01USR());
			msgLoan.setH01PROGRM("EDD0098");
			msgLoan.setH01TIMSYS(getTimeStamp());
			msgLoan.setH01SCRCOD("01");
			msgLoan.setH01OPECOD("0001");
	
			accNum = req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC").trim();
			if (!accNum.equals("0")) {
				userPO.setAccNum(accNum.trim());
			}
			msgLoan.setE01ACMACC(userPO.getAccNum());
				
			mp.sendMessage(msgLoan);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgLoan = (EDD009801Message) mp.receiveMessageRecord();
	
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				procReqEnterMaint(user, req, res, session);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("svBasic", msgLoan);
				forward("EDD0098_cv_basic.jsp", req, res);
			}
						
		} finally {
			if(mp !=null)
				mp.close();
		}
	}
	
	private void procActionProductDetails(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("EDD0098", req);
			EDD009801Message msg = (EDD009801Message) mp.getMessageRecord("EDD009801");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDD0098");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
						
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDD009801Message) mp.receiveMessageRecord("EDD009801");
	
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("svBasic",	msg);
				forward("EDD0098_cv_basic.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("svBasic",	msg);
				procReqEnterMaint(user, req, res, session);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
	
	}

	private static String getFecha(String date, String type){
        // date = AAAAMMDD
		String result = "";
        if (date != null) {
        	if (type == "Y") {
        		result = date.substring(0,4);
        	}
        	if (type == "M") {
        		result = date.substring(4,6);
        	}
        	if (type == "D") {
        		result = date.substring(6,8);
        	}
        }
        return result;
    }

	protected void procAcmActSearcS(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses , int screen)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
		    MessageRecord newmessage = null;
			
			try {

				mp = new MessageProcessor("EDD0098");
				EDD009801Message msgRT = (EDD009801Message) mp.getMessageRecord("EDD009801");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("EDD0098");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("01");
				msgRT.setH01OPECOD("0005");
				try {
					msgRT.setE02NUMREC(req.getParameter("FromRecord"));
				} catch (Exception e) {
					msgRT.setE02NUMREC("0"); 
				}


				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E02CNOOPE","E02NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("EDD009801List", list);
				}
				forward("EDD0098_cv_list.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}
	protected void procActApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String TblCod = "";
			String TblOpe = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDD0098");
				EDD009801Message msgRT = (EDD009801Message) mp.getMessageRecord("EDD009801");

				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("EDD0098");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("09");
				msgRT.setH01OPECOD("0009");
				userPO.setPurpose("APPROVAL");
				TblCod = req.getParameter("E01ACMACC") == null ? " " : req.getParameter("E01ACMACC").trim();
				if (!TblCod.equals(" ")) {
					userPO.setHeader23(TblCod.trim());
				}
				TblOpe = req.getParameter("E01ACMCON") == null ? " " : req.getParameter("E01ACMCON").trim();
				if (!TblOpe.equals(" ")) {
					userPO.setHeader21(TblOpe.trim());
				}

				msgRT.setE01ACMACC(userPO.getHeader23());
				msgRT.setE01ACMCON(userPO.getHeader21());
				

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("EDD0098_cv_list.jsp", req, res);
					} else {

						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.taxes.JSEDD0098?SCREEN=5");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}	
	
	protected void procActDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String TblCod = "";
			String TblOpe = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDD0098");
				EDD009801Message msgRT = (EDD009801Message) mp.getMessageRecord("EDD009801");

				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("EDD0098");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("10");
				msgRT.setH01OPECOD("0010");
				userPO.setPurpose("APPROVAL");
				TblCod = req.getParameter("E01ACMACC") == null ? " " : req.getParameter("E01ACMACC").trim();
				if (!TblCod.equals(" ")) {
					userPO.setHeader23(TblCod.trim());
				}
				TblOpe = req.getParameter("E01ACMCON") == null ? " " : req.getParameter("E01ACMCON").trim();
				if (!TblOpe.equals(" ")) {
					userPO.setHeader21(TblOpe.trim());
				}

				msgRT.setE01ACMACC(userPO.getHeader23());
				msgRT.setE01ACMCON(userPO.getHeader21());
				

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("EDD0098_cv_list.jsp", req, res);
					} else {

						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.taxes.JSEDD0098?SCREEN=5");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
}


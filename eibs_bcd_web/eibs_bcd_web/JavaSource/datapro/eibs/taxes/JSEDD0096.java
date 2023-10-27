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

import datapro.eibs.beans.EDD009601Message;
import datapro.eibs.beans.ELEERRMessage;
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

public class JSEDD0096 extends JSEIBSServlet {

	private ServletConfig config = null;
	
	protected static final int R_ENTER_MAINT = 1;
	protected static final int R_MAINT_LOAN  = 2;
	protected static final int A_NEW_DETAILS = 3;
	
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
		userPO.setRedirect("/servlet/datapro.eibs.taxes.JSEDD0096?SCREEN=2");
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
			mp = getMessageProcessor("EDD0096", req);
			
			userPO.setPurpose("MAINTENANCE");
			userPO.setOption("ST");
			
			EDD009601Message msgLoan = (EDD009601Message) mp.getMessageRecord("EDD009601");
			msgLoan.setH01USERID(user.getH01USR());
			msgLoan.setH01PROGRM("EDD0096");
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
			msgLoan = (EDD009601Message) mp.receiveMessageRecord();
	
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				procReqEnterMaint(user, req, res, session);
			} else {
				session.setAttribute("userPO", userPO);    
				session.setAttribute("svBasic", msgLoan);
				forward("EDD0096_cv_basic.jsp", req, res);
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
			mp = getMessageProcessor("EDD0096", req);
			EDD009601Message msg = (EDD009601Message) mp.getMessageRecord("EDD009601");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDD0096");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
						
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDD009601Message) mp.receiveMessageRecord("EDD009601");
	
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("svBasic",	msg);
				forward("EDD0096_cv_basic.jsp", req, res);
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
	
}

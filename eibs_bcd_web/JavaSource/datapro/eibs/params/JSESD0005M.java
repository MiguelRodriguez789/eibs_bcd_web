package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000501Message;
import datapro.eibs.beans.ESD000502Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESD0005M extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4947903520883900649L;
	
	protected static final int R_ENTER_BANK         = 100;
	protected static final int A_ENTER_BANK         = 200;
	protected static final int R_ENTER_MAINT 		= 400;
	protected static final int R_ENTER_MAINT_FIRST 	= 450;
	protected static final int A_ENTER_MAINT_SECOND	= 500;
	protected static final int A_ENTER_NEW_BANK 	= 300;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_ENTER_BANK:
			    procReqEnterBank(user, req, res, session);	
				break;
	    	case R_ENTER_MAINT :
				procReqEnterMaint(user, req, res, session);
				break;
			case R_ENTER_MAINT_FIRST :
			    procReqBankMaint(user, req, res, session);
				break;						
			case A_ENTER_BANK:
				procActionEnterBank(user, req, res, session);							
				break;	
		    case A_ENTER_NEW_BANK  :
				procActionBankNew(user, req, res, session);
				break;
			case A_ENTER_MAINT_SECOND  :
			    procActionBankMaint(user, req, res, session);
				break;						
			default:
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionBankMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0005", req);
			ESD000502Message msgBankOld = (ESD000502Message) session.getAttribute("bankOld");
			msgBankOld.setH02USR(user.getH01USR());
			msgBankOld.setH02PGM("ESD000501");
			msgBankOld.setH02TIM(getTimeStamp());
			msgBankOld.setH02SCR("01");
			msgBankOld.setH02OPE("0001");
			
			setMessageRecord(req, msgBankOld);
			
			mp.sendMessage(msgBankOld);
            ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
            msgBankOld = (ESD000502Message) mp.receiveMessageRecord("ESD000502");
		
            if (mp.hasError(msgError)) {
            	pageName = "ESD0005_bank_setup_basic_maint_add.jsp";
            } else {
            	pageName = "ESD0005_bank_setup_basic_enter.jsp";
            }
            session.setAttribute("error", msgError);
			session.setAttribute("bankOld", msgBankOld);
            
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionBankNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0005", req);
			ESD000501Message msgBankNew = (ESD000501Message) session.getAttribute("bankNew");      
			msgBankNew.setH01USR(user.getH01USR());
			msgBankNew.setH01PGM("ESD000501");
			msgBankNew.setH01TIM(getTimeStamp());
			msgBankNew.setH01SCR("01");
			msgBankNew.setH01OPE("0001");
			
			setMessageRecord(req, msgBankNew);
			
			mp.sendMessage(msgBankNew);
            ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
            msgBankNew = (ESD000501Message) mp.receiveMessageRecord("ESD000501");
		
            if (mp.hasError(msgError)) {
            	pageName = "ESD0005_bank_setup_basic_new.jsp";
            } else {
            	pageName = "ESD0005_bank_setup_basic_enter.jsp";
            }
            session.setAttribute("error", msgError);
			session.setAttribute("bankNew", msgBankNew);
            
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionEnterBank(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String bnk = req.getParameter("CODBANK") == null ? "" : req.getParameter("CODBANK"); 			 
		String opt_bank = req.getParameter("TYPBANK") == null ? "" : req.getParameter("TYPBANK");
		
		userPO.setBank(bnk); 
		session.setAttribute("userPO", userPO);
		
		if ("N".equals(opt_bank)) {
			procReqBankNew(user, req, res, session);
		} else if ("E".equals(opt_bank)) {
			procReqEnterMaint(user, req, res, session);
		}
	}

	private void procReqBankNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("NEW"); 
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0005", req);
			ESD000501Message msgBankNew = (ESD000501Message) mp.getMessageRecord("ESD000501");	
			msgBankNew.setH01USR(user.getH01USR());
			msgBankNew.setH01PGM("ESD0005");
			msgBankNew.setH01TIM(getTimeStamp());
			msgBankNew.setH01SCR("01");
			msgBankNew.setH01OPE("0010");
			msgBankNew.setE01CNTBNK(userPO.getBank() == null ? "01" : userPO.getBank());
			
			mp.sendMessage(msgBankNew);
            ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
            msgBankNew = (ESD000501Message) mp.receiveMessageRecord("ESD000501");
		
            if (mp.hasError(msgError)) {
            	pageName = "ESD0005_bank_setup_basic_enter.jsp";
            } else {
            	pageName = "ESD0005_bank_setup_basic_new.jsp";
            }
            session.setAttribute("error", msgError);
			session.setAttribute("bankNew", msgBankNew);
            
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqBankMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		ESD000502Message msgBankOld = (ESD000502Message) session.getAttribute("bankOld");
		
		setMessageRecord(req, msgBankOld);
			
		session.setAttribute("bankOld", msgBankOld);
        forward("ESD0005_bank_setup_basic_maint_add.jsp", req, res);
	}

	private void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0005", req);
			ESD000502Message msgBankOld = (ESD000502Message) mp.getMessageRecord("ESD000502");
			msgBankOld.setH02USR(user.getH01USR());
			msgBankOld.setH02PGM("ESD000502");
			msgBankOld.setH02TIM(getTimeStamp());
			msgBankOld.setH02SCR("01");
			msgBankOld.setH02OPE("0002");
			msgBankOld.setE02CNTBNK(userPO.getBank() == null ? "01" : userPO.getBank()); 
			
			mp.sendMessage(msgBankOld);
            ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
            msgBankOld = (ESD000502Message) mp.receiveMessageRecord("ESD000502");
		
            if (mp.hasError(msgError)) {
            	pageName = "ESD0005_bank_setup_basic_enter.jsp";
            } else {
            	pageName = "ESD0005_bank_setup_basic_maint.jsp";
            }
            session.setAttribute("error", msgError);
			session.setAttribute("bankOld", msgBankOld);
            
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEnterBank(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ESD0005_bank_setup_basic_enter.jsp", req, res);
	}

}

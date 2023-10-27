package datapro.eibs.security;

/**
 * @author: fhernandez
 */
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.facade.FATeller;
import com.datapro.eibs.teller.key.ATSHIFTSKEY;
import com.datapro.eibs.teller.vo.ATTELLUSERSExtBasic;
import com.datapro.eibs.teller.vo.ATTRNTYPEBYTELLUSERS;
import com.datapro.generic.beanutil.BeanList;
import com.datapro.generic.beanutil.DynamicForm;
import com.datapro.security.UserRegistryPasswordEntry;

import datapro.eibs.beans.EDD031001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author fhernandez
 *
 */
public class JSUsersTeller extends JSEIBSServlet {
	
	private static final long serialVersionUID = 4552196464478848535L;
	
	private static final int R_ENTER_USER_TELLER 			= 1;
	private static final int A_ENTER_USER_TELLER 			= 2;
	private static final int R_USER_PROFILE					= 3;
	
	private static final int R_USER_TELLER_SEARCH			= 5;
	private static final int A_USER_TELLER_SEARCH			= 6;
	
	private static final int A_USER_TELLER	 				= 10;
	private static final int A_USER_TELLER_PLATFORM			= 11;
	
	private static final int A_TELLER_PARAMETERS			= 100;
	private static final int A_TELLER_SHIFTS				= 101;

	
	protected void processRequest(ESS0030DSMessage user,
		HttpServletRequest req, HttpServletResponse res,
		HttpSession session, int screen) throws ServletException,
		IOException {

		switch (screen) {
			case R_ENTER_USER_TELLER:
				procReqEnterUserTeller(user, req, res, session);
				break;
			case A_ENTER_USER_TELLER:
				procActionEnterUserTeller(user, req, res, session);
				break;
			case R_USER_PROFILE:
				procReqUserProfile(user, req, res, session);
				break;
			case R_USER_TELLER_SEARCH:
				procReqSearchUserTeller(user, req, res, session);
				break;
			case A_USER_TELLER_SEARCH:
				procActionSearchUserTeller(user, req, res, session);
				break;
			case A_USER_TELLER:
				procActionUserTeller(user, req, res, session);
				break;
			case A_USER_TELLER_PLATFORM:
				procActionUserPlatform(user, req, res, session);
				break;
			case A_TELLER_PARAMETERS:
				procActionSearchTellerParameters(user, req, res, session);
				break;
			case A_TELLER_SHIFTS:
				procActionSearchTellerShifts(user, req, res, session);
				break;
			default:
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}
	
	private void procReqEnterUserTeller(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = new UserPos();
		session.setAttribute("userPO", userPO);
		forward("Users_teller_enter.jsp", req, res);
	}
	
	private void procReqUserProfile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		redirect("/servlet/datapro.eibs.security.JSUsersManagement?SCREEN=2", res);
	}
	
	private void procActionEnterUserTeller(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		if (req.getParameter("purpose") != null) 
			userPO.setPurpose(req.getParameter("purpose"));
		
		UserRegistryPasswordEntry userEntry = (UserRegistryPasswordEntry)
			session.getAttribute("userRegistry");
		String tellerID = null;
		ATTELLUSERSExtBasic tellerEntry = null;
		EDD031001Message message = null;
		List trans = null;
		
		FATeller userTellerFacade = new FATeller();
		MessageProcessor mp = null;
		try {			
			mp = new MessageProcessor("EDD0310");
			message = (EDD031001Message) mp
					.getMessageHandler().getMessageRecord("EDD031001");
			message.setH01USERID(user.getH01USR());
			message.setH01PROGRM("EDD0310");
			message.setH01TIMSYS(getTimeStamp());
			message.setH01SCRCOD("01");
			message.setH01OPECOD("0002");

			if (req.getParameter("TELLUSERID") != null) {
				tellerID = req.getParameter("TELLUSERID");
			} else if (userEntry != null) {
				tellerID = userEntry.getName();
			}
			tellerID = Util.addRightChar(' ', 10, tellerID);
			tellerID = tellerID.substring(
				(tellerID.length() - 7 < 0 ? 0 : tellerID.length() - 7), tellerID.length()).trim();
			message.setE01TLMTID(tellerID.toUpperCase());
			//message.setE01EUPNME(userEntry.getDisplayName());
			//message.setE01EUPEML(userEntry.getMail());

			mp.sendMessage(message);
			  
			MessageRecord newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				session.setAttribute("error", newmessage);
			} else {
				session.removeAttribute("error");
			}
			newmessage = (EDD031001Message) mp.receiveMessageRecord("EDD031001");
			message = (EDD031001Message) newmessage;
			session.setAttribute("tellerDetails", message);		
			
			tellerEntry = userTellerFacade.getTeller(tellerID);
			
			List list = (List) userTellerFacade.getParameters("0001").getList();
			session.setAttribute("tellerTransactions", list);
			
			BeanList byuser = (BeanList) userTellerFacade.getTransactionsByUser(tellerID);
			session.setAttribute("transactionsByUser", byuser);
			
			userPO.setPurpose("MAINTENANCE");
			
		} catch (ItemNotFoundException e) {
			userPO.setPurpose("NEW");
			tellerEntry = new ATTELLUSERSExtBasic();
		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			if(mp != null) mp.close();
		}
		
		try {
			trans = (List) userTellerFacade.getParameters("0001").getList();
			session.setAttribute("tellerTransactions", trans);
			BeanList byuser = (BeanList) userTellerFacade.getTransactionsByUser(tellerEntry.getTELLUSERID());
			session.setAttribute("transactionsByUser", byuser);
		} catch (FacadeException e) {
			throw new ServletException(e);
		}
		
		tellerEntry.setTELLUSERID(tellerID);
		if (userEntry != null) {
			tellerEntry.setUSERNAME(userEntry.getDisplayName());
		}
		tellerEntry.setCODEBANK(message.getE01TLMBNK());
		tellerEntry.setCODEBRANCH(message.getE01TLMBRN());
		//tellerEntry.setUSEREMAIL(message.getE01EUPEML());
		
		session.setAttribute("teller", tellerEntry);
		forward("Users_teller_basic.jsp", req, res);
	}
	
	protected void procActionUserPlatform(ESS0030DSMessage user, 
		HttpServletRequest req, HttpServletResponse res, HttpSession session)	
		throws ServletException, IOException {
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EDD0310");
			EDD031001Message message = (EDD031001Message) mp
				.getMessageHandler().getMessageRecord("EDD031001");
			message.setH01USERID(user.getH01USR());
			message.setH01PROGRM("EDD0310");
			message.setH01TIMSYS(getTimeStamp());
			message.setH01SCRCOD("01");
			message.setH01OPECOD("0005");
			
			setMessageRecord(req, message);
			
			// Send Initial data			
			mp.sendMessage(message);

			// Receive Error Message
			MessageRecord newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				session.setAttribute("error", newmessage);
			} else {
				session.removeAttribute("error");
			}
			// Receive Data
			newmessage = mp.receiveMessageRecord("EDD031001");
			message = (EDD031001Message) newmessage;
			session.setAttribute("tellerDetails", message);
			
			ATTELLUSERSExtBasic tellerEntry = (ATTELLUSERSExtBasic) 
				session.getAttribute("teller");
			tellerEntry.setCODEBANK(message.getE01TLMBNK());
			tellerEntry.setCODEBRANCH(message.getE01TLMBRN());
			
			forward("Users_teller_basic.jsp", req, res);
			
		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			if(mp != null) mp.close();
		}
	}
	
	private void procReqSearchUserTeller(
		ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		session.removeAttribute("tellerList");
		forward("Users_teller_search.jsp", req, res);
	}
	
	private void procActionSearchUserTeller(
		ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		try {
			FATeller userTellerFacade = new FATeller();
			List list = (List) userTellerFacade.searchTellers(
					req.getParameter("pattern")).getList();
			
			session.setAttribute("tellerList", list);			
			forward("Users_teller_search.jsp", req, res);
			
		} catch (Exception e) {
			throw new ServletException(e);
		}	
	}
	
	private ELEERRMessage validateTeller(ATTELLUSERSExtBasic tellerEntry) throws SQLException {
		ELEERRMessage error = new ELEERRMessage();
		if (tellerEntry.getUSERNAME() == null || tellerEntry.getUSERNAME().equals("")) {
			addError(error, "USERNAME", "T001", "Nombre de Cajero es requerido");
		}
		if (tellerEntry.getCODEBANK() == null || tellerEntry.getCODEBANK().equals("")) {
			addError(error, "CODEBANK", "T003", "Banco es requerido");
		}
		if (tellerEntry.getUSERNIVEL() == null 
			|| tellerEntry.getUSERNIVEL().intValue() == 0) {
			addError(error, "USERNIVEL", "T004", "Nivel es requerido");
		}
		if (tellerEntry.getCODESHIFT() == null 
			|| tellerEntry.getCODESHIFT().trim().equals("")) {
			addError(error, "CODESHIFT", "T005", "Jornada es requerido");
		}
		if (tellerEntry.getUSERMOD() == null 
			|| tellerEntry.getUSERMOD().intValue() == 0) {
			addError(error, "USERMOD", "T006", "Estado es requerido");
		}
		return error;
	}
	
	private void procActionUserTeller(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		try {
			UserPos userPO = (UserPos) session.getAttribute("userPO");
			UserRegistryPasswordEntry userEntry = (UserRegistryPasswordEntry)
				session.getAttribute("userRegistry");
			
			ATTELLUSERSExtBasic tellerEntry = new ATTELLUSERSExtBasic();
			DynamicForm form = new DynamicForm();
			form.setBeanFromPage(req, tellerEntry);
			if (userEntry != null) {
				tellerEntry.setUSEREMAIL(userEntry.getMail());
				tellerEntry.setUSERIPADDR(userEntry.getIpHostNumber());
			}
			session.setAttribute("teller", tellerEntry);
			
			ELEERRMessage error = validateTeller(tellerEntry);
			if (error.getBigDecimalERRNUM().intValue() > 0) {
				session.setAttribute("error", error);
			} else {
				FATeller userTellerFacade = new FATeller();
				if ("MAINTENANCE".equals(userPO.getPurpose())) {
					userTellerFacade.updateTeller(tellerEntry);
				} else {
					try {
						userTellerFacade.getTeller(tellerEntry.getTELLUSERID());
						userTellerFacade.updateTeller(tellerEntry);
					} catch (ItemNotFoundException e) {
						userTellerFacade.newTeller(tellerEntry);
					}	
				}
				session.setAttribute("teller", tellerEntry);
				
				//Update Teller Transactions List
				BeanList transactions = new BeanList();
				Map parameters = req.getParameterMap();
				Iterator iter = parameters.keySet().iterator();
				while (iter.hasNext()) {
					String name = (String) iter.next();
					if (name.startsWith("code_")) {
						if (req.getParameter(name) != null) {
							ATTRNTYPEBYTELLUSERS vo = new ATTRNTYPEBYTELLUSERS();
							vo.setTELLUSERID(tellerEntry.getTELLUSERID());
							int start = name.indexOf("_") + 1;
							String code = name.substring(start);
							vo.setTRNTYPECODE(code);
							transactions.addRow(vo);
						}
					}
				}
				if (transactions.isEmpty()) {
					userTellerFacade.deleteTransactionsByUser(tellerEntry.getTELLUSERID());
				} else {
					userTellerFacade.updateTransactionsByUser(tellerEntry.getTELLUSERID(), transactions);
				}
				
				BeanList byuser = (BeanList) userTellerFacade.getTransactionsByUser(tellerEntry.getTELLUSERID());
				session.setAttribute("transactionsByUser", byuser);
			}
			
			forward("Users_teller_basic.jsp", req, res);
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
		
	private void procActionSearchTellerParameters(
		ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		try {
			FATeller userTellerFacade = new FATeller();
			List list = (List) userTellerFacade.getParameters(
					req.getParameter("flag")).getList();
			list.remove(0); //Delete Header 0000
			
			session.setAttribute("tellerParameters", list);			
			forward("Teller_parameters_search.jsp", req, res);
			
		} catch (Exception e) {
			throw new ServletException(e);
		}	
	}
	private void procActionSearchTellerShifts(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {
		try {
			FATeller userTellerFacade = new FATeller();
			ATSHIFTSKEY key = new ATSHIFTSKEY();
			if (!"".equals(req.getParameter("CODEBANK"))) {
				key.setCODEBANK(req.getParameter("CODEBANK"));
			}
			if (!"".equals(req.getParameter("CODEBRANCH"))) {
				key.setCODEBRANCH(req.getParameter("CODEBRANCH"));
			}
			List list = (List) userTellerFacade.getShifts(key).getList();

			session.setAttribute("tellerShifts", list);
			forward("Teller_shifts_search.jsp", req, res);

		} catch (Exception e) {
			throw new ServletException(e);
		}
	}	
	
}

package datapro.eibs.security;

/**
 * @author: rreal
 */
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generic.beanutil.DynamicForm;
import com.datapro.security.UserRegistryEibsImpl;
import com.datapro.security.UserRegistryPasswordEntry;

import datapro.eibs.beans.DWHUSERSExtBasic;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.ServiceLocator;
import datapro.eibs.master.Util;

/**
 * @author rreal
 *
 */
public class JSUsersDwh extends JSEIBSServlet {
	
	private static final long serialVersionUID = 4552196464478848535L;
	
	private static final int R_ENTER_USER_DWH	 			= 1;
	private static final int A_ENTER_USER_DWH 				= 2;
	private static final int R_USER_PROFILE					= 3;
	
	private static final int R_USER_DWH_SEARCH			= 5;
	private static final int A_USER_DWH_SEARCH			= 6;
	
	private static final int A_USER_DWH	 				= 10;
	private static final int A_USER_DWH_PLATFORM			= 11;
	
	private static final int A_DWH_PARAMETERS			= 100;
	private static final int A_DWH_SHIFTS				= 101;
	
	private static final int DWH_ROLE_POSITION			= 10;

	
	protected void processRequest(ESS0030DSMessage user,
		HttpServletRequest req, HttpServletResponse res,
		HttpSession session, int screen) throws ServletException,
		IOException {

		switch (screen) {
			case R_ENTER_USER_DWH:
				procReqEnterUserDwh(user, req, res, session);
				break;
			case A_ENTER_USER_DWH:
				procActionEnterUserDwh(user, req, res, session);
				break;
			case R_USER_PROFILE:
				procReqUserProfile(user, req, res, session);
				break;
			case R_USER_DWH_SEARCH:
				procReqSearchUserDwh(user, req, res, session);
				break;
			case A_USER_DWH_SEARCH:
				procActionSearchUserDwh(user, req, res, session);
				break;
			case A_USER_DWH:
				procActionUserDwh(user, req, res, session);
				break;
			case A_USER_DWH_PLATFORM:
				procActionUserPlatform(user, req, res, session);
				break;
			case A_DWH_PARAMETERS:
				procActionSearchDwhParameters(user, req, res, session);
				break;
			case A_DWH_SHIFTS:
				procActionSearchDwhShifts(user, req, res, session);
				break;
			default:
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}
	
	private void procReqEnterUserDwh(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = new UserPos();
		session.setAttribute("userPO", userPO);
		forward("Users_dwh_enter.jsp", req, res);
	}
	
	private void procReqUserProfile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserRegistryPasswordEntry userEntry = (UserRegistryPasswordEntry)session.getAttribute("userRegistry");
		String uid = userEntry.getName();
		session.removeAttribute("userRegistry");
		redirect("/servlet/datapro.eibs.security.JSUsersManagement?SCREEN=2&uid=" + uid, res);
	}
	
	private void procActionEnterUserDwh(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		if (req.getParameter("purpose") != null) 
			userPO.setPurpose(req.getParameter("purpose"));
		
		UserRegistryPasswordEntry userEntry = (UserRegistryPasswordEntry)
			session.getAttribute("userRegistry");
		String dwhID = null;
		DWHUSERSExtBasic dwhEntry = new DWHUSERSExtBasic();
		//FADwh userDwhFacade = new FADwh();
		try {
			if (req.getParameter("USERID") != null) {
				dwhID = req.getParameter("USERID");
			} else if (userEntry != null) {
				dwhID = userEntry.getName();
			}	
			dwhID = Util.addRightChar(' ', 10, dwhID);
			dwhID = dwhID.substring(
				(dwhID.length() - 7 < 0 ? 0 : dwhID.length() - 7), dwhID.length()).trim();
			
			userPO.setPurpose("MAINTENANCE");
			
		} /*catch (ItemNotFoundException e) {
			userPO.setPurpose("NEW");
			dwhEntry = new DWHUSERSExtBasic();
		} */catch (Exception e) {
			throw new ServletException(e);
		} finally {
			
		}
		
		
		dwhEntry.setUSERID(dwhID);
		if (userEntry != null) {
			dwhEntry.setUSERID(userEntry.getName());
			dwhEntry.setUSERNAME(userEntry.getDisplayName());
			String roles[] = userEntry.getRoles().split(",");
			String dwhRole = "";
			if(roles.length >= DWH_ROLE_POSITION){
				dwhRole = roles[DWH_ROLE_POSITION];	
			}
			
			dwhEntry.setDWHROLE(dwhRole);
			//dwhEntry.setCODEBANK(message.getE01TLMBNK());
		}
		
		session.setAttribute("dwh", dwhEntry);
		session.setAttribute("userRegistry", userEntry);
		forward("Users_dwh_basic.jsp", req, res);
	}
	
	protected void procActionUserPlatform(ESS0030DSMessage user, 
		HttpServletRequest req, HttpServletResponse res, HttpSession session)	
		throws ServletException, IOException {
		/*MessageProcessor mp = null;
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
			session.setAttribute("dwhDetails", message);
			
			DWHUSERSExtBasic dwhEntry = (DWHUSERSExtBasic) 
				session.getAttribute("dwh");
			dwhEntry.setCODEBANK(message.getE01TLMBNK());
			dwhEntry.setCODEBRANCH(message.getE01TLMBRN());
			
			session.setAttribute("dwh", dwhEntry);
			forward("Users_dwh_basic.jsp", req, res);
			
		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			mp.close();
		}*/
	}
	
	private void procReqSearchUserDwh(
		ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		session.removeAttribute("dwhList");
		forward("Users_dwh_search.jsp", req, res);
	}
	
	private void procActionSearchUserDwh(
		ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		/*try {
			FADwh userDwhFacade = new FADwh();
			List list = (List) userDwhFacade.searchDwhs(
					req.getParameter("pattern")).getList();
			
			session.setAttribute("dwhList", list);			
			forward("Users_dwh_search.jsp", req, res);
			
		} catch (Exception e) {
			throw new ServletException(e);
		}	*/
	}
	
	private ELEERRMessage validateDwh(DWHUSERSExtBasic dwhEntry) throws SQLException {
		ELEERRMessage error = new ELEERRMessage();
		/*if (dwhEntry.getUSERNAME() == null || dwhEntry.getUSERNAME().equals("")) {
			addError(error, "USERNAME", "T001", "Nombre de Cajero es requerido");
		}
		if (dwhEntry.getCODEBANK() == null || dwhEntry.getCODEBANK().equals("")) {
			addError(error, "CODEBANK", "T003", "Banco es requerido");
		}*/
		return error;
	}
	
	private void procActionUserDwh(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		try {
			UserPos userPO = (UserPos) session.getAttribute("userPO");

			DWHUSERSExtBasic dwhEntry = new DWHUSERSExtBasic();
			DynamicForm form = new DynamicForm();
			form.setBeanFromPage(req, dwhEntry);
			/*if (userEntry != null) {
				dwhEntry.setUSEREMAIL(userEntry.getMail());
				dwhEntry.setUSERIPADDR(userEntry.getIpHostNumber());
			}*/
			session.setAttribute("dwh", dwhEntry);
			UserRegistryPasswordEntry userEntry = (UserRegistryPasswordEntry)
			session.getAttribute("userRegistry");
			UserRegistryEibsImpl userRegistryFacade = getUserRegistryFacade(req, session);
			userEntry = (UserRegistryPasswordEntry) userRegistryFacade.getUserByName(
			userEntry.getUid());
			
			ELEERRMessage error = validateDwh(dwhEntry);
			if (error.getBigDecimalERRNUM().intValue() > 0) {
				session.setAttribute("error", error);
			} else {
				
				String roles = userEntry.getRoles();
				String arrRoles[] = roles.split(",");
				String newRoles = "";
				boolean first = true;
				//update roles
				for(int i = 0;i<arrRoles.length;i++){
					
					if(first){
						first = false;
					}else{
						newRoles += ",";
					}
					
					if(i == DWH_ROLE_POSITION){
						newRoles += dwhEntry.getDWHROLE();
					}else{
						newRoles += arrRoles[i];
						}
					
				}
				
				userEntry.setRoles(newRoles);
				userRegistryFacade.updateUser(userEntry);
				
			}
			if (userEntry.hasRole(11)) {
				//has Live Reporter role
				res.sendRedirect(super.srctx + "/servlet/com.datapro.eibs.reporter.controller.JSLRG0001?SCREEN=21&USERID="
						+ userEntry.getName());
			 }			    
			else{		
			forward("Users_dwh_basic.jsp", req, res);
			}
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
	private static final String REGISTRY_KEY = ServiceLocator.getInstance()
										.getDataSourceJndiName(UserRegistryEibsImpl.DB_REGISTRY);
	
	private UserRegistryEibsImpl getUserRegistryFacade(HttpServletRequest req, HttpSession session){
		UserRegistryEibsImpl userRegistryFacade = new UserRegistryEibsImpl(
				session.getServletContext().getInitParameter("realm"));
		userRegistryFacade.initialize(REGISTRY_KEY, req.getLocale());
		return userRegistryFacade;
	}
	private void procActionSearchDwhParameters(
		ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		/*try {
			FADwh userDwhFacade = new FADwh();
			List list = (List) userDwhFacade.getParameters(
					req.getParameter("flag")).getList();
			list.remove(0); //Delete Header 0000
			
			session.setAttribute("dwhParameters", list);			
			forward("Dwh_parameters_search.jsp", req, res);
			
		} catch (Exception e) {
			throw new ServletException(e);
		}	*/
	}
	private void procActionSearchDwhShifts(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {
		/*try {
			FADwh userDwhFacade = new FADwh();
			ATSHIFTSKEY key = new ATSHIFTSKEY();
			if (!"".equals(req.getParameter("CODEBANK"))) {
				key.setCODEBANK(req.getParameter("CODEBANK"));
			}
			if (!"".equals(req.getParameter("CODEBRANCH"))) {
				key.setCODEBRANCH(req.getParameter("CODEBRANCH"));
			}
			List list = (List) userDwhFacade.getShifts(key).getList();

			session.setAttribute("dwhShifts", list);
			forward("Dwh_shifts_search.jsp", req, res);

		} catch (Exception e) {
			throw new ServletException(e);
		}*/
	}	
	
}

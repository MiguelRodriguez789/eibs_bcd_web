package datapro.eibs.security;

/**
 * @author: fhernandez
 */
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generic.beanutil.DynamicForm;
import com.datapro.generic.tool.Util;
import com.datapro.security.RealmEntry;
import com.datapro.security.RegistryEntry;
import com.datapro.security.UserEntryNotFoundException;
import com.datapro.security.UserPasswordException;
import com.datapro.security.UserRealmCredentialsEntry;
import com.datapro.security.UserRegistryEntry;
import com.datapro.security.UserRegistryFacade;
import com.datapro.security.UserRegistryPasswordEntry;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.ServiceLocator;
import datapro.eibs.master.SuperServlet;

/**
 * @author fhernandez
 *
 */
public class JSUsersManagement extends JSEIBSServlet {
	
	private static final long serialVersionUID = 4180058941061500306L;
	
	private static final int R_ENTER_USER_REGISTRY 			= 1;
	private static final int A_ENTER_USER_REGISTRY 			= 2;
	private static final int A_USER_REGISTRY				= 3;
	private static final int R_USER_CHANGE_PASSWORD			= 5;
	private static final int A_USER_CHANGE_PASSWORD			= 6;
	
	private static final int R_USER_REGISTRY_SEARCH			= 10;
	private static final int A_USER_REGISTRY_SEARCH			= 11;
	
	private static final int R_ENTER_USER_REALM 			= 100;
	private static final int A_ENTER_USER_REALM 			= 101;	
	private static final int A_USER_REALM_NEW 				= 102;
	private static final int A_USER_REALM_MAINTENANCE		= 103;

	private static final String REGISTRY_KEY = ServiceLocator.getInstance()
		.getDataSourceJndiName(UserRegistryFacade.DB_REGISTRY);

	protected void processRequest(ESS0030DSMessage user,
		HttpServletRequest req, HttpServletResponse res,
		HttpSession session, int screen) throws ServletException,
		IOException {
		
		if (!user.getE01LGM().equals("2")) {
			ELEERRMessage error = new ELEERRMessage();
			addError(error, "uid", "SE01", "El modo de autenticación configurado no es compatible con esta opción");
			session.setAttribute("error", error);
			forward("error_viewer.jsp", req, res);
			return;
		}

		switch (screen) {
			case R_ENTER_USER_REGISTRY:
				procReqEnterUserRegistry(user, req, res, session);
				break;
			case A_ENTER_USER_REGISTRY:
				procActionEnterUserRegistry(user, req, res, session);
				break;
			case A_USER_REGISTRY:
				procActionUserRegistry(user, req, res, session);
				break;
			case R_USER_CHANGE_PASSWORD:
				procReqUserChangePassword(user, req, res, session);
				break;				
			case A_USER_CHANGE_PASSWORD:
				procActionUserChangePassword(user, req, res, session);
				break;
			case R_USER_REGISTRY_SEARCH:
				procReqSearchUserRegistry(user, req, res, session);
				break;
			case A_USER_REGISTRY_SEARCH:
				procActionSearchUserRegistry(user, req, res, session);
				break;
			case R_ENTER_USER_REALM:
				procReqEnterUserRealm(user, req, res, session);
				break;
			case A_ENTER_USER_REALM:
				procActionEnterUserRealm(user, req, res, session);
				break;
			case A_USER_REALM_NEW:
				procActionNewRealm(user, req, res, session);
				break;
			case A_USER_REALM_MAINTENANCE:
				procActionMaintenanceRealm(user, req, res, session);
				break;
			default:
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}
	
	private UserRegistryFacade getUserRegistryFacade(HttpServletRequest req, HttpSession session){
		try {
			String realm = session.getServletContext().getInitParameter("realm");
			String usersImpl = session.getServletContext().getInitParameter("users");
			UserRegistryFacade userRegistryFacade = (UserRegistryFacade) Class.forName(usersImpl)
				.getConstructor(new Class[] { String.class }).newInstance(new Object[] { realm });
			userRegistryFacade.initialize(REGISTRY_KEY, req.getLocale());
			return userRegistryFacade;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private Long daysToSeconds(String days){
		if (days != null) {
			return new Long(""+Integer.parseInt(days)*RegistryEntry.ONE_DAY);
		}
		return null;
	}
	
	private void procReqEnterUserRegistry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = new UserPos();
		session.setAttribute("userPO", userPO);
		session.removeAttribute("userRegistry");
		forward("Users_registry_enter.jsp", req, res);
	}
	
	private void procActionEnterUserRegistry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		userPO.setPurpose(req.getParameter("purpose"));
		try {
			UserRegistryEntry userEntry = (UserRegistryPasswordEntry)
				session.getAttribute("userRegistry");
			if (userEntry == null) {
				userEntry = new UserRegistryPasswordEntry();
				userEntry.init();
				String userSecurityName = req.getParameter("uid");
				if (userSecurityName != null && !userSecurityName.equals("")) {
					userEntry.setUid(userSecurityName);
					userEntry.setName(userSecurityName);
				}
				session.setAttribute("userRegistry", userEntry);
				UserRegistryFacade userRegistryFacade = getUserRegistryFacade(req, session);
				userEntry = userRegistryFacade.getUserByName(userEntry.getUid());
			}
			userEntry.setUserPassword(null);
			
			userPO.setPurpose("MAINTENANCE");
			session.setAttribute("userRegistry", userEntry);
			
		} catch (SQLException e) {
			throw new ServletException(e);
		} catch (UserEntryNotFoundException e) {
			if (!"NEW".equals(userPO.getPurpose())) {
				ELEERRMessage error = new ELEERRMessage();
				addError(error, "uid", "S001", "El Perfil del usuario no ha sido creado");
				session.setAttribute("error", error);
			}
			userPO.setPurpose("NEW");
		}
		forward("Users_registry_basic.jsp", req, res);
	}
	
	private void procReqSearchUserRegistry(
		ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		session.removeAttribute("userList");
		forward("Users_registry_search.jsp", req, res);
	}
	
	private void procActionSearchUserRegistry(
		ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		try {
			UserRegistryFacade userRegistryFacade = getUserRegistryFacade(req, session);
			List list = userRegistryFacade.getUsersEntries(
					req.getParameter("pattern"), Util.parseInt(req.getParameter("limit")));
			
			session.setAttribute("userList", list);			
			forward("Users_registry_search.jsp", req, res);
			
		} catch (Exception e) {
			throw new ServletException(e);
		}	
	}
	
	private ELEERRMessage validateUser(UserRegistryEntry userEntry) {
		ELEERRMessage error = new ELEERRMessage();
		if (userEntry.getUid() == null || userEntry.getUid().equals("")) {
			addError(error, "uid", "SS01", "El Identificador de usuario es requerido");
		}
		if (userEntry.getName() == null || userEntry.getName().equals("")) {
			addError(error, "name", "SS02", "El Usuario o Nombre de Seguridad es requerido");
		}
		if (userEntry.getGivenName() == null || userEntry.getGivenName().equals("")) {
			addError(error, "givenName", "SS03", "El Nombre del usuario es requerido");
		}
		return error;
	}
	
	private String getRole(HttpServletRequest req, int index){
		String role = req.getParameter("role_"+index);
		if (role != null) {
			return role;
		}
		return "";
	}
	
	private String getRoles(HttpServletRequest req){
		int length = Util.parseInt(req.getParameter("rolesLength"));
		StringBuffer roles = new StringBuffer();
		for (int i = 0; i < length; i++) {
			if (i != 0) 
				roles.append(",");
			roles.append(getRole(req, i));
		}
		return roles.toString();
	}	
	
	private void procActionUserRegistry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		try {
			UserRegistryPasswordEntry userEntry = (UserRegistryPasswordEntry)
				session.getAttribute("userRegistry");
			DynamicForm form = new DynamicForm();
			form.setBeanFromPage(req, userEntry, true);
			userEntry.setDisplayName(userEntry.getGivenName() + " " + userEntry.getSurname());
			userEntry.setRoles(getRoles(req));
			userEntry.setUserPassword(req.getParameter("userPassword"));//keep case
			if ("".equals(userEntry.getUserPassword()) 
				|| "null".equals(userEntry.getUserPassword()))
				userEntry.setUserPassword(null);
			if (req.getParameter("pwdReset") == null){
				userEntry.setPwdReset(UserRegistryPasswordEntry.FALSE);
			}
			if (req.getParameter("pwdLockout") == null){
				userEntry.setPwdLockout(UserRegistryPasswordEntry.FALSE);
			}
			session.setAttribute("userRegistry", userEntry);
			
			UserRegistryFacade userRegistryFacade = getUserRegistryFacade(req, session);
			boolean isNew = false;
			RealmEntry realmEntry = null;
			try {
				realmEntry = (RealmEntry) userRegistryFacade.getUserRealmCredentials(
						userEntry.getName());
			} catch (UserEntryNotFoundException e) {
				isNew = true;
				realmEntry = (RealmEntry) userRegistryFacade.getRealm(
						session.getServletContext().getInitParameter("realm"));
			}
			
			ELEERRMessage error = validateUser(userEntry);
			if (userEntry.getUserPassword() != null) {
				convertErrors(error, userRegistryFacade.validatePassword(
						realmEntry, userEntry.getUserPassword()));
			}
			if (error.getBigDecimalERRNUM().intValue() > 0) {
				session.setAttribute("error", error);
				forward("Users_registry_basic.jsp", req, res);
			} else {
				try {
					userRegistryFacade.getUser(userEntry);
					userRegistryFacade.updateUser(userEntry);
				} catch (UserEntryNotFoundException e) {
					if (userEntry.getUserPassword() == null) 
						userEntry.setPwdReset(UserRegistryPasswordEntry.TRUE);
					userRegistryFacade.createUser(userEntry);
				}
				userEntry = (UserRegistryPasswordEntry) userRegistryFacade.getUserByName(
						userEntry.getUid());
				session.setAttribute("userRegistry", userEntry);
				
				if (!req.getParameter("role").equals("")) {
					if (req.getParameter("role_0") != null) {
						redirect("/servlet/datapro.eibs.security.JSESD0007?SCREEN=2&E01BTHKEY="
								+ userEntry.getName(), res);
					} else if (req.getParameter("role_1") != null) {
						redirect("/servlet/datapro.eibs.security.JSUsersTeller?SCREEN=2&TELLUSERID="
							+ userEntry.getName(), res);
					} else if (req.getParameter("role_10") != null) {
						redirect("/servlet/datapro.eibs.security.JSUsersDwh?SCREEN=2&USERID="
							+ userEntry.getName(), res);
					} else if (req.getParameter("role_11") != null) {
						redirect("/servlet/com.datapro.eibs.reporter.controller.JSLRG0001?SCREEN=20&USERID="
							+ userEntry.getName(), res);
					}
				} else {
					forward("Users_registry_basic.jsp", req, res);
				}
			}
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
	
	private void procReqUserChangePassword(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		session.removeAttribute("error");
		forward("Users_change_password.jsp", req, res);
	}
	
	private void procActionUserChangePassword(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		ELEERRMessage error = new ELEERRMessage();
		try {
			UserRegistryFacade userRegistryFacade = getUserRegistryFacade(req, session);			
			UserRealmCredentialsEntry passwordEntry = userRegistryFacade.getUserRealmCredentials(
					user.getH01USR());
			
			String userPassword = req.getParameter("userPassword");
			String newPassword = req.getParameter("newPassword");
			
			userRegistryFacade.checkPassword(user.getH01USR(), 
					userPassword, passwordEntry.getUserPassword());			
			convertErrors(error, userRegistryFacade.validatePassword(passwordEntry, newPassword));
			
			if (error.getBigDecimalERRNUM().intValue() > 0) {
				session.setAttribute("error", error);
				forward("Users_change_password.jsp", req, res);
			} else {
				passwordEntry = userRegistryFacade.updatePassword(user.getH01USR(), newPassword);
				res.sendRedirect(SuperServlet.srctx + SuperServlet.bgPage);
			}

		} catch (UserEntryNotFoundException e) {
			addError(error, "uid", "S010", "El usuario no existe");
			session.setAttribute("error", error);
			forward("Users_change_password.jsp", req, res);
		} catch (UserPasswordException e) {
			addError(error, "userPassword", "S011", "La contraseña del usuario no coincide");
			session.setAttribute("error", error);
			forward("Users_change_password.jsp", req, res);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
	
	private void procReqEnterUserRealm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		try {
			UserPos userPO = new UserPos();
			session.setAttribute("userPO", userPO);
			
			UserRegistryFacade userRegistryFacade = getUserRegistryFacade(req, session);
			List list = userRegistryFacade.getRealmEntries();
			
			session.setAttribute("realms", list);
			forward("Users_realms_list.jsp", req, res);
			
		} catch (Exception e) {
			throw new ServletException(e);
		}	
	}
	
	private void procActionEnterUserRealm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		try {
			UserPos userPO = (UserPos) session.getAttribute("userPO");
			userPO.setPurpose(req.getParameter("purpose"));
			
			RealmEntry realmEntry = new RealmEntry();
			realmEntry.init();
			if ("MAINTENANCE".equals(userPO.getPurpose())){
				UserRegistryFacade userRegistryFacade = getUserRegistryFacade(req, session);
				String realm = req.getParameter("realm");
				if (realm != null && !realm.equals("")) {
					realmEntry = userRegistryFacade.getRealm(realm);
				}
			}
			session.setAttribute("realm", realmEntry);
			forward("Users_realms_basic.jsp", req, res);
			
		} catch (SQLException e) {
			throw new ServletException(e);
		} catch (UserEntryNotFoundException e) {
			ELEERRMessage error = new ELEERRMessage(); 
			addError(error, "realm", "SR01", "Ambiente no encontrado en el registro");
			session.setAttribute("error", error);
			forward("Users_realms_list.jsp", req, res);
		}
	}
	
	private ELEERRMessage validateRealm(RealmEntry realmEntry) {
		ELEERRMessage error = new ELEERRMessage();
		return error;
	}
	
	private void procActionNewRealm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		try {
			RealmEntry realmEntry = new RealmEntry();
			DynamicForm form = new DynamicForm();
			form.setBeanFromPage(req, realmEntry);
			if (realmEntry.getPwdMaxAge() == null) 
				realmEntry.setPwdMaxAge(daysToSeconds(req.getParameter("pwdMaxAgeDays")));
			if (realmEntry.getPwdMinAge() == null) 
				realmEntry.setPwdMinAge(daysToSeconds(req.getParameter("pwdMinAgeDays")));
			session.setAttribute("realm", realmEntry);
	
			UserRegistryFacade userRegistryFacade = getUserRegistryFacade(req, session);

			ELEERRMessage error = validateRealm(realmEntry);
			if (error.getBigDecimalERRNUM().intValue() > 0) {
				session.setAttribute("error", error);
				forward("Users_realms_basic.jsp", req, res);
			} else {
				userRegistryFacade.createRealm(realmEntry);
				realmEntry = (RealmEntry) userRegistryFacade.getRealm(
						realmEntry.getRealm());
				session.setAttribute("realm", realmEntry);
				redirect("/servlet/datapro.eibs.security.JSUsersManagement?SCREEN=100", res);
			}
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
	
	private void procActionMaintenanceRealm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		try {
			RealmEntry realmEntry = new RealmEntry();
			DynamicForm form = new DynamicForm();
			form.setBeanFromPage(req, realmEntry);
			if (realmEntry.getPwdMaxAge() == null) 
				realmEntry.setPwdMaxAge(daysToSeconds(req.getParameter("pwdMaxAgeDays")));
			if (realmEntry.getPwdMinAge() == null) 
				realmEntry.setPwdMinAge(daysToSeconds(req.getParameter("pwdMinAgeDays")));
			session.setAttribute("realm", realmEntry);
			
			UserRegistryFacade userRegistryFacade = getUserRegistryFacade(req, session);
			
			ELEERRMessage error = validateRealm(realmEntry);
			if (error.getBigDecimalERRNUM().intValue() > 0) {
				session.setAttribute("error", error);
				forward("Users_realms_basic.jsp", req, res);
			} else {
				userRegistryFacade.updateRealm(realmEntry);
				realmEntry = (RealmEntry) userRegistryFacade.getRealm(
						realmEntry.getRealm());
				session.setAttribute("realm", realmEntry);
				redirect("/servlet/datapro.eibs.security.JSUsersManagement?SCREEN=100", res);
			}
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}

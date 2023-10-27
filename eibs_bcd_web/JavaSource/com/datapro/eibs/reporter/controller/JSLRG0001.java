package com.datapro.eibs.reporter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.reporter.forms.LRG000101;
import com.datapro.eibs.reporter.forms.LRGA30090;
import com.datapro.eibs.reporter.service.dao.UserModuleDAO;
import com.datapro.security.UserRegistryPasswordEntry;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;

/**
 * @author Luis Crosby
 * @date 2/2012
 * 
 */


public class JSLRG0001 extends JSEIBSServlet {

	protected static final int REQ_USERACCESS_LIST	=	10;
	protected static final int ACT_USERACCESS_LIST	=	20;
	protected static final int ACT_USERS_MANAGEMENT	=	21;
	protected static final int R_USER_PROFILE		=   22;
	protected static final int ACT_USERACCESS_SAVE	=	30;
	protected static final int ACT_USERS_SAVE   	=	33;
	
	protected static final int REQ_SEARCH_USER_HELP =	500;
	protected static final int ACT_SEARCH_USER_HELP =	501;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7938080750024341975L;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		case REQ_USERACCESS_LIST:
			procReqUseraccessList(user, req, res, session);
			break;
		case ACT_USERACCESS_LIST:
			procActionUseraccessList(user, req, res, session);
			break;
		case ACT_USERACCESS_SAVE:
			procActionUseraccessSave(user, req, res, session);
			break;			
		case REQ_SEARCH_USER_HELP:
			reqSearchUserHelp(user, req, res, session);
			break;
		case ACT_SEARCH_USER_HELP:
			reqActionSearchUserHelp(user, req, res, session);			
			break; 			
		case ACT_USERS_MANAGEMENT:
			reqActionUsersManagement(user, req, res, session);			
			break;
		case R_USER_PROFILE:
			procReqUserProfile(user, req, res, session);			
			break;
		case ACT_USERS_SAVE:
			procActionUserSave(user, req, res, session);			
			break;
		default:
			forward("MISC_not_available.jsp", req, res);
			break;
		}
	}

	private void procActionUserSave(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException {
		LRG000101 msg = new LRG000101();
		ELEERRMessage error = new ELEERRMessage();
		String userID = req.getParameter("USERID").toUpperCase();
		int[] arrModules = convertStringArraytoIntArray(req.getParameterValues("selectedFields"));
		
		msg.setArrSelectedFields(arrModules);
		msg.setUserID(userID);
		msg.setMasterUser(user.getH01USR());
		
		int result = -1;
		try {
			result = UserModuleDAO.getInstance().saveList(msg);
			if (result < 0)
			{
				error.setERRNUM("-1");
				error.setERDF01("USERID");
				error.setERDR01("0");
				error.setERNU01("R001");
				error.setERDS01("No se ha podido completar el proceso.");
			}
			else
				error = new ELEERRMessage();
			session.setAttribute("error", error);	
			redirectToPage(
						"/servlet/com.datapro.eibs.reporter.controller.JSLRG0001?SCREEN=21&msg=ok&USERID="
								+ userID, res);
		}
		catch (Exception e) {
		throw new ServletException(e.getClass().getName() + " --> "
				+ e.getMessage());
		}
		
	}

	private void procReqUserProfile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		UserRegistryPasswordEntry userEntry = (UserRegistryPasswordEntry)session.getAttribute("userRegistry");
		String uid = userEntry.getName();
		session.removeAttribute("userRegistry");
		redirect("/servlet/datapro.eibs.security.JSUsersManagement?SCREEN=2&uid=" + uid, res);
		
	}

	private void reqActionUsersManagement(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException {

		
		String PageToCall = "";
		LRG000101 msg = new LRG000101();
		ELEERRMessage error = new ELEERRMessage();
		UserRegistryPasswordEntry userEntry = (UserRegistryPasswordEntry)
		session.getAttribute("userRegistry");
		
		//String userID = req.getParameter("USERID").trim().toUpperCase();
		String userID = userEntry.getName();
		
		if (req.getParameter("msg")!=null)
			if (req.getParameter("msg").equals("ok"))
				msg.setMessage("El proceso se ha realizado con éxito");
			
		msg.setUserID(userID);
		try {
			
			int userCount = UserModuleDAO.getInstance().validateUser(userID);
			
			if (userCount > 0)
			{
				error = new ELEERRMessage();
				msg.setModuleList(UserModuleDAO.getInstance().loadModules(userID));
				msg.setMissingModuleList(UserModuleDAO.getInstance().loadMissingModules(userID));
				req.setAttribute("msg", msg);
				PageToCall = "/pages/reporter/s/LRG0001_users_management.jsp";
				callPage(PageToCall, req, res);
			}
			else
			{
				error.setERRNUM("-1");
				error.setERDF01("USERID");
				error.setERDR01("0");
				error.setERNU01("R000");
				error.setERDS01("El usuario ingresado no existe.");				
				session.setAttribute("error", error);
				req.setAttribute("msg", msg);
				redirectToPage(
							"/servlet/com.datapro.eibs.reporter.controller.JSLRG0001?SCREEN=10&USERID=" + userID, res);
			}

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	
		
	}

	private void reqSearchUserHelp(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		
		try {
			PageToCall = "/pages/reporter/s/LRG0001_search_user_help.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}
	
	
	private void reqActionSearchUserHelp(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		String textSearch = req.getParameter("textSearch")!=null ? req.getParameter("textSearch").toUpperCase() : "";
		LRGA30090 msg = new LRGA30090();
		msg.setTextSearch(textSearch);
		
		try {

			msg.setUserList(UserModuleDAO.getInstance().getAllEibsUsers(textSearch));
			req.setAttribute("msg", msg);			
			PageToCall = "/pages/reporter/s/LRG0001_search_user_help.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}		
	
	private void procActionUseraccessSave(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException {
		// TODO Auto-generated method stub

		LRG000101 msg = new LRG000101();
		ELEERRMessage error = new ELEERRMessage();
		String userID = req.getParameter("USERID").toUpperCase();
		int[] arrModules = convertStringArraytoIntArray(req.getParameterValues("selectedFields"));
		
		msg.setArrSelectedFields(arrModules);
		msg.setUserID(userID);
		msg.setMasterUser(user.getH01USR());
		
		int result = -1;
		try {
			result = UserModuleDAO.getInstance().saveList(msg);
			if (result < 0)
			{
				error.setERRNUM("-1");
				error.setERDF01("USERID");
				error.setERDR01("0");
				error.setERNU01("R001");
				error.setERDS01("No se ha podido completar el proceso.");
			}
			else
				error = new ELEERRMessage();
			session.setAttribute("error", error);	
			redirectToPage(
						"/servlet/com.datapro.eibs.reporter.controller.JSLRG0001?SCREEN=20&msg=ok&USERID="
								+ userID, res);
		}
		catch (Exception e) {
		throw new ServletException(e.getClass().getName() + " --> "
				+ e.getMessage());
		}
	}

	private void procActionUseraccessList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {
		
		String PageToCall = "";
		LRG000101 msg = new LRG000101();
		ELEERRMessage error = new ELEERRMessage();
		
		String userID = req.getParameter("USERID").trim().toUpperCase();
		
		if (req.getParameter("msg")!=null)
			if (req.getParameter("msg").equals("ok"))
				msg.setMessage("El proceso se ha realizado con éxito");
			
		msg.setUserID(userID);
		try {
			
			int userCount = UserModuleDAO.getInstance().validateUser(userID);
			
			if (userCount > 0)
			{
				error = new ELEERRMessage();
				msg.setModuleList(UserModuleDAO.getInstance().loadModules(userID));
				msg.setMissingModuleList(UserModuleDAO.getInstance().loadMissingModules(userID));
				req.setAttribute("msg", msg);
				PageToCall = "/pages/reporter/s/LRG0001_usermodule_list.jsp";
				callPage(PageToCall, req, res);
			}
			else
			{
				error.setERRNUM("-1");
				error.setERDF01("USERID");
				error.setERDR01("0");
				error.setERNU01("R000");
				error.setERDS01("El usuario ingresado no existe.");				
				session.setAttribute("error", error);
				req.setAttribute("msg", msg);
				redirectToPage(
							"/servlet/com.datapro.eibs.reporter.controller.JSLRG0001?SCREEN=10&USERID=" + userID, res);
			}

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}

	private void procReqUseraccessList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		String userID = req.getParameter("USERID")!=null ? req.getParameter("USERID"): "";
		try {
			req.setAttribute("userID", userID);
			PageToCall = "/pages/reporter/s/LRG0001_select_user.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}
	
	private int[] convertStringArraytoIntArray(String[] sarray) {
		try {
		if (sarray != null) {
			int intarray[] = new int[sarray.length];
			for (int i = 0; i < sarray.length; i++) {
				intarray[i] = Integer.parseInt(sarray[i]);
			}
			return intarray;
		}
		return null;
	}
	catch (Exception e)
	{
		return null;
	}
	}
}

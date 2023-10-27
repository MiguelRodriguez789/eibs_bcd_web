package com.datapro.eibs.reporter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.reporter.forms.LRG000101;
import com.datapro.eibs.reporter.service.dao.UserModuleDAO;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;

/**
 * @author Luis Crosby
 * @date 5/2012
 * 
 */


public class JSLRGA000 extends JSEIBSServlet {

	protected static final int REQ_ADMIN_MAINMENU	=	10;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7938080750024341975L;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		case REQ_ADMIN_MAINMENU:
			reqAdminMainMenu(user, req, res, session);
			break;
		default:
			forward("MISC_not_available.jsp", req, res);
			break;
		}
	}

	private void reqAdminMainMenu(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		String userID = req.getParameter("USERID")!=null ? req.getParameter("USERID"): "";
		try {
			req.setAttribute("userID", userID);
			PageToCall = "/pages/reporter/s/LRGA000_main_menu.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}
}

package com.datapro.eibs.reporter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.reporter.forms.LRGA40001;
import com.datapro.eibs.reporter.model.GlbprmDTO;
import com.datapro.eibs.reporter.service.dao.GlbprmDAO;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;

/**
 * @author Luis Crosby
 * @date 7/2012
 * 
 */
/** GLBPRM ADMIN */

public class JSLRGA400 extends JSEIBSServlet {

	protected static final int REQ_EDIT_PARAMS				=	10;
	protected static final int ACT_EDIT_PARAMS				=	11;
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -7938080750024341975L;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		case REQ_EDIT_PARAMS :
			reqEditParams(user, req, res, session);
			break;
		case ACT_EDIT_PARAMS : 
			actEditParams(user, req, res, session);
			break;
		default:
			forward("MISC_not_available.jsp", req, res);
			break;
		}
	}
	
	private void reqEditParams(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		LRGA40001 msg = new LRGA40001();
		try {
			
			msg.setParams(GlbprmDAO.getInstance().getParams());
			
			req.setAttribute("msg", msg);
			PageToCall = "/pages/reporter/s/LRGA400_global_parameters.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}	
	
	private void actEditParams(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		GlbprmDTO params = new GlbprmDTO();
		int maxrws = Integer.parseInt(req.getParameter("MAXRWS"));
		params.setMAXRWS(maxrws);
		
		ELEERRMessage error = params.validate();

		try {
			if (error.getERRNUM().equals("0"))
			{
				GlbprmDAO.getInstance().editParams(params);
				error.setERWRNG("K");
			}
			
			session.setAttribute("error", error);
			redirect("com.datapro.eibs.reporter.controller.JSLRGA400?SCREEN=10", res);
		}
		catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
		  	throw new RuntimeException("Socket Communication Error");
		}		
	}		
	
}

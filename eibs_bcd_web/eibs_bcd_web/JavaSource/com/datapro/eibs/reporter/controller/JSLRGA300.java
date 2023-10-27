package com.datapro.eibs.reporter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.reporter.forms.LRGA20001;
import com.datapro.eibs.reporter.forms.LRGA20002;
import com.datapro.eibs.reporter.forms.LRGA30001;
import com.datapro.eibs.reporter.forms.LRGA30002;
import com.datapro.eibs.reporter.forms.LRGA30003;
import com.datapro.eibs.reporter.forms.LRGA30090;
import com.datapro.eibs.reporter.model.ModuleDTO;
import com.datapro.eibs.reporter.model.ReportDTO;
import com.datapro.eibs.reporter.service.dao.ModuleDAO;
import com.datapro.eibs.reporter.service.dao.ModuleFieldDAO;
import com.datapro.eibs.reporter.service.dao.ReportDAO;
import com.datapro.eibs.reporter.service.dao.UserModuleDAO;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;

/**
 * @author Luis Crosby
 * @date 6/2012
 * 
 */
/** REPORT ADMIN */

public class JSLRGA300 extends JSEIBSServlet {

	protected static final int REQ_MAIN_MENU				=	10;
	protected static final int REQ_REASSIGN_REPORTS			=	20;
	protected static final int ACT_REASSIGN_REPORTS			=	21;
	protected static final int REQ_MAINT_REPORT_LIST		=	30;
	protected static final int ACT_MAINT_REPORT_LIST		=	31;
	protected static final int REQ_MAINT_REPORT				=	32;	
	protected static final int ACT_MAINT_REPORT_SAVE		=	33;	
	protected static final int REQ_SEARCH_USER_MAIN			=	500;
	protected static final int ACT_SEARCH_USER_MAIN			=	501;
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -7938080750024341975L;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		case REQ_MAIN_MENU:
			reqAdmReportMainMenu(user, req, res, session);
			break;
		case REQ_REASSIGN_REPORTS:
			reqReassignReports(user, req, res, session);
			break;
		case ACT_REASSIGN_REPORTS:
			actReassignReports(user, req, res, session);
			break;
		case REQ_SEARCH_USER_MAIN:
			reqSearchUserMain(user, req, res, session);
			break;
		case ACT_SEARCH_USER_MAIN:
			reqActionSearchUserMain(user, req, res, session);			
			break;
		case REQ_MAINT_REPORT_LIST:
			reqMaintReportList(user, req, res, session);
			break;
		case ACT_MAINT_REPORT_LIST:
			actMaintReportList(user, req, res, session);
			break;			
		case REQ_MAINT_REPORT :
			reqMaintReport(user, req, res, session);
			break;
		case ACT_MAINT_REPORT_SAVE: 
			actMaintReportSave(user, req, res, session);
			break;
		default:
			forward("MISC_not_available.jsp", req, res);
			break;
		}
	}

	private void reqAdmReportMainMenu(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		try {
			PageToCall = "/pages/reporter/s/LRGA300_maint_report_main_menu.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}
	
	private void reqSearchUserMain(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		
		try {
			PageToCall = "/pages/reporter/s/LRGA300_search_user_main.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}
	
	
	private void reqActionSearchUserMain(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		String textSearch = req.getParameter("textSearch")!=null ? req.getParameter("textSearch").toUpperCase() : "";
		String usersWithReportsOnly = req.getParameter("usersWithReportsOnly")!=null ? req.getParameter("usersWithReportsOnly").toUpperCase() : "";
		LRGA30090 msg = new LRGA30090();
		msg.setTextSearch(textSearch);
		msg.setUsersWithReportsOnly(usersWithReportsOnly);
		
		try {

			if (usersWithReportsOnly.equals("1"))
				msg.setUserList(UserModuleDAO.getInstance().getLRGUserList(textSearch));
			else
				msg.setUserList(UserModuleDAO.getInstance().getAllEibsAdminUsers(textSearch));
			req.setAttribute("msg", msg);			
			PageToCall = "/pages/reporter/s/LRGA300_search_user_main.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}	

	private void reqReassignReports(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException {
		String PageToCall = "";
		try {
			PageToCall = "/pages/reporter/s/LRGA300_reassign_reports.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}

	private void actReassignReports(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException {
			
		String PageToCall = "";
		LRGA30001 msg = new LRGA30001();
		msg.setFromUser(req.getParameter("fromUser").trim().toUpperCase());
		msg.setToUser(req.getParameter("toUser").trim().toUpperCase());
		
		ELEERRMessage msgError = msg.validate();
		
		try {
			if (!msgError.getERRNUM().equals("0")) {
				session.setAttribute("error", msgError);
				req.setAttribute("msg", msg);
				PageToCall = "/pages/reporter/s/LRGA300_reassign_reports.jsp";
				callPage(PageToCall, req, res);
			}
			else {
				ReportDAO.getInstance().reassignReports(msg.getFromUser(), msg.getToUser(), user.getE01USNME());
				msgError.setERRNUM("0");
				msgError.setERWRNG("K");
				session.setAttribute("error", msgError);
				PageToCall = "/pages/reporter/s/LRGA300_reassign_reports.jsp";
				callPage(PageToCall, req, res);
			}
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}

	private void reqMaintReportList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		try {
			PageToCall = "/pages/reporter/s/LRGA300_maint_report_list.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}

	private void actMaintReportList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		String textSearch = req.getParameter("textSearch")!=null ? req.getParameter("textSearch").trim().toUpperCase(): "";

		LRGA30002 msg = new LRGA30002();
		msg.setTextSearch(textSearch);
		
		try {
			
			msg.setReportList(ReportDAO.getInstance().getReportsByOwner(textSearch));
			
			req.setAttribute("msg", msg);			
			PageToCall = "/pages/reporter/s/LRGA300_maint_report_list.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}		
	
	private void reqMaintReport(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		LRGA30003 msg = new LRGA30003();
		int idRep = Integer.parseInt(req.getParameter("ID_REP"));
		try {
			
			if (session.getAttribute("updReportDTO") != null)
			{
				msg.setReport((ReportDTO) session.getAttribute("updReportDTO"));
				session.removeAttribute("updReportDTO");
			}
			else
				msg.setReport(ReportDAO.getInstance().getReport(idRep));
			
			req.setAttribute("msg", msg);
			PageToCall = "/pages/reporter/s/LRGA300_maint_report.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}	
	
	private void actMaintReportSave(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		ReportDTO reportUpd = new ReportDTO();
		int idRep = Integer.parseInt(req.getParameter("ID_REP"));
		reportUpd.setID_REP(idRep);
		reportUpd.setRPTDSC(req.getParameter("RPTDSC").toUpperCase());
		reportUpd.setPUBREP(req.getParameter("PUBREP"));
		reportUpd.setACTIVE(req.getParameter("ACTIVE"));
		
		ELEERRMessage error = reportUpd.validate();

		if (!error.getERRNUM().equals("0")) {
			session.setAttribute("updReportDTO", reportUpd);
			session.setAttribute("error", error);
			redirect("com.datapro.eibs.reporter.controller.JSLRGA300?SCREEN=32&ID_REP=" + idRep, res);
		} 		
		else {
			error = ReportDAO.getInstance().editReport(reportUpd);
			session.setAttribute("error", error);
			redirect("com.datapro.eibs.reporter.controller.JSLRGA300?SCREEN=32&ID_REP=" + idRep, res);
		}		
	}	
}

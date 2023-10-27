package com.datapro.eibs.reporter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.reporter.forms.LRGA20001;
import com.datapro.eibs.reporter.forms.LRGA20002;
import com.datapro.eibs.reporter.forms.LRGA20003;
import com.datapro.eibs.reporter.model.ModuleDTO;
import com.datapro.eibs.reporter.model.ModuleFieldDTO;
import com.datapro.eibs.reporter.service.dao.ModuleDAO;
import com.datapro.eibs.reporter.service.dao.ModuleFieldDAO;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;
/**
 * @author Luis Crosby
 * date 7/2012
 */

/** MODULE ADMIN */
public class JSLRGA200 extends JSEIBSServlet {

	protected static final int REQ_MAIN_MENU				=	10;
	
	protected static final int REQ_MODULE_LIST				=	20;
	protected static final int ACT_MODULE_LIST				=	21;
	
	protected static final int REQ_MODULE_MAINT				=	30;
	protected static final int ACT_MODULE_MAINT_TEST		=	31;
	protected static final int ACT_MODULE_MAINT_SAVE		=	32;
	protected static final int ACT_MODULE_MAINT_RETURN		=	33;
	
	protected static final int REQ_MODULE_NEW				=	35;
	protected static final int ACT_MODULE_NEW_TEST			=	36;
	protected static final int ACT_MODULE_NEW_SAVE			=	37;	
	

	protected static final int REQ_MODULEFIELD_MAINT 		=	40;
	protected static final int ACT_MODULEFIELD_EDIT	 		=	41;
	protected static final int REQ_MODULEFIELD_NEW	 		=	42;
	protected static final int ACT_MODULEFIELD_TEST			= 	43;
	protected static final int ACT_MODULEFIELD_SAVE	 		=	44;
	
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
			reqAdmModMainMenu(user, req, res, session);
			break;
		case REQ_MODULE_LIST:
			reqAdmModModuleList(user, req, res, session);
			break;
		case ACT_MODULE_LIST:
			procAdmModModuleList(user, req, res, session);
			break;			
		case REQ_MODULE_MAINT:
			reqAdmModModuleMaint(user, req, res, session);
			break;
		case REQ_MODULEFIELD_NEW :	
			reqAdmModModuleFieldNew(user, req, res, session);
			break;				
		case REQ_MODULEFIELD_MAINT :
			reqAdmModModuleFieldMaint(user, req, res, session);
			break;	
		case ACT_MODULEFIELD_EDIT:
			procAdmModuleFieldEdit(user, req, res, session);
			break;
		case REQ_MODULE_NEW:
			reqAdmModuleNew (user, req, res, session);
			break;
		case ACT_MODULE_NEW_TEST:
			procAdmModuleNewTest(user, req, res, session);
			break; 
		case ACT_MODULE_NEW_SAVE:
			procAdmModuleSave(user, req, res, session);
			break;
		case ACT_MODULE_MAINT_TEST:					
			procAdmModuleMaintTest(user, req, res, session);
			break; 
		case ACT_MODULE_MAINT_SAVE:
			procAdmModuleMaintSave(user, req, res, session);
			break;
		case ACT_MODULE_MAINT_RETURN:
			procAdmModuleMaintReturn (user, req, res, session);
			break;
		case ACT_MODULEFIELD_TEST:
			procAdmModuleFieldTest (user, req, res, session);
			break;
		case ACT_MODULEFIELD_SAVE:
			procAdmModuleFieldSave(user, req, res, session);
			break;			
		default:
			forward("MISC_not_available.jsp", req, res);
			break;
		}
	}

	private void reqAdmModMainMenu(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		String userID = req.getParameter("USERID")!=null ? req.getParameter("USERID"): "";
		try {
			req.setAttribute("userID", userID);
			PageToCall = "/pages/reporter/s/LRGA200_maint_module_main_menu.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}
	
	private void reqAdmModModuleList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		String userID = req.getParameter("USERID")!=null ? req.getParameter("USERID"): "";
		try {
			req.setAttribute("userID", userID);
			PageToCall = "/pages/reporter/s/LRGA200_maint_module_list.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}
	
	private void procAdmModModuleList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		String textSearch = req.getParameter("textSearch")!=null ? req.getParameter("textSearch").trim().toUpperCase() : "";
		String searchBy = req.getParameter("searchBy")!=null ? req.getParameter("searchBy"): "";

		LRGA20001 msg = new LRGA20001();
		msg.setTextSearch(textSearch);
		msg.setSearchBy(searchBy);
		
		try {
			
			if (searchBy.equals("N"))
				msg.setModuleList(ModuleDAO.getInstance().getModulesByCode(textSearch));
			else
				msg.setModuleList(ModuleDAO.getInstance().getModulesByDescription(textSearch));
			
			req.setAttribute("msg", msg);			
			PageToCall = "/pages/reporter/s/LRGA200_maint_module_list.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}		
	
	private void reqAdmModModuleMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		LRGA20002 msg = new LRGA20002();
		int idMod = Integer.parseInt(req.getParameter("ID_MOD"));
		try {
			
			msg.setModule(ModuleDAO.getInstance().getModule(idMod));
			msg.setModuleFieldList(ModuleFieldDAO.getInstance().getModuleFields(idMod));
			
			req.setAttribute("msg", msg);
			session.removeAttribute("newModuleFieldDTO");
			PageToCall = "/pages/reporter/s/LRGA200_maint_module.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}

	private void reqAdmModuleNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		LRGA20002 msg = new LRGA20002();
		
		try {
			if (session.getAttribute("newModuleDTO") != null)
				msg.setModule((ModuleDTO)session.getAttribute("newModuleDTO"));
			else
			{
				ModuleDTO modDTO = new ModuleDTO();
				msg.setModule(modDTO);
			}
			
			req.setAttribute("msg", msg);
			PageToCall = "/pages/reporter/s/LRGA200_new_module.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}				
	
	
	private void procAdmModuleSave(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		ModuleDTO moduleUpd = new ModuleDTO();
		int idmod = Integer.parseInt(req.getParameter("ID_MOD"));
		
		moduleUpd.setID_MOD(idmod);
		moduleUpd.setMODCOD(req.getParameter("MODCOD"));
		moduleUpd.setMODDSC(req.getParameter("MODDSC").toUpperCase());
		moduleUpd.setENTSTR(req.getParameter("ENTSTR").toUpperCase());
		moduleUpd.setRELSTR(req.getParameter("RELSTR"));
		moduleUpd.setPUBMOD(req.getParameter("PUBMOD"));
		moduleUpd.setACTIVE(req.getParameter("ACTIVE"));
		moduleUpd.setCREUSR(user.getH01USR());
		
		ELEERRMessage error = moduleUpd.validate(); 
		
		if (!error.getERRNUM().equals("0")) {
			session.setAttribute("newModuleDTO", moduleUpd);
			session.setAttribute("error", error);
			redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=35", res);
		} 
		else {
			String fields = req.getParameter("fieldList").toUpperCase();
			
			try {
				error = ModuleDAO.getInstance().testModuleAccess(moduleUpd, fields);
			
				if (error.getERWRNG().equals("T")) {
					idmod = ModuleDAO.getInstance().saveModule(moduleUpd);
					session.removeAttribute("error");
					redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=30&ID_MOD=" + idmod, res);
				}
				else {
					session.setAttribute("error", error);
					session.setAttribute("newModuleDTO", moduleUpd);
					redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=35", res);
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
			  	throw new RuntimeException("Socket Communication Error");
			}
		}	
	}	
	
	
	private void reqAdmModModuleFieldNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		LRGA20003 msg = new LRGA20003();
		int idMod = Integer.parseInt(req.getParameter("ID_MOD"));
		
		try {
			msg.setModule(ModuleDAO.getInstance().getModule(idMod));
			if (session.getAttribute("newModuleFieldDTO") != null)
				msg.setModuleField((ModuleFieldDTO)session.getAttribute("newModuleFieldDTO"));
			else
			{
				ModuleFieldDTO mfDTO = new ModuleFieldDTO(idMod);
				msg.setModuleField(mfDTO);
			}
			
			req.setAttribute("msg", msg);
			PageToCall = "/pages/reporter/s/LRGA200_new_modulefield.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}				
	
	private void reqAdmModModuleFieldMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		LRGA20003 msg = new LRGA20003();
		int idMfl = Integer.parseInt(req.getParameter("idmfl"));
		
		try {
			msg.setModuleField(ModuleFieldDAO.getInstance().getModuleField(idMfl));
			
			req.setAttribute("msg", msg);
			PageToCall = "/pages/reporter/s/LRGA200_maint_modulefield.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}			
	
	private void procAdmModuleMaintReturn(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {
	
		redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=20", res);
		
	}
	
	private void procAdmModuleNewTest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		ModuleDTO moduleUpd = new ModuleDTO();
		
		int idmod = Integer.parseInt(req.getParameter("ID_MOD"));
		moduleUpd.setID_MOD(idmod);
		moduleUpd.setMODDSC(req.getParameter("MODDSC").toUpperCase());
		moduleUpd.setENTSTR(req.getParameter("ENTSTR").toUpperCase());
		moduleUpd.setRELSTR(req.getParameter("RELSTR").toUpperCase());
		moduleUpd.setACTIVE(req.getParameter("ACTIVE").toUpperCase());
		String fields = req.getParameter("fieldList").toUpperCase();
		
		ELEERRMessage error = moduleUpd.validate();
		
		session.setAttribute("newModuleDTO", moduleUpd);
		
		if (!error.getERRNUM().equals("0")) {
			session.setAttribute("error", error);
			redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=35", res);
		} 		
		else {
			try {		
				error = ModuleDAO.getInstance().testModuleAccess(moduleUpd, fields);
				session.setAttribute("error", error);
				redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=35", res);
			}
			catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
			  	throw new RuntimeException("Socket Communication Error");
			}
		}		
	}	
	
	private void procAdmModuleMaintTest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		ModuleDTO moduleUpd = new ModuleDTO();
		
		int idmod = Integer.parseInt(req.getParameter("ID_MOD"));
		moduleUpd.setID_MOD(idmod);
		moduleUpd.setMODDSC(req.getParameter("MODDSC").toUpperCase());
		moduleUpd.setENTSTR(req.getParameter("ENTSTR").toUpperCase());
		moduleUpd.setRELSTR(req.getParameter("RELSTR").toUpperCase());
		moduleUpd.setACTIVE(req.getParameter("ACTIVE").toUpperCase());
		String fields = req.getParameter("fieldList").toUpperCase();
		
		ELEERRMessage error = moduleUpd.validate();
		
		if (!error.getERRNUM().equals("0")) {
			session.setAttribute("error", error);
			redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=30&ID_MOD=" + idmod, res);
		} 		
		else {
			try {		
				error = ModuleDAO.getInstance().testModuleAccess(moduleUpd, fields);
				session.setAttribute("error", error);
				redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=30&ID_MOD=" + idmod, res);
			}
			catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
			  	throw new RuntimeException("Socket Communication Error");
			}
		}		
	}
	
	private void procAdmModuleMaintSave(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		ModuleDTO moduleUpd = new ModuleDTO();
		int idmod = Integer.parseInt(req.getParameter("ID_MOD"));
		moduleUpd.setID_MOD(idmod);
		moduleUpd.setMODDSC(req.getParameter("MODDSC").toUpperCase());
		moduleUpd.setENTSTR(req.getParameter("ENTSTR").toUpperCase());
		moduleUpd.setRELSTR(req.getParameter("RELSTR").toUpperCase());
		moduleUpd.setPUBMOD(req.getParameter("PUBMOD"));
		moduleUpd.setACTIVE(req.getParameter("ACTIVE"));
		String fields = req.getParameter("fieldList").toUpperCase();
		
		if (fields.trim().equals(""))
			fields = "*";
		
		ELEERRMessage error = ModuleDAO.getInstance().testModuleAccess(moduleUpd, fields);
	
		if (error.getERWRNG().equals("T"))
			error = ModuleDAO.getInstance().editModule(moduleUpd);
		
		session.setAttribute("error", error);
		redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=30&ID_MOD=" + idmod, res);

	}
	
	private void procAdmModuleFieldEdit(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		ModuleFieldDTO moduleFieldUpd = new ModuleFieldDTO();
		int idMfl = Integer.parseInt(req.getParameter("ID_MFL"));
		int idMod = Integer.parseInt(req.getParameter("ID_MOD"));
		moduleFieldUpd.setID_MFL(idMfl);
		moduleFieldUpd.setID_MOD(idMod);
		moduleFieldUpd.setFLDDSC(req.getParameter("FLDDSC").toUpperCase());
		moduleFieldUpd.setFLDLBL(req.getParameter("FLDLBL").toUpperCase());
		moduleFieldUpd.setDATTYP(req.getParameter("DATTYP"));
		moduleFieldUpd.setAWHERE(req.getParameter("AWHERE"));
		moduleFieldUpd.setAGRPBY(req.getParameter("AGRPBY"));
		moduleFieldUpd.setAGRFUN(req.getParameter("AGRFUN"));
		moduleFieldUpd.setALSTNG(req.getParameter("ALSTNG"));
		moduleFieldUpd.setMNDTRY(req.getParameter("MNDTRY"));
		moduleFieldUpd.setACTIVE(req.getParameter("ACTIVE"));
		
		ELEERRMessage error = ModuleFieldDAO.getInstance().editModuleField(moduleFieldUpd);
	
		session.setAttribute("error", error);
		redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=30&ID_MOD=" + idMod, res);

	}			
	
	private void procAdmModuleFieldTest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		ModuleDTO moduleUpd = new ModuleDTO();
		ModuleFieldDTO moduleFieldUpd = new ModuleFieldDTO();
		int idmod = Integer.parseInt(req.getParameter("ID_MOD"));
		moduleUpd.setID_MOD(idmod);
		moduleUpd.setMODDSC(req.getParameter("MODDSC"));
		moduleUpd.setENTSTR(req.getParameter("ENTSTR"));
		moduleUpd.setRELSTR(req.getParameter("RELSTR"));
		String fields = req.getParameter("FLDDSC").toUpperCase();
		
		moduleFieldUpd.setID_MOD(idmod);
		moduleFieldUpd.setFLDDSC(req.getParameter("FLDDSC").toUpperCase());
		moduleFieldUpd.setFLDLBL(req.getParameter("FLDLBL").toUpperCase());
		moduleFieldUpd.setDATTYP(req.getParameter("DATTYP"));
		moduleFieldUpd.setAWHERE(req.getParameter("AWHERE"));
		moduleFieldUpd.setAGRPBY(req.getParameter("AGRPBY"));
		moduleFieldUpd.setAGRFUN(req.getParameter("AGRFUN"));
		moduleFieldUpd.setALSTNG(req.getParameter("ALSTNG"));
		moduleFieldUpd.setMNDTRY(req.getParameter("MNDTRY"));
		moduleFieldUpd.setACTIVE(req.getParameter("ACTIVE"));		
		
		ELEERRMessage error = moduleFieldUpd.validate(); 
		
		if (!error.getERRNUM().equals("0")) {
			session.setAttribute("newModuleFieldDTO", moduleFieldUpd);
			session.setAttribute("error", error);
			redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=42&ID_MOD=" + idmod, res);
		} 		
		else {
			try {
				error = ModuleFieldDAO.getInstance().testModuleFieldAccess(moduleUpd, fields);
				session.setAttribute("newModuleFieldDTO", moduleFieldUpd);
				session.setAttribute("error", error);
				
				redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=42&ID_MOD=" + idmod, res);
			}
			catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
			  	throw new RuntimeException("Socket Communication Error");
			}
		}
	}
	
	private void procAdmModuleFieldSave(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		ModuleFieldDTO moduleFieldUpd = new ModuleFieldDTO();
		int idMfl = Integer.parseInt(req.getParameter("ID_MFL"));
		int idmod = Integer.parseInt(req.getParameter("ID_MOD"));
		
		moduleFieldUpd.setID_MFL(idMfl);
		moduleFieldUpd.setID_MOD(idmod);
		moduleFieldUpd.setFLDDSC(req.getParameter("FLDDSC").toUpperCase());
		moduleFieldUpd.setFLDLBL(req.getParameter("FLDLBL").toUpperCase());
		moduleFieldUpd.setDATTYP(req.getParameter("DATTYP"));
		moduleFieldUpd.setAWHERE(req.getParameter("AWHERE"));
		moduleFieldUpd.setAGRPBY(req.getParameter("AGRPBY"));
		moduleFieldUpd.setAGRFUN(req.getParameter("AGRFUN"));
		moduleFieldUpd.setALSTNG(req.getParameter("ALSTNG"));
		moduleFieldUpd.setMNDTRY(req.getParameter("MNDTRY"));
		moduleFieldUpd.setACTIVE(req.getParameter("ACTIVE"));
		moduleFieldUpd.setCREUSR(user.getH01USR());
		
		ELEERRMessage error = moduleFieldUpd.validate(); 
		
		if (!error.getERRNUM().equals("0")) {
			session.setAttribute("newModuleFieldDTO", moduleFieldUpd);
			session.setAttribute("error", error);
			redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=42&ID_MOD=" + idmod, res);
		} 
		else {
			ModuleDTO moduleUpd = new ModuleDTO();
			moduleUpd.setID_MOD(idmod);
			moduleUpd.setMODDSC(req.getParameter("MODDSC"));
			moduleUpd.setENTSTR(req.getParameter("ENTSTR"));
			moduleUpd.setRELSTR(req.getParameter("RELSTR"));
			moduleUpd.setPUBMOD(req.getParameter("PUBMOD"));
			moduleUpd.setACTIVE(req.getParameter("ACTIVE"));
			String fields = req.getParameter("FLDDSC").toUpperCase();
			
			try {
				error = ModuleFieldDAO.getInstance().testModuleFieldAccess(moduleUpd, fields);
			
				if (error.getERWRNG().equals("T")) {
					ModuleFieldDAO.getInstance().saveModuleField(moduleFieldUpd);
					session.removeAttribute("error");
					redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=30&ID_MOD=" + idmod, res);
				}
				else {
					session.setAttribute("error", error);
					session.setAttribute("newModuleFieldDTO", moduleFieldUpd);
					redirect("com.datapro.eibs.reporter.controller.JSLRGA200?SCREEN=42&ID_MOD=" + idmod, res);
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
			  	throw new RuntimeException("Socket Communication Error");
			}
		}	
	}
}

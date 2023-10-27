package datapro.eibs.general;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.facade.FAReports;
import com.datapro.eibs.reports.vo.IFSFILES;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0900DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */

public class JSEWD0900 extends JSEIBSServlet {

	protected static final int R_LIST   = 1;
	protected static final int A_LIST   = 2;
	protected static final int R_ENGINE_REPORT = 10;
	protected static final int A_CRYSTAL_REPORT = 11;
	protected static final int A_JASPER_REPORT = 12;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			// Request
			case R_LIST :
				procReqList(user, req, res, session);
				break;
				// Actions
			case A_LIST :
				procActionList(user, req, res, session);
				break;
			case R_ENGINE_REPORT :
				procReqEngineReport(user, req, res, session);
				break;
			case A_CRYSTAL_REPORT :
				procActCrystalReport(user, req, res, session);
				break;
			case A_JASPER_REPORT :
				procActJasperReport(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}
	
	private void procActCrystalReport(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		OutputStream output = null;
		
		try {
			String datasource = req.getParameter("DATASOURCE");
			String tname = req.getParameter("TNAME");
			String format = req.getParameter("FORMAT");
			if (format == null) {
				format = "";
			}
			String p = "";
			Enumeration enu = req.getParameterNames();
			while (enu.hasMoreElements()) {
				String parameter = (String) enu.nextElement();
				if (parameter.indexOf("RPTPARAM_") == 0) {
					p += "&" + parameter + "=" + req.getParameter(parameter);
				}
			} 
			
			String http = "/eibs_rpt_eng/servlet/com.datapro.eibs.servlet.CrystalReportViewerServlet?" +
					"DATASOURCE=" + datasource +
					"&TNAME=" + tname +
					"&FORMAT=" + format +
					p;
			res.sendRedirect(http);
			/*
			URL url = new URL(http);			
			res.reset();
			output = res.getOutputStream();
			int size = openConnection(url, output);			
			res.setContentType("application/pdf");
			res.setContentLength(size);
			output.flush();
			*/
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (output != null)	output.close();
		}
	}

	private void procReqEngineReport(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String name = req.getParameter("Name");
		if (name == null) {
			forward("EWD0900_report_parameters.jsp", req, res);			
		} else {
			forward("EWD0900_" + name + ".jsp", req, res);
		}
	}
	
	private void procActJasperReport(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		OutputStream output = null;
		
		try {
			String datasource = req.getParameter("DATASOURCE");
			String tname = req.getParameter("TNAME");
			String format = req.getParameter("FORMAT");
			if (format == null) {
				format = "";
			}
			String p = "";
			Enumeration enu = req.getParameterNames();
			while (enu.hasMoreElements()) {
				String parameter = (String) enu.nextElement();
				if (parameter.indexOf("RPTPARAM_") == 0) {
					p += "&" + parameter + "=" + req.getParameter(parameter);
				}
			} 
			String http = "/servlet/datapro.eibs.reports.JasperReportViewer?" +
					"reportDataSource=" + datasource +
					"&reportName=" + tname +
					"&reportFormat=" + format +
					p;
			res.sendRedirect(srctx + http);
			/*
			URL url = new URL(http);			
			res.reset();
			output = res.getOutputStream();
			int size = openConnection(url, output);			
			res.setContentType("application/pdf");
			res.setContentLength(size);
			output.flush();
			*/
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (output != null)	output.close();
		}
	}

	private boolean isReportReady(EWD0900DSMessage msg, HttpServletResponse res) throws ServletException, IOException {
		
		boolean result = false;
		System.out.println("Connecting to IBS via jdbc.cnx.driver.eibs-server...");
		BufferedOutputStream output = null;
		FAReports facade = null;
		try {
			facade = new FAReports();
			String reportUser = msg.getSWDSRD().endsWith("SOCKETS") ? msg.getSWDNAM() : msg.getSWDSRD();
			IFSFILES vo = facade.getIFSFiles(msg.getSWDFIL(), reportUser, msg.getSWDNUM(), msg.getBigDecimalSWDPLN());
			
			if (vo.getBINFILE() != null && vo.getFEXT() != null) {
				byte buf[] = vo.getBINFILE();
				String type = vo.getFEXT().trim().toLowerCase();
				String name = msg.getSWDFIL() + "." + type;
				sendResponse(res, buf, name);
				result = true;
			}
				
		} catch (ItemNotFoundException e) {
			result = false;
		} catch (FacadeException e) {
			e.printStackTrace();
			flexLog("FacadeException ocurred. Exception = " + e.getMessage());
			throw new ServletException(e);
		} finally {
			if (output != null) output.close();
		}
		return result;
	}
	
	private void procActionList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		JBObjList jbList = (JBObjList) session.getAttribute("EWD0900Help");
		jbList.initRow();
		int row = 0;
		int opt = 0;
		try {
			opt = Integer.parseInt(req.getParameter("opt"));
		} catch (Exception e) {
			opt = 2;
		}
		if (opt < 3) {
			try {
				row = Integer.parseInt(req.getParameter("ROW"));
			}catch (Exception e){
				row = jbList.getFirstRec();
			}
		}
		jbList.setCurrentRow(row);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0900", req);
			EWD0900DSMessage msg = (EWD0900DSMessage) jbList.getRecord();
			
			if ("*OPEN".equals(msg.getSWDSTS().trim())) {
				ELEERRMessage msgError = new ELEERRMessage();
				msgError.setERWF01("Y");
				addError(msgError, "", "", 
					"Su reporte aun no esta listo para ser consultado.<br>Por favor tenga paciencia y espere." +
					"<br>!!NO INTENTE GENERARLO DE NUEVO!!.");
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			} else {
				EWD0900DSMessage msgToSend = new EWD0900DSMessage();
				populate(msg, msgToSend);
				
				if (opt > 1) { 
					msgToSend.setRWDTYP("D");  
				} else {
					msgToSend.setRWDTYP("I");
				}	
			
				if (opt < 2) {
					if (!isReportReady(msgToSend, res)) {
						mp.sendMessage(msgToSend);
						
						ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
						msgToSend = (EWD0900DSMessage) mp.receiveMessageRecord("EWD0900DS");
						boolean isNotError = !mp.hasError(msgError);
						
						if (isNotError) {
							session.setAttribute("REPORT", msg);
							forward("MISC_report_wait.jsp?URL='" + req.getContextPath() 
								+ "/servlet/datapro.eibs.tools.JSPDFReport?SCREEN=2'", req, res);
						} else {
							session.setAttribute("error", msgError);
							forward("error_viewer.jsp", req, res);
						}
					}
				} else {
					ELEERRMessage msgError = null;
					boolean isNotError = true;
					
					switch (opt) {
						case 2:
							mp.sendMessage(msgToSend);
							msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
							msgToSend = (EWD0900DSMessage) mp.receiveMessageRecord("EWD0900DS");
							isNotError = !mp.hasError(msgError);
							break;
						case 3:
							mp.sendMessage(msgToSend);
							msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
							msgToSend = (EWD0900DSMessage) mp.receiveMessageRecord("EWD0900DS");
							while (jbList.getNextRow()) {
								msgToSend = (EWD0900DSMessage) jbList.getRecord();
								msgToSend.setRWDTYP("D"); 
								mp.sendMessage(msgToSend);
								msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
								msgToSend = (EWD0900DSMessage) mp.receiveMessageRecord("EWD0900DS");
							}
							break;
					}
					
					if (isNotError) {
						procReqList(user, req, res, session);
					} else {
						session.setAttribute("error", msgError);
						forward("EWD0900_sel_spool.jsp", req, res);
					}
				}
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String PageToCall = "";
		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0900", req);
			EWD0900DSMessage msg = (EWD0900DSMessage) mp.getMessageRecord("EWD0900DS", user.getH01USR(), "");
			try { //From Pos
				msg.setRWDFRC(req.getParameter("Pos"));
			} catch (Exception e) {
				//msg.setRWDFRC("");
			}
			msg.setRWDTYP("L");
			msg.setRWDUSR(user.getH01USR()); // User
			
			mp.sendMessage(msg);
			
			JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			
			if (mp.hasError(list)) {
				list.initRow();
				list.getNextRow();
				msgError = (ELEERRMessage) list.getRecord();
				PageToCall = "error_viewer.jsp";
			} else {
				PageToCall = "EWD0900_sel_spool.jsp";
			}
		
			session.setAttribute("EWD0900Help", list);			
			session.setAttribute("error", msgError);
			forward(PageToCall, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

}

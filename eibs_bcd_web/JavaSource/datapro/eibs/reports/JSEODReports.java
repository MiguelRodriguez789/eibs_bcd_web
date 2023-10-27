package datapro.eibs.reports;

/**
 * @author: fhernandez
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.constants.EOD;
import com.datapro.eibs.facade.FASecurity;
import com.datapro.eibs.security.key.USRRPTKEYViewEODPDF;
import com.datapro.eibs.security.key.USRRPTKEYViewEndOfDayReports;
import com.datapro.eibs.security.key.USRRPTKEYViewGeneratedOnDates; 
import com.datapro.eibs.security.key.USRRPTKEYViewReports;
import com.datapro.eibs.setup.vo.CNTRLCNTExtRunDate;
import com.datapro.generic.beanutil.BeanList;
import com.datapro.generic.beanutil.DynamicForm;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.tools.xml.XMLSelectOptions;

public class JSEODReports extends JSEIBSServlet {
	
	private static final long serialVersionUID = 2156830153126980770L;
	
	private static final int R_ENTER_REPORTS				= 1;
	private static final int R_PREVIOUS_RUN_DATE_REPORTS 	= 2;
	private static final int R_REPROCCESS_REPORTS 			= 3;
	
	private static final int A_ENTER_REPORTS				= 10;
	private static final int A_TARGET_REPORTS				= 11;

	private static final int A_FILTER_MODULES				= 100;
	private static final int A_FILTER_REPORTS				= 101;

	protected void processRequest(ESS0030DSMessage user,
		HttpServletRequest req, HttpServletResponse res,
		HttpSession session, int screen) throws ServletException,
		IOException {

		switch (screen) {
			case R_ENTER_REPORTS:
				procReqEnter(user, req, res, session);
				break;
			case R_PREVIOUS_RUN_DATE_REPORTS:
				procReqPreviousRunDate(user, req, res, session);
				break;
			case R_REPROCCESS_REPORTS:
				procReqReproccess(user, req, res, session);
				break;
			case A_ENTER_REPORTS:
				procActionEnter(user, req, res, session);
				break;
			case A_TARGET_REPORTS:
				procActionTargetReports(user, req, res, session);
				break;
			case A_FILTER_MODULES:
				procAsyncModules(user, req, res, session);
				break;
			case A_FILTER_REPORTS:
				procAsyncReports(user, req, res, session);
				break;				
			default:
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}
	
	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		ReportsHeader reportsHeader = new ReportsHeader();
		reportsHeader.setHistory(true);
		session.setAttribute("reportsHeader", reportsHeader);
		session.removeAttribute("modulesList");
		session.removeAttribute("reportsSelection");
		procActionTargetReports(user, req, res, session);
	}
	
	private void procReqPreviousRunDate(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		ReportsHeader reportsHeader = new ReportsHeader();
		session.setAttribute("reportsHeader", reportsHeader);
		session.removeAttribute("modulesList");
		session.removeAttribute("reportsSelection");
		procActionTargetReports(user, req, res, session);
	}
	
	private void procReqReproccess(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		ReportsHeader reportsHeader = new ReportsHeader();
		reportsHeader.setReprocess(true);
		if (req.getParameter("IBSPER") == null) {
			reportsHeader.setIBSPER(EOD.END_OF_MONTH_REPROCESS);
		} else {
			reportsHeader.setIBSPER(req.getParameter("IBSPER"));
		}
		session.setAttribute("reportsHeader", reportsHeader);
		session.removeAttribute("modulesList");
		session.removeAttribute("reportsSelection");
	
		procActionTargetReports(user, req, res, session);
	}	
	
	private void procActionEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		ReportsHeader reportsHeader = (ReportsHeader) session.getAttribute("reportsHeader");
		try {			
			DynamicForm form = new DynamicForm();
			form.setBeanFromPage(req, reportsHeader);
			USRRPTKEYViewReports key = null;
			if (reportsHeader.isHistory()) {
				key = new USRRPTKEYViewEODPDF();
			} else if (reportsHeader.isReprocess()) {
				key = new USRRPTKEYViewGeneratedOnDates();
			} else {
				key = new USRRPTKEYViewEndOfDayReports();
			}
			populate(reportsHeader, key);
			
			FASecurity faSecurity = new FASecurity();
			faSecurity.setSessionUser(user);
			BeanList list = faSecurity.getEodGeneratedReports(key);
			
			session.setAttribute("reportsList", convertList(list, ReportsData.class));
			
			if (session.getAttribute("modulesList") == null) 
				procReqModules(faSecurity, req, res, session);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException("", e);
		}
		session.setAttribute("reportsHeader", reportsHeader);		
		forward("EODPDF_user_reports_list.jsp", req, res);
	}
	
	private void procActionTargetReports(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		ReportsHeader reportsHeader = (ReportsHeader) session.getAttribute("reportsHeader");

		try {
			DynamicForm form = new DynamicForm();
			form.setBeanFromPage(req, reportsHeader);
			USRRPTKEYViewReports key = null;
			FASecurity faSecurity = new FASecurity();
			faSecurity.setSessionUser(user);
			if (reportsHeader.isReprocess()) {
				CNTRLCNTExtRunDate runDate = null;
				if (EOD.END_OF_MONTH_REPROCESS.equals(reportsHeader.getIBSPER())) {
					runDate = faSecurity.getPreviosEndOfMonth();
				} else {
					runDate = faSecurity.getPreviosEndOfYear();
				}
				reportsHeader.setFROMDTY(runDate.getCNTRDY().toString());
				reportsHeader.setFROMDTM(runDate.getCNTRDM().toString());
				reportsHeader.setFROMDTD(runDate.getCNTRDD().toString());
				reportsHeader.setTODTY(runDate.getCNTRDY().toString());
				reportsHeader.setTODTM(runDate.getCNTRDM().toString());
				reportsHeader.setTODTD(runDate.getCNTRDD().toString());	
				key = new USRRPTKEYViewGeneratedOnDates();
			} else {
				key = new USRRPTKEYViewEndOfDayReports();
			}
			populate(reportsHeader, key);
		
			BeanList list = faSecurity.getEodGeneratedReports(key);
			if (reportsHeader.isHistory()) {
				//TODO Place Previous Rundate values on ESS0030DSMessage
				CNTRLCNTExtRunDate runDate = faSecurity.getRunDate();
				reportsHeader.setFROMDTY(runDate.getCNTPDY().toString());
				reportsHeader.setFROMDTM(runDate.getCNTPDM().toString());
				reportsHeader.setFROMDTD(runDate.getCNTPDD().toString());
				reportsHeader.setTODTY(runDate.getCNTPDY().toString());
				reportsHeader.setTODTM(runDate.getCNTPDM().toString());
				reportsHeader.setTODTD(runDate.getCNTPDD().toString());	
			}
			session.setAttribute("reportsList", convertList(list, ReportsData.class));
			
			if (session.getAttribute("modulesList") == null) 
				procReqModules(faSecurity, req, res, session);				
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException("", e);
		}
		session.setAttribute("reportsHeader", reportsHeader);		
		forward("EODPDF_user_reports_list.jsp", req, res);
	}
	
	private JBObjList procReqModules(FASecurity faSecurity, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		ReportsHeader reportsHeader = (ReportsHeader) session.getAttribute("reportsHeader");
	
		JBObjList moduleList = new JBObjList();
		try {
			BeanList list = faSecurity.getUserReportsModules(faSecurity.getUser(),
					null);//reportsHeader.getIBSPER());
			moduleList = (JBObjList) convertList(list, ReportsDetail.class);
	
			session.setAttribute("modulesList", moduleList);
			
		} catch (Exception e) {
			throw new ServletException("", e);
		}
		return moduleList;
	}
	
	private void procAsyncModules(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		XMLSelectOptions xmlResponse = null;
		try {
			FASecurity faSecurity = new FASecurity();
			faSecurity.setSessionUser(user);
			JBObjList moduleList = procReqModules(faSecurity, req, res, session);

			xmlResponse = new XMLSelectOptions("IBSMOD", "reqReports()");
			moduleList.initRow();
			while (moduleList.getNextRow()) {
				ReportsHeader bean = (ReportsHeader) moduleList.getRecord();
				xmlResponse.addOption(bean.getIBSMOD(),
						(bean.getIBSDSC() == null || bean.getIBSDSC().equals("")) ? 
								bean.getIBSMOD() : bean.getIBSDSC());
			}
			
		} catch (Exception e) {
			throw new ServletException("", e);
		}
		sendXMLResponse(res, xmlResponse);
	}
	
	private void procAsyncReports(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		ReportsHeader reportsHeader = (ReportsHeader) session.getAttribute("reportsHeader");
		reportsHeader.setIBSMOD(req.getParameter("IBSMOD"));
		
		XMLSelectOptions xmlResponse = null;
		try {
			
			FASecurity faSecurity = new FASecurity();
			faSecurity.setSessionUser(user);
			BeanList list = faSecurity.getUserReports(
					user.getH01USR(), null, reportsHeader.getIBSMOD());
			
			xmlResponse = new XMLSelectOptions("EDPRPN", "reqReports()");
			JBObjList reportsList = (JBObjList) convertList(list, ReportsDetail.class);
	
			reportsList.initRow();
			while (reportsList.getNextRow()) {
				ReportsDetail bean = (ReportsDetail) reportsList.getRecord();
				xmlResponse.addOption(bean.getIBSRPN(),
						(bean.getIBSDSC() == null || bean.getIBSDSC().equals("")) ? 
								bean.getIBSRPN() : bean.getIBSRPN() + " - " + bean.getIBSDSC());
			}
			session.setAttribute("reportsSelection", reportsList);
			
		} catch (Exception e) {
			throw new ServletException("", e);
		}
		sendXMLResponse(res, xmlResponse);
	}
}

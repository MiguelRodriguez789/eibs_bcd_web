package datapro.eibs.security;

import java.io.IOException;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.constants.Reports;
import com.datapro.eibs.facade.FAReports;
import com.datapro.eibs.facade.FASecurity;
import com.datapro.eibs.reports.key.IBSRPTKEYViewModules;
import com.datapro.eibs.reports.vo.IBSRPTViewModules;
import com.datapro.eibs.security.key.GRPRPTKEY;
import com.datapro.eibs.security.key.GRPRPTKEYViewReportsChecked;
import com.datapro.eibs.security.key.USRRPTKEY;
import com.datapro.eibs.security.key.USRRPTKEYViewReportsChecked;
import com.datapro.eibs.security.vo.GRPRPT;
import com.datapro.eibs.security.vo.USRRPT;
import com.datapro.eibs.security.vo.USRRPTViewReportsChecked;
import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.ESS0030DSMessage;

/**
 * @author fhernandez
 */
public class JSUsersAccess extends JSUserTree {

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case 1 :
				procReqUsers(user, req, res, session);
				break;
			case 3 :
				procReqUserReports(user, req, res, session);
				break;
			case 4 :
				procActReports(user, req, res, session);
				break;
			case 5 :
				procActAllReports(user, req, res, session);
				break;	
			case 6 :
				procReqSearchReport(user, req, res, session);
				break;				
			default :
				super.processRequest(user, req, res, session, screen);
				break;
		}
	}
	
	private void procReqUsers(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		forward("Users_reports_tree.jsp", req, res);
	}

	private void addReportNode(StringBuffer bf, IBSRPTViewModules bModule){
		//Adding report node
		String id = null;
		String description = null;
		String type = null;
		String selected = null;
		if (bModule instanceof USRRPTViewReportsChecked) {
			USRRPTViewReportsChecked object = (USRRPTViewReportsChecked) bModule;
			id = object.getIBSRPN();
			description = object.getIBSRPN() + " - " + object.getIBSDSC();
			type = "".equals(object.getDISABLED()) ? object.getIBSMOD() : object.getDISABLED().toLowerCase();
			selected = object.getCHECKED() == null ? "false" : "true";			
		} else {
			IBSRPTViewModules object = (IBSRPTViewModules) bModule;
			id = object.getIBSMOD();
			description = object.getIBSDSC();
			type = "DM*";
			selected = "null";
		}
		bf.append("\"data\" : \"" + escapeJson(description) + "\"");
		bf.append(", \"attr\" : {");
		bf.append(		"\"id\" : \"" + id + "\"");
		bf.append(		", \"rel\" : \"" + type + "\" ");
		bf.append(", \"selected\" : \"" + selected + "\"");
		if (selected.equals("true")) {
			bf.append(", \"class\" : \"jstree-checked\"");
		} else if (selected.equals("null")) {
			bf.append(", \"class\" : \"jstree-undetermined\"");
		}
		bf.append(		"}");
		if (selected.equals("null")) {
			bf.append(", \"state\" : \"closed\" ");
		}
	}
	
	private IBSRPTViewModules addReport(StringBuffer bf, IBSRPTViewModules bModule, int count){
		//Adding report module
		if (count > 0) 
			bf.append(",\n");
		bf.append("{");
		addReportNode(bf, bModule);
		bf.append("}");
		return bModule;
	}
	
	private IBSRPTViewModules addReports(StringBuffer bf, IBSRPTViewModules bModule, Iterator iterator){
		String module = bModule.getIBSMOD();
		int count = 0;
		do {
			addReport(bf, bModule, count++);
			if (iterator.hasNext()) {
				bModule = (IBSRPTViewModules) iterator.next();
			} else {
				bModule = null;
				break;
			}
		} while (bModule.getIBSMOD().equals(module));
		return bModule;
	}
	
	private IBSRPTViewModules addModules(StringBuffer bf, IBSRPTViewModules bModule, Iterator iterator, int count){
		//Adding module node
		if (count > 0) 
			bf.append(",\n");
		bf.append("{");
		//Adding module 
		IBSRPTViewModules pModule = new IBSRPTViewModules();
		pModule.setIBSMOD(bModule.getIBSMOD());
		addReportNode(bf, pModule);
		
		String module = bModule.getIBSMOD();
		while (bModule != null && module.equals(bModule.getIBSMOD())) {
			bf.append(", \"children\" : [");
			bModule = addReports(bf, bModule, iterator);
			bf.append("]");
		}
		bf.append("}");
		return bModule;
	}

	private String addRoot(String jsonString){
		return "{" +	
		"\"data\":\"Reportes\"" +
		", \"attr\" : {" +
				"\"id\" : \"ALL\"" +
				", \"class\" : \"jstree-undetermined\"" +
				"}" +
		", \"children\":[" + (jsonString == null ? "" : jsonString) + "]" +
		", \"state\" : \"open\" " +
		"}";
	}
	
	private void procReqUserReports(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		String type = req.getParameter("type");
		String module = req.getParameter("module");
		
		StringBuffer bf = new StringBuffer();
		try {
			Iterator iter = null;
			List list = null;
			if (module == null || module.equals("")) {
				//All Reports Or Header
				module = null;
				list = new FAReports().getReportsModules();
				iter = list.listIterator();
				while (iter.hasNext()) {
					IBSRPTViewModules object = (IBSRPTViewModules) iter.next();
					String description = (String) Reports.REPORTS_MODULES.get(object.getIBSMOD());
					if (description == null) 
						description = object.getIBSMOD();
					object.setIBSDSC(description);
				}
				Collections.sort(list);
			} else if (module.equals("DM*")) {
				FASecurity faSecurity = new FASecurity();
				faSecurity.setSessionUser(user);
				USRRPTKEYViewReportsChecked key = null;
				if ("G".equals(type)) {
					key = new GRPRPTKEYViewReportsChecked();
				} else {
					key = new USRRPTKEYViewReportsChecked();
				}
				key.setUSRUID(req.getParameter("user"));
				key.setIBSMOD(req.getParameter("id"));
				key.setIBSRPN(req.getParameter("report"));
				list = (List) faSecurity.getUserAccessToReports(key).getList();
			}

			int row = 0;
			iter = list.listIterator();
			while (iter.hasNext()) {
				addReport(bf, (IBSRPTViewModules) iter.next(), row++);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String jsonString = null;
		if (module == null || module.equals("HM*")) {
			jsonString = addRoot(bf.toString());
		} else {
			jsonString = bf.toString();
		}
		sendJSONResponse(res, "[" + jsonString + "]");
	}

	
	private void procActReports(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		try {
			FASecurity faSecurity = new FASecurity();
			
			String type = req.getParameter("type");
			String userId = req.getParameter("user");
			String added = req.getParameter("added");
			if (added != null) {
				BeanList addedList = new BeanList(); 
				StringTokenizer token = new StringTokenizer(added, ",");
				if ("G".equals(type)) {
					while (token.hasMoreElements()) {
						GRPRPT bean = new GRPRPT();
						bean.setUSRUID(userId);
						bean.setUSRRPN(token.nextElement().toString());
						addedList.addRow(bean);
					}
				} else {
					while (token.hasMoreElements()) {
						USRRPT bean = new USRRPT();
						bean.setUSRUID(userId);
						bean.setUSRRPN(token.nextElement().toString());
						addedList.addRow(bean);
					}
				}
				faSecurity.addAccessToReports(addedList, type);
			}
			String removed = req.getParameter("removed");
			if (removed != null) {
				BeanList removedList = new BeanList();
				StringTokenizer token = new StringTokenizer(removed, ",");
				if ("G".equals(type)) {
					while (token.hasMoreElements()) {
						GRPRPTKEY key = new GRPRPTKEY();
						key.setUSRUID(userId);
						key.setUSRRPN(token.nextElement().toString());
						removedList.addRow(key);
					}
				} else {
					while (token.hasMoreElements()) {
						USRRPTKEY key = new USRRPTKEY();
						key.setUSRUID(userId);
						key.setUSRRPN(token.nextElement().toString());
						removedList.addRow(key);
					}
				}
				faSecurity.removeAccessToReports(removedList, type);
			}
			res.getWriter().println("Transaccion Exitosa");
			
		} catch (Exception e) {
			e.printStackTrace();
			res.getWriter().println(
					"Transaccion Fallida: " + "9999" + "-" + e.getMessage());
		}
	}
	
	private void procActAllReports(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		try {
			FASecurity faSecurity = new FASecurity();
			faSecurity.setSessionUser(user);
			
			faSecurity.addAccessToAllReports(req.getParameter("user"), req.getParameter("type"));
			res.getWriter().println("Transaccion Exitosa");
			
		} catch (Exception e) {
			e.printStackTrace();
			res.getWriter().println(
					"Transaccion Fallida: " + "9999" + "-" + e.getMessage());
		}
	}
	
	private void procReqSearchReport(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		StringBuffer bf = new StringBuffer();
		try {
			FAReports faReports = new FAReports();
			faReports.setSessionUser(user);
			IBSRPTKEYViewModules key = new IBSRPTKEYViewModules();
			key.setIBSRPN(req.getParameter("report"));
			List list = (List) faReports.getReportsModules(key);
	
			bf.append("\"#ALL\"");
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				IBSRPTViewModules bModule = (IBSRPTViewModules) iterator.next();
				bf.append(",\"#" + bModule.getIBSMOD() + "\"");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		sendJSONResponse(res, "[" + bf.toString() + "]");
	}

}

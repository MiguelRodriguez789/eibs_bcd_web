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

import com.datapro.eibs.access.VOSuper;
import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.facade.FASecurity;
import com.datapro.eibs.security.key.WEBMOKEYViewByDescription;
import com.datapro.eibs.security.key.WEBOGKEY;
import com.datapro.eibs.security.key.WEBOUKEY;
import com.datapro.eibs.security.vo.WEBCOViewTreeByUser;
import com.datapro.eibs.security.vo.WEBMO;
import com.datapro.eibs.security.vo.WEBMOViewByDescription;
import com.datapro.eibs.security.vo.WEBOG;
import com.datapro.eibs.security.vo.WEBOU;
import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.ESS0030DSMessage;

public class JSESS0111B extends JSESS0110B {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		case ENTER:
			forward("ESS0111B_user_options.jsp", req, res);
			break;
		// END Entering
		default:
			super.processRequest(user, req, res, session, screen);
			break;
		}
	}

	protected void procReqSearchMenu(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		StringBuffer bf = new StringBuffer();
		try {
			FASecurity facade = new FASecurity();
			facade.setSessionUser(user);
			WEBMOKEYViewByDescription key = new WEBMOKEYViewByDescription();
			key.setCMONDS(req.getParameter("menu"));
			List list = (List) facade.getOptionModules(key);
	
			bf.append("\"#ALL\"");
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				WEBMOViewByDescription bModule = (WEBMOViewByDescription) iterator.next();
				bf.append(",\"#" + bModule.getCMOSID() + "\"");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		sendJSONResponse(res, "[" + bf.toString() + "]");
	}

	protected void procActAllMenu(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		try {
			FASecurity facade = new FASecurity();
			facade.setSessionUser(user);
			
			facade.addAccessToAllOption(req.getParameter("user"), req.getParameter("type"));
			res.getWriter().println("Transaccion Exitosa");
			
		} catch (Exception e) {
			e.printStackTrace();
			res.getWriter().println(
					"Transaccion Fallida: " + "9999" + "-" + e.getMessage());
		}
	}

	protected void procActMenu(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {
		
		String type = req.getParameter("type");
		String userId = req.getParameter("user");
		
		FASecurity facade = new FASecurity();
		facade.setSessionUser(user);
		try {
			String added = req.getParameter("added");
			if (added != null) {
				BeanList addedList = new BeanList(); 
				StringTokenizer token = new StringTokenizer(added, ",");
				if ("G".equals(type)) {
					while (token.hasMoreElements()) {
						String[] submenu = token.nextElement().toString().split("-");
						WEBOG vo = new WEBOG();
						vo.setOGRUSR(userId);
						vo.setOGRSID(submenu[0]);
						vo.setOGRDEN(submenu[1]);
						vo.setOGRLIF(user.getE01LAN().toUpperCase());
						vo.setOGRSEQ("0");
						addedList.addRow(vo);
					}
				} else {
					while (token.hasMoreElements()) {
						String[] submenu = token.nextElement().toString().split("-");
						WEBOU vo = new WEBOU();
						vo.setOUSUSR(userId);
						vo.setOUSSID(submenu[0]);
						vo.setOUSDEN(submenu[1]);
						vo.setOUSLIF(user.getE01LAN().toUpperCase());
						vo.setOUSSEQ("0");
						addedList.addRow(vo);
					}
				}
				facade.addAccessToOption(addedList, type);
			}
			String removed = req.getParameter("removed");
			if (removed != null) {
				BeanList removedList = new BeanList();
				StringTokenizer token = new StringTokenizer(removed, ",");
				if ("G".equals(type)) {
					while (token.hasMoreElements()) {
						String[] submenu = token.nextElement().toString().split("-");
						WEBOGKEY key = new WEBOGKEY();
						key.setOGRUSR(userId);
						key.setOGRSID(submenu[0]);
						key.setOGRDEN(submenu[1]);
						removedList.addRow(key);
					}
				} else {
					while (token.hasMoreElements()) {
						String[] submenu = token.nextElement().toString().split("-");
						WEBOUKEY key = new WEBOUKEY();
						key.setOUSUSR(userId);
						key.setOUSSID(submenu[0]);
						key.setOUSDEN(submenu[1]);
						removedList.addRow(key);
					}
				}
				facade.removeAccessToOption(removedList, type);
			}	
			res.getWriter().println("Transaccion Exitosa");
			
		} catch (FacadeException e) {
			e.printStackTrace();
			res.getWriter().println(
					"Transaccion Fallida: " + "9999" + "-" + e.getMessage());
		}
	}

	protected void addMenuNode(StringBuffer bf, VOSuper bMenu) {
		//Adding report node
		String id = null;
		String description = null;
		String type = null;
		String selected = null;
		if (bMenu instanceof WEBMO) {
			id = ((WEBMO)bMenu).getMOIDEN();
			description = ((WEBMO)bMenu).getMOENDS().trim();
			type = "DM*";
			selected = "null";
		} else {
			id = ((WEBCOViewTreeByUser)bMenu).getCMOSID().trim() + "-" + ((WEBCOViewTreeByUser)bMenu).getCMODEN().trim();
			description = ((WEBCOViewTreeByUser)bMenu).getCMONDS().trim();
			//type = ((WEBCOViewTreeByUser)bMenu).getCMOSID().trim();
			type = ((WEBCOViewTreeByUser)bMenu).getCMORWS().equals("RO") ? "disabled" : "default";
			selected = ((WEBCOViewTreeByUser)bMenu).getCMOSTS().equals("S") ? "true" : "false";
		}
		if (!"<hr/>".equalsIgnoreCase(description)) {
			bf.append("\"data\" : \"" + escapeJson(description) + "\"");
			bf.append(", \"attr\" : {");
			bf.append(		"\"id\" : \"" + id + "\"");
			bf.append(		", \"rel\" : \"" + type + "\" ");
			bf.append(", \"chk\" : \"" + selected + "\"");
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
	}
	
	protected void procReqUserMenu(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String module = req.getParameter("module");
		String usr = req.getParameter("group");
		String type = req.getParameter("type");
		String id = req.getParameter("id");
		
		StringBuffer bf = new StringBuffer();
		
		FASecurity facade = new FASecurity();
		facade.setSessionUser(user);
		try {
			Iterator iter = null;
			List list = null;
			if (module == null || module.equals("")) {
				module = null;
				list = facade.getOptionsMainMenu(user.getE01LAN().toUpperCase());
				Collections.sort(list);
			} else if (module.equals("DM*")) {
				list = facade.getOptionsSubMenu(usr, type, id);
			}
			int row = 0;
			iter = list.listIterator();
			while (iter.hasNext()) {
				addMenu(bf, (VOSuper) iter.next(), row++);
			}
		
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
		
		String jsonString = null;
		if (module == null || module.equals("HM*")) {
			jsonString = addRoot(bf.toString());
		} else {
			jsonString = bf.toString();
		}
		sendJSONResponse(res, "[" + jsonString + "]");
	}

}

package datapro.eibs.security;

import java.io.IOException;
import java.util.Collection;
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
import com.datapro.eibs.security.key.WEBMGRKEY;
import com.datapro.eibs.security.key.WEBMMKEYViewByDescription;
import com.datapro.eibs.security.key.WEBMUSKEY;
import com.datapro.eibs.security.vo.WEBMGR;
import com.datapro.eibs.security.vo.WEBMM;
import com.datapro.eibs.security.vo.WEBMMViewByDescription;
import com.datapro.eibs.security.vo.WEBMMViewTreeByUser;
import com.datapro.eibs.security.vo.WEBMUS;
import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.ESS0030DSMessage;

public class JSESS0110B extends JSUserTree {

	protected static final int ENTER = 1;
	protected static final int LIST_MENU_USER = 3;
	protected static final int UPDATE_MENU_USER = 4;
	protected static final int UPDATE_ALL_MENU_USER = 5;
	protected static final int SEARCH_MENU_USER = 6;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		case ENTER:
			forward("ESS0110B_user_menu.jsp", req, res);
			break;
		case LIST_MENU_USER :
			procReqUserMenu(user, req, res, session);
			break;
		case UPDATE_MENU_USER :
			procActMenu(user, req, res, session);
			break;
		case UPDATE_ALL_MENU_USER :
			procActAllMenu(user, req, res, session);
			break;	
		case SEARCH_MENU_USER :
			procReqSearchMenu(user, req, res, session);
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
			WEBMMKEYViewByDescription key = new WEBMMKEYViewByDescription();
			key.setCMENDS(req.getParameter("menu"));
			List list = (List) facade.getMenuModules(key);
	
			bf.append("\"#ALL\"");
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				WEBMMViewByDescription bModule = (WEBMMViewByDescription) iterator.next();
				bf.append(",\"#" + bModule.getCMMSID() + "\"");
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
			
			facade.addAccessToAllMenu(req.getParameter("user"), req.getParameter("type"));
			res.getWriter().println("Transaccion Exitosa");
			
		} catch (Exception e) {
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
		if (bMenu instanceof WEBMM) {
			id = ((WEBMM)bMenu).getMMIDEN();
			description = ((WEBMM)bMenu).getMMENDS().trim();
			type = "DM*";
			selected = "null";
		} else {
			id = ((WEBMMViewTreeByUser)bMenu).getCMMSID().trim() + "-" + ((WEBMMViewTreeByUser)bMenu).getCMIDEN().trim();
			description = ((WEBMMViewTreeByUser)bMenu).getCMENDS().trim();
			//type = ((WEBMMViewTreeByUser)bMenu).getCMMSID().trim();
			type = ((WEBMMViewTreeByUser)bMenu).getCMIRWS().equals("RO") ? "disabled" : "default";
			selected = ((WEBMMViewTreeByUser)bMenu).getCMISTS().equals("S") ? "true" : "false";			
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
	
	protected VOSuper addMenu(StringBuffer bf, VOSuper bMenu, int count) {
		//Adding report module
		if (count > 0) 
			bf.append(",\n");
		bf.append("{");
		addMenuNode(bf, bMenu);
		bf.append("}");
		return bMenu;
	}
	
	protected String addRoot(String jsonString){
		return "{" +	
		"\"data\":\"Menu\"" +
		", \"attr\" : {" +
				"\"id\" : \"ALL\"" +
				", \"class\" : \"jstree-undetermined\"" +
				"}" +
		", \"children\":[" + (jsonString == null ? "" : jsonString) + "]" +
		", \"state\" : \"open\" " +
		"}";
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
				list = facade.getMainMenuHeader(user.getE01LAN().toUpperCase());
				Collections.sort(list);
			} else if (module.equals("DM*")) {
				list = facade.getMainMenuOptions(usr, type, id);
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
						WEBMGR vo = new WEBMGR();
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
						WEBMUS vo = new WEBMUS();
						vo.setOUSUSR(userId);
						vo.setOUSSID(submenu[0]);
						vo.setOUSDEN(submenu[1]);
						vo.setOUSLIF(user.getE01LAN().toUpperCase());
						vo.setOUSSEQ("0");
						addedList.addRow(vo);
					}
				}
				facade.addAccessToMenu(addedList, type);
			}
			String removed = req.getParameter("removed");
			if (removed != null) {
				BeanList removedList = new BeanList();
				StringTokenizer token = new StringTokenizer(removed, ",");
				if ("G".equals(type)) {
					while (token.hasMoreElements()) {
						String[] submenu = token.nextElement().toString().split("-");
						WEBMGRKEY key = new WEBMGRKEY();
						key.setOGRUSR(userId);
						key.setOGRSID(submenu[0]);
						key.setOGRDEN(submenu[1]);
						removedList.addRow(key);
					}
				} else {
					while (token.hasMoreElements()) {
						String[] submenu = token.nextElement().toString().split("-");
						WEBMUSKEY key = new WEBMUSKEY();
						key.setOUSUSR(userId);
						key.setOUSSID(submenu[0]);
						key.setOUSDEN(submenu[1]);
						removedList.addRow(key);
					}
				}
				facade.removeAccessToMenu(removedList, type);
			}	
			res.getWriter().println("Transaccion Exitosa");
			
		} catch (FacadeException e) {
			e.printStackTrace();
			res.getWriter().println(
					"Transaccion Fallida: " + "9999" + "-" + e.getMessage());
		}
	}

}

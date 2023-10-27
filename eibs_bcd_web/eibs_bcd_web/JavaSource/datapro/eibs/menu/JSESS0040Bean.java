package datapro.eibs.menu;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.facade.FASecurity;
import com.datapro.eibs.security.vo.WEBMMViewByUser;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS0040DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESS0040Bean extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1208010523540109618L;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void procOldSecurityMenu(ESS0030DSMessage user, 
			HttpServletRequest req, HttpServletResponse res, 
			HttpSession session) throws ServletException, IOException {
			
			session.removeAttribute("mainMenu");
			session.removeAttribute("subMenu");
			
			Map mainMenu = new HashMap();
			Map subMenu = new HashMap();
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ESS0040", req);
				ESS0040DSMessage msgMenu = (ESS0040DSMessage) mp.getMessageRecord("ESS0040DS");
				msgMenu.setESSUSR(user.getH01USR());
				msgMenu.setESSTYP(user.getE01LAN().toUpperCase());
				
				mp.sendMessage(msgMenu);
				
				msgMenu = (ESS0040DSMessage) mp.receiveMessageRecord("ESS0040DS");
				
				if ("T".equals(msgMenu.getESSTYP())) {					
					while (true) {
						msgMenu = (ESS0040DSMessage) mp.getMessageHandler().receiveMessage();
						
						if (msgMenu.getESSTYP().equals("M")) {
							mainMenu.put(msgMenu.getESSSID(), msgMenu);
						} else if ("C".equals(msgMenu.getESSTYP())) {
							List subMenuList = (List) subMenu.get(msgMenu.getESSSID());
							if(subMenuList == null){
								subMenuList = new JBObjList();
								subMenu.put(msgMenu.getESSSID(), subMenuList);
							}
							subMenuList.add(msgMenu);
						} else if (msgMenu.getESSTYP().equals("*")) {
							break;
						}
					}
				}
			
			} finally {
				if (mp != null) mp.close();
			}
			session.setAttribute("mainMenu", mainMenu);
			session.setAttribute("subMenu", subMenu);
	}
	
	private void procSecurityMenu(ESS0030DSMessage msgUser, 
			HttpServletRequest req, HttpServletResponse res, 
			HttpSession session) throws ServletException, IOException {
			
		session.removeAttribute("mainMenu");
		session.removeAttribute("subMenu");
		
		Map mainMenu = new HashMap();
		Map subMenu = new HashMap();
		
		FASecurity facade = new FASecurity();
		facade.setSessionUser(msgUser);
		
		try {
			List list = facade.getMainMenu(facade.getUser());
			if (!list.isEmpty()) {
				Iterator iter = list.listIterator();
				while (iter.hasNext()) {
					WEBMMViewByUser msgMenu = (WEBMMViewByUser) iter.next();
					if ("M".equals(msgMenu.getESSTYP())) {
						mainMenu.put(msgMenu.getESSSID(), msgMenu);
					} else if ("C".equals(msgMenu.getESSTYP())) {
						List subMenuList = (List) subMenu.get(msgMenu.getESSSID());
						if(subMenuList == null){
							subMenuList = new JBObjList();
							subMenu.put(msgMenu.getESSSID(), subMenuList);
						}
						subMenuList.add(msgMenu);
					}	
				}
			}
			session.setAttribute("mainMenu", mainMenu);
			session.setAttribute("subMenu", subMenu);
		} catch (FacadeException e) {
			throw new ServletException(e);
		}
	}
	
	
	private void main(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		Map mainMenu = (Map) session.getAttribute("mainMenu");
		if (mainMenu == null) {
        	procSecurityMenu(user, req, res, session);
			//procOldSecurityMenu(user, req, res, session);
        	mainMenu = (Map) session.getAttribute("mainMenu");
		}
		if (mainMenu.isEmpty()) {
			forward("ESS0040_menu_access_denied.jsp", req, res);
		} else {
			req.setAttribute("currUser", user);
			req.setAttribute("mainMenu", mainMenu);
			req.setAttribute("subMenu", session.getAttribute("subMenu"));
			forward("ESS0040_menu_access_authorized.jsp?WEBPATH=" + webAppPath, req, res);
		}
	}

}

package datapro.eibs.master;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.menu.JBMenuInfo;

/**
 * This type was created in VisualAge.
 */
public class USession {
	/**
	 * Util constructor comment.
	 */
	public USession() {
		super();
	}
	
	public static String getPOSName(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String key = request.getParameter("userPOKey");
		if (key == null){
			key = (String) request.getAttribute("userPOKey");
		}
		if (key != null){
			String beanName = "userPO_" + key;
			if (session.getAttribute(beanName) != null) {
				return beanName;
			}
		}
		return "userPO";
	}
	
	public static UserPos getPOSBean(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String key = request.getParameter("userPOKey");
		String beanName = "userPO";
		if (key == null){
			key = (String) request.getAttribute("userPOKey");
		}
		if (key != null){
			beanName = "userPO_" + key;
		}
		UserPos userPO = (datapro.eibs.beans.UserPos) session.getAttribute(beanName);
		if (userPO == null) {
			userPO = new UserPos();	
			session.setAttribute(beanName, userPO);
		}
		session.setAttribute("userPO", userPO);
		return userPO;
	}
	
	public static JBMenuInfo getMenuInfo(HttpSession session, String menuCDE) {
		JBMenuInfo menuInfo = (JBMenuInfo) session.getAttribute("menuInfo");
		try {
			ESS0030DSMessage msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
			if (menuInfo == null 
				|| !menuCDE.equals(menuInfo.getName())) {
				menuInfo = new JBMenuInfo(msgUser, menuCDE);
			}
			session.setAttribute("menuInfo", menuInfo);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return menuInfo;
	}
	
	public static JBMenuInfo getMenuInfo(HttpServletRequest request, String menuCDE) {
		return getMenuInfo(request.getSession(false), menuCDE);
	}

}
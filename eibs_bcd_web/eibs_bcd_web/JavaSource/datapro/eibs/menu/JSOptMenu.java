/*
 * Created on Jan 23, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.menu;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringEscapeUtils;

import com.datapro.eibs.facade.FASecurity;
import com.datapro.eibs.security.vo.WEBCO;
import com.datapro.eibs.security.vo.WEBCOViewByUser;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.USession;
import datapro.eibs.master.Util;
import datapro.eibs.plugins.AuthorizationManager;

/**
 * @author fhernandez
 *
 */
public class JSOptMenu extends JSEIBSServlet {
	
	private static final Logger log = Logger.getLogger(JSOptMenu.class.getName());
	
	// Options
	protected static final int R_MENU = 1;
	protected static final int R_BUILD = 2;	
	
	private static String replace(String fromString, String oldString, String newString){
		if (oldString.length() == 0) return fromString;
		StringBuffer buf = new StringBuffer();
		int i=0, j=0;
		while((i = fromString.indexOf(oldString, j)) > -1){
			buf.append(fromString.substring(j,i) + newString);
			j = i + oldString.length();
		}
		if (j < fromString.length())
			buf.append(fromString.substring(j));
		return buf.toString();
	}
	
	protected void setResponseHeader(HttpServletResponse response, String name) throws IOException {
		StringBuffer sbContentDispValue = new StringBuffer();
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);
		//response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Cache-Control", "max-age=0");
		response.addHeader("Cache-Control", "s-maxage=0");

		String ext = name.substring(name.length()-3).toLowerCase();
		if (ext.equals("pdf")) {
			response.setContentType("application/pdf");
			sbContentDispValue.append("inline; filename=");
			sbContentDispValue.append(name);
			response.setHeader("Content-disposition", sbContentDispValue.toString());
		} else if(ext.equals("xml")){
			response.setContentType("text/xml");
		} else if (ext.equals("jpg") 
				|| ext.equals("jpeg")) {
			response.setContentType("image/jpeg");
		} else if (ext.equals("tif") 
				|| ext.equals("tiff")) {
			response.setContentType("image/tiff");
		} else {	
			response.setContentType("image/" + ext);
		}
	}
	
	protected void sendXMLResponse(HttpServletResponse response, Object xmlResponse) throws IOException {
		PrintWriter out = null;
		try {
			setResponseHeader(response, "xml");
			out = response.getWriter();
			out.print(xmlResponse.toString());
		} catch (IOException e) {
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null)
				out.close();
		}
	}
	
	//This should be remove when building the menu it is done!
	public void service(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {

		ESS0030DSMessage msgUser = null;
		HttpSession session = (HttpSession)req.getSession(false);
		if (session != null) {
			msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
		}
		
		// Here we should get the path from the user profile
		try {
			int screen ;
			try {
				screen = Integer.parseInt(req.getParameter("SCREEN"));
			} catch (Exception e) {
				screen = 1;
			}					
			processRequest(msgUser, req, res, session, screen);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			forward(sckNotOpenPage, req, res);
		}

	}
	
	/* (non-Javadoc)
	 * @see datapro.eibs.master.JSEIBSServlet#processRequest(datapro.eibs.beans.ESS0030DSMessage, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpSession, int)
	 */
	protected void processRequest(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session,
		int screen)
		throws ServletException, IOException {

			switch (screen) {
				case R_MENU :
					requestOptionsMenu(user, req, res);
					break;
				case R_BUILD :
					buildOptionsMenu(req);
					break;
				default :
					forward("MISC_not_available.jsp", req, res);
					break;
			}
	}
	
	public static boolean popUpTarget(WEBCO element){
		if (!element.getCMOGPO().equals("") 
			&& !element.getCMOGPO().equalsIgnoreCase("main")){
			int pos = element.getCMOGAD().indexOf("CenterWindow");
			if (pos == -1) {
				pos = element.getCMOGAD().indexOf("CenterNamedWindow");
				if (pos != -1) {
					pos = pos+"CenterNamedWindow".length();	
				}
			} else {
				pos = pos+"CenterWindow".length();
			}
			if (pos != -1) {
				int posA = element.getCMOGAD().indexOf("'", pos)+1;
				element.setCMOGAD(element.getCMOGAD().substring(posA, element.getCMOGAD().indexOf("'", posA)));
			}
			return true;
		}
		return false;
	}
	
	public static String mapTarget(HttpServletRequest request, String target){
		target = StringEscapeUtils.escapeXml(target);
		target = replace(target, "/servlet", request.getContextPath()+"/servlet");
		return replace(target, "/pages", request.getContextPath()+"/pages");
	}
	
	public static String mapOptionURL(HttpServletRequest request, WEBCO element, int index){
		HttpSession session = request.getSession(false);
		if (session != null 
			&& AuthorizationManager.isActive(session.getServletContext()) 
			&& element.getCMOGAD().indexOf("javascript:") == -1 ) {
			String callOption = "OptionURL('"
				+ element.getCMOSID() + "','"
				+ element.getCMODEN() + "','"
				+ element.getCMOCDE() + "','"
				+ index + "')";
			if (JSOptMenu.popUpTarget(element)){
				return "javascript:void(CenterNamedWindow(" + callOption + ",'" + element.getCMOGPO() + "',800,600,2))";
			} else {
				return "javascript:OpenURL(" + callOption + ")";
			}
		} else {
			JSOptMenu.popUpTarget(element);
			return mapTarget(request, element.getCMOGAD());
		}
	}
	
	private void requestOptionsMenu(ESS0030DSMessage user, HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		StringBuffer optMenuOptions = new StringBuffer();
		String menu =  request.getParameter("optMenu");
		if (menu == null) {
			log.info("The Requested Options Menu for user \"" + user.getH01USR() + "\" can not be null");
			return;
		}
		HttpSession session = request.getSession(false);
		try {
			JBMenuInfo menuInfo = USession.getMenuInfo(session, menu);
			menuInfo.applyRules(request);
			List list = menuInfo.getMenu();
			if (list.isEmpty()) 
				log.info("The Requested Options Menu \"" + menu+ "\" for user \"" + user.getH01USR() + "\" is Empty");
			Map optionMenu = (Map) (null != session.getAttribute("optionMenu") ? session.getAttribute("optionMenu") : new HashMap());
			optionMenu.put(menu, list);

			WEBCO optionMenuRequested = (WEBCO) session.getAttribute("optionMenuRequested");
			
			optMenuOptions.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n<root>\n");
			int i = 0;
			Iterator iter = list.listIterator();
			while (iter.hasNext()) {
				WEBCOViewByUser element = (WEBCOViewByUser) iter.next();
				if (element.getCMONDS().startsWith("<")) {
					optMenuOptions.append(element.getCMONDS());
				} else {
					optMenuOptions.append("<A " 
							+ "href= \"" + mapOptionURL(request, element, i) + "\" "
							+ (optionMenuRequested != null && optionMenuRequested.getCMODEN().equals(
									element.getCMODEN()) ? " data-active=\"true\"" : "")
							+ (menuInfo.getRequired(i) ? " data-required=\"true\"" : "")
							+ (menuInfo.getCompleted(i) ? " data-completed=\"true\"" : "")
							+ ">" 
							+  StringEscapeUtils.escapeXml(element.getCMONDS()) 
							+ "</A>\n");
				}
				i++;
			}
			optMenuOptions.append("</root>");
			session.setAttribute("optionMenu", optionMenu);
			sendXMLResponse(response, optMenuOptions);
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}
	
	private List buildOptionsMenu(HttpServletRequest request) throws MalformedURLException {
		JBObjList varList = new JBObjList();
		
		String path = getServletContext().getRealPath(getLangPath(request) + "javascripts");
		
		InputStreamReader isr = null;
		BufferedWriter out = null;
		try {
			isr = new InputStreamReader(new FileInputStream(new File(path, "optMenu.jsp")));
			LineNumberReader lnr = new LineNumberReader(isr);
			
			File file = new File(path,"optMenu.jsp.new"); 
			out = new BufferedWriter(new FileWriter(file));
			
			String line = "";
			
			while (line.indexOf("Menu Options") < 0) {
				line = lnr.readLine();
				// detection of EOF
				if (line == null)
					break;
				out.write(line+"\r\n");
			}
			int menuGroup = 0;
			FASecurity fa = FASecurity.getInstance();
			while (true) {
				line = lnr.readLine();
				// detection of EOF
				if (line == null)
					break;
				if (line.equals("") 
					|| line.startsWith("//")) {
					out.write(line+"\r\n");
					continue;
				}
				if (line.indexOf("var") != -1) {
					menuGroup++;
					String var = line.substring(
						line.indexOf("var") + "var".length(), line.indexOf('=')).trim();
					out.write(var + "='" + var +"';\n");
					//varList.clear();
					int menuElem = 0;
					while (true) {
						line = lnr.readLine();
						if (line.equals("") 
							|| line.startsWith("//")) {
							//continue;
						} else {
							line = removeSnippets(line);
							//search for tag
							int tidx = line.indexOf('<');
							if (tidx != -1) {
								menuElem++; 
								WEBCO bean = new WEBCO();
								bean.setCMOSID(Util.addLeftChar('0', 3, ""+menuGroup));
								bean.setCMODEN(Util.addLeftChar('0', 3, ""+menuElem));
								bean.setCMOSEQ("0");
								bean.setCMOCDE(var);
								bean.setCMOLIF("S");
								
								int idx = line.indexOf("HREF");
								if (idx != -1) {
									//Is HREF
									line = line.substring(idx + "HREF".length(), line.length());
									idx = 0;
									while (line.charAt(idx) == ' ' 
										|| line.charAt(idx) == '='
										|| line.charAt(idx) == '\\'
										|| line.charAt(idx) == '"') {
										idx = idx + 1;
									}
									int end = line.indexOf('>');
									String target = line.substring(idx, end);
									if (target.startsWith("javascript")) {
										target = target.substring(0, target.lastIndexOf(")") + 1); 
									}
									bean.setCMOGAD(target);
									if (target.indexOf("CenterWindow") != -1
										|| target.indexOf("CenterNamedWindow") != -1) {
											bean.setCMOGPO(bean.getCMOSID()+"_"+bean.getCMODEN());
									} else {
										bean.setCMOGPO("main");
									}
									String label = line.substring(end + 1, line.length());
									bean.setCMONDS(label.substring(0, label.indexOf('<')));
								} else {
									//Just add probably a separator line (hr)
									//or whatever it is after the tag to the next space
									bean.setCMOGAD(" ");
									bean.setCMOGPO(" ");
									bean.setCMONDS(line.substring(tidx, line.indexOf(' ', tidx))+"/>");
								}
								varList.add(bean);
							}
						}
						if (line.endsWith(";")) {
							break;
						}
					}
				} else {
					out.write(line+"\r\n");
					//continue;
				}
			}
			fa.insertOptionsMenu("QSECEIBS", varList);
			lnr.close();
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(isr != null) isr.close();				
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(out != null) out.close();				
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		return varList;
	}
	
	private String removeSnippets(String line){
		while (line.indexOf("<%=") != -1) {
			int startIndex = line.indexOf("<%=");
			if (startIndex != -1) {
				int endIndex = line.indexOf("%>") + 2;
				line = line.substring(0, startIndex) 
					+ line.substring(endIndex, line.length());
			}
		}
		return line;
	}

}

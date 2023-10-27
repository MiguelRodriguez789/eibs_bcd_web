package datapro.eibs.security;

/**
 * Insert the type's description here.
 * Creation date: (7/6/04 6:08:55 PM)
 * @author: Manuel Justo
 */
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.ezmorph.Morpher;
import net.sf.ezmorph.MorpherRegistry;
import net.sf.ezmorph.bean.BeanMorpher;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS011001Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.Node;
import datapro.eibs.beans.Tree;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSESS0110 extends JSEIBSServlet {

	// Action
	public static HashMap actions;

	protected static final int ENTER = 0;
	protected static final int LIST_MENU_USER = 1;
	protected static final int UPDATE_MENU_USER = 2;

	public void init(ServletConfig config) {
		try {
			super.init(config);
			actions = new HashMap();
			actions.put("ENTER", new Integer(ENTER));
			actions.put("LIST_MENU_USER", new Integer(LIST_MENU_USER));
			actions.put("UPDATE_MENU_USER", new Integer(UPDATE_MENU_USER));

		} catch (ServletException e) {
			flexLog("JSESS0110 init error: " + e.getMessage());
		}
	}

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		// TODO Auto-generated method stub

		int action = 0;
		String command = req.getParameter("command");
		Integer selCommand = (Integer) actions.get(command);
		if (selCommand != null)
			action = selCommand.intValue();

		switch (action) {
		case ENTER:
			forward("ESS0110_user_menu.jsp", req, res);
			break;
		case LIST_MENU_USER:
			this.listMenuUser(user, req, res, session);
			break;
		// END Entering
		case UPDATE_MENU_USER:
			this.updateMenuUser(user, req, res, session);
			break;
		// END Entering
		default:
			forward("MISC_not_available.jsp", req, res);
			break;
		}
	}

	/**
	 * JSEIE00000 constructor comment.
	 */
	public JSESS0110() {
		super();
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSESS0110");
	}

	/*
	 * Send JSON DATA
	 */

	private void sendJsonData(JBObjList list, HttpServletRequest req,
			HttpServletResponse res) {

		Iterator iterator = list.iterator();
		Tree tree = new Tree();
		try {
			tree.setId(req.getParameter("usr").trim());// req.getParameter("usr")
		} catch (Exception e) {
		}
		tree.setReadonly(false);
		Node menu = null;
		boolean isMenu = true;
		while (iterator.hasNext()) {
			ESS011001Message msgMenu = (ESS011001Message) iterator.next();
			if (msgMenu.getE01SELECT().equals("*")) {
				tree.addNode(menu);
				isMenu = true;
			} else {
				if (isMenu) {
					menu = new Node();
					menu.setId(msgMenu.getE01MMIDEN());
					menu.setDesc(msgMenu.getE01MMENDS());
					menu.setType("menu");
					menu.setReadonly(false);
					isMenu = false;
				}
				Node child = new Node();
				child.setId(msgMenu.getE01CMIDEN());
				child.setValue(msgMenu.getE01CMIDEN());
				child.setDesc(msgMenu.getE01CMENDS());
				child.setSelected(msgMenu.getE01SELECT().equals("A"));
				child.setType("submenu");
				child.setReadonly(false);
				if (child.isSelected()) {
					menu.setSelected(true);
				}
				menu.addNode(child);
			}
		}
		JSONObject jsonObject = JSONObject.fromObject(tree);
		//System.out.println("Send: " + jsonObject);
		try {
			res.setContentType("application/json");
			res.setCharacterEncoding("ISO-8859-1");
			res.getWriter().println(jsonObject.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	protected void listMenuUser(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0110", req);
			ESS011001Message msg = (ESS011001Message) mp.getMessageRecord(
					"ESS011001", user.getH01USR(), "0001");
			// read account and reference start point list if any
			msg.setE01USEUID(req.getParameter("usr") != null ? req
					.getParameter("usr") : "");
			mp.sendMessage(msg);

			JBObjList list = (JBObjList) mp
					.receiveMessageRecordList("H01FLGMAS");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				// req.setAttribute("chkList", list);
				sendJsonData(list, req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/*
	 * Save Menu tree
	 */
	private void updateMenuUser(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException,
			ServletException {

		// Recovering Data to update
		String jsonData = req.getParameter("data");
		//System.out.println("Incoming: " + jsonData);
		JSONObject jsonObject = JSONObject.fromObject(jsonData);
		Map classMap = new HashMap();
		classMap.put("nodes", Node.class);
		Tree tree = (Tree) JSONObject.toBean(jsonObject, Tree.class, classMap);
		// post process
		MorpherRegistry morpherRegistry = JSONUtils.getMorpherRegistry();
		Morpher dynaMorpher = new BeanMorpher(Node.class, morpherRegistry);
		morpherRegistry.registerMorpher(dynaMorpher);
		List output = new ArrayList();
		for (Iterator i = tree.getNodes().iterator(); i.hasNext();) {
			output.add(morpherRegistry.morph(Node.class, i.next()));
		}
		tree.setNodes((ArrayList) output);
		ArrayList menus = tree.getNodes();
		Iterator iterator = menus.iterator();

		MessageProcessor mp = null;
		ESS011001Message msg = null;
		try {
			mp = getMessageProcessor("ESS0110", req);

			while (iterator.hasNext()) {
				Node menu = (Node) iterator.next();
				Iterator it = menu.getNodes().iterator();
				while (it.hasNext()) {
					Node submenu = (Node) it.next();
					msg = (ESS011001Message) mp.getMessageRecord(
							"ESS011001", user.getH01USR(), "0002");
					msg.setE01MMIDEN(menu.getId());
					msg.setE01CMIDEN(submenu.value);
					msg.setE01USEUID(tree.getId());
					mp.sendMessage(msg);
				}
				/*
				msg = (ESS011001Message) mp.getMessageRecord("ESS011001", user
						.getH01USR(), "0002");
				msg.setE01SELECT1("*");
				*/
				mp.sendMessage(msg);
			}
			msg = (ESS011001Message) mp.getMessageRecord("ESS011001", user
					.getH01USR(), "0002");
			msg.setH01FLGMAS("*");
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");

			if (mp.hasError(msgError)) {
				res.getWriter().println(
						"Transaccion Fallida: " + msgError.getERNU01() + "-"
								+ msgError.getERDS01());
			} else {
				res.getWriter().println("Transaccion Exitosa");
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void sendXmlData(JBObjList lista, HttpServletRequest req,
			HttpServletResponse res) {

		StringBuffer sb = new StringBuffer(500);
		sb.append("<root>");
		// sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>") ;
		sb.append("<menus desc=\"Menu de usuarios\">");

		String currentMenu = "";
		Iterator iterator = lista.iterator();

		boolean isMenu = true;
		while (iterator.hasNext()) {
			ESS011001Message msgMenu = (ESS011001Message) iterator.next();
			if (msgMenu.getE01SELECT().equals("*")) {
				sb.append("</menu>");
				isMenu = true;
			} else {
				if (isMenu) {
					sb.append("<menu id=\"" + currentMenu + "\" name=\""
							+ replaceXMLChar(msgMenu.getE01MMENDS()) + "\">");
					isMenu = false;
				}
				sb.append("<submenu id=\"" + msgMenu.getE01CMIDEN()
						+ "\" name=\""
						+ replaceXMLChar(msgMenu.getE01CMENDS()) + "\"/>");
			}
		}
		sb.append("</menus>");

		//System.out.println(sb.toString());
		try {
			res.setContentType("text/xml");
			res.setCharacterEncoding("ISO-8859-1");
			res.getWriter().println(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	protected String replaceXMLChar(String src) {
		String res = "";
		res = src;
		res.replaceAll("&aacute;", "a");
		res.replaceAll("&eacute;", "e");
		res.replaceAll("&iacute;", "i");
		res.replaceAll("&oacute;", "o");
		res.replaceAll("&uacute;", "u");
		res.replaceAll("&", " ");
		return res;
	}

}

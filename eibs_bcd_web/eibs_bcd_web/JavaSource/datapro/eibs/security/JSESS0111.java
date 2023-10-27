package datapro.eibs.security;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.ezmorph.Morpher;
import net.sf.ezmorph.MorpherRegistry;
import net.sf.ezmorph.bean.BeanMorpher;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;

import com.datapro.eibs.access.VOSuper;
import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.facade.FASecurity;
import com.datapro.eibs.security.vo.WEBCOViewTreeByUser;
import com.datapro.eibs.security.vo.WEBMGR;
import com.datapro.eibs.security.vo.WEBMO;
import com.datapro.eibs.security.vo.WEBMUS;
import com.datapro.eibs.security.vo.WEBOG;
import com.datapro.eibs.security.vo.WEBOU;
import com.datapro.eibs.setup.vo.CNTRLCNTExtRunDate;
import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.Node;
import datapro.eibs.beans.Tree;
import datapro.eibs.master.JSEIBSServlet;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 * 
 */
public class JSESS0111 extends JSEIBSServlet {

	protected static final int ENTER = 0;
	protected static final int LIST_MENU_USER = 1;
	protected static final int UPDATE_MENU_USER = 2;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case ENTER:
				forward("ESS0111_user_options.jsp", req, res);
				break;
			case LIST_MENU_USER:
				listMenuUser(user, req, res, session);
				break;
			// END Entering
			case UPDATE_MENU_USER:
				updateMenuUser(user, req, res, session);
				break;
			// END Entering
			default:
				forward(devPage, req, res);
				break;
		}
	}

	private void updateMenuUser(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		// Recovering Data to update
		String typ = req.getParameter("typ") == null ? "U" : req.getParameter("typ");
		String jsonData = req.getParameter("tree");
		FASecurity facade = new FASecurity();
		facade.setSessionUser(user);
		try {
			CNTRLCNTExtRunDate rundate = facade.getRunDate();
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
			BeanList options = new BeanList();
			tree.setNodes((ArrayList) output);
			ArrayList menus = tree.getNodes();
			
			VOSuper vo = null;
			if ("G".equals(typ)) {
				vo = new WEBOG();
			} else {
				vo = new WEBOU();
			}
			options.addRow(vo);
			facade.deleteOptionMenuByUser(tree.getId(), options);
			options.init();
			Iterator iterator = menus.iterator();
			while (iterator.hasNext()) {
				Node menu = (Node) iterator.next();
				Iterator it = menu.getNodes().iterator();
				while (it.hasNext()) {
					Node submenu = (Node) it.next();
					 java.util.Date date= new java.util.Date();
					
					if ("G".equals(typ)) {
						vo = new WEBOG();
						((WEBOG)vo).setOGRUSR(tree.getId());
						((WEBOG)vo).setOGRSID(menu.getId());
						((WEBOG)vo).setOGRDEN(submenu.value);
						((WEBOG)vo).setOGRLIF(user.getE01LAN().toUpperCase());
						((WEBOG)vo).setOGRSEQ("0");
						((WEBOG)vo).setOGRLMM(rundate.getCNTRDM());
						((WEBOG)vo).setOGRLMD(rundate.getCNTRDD());
						((WEBOG)vo).setOGRLMY(rundate.getCNTRDY());
						((WEBOG)vo).setOGRLMT(new Timestamp(date.getTime()));
						options.addRow(vo);
					} else {
						if (!submenu.isReadonly()) {
							vo = new WEBOU();
							((WEBOU)vo).setOUSUSR(tree.getId());
							((WEBOU)vo).setOUSSID(menu.getId());
							((WEBOU)vo).setOUSDEN(submenu.value);
							((WEBOU)vo).setOUSLIF(user.getE01LAN().toUpperCase());
							((WEBOU)vo).setOUSSEQ("0");
							((WEBOU)vo).setOUSLMM(rundate.getCNTRDM());
							((WEBOU)vo).setOUSLMD(rundate.getCNTRDD());
							((WEBOU)vo).setOUSLMY(rundate.getCNTRDY());
							((WEBOU)vo).setOUSLMT(new Timestamp(date.getTime()));
							options.addRow(vo);
						}
					}
				}
			}
			facade.updateOptionMenuByUser(tree.getId(), options);
			res.getWriter().println("Transaccion Exitosa");
			
		} catch (FacadeException e) {
			throw new ServletException(e.getMessage());
		}
	}

	private void listMenuUser(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException {
		
		String usr = req.getParameter("usr") == null ? "" : req.getParameter("usr");
		String typ = req.getParameter("typ") == null ? "U" : req.getParameter("typ");
		
		FASecurity facade = new FASecurity();
		try {
			Tree tree = new Tree();
			tree.setId(usr);
			tree.setReadonly(false);
			
			Node menu = null;
			
			List list = facade.getOptionsMainMenu(user.getE01LAN().toUpperCase());
			List option = facade.getOptionsSubMenu(usr, typ, "");
			
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				WEBMO mainMenu = (WEBMO) iterator.next();
				menu = new Node();
				menu.setId(mainMenu.getMOIDEN());
				menu.setDesc(mainMenu.getMOENDS().trim());
				menu.setType("menu");
				
				Iterator optiter = option.iterator();
				while (optiter.hasNext()) {
					WEBCOViewTreeByUser subMenu = (WEBCOViewTreeByUser) optiter.next();
					if (subMenu.getCMOSID().equals(menu.getId())) {
						Node child = new Node();
						child.setId(subMenu.getCMODEN());
						child.setValue(subMenu.getCMODEN());
						child.setDesc(subMenu.getCMONDS().trim());
						child.setSelected(subMenu.getCMOSTS().equals("S"));
						child.setReadonly(subMenu.getCMORWS().equals("RO"));
						child.setType("submenu");
						if (child.isSelected()) {
							menu.setSelected(true);
						}
						if (child.isReadonly()) {
							menu.setReadonly(true);
							if (!tree.isReadonly()) tree.setReadonly(true);
						}
						menu.addNode(child);
					}
				}
				tree.addNode(menu);
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
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
	}
	
}

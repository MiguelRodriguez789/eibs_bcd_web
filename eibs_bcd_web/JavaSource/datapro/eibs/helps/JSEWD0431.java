package datapro.eibs.helps;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0431DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.Node;
import datapro.eibs.beans.Tree;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 * Comercial Letter Of Credit Maintenance
 */
public class JSEWD0431 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0431", req);
			EWD0431DSMessage msgHelp = (EWD0431DSMessage) mp.getMessageRecord("EWD0431DS");
			msgHelp.setRWDUSR(user.getH01USR());
			msgHelp.setSWDUSR(req.getParameter("SWDUSR")!= null && !req.getParameter("SWDUSR").equals("all") ? req.getParameter("SWDUSR") : "");
			msgHelp.setSWDTYP(req.getParameter("SWDTYP") == null ? "U" : req.getParameter("SWDTYP"));
			try {
				int pos = Util.parseInt(req.getParameter("FromRecord"));
				msgHelp.setRWDFRC(String.valueOf(pos));
			} catch (Exception e) {
				msgHelp.setRWDFRC("0");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
	            forward("error_viewer.jsp", req, res);
			} else {
				sendJsonData(list, req, res);
			}
			
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void sendJsonData(JBObjList list, HttpServletRequest req,
			HttpServletResponse res) {
		
		res.setContentType("application/json");
		
		Tree tree = new Tree();
		HashMap data = tree.getData();
		String previous = list.getShowPrev() ? "true" : "false";
		String next = list.getShowNext() ? "true" : "false";
		data.put("first", "" + (list.getFirstRec() - 21));
		data.put("last", "" + list.getLastRec());
		data.put("previous", previous);
		data.put("next", next);
		data.put("typ", req.getParameter("SWDTYP"));
		data.put("usr",  Util.getReqParameter("SWDUSR", req, "all"));
		
		Iterator iterator = list.iterator();
		if ("G".equals(req.getParameter("SWDTYP"))) {
			while (iterator.hasNext()) {
				EWD0431DSMessage msgHelp = (EWD0431DSMessage) iterator.next();
				Node user = new Node();
				user.setId(msgHelp.getSWDUSR());
				user.setDesc(msgHelp.getSWDUSR());
				tree.addNode(user);
			}
		} else {
			while (iterator.hasNext()) {
				EWD0431DSMessage msgHelp = (EWD0431DSMessage) iterator.next();
				Node user= new Node();
				user.setId( msgHelp.getSWDUSR());
				user.setDesc(msgHelp.getSWDUSR());
				tree.addNode(user);
				
			}
		}
		try {
			JSONObject jsonObject = JSONObject.fromObject(tree);
			res.getWriter().println(jsonObject.toString());
			// res.flushBuffer();
		} catch (Exception e) {
			flexLog(e.getClass().getName() + " : " + e.getMessage());
		}
	}

}

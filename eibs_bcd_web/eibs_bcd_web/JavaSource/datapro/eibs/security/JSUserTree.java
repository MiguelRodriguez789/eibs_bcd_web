package datapro.eibs.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.facade.FASecurity;
import com.datapro.eibs.security.key.CNTRLBTHKEYViewUsers;
import com.datapro.eibs.security.vo.CNTRLBTHViewUsers;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0431DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSUserTree extends JSEIBSServlet {

	protected static final int LIST_USER = 2;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		case LIST_USER:
			procReqUsersTree(user, req, res, session);
			break;
		default:
			forward(devPage, req, res);
			break;
		}
	}

	private static final char[] toTake = new char[]{'"','\\','\b', '\f', '\n', '\r', '\t'};	
	private static final String[] toReplace =  new String[]{
		"Á", "A", "á", "a", "É", "E", "é", "e", "Í", "I", "í", "i", "Ó", "O", "ó", "o", "Ú", "U", "ú", "u", "ñ", "n"};
	
	protected String escapeJson(String string){
		String newString = string;
		for (int i = 0; i < toTake.length; i++) {
			char mChar = toTake[i];
			while (newString.indexOf(mChar) > -1) {
				newString = Util.takeCharacter(newString, mChar);
			}
		}		
		for (int i = 0; i < toReplace.length; i = i + 2) {
			String mChar = toReplace[i];
			while (newString.indexOf(mChar) > -1) {
				newString = Util.replace(newString, mChar, toReplace[i + 1]);
			}
		}
		return newString;
	}
	
	private void addUser(StringBuffer bf, CNTRLBTHViewUsers bUser, int count){
		//Adding user
		if (count > 0) 
			bf.append(",");
		bf.append("{");
		addNode(bf, bUser, false);
		bf.append("}");
	}	
	
	private void addNode(StringBuffer bf, CNTRLBTHViewUsers bUser, boolean isGroup){
		String description = "";
		String id = "";
		if (isGroup) {
			description = bUser.getBTHGRP();
			id = bUser.getBTHGRP(); 
		} else {
			description = bUser.getBTHUSR();
			id = bUser.getBTHUSR();
		}
		bf.append("\"data\" : {" +
				"\"title\" : \"" + description + "\"");
		bf.append(	"}");
		bf.append(", \"attr\" : {");
		bf.append(		"\"id\" : \"" + id + "\"");
		bf.append(		", \"rel\" : \"" + (isGroup ? "group" : "user") + "\" ");
		bf.append(		"}");
		if (isGroup) {
			bf.append(", \"state\" : \"open" + "\" ");
		}
	}
	
	private CNTRLBTHViewUsers addUsers(StringBuffer bf, CNTRLBTHViewUsers bUser, Iterator iterator){
		String group = bUser.getBTHGRP();
		int count = 0;
		do {
			if (!bUser.getBTHUSR().equals("")) {
				addUser(bf, bUser, count++);
			}
			if (iterator.hasNext()) {
				bUser = (CNTRLBTHViewUsers) iterator.next();
			} else {
				bUser = null;
				break;
			}
		} while (bUser.getBTHGRP().equals(group));
		return bUser;
	}
	
	private CNTRLBTHViewUsers addGroup(StringBuffer bf, CNTRLBTHViewUsers bUser, Iterator iterator, int count){
		//Adding group node
		if (count > 0) 
			bf.append(",\n");
		bf.append("{");
		if (bUser.getBTHGRP().equals("")) {
			//Adding empty label group
			CNTRLBTHViewUsers empty = new CNTRLBTHViewUsers();
			empty.setBTHGRP("*");
			addNode(bf, empty, true);
		} else {
			addNode(bf, bUser, true);
		}
		String group = bUser.getBTHGRP();
		while (bUser != null && group.equals(bUser.getBTHGRP())) {
			bf.append(", \"children\" : [");
			bUser = addUsers(bf, bUser, iterator);
			bf.append("]");
		}
		bf.append("}");
		return bUser;
	}
	
	private void addGroup(StringBuffer bf, CNTRLBTHViewUsers bUser, int count){
		//Adding group node
		if (count > 0) 
			bf.append(",\n");
		bf.append("{");
		bf.append("\"data\" : {" +
				"\"title\" : \"" + bUser.getBTHGRP() + "\"");
		bf.append(	"}");
		bf.append(", \"attr\" : {");
		bf.append(		"\"id\" : \"" + bUser.getBTHGRP() + "\"");
		bf.append(		", \"rel\" : \"group\" ");
		bf.append(		"}");
		bf.append("}");
	}
	
	private List getGroupList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0431", req);
			EWD0431DSMessage msgHelp = (EWD0431DSMessage) mp.getMessageRecord("EWD0431DS");
			msgHelp.setRWDUSR(user.getH01USR());
			msgHelp.setSWDUSR(req.getParameter("group"));
			msgHelp.setSWDTYP("G");
			msgHelp.setRWDFRC("0");
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				throw new ServletException(msgError.toString());
			} else {
				ArrayList result = new ArrayList();
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0431DSMessage) list.getRecord();
					CNTRLBTHViewUsers bUser = new CNTRLBTHViewUsers();
					bUser.setBTHGRP(msgHelp.getSWDUSR());
					result.add(bUser);
				}
				return result;
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqUsersTree(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {
		StringBuffer bf = new StringBuffer();
		try {
			FASecurity faSecurity = new FASecurity();
			
			String type = req.getParameter("type");
			
			List list = null;
			if ("G".equals(type)) {
				list = getGroupList(user, req, res);
				CNTRLBTHViewUsers bUser = null;
				int row = 0;
				if (list != null) {
					Iterator iterator = list.iterator();
					do {
						bUser = (CNTRLBTHViewUsers) iterator.next();
						addGroup(bf, bUser, row++);
					} while (iterator.hasNext());
				}
			} else {
				CNTRLBTHKEYViewUsers key = new CNTRLBTHKEYViewUsers();
				key.setBTHUSR(req.getParameter("user"));
				key.setBTHGRP(req.getParameter("group"));
				
				list = (List) faSecurity.getUsers(key).getList();
				if (list != null) {
					String group = null;
					CNTRLBTHViewUsers bUser = null;
					int row = 0;
					Iterator iterator = list.iterator();
					do {
						if (group == null && iterator.hasNext()) {
							bUser = (CNTRLBTHViewUsers) iterator.next();
						}
						if (bUser != null) {
							group = bUser.getBTHGRP();
							bUser = addGroup(bf, bUser, iterator, row);
							row++;
						}
					} while (bUser != null && !bUser.getBTHGRP().equals(group));
				}
			}
			
			sendJSONResponse(res, "[" + bf.toString() + "]");
			
		} catch (Exception e) {
			e.printStackTrace();
			res.getWriter().println(
					"Transaccion Fallida: " + "9999" + "-" + e.getMessage());
		}		
	}
}

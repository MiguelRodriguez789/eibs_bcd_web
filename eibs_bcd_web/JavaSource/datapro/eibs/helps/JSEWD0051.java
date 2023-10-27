package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0051DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0051 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		String flagType = Util.getReqParameter("FLAG", req);
		String Type = Util.getReqParameter("TYPE", req);
		try {
			mp = getMessageProcessor("EWD0051", req);
			EWD0051DSMessage msgHelp = (EWD0051DSMessage) mp.getMessageRecord("EWD0051DS");
			try {	
		    	msgHelp.setEWDBNK(req.getParameter("BANK").trim());
			} catch (Exception e) {
				msgHelp.setEWDBNK("");
			}
			try {	
		    	msgHelp.setEWDTYP(req.getParameter("TYPE").trim());
			} catch (Exception e) {
				msgHelp.setEWDTYP("");
			}
	    	
			msgHelp.setEWDOPE( flagType.equalsIgnoreCase("A") ? "X" : "");			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0051DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTYP()
								+ "', '"
								+ msgHelp.getEWDDSC()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDTYP())
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTYP()
								+ "', '"
								+ msgHelp.getEWDDSC()
								+ "')\">"
								+ msgHelp.getEWDDSC()
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0051Help", beanList);
				
				pageName = "EWD0051_bank_statements_table_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

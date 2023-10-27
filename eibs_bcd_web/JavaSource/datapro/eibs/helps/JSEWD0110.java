package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0110DSMessage;
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
public class JSEWD0110 extends JSEIBSServlet {

	
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
		try {
			mp = getMessageProcessor("EWD0110", req);
			EWD0110DSMessage msgHelp = (EWD0110DSMessage) mp.getMessageRecord("EWD0110DS");
			
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
					msgHelp = (EWD0110DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append("<td nowrap><a href=\"javascript:enter('"
							+ msgHelp.getEWDCAU() + "','" + msgHelp.getEWDDSC()
							+ "')\">" + Util.formatCell(msgHelp.getEWDCAU())
							+ "</a></td>");
					myRow.append("<td nowrap><a href=\"javascript:enter('"
							+ msgHelp.getEWDCAU() + "','" + msgHelp.getEWDDSC()
							+ "')\">" + msgHelp.getEWDCCY() + "</a></td>");
					myRow.append("<td nowrap><a href=\"javascript:enter('"
							+ msgHelp.getEWDCAU() + "','" + msgHelp.getEWDDSC()
							+ "')\">" + msgHelp.getEWDFLG() + "</a></td>");
					myRow.append("<td nowrap><a href=\"javascript:enter('"
							+ msgHelp.getEWDCAU() + "','" + msgHelp.getEWDDSC()
							+ "')\">" + msgHelp.getEWDDSC() + "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0110Help", beanList);
				
				pageName = "EWD0110_client_casual_code_table_helpmessage.jsp";
			}
			
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0306DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0306 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0306", req);
			EWD0306DSMessage msgHelp = (EWD0306DSMessage) mp.getMessageRecord("EWD0306DS");
			msgHelp.setSWDTYP("v");
			msgHelp.setRWDTYP("N");
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("SWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0306DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getSWDCOD()
								+ "','"
								+ msgHelp.getSWDNME()
								+ "')\">"
								+ msgHelp.getSWDCOD()
								+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelp.getSWDCOD()
							+ "','"
							+ msgHelp.getSWDNME()
							+ "')\">"
							+ msgHelp.getSWDNME()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelp.getSWDCOD()
							+ "','"
							+ msgHelp.getSWDNME()
							+ "')\">"
							+ msgHelp.getSWDPH1()
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0306Help", beanList);
				
				pageName = "EWD0306_fe_bt_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

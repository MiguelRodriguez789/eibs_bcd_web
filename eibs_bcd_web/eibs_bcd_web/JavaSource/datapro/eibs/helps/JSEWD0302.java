package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0302DSMessage;
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
public class JSEWD0302 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0302", req);
			EWD0302DSMessage msgHelp = (EWD0302DSMessage) mp.getMessageRecord("EWD0302DS");
			try {
				msgHelp.setSWDCUN(req.getParameter("shrCust").trim());
			} catch (Exception e) {
				msgHelp.setSWDCUN("");
			}
			try {
				msgHelp.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgHelp.setRWDFRC("0");
			}
			msgHelp.setSWDPRFFL1("A");
			
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
					msgHelp = (EWD0302DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getSWDNUM()
								+ "','"
								+ msgHelp.getSWDCUN()
								+ "')\">"
								+ msgHelp.getSWDNME() 
								+ "</a></td>"); //customer number
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getSWDNUM()
								+ "','"
								+ msgHelp.getSWDCUN()
								+ "')\">"
								+ msgHelp.getSWDNUM() + "-" + msgHelp.getSWDDSC()
								+ "</a></td>"); //portfolio number
						
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getSWDNUM()
								+ "','"
								+ msgHelp.getSWDCUN()
								+ "')\">"
								+ msgHelp.getSWDTDS()
								+ "</a></td>");	//portfolio type
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getSWDNUM()
								+ "','"
								+ msgHelp.getSWDCUN()
								+ "')\">"
								+ msgHelp.getSWDLEGNME()
								+ "</a></td>");	//Legal Name
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0302Help", beanList);
				
				pageName = "EWD0302_inv_port_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

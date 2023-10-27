package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0165DSMessage;
import datapro.eibs.beans.EWD038001Message;
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
public class JSEWD0380 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0380", req);
			EWD038001Message msgHelp = (EWD038001Message) mp.getMessageRecord("EWD038001");
			try {
				msgHelp.setE01TASBNK(req.getParameter("bnk").trim());
			} catch (Exception e) {
				msgHelp.setE01TASBNK("");
			}

			try {
				msgHelp.setE01TASTBL(req.getParameter("tbl").trim());
			} catch (Exception e) {
				msgHelp.setE01TASTBL("");
			}

			try {
				msgHelp.setE01TASPRD(req.getParameter("prd").trim());
			} catch (Exception e) {
				msgHelp.setE01TASPRD("");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("E01TASOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD038001Message) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getE01TASTBL()
								+ "')\">"
								+ msgHelp.getE01TASTBL()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getE01TASTBL()
								+ "')\">"
								+ msgHelp.getE01TASDSC()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getE01TASTBL()
								+ "')\">"
								+ Util.formatCustomDate(user.getE01DTF(),msgHelp.getE01TASLMM(),msgHelp.getE01TASLMD(),msgHelp.getE01TASLMY())
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0380Help", beanList);
				session.setAttribute("prefere", msgHelp);
				
				if ("true".equals(req.getParameter("loan"))) {
					pageName = "EWD0380_limits_parameters.jsp";
				} else {
					pageName = "EWD0380_limits_parameters_helpmessage.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

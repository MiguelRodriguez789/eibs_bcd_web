package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0093DSMessage;
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
public class JSEWD0093 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0093", req);
			EWD0093DSMessage msgHelp = (EWD0093DSMessage) mp.getMessageRecord("EWD0093DS");
			try {
				 msgHelp.setEWDTBL(req.getParameter("codeflag").trim());
			} catch (Exception e) {
				msgHelp.setEWDTBL("");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE", "EWDREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0093DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td NOWRAP ><a href=\"javascript:enter('"
								+ msgHelp.getEWDCOD()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDCOD())
								+ "</a></td>");
						myRow.append(
							"<td NOWRAP ><a href=\"javascript:enter('"
								+ msgHelp.getEWDCOD()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDDSC())
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0093Help", beanList);
				
				pageName = "EWD0093_list_for_CIIU.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

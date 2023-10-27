package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0430DSMessage;
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
public class JSEWD0430 extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0430", req);
			EWD0430DSMessage msgHelp = (EWD0430DSMessage) mp.getMessageRecord("EWD0430DS");
			msgHelp.setRWDUSR(user.getH01USR());
			msgHelp.setSWDTYP(req.getParameter("Type") == null ? "" : req.getParameter("Type"));
			
			int record;
			try {
				record = Integer.parseInt(req.getParameter("FromRecord"));
			} catch (Exception e) {
				record = 0;
			}
			msgHelp.setRWDFRC(String.valueOf(record));
				
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					EWD0430DSMessage msgHelpS = (EWD0430DSMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelpS.getRWDUSR()
							+ "','"
							+ msgHelpS.getSWDNME()
							+ "')\">"
							+ msgHelpS.getRWDUSR()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelpS.getRWDUSR()
							+ "','"
							+ msgHelpS.getSWDNME()
							+ "')\">"
							+ msgHelpS.getSWDNME()
							+ "</a></td>");

					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				req.setAttribute("NameSearch", req.getParameter("NameSearch"));
				req.setAttribute("Type", req.getParameter("Type"));
				
				session.setAttribute("ewd0430Help", beanList);
				pageName = "EWD0430_user_desc_id_help_helpmessage.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

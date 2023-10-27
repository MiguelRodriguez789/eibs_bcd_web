package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0710DSMessage;
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
public class JSEWD0710 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0710", req);
			EWD0710DSMessage msgHelp = (EWD0710DSMessage) mp.getMessageRecord("EWD0710DS");
			msgHelp.setEWDSEL("S");
			try { 
				msgHelp.setEWDREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
			} catch (Exception e) {
				msgHelp.setEWDREC("0");
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
					msgHelp = (EWD0710DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getEWDTCN()
							+ "','"
							+ msgHelp.getEWDDCN()										
							+ "')\">"
							+ msgHelp.getEWDTCN()
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=LEFT><a href=\"javascript:enter('"
							+ msgHelp.getEWDTCN()
							+ "','"
							+ msgHelp.getEWDDCN()										
							+ "')\">"
							+ msgHelp.getEWDDCN()
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0710Help", beanList);
				
				pageName = "EWD0710_refcodes_help_helpmessage.jsp";
			}
			
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

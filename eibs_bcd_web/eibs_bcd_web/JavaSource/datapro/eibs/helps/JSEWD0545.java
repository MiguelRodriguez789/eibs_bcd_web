package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0545RMessage;
import datapro.eibs.beans.EWD0545SMessage;
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
public class JSEWD0545 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0545", req);
			EWD0545RMessage msgHelp = (EWD0545RMessage) mp.getMessageRecord("EWD0545R");
			try {
				msgHelp.setRWDSHR(req.getParameter("NameSearch").toUpperCase());
			} catch (Exception e) {
				msgHelp.setRWDSHR("");
			}
			try {
				msgHelp.setRWDTYP(req.getParameter("Type").toUpperCase());
			} catch (Exception e) {
				msgHelp.setRWDTYP("");
			}
			try {
				msgHelp.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgHelp.setRWDFRC("0");
			}
			try {
				String Custype = (req.getParameter("CusType") == null)	? "" : req.getParameter("CusType");
				msgHelp.setRWDSEL(Custype);
			} catch (Exception e) {
				msgHelp.setRWDSEL("");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				String idn = "";
				list.initRow();
				while (list.getNextRow()) {
					EWD0545SMessage msgHelpS = (EWD0545SMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDSWI()
								+ "','"
								+ msgHelpS.getSWDCUN()
								+ "')\">"
								+ msgHelpS.getSWDSWI()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDSWI()
								+ "','"
								+ msgHelpS.getSWDCUN()
								+ "')\">"
								+ msgHelpS.getSWDNA1()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDSWI()
								+ "','"
								+ msgHelpS.getSWDCUN()
								+ "')\">"
								+ msgHelpS.getSWDBRN()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDSWI()
								+ "','"
								+ msgHelpS.getSWDCUN()
								+ "')\">"
								+ msgHelpS.getSWDCTY()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDSWI()
								+ "','"
								+ msgHelpS.getSWDCUN()
								+ "')\">"
								+ msgHelpS.getSWDCNT()
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0545Help", beanList);
				req.setAttribute("NameSearch", req.getParameter("NameSearch"));
				req.setAttribute("Type", req.getParameter("Type"));
				req.setAttribute("CusType", req.getParameter("CusType"));
				
				pageName = "EWD0545_correspondent_desc_id_help_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

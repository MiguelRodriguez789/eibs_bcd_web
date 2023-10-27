package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0001RMessage;
import datapro.eibs.beans.EWD0001SMessage;
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
public class JSEWD0001I extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0001", req);
			EWD0001RMessage msgHelpR = (EWD0001RMessage) mp.getMessageRecord("EWD0001R");
			try {
				msgHelpR.setRWDSHR(req.getParameter("NameSearch").toUpperCase());
			} catch (Exception e) {
				msgHelpR.setRWDSHR("");
			}
			try {
				msgHelpR.setRWDTYP(req.getParameter("Type").toUpperCase());
			} catch (Exception e) {
				msgHelpR.setRWDTYP("");
			}
			try {
				msgHelpR.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgHelpR.setRWDFRC("0");
			}
			
			try {
				String Custype = (req.getParameter("CusType") == null)	? "" : req.getParameter("CusType");
				msgHelpR.setRWDSEL(Custype);
			} catch (Exception e) {
				msgHelpR.setRWDSEL("");
			}

			mp.sendMessage(msgHelpR);
			
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
					EWD0001SMessage msgHelpS = (EWD0001SMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDCUN()
								+ "','"
								+ msgHelpS.getSWDNA1()
								+ "','"
								+ msgHelpS.getSWDIDN()
								+ "')\">"
								+ msgHelpS.getSWDCUN()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDCUN()
								+ "','"
								+ msgHelpS.getSWDNA1()
								+ "','"
								+ msgHelpS.getSWDIDN()
								+ "')\">"
								+ msgHelpS.getSWDNA1()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDCUN()
								+ "','"
								+ msgHelpS.getSWDNA1()
								+ "','"
								+ msgHelpS.getSWDIDN()
								+ "')\">"
								+ msgHelpS.getSWDIDN()
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0001Help", beanList);
				req.setAttribute("NameSearch", req.getParameter("NameSearch"));
				req.setAttribute("Type", req.getParameter("Type"));
				req.setAttribute("CusType", req.getParameter("CusType"));
				
				pageName = "EWD0001I_client_desc_id_help_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

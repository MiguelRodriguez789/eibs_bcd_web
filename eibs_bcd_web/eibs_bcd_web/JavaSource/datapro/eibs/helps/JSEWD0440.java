package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0440RMessage;
import datapro.eibs.beans.EWD0440SMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author Rafael Gomez Gonzalez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0440 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0440", req);
			EWD0440RMessage msgHelpR = (EWD0440RMessage) mp.getMessageRecord("EWD0440R");
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

			mp.sendMessage(msgHelpR);
			
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
					EWD0440SMessage msgHelpS = (EWD0440SMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDUSR()
								+ "','"
								+ msgHelpS.getSWDNA1()
								+ "','"
								+ msgHelpS.getSWDIDN()
								+ "','"
								+ msgHelpS.getSWDTID()
								+ "','"
								+ msgHelpS.getSWDDTI()
								+ "','"
								+ msgHelpS.getSWDPID()
								+ "','"
								+ msgHelpS.getSWDDEP()
								+ "','"
								+ msgHelpS.getSWDBTH()
								+ "')\">"
								+ msgHelpS.getSWDUSR()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDUSR()
								+ "','"
								+ msgHelpS.getSWDNA1()
								+ "','"
								+ msgHelpS.getSWDIDN()
								+ "','"
								+ msgHelpS.getSWDTID()
								+ "','"
								+ msgHelpS.getSWDDTI()
								+ "','"
								+ msgHelpS.getSWDPID()
								+ "','"
								+ msgHelpS.getSWDDEP()
								+ "','"
								+ msgHelpS.getSWDBTH()
								+ "')\">"
								+ msgHelpS.getSWDNA1()
								+ "</a></td>");
						myRow.append(
								"<td nowrap><a href=\"javascript:enter('"
									+ msgHelpS.getSWDUSR()
									+ "','"
									+ msgHelpS.getSWDNA1()
									+ "','"
									+ msgHelpS.getSWDIDN()
									+ "','"
									+ msgHelpS.getSWDTID()
									+ "','"
									+ msgHelpS.getSWDDTI()
									+ "','"
									+ msgHelpS.getSWDPID()
									+ "','"
									+ msgHelpS.getSWDDEP()
									+ "','"
									+ msgHelpS.getSWDBTH()									
									+ "')\">"
									+ msgHelpS.getSWDDTI()
									+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDUSR()
								+ "','"
								+ msgHelpS.getSWDNA1()
								+ "','"
								+ msgHelpS.getSWDIDN()
								+ "','"
								+ msgHelpS.getSWDTID()
								+ "','"
								+ msgHelpS.getSWDDTI()
								+ "','"
								+ msgHelpS.getSWDPID()
								+ "','"
								+ msgHelpS.getSWDDEP()
								+ "','"
								+ msgHelpS.getSWDBTH()
								+ "')\">"
								+ msgHelpS.getSWDIDN()
								+ "</a></td>");
						myRow.append(
								"<td nowrap><a href=\"javascript:enter('"
									+ msgHelpS.getSWDUSR()
									+ "','"
									+ msgHelpS.getSWDNA1()
									+ "','"
									+ msgHelpS.getSWDIDN()
									+ "','"
									+ msgHelpS.getSWDTID()
									+ "','"
									+ msgHelpS.getSWDDTI()
									+ "','"
									+ msgHelpS.getSWDPID()
									+ "','"
									+ msgHelpS.getSWDDEP()
									+ "','"
									+ msgHelpS.getSWDBTH()
									+ "')\">"
									+ msgHelpS.getSWDDEP()
									+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				//beanList.setFirstRec(list.getFirstRec());
				//beanList.setLastRec(list.getLastRec());
				//beanList.setShowNext(list.getShowNext());
				//beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0440Help", beanList);
				req.setAttribute("NameSearch", req.getParameter("NameSearch"));
				req.setAttribute("Type", req.getParameter("Type"));
				
				pageName = "EWD0440_user_details_help_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

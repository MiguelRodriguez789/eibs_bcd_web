package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;

/**
 * @author jlbuitrago
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0065 extends JSEIBSServlet {

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
			mp = getMessageProcessor("EWD0065", req);
			EWD0065DSMessage msgHelp = (EWD0065DSMessage) mp.getMessageRecord("EWD0065DS");
			msgHelp.setRCVUSR(user.getH01USR());
			
			setMessageField(msgHelp, "RCVTYP", req.getParameter("Type"));
			setMessageField(msgHelp, "RCVFRC", req.getParameter("FromRecord"));
			setMessageField(msgHelp, "RCVSEL", req.getParameter("CusType"));
			if (msgHelp.getRCVTYP().equals("I")) {
				IdentificationData idData = new IdentificationData(
					req.getParameter("NameSearch"), 
					req.getParameter("country") == null ? user.getE01CTR() : req.getParameter("country"), 
					req.getParameter("legalType") == null ? "" : req.getParameter("legalType"));
				setMessageField(msgHelp, "RCVSHR", idData.getIdentification());
			} else {
				setMessageField(msgHelp, "RCVSHR", req.getParameter("NameSearch"));
			}
			
			req.setAttribute("NameSearch", msgHelp.getRCVSHR());
			req.setAttribute("Type", msgHelp.getRCVTYP());
			req.setAttribute("CusType", msgHelp.getRCVSEL());
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("SNDOPE", "SNDREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					EWD0065DSMessage msgHelpS = (EWD0065DSMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelpS.getSNDNUM()
							+ "','"
							+ Util.formatJavascript(msgHelpS.getField("SNDNME"))
							+ "','"
							+ msgHelpS.getSNDLGT()
							+ "')\">"
							+ msgHelpS.getSNDNUM()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelpS.getSNDNUM()
							+ "','"
							+ Util.formatJavascript(msgHelpS.getField("SNDNME"))
							+ "','"
							+ msgHelpS.getSNDLGT()
							+ "')\">"
							+ msgHelpS.getSNDNME()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelpS.getSNDNUM()
							+ "','"
							+ Util.formatJavascript(msgHelpS.getField("SNDNME"))
							+ "','"
							+ msgHelpS.getSNDLGT()
							+ "')\">"
							+ msgHelpS.getSNDIDN()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelpS.getSNDNUM()
							+ "','"
							+ Util.formatJavascript(msgHelpS.getField("SNDNME"))
							+ "','"
							+ msgHelpS.getSNDLGT()
							+ "')\">"
							+ msgHelpS.getSDSLGT()
							+ "</a></td>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSNDNUM()
								+ "','"
								+ Util.formatJavascript(msgHelpS.getField("SNDNME"))
								+ "','"
								+ msgHelpS.getRCVUSR()
								+ "')\">"
								+ msgHelpS.getRCVUSR()
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("ewd0001Help", beanList);
				pageName = "EWD0065_helpmessage.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

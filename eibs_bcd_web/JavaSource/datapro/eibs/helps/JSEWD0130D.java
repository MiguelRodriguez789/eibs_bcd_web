package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0130DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0130D extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {

		String argsp = req.getParameter("args") == null || req.getParameter("args").equals("") ? "0" : req.getParameter("args");
		int args; 
		try {
			args = Integer.parseInt(argsp);
		} catch (Exception e) {
			args = 0;
		}	
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0130", req);
			EWD0130DSMessage msgHelp = (EWD0130DSMessage) mp.getMessageRecord("EWD0130DS");
			msgHelp.setBNKUSR(user.getH01USR());
			msgHelp.setBNKNME(
					req.getParameter("NameSearch").toUpperCase());
			try {	
				msgHelp.setBNKPVI(req.getParameter("PmtVia").toUpperCase());
			} catch (Exception e){
				msgHelp.setBNKPVI("S");	 
			}
			
			mp.sendMessage(msgHelp);
			
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			StringBuffer myRow = null;
			JBList beanList = new JBList();

			if (!mp.hasError(newmessage)) {
				msgHelp = (EWD0130DSMessage) newmessage;
				while (!(msgHelp.getBNKPVI().equals("9"))) {
					myRow = new StringBuffer("<TR>");
					if (args == 4) {
						myRow.append(
								"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getBNKID()
								+ "','"
								+ msgHelp.getBNKNME()
								+ "','"
								+ msgHelp.getBNKCTY()
								+ "','"
								+ msgHelp.getBNKCTR()
								+ "')\">"
								+ msgHelp.getBNKID()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getBNKID()
								+ "','"
								+ msgHelp.getBNKNME()
								+ "','"
								+ msgHelp.getBNKCTY()
								+ "','"
								+ msgHelp.getBNKCTR()
								+ "')\">"
								+ msgHelp.getBNKNME()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getBNKID()
								+ "','"
								+ msgHelp.getBNKNME()
								+ "','"
								+ msgHelp.getBNKCTY()
								+ "','"
								+ msgHelp.getBNKCTR()
								+ "')\">"
								+ msgHelp.getBNKCTR()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getBNKID()
								+ "','"
								+ msgHelp.getBNKNME()
								+ "','"
								+ msgHelp.getBNKCTY()
								+ "','"
								+ msgHelp.getBNKCTR()
								+ "')\">"
								+ msgHelp.getBNKSTA()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getBNKID()
								+ "','"
								+ msgHelp.getBNKNME()
								+ "','"
								+ msgHelp.getBNKCTY()
								+ "','"
								+ msgHelp.getBNKCTR()
								+ "')\">"
								+ msgHelp.getBNKCTY()
								+ "</a></td>");
					} else {
						myRow.append(
								"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getBNKID()
								+ "','"
								+ msgHelp.getBNKNME()
								+ "')\">"
								+ msgHelp.getBNKID()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getBNKID()
								+ "','"
								+ msgHelp.getBNKNME()
								+ "')\">"
								+ msgHelp.getBNKNME()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getBNKID()
								+ "','"
								+ msgHelp.getBNKNME()
								+ "')\">"
								+ msgHelp.getBNKCTR()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getBNKID()
								+ "','"
								+ msgHelp.getBNKNME()
								+ "')\">"
								+ msgHelp.getBNKSTA()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getBNKID()
								+ "','"
								+ msgHelp.getBNKNME()
								+ "')\">"
								+ msgHelp.getBNKCTY()
								+ "</a></td>");
					}
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
					msgHelp = (EWD0130DSMessage) mp.receiveMessageRecord("EWD0130DS");
				}
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("bankIdHelp", beanList);
			
			req.setAttribute("NameSearch", req.getParameter("NameSearch"));
			
			forward("EWD0130D_bankid_help_helpmessage.jsp", req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

}

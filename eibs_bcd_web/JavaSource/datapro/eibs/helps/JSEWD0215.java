package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0215DSMessage;
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
public class JSEWD0215 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0215", req);
			EWD0215DSMessage msgHelp = (EWD0215DSMessage) mp.getMessageRecord("EWD0215DS");
			try {
				msgHelp.setEWDCOD(req.getParameter("Code").trim());
			} catch (Exception e) {
				msgHelp.setEWDCOD("");
			}
			
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
					msgHelp = (EWD0215DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDPLN()
								+ "','"
								+ msgHelp.getEWDDSC()
								+ "','"
								+ msgHelp.getEWDFAC()
								+ "','"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDPBS()
								+ "')\">"
								+ msgHelp.getEWDPLN()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDPLN()
								+ "','"
								+ msgHelp.getEWDDSC()
								+ "','"
								+ msgHelp.getEWDFAC()
								+ "','"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDPBS()
								+ "')\">"
								+ msgHelp.getEWDDSC()
								+ "</a></td>");
						myRow.append(
							"<td nowrap align=center><a href=\"javascript:enter('"
								+ msgHelp.getEWDPLN()
								+ "','"
								+ msgHelp.getEWDDSC()
								+ "','"
								+ msgHelp.getEWDFAC()
								+ "','"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDPBS()
								+ "')\">"
								+ msgHelp.getEWDPMI()
								+ "</a></td>");
						myRow.append(
								"<td nowrap align=center><a href=\"javascript:enter('"
									+ msgHelp.getEWDPLN()
									+ "','"
									+ msgHelp.getEWDDSC()
									+ "','"
									+ msgHelp.getEWDFAC()
									+ "','"
									+ msgHelp.getEWDTBL()
									+ "','"
									+ msgHelp.getEWDPBS()
									+ "')\">"
									+ msgHelp.getEWDPMX()
									+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0215Help", beanList);
				
				pageName = "EWD0215_tabla_seguros_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

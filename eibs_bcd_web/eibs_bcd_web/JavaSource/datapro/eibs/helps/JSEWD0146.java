package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0146DSMessage;
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
public class JSEWD0146 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String SEL = req.getParameter("SEL") == null ? "1" : req.getParameter("SEL");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0146", req);
			EWD0146DSMessage msgHelp = (EWD0146DSMessage) mp.getMessageRecord("EWD0146DS");
			
			if ("1".equals(SEL)) {
				try {
					msgHelp.setE01SELCUN(req.getParameter("CUN").trim());
				} catch (Exception e) {
					msgHelp.setE01SELCUN("0");
				}
				msgHelp.setE01SELIDE("");
			} else {
				try {
					msgHelp.setE01SELIDE(req.getParameter("ID").trim());
				} catch (Exception e) {
					msgHelp.setE01SELIDE("");
				}
				msgHelp.setE01SELCUN("0");
			}
			msgHelp.setE01SELSTS("A");
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("E01ENDFLD");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0146DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td NOWRAP ><a href=\"javascript:enter('"
								+ msgHelp.getE01DLHNRO()
								+ "')\">"
								+ Util.formatCell(msgHelp.getE01DLHNRO())
								+ "</a></td>");
						myRow.append(
							"<td NOWRAP ><a href=\"javascript:enter('"
								+ msgHelp.getE01DLHNRO()
								+ "')\">"
								+ Util.formatCell(msgHelp.getE01DLHIDN())
								+ "</a></td>");
						myRow.append(
							"<td NOWRAP ><a href=\"javascript:enter('"
								+ msgHelp.getE01DLHNRO()
								+ "')\">"
								+ Util.formatCell(msgHelp.getE01DLHCUN())
								+ "</a></td>");
						myRow.append(
							"<td NOWRAP ><a href=\"javascript:enter('"
								+ msgHelp.getE01DLHNRO()
								+ "')\">"
								+ Util.formatCell(msgHelp.getE01DLHNME())
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				req.setAttribute("NameSearch", req.getParameter("NameSearch"));
				req.setAttribute("FromRecord", req.getParameter("FromRecord"));
					
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0146Help", beanList);
				
				pageName = "EWD0146_colldraft_help_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

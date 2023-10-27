package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0036DSMessage;
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
public class JSEWD0036 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0036", req);
			EWD0036DSMessage msgHelp = (EWD0036DSMessage) mp.getMessageRecord("EWD0036DS");
			try { 
				msgHelp.setEWDBNK(req.getParameter("Bank") == null ? "01" : req.getParameter("Bank"));
			} catch (Exception e) {
				msgHelp.setEWDBNK("01");
			}
			try { 
				msgHelp.setEWDACD(req.getParameter("App") == null ? "" : req.getParameter("App"));
			} catch (Exception e) {
				msgHelp.setEWDACD("");
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
					msgHelp = (EWD0036DSMessage) list.getRecord();
					String myDesc =
						(msgHelp.getEWDDSC().length() > 25)
							? msgHelp.getEWDDSC().substring(0, 25)
							: msgHelp.getEWDDSC();
							myDesc =
								(msgHelp.getEWDDSC().length() > 25)
									? msgHelp.getEWDDSC().substring(0, 25)
									: msgHelp.getEWDDSC();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ myDesc
								+ "','"
								+ msgHelp.getEWDGLN()
								+ "','"
								+ msgHelp.getEWDOPC()
								+ "','"
								+ msgHelp.getEWDSOU()
								+ "','"
								+ msgHelp.getEWDDIB()
								+ "','"
								+ msgHelp.getEWDUCD()
								+ "')\">"
								+ msgHelp.getEWDOPC()
								+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ myDesc
							+ "','"
							+ msgHelp.getEWDGLN()
							+ "','"
							+ msgHelp.getEWDOPC()
							+ "','"
							+ msgHelp.getEWDSOU()
							+ "','"
							+ msgHelp.getEWDDIB()
							+ "','"
							+ msgHelp.getEWDUCD()
							+ "')\">"
							+ myDesc
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ myDesc
							+ "','"
							+ msgHelp.getEWDGLN()
							+ "','"
							+ msgHelp.getEWDOPC()
							+ "','"
							+ msgHelp.getEWDSOU()
							+ "','"
							+ msgHelp.getEWDDIB()
							+ "','"
							+ msgHelp.getEWDUCD()
							+ "')\">"
							+ msgHelp.getEWDGLN()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ myDesc
							+ "','"
							+ msgHelp.getEWDGLN()
							+ "','"
							+ msgHelp.getEWDOPC()
							+ "','"
							+ msgHelp.getEWDSOU()
							+ "','"
							+ msgHelp.getEWDDIB()
							+ "','"
							+ msgHelp.getEWDUCD()
							+ "')\">"
							+ msgHelp.getEWDSOU()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ myDesc
							+ "','"
							+ msgHelp.getEWDGLN()
							+ "','"
							+ msgHelp.getEWDOPC()
							+ "','"
							+ msgHelp.getEWDSOU()
							+ "','"
							+ msgHelp.getEWDDIB()
							+ "','"
							+ msgHelp.getEWDUCD()
							+ "')\">"
							+ msgHelp.getEWDDIB()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ myDesc
							+ "','"
							+ msgHelp.getEWDGLN()
							+ "','"
							+ msgHelp.getEWDOPC()
							+ "','"
							+ msgHelp.getEWDSOU()
							+ "','"
							+ msgHelp.getEWDDIB()
							+ "','"
							+ msgHelp.getEWDUCD()
							+ "')\">"
							+ msgHelp.getEWDUCD()
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0036Help", beanList);
				
				pageName = "EWD0036_concept_helpmessage.jsp";
			}
			
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

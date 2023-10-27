package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0035DSMessage;
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
public class JSEWD0035 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0035", req);
			EWD0035DSMessage msgHelp = (EWD0035DSMessage) mp.getMessageRecord("EWD0035DS");
			msgHelp.setEWDBNK(Util.getReqParameter("Bank", req));
			msgHelp.setEWDACD(Util.getReqParameter("App", req));
			msgHelp.setEWDMOD(Util.getReqParameter("Mode", req));
			msgHelp.setEWDPRD(Util.getReqParameter("prdCode", req));
			msgHelp.setEWDCCY(Util.getReqParameter("CCY", req));
			
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
					msgHelp = (EWD0035DSMessage) list.getRecord();
					String myDesc =
						(msgHelp.getEWDDSC().length() > 45)
							? msgHelp.getEWDDSC().substring(0, 45)
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
							+ msgHelp.getEWDTYP()
							+ "','"
							+ msgHelp.getEWDCCY()
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
							+ msgHelp.getEWDTYP()
							+ "','"
							+ msgHelp.getEWDCCY()
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
								+ msgHelp.getEWDTYP()
								+ "','"
								+ msgHelp.getEWDCCY()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDCCY())
								+ "</a></td>");					
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ myDesc
							+ "','"
							+ msgHelp.getEWDGLN()
							+ "','"
							+ msgHelp.getEWDOPC()
							+ "','"
							+ msgHelp.getEWDTYP()
							+ "','"
							+ msgHelp.getEWDCCY()
							+ "')\">"
							+ msgHelp.getEWDGLN()
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0035Help", beanList);
				
				pageName = "EWD0035_concept_helpmessage.jsp";
			}
			
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

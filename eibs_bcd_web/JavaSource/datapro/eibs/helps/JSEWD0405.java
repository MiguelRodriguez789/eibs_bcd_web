package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0405DSMessage;
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
public class JSEWD0405 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0405", req);
			EWD0405DSMessage msgHelp = (EWD0405DSMessage) mp.getMessageRecord("EWD0405DS");
			try {
				msgHelp.setEWDSBK(req.getParameter("shrBank").trim());
			} catch (Exception e) {
				msgHelp.setEWDSBK("");
			}
			try {
				msgHelp.setEWDSGL(req.getParameter("NameSearch").trim());
			} catch (Exception e) {
				msgHelp.setEWDSGL("0");
			}
			try {
				msgHelp.setEWDSBR(req.getParameter("shrBranch").toUpperCase());
			} catch (Exception e) {
				msgHelp.setEWDSBR("0");
			}
			try {
				msgHelp.setEWDSCY(req.getParameter("shrCurrency").toUpperCase());
			} catch (Exception e) {
				msgHelp.setEWDSCY("");
			}
			try {
				msgHelp.setEWDSCA(req.getParameter("shrAppCode").toUpperCase());
			} catch (Exception e) {
				msgHelp.setEWDSCA("");
			}
			try {
				msgHelp.setEWDREC(req.getParameter("FromRecord").trim());
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
					msgHelp = (EWD0405DSMessage) list.getRecord();
					String enter = "<td nowrap ><a href=\"javascript:enter('"
						+ msgHelp.getEWDBNK() + "','"
						+ msgHelp.getEWDBRN() + "','"
						+ msgHelp.getEWDCCY() + "','"
						+ msgHelp.getEWDGLN() + "','"
						+ msgHelp.getEWDACC()
						+ "')\"> ";	
					myRow = new StringBuffer("<TR>");
					myRow.append(enter
							+ Util.formatCell(msgHelp.getEWDBNK())
							+ "</a></td>");
					myRow.append(enter
							+ Util.formatCell(msgHelp.getEWDBRN())
							+ "</a></td>");
					myRow.append(enter
							+ Util.formatCell(
								msgHelp.getEWDCCY().toUpperCase())
							+ "</a></td>");
					myRow.append(enter
							+ Util.formatCell(msgHelp.getEWDGLN())
							+ "</a></td>");
					myRow.append(enter
							+ Util.formatCell(msgHelp.getEWDACC())
							+ "</a></td>");
					myRow.append(enter
							+ Util.formatCell(msgHelp.getEWDDSC())
							+ "</a></td>");
					myRow.append(enter
							+ Util.formatCell(msgHelp.getEWDCLS())
							+ "</a></td>");
					myRow.append(enter
							+ Util.formatCell(msgHelp.getEWDATY())
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0405Help", beanList);
				
				pageName = "EWD0405_amortization_help_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0437DSMessage;
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
public class JSEWD0437 extends JSEIBSServlet {

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
			mp = getMessageProcessor("EWD0437", req);
			EWD0437DSMessage msgHelp = (EWD0437DSMessage) mp.getMessageRecord("EWD0437DS");
			msgHelp.setRWDUSR(user.getH01USR());
			msgHelp.setSWDMAR(req.getParameter("NameSearch") == null ? "0" : req.getParameter("NameSearch").toUpperCase());
			msgHelp.setSWDTYP(req.getParameter("Type") == null ? "" : req.getParameter("Type"));
			msgHelp.setSWDMOD(req.getParameter("Model") == null ? "" : req.getParameter("Model"));
			int record;
			try {
				record = Integer.parseInt(req.getParameter("FromRecord"));
			} catch (Exception e) {
				record = 0;
			}
			msgHelp.setRWDFRC(String.valueOf(record));
				
			mp.sendMessage(msgHelp);
			
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
					EWD0437DSMessage msgHelpS = (EWD0437DSMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelpS.getSWDMAR()
							+ "','"
							+ msgHelpS.getRWDCOD()
							+ "','"
							+ msgHelpS.getSWDCLA()
							+ "','"
							+ msgHelpS.getSWDSER()
							+ "','"
							+ msgHelpS.getSWDEST()
							+ "','"
							+ msgHelpS.getSWDRE1()
							+ "','"
							+ msgHelpS.getSWDRE2()
							+ "','"
							+ msgHelpS.getSWDA30()
							+ "')\">"
							+ msgHelpS.getSWDMAR()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelpS.getSWDMAR()
							+ "','"
							+ msgHelpS.getRWDCOD()
							+ "','"
							+ msgHelpS.getSWDCLA()
							+ "','"
							+ msgHelpS.getSWDSER()
							+ "','"
							+ msgHelpS.getSWDEST()
							+ "','"
							+ msgHelpS.getSWDRE1()
							+ "','"
							+ msgHelpS.getSWDRE2()
							+ "','"
							+ msgHelpS.getSWDA30()
							+ "')\">"
							+ msgHelpS.getRWDCOD()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelpS.getSWDMAR()
							+ "','"
							+ msgHelpS.getRWDCOD()
							+ "','"
							+ msgHelpS.getSWDCLA()
							+ "','"
							+ msgHelpS.getSWDSER()
							+ "','"
							+ msgHelpS.getSWDEST()
							+ "','"
							+ msgHelpS.getSWDRE1()
							+ "','"
							+ msgHelpS.getSWDRE2()
							+ "','"
							+ msgHelpS.getSWDA30()
							+ "')\">"
							+ msgHelpS.getSWDCLA()
							+ "</a></td>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDMAR()
								+ "','"
								+ msgHelpS.getRWDCOD()
								+ "','"
								+ msgHelpS.getSWDCLA()
								+ "','"
								+ msgHelpS.getSWDSER()
								+ "','"
								+ msgHelpS.getSWDEST()
								+ "','"
								+ msgHelpS.getSWDRE1()
								+ "','"
								+ msgHelpS.getSWDRE2()
								+ "','"
								+ msgHelpS.getSWDA30()
								+ "')\">"
								+ msgHelpS.getSWDSER()
								+ "</a></td>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDMAR()
								+ "','"
								+ msgHelpS.getRWDCOD()
								+ "','"
								+ msgHelpS.getSWDCLA()
								+ "','"
								+ msgHelpS.getSWDSER()
								+ "','"
								+ msgHelpS.getSWDEST()
								+ "','"
								+ msgHelpS.getSWDRE1()
								+ "','"
								+ msgHelpS.getSWDRE2()
								+ "','"
								+ msgHelpS.getSWDA30()
								+ "')\">"
								+ msgHelpS.getSWDEST()
								+ "</a></td>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDMAR()
								+ "','"
								+ msgHelpS.getRWDCOD()
								+ "','"
								+ msgHelpS.getSWDCLA()
								+ "','"
								+ msgHelpS.getSWDSER()
								+ "','"
								+ msgHelpS.getSWDEST()
								+ "','"
								+ msgHelpS.getSWDRE1()
								+ "','"
								+ msgHelpS.getSWDRE2()
								+ "','"
								+ msgHelpS.getSWDA30()
								+ "')\">"
								+ msgHelpS.getSWDRE1()
								+ "</a></td>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDMAR()
								+ "','"
								+ msgHelpS.getRWDCOD()
								+ "','"
								+ msgHelpS.getSWDCLA()
								+ "','"
								+ msgHelpS.getSWDSER()
								+ "','"
								+ msgHelpS.getSWDEST()
								+ "','"
								+ msgHelpS.getSWDRE1()
								+ "','"
								+ msgHelpS.getSWDRE2()
								+ "','"
								+ msgHelpS.getSWDA30()
								+ "')\">"
								+ msgHelpS.getSWDRE2()
								+ "</a></td>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDMAR()
								+ "','"
								+ msgHelpS.getRWDCOD()
								+ "','"
								+ msgHelpS.getSWDCLA()
								+ "','"
								+ msgHelpS.getSWDSER()
								+ "','"
								+ msgHelpS.getSWDEST()
								+ "','"
								+ msgHelpS.getSWDRE1()
								+ "','"
								+ msgHelpS.getSWDRE2()
								+ "','"
								+ msgHelpS.getSWDA30()
								+ "')\">"
								+ msgHelpS.getSWDA30()
								+ "</a></td>");

					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				req.setAttribute("NameSearch", req.getParameter("NameSearch"));
				req.setAttribute("Type", req.getParameter("Type"));
				req.setAttribute("Model", req.getParameter("Model"));
				
				session.setAttribute("EWD0437Help", beanList);
				pageName = "EWD0437_fasec_desc_id_help_helpmessage.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

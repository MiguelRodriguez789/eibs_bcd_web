package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0308DSMessage;
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
public class JSEWD0308I extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0308", req);
			EWD0308DSMessage msgHelp = (EWD0308DSMessage) mp.getMessageRecord("EWD0308DS");
			msgHelp.setRWDTYP("");
			msgHelp.setSWDSTS("A");
			try { //Description
				msgHelp.setSWDDSC(req.getParameter("DESCRIPTION").trim());
			} catch (Exception e) {
				msgHelp.setSWDDSC("");
			}
			try { //Instrument Type
				msgHelp.setSWDPTY(req.getParameter("INSTTYPE").trim());
			} catch (Exception e) {
				msgHelp.setSWDPTY("");
			}
			try { //From Pos
				msgHelp.setRWDFRC(req.getParameter("Pos").trim());
			} catch (Exception e) {
				msgHelp.setRWDFRC("0");
			}
			
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
					msgHelp = (EWD0308DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					if (msgHelp.getSWDISIOPE().trim().equals("")) {
						myRow.append(
								"<TD NOWRAP  ALIGN=RIGHT><a href=\"javascript:enter('"
									+ msgHelp.getSWDIIC()
									+ "','"
									+ msgHelp.getSWDDSC()
									+ "','"
									+ msgHelp.getSWDBCY()
									+ "','"
									+ msgHelp.getSWDSYM()
									+ "','"
									+ msgHelp.getSWDNUM()
									+ "','"
									+ msgHelp.getSWDCUS()
									+ "','"
									+ msgHelp.getSWDPTY()
									+ "')\">"
									+ msgHelp.getSWDIIC()
									+ "</a></td>");
					} else {
						myRow.append(
								"<TD NOWRAP  ALIGN=RIGHT><img src=\"../images/maintenance.gif\" title=\"Pending\" align=\"absmiddle\" border=\"0\" ><a href=\"javascript:enter('"
									+ msgHelp.getSWDIIC()
									+ "','"
									+ msgHelp.getSWDDSC()
									+ "','"
									+ msgHelp.getSWDBCY()
									+ "','"
									+ msgHelp.getSWDSYM()
									+ "','"
									+ msgHelp.getSWDNUM()
									+ "','"
									+ msgHelp.getSWDCUS()
									+ "','"
									+ msgHelp.getSWDPTY()
									+ "')\">"
									+ msgHelp.getSWDIIC()
									+ "</a></td>");
					}
					myRow.append(
							"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
								+ msgHelp.getSWDIIC()
								+ "','"
								+ msgHelp.getSWDDSC()
								+ "','"
								+ msgHelp.getSWDBCY()
								+ "','"
								+ msgHelp.getSWDSYM()
								+ "','"
								+ msgHelp.getSWDNUM()
								+ "','"
								+ msgHelp.getSWDCUS()
								+ "','"
								+ msgHelp.getSWDPTY()
								+ "')\">"
								+ msgHelp.getSWDDSC()
								+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getSWDIIC()
							+ "','"
							+ msgHelp.getSWDDSC()
							+ "','"
							+ msgHelp.getSWDBCY()
							+ "','"
							+ msgHelp.getSWDSYM()
							+ "','"
							+ msgHelp.getSWDNUM()
							+ "','"
							+ msgHelp.getSWDCUS()
							+ "','"
							+ msgHelp.getSWDPTY()
							+ "')\">"
							+ msgHelp.getSWDBCY()
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getSWDIIC()
							+ "','"
							+ msgHelp.getSWDDSC()
							+ "','"
							+ msgHelp.getSWDBCY()
							+ "','"
							+ msgHelp.getSWDSYM()
							+ "','"
							+ msgHelp.getSWDNUM()
							+ "','"
							+ msgHelp.getSWDCUS()
							+ "','"
							+ msgHelp.getSWDPTY()
							+ "')\">"
							+ msgHelp.getSWDPTY()
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getSWDIIC()
							+ "','"
							+ msgHelp.getSWDDSC()
							+ "','"
							+ msgHelp.getSWDBCY()
							+ "','"
							+ msgHelp.getSWDSYM()
							+ "','"
							+ msgHelp.getSWDNUM()
							+ "','"
							+ msgHelp.getSWDCUS()
							+ "','"
							+ msgHelp.getSWDPTY()
							+ "')\">"
							+ msgHelp.getSWDSYM()
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getSWDIIC()
							+ "','"
							+ msgHelp.getSWDDSC()
							+ "','"
							+ msgHelp.getSWDBCY()
							+ "','"
							+ msgHelp.getSWDSYM()
							+ "','"
							+ msgHelp.getSWDNUM()
							+ "','"
							+ msgHelp.getSWDCUS()
							+ "','"
							+ msgHelp.getSWDPTY()
							+ "')\">"
							+ msgHelp.getSWDNUM()
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getSWDIIC()
							+ "','"
							+ msgHelp.getSWDDSC()
							+ "','"
							+ msgHelp.getSWDBCY()
							+ "','"
							+ msgHelp.getSWDSYM()
							+ "','"
							+ msgHelp.getSWDNUM()
							+ "','"
							+ msgHelp.getSWDCUS()
							+ "','"
							+ msgHelp.getSWDPTY()
							+ "')\">"
							+ msgHelp.getSWDCUS()
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getSWDIIC()
							+ "','"
							+ msgHelp.getSWDDSC()
							+ "','"
							+ msgHelp.getSWDBCY()
							+ "','"
							+ msgHelp.getSWDSYM()
							+ "','"
							+ msgHelp.getSWDNUM()
							+ "','"
							+ msgHelp.getSWDCUS()
							+ "','"
							+ msgHelp.getSWDPTY()
							+ "')\">"
							+ msgHelp.getSWDSTS()
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getSWDIIC()
							+ "','"
							+ msgHelp.getSWDDSC()
							+ "','"
							+ msgHelp.getSWDBCY()
							+ "','"
							+ msgHelp.getSWDSYM()
							+ "','"
							+ msgHelp.getSWDNUM()
							+ "','"
							+ msgHelp.getSWDCUS()
							+ "','"
							+ msgHelp.getSWDPTY()
							+ "')\">"
							+ msgHelp.getSWDEMI()
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getSWDIIC()
							+ "','"
							+ msgHelp.getSWDDSC()
							+ "','"
							+ msgHelp.getSWDBCY()
							+ "','"
							+ msgHelp.getSWDSYM()
							+ "','"
							+ msgHelp.getSWDNUM()
							+ "','"
							+ msgHelp.getSWDCUS()
							+ "','"
							+ msgHelp.getSWDPTY()
							+ "')\">"
							+ Util.formatDate(
								msgHelp.getSWDSD1(),
								msgHelp.getSWDSD2(),
								msgHelp.getSWDSD3())
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				req.setAttribute("DESCRIPTION", req.getParameter("DESCRIPTION"));
				req.setAttribute("INSTTYPE", req.getParameter("INSTTYPE"));
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0308Help", beanList);
				
				pageName = "EWD0308F_inv_inst_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

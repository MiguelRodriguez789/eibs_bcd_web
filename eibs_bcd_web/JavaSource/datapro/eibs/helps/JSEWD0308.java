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
public class JSEWD0308 extends JSEIBSServlet {

	
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
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("SWDOPE");
			
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
					myRow.append(
							"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
								+ msgHelp.getSWDIIC()
								+ "','"
								+ msgHelp.getSWDDSC()
								+ "','"
								+ msgHelp.getSWDBCY()
								+ "')\">"
								+ msgHelp.getSWDIIC()
								+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getSWDIIC()
							+ "','"
							+ msgHelp.getSWDDSC()
							+ "','"
							+ msgHelp.getSWDBCY()
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
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0308Help", beanList);
				
				pageName = "EWD0308_inv_inst_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

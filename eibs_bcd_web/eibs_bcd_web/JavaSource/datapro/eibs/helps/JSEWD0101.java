package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0101DSMessage;
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
public class JSEWD0101 extends JSEIBSServlet {

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
			mp = getMessageProcessor("EWD0101", req);
			EWD0101DSMessage msgHelp = (EWD0101DSMessage) mp.getMessageRecord("EWD0101DS");
			msgHelp.setEWDSTY(req.getParameter("Search") == null ? "" : req.getParameter("Search").toUpperCase());
			int customer;
			try {
				customer = Integer.parseInt(req.getParameter("EWDCUN"));
			} catch (Exception e) {
				customer = 0;
			}
			msgHelp.setEWDCUN(String.valueOf(customer));
			msgHelp.setEWDCRF(req.getParameter("EWDCRF") == null ? "" : req.getParameter("EWDCRF"));
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				String myRow = "";
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0101DSMessage) list.getRecord();
					myRow = "<TR>";
					myRow += "<td nowrap align=\"center\"><a href=\"javascript:enter('"
						+ msgHelp.getEWDTBL()
						+ "')\">"
						+ Util.formatCell(msgHelp.getEWDTBL())
						+ "</a></td>";
					myRow += "<td nowrap align=\"center\"><a href=\"javascript:enter('"
						+ msgHelp.getEWDTBL()
						+ "')\">"
						+ Util.formatCell(msgHelp.getEWDTBK())
						+ "</a></td>";
					myRow += "<td nowrap align=\"center\"><a href=\"javascript:enter('"
						+ msgHelp.getEWDTBL()
						+ "')\">"
						+ msgHelp.getEWDTCY()
						+ "</a></td>";
					myRow += "<td nowrap align=\"center\"><a href=\"javascript:enter('"
						+ msgHelp.getEWDTBL()
						+ "')\">"
						+ msgHelp.getEWDTYP()
						+ "</a></td>";
					myRow += "<td nowrap align=\"center\"><a href=\"javascript:enter('"
						+ msgHelp.getEWDTBL()
						+ "')\">"
						+ msgHelp.getEWDCUS()
						+ "</a></td>";
					myRow += "<td nowrap><a href=\"javascript:enter('"
						+ msgHelp.getEWDTBL()
						+ "')\">"
						+ msgHelp.getEWDDSC()
						+ "</a></td>";
					myRow += "</TR>";
					beanList.addRow("", myRow);
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("ewd0101Help", beanList);
				pageName = "EWD0101_tariff_lc_helpmessage.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

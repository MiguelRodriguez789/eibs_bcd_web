package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0010DSMessage;
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
public class JSEWD0010 extends JSEIBSServlet {

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
			mp = getMessageProcessor("EWD0010", req);
			EWD0010DSMessage msgHelp = (EWD0010DSMessage) mp.getMessageRecord("EWD0010DS");
			msgHelp.setEWDSGL(req.getParameter("NameSearch") == null ? "0" : req.getParameter("NameSearch").toUpperCase());
			msgHelp.setEWDSBK(req.getParameter("shrBank") == null ? "01" : req.getParameter("shrBank"));
			msgHelp.setEWDSCA(req.getParameter("shrAppCode") == null ? "" : req.getParameter("shrAppCode"));
			msgHelp.setEWDSCY(req.getParameter("shrCurrency") == null ? "" : req.getParameter("shrCurrency").toUpperCase());
			msgHelp.setEWDSTY(req.getParameter("shrType") == null ? "" : req.getParameter("shrType").toUpperCase());
			int record;
			try {
				record = Integer.parseInt(req.getParameter("FromRecord"));
			} catch (Exception e) {
				record = 0;
			}
			msgHelp.setEWDREC(String.valueOf(record));
			
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
					msgHelp = (EWD0010DSMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<td NOWRAP align=\"center\"><a href=\"javascript:enter('"
							+ msgHelp.getEWDGLN()
							+ "','"
							+ msgHelp.getEWDDSC()
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDBNK())
							+ "</a></td>");
					myRow.append(
						"<td NOWRAP align=\"center\"><a href=\"javascript:enter('"
							+ msgHelp.getEWDGLN()
							+ "','"
							+ msgHelp.getEWDDSC()
							+ "')\">"
							+ Util.formatCell(
								msgHelp.getEWDCCY().toUpperCase())
							+ "</a></td>");
					myRow.append(
						"<td NOWRAP align=\"center\"><a href=\"javascript:enter('"
							+ msgHelp.getEWDGLN()
							+ "','"
							+ msgHelp.getEWDDSC()
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDGLN())
							+ "</a></td>");
					myRow.append(
						"<td NOWRAP ><a href=\"javascript:enter('"
							+ msgHelp.getEWDGLN()
							+ "','"
							+ msgHelp.getEWDDSC()
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDDSC())
							+ "</a></td>");
					myRow.append(
						"<td NOWRAP align=\"center\"><a href=\"javascript:enter('"
							+ msgHelp.getEWDGLN()
							+ "','"
							+ msgHelp.getEWDDSC()
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDCLS())
							+ "</a></td>");
					myRow.append(
						"<td NOWRAP align=\"center\"><a href=\"javascript:enter('"
							+ msgHelp.getEWDGLN()
							+ "','"
							+ msgHelp.getEWDDSC()
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDATY())
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				req.setAttribute("NameSearch", req.getParameter("NameSearch"));
				req.setAttribute("shrBank",	req.getParameter("shrBank"));
				req.setAttribute("shrAppCode",	req.getParameter("shrAppCode"));
				req.setAttribute("shrCurrency",	req.getParameter("shrCurrency"));
				req.setAttribute("shrType",	req.getParameter("shrType"));
					
				session.setAttribute("ewd0010Help", beanList);
				pageName = "EWD0010_client_help_helpmessage.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.master.Util;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0208DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEWD0208 extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0208", req);
			EWD0208DSMessage msgHelp = (EWD0208DSMessage) mp.getMessageRecord("EWD0208DS");
			msgHelp.setEWDCUN(req.getParameter("EWDCUN") == null ? "0" : req.getParameter("EWDCUN"));
			
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
					msgHelp = (EWD0208DSMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<td nowrap align=\"center\"><a href=\"javascript:enter('"
							+ msgHelp.getEWDCDE()
							+ "','"
							+ Util.formatJavascript(msgHelp.getField("EWDDES"))
							+ "','"
							+ Util.formatJavascript(msgHelp.getField("EWDFL1"))
							+ "')\">"
							+ msgHelp.getEWDCDE()
							+ "</a></td>");
					myRow.append(
						"<td nowrap align=\"left\"><a href=\"javascript:enter('"
							+ msgHelp.getEWDCDE()
							+ "','"
							+ Util.formatJavascript(msgHelp.getField("EWDDES"))
							+ "','"
							+ Util.formatJavascript(msgHelp.getField("EWDFL1"))
							+ "')\">"
							+ msgHelp.getEWDDES()
							+ "</a></td>");
					myRow.append(
						"<td nowrap align=\"center\"><a href=\"javascript:enter('"
							+ msgHelp.getEWDCDE()
							+ "','"
							+ Util.formatJavascript(msgHelp.getField("EWDDES"))
							+ "','"
							+ Util.formatJavascript(msgHelp.getField("EWDFL1"))
							+ "')\">"
							+ Util.formatCustomDate(user.getE01DTF(),msgHelp.getBigDecimalEWDFVM().intValue(),msgHelp.getBigDecimalEWDFVD().intValue(),msgHelp.getBigDecimalEWDFVY().intValue())
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("help", beanList);
				pageName = "EWD0208_convenio_help.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

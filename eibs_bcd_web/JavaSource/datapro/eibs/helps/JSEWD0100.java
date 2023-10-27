package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0100DSMessage;
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
public class JSEWD0100 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		String rateType = "";
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EWD0100", req);
			EWD0100DSMessage msgHelp = (EWD0100DSMessage) mp.getMessageRecord("EWD0100DS");
			
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
					msgHelp = (EWD0100DSMessage) list.getRecord();
				
					if ("2".equals(msgHelp.getEWDTYP())) {
						rateType = " Conversion ";
					} else if("1".equals(msgHelp.getEWDTYP())) {
						rateType = " Efectiva ";
					}else{
						rateType = " Nominal ";
					}
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDTYP()
								+ "','"
								+ msgHelp.getEWDNME()
								+ "','"
								+ msgHelp.getEWDPRT()
								+ "','"
								+ msgHelp.getEWDSRT()
								+ "')\">"
								+ msgHelp.getEWDTBL()
								+ "</a></td>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDTYP()
								+ "','"
								+ msgHelp.getEWDNME()
								+ "','"
								+ msgHelp.getEWDPRT()
								+ "','"
								+ msgHelp.getEWDSRT()
								+ "')\">"
								+ msgHelp.getEWDNME()
								+ "</a></td>");
						myRow.append(
							"<td nowrap align=\"right\"><a href=\"javascript:enter('"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDTYP()
								+ "','"
								+ msgHelp.getEWDNME()
								+ "','"
								+ msgHelp.getEWDPRT()
								+ "','"
								+ msgHelp.getEWDSRT()
								+ "')\">"
								+ msgHelp.getEWDPRT()
								+ "</a></td>");
						myRow.append(
								"<td nowrap align=\"right\"><a href=\"javascript:enter('"
									+ msgHelp.getEWDTBL()
									+ "','"
									+ msgHelp.getEWDTYP()
									+ "','"
									+ msgHelp.getEWDNME()
									+ "','"
									+ msgHelp.getEWDPRT()
									+ "','"
									+ msgHelp.getEWDSRT()
									+ "')\">"
									+ msgHelp.getEWDSRT()
									+ "</a></td>");
						myRow.append(
							"<td nowrap align=\"left\"><a href=\"javascript:enter('"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDTYP()
								+ "','"
								+ msgHelp.getEWDNME()
								+ "','"
								+ msgHelp.getEWDPRT()
								+ "','"
								+ msgHelp.getEWDSRT()
								+ "')\">"
								+ rateType
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDTBL()
								+ "','"
								+ msgHelp.getEWDTYP()
								+ "','"
								+ msgHelp.getEWDNME()
								+ "','"
								+ msgHelp.getEWDPRT()
								+ "','"
								+ msgHelp.getEWDSRT()
								+ "')\">"
								+ Util.formatCustomDate(user.getE01DTF(),
									msgHelp.getBigDecimalEWDDTM().intValue(),
									msgHelp.getBigDecimalEWDDTD().intValue(),
									msgHelp.getBigDecimalEWDDTY().intValue())
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0100Help", beanList);
				
				pageName = "EWD0100_floating_rate_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

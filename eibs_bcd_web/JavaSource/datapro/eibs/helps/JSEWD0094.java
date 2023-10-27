package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0094DSMessage;
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
public class JSEWD0094 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0094", req);
			EWD0094DSMessage msgHelp = (EWD0094DSMessage) mp.getMessageRecord("EWD0094DS");
			if ("A".equals(req.getParameter("Type"))) {
				msgHelp.setEWDCOD("");
				msgHelp.setEWDDSC("");
			} else if ("C".equals(req.getParameter("Type"))) {
				try {
					msgHelp.setEWDCOD(req.getParameter("NameSearch").toUpperCase());
				} catch (Exception e) {
				   	msgHelp.setEWDCOD("");
				}
			   	msgHelp.setEWDDSC("");
			} else {
				msgHelp.setEWDCOD("");
				try {
				    msgHelp.setEWDDSC(req.getParameter("NameSearch").toUpperCase());
				} catch (Exception e) {
				   	msgHelp.setEWDDSC("");
				}
			}
			try {
				msgHelp.setEWDREC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgHelp.setEWDREC("0");
			}
			try {
				 msgHelp.setEWDTBL(req.getParameter("fieldFlag").trim());
			} catch (Exception e) {
				msgHelp.setEWDTBL("");
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
					msgHelp = (EWD0094DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getEWDCOD()
								+ "','"
								+ msgHelp.getEWDDSC()
								+ "')\">"
								+ msgHelp.getEWDCOD()										 
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
							    + msgHelp.getEWDCOD()
								+ "','"
								+ msgHelp.getEWDDSC()										 
								+ "')\">"										
								+ msgHelp.getEWDDSC() 
								+ "</a></td>");										
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				req.setAttribute("NameSearch",req.getParameter("NameSearch"));					 		
				req.setAttribute("Type", req.getParameter("Type"));
				req.setAttribute("fieldFlag", req.getParameter("fieldFlag"));
				req.setAttribute("nameTable", msgHelp.getEWDTDS());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0094Help", beanList);
				
				pageName = "EWD0094_client_desc_id_help_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0505RMessage;
import datapro.eibs.beans.EWD0505SMessage;
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
public class JSEWD0505 extends JSEIBSServlet {

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
			mp = getMessageProcessor("EWD0505", req);
			EWD0505RMessage msgHelp = (EWD0505RMessage) mp.getMessageRecord("EWD0505R");
			msgHelp.setRWDUSR(user.getH01USR());
			msgHelp.setRWDSHR(req.getParameter("NameSearch") == null ? "0" : req.getParameter("NameSearch").toUpperCase());
			msgHelp.setRWDTYP(req.getParameter("Type") == null ? "" : req.getParameter("Type"));
			int record;
			try {
				record = Integer.parseInt(req.getParameter("FromRecord"));
			} catch (Exception e) {
				record = 0;
			}
			msgHelp.setRWDFRC(String.valueOf(record));
			
			String Custype = req.getParameter("CusType") == null ? "" : req.getParameter("CusType"); 
			msgHelp.setRWDSEL(Custype);
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				String idn = "";
				list.initRow();
				while (list.getNextRow()) {
					EWD0505SMessage msgHelpS = (EWD0505SMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDCUN()
								+ "','"
								+ msgHelpS.getSWDNA1()
								+ "','"
								+ msgHelpS.getSWDIDN()
								+ "')\">"
								+ msgHelpS.getSWDCUN()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDCUN()
								+ "','"
								+ msgHelpS.getSWDNA1()
								+ "','"
								+ msgHelpS.getSWDIDN()
								+ "')\">"
								+ msgHelpS.getSWDNA1()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDCUN()
								+ "','"
								+ msgHelpS.getSWDNA1()
								+ "','"
								+ msgHelpS.getSWDIDN()
								+ "')\">"
								+ msgHelpS.getSWDIDN()
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
				req.setAttribute("CusType", Custype);
				
				session.setAttribute("EWD0505Help", beanList);
				pageName = "EWD0505_correspondent_desc_id_help_helpmessage.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0325DSMessage;
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
public class JSEWD0325 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0325", req);
			EWD0325DSMessage msgHelp = (EWD0325DSMessage) mp.getMessageRecord("EWD0325DS");
			msgHelp.setSWDTYP("");
			msgHelp.setRWDTYP("D");
			msgHelp.setSWDDID(user.getH01USR());
			
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
					msgHelp = (EWD0325DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getSWDDID()
								+ "','"
								+ msgHelp.getSWDACD()
								+ "','"
								+ msgHelp.getSWDTYP()
								+ "','"
								+ msgHelp.getSWDREF()
								+ "')\">"
								+ msgHelp.getSWDREF()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getSWDDID()
								+ "','"
								+ msgHelp.getSWDACD()
								+ "','"
								+ msgHelp.getSWDTYP()
								+ "','"
								+ msgHelp.getSWDREF()
								+ "')\">"
								+ msgHelp.getSWDDSC()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getSWDDID()
								+ "','"
								+ msgHelp.getSWDACD()
								+ "','"
								+ msgHelp.getSWDTYP()
								+ "','"
								+ msgHelp.getSWDREF()
								+ "')\">"
								+ msgHelp.getSWDTYP()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getSWDDID()
								+ "','"
								+ msgHelp.getSWDACD()
								+ "','"
								+ msgHelp.getSWDTYP()
								+ "','"
								+ msgHelp.getSWDREF()
								+ "')\">"
								+ msgHelp.getSWDCCY()
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getSWDDID()
								+ "','"
								+ msgHelp.getSWDACD()
								+ "','"
								+ msgHelp.getSWDTYP()
								+ "','"
								+ msgHelp.getSWDREF()
								+ "')\">"
								+ Util.fcolorCCY(msgHelp.getSWDAMN())
								+ "</a></td>");
						myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelp.getSWDDID()
								+ "','"
								+ msgHelp.getSWDACD()
								+ "','"
								+ msgHelp.getSWDTYP()
								+ "','"
								+ msgHelp.getSWDREF()
								+ "')\">"
								+ msgHelp.getSWDDID()
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0325Help", beanList);
				
				pageName = "EWD0325_fe_ref_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

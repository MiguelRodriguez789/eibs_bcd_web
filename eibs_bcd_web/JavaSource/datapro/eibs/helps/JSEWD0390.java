package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0390DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEWD0390 extends JSEIBSServlet {

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
			mp = getMessageProcessor("EWD0390", req);
			EWD0390DSMessage msgHelp = (EWD0390DSMessage) mp.getMessageRecord("EWD0390DS");
			
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
					msgHelp = (EWD0390DSMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelp.getEWDACD() + "','" + msgHelp.getEWDDSC()
							+ "')\">"
							+ msgHelp.getEWDACD()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelp.getEWDACD() + "','" + msgHelp.getEWDDSC()  
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
				
				session.setAttribute("ewd0390Help", beanList);
				pageName = "EWD0390_helpfile_APCLS.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

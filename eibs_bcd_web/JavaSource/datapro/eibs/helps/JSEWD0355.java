package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0355DSMessage;
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
public class JSEWD0355 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0355", req);
			EWD0355DSMessage msgHelp = (EWD0355DSMessage) mp.getMessageRecord("EWD0355DS");
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				String sRef = "";
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0355DSMessage) list.getRecord();
					sRef = "<td NOWRAP ><a href=\"javascript:enter('"
						+ msgHelp.getEWDPRF()
						+ "','"
						+ msgHelp.getEWDDSC()
						+ "','"
						+ msgHelp.getEWDCDP()
						+ "','"
						+ msgHelp.getEWDCDA()
						+ "','"
						+ msgHelp.getEWDKDP()
						+ "','"
						+ msgHelp.getEWDKDA()										
						+ "','"
						+ msgHelp.getEWDCWD()										
						+ "','"
						+ msgHelp.getEWDCWA()										
						+ "','"
						+ msgHelp.getEWDCPY()										
						+ "','"
						+ msgHelp.getEWDCPA()										
						+ "','"
						+ msgHelp.getEWDTIN()										
						+ "','"
						+ msgHelp.getEWDTIA()										
						+ "','"
						+ msgHelp.getEWDTRV()										
						+ "','"
						+ msgHelp.getEWDTRA()										
						+ "','"
						+ msgHelp.getEWDSCN()										
						+ "','"
						+ msgHelp.getEWDSCA()										
						+ "','"
						+ msgHelp.getEWDSWN()										
						+ "','"
						+ msgHelp.getEWDSWA()										
						+ "','"
						+ msgHelp.getEWDSDN()										
						+ "','"
						+ msgHelp.getEWDSDA()										
						+ "','"
						+ msgHelp.getEWDSKN()										
						+ "','"
						+ msgHelp.getEWDSKA()										
						+ "','"
						+ msgHelp.getEWDBCN()										
						+ "','"
						+ msgHelp.getEWDBCA()										
						+ "','"
						+ msgHelp.getEWDBWN()										
						+ "','"
						+ msgHelp.getEWDBWA()										
						+ "','"
						+ msgHelp.getEWDBDN()										
						+ "','"
						+ msgHelp.getEWDBDA()										
						+ "','"
						+ msgHelp.getEWDBKN()										
						+ "','"
						+ msgHelp.getEWDBKA()										
						+ "','"
						+ msgHelp.getEWDGAV()										
						+ "','"
						+ msgHelp.getEWDNAV()										
						+ "')\">";
					myRow = new StringBuffer("<TR>");
					myRow.append(sRef  
							+ Util.formatCell(msgHelp.getEWDPRF())
							+ "</a></td>");
					myRow.append(sRef
							+ Util.formatCell(msgHelp.getEWDDSC())
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0355Help", beanList);
				
				pageName = "EWD0355_profile_table.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

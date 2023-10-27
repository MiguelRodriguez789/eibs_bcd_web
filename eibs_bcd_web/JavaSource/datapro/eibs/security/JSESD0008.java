package datapro.eibs.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000801Message;
import datapro.eibs.beans.ESS0030DSMessage;
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
public class JSESD0008 extends JSEIBSServlet {

	protected static final int R_ENTER 		= 1;
	protected static final int A_ENTER 		= 2;
	protected static final int A_CONSULTA 	= 5;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_ENTER :
				procReqEnterMaint(user, req, res, session);
				break;
			case A_ENTER :
				procActionEnterMaint(user, req, res, session);
				break;
			case A_CONSULTA :
				procActionConsulta(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionConsulta(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0008", req);
			ESD000801Message msgBBA = (ESD000801Message) mp.getMessageRecord("ESD000801");
			msgBBA.setH01USERID(user.getH01USR());
			msgBBA.setH01PROGRM("ESD0008");
			msgBBA.setH01TIMSYS(getTimeStamp());
			msgBBA.setH01OPECOD("0015");
			try {
				msgBBA.setE01DBAUSR(req.getParameter("E01DBAUSR") == null ? "" : req.getParameter("E01DBAUSR"));
			} catch (Exception e) {
				msgBBA.setE01DBAUSR("");
			}
			
			mp.sendMessage(msgBBA);
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgBBA = (ESD000801Message) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A\">"
								+ Util.formatCell(msgBBA.getE01DBABNK()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A\">"
								+ Util.formatCell(msgBBA.getE01DBABRN()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A\">"
								+ Util.formatCell(msgBBA.getE01DBAALL()) + "</A></TD>");
					myRow.append("</TR>");
					
					beanList.addRow("", myRow.toString());
				}
				
				pageName = "ESD0008_bank_branch_list.jsp";
				session.setAttribute("appList", beanList);
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0008", req);
			ESD000801Message msgBBA = (ESD000801Message) mp.getMessageRecord("ESD000801");
			msgBBA.setH01USERID(user.getH01USR());
			msgBBA.setH01PROGRM("ESD0008");
			msgBBA.setH01TIMSYS(getTimeStamp());
			msgBBA.setH01SCRCOD("01");			
			try {
				msgBBA.setH01OPECOD(req.getParameter("E01OPETYP") == null ? "0002" : req.getParameter("E01OPETYP"));
			} catch (Exception e) {
				msgBBA.setH01OPECOD("0002");
			}
			msgBBA.setE01DBAUSR(req.getParameter("E01DBAUSR") == null ? "" : req.getParameter("E01DBAUSR"));
			msgBBA.setE01DBABNK(req.getParameter("E01DBABNK") == null ? "" : req.getParameter("E01DBABNK"));
			try {
				msgBBA.setE01DBABRN(req.getParameter("E01DBABRN") == null ? "" : req.getParameter("E01DBABRN"));
			} catch (Exception e) {
				msgBBA.setE01DBABRN("0");
			}
			msgBBA.setE01DBAALL(req.getParameter("E01DBAALL") == null ? "" : req.getParameter("E01DBAALL"));

			mp.sendMessage(msgBBA);
				
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBBA = (ESD000801Message) mp.receiveMessageRecord("ESD000801");
				
			if (mp.hasError(msgError)) {
				pageName = "ESD0008_bank_branch_access.jsp";
			} else {
				pageName = "ESD0008_bank_branch_access.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("user", msgBBA);
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("user", new ESD000801Message());
		
		forward("ESD0008_bank_branch_access.jsp", req, res);
	}

}

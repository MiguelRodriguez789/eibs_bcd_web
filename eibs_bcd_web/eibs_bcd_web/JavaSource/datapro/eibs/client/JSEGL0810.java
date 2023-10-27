package datapro.eibs.client;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EGL081001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.JBStatementHeader;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author cmoran
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEGL0810 extends JSEIBSServlet {

	protected static final int R_SELECTION = 100;
	protected static final int A_SELECTION = 200;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case 0:
			case 1:
				procReqList(user, req, res, session);
				break;
			case R_SELECTION:
				procReqSelection(user, req, res, session);
				break;
			case A_SELECTION:
				procActionSelection(user, req, res, session);
				break;
			default :
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}

	private void procActionSelection(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		userPO.setBank(req.getParameter("E01TRABNK") == null ? "" : req.getParameter("E01TRABNK"));
		userPO.setBranch(req.getParameter("E01TRABRN") == null ? "" : req.getParameter("E01TRABRN"));
		userPO.setCurrency(req.getParameter("E01TRACCY") == null ? "" : req.getParameter("E01TRACCY").toUpperCase());
		userPO.setAccNum(req.getParameter("E01TRAGLN") == null ? "" : req.getParameter("E01TRAGLN"));
		userPO.setIdentifier(req.getParameter("E01TRAACC") == null ? "" : req.getParameter("E01TRAACC"));
		
		procReqList(user, req, res, session);
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		session.setAttribute("userPO", userPO);
		int screen = Util.parseInt(req.getParameter("SCREEN"));
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0810", req);
			EGL081001Message msgSearch = (EGL081001Message) mp.getMessageRecord("EGL081001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01OPECOD("0004");
			msgSearch.setH01SCRCOD("01");
			msgSearch.setE01NUMREC(""+Util.parseInt(req.getParameter("Pos")));
			msgSearch.setE01TRABNK(userPO.getBank());
			msgSearch.setE01TRABRN(userPO.getBranch());
			msgSearch.setE01TRACCY(userPO.getCurrency());
			msgSearch.setE01TRAGLN(userPO.getAccNum());
			msgSearch.setE01TRAACC(userPO.getIdentifier());
			
			mp.sendMessage(msgSearch);
			
			MessageRecord message = mp.receiveMessageRecord();
			if (mp.hasError(message)) {
				session.setAttribute("error", message);
				forward("EGL0810_st_selection.jsp", req, res);
			} else {
				session.setAttribute("stGLBal", message);
				JBStatementHeader glHeader = (JBStatementHeader) 
					session.getAttribute("glHeader");
				if (glHeader == null) {
					glHeader = new JBStatementHeader();
					glHeader.setStartingBalance(new BigDecimal("0.00"));
					glHeader.setCalculatedBalance(new BigDecimal("0.00"));
				}
				
				JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
				if (screen == 0) {
					glHeader.setStartingBalance(glHeader.getStartingBalance().subtract(
						((EGL081001Message) list.get(list.size()-1)).getBigDecimalE01ENDBAL()));
				} else {
					glHeader.setStartingBalance(glHeader.getCalculatedBalance());
				}
				glHeader.setDebits(new BigDecimal("0.00"));
				glHeader.setCredits(new BigDecimal("0.00"));
				
				session.setAttribute("glHeader", glHeader);
				session.setAttribute("glList", list);
				forwardOnSuccess("EGL0810_st_list_fp.jsp", req, res);
			}
		
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqSelection(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("GL");
		userPO.setPurpose("STATEMENT");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EGL0810_st_selection.jsp", req, res);
	}

}

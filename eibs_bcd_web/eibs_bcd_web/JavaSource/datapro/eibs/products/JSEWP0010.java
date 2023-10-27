package datapro.eibs.products;

import java.io.IOException;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.exception.DocumentException;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWP001001Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecordComparator;
import datapro.eibs.tools.xml.XMLSelectOptions;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWP0010 extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case 1 : // Call List
				requestList(user, req, res, session); 
				break;					
			case 0 : // New Clause
				requestNew(user, req, res, session); 
				break;					
			case 2 :
				requestMaintenance(user, req, res, session); 
				break;					
			case 5 :
				actionPage(user, req, res, session); 
				break;					
			case 9 :
				requestDelete(user, req, res, session); 
				break;					
			case 11 :
				requestHelpList(user, req, res, session); 
				break;					
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void requestHelpList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWP0010", req);
			EWP001001Message msg = (EWP001001Message) mp.getMessageRecord("EWP001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EWP0010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0015");
			try {
				msg.setE01SELCDE(req.getParameter("TYPE").trim());
			} catch (Exception e) {
			}
			
			mp.sendMessage(msg);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				sendXMLResponse(res, msgError.toString());
			} else {
				Collections.sort(list, new MessageRecordComparator("E01CLSDSC"));
				XMLSelectOptions xmlResponse = new XMLSelectOptions("ClauseCode");
				xmlResponse.addOption("", "");
				list.initRow();
				while (list.getNextRow()) {
					msg = (EWP001001Message) list.getRecord();
					xmlResponse.addOption(msg.getE01CLSTXN(), msg.getE01CLSDSC());
				}
				sendXMLResponse(res, xmlResponse);
			}
			return;

		} catch (DocumentException e) {
			e.printStackTrace();
			sendXMLResponse(res, "Error");
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void requestDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setID(user.getE01INT());
		userPO.setPurpose("DELETE");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWP0010", req);
			EWP001001Message msg = (EWP001001Message) mp.getMessageRecord("EWP001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EWP0010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0009");
			try {
				msg.setE01CLSCDE(req.getParameter("E01CLSCDE").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg.setE01CLSTXN(req.getParameter("E01CLSTXN").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg.setE01CLSDSC(req.getParameter("E01CLSDSC").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("msg", msg);

				forward("EWP0010_lc_clause.jsp", req, res);
			} else {
				requestList(user, req, res, session);
			}

		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void actionPage(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setID(user.getE01INT());
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("", req);
			EWP001001Message msg = (EWP001001Message) mp.getMessageRecord("EWP001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EWP0010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);

			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EWP001001Message) mp.receiveMessageRecord("EWP001001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("msg", msg);

				forward("EWP0010_lc_clause.jsp", req, res);
			} else {
				requestList(user, req, res, session);
			}

		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void requestMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setID(user.getE01INT());
		userPO.setPurpose("MAINTENANCE");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWP0010", req);
			EWP001001Message msg = (EWP001001Message) mp.getMessageRecord("EWP001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EWP0010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0002");
			try {
				msg.setE01CLSCDE(req.getParameter("E01CLSCDE").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg.setE01CLSTXN(req.getParameter("E01CLSTXN").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg.setE01CLSDSC(req.getParameter("E01CLSDSC").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg = (EWP001001Message) mp.receiveMessageRecord("EWP001001");

			if (mp.hasError(msgError)) {
				pageName = "EWP0010_lc_clauses_list.jsp";
			} else {
				pageName = "EWP0010_lc_clause.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg", msg);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void requestNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setID(user.getE01INT());
		userPO.setPurpose("NEW");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWP0010", req);
			EWP001001Message msg = (EWP001001Message) mp.getMessageRecord("EWP001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EWP0010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			try {
				msg.setE01CLSCDE(req.getParameter("E01CLSCDE").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg.setE01CLSTXN(req.getParameter("E01CLSTXN").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg.setE01CLSDSC(req.getParameter("E01CLSDSC").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg = (EWP001001Message) mp.receiveMessageRecord("EWP001001");

			if (mp.hasError(msgError)) {
				pageName = "EWP0010_lc_clauses_list.jsp";
			} else {
				pageName = "EWP0010_lc_clause.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg", msg);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void requestList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setID(user.getE01INT());
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWP0010", req);
			EWP001001Message msg = (EWP001001Message) mp.getMessageRecord("EWP001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EWP0010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0015");
			
			mp.sendMessage(msg);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				pageName = "EWP0010_lc_clauses_list.jsp";
			}

			session.setAttribute("jbList", list);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

}

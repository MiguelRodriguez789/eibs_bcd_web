package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC020001Message;
import datapro.eibs.beans.ELC022001Message;
import datapro.eibs.beans.ELC022002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSELC0220 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		case 3 : // ENTER / CALL LIST (from side menu)
			requestList(user, req, res, session, screen);
			break;
		case 9 : 
			requestInqHist(user, req, res, session, screen);
			break;	
		case 8 : // Call basic page from optMenu
			requestInq(user, req, res, session, screen);
			break;					
		case 2 :
			requestAction(user, req, res, session, screen);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void requestList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, String.valueOf(screen), "");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0220", req);
			ELC022001Message msg01 = (ELC022001Message) mp.getMessageRecord("ELC022001", user.getH01USR(), "0015");

			mp.sendMessage(msg01);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			session.setAttribute("userPO", userPO);
			session.setAttribute("jbList", list);
			
			forward("ELC0220_apr_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void requestInqHist(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, String.valueOf(screen), "");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0200", req);
			ELC020001Message msg = (ELC020001Message) mp.getMessageRecord("ELC020001", user.getH01USR(), "0004");
			msg.setH01FLGWK3("H");
			try {
				msg.setE01LCMACC(req.getParameter("E01LCMACC").trim());
			} catch (Exception e) {
				msg.setE01LCMACC(userPO.getAccNum());
			}
			try {
				msg.setE01LCIDNO(req.getParameter("E02LCLTNO").trim());
			} catch (Exception e) {
				msg.setE01LCIDNO(userPO.getSeqNum());
			}
			try {
				msg.setE01LCIRDM(req.getParameter("E01LCMTDM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg.setE01LCIRDD(req.getParameter("E01LCMTDD").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg.setE01LCIRDY(req.getParameter("E01LCMTDY").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg.setE01LCIRTI(req.getParameter("E01LCIRTI").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg = (ELC020001Message) mp.receiveMessageRecord("ELC020001");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				userPO.setHeader1(req.getParameter("E01DSCTTP"));
				userPO.setHeader2(req.getParameter("E01LCMOPR"));
				userPO.setHeader3(Util.formatCustomDate(user.getE01DTF(), req.getParameter("E01LCMTDM"), req.getParameter("E01LCMTDD"), req.getParameter("E01LCMTDY")) + " " +  Util.formatTime(req.getParameter("E01LCMTTM")));
				userPO.setHeader4(req.getParameter("E01APPREJ"));
				userPO.setHeader5(req.getParameter("E01LCMSUP"));
				userPO.setHeader6(Util.formatCustomDate(user.getE01DTF(), req.getParameter("E01LCMADM"), req.getParameter("E01LCMADD"), req.getParameter("E01LCMADY")) + " " +  Util.formatTime(req.getParameter("E01LCMATM")));
				
				pageName = "ELC0220_lc_doc_info_readonly_hist.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("msg01", msg);		

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void requestInq(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0200", req);
			ELC020001Message msg = (ELC020001Message) mp.getMessageRecord("ELC020001", user.getH01USR(), "0002");
			try {
				msg.setE01LCMACC(req.getParameter("E02LCRNUM").trim());
				userPO.setAccNum(msg.getE01LCMACC());
			} catch (Exception e) {
				msg.setE01LCMACC(userPO.getAccNum());
			}
			try {
				msg.setE01LCIDNO(req.getParameter("E02DRWNUM").trim());
				userPO.setSeqNum(msg.getE01LCIDNO());
			} catch (Exception e) {
				msg.setE01LCIDNO(userPO.getSeqNum());
			}

			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg = (ELC020001Message) mp.receiveMessageRecord("ELC020001");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ELC0220_lc_doc_info_readonly.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("msg01", msg);		

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void requestAction(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0220", req);
			ELC022002Message msg02 = (ELC022002Message) mp.getMessageRecord("ELC022002", user.getH01USR(), "0002");
			try {
				msg02.setE02LCIACC(req.getParameter("E02LCIACC").trim());
				userPO.setAccNum(msg02.getE02LCIACC());
			} catch (Exception e) {
				msg02.setE02LCIACC(userPO.getAccNum());
			}
			try {
				msg02.setE02LCIDNO(req.getParameter("E02LCIDNO").trim());
				userPO.setSeqNum(msg02.getE02LCIDNO());
			} catch (Exception e) {
				msg02.setE02LCIDNO(userPO.getSeqNum());
			}
			try {
				msg02.setE02ACTION(req.getParameter("E02ACTION").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg02.setE02MSGTXT(req.getParameter("E02MSGTXT").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msg02);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			} else {
				requestList(user, req, res, session, 3);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void initTransaction(UserPos userPO, String optMenu, String purpose) {
		if (!optMenu.equals("")) userPO.setOption(optMenu);
		if (!purpose.equals("")) userPO.setPurpose(purpose);
	}
}

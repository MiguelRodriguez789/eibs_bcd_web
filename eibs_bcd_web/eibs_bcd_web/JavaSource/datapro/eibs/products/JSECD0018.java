package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (9/02/09 03:05:49 PM)
 * @author: Gustavo Adolfo Villarroel
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECD0018DSMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSECD0018 extends JSEIBSServlet {

	static final int R_ENTER			= 100;
	static final int R_GEN_LIST 		= 101;
	static final int R_DET_LIST 		= 102;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		case R_ENTER:
			procReqEnter(user, req, res, session);
			break;
		case R_GEN_LIST:
			procReqListGeneral(user, req, res, session);
			break;
		case R_DET_LIST:
			procReqListDetail(user, req, res, session);
			break;

		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procReqListDetail(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECD0018", req);
			ECD0018DSMessage msgList = (ECD0018DSMessage) mp.getMessageRecord("ECD0018DS");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ECD0018");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0003");
			
			try {
				msgList.setE01CDPSUR(req.getParameter("E01CDPSUR").trim());		
				userPO.setHeader1(req.getParameter("E01CDPSUR"));
			} catch (Exception e) {
				msgList.setE01CDPSUR(userPO.getHeader1());
			}
			try {
				msgList.setE01CDPMMD(req.getParameter("E01CDPMMD").trim());		
				userPO.setHeader2(req.getParameter("E01CDPMMD"));
			} catch (Exception e) {
				msgList.setE01CDPMMD(userPO.getHeader2());
			}
			try {
				msgList.setE01CDPYYD(req.getParameter("E01CDPYYD").trim());		
				userPO.setHeader3(req.getParameter("E01CDPYYD"));
			} catch (Exception e) {
				msgList.setE01CDPYYD(userPO.getHeader3());
			}
			try {
				msgList.setE01CDPMMF(req.getParameter("E01CDPMMF").trim());		
				userPO.setHeader4(req.getParameter("E01CDPMMF"));
			} catch (Exception e) {
				msgList.setE01CDPMMF(userPO.getHeader4());
			}
			try {
				msgList.setE01CDPYYF(req.getParameter("E01CDPYYF").trim());		
				userPO.setHeader5(req.getParameter("E01CDPYYF"));
			} catch (Exception e) {
				msgList.setE01CDPYYF(userPO.getHeader5());
			}
			try {
				msgList.setE01CDPREG(req.getParameter("Pos").trim());
			} catch (Exception ex) {
				msgList.setE01CDPREG("0");
			}

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS", "E01CDPREG");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "ECD0018_renewal_inq_enter.jsp";
			} else {
				session.setAttribute("detList", list);
				pageName = "ECD0018_renewal_inq_det_list.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqListGeneral(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECD0018", req);
			ECD0018DSMessage msgList = (ECD0018DSMessage) mp.getMessageRecord("ECD0018DS");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ECD0018");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0002");
			try {
				msgList.setE01CDPSUR(req.getParameter("E01CDPSUR").trim());		
				userPO.setHeader1(req.getParameter("E01CDPSUR"));
			} catch (Exception e) {
				msgList.setE01CDPSUR(userPO.getHeader1());
			}
			try {
				msgList.setE01CDPMMD(req.getParameter("E01CDPMMD").trim());		
				userPO.setHeader2(req.getParameter("E01CDPMMD"));
			} catch (Exception e) {
				msgList.setE01CDPMMD(userPO.getHeader2());
			}
			try {
				msgList.setE01CDPYYD(req.getParameter("E01CDPYYD").trim());		
				userPO.setHeader3(req.getParameter("E01CDPYYD"));
			} catch (Exception e) {
				msgList.setE01CDPYYD(userPO.getHeader3());
			}
			try {
				msgList.setE01CDPMMF(req.getParameter("E01CDPMMF").trim());		
				userPO.setHeader4(req.getParameter("E01CDPMMF"));
			} catch (Exception e) {
				msgList.setE01CDPMMF(userPO.getHeader4());
			}
			try {
				msgList.setE01CDPYYF(req.getParameter("E01CDPYYF").trim());		
				userPO.setHeader5(req.getParameter("E01CDPYYF"));
			} catch (Exception e) {
				msgList.setE01CDPYYF(userPO.getHeader5());
			}
			try {
				msgList.setE01CDPREG(req.getParameter("Pos").trim());
			} catch (Exception ex) {
				msgList.setE01CDPREG("0");
			}

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS", "E01CDPREG");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "ECD0018_renewal_inq_enter.jsp";
			} else {
				session.setAttribute("genList", list);
				pageName = "ECD0018_renewal_inq_gen_list.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ECD0018_renewal_inq_enter.jsp", req, res);
	}
			
}
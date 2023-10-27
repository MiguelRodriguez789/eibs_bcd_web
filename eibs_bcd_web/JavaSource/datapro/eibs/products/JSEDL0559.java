package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL055901Message;
import datapro.eibs.beans.EDL055902Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0559 extends JSEIBSServlet {
	
	static final int R_HISTORY = 100; 
	static final int A_HISTORY = 101;

	static final int R_DETAIL  = 200;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen){
			case R_HISTORY:
				procReqHistory(user, req, res, session);
				break;
			case A_HISTORY:
				procActHistory(user, req, res, session);
				break;
			case R_DETAIL:
				procReqDetail(user, req, res, session);
				break;
			default:
				forward(devPage, req, res); 
				break;
		}
	}

	private void procReqHistory(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		mp = getMessageProcessor("EDL0559", req);
		EDL055901Message msg = (EDL055901Message) mp.getMessageRecord("EDL055901");		
		
		msg.setE01HDIACC(userPO.getAccNum());   //Set to be able to use custom Tag
		msg.setE01HDICUN(userPO.getCusNum());
		msg.setE01HDINA1(userPO.getCusName());
		msg.setE01HDIPRO(userPO.getProdCode());
		msg.setE01HDICCY(userPO.getCurrency());
		msg.setE01HDITYP(userPO.getType());
		
		session.setAttribute("userPO", userPO);
		session.setAttribute("headInfo", msg);
		forward("EDL0559_ln_modif_enter.jsp", req, res);
			
	}

	private void procActHistory(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {

			mp = getMessageProcessor("EDL0559", req);
			EDL055901Message msgList = (EDL055901Message) mp.getMessageRecord("EDL055901");		
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0559");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("");
			msgList.setE01HDIACC(req.getParameter("E01HDIACC"));
			
			try {                                                   //Get Dates From Page
				msgList.setE01FMDTMM(req.getParameter("E01FMDTMM"));
				msgList.setE01FMDTDD(req.getParameter("E01FMDTDD"));
				msgList.setE01FMDTYY(req.getParameter("E01FMDTYY"));
			} catch (Exception e) {
				msgList.setE01FMDTMM("0");
				msgList.setE01FMDTDD("0");
				msgList.setE01FMDTYY("0");
			}
			
			try {
				msgList.setE01TODTMM(req.getParameter("E01TODTMM"));
				msgList.setE01TODTDD(req.getParameter("E01TODTDD"));
				msgList.setE01TODTYY(req.getParameter("E01TODTYY"));
			} catch (Exception e) {
				msgList.setE01TODTMM("0");
				msgList.setE01TODTDD("0");
				msgList.setE01TODTYY("0");
			}
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
			
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDL0559_ln_modif_enter.jsp", req, res);
				
			} else {
			
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
				EDL055901Message headInfo = (EDL055901Message) mp.getMessageRecord("EDL055901");
				
				headInfo.setE01HDIACC(userPO.getAccNum()); 		//Set to be able to use custom Tag
				headInfo.setE01HDICUN(userPO.getCusNum());
				headInfo.setE01HDINA1(userPO.getCusName());
				headInfo.setE01HDIPRO(userPO.getProdCode());
				headInfo.setE01HDICCY(userPO.getCurrency());
				headInfo.setE01HDITYP(userPO.getType());
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("headInfo", headInfo);
				session.setAttribute("EDL055901List", list);
				forward("EDL0559_ln_modif_list.jsp", req, res);
				
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
			
	}

	private void procReqDetail(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {

			mp = getMessageProcessor("EDL0559", req);
			EDL055902Message msg = (EDL055902Message) mp.getMessageRecord("EDL055902");		
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0559");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02OPECOD("");
			
			msg.setE02DEAACC(req.getParameter("E02DEAACC") == null ? "" : req.getParameter("E02DEAACC").trim());
			msg.setE02DEAUQI(req.getParameter("E02DEAUQI") == null ? "" : req.getParameter("E02DEAUQI").trim());

			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL055902Message) mp.receiveMessageRecord("EDL055902");
			
			if (mp.hasError(msgError)) {

				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDL0559_ln_modif_detail.jsp", req, res);

			} else {

				EDL055902Message headInfo = (EDL055902Message) mp.getMessageRecord("EDL055902");

				headInfo.setE02HDIACC(userPO.getAccNum()); 		//Set to be able to use custom Tag
				headInfo.setE02HDICUN(userPO.getCusNum());
				headInfo.setE02HDINA1(userPO.getCusName());
				headInfo.setE02HDIPRO(userPO.getProdCode());
				headInfo.setE02HDICCY(userPO.getCurrency());
				headInfo.setE02HDITYP(userPO.getType());

				session.setAttribute("userPO", userPO);
				session.setAttribute("headInfo", headInfo);
				session.setAttribute("datarec", msg);
				
				forward("EDL0559_ln_modif_detail.jsp", req, res);
				
			}
			
		} finally {
			if (mp != null)	mp.close();
		}

	}

}

package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL015001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;

public class JSEXEDL0150 extends JSEDL0150 {

	protected void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("LN");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDL0150?SCREEN=400");
		userPO.setProdCode("10");
		//Others Parameters
		userPO.setHeader1("E01DEAACC");
		userPO.setHeader2("H01FLGWK2");
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("GENERIC_account_enter.jsp", req, res);
	}

	protected void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015001Message msgLN = (EDL015001Message) mp.getMessageRecord("EDL015001");
			msgLN.setH01USERID(user.getH01USR());
			msgLN.setH01PROGRM("EDL0150");
			msgLN.setH01TIMSYS(getTimeStamp());
			msgLN.setH01SCRCOD("01");
			msgLN.setH01OPECOD("0002");
			msgLN.setE01DEAACD("10");
			try {
				msgLN.setE01DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
			}
			try {
				msgLN.setH01FLGWK2(req.getParameter("H01FLGWK2"));
			} catch (Exception e) {
			}

			mp.sendMessage(msgLN);

			if (procRecMaintData(mp, user, req, res, session)) {
				forward("EDL0150_ln_basic.jsp", req, res);
			} else {
				userPO.setOption("LN");
				userPO.setPurpose("MAINTENANCE");
				userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDL0150?SCREEN=400");
				userPO.setProdCode("10");
				//Others Parameters
				userPO.setHeader1("E01DEAACC");
				userPO.setHeader2("H01FLGWK2");			
				session.setAttribute("userPO", userPO);
				
				forward("EDL0150_ln_enter_maint.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

}

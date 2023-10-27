package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL030501Message;
import datapro.eibs.beans.EDL030502Message;
import datapro.eibs.beans.EDL030503Message;
import datapro.eibs.beans.EDL030504Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEDL0305 extends JSEIBSServlet {

	// CIF options
	protected static final int R_DED 		= 1;
	protected static final int A_DED	 	= 2;
	protected static final int R_REL 		= 3;
	protected static final int R_REL_BG		= 4;
	protected static final int R_COM 		= 5;
	protected static final int A_COM 		= 6;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen) {
			case R_DED :
				procReqDed(user, req, res, session);
				break;
			case A_DED :
				procActDed(user, req, res, session);
				break;
			case R_REL :
				procReqRel(user, req, res, session);
				break;
			case R_REL_BG :
				procReqRelBG(user, req, res, session);
				break;
			case R_COM :
				procReqCom(user, req, res, session);
				break;
			case A_COM :
				procActCom(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqDed(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0305", req);
			EDL030501Message msgDed = (EDL030501Message) mp.getMessageRecord("EDL030501");
			msgDed.setH01USERID(user.getH01USR());
		 	msgDed.setH01PROGRM("EDL0305");
		 	msgDed.setH01TIMSYS(getTimeStamp());
		 	msgDed.setH01SCRCOD("01");
		 	msgDed.setH01OPECOD("0004");
		 	msgDed.setE01DLIACC(userPO.getIdentifier());
		 	
		 	mp.sendMessage(msgDed);
		 	JBObjList list = mp.receiveMessageRecordList("E01ENDFLD");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDL0160_ln_balances.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("cifPos", list);
				forward("EDL0305_ln_ded.jsp", req, res);
			}
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActDed(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		
		try {
			
			mp = getMessageProcessor("EDL0305", req);
			EDL030503Message msgDetail = (EDL030503Message) mp.getMessageRecord("EDL030503");
		 	msgDetail.setH03USERID(user.getH01USR());
		 	msgDetail.setH03PROGRM("EDL0305");
		 	msgDetail.setH03TIMSYS(getTimeStamp());
		 	msgDetail.setH03SCRCOD("01");
		 	msgDetail.setH03OPECOD("0004");
		 	try {
			 	msgDetail.setE03DLICDE(req.getParameter("CODE").trim());
			} catch (Exception e) {
			 	msgDetail.setE03DLICDE("");
			}
			try {
			 	msgDetail.setE03DLITYP(req.getParameter("TYPE").trim());
			} catch (Exception e) {
			 	msgDetail.setE03DLITYP("");
			}
			try {
			 	msgDetail.setE03DLIACC(req.getParameter("ACCOUNT").trim());
			} catch (Exception e) {
			 	msgDetail.setE03DLIACC("");
			}
		 	
		 	mp.sendMessage(msgDetail);
		 	MessageRecord msg = mp.receiveMessageRecord();
			
		 	if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "error_viewer.jsp";
		 	} else {
		 		msgDetail = (EDL030503Message) msg; 
				session.setAttribute("error", new ELEERRMessage());
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnDedDet", msgDetail);
				pageName = "EDL0305_ln_ded_det.jsp";
		 	}
		 	
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procReqRel(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0305", req);
			EDL030502Message msgRel = (EDL030502Message) mp.getMessageRecord("EDL030502");
			msgRel.setH02USERID(user.getH01USR());
		 	msgRel.setH02PROGRM("EDL0305");
		 	msgRel.setH02TIMSYS(getTimeStamp());
		 	msgRel.setH02SCRCOD("01");
		 	msgRel.setH02OPECOD("0004");
		 	msgRel.setE02PRIACC(userPO.getIdentifier());
			
		 	mp.sendMessage(msgRel);

			JBObjList list = mp.receiveMessageRecordList("E02ENDFLD");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				if ("APPROVAL_INQ".equals(userPO.getPurpose())) {
					forward("EDL0140_ln_ap_basic.jsp", req, res);
				} else {
					forward("EDL0160_ln_balances.jsp", req, res);
				}
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("cifPos", list);
				forward("EDL0305_ln_rel.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqRelBG(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0305", req);
			EDL030502Message msgRel = (EDL030502Message) mp.getMessageRecord("EDL030502");
			msgRel.setH02USERID(user.getH01USR());
		 	msgRel.setH02PROGRM("EDL0305");
		 	msgRel.setH02TIMSYS(getTimeStamp());
		 	msgRel.setH02SCRCOD("01");
		 	msgRel.setH02OPECOD("0004");
		 	msgRel.setE02PRIACC(userPO.getIdentifier());
			
		 	mp.sendMessage(msgRel);

			JBObjList list = mp.receiveMessageRecordList("E02ENDFLD");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				if ("APPROVAL_INQ".equals(userPO.getPurpose())) {
					forward("ELC5080_bg_basic.jsp", req, res);
				} else {
					forward("ELC5080_bg_basic.jsp", req, res);
				}
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("cifPos", list);
				forward("EDL0305_bg_rel.jsp", req, res);
			}
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqCom(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
				
		UserPos	userPO = getUserPos(req);
		MessageProcessor mp = null;
			
		try {
				
			mp = getMessageProcessor("EDL0305", req);
			EDL030504Message msg = (EDL030504Message) mp.getMessageRecord("EDL030504");
			msg.setH04USERID(user.getH01USR());
			msg.setH04PROGRM("EDL0305");
			msg.setH04TIMSYS(getTimeStamp());
			msg.setH04SCRCOD("01");
			msg.setH04OPECOD("0015");
			
			msg.setE04DCOACC(userPO.getIdentifier());
				 	
			mp.sendMessage(msg);
			JBObjList list = mp.receiveMessageRecordList("E04ENDFLD");
					
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDL0160_ln_balances.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("cifPos", list);
				forward("EDL0305_ln_com.jsp", req, res);
			}
			
		} finally {
			if (mp != null) mp.close(); 
		}
			
	}

	private void procActCom(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		UserPos	userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
			
		try {
				
			mp = getMessageProcessor("EDL0305", req);
			EDL030504Message msgDetail = (EDL030504Message) mp.getMessageRecord("EDL030504");
		 	msgDetail.setH04USERID(user.getH01USR());
		 	msgDetail.setH04PROGRM("EDL0305");
		 	msgDetail.setH04TIMSYS(getTimeStamp());
		 	msgDetail.setH04SCRCOD("01");
		 	msgDetail.setH04OPECOD("0004");
				
			try {
			 	msgDetail.setE04DCOACC(req.getParameter("ACCOUNT").trim());
			} catch (Exception e) {
			 	msgDetail.setE04DCOACC("");
			}
			try {
			 	msgDetail.setE04DCOCDE(req.getParameter("CODE").trim());
			} catch (Exception e) {
			 	msgDetail.setE04DCOCDE("");
			}
			try {
			 	msgDetail.setE04DCOSEQ(req.getParameter("SEQUENCE").trim());
			} catch (Exception e) {
			 	msgDetail.setE04DCOSEQ("");
			}
			 	
		 	mp.sendMessage(msgDetail);
		 	MessageRecord msg = mp.receiveMessageRecord();
				
		 	if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "error_viewer.jsp";
		 	} else {
		 		msgDetail = (EDL030504Message) msg; 
				session.setAttribute("error", new ELEERRMessage());
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnComDet", msgDetail);
				pageName = "EDL0305_ln_com_det.jsp";
		 	}
			forward(pageName, req, res);
				
		} finally {
			if (mp != null) mp.close();
		}
			
	}

}

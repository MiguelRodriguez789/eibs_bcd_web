package datapro.eibs.valuepaper;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL095001Message;
import datapro.eibs.beans.EVL012001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

/**
 * @author erodriguez
 * 
 *         To change the template for this generated type comment go to
 *         Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEVL0120 extends JSEIBSServlet {

	protected static final int R_ENTER_INQUIRY   = 100;
	protected static final int R_LIST 		     = 210;
	protected static final int R_DOC 	         = 200;
	protected static final int R_UPD_DOC         = 300;
	protected static final int R_UPD_DOC_C       = 310;
	protected static final int R_ENTER_INQUIRY_U = 1000;
	protected static final int R_DOC_U           = 2000;
	protected static final int R_LIST_U		     = 2100;
	protected static final int R_ENTREGA	     = 2200;
	protected static final int R_LIST_U_C	     = 3000;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		case R_ENTER_INQUIRY:
		case R_ENTER_INQUIRY_U:
			procReqEnterInquiry(user, req, res, session, screen);
			break;
		case R_LIST:
		case R_LIST_U:
		case R_UPD_DOC_C:
			procReqList(user, req, res, session, screen);
			break;
		case R_DOC:
		case R_DOC_U:
			procReqDocDet(user, req, res, session, screen);
			break;
		case R_UPD_DOC:
		case R_LIST_U_C:
			procReqUpdDocDet(user, req, res, session, screen);
			break;
		default:
			forward(devPage, req, res);
			break;
		}
	}

	private void procReqEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		userPO.setApplicationCode("");
		userPO.setBranch("");
		userPO.setHeader10("");
		userPO.setHeader11("");
		userPO.setHeader12("");
		userPO.setHeader13("");
		userPO.setHeader14("");
		userPO.setHeader15("");
		userPO.setHeader16("");
		userPO.setHeader17("");
		userPO.setHeader18("");
		userPO.setHeader19("");
		userPO.setHeader20("");
		userPO.setHeader21("");
		userPO.setAccNum("");
		userPO.setHeader22("");
		String pageName = "";
		if (screen==100) {pageName = "EVL0120_vl_enter_inquiry.jsp";
		} else {pageName = "EVL0120_vl_enter_delivery.jsp";
		}
		forward(pageName, req, res);
	}

	protected void procReqDocDet(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EVL0120", req);
			EVL012001Message msgSearch = (EVL012001Message) mp.getMessageRecord("EVL012001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EVL0120");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			if (screen==2000) {msgSearch.setH01OPECOD("0005");
			} else {msgSearch.setH01OPECOD("0004");}

			try {
				msgSearch.setE01IMPACD(req.getParameter("E01IMPACD"));
			} catch (Exception e) {
				msgSearch.setE01IMPACD("");
			}
			try {
				msgSearch.setE01IMPACC(req.getParameter("E01IMPACC"));
			} catch (Exception e) {
				msgSearch.setE01IMPACC("");
			}

			mp.sendMessage(msgSearch);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgSearch = (EVL012001Message) mp.receiveMessageRecord("EVL012001");

			if (mp.hasError(msgError)) {
				if (screen==2000) {pageName = "EVL0120_vl_delivery_list.jsp"; }
				else {pageName = "EVL0120_vl_inquiry_list.jsp"; }
			} else {

				flexLog("Putting java beans into the session");
				session.setAttribute("msgSearch", msgSearch);
				session.setAttribute("userPO", userPO);
				if (screen==2000) {pageName = "EVL0120_vl_delivery_detail.jsp"; } 	
				else {pageName = "EVL0120_vl_inquiry_detail.jsp"; }
			}

			session.setAttribute("error", msgError);
			forward(pageName, req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void CenterWindow(String pageName, int i, int j, int k) {
		// TODO Auto-generated method stub
		
	}

	protected void procReqUpdDocDet(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EVL0120", req);
			EVL012001Message msgSearch = (EVL012001Message) mp.getMessageRecord("EVL012001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EVL0120");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			if (screen==300||screen==3000) {msgSearch.setH01OPECOD("0005");
			} else {msgSearch.setH01OPECOD("0004"); 
			}
			try {msgSearch.setE01IMPACD(req.getParameter("E01IMPACD"));
			} catch (Exception e) {
				msgSearch.setE01IMPACD("");
			}
			try {msgSearch.setE01IMPACC(req.getParameter("E01IMPACC"));
			} catch (Exception e) {
				msgSearch.setE01IMPACC("");
			}
			try {msgSearch.setE01IMPNRE(req.getParameter("E01IMPNRE"));
			} catch (Exception e) {
				msgSearch.setE01IMPNRE("");
			}
			try {msgSearch.setE01IMPRRE(req.getParameter("E01IMPRRE"));
			} catch (Exception e) {
				msgSearch.setE01IMPRRE("");
			}

			mp.sendMessage(msgSearch);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgSearch = (EVL012001Message) mp.receiveMessageRecord("EVL012001");

			if (mp.hasError(msgError)) {
				if (screen==300) {pageName = "EVL0120_vl_inquiry_detail.jsp";
				} else {pageName = "EVL0120_vl_delivery_detail.jsp";}
			} else {

				flexLog("Putting java beans into the session");
				procReqList(user, req, res, session, screen);
				
			}
			if (screen!=3000) {
								session.setAttribute("error", msgError);
								forward(pageName, req, res);}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EVL0120", req);
			EVL012001Message msgSearch = (EVL012001Message) mp.getMessageRecord("EVL012001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EVL0120");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			if (screen==210||screen==300||screen==310) {msgSearch.setH01OPECOD("0015");
			} else {msgSearch.setH01OPECOD("0150");}
			
			if (screen==300||screen==3000||screen==310) {
				try {msgSearch.setE01SCHACD(userPO.getApplicationCode());
				} catch (Exception e) {	msgSearch.setE01SCHACD("");
				}
				try {msgSearch.setE01SCHBRN(userPO.getBranch());
				} catch (Exception e) {	msgSearch.setE01SCHBRN("0");
				}
				try {msgSearch.setE01SCHTI1(userPO.getHeader10());
				} catch (Exception e) {	msgSearch.setE01SCHTI1("0");
				}
				try {msgSearch.setE01SCHTI2(userPO.getHeader11());
				} catch (Exception e) {	msgSearch.setE01SCHTI2("0");
				}
				try {msgSearch.setE01SCHTI3(userPO.getHeader12());
				} catch (Exception e) {	msgSearch.setE01SCHTI3("0");
				}
				try {msgSearch.setE01SCHTM1(userPO.getHeader13());
				} catch (Exception e) {	msgSearch.setE01SCHTM1("0");
				}
				try {msgSearch.setE01SCHTM2(userPO.getHeader14());
				} catch (Exception e) {	msgSearch.setE01SCHTM2("0");
				}
				try {msgSearch.setE01SCHTM3(userPO.getHeader15());
				} catch (Exception e) {	msgSearch.setE01SCHTM3("0");
				}
				try {msgSearch.setE01SCHFI1(userPO.getHeader16());
				} catch (Exception e) {	msgSearch.setE01SCHFI1("0");
				}
				try {msgSearch.setE01SCHFI2(userPO.getHeader17());
				} catch (Exception e) {	msgSearch.setE01SCHFI2("0");
				}
				try {msgSearch.setE01SCHFI3(userPO.getHeader18());
				} catch (Exception e) {	msgSearch.setE01SCHFI3("0");
				}
				try {msgSearch.setE01SCHFM1(userPO.getHeader19());
				} catch (Exception e) {	msgSearch.setE01SCHFM1("0");
				}
				try {msgSearch.setE01SCHFM2(userPO.getHeader20());
				} catch (Exception e) {	msgSearch.setE01SCHFM2("0");
				}
				try {msgSearch.setE01SCHFM3(userPO.getHeader21());
				} catch (Exception e) {	msgSearch.setE01SCHFM3("0");
				}
				try {msgSearch.setE01SCHACC(userPO.getAccNum());
				} catch (Exception e) {	msgSearch.setE01SCHACC("0");
				}
				try {msgSearch.setE01SCHSER(userPO.getHeader22());
				} catch (Exception e) {	msgSearch.setE01SCHSER("0");
				}
			} else {
					try {msgSearch.setE01SCHACD(req.getParameter("E01SCHACD"));
					} catch (Exception e) {	msgSearch.setE01SCHACD("");
					}
					try {msgSearch.setE01SCHBRN(req.getParameter("E01SCHBRN"));
					} catch (Exception e) {	msgSearch.setE01SCHBRN("0");
					}
					try {msgSearch.setE01SCHTI1(req.getParameter("E01SCHTI1"));
					} catch (Exception e) {	msgSearch.setE01SCHTI1("0");
					}
					try {msgSearch.setE01SCHTI2(req.getParameter("E01SCHTI2"));
					} catch (Exception e) {	msgSearch.setE01SCHTI2("0");
					}
					try {msgSearch.setE01SCHTI3(req.getParameter("E01SCHTI3"));
					} catch (Exception e) {	msgSearch.setE01SCHTI3("0");
					}
					try {msgSearch.setE01SCHTM1(req.getParameter("E01SCHTM1"));
					} catch (Exception e) {	msgSearch.setE01SCHTM1("0");
					}
					try {msgSearch.setE01SCHTM2(req.getParameter("E01SCHTM2"));
					} catch (Exception e) {	msgSearch.setE01SCHTM2("0");
					}
					try {msgSearch.setE01SCHTM3(req.getParameter("E01SCHTM3"));
					} catch (Exception e) {	msgSearch.setE01SCHTM3("0");
					}
					try {msgSearch.setE01SCHFI1(req.getParameter("E01SCHFI1"));
					} catch (Exception e) {	msgSearch.setE01SCHFI1("0");
					}
					try {msgSearch.setE01SCHFI2(req.getParameter("E01SCHFI2"));
					} catch (Exception e) {	msgSearch.setE01SCHFI2("0");
					}
					try {msgSearch.setE01SCHFI3(req.getParameter("E01SCHFI3"));
					} catch (Exception e) {	msgSearch.setE01SCHFI3("0");
					}
					try {msgSearch.setE01SCHFM1(req.getParameter("E01SCHFM1"));
					} catch (Exception e) {	msgSearch.setE01SCHFM1("0");
					}
					try {msgSearch.setE01SCHFM2(req.getParameter("E01SCHFM2"));
					} catch (Exception e) {	msgSearch.setE01SCHFM2("0");
					}
					try {msgSearch.setE01SCHFM3(req.getParameter("E01SCHFM3"));
					} catch (Exception e) {	msgSearch.setE01SCHFM3("0");
					}
					try {msgSearch.setE01SCHACC(req.getParameter("E01SCHACC"));
					} catch (Exception e) {	msgSearch.setE01SCHACC("0");
					}
					try {msgSearch.setE01SCHSER(req.getParameter("E01SCHSER"));
					} catch (Exception e) {	msgSearch.setE01SCHSER("0");
					}
				}

			userPO.setApplicationCode(msgSearch.getE01SCHACD());
			userPO.setBranch(msgSearch.getE01SCHBRN());
			userPO.setHeader10(msgSearch.getE01SCHFI1());
			userPO.setHeader11(msgSearch.getE01SCHFI2());
			userPO.setHeader12(msgSearch.getE01SCHFI3());
			userPO.setHeader13(msgSearch.getE01SCHTI1());   //pcl
			userPO.setHeader14(msgSearch.getE01SCHTI2());
			userPO.setHeader15(msgSearch.getE01SCHTI3());
			userPO.setHeader16(msgSearch.getE01SCHFM1());
			userPO.setHeader17(msgSearch.getE01SCHFM2());
			userPO.setHeader18(msgSearch.getE01SCHFM3());
			userPO.setHeader19(msgSearch.getE01SCHTM1());
			userPO.setHeader20(msgSearch.getE01SCHTM2());
			userPO.setHeader21(msgSearch.getE01SCHTM3());
			userPO.setHeader22(msgSearch.getE01SCHSER());
			userPO.setAccNum(msgSearch.getE01SCHACC());
			
			mp.sendMessage(msgSearch);
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("userPO", userPO);
				if (screen==210||screen==300||screen==310) {	pageName = "EVL0120_vl_enter_inquiry.jsp";
				} else { pageName = "EVL0120_vl_enter_delivery.jsp";
				}
			} else {

				flexLog("Putting java beans into the session");
				session.setAttribute("jbList", list);
				session.setAttribute("userPO", userPO);
				if (screen==210||screen==300||screen==310) {	pageName = "EVL0120_vl_inquiry_list.jsp";
				} else { pageName = "EVL0120_vl_delivery_list.jsp";					
				}
				}

			session.setAttribute("error", msgError);
			forward(pageName, req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

}

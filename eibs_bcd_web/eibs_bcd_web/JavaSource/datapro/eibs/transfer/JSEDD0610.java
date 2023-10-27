package datapro.eibs.transfer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDD061001Message;
import datapro.eibs.beans.EDD061002Message;
import datapro.eibs.beans.EDD061003Message;
import datapro.eibs.beans.EDD061004Message;
import datapro.eibs.beans.EDD061005Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEDD0610 extends JSEIBSServlet {

	// Transfer options
	protected static final int R_SEARCH		= 1;
	protected static final int A_SEARCH 	= 2;
	protected static final int R_LIST 		= 3;
	protected static final int R_DET	 	= 5;
	protected static final int R_SWIFT 		= 7;
	protected static final int R_FED		= 9;
	protected static final int R_TELEX		= 11;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			// Requests
			case R_SEARCH :
				procReqSearch(user, req, res, session);
				break;
			case R_LIST :
				procReqList(user, req, res, session);
				break;
			case R_DET :
				procRecTransfDet(user, req, res, session);
				break;
			case R_SWIFT :
				procRecTransfSwift(user, req, res, session);
				break;
			case R_FED :
				procRecTransfFed(user, req, res, session);
				break;
			case R_TELEX :
				procRecTransfTelex(user, req, res, session);
				break;			
			// Actions
			case A_SEARCH :
				procActionSearch(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionSearch(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		String typeTransf = "";
		try {
			typeTransf = req.getParameter("E01SCHTYA").toUpperCase();
			userPO.setHeader1(typeTransf);
		} catch (Exception e) {
			userPO.setHeader1("");
		}
		String NoTransf = "";
		try {
			NoTransf = req.getParameter("E01SCHNUM").toUpperCase();
			userPO.setHeader2(NoTransf);
		} catch (Exception e) {
			userPO.setHeader2("");
		}
		String FDM = "";
		try {
			FDM = req.getParameter("E01SCHFDM").toUpperCase();
			userPO.setHeader3(FDM);
		} catch (Exception e) {
			userPO.setHeader3("");
		}
		String FDD = "";
		try {
			FDD = req.getParameter("E01SCHFDD").toUpperCase();
			userPO.setHeader4(FDD);
		} catch (Exception e) {
			userPO.setHeader4("");
		}
		String FDY = "";
		try {
			FDY = req.getParameter("E01SCHFDY").toUpperCase();
			userPO.setHeader5(FDY);
		} catch (Exception e) {
			userPO.setHeader5("");
		}
		String TDM = "";
		try {
			TDM = req.getParameter("E01SCHTDM").toUpperCase();
			userPO.setHeader6(TDM);
		} catch (Exception e) {
			userPO.setHeader6("");
		}
		String TDD = "";
		try {
			TDD = req.getParameter("E01SCHTDD").toUpperCase();
			userPO.setHeader7(TDD);
		} catch (Exception e) {
			userPO.setHeader7("");
		}
		String TDY = "";
		try {
			TDY = req.getParameter("E01SCHTDY").toUpperCase();
			userPO.setHeader8(TDY);
		} catch (Exception e) {
			userPO.setHeader8("");
		}
		String GLDebit = "";
		try {
			GLDebit = req.getParameter("E01SCHDGL").toUpperCase();
			userPO.setHeader9(GLDebit);
		} catch (Exception e) {
			userPO.setHeader9("0");
		}
		String CtaDebit = "";
		try {
			CtaDebit = req.getParameter("E01SCHDAC").toUpperCase();
			userPO.setHeader10(CtaDebit);
		} catch (Exception e) {
			userPO.setHeader10("0");
		}
		String GLCredit = "";
		try {
			GLCredit = req.getParameter("E01SCHCGL").toUpperCase();
			userPO.setHeader11(GLCredit);
		} catch (Exception e) {
			userPO.setHeader11("0");
		}
		String CtaCredit = "";
		try {
			CtaCredit = req.getParameter("E01SCHCAC").toUpperCase();
			userPO.setHeader12(CtaCredit);
		} catch (Exception e) {
			userPO.setHeader12("0");
		}
		String MontoI = "";
		try {
			MontoI = req.getParameter("E01SCHAMF").toUpperCase();
			userPO.setHeader13(MontoI);
		} catch (Exception e) {
			userPO.setHeader13("0.00");
		}
		String MontoF = "";
		try {
			MontoF = req.getParameter("E01SCHAMT").toUpperCase();
			userPO.setHeader14(MontoF);
		} catch (Exception e) {
			userPO.setHeader14("0.00");
		}
		String Ref = "";
		try {
			Ref = req.getParameter("E01SCHORF").toUpperCase();
			userPO.setHeader15(Ref);
		} catch (Exception e) {
			userPO.setHeader15("");
		}
		String Ord = "";
		try {
			Ord = req.getParameter("E01SCHBYO").toUpperCase();
			userPO.setHeader16(Ord);
		} catch (Exception e) {
			userPO.setHeader16("");
		}
		String Bene = "";
		try {
			Bene = req.getParameter("E01SCHBNF").toUpperCase();
			userPO.setHeader17(Bene);
		} catch (Exception e) {
			userPO.setHeader17("");
		}
		String Ing = "";
		try {
			Ing = req.getParameter("E01SCHOPR").toUpperCase();
			userPO.setHeader18(Ing);
		} catch (Exception e) {
			userPO.setHeader18("");
		}
		String Lib = "";
		try {
			Lib = req.getParameter("E01SCHREL").toUpperCase();
			userPO.setHeader19(Lib);
		} catch (Exception e) {
			userPO.setHeader19("");
		}

		session.setAttribute("userPO", userPO);
		
		if (!NoTransf.equals("")) {
		 	 procRecTransfDet(user, req, res, session);
	 	} else {
		 	 procReqList(user, req, res, session);
	 	}
	}

	private void procRecTransfTelex(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0610", req);
			EDD061004Message msgTelex = (EDD061004Message) mp.getMessageRecord("EDD061004");
		 	msgTelex.setH04USERID(user.getH01USR());
		 	msgTelex.setH04PROGRM("EDD0610");
		 	msgTelex.setH04TIMSYS(getTimeStamp());
		 	msgTelex.setH04SCRCOD("03");
		 	msgTelex.setH04OPECOD("0004");
		 	msgTelex.setE04SCHBNK(userPO.getBank());
			msgTelex.setE04SCHNUM(userPO.getHeader20()); 
			msgTelex.setE04SCHTYA(userPO.getHeader21());	
			
			mp.sendMessage(msgTelex);
		 	MessageRecord msg = mp.receiveMessageRecord();
		 	
		 	if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EDD0610_tr_inq_contab.jsp";
		 	} else {
		 		msgTelex = (EDD061004Message) msg; 
				session.setAttribute("error", new ELEERRMessage());
				session.setAttribute("userPO", userPO);
				session.setAttribute("inqTelex", msgTelex);
				pageName = "EDD0610_tr_inq_telex.jsp";
		 	}
			
		 	forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procRecTransfFed(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0610", req);
			EDD061002Message msgFed = (EDD061002Message) mp.getMessageRecord("EDD061002");
		 	msgFed.setH02USERID(user.getH01USR());
		 	msgFed.setH02PROGRM("EDD0610");
		 	msgFed.setH02TIMSYS(getTimeStamp());
		 	msgFed.setH02SCRCOD("03");
		 	msgFed.setH02OPECOD("0004");
		 	msgFed.setE02SCHBNK(userPO.getBank());
			msgFed.setE02SCHNUM(userPO.getHeader20()); 
			msgFed.setE02SCHTYA(userPO.getHeader21());	
			
			mp.sendMessage(msgFed);
		 	MessageRecord msg = mp.receiveMessageRecord();
		 	
		 	if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EDD0610_tr_inq_contab.jsp";
		 	} else {
		 		msgFed = (EDD061002Message) msg; 
				session.setAttribute("error", new ELEERRMessage());
				session.setAttribute("userPO", userPO);
				session.setAttribute("inqFed", msgFed);
				pageName = "EDD0610_tr_inq_fed.jsp";
		 	}
			
		 	forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procRecTransfSwift(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0610", req);
			EDD061003Message msgSwift = (EDD061003Message) mp.getMessageRecord("EDD061003");
		 	msgSwift.setH03USERID(user.getH01USR());
		 	msgSwift.setH03PROGRM("EDD0610");
		 	msgSwift.setH03TIMSYS(getTimeStamp());
		 	msgSwift.setH03SCRCOD("03");
		 	msgSwift.setH03OPECOD("0004");
		 	msgSwift.setE03SCHBNK(userPO.getBank());
			msgSwift.setE03SCHNUM(userPO.getHeader20()); 
			msgSwift.setE03SCHTYA(userPO.getHeader21());
			
			mp.sendMessage(msgSwift);
		 	MessageRecord msg = mp.receiveMessageRecord();
		 	
		 	if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EDD0610_tr_inq_contab.jsp";
		 	} else {
		 		msgSwift = (EDD061003Message) msg; 
				session.setAttribute("error", new ELEERRMessage());
				session.setAttribute("userPO", userPO);
				session.setAttribute("inqSwift", msgSwift);
				pageName = "EDD0610_tr_inq_swift.jsp";
		 	}
			
		 	forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procRecTransfDet(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0610", req);
			EDD061005Message msgCont = (EDD061005Message) mp.getMessageRecord("EDD061005");
		 	msgCont.setH05USERID(user.getH01USR());
		 	msgCont.setH05PROGRM("EDD0610");
		 	msgCont.setH05TIMSYS(getTimeStamp());
		 	msgCont.setH05SCRCOD("05");
		 	msgCont.setH05OPECOD("0004");
		 	if (!userPO.getHeader2().equals("")){
			 	msgCont.setE05SCHNUM(userPO.getHeader2());
		 	} else {
		 		try {
			 	   msgCont.setE05SCHBNK(req.getParameter("BNK").trim());
				} catch (Exception e) {
					msgCont.setE05SCHBNK("");
				}
		 		try {
				   msgCont.setE05SCHNUM(req.getParameter("NMR").trim()); 
				} catch (Exception e) {
					msgCont.setE05SCHNUM("");
				}
		 		try {
					msgCont.setE05SCHTYA(req.getParameter("TPY").trim());
				} catch (Exception e) {
					msgCont.setE05SCHTYA("");
				}
			}
		 	
		 	mp.sendMessage(msgCont);
		 	MessageRecord msg = mp.receiveMessageRecord();
		 	
		 	if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EDD0610_tr_list.jsp";
		 	} else {
		 		msgCont = (EDD061005Message) msg; 
				userPO.setBank(msgCont.getE05WRTBNK());
				userPO.setHeader20(msgCont.getE05SCHNUM());
				userPO.setHeader21(msgCont.getE05SCHTYA());
				userPO.setHeader22(msgCont.getE05WRTBYO());
				
				session.setAttribute("error", new ELEERRMessage());
				session.setAttribute("userPO", userPO);
				session.setAttribute("inqContab", msgCont);
				pageName = "EDD0610_tr_inq_contab.jsp";
		 	}
			
		 	forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		
		int type = 0;
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0610", req);
			EDD061001Message msgSearch = (EDD061001Message) mp.getMessageRecord("EDD061001");
			msgSearch.setH01USERID(user.getH01USR());
		 	msgSearch.setH01PROGRM("EDD0610");
		 	msgSearch.setH01TIMSYS(getTimeStamp());
		 	msgSearch.setH01SCRCOD("01");
		 	msgSearch.setH01OPECOD("0004");
			try {
			 	msgSearch.setE01SCHTYA(userPO.getHeader1().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHTYA("0");	
			}
			try {
			 	msgSearch.setE01SCHFDM(userPO.getHeader3().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHFDM("0");	
			}
			try {
			 	msgSearch.setE01SCHFDD(userPO.getHeader4().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHFDD("0");	
			}
			try {
			 	msgSearch.setE01SCHFDY(userPO.getHeader5().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHFDY("0");	
			}
			try {
			 	msgSearch.setE01SCHTDM(userPO.getHeader6().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHTDM("0");	
			}
			try {
			 	msgSearch.setE01SCHTDD(userPO.getHeader7().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHTDD("0");	
			}
			try {
			 	msgSearch.setE01SCHTDY(userPO.getHeader8().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHFDY("0");	
			}
			try {
			 	msgSearch.setE01SCHDGL(userPO.getHeader9().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHDGL("0");	
			}
			try {
			 	msgSearch.setE01SCHDAC(userPO.getHeader10().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHDAC("0");	
			}
			try {
			 	msgSearch.setE01SCHCGL(userPO.getHeader11().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHCGL("0");	
			}
			try {
			 	msgSearch.setE01SCHCAC(userPO.getHeader12().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHCAC("0");	
			}
			try {
			 	msgSearch.setE01SCHAMF(userPO.getHeader13().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHAMF("0");
			}
			try {
			 	msgSearch.setE01SCHAMT(userPO.getHeader14().trim());;
			} catch (Exception e) {
		 		msgSearch.setE01SCHAMT("0");
			}
			try {
			 	msgSearch.setE01SCHORF(userPO.getHeader15().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHORF("0");
			}
		 	try {
			 	msgSearch.setE01SCHBYO(userPO.getHeader16().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHBYO("0");
			}
		 	try {
			 	msgSearch.setE01SCHBNF(userPO.getHeader17().trim());
			} catch (Exception e) {
		 		msgSearch.setE01SCHBNF("0");
			}
		 	try {
			 	msgSearch.setE01SCHOPR(userPO.getHeader18().trim());
		    } catch (Exception e) {
		 	    msgSearch.setE01SCHOPR("0");
		    }
		 	try {
			 	msgSearch.setE01SCHREL(userPO.getHeader19().trim());
		    } catch (Exception e) {
		 		msgSearch.setE01SCHREL("0");
		    } 	
		 	try {
		 		msgSearch.setE01NUMREC(req.getParameter("Pos").trim());
		 	} catch (Exception ex) {
			 	msgSearch.setE01NUMREC("0");
		 	}
		 	
		 	mp.sendMessage(msgSearch);
		 	JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
		 	
		 	if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "EDD0610_tr_search.jsp";
		 	} else {
		 		JBList beanList = new JBList();
		 		StringBuffer myRow = null;
		 		list.initRow();
		 		while (list.getNextRow()) {
		 			msgSearch = (EDD061001Message) list.getRecord();
					String showTransfFunc = "showTransfDet('" + msgSearch.getE01SCHTYA() + "', '" + msgSearch.getE01WRTNUM() + "', '" + msgSearch.getE01SCHBNK() + "')";
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP ALIGN=CENTER><A HREF=\"javascript:" + showTransfFunc + "\">" + Util.formatCell(msgSearch.getE01WRTNUM()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=CENTER><A HREF=\"javascript:" + showTransfFunc + "\">" + Util.formatCell(msgSearch.getE01WRTSTS()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=LEFT><A HREF=\"javascript:" + showTransfFunc + "\">" + Util.formatCell(msgSearch.getE01WRTBNF()) + "</TD>");
					myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatCustomDate(user.getE01DTF(),
										msgSearch.getBigDecimalE01WRTVTM().intValue(),
										msgSearch.getBigDecimalE01WRTVTD().intValue(),
										msgSearch.getBigDecimalE01WRTVTY().intValue())	
								+ "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT><A HREF=\"javascript:" + showTransfFunc + "\">" + Util.formatCCY(msgSearch.getE01WRTAMT()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
		 		}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				beanList.setSearchType(type + "");
				pageName = "EDD0610_tr_list.jsp";
		 	}
			
		 	forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqSearch(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = new UserPos();
		userPO.setOption("TRAN");
		userPO.setPurpose("");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0610_tr_search.jsp", req, res);
	}

}

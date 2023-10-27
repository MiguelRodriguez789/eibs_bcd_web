package datapro.eibs.products;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.DataTransaction;
import datapro.eibs.beans.EDL080001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EOF011501Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ETL051001Message;
import datapro.eibs.beans.EWD0115DSMessage;
import datapro.eibs.beans.EWD0120DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEOF0115 extends JSEIBSServlet {

	// certificate of deposit
	
	protected static final int R_BASIC		    = 1;
	protected static final int A_BASIC		    = 2;
	protected static final int R_LIST_HELP		= 3;
	protected static final int R_LIST_LEDGER	= 5;
	protected static final int R_LIST_PRINT		= 7;
	protected static final int R_CHANGE_NUMBER	= 9;
	protected static final int A_CHANGE_NUMBER	= 10;
	protected static final int R_OTHERS_TRANS	= 11;
	protected static final int R_BASIC_INQ	    = 12;
	protected static final int R_REV		    = 101;
	
	// entering options
	protected static final int R_LIST_NEW		    = 100;
	protected static final int R_ENTER_MAINT		= 300;

	protected static final int A_LIST_NEW		    = 200;
	protected static final int A_ENTER_MAINT		= 400;
	protected static final int R_ENTER_REV		= 500;
	protected static final int A_ENTER_REV		= 600;
	
	protected static final int A_ENTER_INQ_PAR  = 1600;
	protected static final int R_BASIC_PAR_INQ  = 113;

	protected static final int R_LIST_NEW_PAR	= 700;
	protected static final int A_LIST_NEW_PAR   = 800;
	protected static final int A_BASIC_PAR	    = 900;
	protected static final int A_ENTER_MAINT_PAR= 1400;
	protected static final int A_ENTER_MAINT_DEL= 1500;
	protected static final int A_BASIC_PAR_DEL  = 1900;
	protected static final int R_BASIC_PAR	    = 111;	
	protected static final int R_BASIC_PAR_DEL  = 112;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		// BEGIN Off. Chk
		// Request
		case R_BASIC :
			procReqMaint(user, req, res, session);
			break;	
		case R_BASIC_INQ :
			procReqInquiry(user, req, res, session);
			break;	
			
		case R_BASIC_PAR :
			procReqMaintPar(user, req, res, session);
			break;	
		case R_BASIC_PAR_DEL :
			procReqMaintParDel(user, req, res, session);
			break;	
			
		case R_BASIC_PAR_INQ :
			procReqInqPar(user, req, res, session);
			break;	

		
		case R_LIST_HELP :
			procReqListHelp(user, req, res, session);
			break;	
		case R_LIST_LEDGER :
			procReqListLedger(user, req, res, session);
			break;
		case R_LIST_PRINT : 
			procReqPrint(user, req, res, session);
			break;
		case R_CHANGE_NUMBER : 
			procReqChangeNumber(user, req, res, session);
			break;
		case R_OTHERS_TRANS : 
			procReqOthersTransaction(user, req, res, session);
			break;
		case R_REV :
			procReqRev (user, req, res, session);
			break;		
				
		// Action
		case A_BASIC :
			procActionBasic(user, req, res, session);
			break;
		case A_CHANGE_NUMBER : 
			procActionChangeNumber(user, req, res, session);
			break;	
		case A_BASIC_PAR :
			procActionBasicPar(user, req, res, session);
			break;
		case A_BASIC_PAR_DEL :
			procActionBasicParDel(user, req, res, session);
			break;

		
		// END Off. Check

		// BEGIN Entering
		// Request
		case R_LIST_NEW : 
			procReqListNew(user, req, res, session);
			break;
		case R_LIST_NEW_PAR : 
			procReqListNewPar(user, req, res, session);
			break;
		
		case R_ENTER_MAINT : 
			procReqEnterMaint(user, req, res, session);
			break;
		
		// Action 
		case A_ENTER_MAINT : 
			procActionEnterMaint(user, req, res, session);
			break;	
		case A_ENTER_MAINT_PAR : 
			procActionEnterMaintPar(user, req, res, session);
			break;	
		case A_ENTER_MAINT_DEL : 
			procActionEnterMaintDel(user, req, res, session);
			break;	

		case A_LIST_NEW :
		    procActionEnterNew(user, req, res, session);
			break;
		case A_LIST_NEW_PAR :
			procActionEnterNewPar(user, req, res, session);
			break;

		case R_ENTER_REV : 
			procReqEnterRev(user, req, res, session);
			break;	
		case A_ENTER_REV : 
			procActionEnterRev(user, req, res, session);	
			break;		
			
		// END Entering
			
		case A_ENTER_INQ_PAR : 
			procActionEnterInqPar(user, req, res, session);
			break;	

		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procActionEnterInqPar(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		try {
			userPO.setHeader22(req.getParameter("CHK").trim());
		} catch (Exception e) {
			userPO.setHeader22("0");
		}
		try {
			userPO.setHeader23(req.getParameter("LNSACC").trim());
		} catch (Exception e) {
			userPO.setHeader23("0");
		}
		session.setAttribute("userPO", userPO);
		
		procReqInqPar(user, req, res, session);
	}

	private void procActionEnterRev(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		try {
			userPO.setIdentifier(req.getParameter("E01OFMCKN").trim());
		} catch (Exception e) {
			userPO.setIdentifier("0");
		}
		try {
			userPO.setCurrency(req.getParameter("E01OFMCCY").toUpperCase());
		} catch (Exception e) {
			userPO.setCurrency("");
		}
		session.setAttribute("userPO", userPO);
		procReqRev(user, req, res, session);
	}

	private void procReqEnterRev(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setOption("OCK");
		userPO.setPurpose("REVERSION");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EOF0115_of_chk_enter_rev.jsp", req, res);
	}

	private void procActionEnterNewPar(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501");
			msgOffChk.setH01USERID(user.getH01USR());
			msgOffChk.setH01PROGRM("EOF0115");
			msgOffChk.setH01TIMSYS(getTimeStamp());
			msgOffChk.setH01SCRCOD("01");
			msgOffChk.setH01OPECOD("0001");
			try {
				msgOffChk.setE01OFMFTY(req.getParameter("E01OFMFTY").trim());		 	  
			} catch (Exception e) {
				msgOffChk.setE01OFMFTY("0");
			}
			try {
				msgOffChk.setE01OFMCKN(req.getParameter("E01OFMCKN").trim());		 	  
			} catch (Exception e) {
				msgOffChk.setE01OFMCKN("");
			}
			try {
				msgOffChk.setE01OFMCCY(req.getParameter("E01OFMCCY").trim());
			} catch (Exception e) {
				msgOffChk.setE01OFMCCY("0");
			}
			try {
				msgOffChk.setE01OFMCUN(userPO.getHeader2().trim());		 	  
			} catch (Exception e) {
			}
			try {
				msgOffChk.setE01OFMAMT(userPO.getHeader22().trim());		 	  
			} catch (Exception e) {
			}
			try {
				msgOffChk.setE01DEBACC(userPO.getHeader23().trim());		 	  
			} catch (Exception e) {
			}
			try {
				msgOffChk.setE01OFMPTH(userPO.getHeader23().trim());		 	  
			} catch (Exception e) {
			}
			try {
				msgOffChk.setE01DEBGLN(userPO.getGenLedger().trim());	
			} catch (Exception e) {
				// TODO: handle exception
			}
			if (userPO.getSource().equals("FACT")) {
				msgOffChk.setE01DEBOPC(userPO.getAccOpt().trim());
			}

			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgOffChk = (EOF011501Message) mp.receiveMessageRecord("EOF011501");

			if (mp.hasError(msgError)) {
				pageName = "EOF0115_of_chk_new_lns.jsp";
			} else {
				userPO.setHeader23(msgOffChk.getE01OFMCKN());
				pageName = "EOF0115_of_chk_basic_lns.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("offBasic", msgOffChk);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501");
		 	msgOffChk.setH01USERID(user.getH01USR());
		 	msgOffChk.setH01PROGRM("EOF0115");
		 	msgOffChk.setH01TIMSYS(getTimeStamp());
		 	msgOffChk.setH01SCRCOD("01");
		 	msgOffChk.setH01OPECOD("0001");
			try {
				msgOffChk.setE01OFMFTY(req.getParameter("E01OFMFTY").trim());		 	  
			} catch (Exception e) {
				msgOffChk.setE01OFMFTY("0");
			}
			try {
				msgOffChk.setE01OFMCKN(req.getParameter("E01OFMCKN").trim());		 	  
			} catch (Exception e) {
				msgOffChk.setE01OFMCKN("");
			}
			try {
				msgOffChk.setE01OFMCCY(req.getParameter("E01OFMCCY"));
			} catch (Exception e) {
			 	msgOffChk.setE01OFMCCY("0");
			}

			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgOffChk = (EOF011501Message) mp.receiveMessageRecord("EOF011501");

			if (mp.hasError(msgError)) {
				pageName = "EOF0115_of_chk_new.jsp";
			} else {
				userPO.setIdentifier(msgOffChk.getE01OFMCKN());
				if (msgOffChk.getE01SELTIP().equals("3")) {
					pageName = "EOF0115_of_chk_basic_giro.jsp";
				} else if (msgOffChk.getE01SELTIP().equals("4")) {	
					pageName = "EOF0115_of_chk_basic_cheque_tercero.jsp";
				} else {
					pageName = "EOF0115_of_chk_basic.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("offBasic", msgOffChk);
			session.setAttribute("currUser", user);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionEnterMaintDel(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		try {
			userPO.setHeader22(req.getParameter("CHK").trim());
		} catch (Exception e) {
			userPO.setHeader22("0");
		}
		try {
			userPO.setHeader23(req.getParameter("LNSACC").trim());
		} catch (Exception e) {
			userPO.setHeader23("0");
		}
		session.setAttribute("userPO", userPO);
		
		procReqMaintParDel(user, req, res, session);
	}

	private void procActionEnterMaintPar(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		try {
			userPO.setHeader22(req.getParameter("CHK").trim());
		} catch (Exception e) {
			userPO.setHeader22("0");
		}
		try {
			userPO.setHeader23(req.getParameter("LNSACC").trim());
		} catch (Exception e) {
			userPO.setHeader23("0");
		}
		session.setAttribute("userPO", userPO);
		
		procReqMaintPar(user, req, res, session);
	}

	private void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		String Opt = "1";
	    if (userPO.getOption().equals("3")) 
	    	Opt = "3";
	    else if (userPO.getOption().equals("4")) 
	    	Opt = "4";
		try {
			userPO.setIdentifier(req.getParameter("E01OFMCKN").trim());
		} catch (Exception e) {
			userPO.setIdentifier("0");
		}
		try {
			userPO.setCurrency(req.getParameter("E01OFMCCY").toUpperCase());
		} catch (Exception e) {
			userPO.setCurrency("");
		}
		session.setAttribute("userPO", userPO);
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEOF0115?SCREEN=1&OPTION=" + Opt);
	}

	private void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		try {
			userPO.setOption(req.getParameter("OPTION").trim());
		} catch (Exception e) {
		}
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EOF0115_of_chk_enter_maint.jsp", req, res);
	}

	private void procReqListNewPar(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("NEW");
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0115", req);
			EWD0115DSMessage msgList = (EWD0115DSMessage) mp.getMessageRecord("EWD0115DS");
			try {
				userPO.setSource(req.getParameter("SOURCE").trim());
				if (userPO.getSource().equals("FACT")) {
					try {
						userPO.setGenLedger(req.getParameter("GLNUMB").trim());
					} catch (Exception e) {
						// TODO: handle exception
					}
					try {
						userPO.setHeader18(req.getParameter("SEQ").trim());
					} catch (Exception e) {
						// TODO: handle exception
					}
					try {
						userPO.setAccOpt(req.getParameter("CON").trim());
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgList.setEWDOPE(req.getParameter("OPTION").trim());
				userPO.setOption(req.getParameter("OPTION").trim());
			} catch (Exception e) {
			}
			try {
				userPO.setHeader22(req.getParameter("VAL").trim());
			} catch (Exception e) {
				userPO.setHeader22("0");
			}
			try {
				userPO.setHeader23(req.getParameter("LNSACC").trim());
			} catch (Exception e) {
				userPO.setHeader23("0");
			}

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");

			JBList beanList = new JBList();
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "EOF0115_of_chk_new_lns.jsp";
			} else {
				if (!list.isEmpty()) {
					StringBuffer myRow = null;
					Iterator<?> iterator = list.iterator();
					while (iterator.hasNext()) {
						msgList = (EWD0115DSMessage) iterator.next();
						myRow = new StringBuffer("<TR>");
						myRow.append("<td ALIGN=\"CENTER\"><a href=\"javascript:enter('" + msgList.getEWDFTY() + "', '" + msgList.getEWDCCY() + "')\">" + msgList.getEWDBNK() + "</a></td>");
						myRow.append("<td ALIGN=\"CENTER\"><a href=\"javascript:enter('" + msgList.getEWDFTY() + "', '" + msgList.getEWDCCY() + "')\">" + msgList.getEWDCCY() + "</a></td>");
						myRow.append("<td ALIGN=\"CENTER\"><a href=\"javascript:enter('" + msgList.getEWDFTY() + "', '" + msgList.getEWDCCY() + "')\">" + msgList.getEWDFTY() + "</a></td>");
						myRow.append("<td><a href=\"javascript:enter('" + msgList.getEWDFTY() + "', '" + msgList.getEWDCCY() + "')\">" + msgList.getEWDDSC() + "</a></td>");
						myRow.append("</TR>");
						beanList.addRow("", myRow.toString());
					}
				}
				pageName = "EOF0115_of_chk_new_lns.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("ewd0115Help", beanList);
			
			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqListNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("NEW");
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0115", req);
			EWD0115DSMessage msgList = (EWD0115DSMessage) mp.getMessageRecord("EWD0115DS");
			try {
				msgList.setEWDOPE(req.getParameter("OPTION").trim());
				userPO.setOption(req.getParameter("OPTION").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");

			JBList beanList = new JBList();
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EOF0115_of_chk_new.jsp";
			} else {
				StringBuffer myRow = null;
				Iterator<?> iterator = list.iterator();
				while (iterator.hasNext()) {
					msgList = (EWD0115DSMessage) iterator.next();
					myRow = new StringBuffer("<TR>");
					myRow.append("<td ALIGN=\"CENTER\"><a href=\"javascript:enter('" + msgList.getEWDFTY() + "', '" + msgList.getEWDCCY() + "')\">" + msgList.getEWDBNK() + "</a></td>");
					myRow.append("<td ALIGN=\"CENTER\"><a href=\"javascript:enter('" + msgList.getEWDFTY() + "', '" + msgList.getEWDCCY() + "')\">" + msgList.getEWDCCY() + "</a></td>");
					myRow.append("<td ALIGN=\"CENTER\"><a href=\"javascript:enter('" + msgList.getEWDFTY() + "', '" + msgList.getEWDCCY() + "')\">" + msgList.getEWDFTY() + "</a></td>");
					myRow.append("<td><a href=\"javascript:enter('" + msgList.getEWDFTY() + "', '" + msgList.getEWDCCY() + "')\">" + msgList.getEWDDSC() + "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				pageName = "EOF0115_of_chk_new.jsp";
			}

			session.setAttribute("userPO", userPO);
			session.setAttribute("ewd0115Help", beanList);
			
			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionBasicParDel(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		procReqListLedgerParDel(user, req, res, session);
	}

	private void procReqListLedgerParDel(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) session.getAttribute("offBasic");
			msgOffChk.setH01USERID(user.getH01USR());
			msgOffChk.setH01PROGRM("EOF0115");
			msgOffChk.setH01TIMSYS(getTimeStamp());
			msgOffChk.setH01SCRCOD("01");
			msgOffChk.setH01OPECOD("0008");
			
			setMessageRecord(req, msgOffChk);

			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgOffChk = (EOF011501Message) mp.receiveMessageRecord("EOF011501");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				userPO.setHeader4(msgOffChk.getE01OFMCKN());
				userPO.setCurrency(msgOffChk.getE01OFMCCY());
				userPO.setHeader5(msgOffChk.getE01OFMEMM());
				userPO.setHeader6(msgOffChk.getE01OFMEMD());
				userPO.setHeader7(msgOffChk.getE01OFMEMY());
				userPO.setHeader8(msgOffChk.getE01OFMAMT());
				userPO.setHeader9(msgOffChk.getE01OFMBNF());
				userPO.setHeader10(msgOffChk.getE01OFMBN1());
				userPO.setHeader11(msgOffChk.getE01LETAMT());
				userPO.setHeader12(msgOffChk.getE01OFMCO1());
				userPO.setHeader13(msgOffChk.getE01OFMCO2());
				userPO.setHeader14(msgOffChk.getE01OFMCO3());
				userPO.setHeader19(msgOffChk.getE01OFMAPV());
				userPO.setHeader20(msgOffChk.getE01OFMBTH());
				userPO.setHeader21(user.getE01DTF());
				userPO.setHeader22(user.getE01LAN());
				
				if (userPO.getSource().equals("FACT") 
						&& !userPO.getHeader23().equals("DFT") ) {
					EDL080001Message dftBasic = (EDL080001Message) session.getAttribute("dftBasic");
					userPO.setHeader11("CONF");
					userPO.setHeader19(dftBasic.getE01DEARTE());
					userPO.setHeader23("DFT");
					userPO.setHeader4(dftBasic.getE01DSCPRO().trim());
					userPO.setHeader5(dftBasic.getE01DEAOAM().trim());
					userPO.setHeader6(dftBasic.getE01DEATRM().trim());
					userPO.setHeader7(dftBasic.getE01DEATRC().trim());
					userPO.setHeader8(dftBasic.getE01DEARET().trim());
					userPO.setOption("LN");
					userPO.setAccNum(dftBasic.getE01DEAACC());
					userPO.setIdentifier(dftBasic.getE01DEAACC());
					userPO.setProdCode(dftBasic.getE01DEAPRO().trim());
					userPO.setCusNum(dftBasic.getE01DEACUN().trim());
					userPO.setCusName(dftBasic.getE01CUSNA1().trim());
					userPO.setCurrency(dftBasic.getE01DEACCY());
					userPO.setBank(dftBasic.getE01DEABNK());
					userPO.setBranch(dftBasic.getE01DEABRN());
					userPO.setSource("FACT");
				}
				
				pageName = "EOF0115_of_chk_cont_lns_del.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionBasicPar(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		procReqListLedgerPar(user, req, res, session);
	}

	private void procReqListLedgerPar(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) session.getAttribute("offBasic");
			msgOffChk.setH01USERID(user.getH01USR());
			msgOffChk.setH01PROGRM("EOF0115");
			msgOffChk.setH01TIMSYS(getTimeStamp());
			msgOffChk.setH01SCRCOD("01");
			msgOffChk.setH01OPECOD("0005");
			
			setMessageRecord(req, msgOffChk);
			
			if (userPO.getSource().equals("FACT")) {
				msgOffChk.setH01FLGWK1("F");
				try {
					msgOffChk.setH01FLGWK2(userPO.getHeader18().trim());
				} catch (Exception e) {
					msgOffChk.setH01FLGWK2(" ");
				}
				msgOffChk.setE01DEBOPC(userPO.getAccOpt());
			}
			

			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");

			if (mp.hasError(msgError)) {
				msgOffChk = (EOF011501Message)list.get(0);
				pageName = "EOF0115_of_chk_basic_lns.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				String strDebit = "";
				String strCredit = "";
				BigDecimal debit = new BigDecimal("0.00");
				BigDecimal credit = new BigDecimal("0.00");
				Iterator<?> iterator = list.iterator();
				while (iterator.hasNext()) {
					MessageRecord msg = (MessageRecord) iterator.next();
					if (msg.getFormatName().equals("EOF011501")) { 

						msgOffChk = (EOF011501Message) msg;

						userPO.setHeader4(msgOffChk.getE01OFMCKN());
						userPO.setCurrency(msgOffChk.getE01OFMCCY());
						userPO.setHeader5(msgOffChk.getE01OFMEMM());
						userPO.setHeader6(msgOffChk.getE01OFMEMD());
						userPO.setHeader7(msgOffChk.getE01OFMEMY());
						userPO.setHeader8(msgOffChk.getE01OFMAMT());
						userPO.setHeader9(msgOffChk.getE01OFMBNF());
						userPO.setHeader10(msgOffChk.getE01OFMBN1());
						userPO.setHeader11(msgOffChk.getE01LETAMT());
						userPO.setHeader12(msgOffChk.getE01OFMCO1());
						userPO.setHeader13(msgOffChk.getE01OFMCO2());
						userPO.setHeader14(msgOffChk.getE01OFMCO3());
						userPO.setHeader19(msgOffChk.getE01OFMAPV());
						userPO.setHeader20(msgOffChk.getE01OFMBTH());
						userPO.setHeader21(user.getE01DTF());
						userPO.setHeader22(user.getE01LAN());
					} else if (msg.getFormatName().equals("EWD0120DS")) {
						EWD0120DSMessage msgList = (EWD0120DSMessage) msg;
						if (msgList.getE01WRKDCC().equals("D")) {
							debit = debit.add(msgList.getBigDecimalE01WRKAMT());
							strDebit = Util.fcolorCCY(msgList.getE01WRKAMT());
							strCredit = "&nbsp;";
						} else if(msgList.getE01WRKDCC().equals("C")) {
							credit = credit.add(msgList.getBigDecimalE01WRKAMT());
							strDebit = "&nbsp;";
							strCredit = Util.fcolorCCY(msgList.getE01WRKAMT());
						}
						myRow = new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01WRKBNK()) + "</TD>");
						myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01WRKBRN()) + "</TD>");
						myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01WRKCCY()) + "</TD>");
						myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01WRKGLN()) + "</TD>");
						myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01WRKACC()) + "</TD>");
						myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01WRKCCN()) + "</TD>");
						myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01WRKCDE()) + "</TD>");
						myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strDebit + "</TD>");
						myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strCredit + "</TD>");										
						myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01WRKTDS()) + "</TD>");					
						myRow.append("</TR>");
						beanList.addRow("", myRow.toString());
					}
				}
				session.setAttribute("ledList", beanList);
				
				if (userPO.getSource().equals("FACT") 
						&& !userPO.getHeader23().equals("DFT") ) {
					EDL080001Message dftBasic = (EDL080001Message) session.getAttribute("dftBasic");
					userPO.setHeader11("CONF");
					userPO.setHeader19(dftBasic.getE01DEARTE());
					userPO.setHeader23("DFT");
					userPO.setHeader4(dftBasic.getE01DSCPRO().trim());
					userPO.setHeader5(dftBasic.getE01DEAOAM().trim());
					userPO.setHeader6(dftBasic.getE01DEATRM().trim());
					userPO.setHeader7(dftBasic.getE01DEATRC().trim());
					userPO.setHeader8(dftBasic.getE01DEARET().trim());
					userPO.setOption("LN");
					userPO.setAccNum(dftBasic.getE01DEAACC());
					userPO.setIdentifier(dftBasic.getE01DEAACC());
					userPO.setProdCode(dftBasic.getE01DEAPRO().trim());
					userPO.setCusNum(dftBasic.getE01DEACUN().trim());
					userPO.setCusName(dftBasic.getE01CUSNA1().trim());
					userPO.setCurrency(dftBasic.getE01DEACCY());
					userPO.setBank(dftBasic.getE01DEABNK());
					userPO.setBranch(dftBasic.getE01DEABRN());
					userPO.setSource("FACT");
					userPO.setHeader15(msgOffChk.getE01OFMCKN());
				}
				
				pageName = "EOF0115_of_chk_cont_lns.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("offBasic", msgOffChk);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionChangeNumber(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501");
		 	msgOffChk.setH01USERID(user.getH01USR());
		 	msgOffChk.setH01PROGRM("EOF0115");
		 	msgOffChk.setH01TIMSYS(getTimeStamp());
		 	msgOffChk.setH01SCRCOD("01");
		 	msgOffChk.setH01OPECOD("0002");
		 	msgOffChk.setH01FLGWK1("C");
			try {
				msgOffChk.setE01OFMCKN(userPO.getIdentifier().trim());
			} catch (Exception e) {
			}
			try {
		 		msgOffChk.setE01NEWCKN(req.getParameter("E01NEWCKN").trim());
			} catch (Exception e) {
			}
			try {
		 		msgOffChk.setE01OFMCCY(userPO.getCurrency().toUpperCase());
			} catch (Exception e) {
			}

			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgOffChk = (EOF011501Message) mp.receiveMessageRecord("EOF011501");

			if (mp.hasError(msgError)) {
				pageName = "EOF0115_of_chk_change.jsp";
			} else {
				userPO.setIdentifier(msgOffChk.getE01OFMCKN());
				userPO.setCurrency(msgOffChk.getE01OFMCCY());
				//CAMBIADOS POR LA NUEVA FORMA DE MANEJAR FECHAS 
				userPO.setHeader5(msgOffChk.getE01OFMEMM());
				userPO.setHeader6(msgOffChk.getE01OFMEMD());
				userPO.setHeader7(msgOffChk.getE01OFMEMY());
				userPO.setHeader8(msgOffChk.getE01OFMAMT());
				userPO.setHeader9(msgOffChk.getE01OFMBNF());
				userPO.setHeader10(msgOffChk.getE01OFMBN1());
				userPO.setHeader11(msgOffChk.getE01LETAMT());
				userPO.setHeader12(msgOffChk.getE01OFMCO1());
				userPO.setHeader13(msgOffChk.getE01OFMCO2());
				userPO.setHeader14(msgOffChk.getE01OFMCO3());
				userPO.setHeader19(msgOffChk.getE01OFMAPV());
				userPO.setHeader20(msgOffChk.getE01OFMBTH());
				userPO.setHeader21(user.getE01DTF());
				userPO.setHeader22(user.getE01LAN());
				
				pageName = "EOF0115_of_chk_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("offBasic", msgOffChk);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionBasic(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		procReqListLedger(user, req, res, session);
	}

	private void procReqRev(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501");
			msgOffChk.setH01USERID(user.getH01USR());
			msgOffChk.setH01PROGRM("EOF0115");
			msgOffChk.setH01TIMSYS(getTimeStamp());
			msgOffChk.setH01SCRCOD("01");
			msgOffChk.setH01OPECOD("0002");// antes 1002
			try {
				msgOffChk.setE01OFMCKN(userPO.getIdentifier().trim());
			} catch (Exception e) {
				msgOffChk.setE01OFMCKN("0");
			}
			try {
				msgOffChk.setE01OFMCCY(userPO.getCurrency().trim());
			} catch (Exception e) {
			}
			msgOffChk.setH01FLGWK1("R");

			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgOffChk = (EOF011501Message) mp.receiveMessageRecord("EOF011501");

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("offBasic", msgOffChk);
			
			if (mp.hasError(msgError)) {
				pageName = "EOF0115_of_chk_enter_rev.jsp";
				forward(pageName, req, res);
			} else {
				 userPO.setIdentifier(msgOffChk.getE01OFMCKN());
				 userPO.setCurrency(msgOffChk.getE01OFMCCY());
				 userPO.setHeader5(msgOffChk.getE01OFMEMM());
				 userPO.setHeader6(msgOffChk.getE01OFMEMD());
				 userPO.setHeader7(msgOffChk.getE01OFMEMY());
				 userPO.setHeader8(msgOffChk.getE01OFMAMT());
				 userPO.setHeader9(msgOffChk.getE01OFMBNF());
				 userPO.setHeader10(msgOffChk.getE01OFMBN1());
				 userPO.setHeader11(msgOffChk.getE01LETAMT());
				 userPO.setHeader12(msgOffChk.getE01OFMCO1());
				 userPO.setHeader13(msgOffChk.getE01OFMCO2());
				 userPO.setHeader14(msgOffChk.getE01OFMCO3());
				 userPO.setHeader19(msgOffChk.getE01OFMAPV());
				 userPO.setHeader20(msgOffChk.getE01OFMBTH());
				
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEOF0120?SCREEN=20");
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqOthersTransaction(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		DataTransaction transData = new DataTransaction();
		EOF011501Message msgOffChk = (EOF011501Message) session.getAttribute("offBasic");
		
		if (userPO.getHeader19().equals("1")
				|| userPO.getHeader19().equals("2")) {
			transData.setWrkFile("4");
			transData.setAccNum(userPO.getIdentifier());
		} else {
			transData.setWrkFile("3");
			transData.setBthnum(userPO.getHeader20());
			transData.setBank(msgOffChk.getE01OFMBNK());
			transData.setBranch(msgOffChk.getE01OFMBRN());
		}
		String purpose = req.getParameter("PURPOSE") == null ? "" : req.getParameter("PURPOSE").trim();
		
		if (purpose.equals("APPROVAL")) {
			userPO.setPurpose("APPROVAL");
			purpose = "READONLY";
		} else if (purpose.equals("PRINT")) {
			userPO.setPurpose("PRINT");
			userPO.setHeader19("p"); //Print
			purpose = "READONLY";
		}
		
		if (purpose.equals("READONLY"))
			transData.setWrkFile("4");			     
		transData.setChkNum(userPO.getIdentifier());
		userPO.setOption("OCK");
		
		session.setAttribute("transData", transData);
		res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEGL0035?SCREEN=1&PURPOSE=" + purpose);
	}

	private void procReqChangeNumber(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("EOF0115_of_chk_change.jsp", req, res);
	}

	private void procReqPrint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		res.sendRedirect(srctx + "/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=3&E01OFMCKN=" + userPO.getIdentifier() + "&E01OFMCCY="+ userPO.getCurrency());
	}

	private void procReqListLedger(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) session.getAttribute("offBasic");
			msgOffChk.setH01USERID(user.getH01USR());
		 	msgOffChk.setH01PROGRM("EOF0115");
		 	msgOffChk.setH01TIMSYS(getTimeStamp());
		 	msgOffChk.setH01SCRCOD("01");
		 	msgOffChk.setH01OPECOD("0005");
		 	//Made to verify if the original check number obtained from th as400 was changed
		 	String chkNumChanged = "N" ;
		 	try {
			 	if ( !msgOffChk.getE01OFMCKN().equals(req.getParameter("E01OFMCKN").trim())
			 			|| msgOffChk.getH01FLGWK2().equals("Y") ) {
			 		chkNumChanged = "Y" ;
				}
			} catch (Exception e) {
			}
		 	setMessageRecord(req, msgOffChk);
		 	msgOffChk.setH01FLGWK2(chkNumChanged);
		 	
			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			
			if (mp.hasError(msgError)) {
				msgOffChk = (EOF011501Message) list.get(0);
				if (msgOffChk.getE01SELTIP().equals("3")) {
					pageName = "EOF0115_of_chk_basic_giro.jsp";
				} else if (msgOffChk.getE01SELTIP().equals("4")) {
					pageName = "EOF0115_of_chk_basic_cheque_tercero.jsp";
				} else {
					pageName = "EOF0115_of_chk_basic.jsp";
				}
			} else {
				if (!list.isEmpty()) {
					JBList beanList = new JBList();
					StringBuffer myRow = null;
					String strDebit = "";
					String strCredit = "";
					BigDecimal debit = new BigDecimal("0.0");
					BigDecimal credit = new BigDecimal("0.00");
					Iterator<?> iterator = list.iterator();
					while (iterator.hasNext()) {
						MessageRecord msg = (MessageRecord) iterator.next();
						if (msg.getFormatName().equals("EOF011501")) { 
							msgOffChk = (EOF011501Message) msg;
							userPO.setOption(msgOffChk.getE01SELTIP());
							userPO.setIdentifier(msgOffChk.getE01OFMCKN());
							userPO.setCurrency(msgOffChk.getE01OFMCCY());
							userPO.setHeader5(msgOffChk.getE01OFMEMM());
							userPO.setHeader6(msgOffChk.getE01OFMEMD());
							userPO.setHeader7(msgOffChk.getE01OFMEMY());
							userPO.setHeader8(msgOffChk.getE01OFMAMT());
							userPO.setHeader9(msgOffChk.getE01OFMBNF());
							userPO.setHeader10(msgOffChk.getE01OFMBN1());
							userPO.setHeader11(msgOffChk.getE01LETAMT());
							userPO.setHeader12(msgOffChk.getE01OFMCO1());
							userPO.setHeader13(msgOffChk.getE01OFMCO2());
							userPO.setHeader14(msgOffChk.getE01OFMCO3());
							userPO.setHeader19(msgOffChk.getE01OFMAPV());
							userPO.setHeader20(msgOffChk.getE01OFMBTH());
							userPO.setHeader21(user.getE01DTF());
							userPO.setHeader22(user.getE01LAN());
						} else if (msg.getFormatName().equals("EWD0120DS")) {
							EWD0120DSMessage msgList = (EWD0120DSMessage) msg;
							if (msgList.getE01WRKDCC().equals("D")) {
								debit = debit.add(msgList.getBigDecimalE01WRKAMT());
								strDebit = Util.fcolorCCY(msgList.getE01WRKAMT());
								strCredit = "&nbsp;";
							} else if(msgList.getE01WRKDCC().equals("C")) {
								credit = credit.add(msgList.getBigDecimalE01WRKAMT());
								strDebit = "&nbsp;";
								strCredit = Util.fcolorCCY(msgList.getE01WRKAMT());
							}
							
                            if(msgList.getE01WRKDCC().equals("T")){
                                strDebit = Util.fcolorCCY(msgList.getE01WRKTDB());
                                strCredit = Util.fcolorCCY(msgList.getE01WRKTDC());
                            }

							
                            if(!msgList.getE01WRKDCC().equals("T")){
                            myRow = new StringBuffer("<TR>");
								myRow.append("<TD NOWRAP ALIGN=center>"
										+ Util.formatCell(msgList
												.getE01WRKBNK()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=center>"
										+ Util.formatCell(msgList
												.getE01WRKBRN()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=center>"
										+ Util.formatCell(msgList
												.getE01WRKCCY()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=left>"
										+ Util.formatCell(msgList
												.getE01WRKGLN()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=RIGHT>"
										+ Util.formatCell(msgList
												.getE01WRKACC()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=RIGHT>"
										+ Util.formatCell(msgList
												.getE01WRKCCN()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=center>"
										+ Util.formatCell(msgList
												.getE01WRKCDE()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=left>"
										+ Util.formatCell(msgList
												.getE01WRKTDS()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=RIGHT>"
										+ strDebit + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=RIGHT>"
										+ strCredit + "</TD>");
								myRow.append("</TR>");
                            }else{
                                myRow = new StringBuffer("<TR>");
                                myRow.append("<TH NOWRAP ALIGN=center>"
										+ "" + "</TH>");
								myRow.append("<TH NOWRAP ALIGN=center>"
										+ "" + "</TH>");
								myRow.append("<TH NOWRAP ALIGN=center>"
										+ "" + "</TH>");
								myRow.append("<TH NOWRAP ALIGN=left>"
										+ "" + "</TH>");
								myRow.append("<TH NOWRAP ALIGN=RIGHT>"
										+ "" + "</TH>");
								myRow.append("<TH NOWRAP ALIGN=RIGHT>"
										+ "" + "</TH>");
								myRow.append("<TH NOWRAP ALIGN=center>"
										+ "" + "</TH>");
								myRow.append("<TH NOWRAP ALIGN=left>"
										+ Util.formatCell(msgList
												.getE01WRKTDS()) + "</TH>");
								myRow.append("<TH NOWRAP ALIGN=RIGHT>"
										+ strDebit + "</TH>");
								myRow.append("<TH NOWRAP ALIGN=RIGHT>"
										+ strCredit + "</TH>");										
                                myRow.append("</TR>");
                            }
							beanList.addRow("", myRow.toString());
						}
					}
					beanList.setFirstRec(list.getFirstRec());
					beanList.setShowNext(list.getShowNext());
					beanList.setShowNext(list.getShowNext());
					beanList.setShowPrev(list.getShowPrev());
					
					session.setAttribute("ledList", beanList);
				}
				
				if (userPO.getSource().equals("FACT") 
						&& !userPO.getHeader23().equals("DFT") ) {
					EDL080001Message dftBasic = (EDL080001Message) session.getAttribute("dftBasic");
					userPO.setHeader11("CONF");
					userPO.setHeader19(dftBasic.getE01DEARTE());
					userPO.setHeader23("DFT");
					userPO.setHeader4(dftBasic.getE01DSCPRO().trim());
					userPO.setHeader5(dftBasic.getE01DEAOAM().trim());
					userPO.setHeader6(dftBasic.getE01DEATRM().trim());
					userPO.setHeader7(dftBasic.getE01DEATRC().trim());
					userPO.setHeader8(dftBasic.getE01DEARET().trim());
					userPO.setOption("LN");
					userPO.setIdentifier(dftBasic.getE01DEAACC().trim());
					userPO.setHeader1(dftBasic.getE01DEAPRO().trim());
					userPO.setHeader2(dftBasic.getE01DEACUN().trim());
					userPO.setHeader3(dftBasic.getE01CUSNA1().trim());
					userPO.setCurrency(dftBasic.getE01DEACCY().trim());
					userPO.setBank(dftBasic.getE01DEABNK().trim());
					userPO.setBranch(dftBasic.getE01DEABRN().trim());
					userPO.setSource("FACT");
				}
				
				pageName = "EOF0115_of_chk_cont.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("offBasic", msgOffChk);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqListHelp(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ETL0510", req);
			ETL051001Message msgSearch = (ETL051001Message) mp.getMessageRecord("ETL051001");
			msgSearch.setH01USERID(user.getH01USR());
		 	msgSearch.setH01PROGRM("ETL0510");
		 	msgSearch.setH01TIMSYS(getTimeStamp());
		 	msgSearch.setH01SCRCOD("01");
		 	msgSearch.setH01OPECOD("0004");
		 	msgSearch.setE01SELSCH("D");
		 	
		 	try {
		 		msgSearch.setE01NUMREC(req.getParameter("Pos").trim());
			} catch (Exception e) {
				msgSearch.setE01NUMREC("0");
			}
		 	msgSearch.setE01SELDTY("1");
		 	msgSearch.setE01SELSCH("");

			mp.sendMessage(msgSearch);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EOF0115_of_chk_enter_maint.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					ETL051001Message msgList = (ETL051001Message) iterator.next();
					String showRef = "enter('" + msgList.getE01OFMNCH() + "')";
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:" + showRef + "\">" + Util.formatCell(msgList.getE01OFMNCH()) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:" + showRef + "\">" + Util.formatCell(msgList.getE01OFMCCY()) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:" + showRef + "\">" + Util.formatCell(msgList.getE01OFMBRN()) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:" + showRef + "\">" + Util.formatCell(msgList.getE01OFMMCH()) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:" + showRef + "\">" + Util.formatCell(msgList.getE01OFMSTS()) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:" + showRef + "\">" + Util.formatCustomDate(user.getE01DTF(),
																									msgList.getBigDecimalE01OFMIDM().intValue(),
																									msgList.getBigDecimalE01OFMIDD().intValue(),
																									msgList.getBigDecimalE01OFMIDY().intValue()) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:" + showRef + "\">" + Util.formatCell(msgList.getE01OFMBNF()) + "</A></TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("dvList", beanList);
				pageName = "EOF0115_of_chk_help.jsp";
			}
			
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqInqPar(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501");
			msgOffChk.setH01USERID(user.getH01USR());
			msgOffChk.setH01PROGRM("EOF0115");
			msgOffChk.setH01TIMSYS(getTimeStamp());
			msgOffChk.setH01SCRCOD("01");
			msgOffChk.setH01OPECOD("0006");
			try {
				msgOffChk.setE01OFMCKN(userPO.getHeader22());
			} catch (Exception e) {
				msgOffChk.setE01OFMCKN("0");
			}
			try {
				msgOffChk.setE01OFMCCY(userPO.getCurrency());
			} catch (Exception e) {
				msgOffChk.setE01OFMCCY("");
			}
			try {
				msgOffChk.setE01OFMPTH(userPO.getHeader23());
			} catch (Exception e) {
				msgOffChk.setE01OFMPTH(" ");
			}

			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgOffChk = (EOF011501Message) mp.receiveMessageRecord("EOF011501");

			if (mp.hasError(msgError)) {
				pageName = "EOF0115_of_chk_enter_maint.jsp";
			} else {
				userPO.setIdentifier(msgOffChk.getE01OFMCKN());
				userPO.setCurrency(msgOffChk.getE01OFMCCY());
				userPO.setHeader5(msgOffChk.getE01OFMEMM());
				userPO.setHeader6(msgOffChk.getE01OFMEMD());
				userPO.setHeader7(msgOffChk.getE01OFMEMY());
				userPO.setHeader8(msgOffChk.getE01OFMAMT());
				userPO.setHeader9(msgOffChk.getE01OFMBNF());
				userPO.setHeader10(msgOffChk.getE01OFMBN1());
				userPO.setHeader11(msgOffChk.getE01LETAMT());
				userPO.setHeader12(msgOffChk.getE01OFMCO1());
				userPO.setHeader13(msgOffChk.getE01OFMCO2());
				userPO.setHeader14(msgOffChk.getE01OFMCO3());
				userPO.setHeader19(msgOffChk.getE01OFMAPV());
				userPO.setHeader20(msgOffChk.getE01OFMBTH());
				
				pageName = "EOF0115_of_chk_basic_lns_inq.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("offBasic", msgOffChk);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqMaintParDel(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501");
			msgOffChk.setH01USERID(user.getH01USR());
			msgOffChk.setH01PROGRM("EOF0115");
			msgOffChk.setH01TIMSYS(getTimeStamp());
			msgOffChk.setH01SCRCOD("01");
			msgOffChk.setH01OPECOD("0006");
			try {
				msgOffChk.setE01OFMCKN(userPO.getHeader22());
			} catch (Exception e) {
				msgOffChk.setE01OFMCKN("0");
			}
			try {
				 msgOffChk.setE01OFMCCY(userPO.getCurrency());
			} catch (Exception e) {
				 msgOffChk.setE01OFMCCY("");
			}
			try {
				msgOffChk.setE01OFMPTH(userPO.getHeader23());
			} catch (Exception e) {
				msgOffChk.setE01OFMPTH(" ");
			}

			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgOffChk = (EOF011501Message) mp.receiveMessageRecord("EOF011501");

			if (mp.hasError(msgError)) {
				pageName = "EOF0115_of_chk_enter_maint.jsp";
			} else {
				userPO.setIdentifier(msgOffChk.getE01OFMCKN());
				userPO.setCurrency(msgOffChk.getE01OFMCCY());
				userPO.setHeader5(msgOffChk.getE01OFMEMM());
				userPO.setHeader6(msgOffChk.getE01OFMEMD());
				userPO.setHeader7(msgOffChk.getE01OFMEMY());
				userPO.setHeader8(msgOffChk.getE01OFMAMT());
				userPO.setHeader9(msgOffChk.getE01OFMBNF());
				userPO.setHeader10(msgOffChk.getE01OFMBN1());
				userPO.setHeader11(msgOffChk.getE01LETAMT());
				userPO.setHeader12(msgOffChk.getE01OFMCO1());
				userPO.setHeader13(msgOffChk.getE01OFMCO2());
				userPO.setHeader14(msgOffChk.getE01OFMCO3());
				userPO.setHeader19(msgOffChk.getE01OFMAPV());
				userPO.setHeader20(msgOffChk.getE01OFMBTH());
				
				pageName = "EOF0115_of_chk_basic_lns_del.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("offBasic", msgOffChk);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqMaintPar(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501");
			msgOffChk.setH01USERID(user.getH01USR());
			msgOffChk.setH01PROGRM("EOF0115");
			msgOffChk.setH01TIMSYS(getTimeStamp());
			msgOffChk.setH01SCRCOD("01");
			msgOffChk.setH01OPECOD("0006");
			try {
				msgOffChk.setE01OFMCKN(userPO.getHeader22());
			} catch (Exception e) {
				msgOffChk.setE01OFMCKN("0");
			}
			try {
				msgOffChk.setE01OFMCCY(userPO.getCurrency());
			} catch (Exception e) {
				msgOffChk.setE01OFMCCY("");
			}
			try {
				msgOffChk.setE01OFMPTH(userPO.getHeader23());
			} catch (Exception e) {
				msgOffChk.setE01OFMPTH(" ");
			}

			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgOffChk = (EOF011501Message) mp.receiveMessageRecord("EOF011501");

			if (mp.hasError(msgError)) {
				pageName = "EOF0115_of_chk_enter_maint.jsp";
			} else {
				userPO.setIdentifier(msgOffChk.getE01OFMCKN());
				userPO.setCurrency(msgOffChk.getE01OFMCCY());
				userPO.setHeader5(msgOffChk.getE01OFMEMM());
				userPO.setHeader6(msgOffChk.getE01OFMEMD());
				userPO.setHeader7(msgOffChk.getE01OFMEMY());
				userPO.setHeader8(msgOffChk.getE01OFMAMT());
				userPO.setHeader9(msgOffChk.getE01OFMBNF());
				userPO.setHeader10(msgOffChk.getE01OFMBN1());
				userPO.setHeader11(msgOffChk.getE01LETAMT());
				userPO.setHeader12(msgOffChk.getE01OFMCO1());
				userPO.setHeader13(msgOffChk.getE01OFMCO2());
				userPO.setHeader14(msgOffChk.getE01OFMCO3());
				userPO.setHeader19(msgOffChk.getE01OFMAPV());
				userPO.setHeader20(msgOffChk.getE01OFMBTH());
				
				pageName = "EOF0115_of_chk_basic_lns_mnt.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("offBasic", msgOffChk);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqInquiry(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501");
			msgOffChk.setH01USERID(user.getH01USR());
			msgOffChk.setH01PROGRM("EOF0115");
			msgOffChk.setH01TIMSYS(getTimeStamp());
			msgOffChk.setH01SCRCOD("01");
			msgOffChk.setH01OPECOD("0004");
			try {
				msgOffChk.setE01OFMCKN(userPO.getIdentifier());
			} catch (Exception e) {
				msgOffChk.setE01OFMCKN("");
			}
			try {
				msgOffChk.setE01OFMCCY(userPO.getCurrency());
			} catch (Exception e) {
				msgOffChk.setE01OFMCCY("");
			}

			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgOffChk = (EOF011501Message) mp.receiveMessageRecord("EOF011501");

			if (mp.hasError(msgError)) {
				if (userPO.getPurpose().equals("PRINT")) {
					pageName = "EOF0115_of_chk_print.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				userPO.setIdentifier(msgOffChk.getE01OFMCKN());
				userPO.setCurrency(msgOffChk.getE01OFMCCY());
				userPO.setHeader5(msgOffChk.getE01OFMEMM());
				userPO.setHeader6(msgOffChk.getE01OFMEMD());
				userPO.setHeader7(msgOffChk.getE01OFMEMY());
				userPO.setHeader8(msgOffChk.getE01OFMAMT());
				userPO.setHeader9(msgOffChk.getE01OFMBNF());
				userPO.setHeader10(msgOffChk.getE01OFMBN1());
				userPO.setHeader11(msgOffChk.getE01LETAMT());
				userPO.setHeader12(msgOffChk.getE01OFMCO1());
				userPO.setHeader13(msgOffChk.getE01OFMCO2());
				userPO.setHeader14(msgOffChk.getE01OFMCO3());
				userPO.setHeader19(msgOffChk.getE01OFMAPV());
				userPO.setHeader20(msgOffChk.getE01OFMBTH());
				
				pageName = "EOF0115_of_chk_basic_inquiry.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("offBasic", msgOffChk);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqMaint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501");
		 	msgOffChk.setH01USERID(user.getH01USR());
		 	msgOffChk.setH01PROGRM("EOF0115");
		 	msgOffChk.setH01TIMSYS(getTimeStamp());
		 	msgOffChk.setH01SCRCOD("01");
		 	msgOffChk.setH01OPECOD("0002");
		 	try {
		 		msgOffChk.setE01SELTIP(userPO.getOption());
			} catch (Exception e) {
				msgOffChk.setE01SELTIP("1");
			}
		 	try {
		 		msgOffChk.setE01OFMCKN(userPO.getIdentifier());
			} catch (Exception e) {
				msgOffChk.setE01OFMCKN("0");
			}
		 	try {
		 		msgOffChk.setE01OFMCCY(userPO.getCurrency());
			} catch (Exception e) {
				msgOffChk.setE01OFMCCY("");
			}

			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgOffChk = (EOF011501Message) mp.receiveMessageRecord("EOF011501");

			if (mp.hasError(msgError)) {
				pageName = "EOF0115_of_chk_enter_maint.jsp";
			} else {
				userPO.setOption(msgOffChk.getE01SELTIP());
				userPO.setIdentifier(msgOffChk.getE01OFMCKN());
				userPO.setCurrency(msgOffChk.getE01OFMCCY());
				userPO.setHeader5(msgOffChk.getE01OFMEMM());
				userPO.setHeader6(msgOffChk.getE01OFMEMD());
				userPO.setHeader7(msgOffChk.getE01OFMEMY());
				userPO.setHeader8(msgOffChk.getE01OFMAMT());
				userPO.setHeader9(msgOffChk.getE01OFMBNF());
				userPO.setHeader10(msgOffChk.getE01OFMBN1());
				userPO.setHeader11(msgOffChk.getE01LETAMT());
				userPO.setHeader12(msgOffChk.getE01OFMCO1());
				userPO.setHeader13(msgOffChk.getE01OFMCO2());
				userPO.setHeader14(msgOffChk.getE01OFMCO3());
				userPO.setHeader19(msgOffChk.getE01OFMAPV());
				userPO.setHeader20(msgOffChk.getE01OFMBTH());
				
				if (msgOffChk.getE01SELTIP().equals("3")) {
					pageName = "EOF0115_of_chk_basic_giro.jsp";
				} else if (msgOffChk.getE01SELTIP().equals("4")) {
					pageName = "EOF0115_of_chk_basic_cheque_tercero.jsp";
				} else {
					pageName = "EOF0115_of_chk_basic.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("offBasic", msgOffChk);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}
		
}
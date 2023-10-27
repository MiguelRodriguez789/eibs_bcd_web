package datapro.eibs.creditproposal;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Orestes Garcia
 */
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDP072901Message;
import datapro.eibs.beans.EDP073001Message;
import datapro.eibs.beans.EDP073101Message;
import datapro.eibs.beans.EDP073201Message;
import datapro.eibs.beans.EDP073301Message;
import datapro.eibs.beans.EDP073401Message;
import datapro.eibs.beans.EDP073601Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEDP0730 extends JSEIBSServlet {

	// entering options
	protected static final int R_ENTER = 100;
	protected static final int A_ENTER = 200;
	protected static final int R_IDX = 300;
	protected static final int R_DET = 400;
	protected static final int R_IDX_COMP = 600;
	protected static final int A_FINANCIAL = 2;
	protected static final int R_IDX_FINANCIAL = 3;
	protected static final int R_MEMO = 4;
	protected static final int R_UPD_MEMO = 5;
	protected static final int RUPDVENC = 6;
	protected static final int UpdAcc = 8;
	protected static final int RLISTANALYSIS = 800; //
	protected static final int RACTDANALYSIS = 810; //
	
	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		// Requests
		case R_ENTER :
			procReqEnter(user, req, res, session);
			break;
		case R_IDX_FINANCIAL :
			procReqIdxFinancial(user, req, res, session);
			break;
			// Actions
		case A_ENTER :
			procList(user, req, res, session);
			break;
		case R_DET :
			procActionEnter(user, req, res, session);
			break;
		case A_FINANCIAL :
			procActionFinancial(user, req, res, session);
			break;
		case R_MEMO :
			procActionMemo(user, req, res, session);
			break;
		case R_UPD_MEMO :
			procActionUpdMemo(user, req, res, session);
			break;
		case RUPDVENC :
			procRUPREV(user, req, res, session);
			break;
		case R_IDX :
			procReqInd(user, req, res, session);
			break;
		case R_IDX_COMP :
			procReqIndComp(user, req, res, session);
			break;
		case UpdAcc :
			procUpdAcc(user, req, res, session);
			break;
		case RLISTANALYSIS :
			procRLISTANALYSIS(user, req, res, session);
			break;
		case RACTDANALYSIS :
			procRACTDANALYSIS(user, req, res, session);
			break;
		
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procRACTDANALYSIS(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0729", req);
			EDP072901Message msgL0729 = (EDP072901Message) mp.getMessageRecord("EDP072901");
			msgL0729.setH01USERID(user.getH01USR());
			msgL0729.setH01PROGRM("EDP0729");
			msgL0729.setH01TIMSYS(getTimeStamp());
			msgL0729.setH01SCRCOD("01");
			msgL0729.setH01OPECOD("0005");
			msgL0729.setE01CAFCUN(userPO.getHeader1());
			try {
				msgL0729.setE01CAFFEY(req.getParameter("E01IFMFEY").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgL0729.setE01CAFFEM(req.getParameter("E01IFMFEM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgL0729.setE01CAFFED(req.getParameter("E01IFMFED").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgL0729.setE01CAFM21(req.getParameter("E01CAFM21").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgL0729.setE01CAFM22(req.getParameter("E01CAFM22").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgL0729.setE01CAFM23(req.getParameter("E01CAFM23").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgL0729.setE01CAFM24(req.getParameter("E01CAFM24").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgL0729.setE01CAFM25(req.getParameter("E01CAFM25").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgL0729);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EDP0730_client_financial_analysis.jsp";
			} else {
				return; //????
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procRLISTANALYSIS(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0729", req);
			EDP072901Message msgL0729 = (EDP072901Message) mp.getMessageRecord("EDP072901");
			msgL0729.setH01USERID(user.getH01USR());
			msgL0729.setH01PROGRM("EDP0729");
			msgL0729.setH01TIMSYS(getTimeStamp());
			msgL0729.setH01SCRCOD("01");
			msgL0729.setH01OPECOD("0015");
			msgL0729.setE01CAFCUN(userPO.getHeader1());
			msgL0729.setE01CAFFEY(userPO.getHeader6());
			msgL0729.setE01CAFFEM(userPO.getHeader7());
			msgL0729.setE01CAFFED(userPO.getHeader8());

			mp.sendMessage(msgL0729);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01OPECDE");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "EDP0730_client_financial.jsp";
			} else {
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msgL0729 = (EDP072901Message) iterator.next();
				}
				pageName = "EDP0730_client_financial_analysis.jsp";
			}

			session.setAttribute("msgL0729", msgL0729);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procUpdAcc(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		
		int numrec = 0;
		try {
			numrec = Integer.parseInt(req.getParameter("RECNUM"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0730", req);
			
			for (int i = 0; i < numrec; i++) {
				try {
					String CnOrcd1 = req.getParameter("CNORCD"+i).trim();
					String CnOrcd2 = req.getParameter("E01CNORCD");
					if (CnOrcd1.equals(CnOrcd2)) {
						EDP073001Message mL0730 = (EDP073001Message) mp.getMessageRecord("EDP073001");
						mL0730.setH01USERID(user.getH01USR());
						mL0730.setH01PROGRM("EDP0730");
						mL0730.setH01TIMSYS(getTimeStamp());
						mL0730.setH01OPECOD("0002");
						try {
							mL0730.setE01IFMCUN(req.getParameter("E01IFMCUN").trim());
						} catch (Exception e) {
							// TODO: handle exception
						}
						try {
							mL0730.setE01IFMFEY(req.getParameter("E01IFMFEY").trim());
						} catch (Exception e) {
							// TODO: handle exception
						}
						try {
							mL0730.setE01IFMFED(req.getParameter("E01IFMFED").trim());
						} catch (Exception e) {
							// TODO: handle exception
						}
						try {
							mL0730.setE01IFMFEM(req.getParameter("E01IFMFEM").trim());
						} catch (Exception e) {
							// TODO: handle exception
						}
						try {
							mL0730.setE01IFMCFO(req.getParameter("E01IFMCFO").trim());
						} catch (Exception e) {
							// TODO: handle exception
						}
						try {
							mL0730.setE01CNORCD(req.getParameter("CNORCD" + i).trim());
						} catch (Exception e) {
							// TODO: handle exception
						}
						try {
							mL0730.setE01IFMGLN(req.getParameter("DPLGLN" + i).trim());
						} catch (Exception e) {
							// TODO: handle exception
						}
						try {
							mL0730.setE01IFMAMT(req.getParameter("VLRCTA" + i).trim());
						} catch (Exception e) {
							// TODO: handle exception
						}
						
						mp.sendMessage(mL0730);
						MessageRecord msg = mp.receiveMessageRecord();
						if (mp.hasError(msg)) {
							msgError = (ELEERRMessage) msg;
							break;
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			res.sendRedirect(srctx + 
					"/servlet/datapro.eibs.creditproposal.JSEDP0730?SCREEN=400&E01IFMCUN="
					+ userPO.getHeader1()
					+ "&E01IFMCFO="
					+ userPO.getHeader3()
					+ "&E01IFMFEY="
					+ req.getParameter("E01IFMFEY")
					+ "&E01IFMFEM="
					+ req.getParameter("E01IFMFEM")
					+ "&E01IFMFED="
					+ req.getParameter("E01IFMFED")
					+ "&ROW="
					+ req.getParameter("ROW")
					+ "&E01IFMCFA="
					+ userPO.getHeader8()
					+ "&TITULO="
					+ userPO.getHeader20());

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqIndComp(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		try {
			userPO.setHeader9(req.getParameter("E01DPFFMT").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setHeader10(req.getParameter("E01DPIDSC").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("", req);
			EDP073401Message mL0734 = (EDP073401Message) mp.getMessageRecord("EDP073401");
			mL0734.setH01USERID(user.getH01USR());
			mL0734.setH01PROGRM("EDP073401");
			mL0734.setH01TIMSYS(getTimeStamp());
			mL0734.setH01SCRCOD("01");
			mL0734.setH01OPECOD("0015");
			mL0734.setE01DPIIND(userPO.getHeader9());
			mL0734.setE01DPIDSC(userPO.getHeader10());
			mL0734.setE01IFMCUN(userPO.getHeader1());
			mL0734.setE01IFMCFO(userPO.getHeader3());
			mL0734.setE01IFMFEY(userPO.getHeader6());
			mL0734.setE01IFMFEM(userPO.getHeader7());
			mL0734.setE01IFMCFA(userPO.getHeader8());

			mp.sendMessage(mL0734);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01OPECDE");

			if (mp.hasError(msgError)) {
				pageName = "EDP0730_client_financial_ind_comp.jsp";
			} else {
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					mL0734 = (EDP073401Message) iterator.next();
				}
				pageName = "EDP0730_client_financial_ind_comp.jsp";
			}

			session.setAttribute("EDP073401Help", list);
			session.setAttribute("mL0734", mL0734);
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqInd(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		try {
			userPO.setHeader9(req.getParameter("E01DPFFMT").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setHeader10(req.getParameter("E01DPIDSC").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0733", req);
			EDP073301Message mL0730 = (EDP073301Message) mp.getMessageRecord("EDP073301");
			mL0730.setH01USERID(user.getH01USR());
			mL0730.setH01PROGRM("EDP0733");
			mL0730.setH01TIMSYS(getTimeStamp());
			mL0730.setH01SCRCOD("01");
			mL0730.setH01OPECOD("0015");
			mL0730.setE01DPIIND(userPO.getHeader9());
			mL0730.setE01DPIDSC(userPO.getHeader10());
			mL0730.setE01IFMCUN(userPO.getHeader1());
			mL0730.setE01IFMCFO(userPO.getHeader3());
			mL0730.setE01IFMFEY(userPO.getHeader6());
			mL0730.setE01IFMFEM(userPO.getHeader7());
			try {
				mL0730.setE01IFMFED(req.getParameter("E01IFMFED").trim());
			} catch (Exception e) {
			}
			mL0730.setE01IFMCFA(userPO.getHeader8());

			mp.sendMessage(mL0730);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01OPECDE");

			if (mp.hasError(msgError)) {
				pageName = "EDP0730_client_financial_ind.jsp";
			} else {
				pageName = "EDP0730_client_financial_ind.jsp";
			}

			session.setAttribute("EDP073301Help", list);
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procRUPREV(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0730", req);
			EDP073001Message mL0730 = (EDP073001Message) mp.getMessageRecord("EDP073001");
			mL0730.setH01USERID(user.getH01USR());
			mL0730.setH01PROGRM("EDP0730");
			mL0730.setH01TIMSYS(getTimeStamp());
			mL0730.setH01OPECOD("0006");
			
			setMessageRecord(req, mL0730);

			mp.sendMessage(mL0730);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			mL0730 = (EDP073001Message) mp.receiveMessageRecord("EDP073001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);

				forward("EDP0730_client_financial.jsp?ROW=" + req.getParameter("ROW"), req, res);
			} else {
				res.sendRedirect(srctx + 
						"/servlet/datapro.eibs.creditproposal.JSEDP0730?SCREEN=400&E01IFMCUN="
							+ userPO.getHeader1()
							+ "&E01IFMCFO="
							+ userPO.getHeader3()
							+ "&E01IFMFEY="
							+ req.getParameter("E01IFMFEY")
							+ "&E01IFMFEM="
							+ req.getParameter("E01IFMFEM")
							+ "&E01IFMFED="
							+ req.getParameter("E01IFMFED")
							+ "&ROW="
							+ req.getParameter("ROW")
							+ "&E01IFMCFA="
							+ userPO.getHeader8()
							+ "&TITULO="
							+ userPO.getHeader20());
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionUpdMemo(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0730", req);
			EDP073001Message mL0730 = (EDP073001Message) mp.getMessageRecord("EDP073001");
			mL0730.setH01USERID(user.getH01USR());
			mL0730.setH01PROGRM("EDP0730");
			mL0730.setH01TIMSYS(getTimeStamp());
			mL0730.setH01OPECOD("0005");
			
			setMessageRecord(req, mL0730);

			mp.sendMessage(mL0730);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			mL0730 = (EDP073001Message) mp.receiveMessageRecord("EDP073001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);

				forward("error_viewer.jsp?", req, res);
			} else {
				printClose(res.getWriter());
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionMemo(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0730", req);
			EDP073001Message mL0730 = (EDP073001Message) mp.getMessageRecord("EDP073001");
			mL0730.setH01USERID(user.getH01USR());
			mL0730.setH01PROGRM("EDP0730");
			mL0730.setH01TIMSYS(getTimeStamp());
			mL0730.setH01SCRCOD("01");
			mL0730.setH01OPECOD("0004");
			try {
				mL0730.setE01IFMCUN(req.getParameter("E01IFMCUN").trim());
			} catch (Exception e) {
			}
			try {
				mL0730.setE01IFMFEY(req.getParameter("E01IFMFEY").trim());
			} catch (Exception e) {
			}
			try {
				mL0730.setE01IFMFEM(req.getParameter("E01IFMFEM").trim());
			} catch (Exception e) {
			}
			try {
				mL0730.setE01IFMFED(req.getParameter("E01IFMFED").trim());
			} catch (Exception e) {
			}
			try {
				mL0730.setE01IFMCFO(req.getParameter("E01IFMCFO").trim());
			} catch (Exception e) {
			}
			try {
				mL0730.setE01IFMCFA(req.getParameter("E01IFMCFA").trim());
			} catch (Exception e) {
			}
			try {
				mL0730.setE01CNORCD(req.getParameter("E01CNORCD").trim());
			} catch (Exception e) {
			}
			try {
				mL0730.setE01IFMGLN(req.getParameter("E01IFMGLN").trim());
			} catch (Exception e) {
			}
			try {
				mL0730.setE01IFMDSC(req.getParameter("E01IFMDSC").trim());
			} catch (Exception e) {
			}
			try {
				mL0730.setE01DPLSEC(req.getParameter("MEMO").trim());
			} catch (Exception e) {
			}

			try {
				userPO.setIdentifier(req.getParameter("ROW").trim());
			} catch (Exception e) {
				userPO.setIdentifier("0");
			}

			mp.sendMessage(mL0730);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				try {
					userPO.setHeader20(req.getParameter("TITULO").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				pageName = "EDP0730_client_financial_enter.jsp";
			} else {
				if (!list.isEmpty()) {
					mL0730 = (EDP073001Message) list.get(0);
					// LEE DATOS DE LA CABECERA DE LA PANTALLA
					userPO.setHeader1(mL0730.getE01IFMCUN());
					//Custummer
					userPO.setHeader2(mL0730.getE01IFMNA1());
					//Custumer Name
					userPO.setHeader3(mL0730.getE01IFMCFO());
					//Format
					userPO.setHeader18(mL0730.getE01IFMCIN());
					//Industry Code
					userPO.setHeader5(mL0730.getE01IFMLNE());
					//Bussines Code
					userPO.setHeader6(mL0730.getE01IFMFEY());
					//Year
					userPO.setHeader7(mL0730.getE01IFMFEM());
					//Month
					userPO.setHeader8(mL0730.getE01IFMCFA());
					//Audit Firm
					userPO.setHeader9(mL0730.getE01CNORCD());
					//Account Group
					
					session.setAttribute("mL0730", mL0730);
				}
				pageName = "EDP0730_client_financial_memo.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionFinancial(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0730", req);
			EDP073001Message mL0730 = (EDP073001Message) mp.getMessageRecord("EDP073001");
			mL0730.setH01USERID(user.getH01USR());
			mL0730.setH01PROGRM("EDP0730");
			mL0730.setH01TIMSYS(getTimeStamp());
			mL0730.setH01OPECOD("0002");
			
			setMessageRecord(req, mL0730);

			mp.sendMessage(mL0730);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			mL0730 = (EDP073001Message) mp.receiveMessageRecord("EDP073001");

			if (mp.hasError(msgError)) {
				pageName = "EDP0730_client_financial.jsp?ROW=" + req.getParameter("ROW");
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);

				forward(pageName, req, res);
			} else {
				res.sendRedirect(srctx + 
						"/servlet/datapro.eibs.creditproposal.JSEDP0730?SCREEN=400&E01IFMCUN="
							+ userPO.getHeader1()
							+ "&E01IFMCFO="
							+ userPO.getHeader3()
							+ "&E01IFMFEY="
							+ req.getParameter("E01IFMFEY")
							+ "&E01IFMFEM="
							+ req.getParameter("E01IFMFEM")
							+ "&E01IFMFED="
							+ req.getParameter("E01IFMFED")
							+ "&ROW="
							+ req.getParameter("ROW")
							+ "&E01IFMCFA="
							+ userPO.getHeader8()
							+ "&TITULO="
							+ userPO.getHeader20());			
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		try {
			userPO.setHeader6(req.getParameter("E01IFMFEY").trim());
		} catch (Exception e) {
			userPO.setHeader6("");
		}
		try {
			userPO.setHeader7(req.getParameter("E01IFMFEM").trim());
		} catch (Exception e) {
			userPO.setHeader7("");
		}
		try {
			userPO.setHeader3(req.getParameter("E01IFMCFO").trim());
		} catch (Exception e) {
			userPO.setHeader3("");
		}
		try {
			userPO.setHeader20(req.getParameter("TITULO").trim());
		} catch (Exception e) {
			userPO.setHeader20("");
		}
		try {
			userPO.setHeader11(req.getParameter("RETORNO").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			// inicio traer lista de formatos
			mp = getMessageProcessor("EDP0731", req);
			EDP073101Message mL0731 = (EDP073101Message) mp.getMessageRecord("EDP073101");
			mL0731.setH01USERID(user.getH01USR());
			mL0731.setH01PROGRM("EDP0731");
			mL0731.setH01TIMSYS(getTimeStamp());
			mL0731.setH01OPECOD("0015");

			mp.sendMessage(mL0731);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EDP0730_client_financial.jsp";
			} else {
				JBList beanList1 = new JBList();
				JBList beanListJ = new JBList();
				JBList beanListN = new JBList();
				
				String myOptionL =
						"<option value=\""
							+ "\">"
							+ " Seleccione Formato: "
							+ "</option>";
				beanList1.addRow("", myOptionL);
				beanListJ.addRow("", myOptionL);
				beanListN.addRow("", myOptionL);
				
				String select = "";
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					mL0731 = (EDP073101Message) iterator.next();
					if (mL0731.getE01DPFFMT().trim().equals(userPO.getHeader3().trim())) {
						select = "selected";
					} else {
					 	select = "";
					}
					myOptionL =
						   "<option value=\""
							   + mL0731.getE01DPFFMT()
							   + "\" "
							   + select
							   + " >"
							   + mL0731.getE01DPFFMT()
							   + " - "
							   + mL0731.getE01DPFDSC()
							   + "</option>";
						   beanList1.addRow("", myOptionL);
					   if (mL0731.getH01FLGWK1().equals("2")) {
						   beanListJ.addRow("", myOptionL);
					   } else {
						   beanListN.addRow("", myOptionL);
					   }
				}
				// fin traer lista de formatos

				if ("1".equals(req.getParameter("opt"))) {
					userPO.setOption("1"); // Purpose. NEW
				} else if ("4".equals(req.getParameter("opt"))) {
					userPO.setOption("4"); // Purpose. INQUIRY
				}
				
				EDP073001Message mL0730 = (EDP073001Message) mp.getMessageRecord("EDP073001");
				mL0730.setH01USERID(user.getH01USR());
				mL0730.setH01PROGRM("EDP0730");
				mL0730.setH01TIMSYS(getTimeStamp());
				mL0730.setH01SCRCOD(userPO.getOption());
				mL0730.setH01OPECOD("0015");
				try {
					userPO.setHeader1(req.getParameter("E01IFMCUN").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					mL0730.setE01IFMCUN(req.getParameter("E01IFMCUN").trim());
				} catch (Exception e) {
				}
				try {
					mL0730.setE01IFMFEY(req.getParameter("E01IFMFEY").trim());
				} catch (Exception e) {
					mL0730.setE01IFMFEY("0");
				}
				try {
					mL0730.setE01IFMFEM(req.getParameter("E01IFMFEM").trim());
				} catch (Exception e) {
					mL0730.setE01IFMFEM("0");
				}
				try {
					mL0730.setE01IFMFED(req.getParameter("E01IFMFED").trim());
				} catch (Exception e) {
					mL0730.setE01IFMFED("0");
				}
				try {
					mL0730.setE01IFMCFO(req.getParameter("E01IFMCFO").trim());
				} catch (Exception e) {
					mL0730.setE01IFMCFO("");
				}
				try {
					mL0730.setE01IFMCFA(req.getParameter("E01IFMCFA").trim());
				} catch (Exception e) {
					mL0730.setE01IFMCFA("");
				}
				try {
					String action = req.getParameter("action").trim();
					mL0730.setH01FLGWK3("1".equals(action) ? "5" : action);
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				
				mp.sendMessage(mL0730);
				ELEERRMessage msgError = (ELEERRMessage) mp
						.receiveMessageRecord("ELEERR");
				list = mp.receiveMessageRecordList("H01FLGMAS");
				
				if (mp.hasError(msgError)) {
					session.setAttribute("error", msgError);
					pageName = "EDP0730_client_list.jsp";
				} else {
			        String myFlag = "";
					
			        int idxOpt = -1;
					int idxGrp = -1;
					int idxAcc = -1;
					int colNum = 4;
					int colNumAcc = 12;
					int colNumMem = 4;
					
					JBListRec optList = new JBListRec();
					optList.init(colNum);
					JBListRec grpList = new JBListRec();
					grpList.init(colNum);
					JBListRec grpAccList = new JBListRec();
					grpAccList.init(colNumAcc);
					JBListRec grpMemList = new JBListRec();
					grpMemList.init(colNumMem);
					
					String myGrp[] = new String[colNum];
					String myGrpAcc[] = new String[colNumAcc];
					String myGrpMem[] = new String[colNumMem];
					String myOption[] = new String[colNum];
					boolean firstTime = true;
					for (int i = 0; i < colNum; i++) {
						myGrp[i] = "";
						myOption[i] = "";
					}
					for (int i = 0; i < colNumAcc; i++) {
						myGrpAcc[i] = "";
					}
					iterator = list.iterator();
					while (iterator.hasNext()) {
						mL0730 = (EDP073001Message) iterator.next();
						// LEE DATOS DE LA CABECERA DE LA PANTALLA
						if (mL0730.getE01IFMTYP().equals("")) {
							idxOpt++;
							myOption[0] = mL0730.getE01IFMDSC();
							//"<option value=\"" + idxOpt + "\">" + mL0730.getE01IFMDSC() + "</option>";
							idxGrp = -1;
							optList.addRow("", myOption);
							if (firstTime) {
								firstTime = false;
								if (!mL0730.getE01IFMCUN().equals("0")) {
									userPO.setHeader1(mL0730.getE01IFMCUN());
								}
								//Custummer
								userPO.setHeader2(mL0730.getE01IFMNA1());
								//Custumer Name
								userPO.setHeader3(mL0730.getE01IFMCFO());
								//Format
								userPO.setHeader18(mL0730.getE01IFMCIN());
								//Industry Code
								userPO.setHeader5(mL0730.getE01IFMLNE());
								//Bussines Code
								userPO.setHeader6(mL0730.getE01IFMFEY());
								//Year
								userPO.setHeader7(mL0730.getE01IFMFEM());
								//Month
								userPO.setHeader8(mL0730.getE01IFMCFA());
								//Audit Firm
								userPO.setHeader9(mL0730.getE01CNORCD());
								// inf revision
								userPO.setHeader13(mL0730.getE01DPBREV());
								userPO.setHeader14(mL0730.getE01DPBVEN());
								userPO.setHeader15(mL0730.getE01DPBFVD());
								userPO.setHeader16(mL0730.getE01DPBFVM());
								userPO.setHeader17(mL0730.getE01DPBFVA());
							} 
						} else if (mL0730.getE01IFMTYP().equals("H")) { //Header
							myFlag = "" + idxOpt;
							idxGrp++;
							myGrp[0] = mL0730.getE01IFMDSC();
							myGrp[1] = mL0730.getE01IFMAMT();
							grpList.addRow(myFlag, myGrp);
						} else if (mL0730.getE01IFMTYP().equals("D")) { // detail mL0730.getE01IFMTYP().equals("D")
							myFlag = "" + idxOpt + "" + idxGrp;
							idxAcc++;
							myGrpAcc[0] = mL0730.getE01IFMGLN();
							myGrpAcc[1] = mL0730.getE01IFMDSC();
							myGrpAcc[2] = mL0730.getE01IFMAMT();
							myGrpAcc[3] = mL0730.getE01IFMNA1();
							myGrpAcc[4] = mL0730.getE01IFMCFA();
							myGrpAcc[5] = mL0730.getE01CNORCD();
							myGrpAcc[6] = mL0730.getE01DPXSEC();
							myGrpAcc[7] = mL0730.getE01DPXLID();
							myGrpAcc[8] = mL0730.getE01IFMAM1();
							myGrpAcc[9] = mL0730.getE01IFMAM2();
							myGrpAcc[10] = mL0730.getE01DPLSEC();
							myGrpAcc[11] = mL0730.getE01IFMOPR();
							grpAccList.addRow(myFlag, myGrpAcc);
						} else if (mL0730.getE01IFMTYP().equals("M")) { // detail mL0730.getE01IFMTYP().equals("D")
							myFlag = "" + idxGrp + "" + idxAcc;
							myGrpMem[0] = mL0730.getE01DPMS01();
							myGrpMem[1] = mL0730.getE01DPMM01();
							myGrpMem[2] = mL0730.getE01DPMP01();
							myGrpMem[3] = mL0730.getE01IFMGLN();
							grpMemList.addRow(myFlag, myGrpMem);
						}
					}
					try {
						mL0730.setE01DPBFED(req.getParameter("E01IFMFED").trim());
					} catch (Exception e) {
						// TODO: handle exception
					}
					try {
						mL0730.setE01IFMFED(req.getParameter("E01IFMFED").trim());
					} catch (Exception e) {
						// TODO: handle exception
					}
					try {
						mL0730.setH01OPECOD(req.getParameter("ROW").trim());
					} catch (Exception e) {
					}
					session.setAttribute("optList", optList);
					// el mismo arreglo lo copio para el siguiente formato
					session.setAttribute("grpList", grpList);
					session.setAttribute("accList", grpAccList);
					session.setAttribute("memList", grpMemList);
					session.setAttribute("mL0730", mL0730);
				}
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("optListJ", beanListJ);
				session.setAttribute("optListN", beanListN);
				session.setAttribute("optListF", beanList1);
				
				pageName = "EDP0730_client_financial.jsp";
				
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		try {
			userPO.setHeader1(req.getParameter("E01IFMCUN").trim());
		} catch (Exception e) {
			userPO.setHeader1("");
		}
		try {
			userPO.setHeader2(req.getParameter("E01IFMNA1").trim());
		} catch (Exception e) {
			userPO.setHeader2("");
		}
		try {
			userPO.setHeader3(req.getParameter("E01IFMCFO").trim());
		} catch (Exception e) {
			userPO.setHeader3("");
		}
		try {
			userPO.setHeader6(req.getParameter("E01IFMFEY").trim());
		} catch (Exception e) {
			userPO.setHeader6("");
		}
		try {
			userPO.setHeader7(req.getParameter("E01IFMFEM").trim());
		} catch (Exception e) {
			userPO.setHeader7("");
		}
		try {
			userPO.setHeader8(req.getParameter("E01IFMFED").trim());
		} catch (Exception e) {
			userPO.setHeader8("");
		}
		try {
			userPO.setHeader20(req.getParameter("TITULO").trim());
		} catch (Exception e) {
			userPO.setHeader20("");
		}
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0731", req);
			EDP073101Message mL0731 = (EDP073101Message) mp.getMessageRecord("EDP073101");
			mL0731.setH01USERID(user.getH01USR());
			mL0731.setH01PROGRM("EDP0731");
			mL0731.setH01TIMSYS(getTimeStamp());
			mL0731.setH01OPECOD("0015");

			mp.sendMessage(mL0731);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EDP0730_client_list.jsp";
			} else {
				JBList beanList1 = new JBList();
				JBList beanListJ = new JBList();
				JBList beanListN = new JBList();
				
				String myOption =
						"<option value=\""
							+ "\">"
							+ " Seleccione Formato "
							+ "</option>";
				beanList1.addRow("", myOption);
				beanListJ.addRow("", myOption);
				beanListN.addRow("", myOption);
				
				
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					mL0731 = (EDP073101Message) iterator.next();
					myOption =
							"<option value=\""
								+ mL0731.getE01DPFFMT()
								+ "\">"
								+ mL0731.getE01DPFFMT()
								+ " - "
								+ mL0731.getE01DPFDSC()
								+ "</option>";
							beanList1.addRow("", myOption);
						if (mL0731.getH01FLGWK1().equals("2")) {
							beanListJ.addRow("", myOption);
						} else {
							beanListN.addRow("", myOption);
						}
				}
				session.setAttribute("optList",  beanList1);
				session.setAttribute("optListF",  beanList1);
				session.setAttribute("optListJ", beanListJ);
				session.setAttribute("optListN", beanListN);
				
				EDP073001Message l07301 = (EDP073001Message) mp.getMessageRecord("EDP073001");
				l07301.setH01USERID(user.getH01USR());
				l07301.setH01PROGRM("EDP073001");
				l07301.setH01TIMSYS(getTimeStamp());
				l07301.setH01SCRCOD("01");
				l07301.setH01OPECOD("0010");
				try {
					l07301.setE01IFMCUN(req.getParameter("E01IFMCUN").trim());
				} catch (Exception e) {
				}
				try {
					l07301.setE01IFMFEY(req.getParameter("E01IFMFEY").trim());
				} catch (Exception e) {
				}
				try {
					l07301.setE01IFMFEM(req.getParameter("E01IFMFEM").trim());
				} catch (Exception e) {
				}
				try {
					l07301.setE01IFMFED(req.getParameter("E01IFMFED").trim());
				} catch (Exception e) {
				}
				try {
					l07301.setE01IFMCFO(req.getParameter("E01IFMCFO").trim());
				} catch (Exception e) {
				}
				try {
					l07301.setE01RECPOS(req.getParameter("Pos").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					l07301.setH01FLGWK3(req.getParameter("opt").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				if ("1".equals(req.getParameter("OPT"))) {
					userPO.setOption(" ");
				} else {
					userPO.setOption("5");
				}
				
				mp.sendMessage(l07301);
				ELEERRMessage msgError = (ELEERRMessage) mp
						.receiveMessageRecord("ELEERR");
				list = mp.receiveMessageRecordList("H01FLGMAS");
				
				if (mp.hasError(msgError)) {
					session.setAttribute("error", msgError);
					pageName = "EDP0730_client_list.jsp";
				} else {
					session.setAttribute("EDP073001Help", list);
					pageName = "EDP0730_client_list.jsp";
				}
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqIdxFinancial(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0732", req);
			EDP073201Message msgSearch = (EDP073201Message) mp.getMessageRecord("EDP073201");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EDP0732");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0010");
			msgSearch.setE01IFDCUN(userPO.getHeader1());
			msgSearch.setE01IFDCFO(userPO.getHeader3());
			msgSearch.setE01IFDFEY(userPO.getHeader6());
			msgSearch.setE01IFDFEM(userPO.getHeader7());
			msgSearch.setE01IFMCFA(userPO.getHeader8());

			mp.sendMessage(msgSearch);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgSearch = (EDP073201Message) mp.receiveMessageRecord("EDP073201");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "EDP0730_client_financial_idx.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("idxFnl", msgSearch);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		userPO.setCusNum(" ");
		userPO.setHeader3(" ");
		try {
			userPO.setHeader11(req.getParameter("RETORNO").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		if ("1".equals(req.getParameter("OPT"))) {
			userPO.setOption(" ");
		} else {
			userPO.setOption("5");
		}
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0731", req);
			EDP073101Message mL0730 = (EDP073101Message) mp.getMessageRecord("EDP073101");
			mL0730.setH01USERID(user.getH01USR());
			mL0730.setH01PROGRM("EDP0731");
			mL0730.setH01TIMSYS(getTimeStamp());
			mL0730.setH01OPECOD("0015");

			mp.sendMessage(mL0730);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				JBList beanListJ = new JBList();
				JBList beanListN = new JBList();
				
				String myOption =
						"<option value=\""
							+ "\">"
							+ " Seleccione Formato: "
							+ "</option>";
				
				beanList.addRow("", myOption);
				beanListJ.addRow("", myOption);
				beanListN.addRow("", myOption);
				
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					mL0730 = (EDP073101Message) iterator.next();
					myOption =
							"<option value=\""
								+ mL0730.getE01DPFFMT()
								+ "\">"
								+ mL0730.getE01DPFFMT()
								+ " - "
								+ mL0730.getE01DPFDSC()
								+ "</option>";
					beanList.addRow("", myOption);
					if (mL0730.getH01FLGWK1().equals("2")) {
						beanListJ.addRow("", myOption);
					} else {
						beanListN.addRow("", myOption);
					}
				}
				session.setAttribute("ses0730", new EDP073001Message());
				session.setAttribute("optList",  beanList);
				session.setAttribute("optListF", beanList);
				session.setAttribute("optListJ", beanListJ);
				session.setAttribute("optListN", beanListN);
				
				// Send Initial data for CNOFC tables. Audit Firm P4
				EDP073601Message msgCnofc = (EDP073601Message) mp.getMessageRecord("EDP073601");
				msgCnofc.setH01USERID(user.getH01USR());
				msgCnofc.setH01PROGRM("EDP0736");
				msgCnofc.setH01TIMSYS(getTimeStamp());
				msgCnofc.setH01OPECOD("0015");
				msgCnofc.setE01CNOCFL("P4");
				
				mp.sendMessage(msgCnofc);
				list = mp.receiveMessageRecordList("H01FLGMAS");

				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
					pageName = "error_viewer.jsp";
				} else {
					JBList beanLP4 = new JBList();
					String myOptionP4 = "";
					iterator = list.iterator();
					while (iterator.hasNext()) {
						msgCnofc = (EDP073601Message) iterator.next();
						myOptionP4 =
								"<option value=\""
									+ msgCnofc.getE01CNORCD()
									+ "\">"
									+ msgCnofc.getE01CNORCD()
									+ " - "
									+ msgCnofc.getE01CNODSC()
									+ "</option>";
							beanLP4.addRow("", myOptionP4);
					}
					session.setAttribute("cnofcP4", beanLP4);
				}
				
				pageName = "EDP0730_client_financial_enter.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
}
package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM) x
 * @author: Enrique M. Almonte
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.BeanDynaTable;
import datapro.eibs.beans.DataTransaction;
import datapro.eibs.beans.EDL015009Message;
import datapro.eibs.beans.EDL015206Message;
import datapro.eibs.beans.EDL015210Message;
import datapro.eibs.beans.EDL016001Message;
import datapro.eibs.beans.EDL016002Message;
import datapro.eibs.beans.EDL080001Message;
import datapro.eibs.beans.EDL080002Message;
import datapro.eibs.beans.EDL080003Message;
import datapro.eibs.beans.EDL080030Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESD000006Message;
import datapro.eibs.beans.ESD000015Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.sockets.DecimalField;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0800 extends datapro.eibs.master.SuperServlet {
	
	// certificate of deposit 
	protected static final int R_NEW = 1;
	protected static final int A_NEW = 2;
	protected static final int R_MAINTENANCE = 3;
	protected static final int R_TRANSACTION = 5;
	protected static final int A_TRANSACTION = 6;
	protected static final int R_TITULARES = 7;
	protected static final int A_TITULARES = 8;
	protected static final int R_PRECANCEL = 9;
	protected static final int A_PRECANCEL = 10;
	protected static final int R_SPECIAL_INST = 11;
	protected static final int A_SPECIAL_INST = 12;
	protected static final int R_EXCHANGE = 13;
	protected static final int A_EXCHANGE = 14;
	protected static final int R_CODES = 15;
	protected static final int A_CODES = 16;
	protected static final int R_FINISH = 17;
	protected static final int A_FINISH = 18;
	protected static final int R_INT_PREP = 19;
	protected static final int A_INT_PREP = 20;
	protected static final int R_CANCEL_DET = 21;
	protected static final int A_CANCEL_DET = 22;
	protected static final int R_PRINT_NEW = 21;
	protected static final int A_PRINT_NEW = 22;
	protected static final int R_GEN_INF = 23;
	protected static final int A_GEN_INF = 24;
	protected static final int R_NEW_TRAN = 25;
	protected static final int A_NEW_TRAN = 26;
	protected static final int R_OTHERS_TRANS = 27;
	protected static final int R_INQ = 28;
	protected static final int R_INQ_TITULARES = 29;
	protected static final int R_INQ_SPECIAL_INST = 30;
	protected static final int R_INQ_CODES = 31;
	protected static final int R_INQ_OTHERS_TRANS = 32;
	protected static final int R_AP_TITULARES = 33;
	protected static final int R_AP_SPECIAL_INST = 34;
	protected static final int R_AP_CODES = 35;
	protected static final int R_AP_OTHERS_TRANS = 36;
	protected static final int R_INQ_NEW_TRAN = 37;
	protected static final int R_AP_NEW_TRAN = 38;
	protected static final int R_INQ_BALANCES = 39;
	
	protected static final int R_CANCEL_DEBIT = 41;
	protected static final int A_CANCEL_DEBIT = 42;

	protected static final int A_MAINT_TO_BEAN = 500;
	protected static final int A_MAINT_TO_SCK = 502;
	protected static final int A_MAINT_DED = 504;
	protected static final int A_MAINT_COLL = 506;
	protected static final int A_MAINT_PMNT = 508;

	// entering options
	protected static final int R_ENTER_NEW = 100;
	protected static final int A_ENTER_NEW = 200;
	protected static final int R_ENTER_MAINT = 300;
	protected static final int A_ENTER_MAINT = 400;
	protected static final int R_ENTER_ACC_MAINT = 500;
	protected static final int A_ENTER_ACC_MAINT = 600;
	protected static final int R_ENTER_DOCUMENT = 700;
	protected static final int A_ENTER_DOCUMENT = 800;
	protected static final int R_ENTER_PRINT = 900;
	protected static final int A_ENTER_GEN_DOCS = 1000;
	protected static final int R_INQ_APPROVAL = 1200;
	protected static final int R_INQUIRY = 1400;
	protected static final int A_INQUIRY = 1600;
	protected static final int R_ENTER_DOC_DET = 1700;
	
	protected static final int R_DOC_BASIC = 1800;
	protected static final int A_DOC_BASIC = 1801;
	protected static final int R_DOC_LIST = 1810;
	protected static final int A_DOC_LIST = 1811;
	

	private ServletConfig config = null;
	
	protected static final int cellDate = 6;
	
	private String LangPath = "S";

	/**
	 * JSEDL0800 constructor comment.
	 */
	public JSEDL0800() {
		super();
	}
	
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSEDL0800");

	}
	/**
	 * This method was created by David Mavilla.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionEnterMaint(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL080001Message dftBasic = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		JBListRec lstAcceptors = new JBListRec();
		ses.setAttribute("lstAcceptors", lstAcceptors);

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			dftBasic = (EDL080001Message) mc.getMessageRecord("EDL080001");
			dftBasic.setH01USERID(user.getH01USR());
			dftBasic.setH01PROGRM("EDL0800");
			dftBasic.setH01TIMSYS(getTimeStamp());
			dftBasic.setH01SCRCOD("01");
			dftBasic.setH01OPECOD("0002");
			dftBasic.setE01DEAACD("10");
			try {
				dftBasic.setE01DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
				dftBasic.setE01DEAACC(userPO.getAccNum());
			}
			try {
				dftBasic.setH01FLGWK2(req.getParameter("H01FLGWK2"));
			} catch (Exception e) {
			}
			mc.sendMessage(dftBasic);

			flexLog("EDL080001 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
		
		try {
			if (procRecMaintData(mc,
				user,
				req,
				res,
				ses)) { // There are no errors
				try {
					flexLog(
						"About to redirect : "
							+ LangPath
							+ "EDL0800_dft_basic.jsp");
					//callPage(LangPath + "EDL0800_dft_basic.jsp", req, res);
					res.sendRedirect(
						super.srctx
							+ "/servlet/datapro.eibs.products.JSEDL0800?SCREEN=1700&REQFLG=1&E01DEAACC="
							+ req.getParameter("E01DEAACC"));
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else { // There are errors
				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "EDL0800_ln_enter_maint.jsp");
					callPage(
						LangPath + "EDL0800_dft_enter_maint.jsp",
						req,
						res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionEnterNew(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL080001Message dftBasic = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		JBListRec lstAcceptors = new JBListRec();
		ses.setAttribute("lstAcceptors", lstAcceptors);

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			dftBasic = (EDL080001Message) mc.getMessageRecord("EDL080001");
			dftBasic.setH01USERID(user.getH01USR());
			dftBasic.setH01PROGRM("EDL0800");
			dftBasic.setH01TIMSYS(getTimeStamp());
			dftBasic.setH01SCRCOD("01");
			dftBasic.setH01OPECOD("0001");
			dftBasic.setE01DEAACD("10");
			try {
				dftBasic.setE01DEAPRO(req.getParameter("E01DEAPRO"));
			} catch (Exception e) {
				dftBasic.setE01DEAPRO("0");
			}

			try {
				dftBasic.setE01DEARET(req.getParameter("E01DEARET"));
			} catch (Exception e) {
				dftBasic.setE01DEARET(" ");
			}

			try {
				dftBasic.setE01DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
			}

			try {
				dftBasic.setE01PAGACC(req.getParameter("E01OFFAC1"));
			} catch (Exception e) {
			}

			try {
				dftBasic.setE01DEAOAM(req.getParameter("E01ACMAMT"));
			} catch (Exception e) {
			}

			dftBasic.send();
			dftBasic.destroy();
			flexLog("EDL080001 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		try {
			if (procRecMaintData(mc,
				user,
				req,
				res,
				ses)) { // There are no errors
				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "EDL0800_dft_basic.jsp");
					callPage(LangPath + "EDL0800_dft_basic.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else { // There are errors
				try {
					flexLog("About to call Page: /servlet/datapro.eibs.products.JSESD0711?TYPE=10");
					//res.sendRedirect(super.srctx + "/servlet/datapro.eibs.products.JSESD0711?TYPE=10");
					String firstLink =
						super.webAppPath
							+ LangPath
							+ "ESD0711_products_detail.jsp?appcode="
							+ req.getParameter("appcode").trim()
							+ "&typecode="
							+ req.getParameter("typecode").trim()
							+ "&generic="
							+ req.getParameter("generic").trim()
							+ "&title="
							+ req.getParameter("title").trim()
							+ "&bank="
							+ req.getParameter("bank").trim();
					res.setContentType("text/html");
					PrintWriter out = res.getWriter();
					out.println("<!-- frames -->");
					out.println("<frameset  cols=\"28%,*\">");
					out.println(
						"<frame name=\"list\" src=\""
							+ super.webAppPath
							+ LangPath
							+ "ESD0711_products_tree_view.jsp\" marginwidth=\"10\" marginheight=\"10\" scrolling=\"no\" frameborder=\"NO\">");
					out.println(
						"<frame name=\"detail\" src=\""
							+ firstLink
							+ "\" marginwidth=\"10\" marginheight=\"10\" scrolling=\"auto\" frameborder=\"NO\">");
					out.println("</frameset>");
					out.close();
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionEspInst(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ESD000005Message dftBasic = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			dftBasic = (ESD000005Message) ses.getAttribute("lnInst");
			//msgLN = (ESD000005Message)mc.getMessageRecord("ESD000005");
			dftBasic.setH05USR(user.getH01USR());
			dftBasic.setH05PGM("EDL0150");
			dftBasic.setH05TIM(""); //getTimeStamp()
			dftBasic.setH05SCR("01");
			dftBasic.setH05OPE("0005");
			dftBasic.setE05ACC(userPO.getIdentifier());
			dftBasic.setE05ACD("10");
			dftBasic.setH05WK1("M");
			// all the fields here
			java.util.Enumeration enu = dftBasic.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}

			//msgLN.send();
			mc.sendMessage(dftBasic);
			dftBasic.destroy();

			flexLog("ESD000005 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ESD000005")) {
				try {
					dftBasic = new datapro.eibs.beans.ESD000005Message();
					flexLog("ESD000005 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				dftBasic = (ESD000005Message) newmessage;
				// showESD008004(msgLN);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("lnInst", dftBasic);

				if (IsNotError) { // There are no errors
					if (userPO.getPurpose().equals("NEW")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_new_transac.jsp");
							callPage(
								LangPath + "EDL0800_dft_new_transac.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_basic.jsp");
							callPage(
								LangPath + "EDL0800_dft_basic.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}
				} else { // There are errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0800_dft_special_inst.jsp");
						callPage(
							LangPath + "EDL0800_dft_special_inst.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionExchangeRate(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL015206Message msgLN = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgLN = (EDL015206Message) ses.getAttribute("lnRate");
			//msgLN = (EDL015206Message)mc.getMessageRecord("EDL015206");
			msgLN.setH06USERID(user.getH01USR());
			msgLN.setH06PROGRM("EDL0150");
			msgLN.setH06TIMSYS(getTimeStamp());
			msgLN.setH06SCRCOD("01");
			msgLN.setH06OPECOD("0005");

			// all the fields here
			java.util.Enumeration enu = msgLN.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}

			//msgLN.send();
			mc.sendMessage(msgLN);
			msgLN.destroy();

			flexLog("EDL015206 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDL015206")) {
				try {
					msgLN = new datapro.eibs.beans.EDL015206Message();
					flexLog("EDL015206 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgLN = (EDL015206Message) newmessage;
				// showESD008004(msgLN);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("lnRate", msgLN);

				if (IsNotError) { // There are no errors
					if (userPO.getPurpose().equals("NEW")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0150_ln_new_transac.jsp");
							callPage(
								LangPath + "EDL0150_ln_new_transac.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0150_ln_basic.jsp");
							callPage(
								LangPath + "EDL0150_ln_basic.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}
				} else { // There are errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0150_ln_xchg_rate.jsp");
						callPage(
							LangPath + "EDL0150_ln_xchg_rate.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	
	
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionMaintBeansToSck(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		MessageRecord newmessage = null;
		EDL080001Message dftBasic = null;
		EDL080003Message dftAcceptor = null;
		EDL080002Message dftDocument = null;
		EDL080030Message dftTrans = null;

		JBListRec lstAcceptors = null;
		JBListRec lstDocs = null;
		JBListRec lstTrans = null;

		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		//grp = 0 - basic data of draft
		//    = 1 - basic data of draft acceptor
		//    = 2 - document data 1 x 1
		//    = 3 - transac data
		//    = 4 - documents generation

		String grp = "";
		String genDoc = "";
		String act = "";
		try {
			grp = req.getParameter("GRP");
			if (grp == null)
				grp = "";
		} catch (Exception e) {
			grp = "0";
		}
		try {
			genDoc = req.getParameter("GENDOC");
			if (genDoc == null)
				genDoc = "";
		} catch (Exception e) {
			genDoc = "0";

		}
		try {
			act = req.getParameter("ACTION");
			if (act == null)
				act = "";
		} catch (Exception e) {
			act = "0";
		}

		if (grp.equals("0")) {
			try {
				dftBasic = (EDL080001Message) ses.getAttribute("dftBasic");
				dftBasic.setH01USERID(user.getH01USR());
				dftBasic.setH01PROGRM("EDL0800");
				dftBasic.setH01TIMSYS(getTimeStamp());
				dftBasic.setH01SCRCOD("01");
				dftBasic.setH01OPECOD("0005");

				// all the fields here
				java.util.Enumeration enu = dftBasic.fieldEnumeration();
				MessageField field = null;
				String value = null;
				while (enu.hasMoreElements()) {
					field = (MessageField) enu.nextElement();
					try {
						value = req.getParameter(field.getTag()).toUpperCase();
						if (value != null) {
							field.setString(value);
						}
					} catch (Exception e) {
					}
				}
				mc.sendMessage(dftBasic);
				dftBasic.destroy();
				flexLog("EDL080001 Message Sent to Sockets");

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
		}
		//Sending EDL080003
		if (grp.equals("1")) {
			try {
				dftAcceptor =
					(EDL080003Message) ses.getAttribute("dftAcceptor");
				dftAcceptor.setH03USERID(user.getH01USR());
				dftAcceptor.setH03PROGRM("EDL0800");
				dftAcceptor.setH03TIMSYS(getTimeStamp());
				dftAcceptor.setH03SCRCOD("01");
				dftAcceptor.setH03OPECOD("0005");

				// all the fields here
				java.util.Enumeration enu = dftAcceptor.fieldEnumeration();
				MessageField field = null;
				String value = null;
				while (enu.hasMoreElements()) {
					field = (MessageField) enu.nextElement();
					try {
						value = req.getParameter(field.getTag()).toUpperCase();
						if (value != null) {
							field.setString(value);
						}
					} catch (Exception e) {
					}
				}
				if (userPO.getAccOpt().equals("A") ) {
					dftAcceptor.setH03FLGWK1("A");
				}
				if (userPO.getAccOpt().equals("G") ) {
					dftAcceptor.setH03FLGWK1("G");
				}
				mc.sendMessage(dftAcceptor);
				dftAcceptor.destroy();
				flexLog("EDL080003 Message Sent to Sockets");

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
		}

		//Sending EDL080002
		if (grp.equals("2")) {
			try {
				dftDocument =
					(EDL080002Message) ses.getAttribute("dftDocument");
				dftDocument.setH02USERID(user.getH01USR());
				dftDocument.setH02PROGRM("EDL0800");
				dftDocument.setH02TIMSYS(getTimeStamp());
				dftDocument.setH02SCRCOD("01");
				dftDocument.setH02OPECOD("0005");

				// all the fields here
				java.util.Enumeration enu = dftDocument.fieldEnumeration();
				MessageField field = null;
				String value = null;
				while (enu.hasMoreElements()) {
					field = (MessageField) enu.nextElement();
					try {
						value = req.getParameter(field.getTag()).toUpperCase();
						if (value != null) {
							field.setString(value);
						}
					} catch (Exception e) {
					}
				}
				mc.sendMessage(dftDocument);
				dftDocument.destroy();
				flexLog("EDL080002 Message Sent to Sockets");

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
		}
		// sending EDL080030
		if (grp.equals("3")) {
			try {
				dftTrans = (EDL080030Message) ses.getAttribute("dftTrans");
				dftTrans.setH30USERID(user.getH01USR());
				dftTrans.setH30PROGRM("EDL0800");
				dftTrans.setH30TIMSYS(getTimeStamp());
				dftTrans.setH30SCRCOD("01");
				dftTrans.setH30OPECOD("0005");

				// all the fields here
				java.util.Enumeration enu = dftTrans.fieldEnumeration();
				MessageField field = null;
				String value = null;
				while (enu.hasMoreElements()) {
					field = (MessageField) enu.nextElement();
					try {
						value = req.getParameter(field.getTag()).toUpperCase();
						if (value != null) {
							field.setString(value);
						}
					} catch (Exception e) {
					}
				}
				mc.sendMessage(dftTrans);
				dftTrans.destroy();
				flexLog("EDL080002 Message Sent to Sockets");

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
		}

		if (grp.equals("4")) {
			try {
				dftDocument =
					(EDL080002Message) mc.getMessageRecord("EDL080002");
				dftDocument.setH02USERID(user.getH01USR());
				dftDocument.setH02PROGRM("EDL0800");
				dftDocument.setH02TIMSYS(getTimeStamp());
				dftDocument.setH02SCRCOD("01");
				dftDocument.setH02OPECOD("0015");
				dftDocument.setE02DLDNLN(req.getParameter("E01DEAACC"));
				dftDocument.setE02DLDDID(req.getParameter("E03NUMIDE"));

				dftDocument.send();
				dftDocument.destroy();
				flexLog("EDL080002 Message Sent");

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
		}

		try {
			if (procRecMaintData(mc,
				user,
				req,
				res,
				ses)) { // There are no errors
				if (userPO.getPurpose().equals("MAINTENANCE")
					&& !(userPO.getHeader10().equals("CONF"))) {
					try {
						if (grp.equals("1")) {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_acceptor_docs.jsp");
							callPage(
								LangPath + "EDL0800_dft_acceptor_docs.jsp",
								req,
								res);
						} else {
							if (grp.equals("4")) {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_acceptor_docs_detail.jsp");
								callPage(
									LangPath
										+ "EDL0800_dft_acceptor_docs_detail.jsp",
									req,
									res);
							} else {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_enter_maint.jsp");
								res.sendRedirect(
									super.srctx
										+ "/servlet/datapro.eibs.products.JSEDL0800?SCREEN=1700&REQFLG=1&E01DEAACC="
										+ req.getParameter("E01DEAACC"));
								//callPage(LangPath + "EDL0800_dft_basic.jsp", req, res);
							}
						}
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
					//check for documents for acceptor
				} else {

					try {
						if (grp.equals("1")) {
							if (act.equals("A")) {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_enter_acc_maint.jsp");
								callPage(
									LangPath
										+ "EDL0800_dft_enter_acc_maint.jsp",
									req,
									res);
							} else {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_acceptor_docs.jsp");
								callPage(
									LangPath + "EDL0800_dft_acceptor_docs.jsp",
									req,
									res);
							}
						} else {
							if (grp.equals("4")) {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_acceptor_docs_detail.jsp");
								callPage(
									LangPath
										+ "EDL0800_dft_acceptor_docs_detail.jsp",
									req,
									res);
							} else {
								//emat 03/15/2002
								if (userPO.getHeader10().equals("CONF")) {
									flexLog(
										"About to call Page: "
											+ LangPath
											+ "EDL0800_dft_new_transac.jsp");
									callPage(
										LangPath
											+ "EDL0800_dft_new_transac.jsp",
										req,
										res);
								} else {
									flexLog(
										"About to call Page: "
											+ LangPath
											+ "EDL0800_dft_basic.jsp");
									res.sendRedirect(
										super.srctx
											+ "/servlet/datapro.eibs.products.JSEDL0800?SCREEN=1700&REQFLG=1&E01DEAACC="
											+ req.getParameter("E01DEAACC"));
									//callPage(LangPath + "EDL0800_dft_basic.jsp", req, res);
								}
							}
						}
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			} else { // There are errors
				if (userPO.getPurpose().equals("MAINTENANCE")) {
					if (grp.equals("0")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_basic.jsp");
							callPage(
								LangPath + "EDL0800_dft_basic.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else if (grp.equals("1")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_acceptor_basic.jsp");
							callPage(
								LangPath + "EDL0800_dft_acceptor_basic.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}
				} else {
					try {
						if (grp.equals("0")) {
							try {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_basic.jsp");
								callPage(
									LangPath + "EDL0800_dft_basic.jsp",
									req,
									res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						} else if (grp.equals("1")) {
							try {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_acceptor_basic.jsp");
								callPage(
									LangPath + "EDL0800_dft_acceptor_basic.jsp",
									req,
									res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						}
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionMaintColl(
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		JBListRec collList = null;
		int colNum = 5;

		try {
			collList = new datapro.eibs.beans.JBListRec();
			collList.init(colNum);
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		String sel = " ";
		String myFlag = "";
		String myRow[] = new String[colNum];
		for (int i = 0; i < colNum; i++) {
			myRow[i] = "";
		}

		for (int row = 0; row < 10; row++) {
			try {
				sel = req.getParameter("RCLACB_" + row).toUpperCase();
				if (sel.equals(""))
					break;
			} catch (Exception e) {
				break;
			}
			myRow[0] = req.getParameter("RCLACB_" + row).toUpperCase();
			myRow[1] = req.getParameter("RCLTYB_" + row).toUpperCase();
			myRow[2] = req.getParameter("RCLCCY_" + row).toUpperCase();
			myRow[3] = req.getParameter("RCLAMT_" + row).toUpperCase();
			try {
				myRow[4] = req.getParameter("RCLF04_" + row).toUpperCase();
			} catch (Exception e) {
			}
			collList.addRow(myFlag, myRow);

		}

		ses.setAttribute("coll", collList);

		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>Close</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
		out.println("		top.opener.document.forms[0].SCREEN.value = 500");
		out.println("		top.opener.document.forms[0].submit();");
		out.println("		top.close();");
		out.println("</SCRIPT>");
		out.println("<P>Close it!!!</P>");
		out.println("</BODY>");
		out.println("</HTML>");
		out.close();

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionMaintDed(
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		JBListRec dedList = null;

		dedList = (JBListRec) ses.getAttribute("ded");

		dedList.initRow();
		int row = 0;
		String sel = " ";
		while (dedList.getNextRow()) {
			row = dedList.getCurrentRow();
			try {
				sel = req.getParameter("DLISEL_" + row);
				if (sel.equals("")) {
					sel = " ";
				}
			} catch (Exception e) {
				sel = " ";
			}
			dedList.setRecord(sel, 0, row);
			dedList.setRecord(req.getParameter("DLICDE_" + row), 1, row);
			dedList.setRecord(
				req.getParameter("DLINME_" + row).toUpperCase(),
				2,
				row);
			dedList.setRecord(
				req.getParameter("DLIPLZ_" + row).toUpperCase(),
				3,
				row);
			dedList.setRecord(req.getParameter("DLIDPM_" + row), 4, row);
			dedList.setRecord(req.getParameter("DLIFAC_" + row), 5, row);

		}

		ses.setAttribute("ded", dedList);

		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>Close</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
		out.println("		top.opener.document.forms[0].SCREEN.value = 500");
		out.println("		top.opener.document.forms[0].submit();");
		out.println("		top.close();");
		out.println("</SCRIPT>");
		out.println("<P>Close it!!!</P>");
		out.println("</BODY>");
		out.println("</HTML>");
		out.close();

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionMaintPay(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		JBListRec pmntList = null;
		int colNum = 7;

		try {
			pmntList = new datapro.eibs.beans.JBListRec();
			pmntList.init(colNum);
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		String sel = " ";
		String myFlag = "";
		String myRow[] = new String[colNum];
		for (int i = 0; i < colNum; i++) {
			myRow[i] = "";
		}

		for (int row = 0; row < 360; row++) {
			try {
				sel = req.getParameter("DLPPNU_" + row).toUpperCase();
				if (sel.equals(""))
					break;
			} catch (Exception e) {
				break;
			}

			myRow[0] = req.getParameter("DLPPNU_" + row);
			myRow[1] = req.getParameter("DLPPDM_" + row);
			myRow[2] = req.getParameter("DLPPDD_" + row);
			myRow[3] = req.getParameter("DLPPDY_" + row);
			myRow[4] = req.getParameter("DLPPRI_" + row);
			myRow[5] = req.getParameter("DLPINT_" + row);
			myRow[6] = req.getParameter("DLPIIP_" + row);

			pmntList.addRow(myFlag, myRow);

		}

		flexLog("Putting java beans into the session");
		ses.setAttribute("pmnt", pmntList);

		int opt;
		try {
			opt = Integer.parseInt(req.getParameter("opt"));
		} catch (Exception e) {
			opt = 1;
		}

		switch (opt) {
			case 1 :
				{
					res.setContentType("text/html");
					PrintWriter out = res.getWriter();
					out.println("<HTML>");
					out.println("<HEAD>");
					out.println("<TITLE>Close</TITLE>");
					out.println("</HEAD>");
					out.println("<BODY>");
					out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
					out.println(
						"		top.opener.document.forms[0].SCREEN.value = 500");
					out.println(
						"		top.opener.document.forms[0].submit();");
					out.println("		top.close();");
					out.println("</SCRIPT>");
					out.println("<P>Close it!!!</P>");
					out.println("</BODY>");
					out.println("</HTML>");
					out.close();
					break;
				}
			case 2 :
				{
					try {
						pmntList.setLastRow();
						int pymNumLast = 1;
						if (!pmntList.getNoResult()) {
							pymNumLast =
								Integer.parseInt(pmntList.getRecord(0)) + 1;
						}
						int number =
							Integer.parseInt(req.getParameter("NUMBER"));
						int month = Integer.parseInt(req.getParameter("DATE1"));
						int day = Integer.parseInt(req.getParameter("DATE2"));
						int year =
							2000 + Integer.parseInt(req.getParameter("DATE3"));
						int feq =
							Integer.parseInt(req.getParameter("FREQUENCY"));
						char code = req.getParameter("CODE").toCharArray()[0];
						java.util.Calendar myDate = Calendar.getInstance();
						myDate.set(year, month - 1, day);

						for (int row = 0; row < number; row++) {

							// Payment Number
							myRow[0] = pymNumLast + row + "";
							// Dates
							if (row > 0) {
								switch (code) {
									case 'D' :
										{
											myDate.add(Calendar.DATE, feq);
											break;
										}
									case 'M' :
										{
											myDate.add(Calendar.MONTH, feq);
											break;
										}
									case 'Y' :
										{
											myDate.add(Calendar.YEAR, feq);
											break;
										}
								}
							}

							if (user.getE01DTF().equals("MDY")) {
								myRow[1] =
									(myDate.get(Calendar.MONTH) + 1) + "";
								myRow[2] =
									myDate.get(Calendar.DAY_OF_MONTH) + "";
								String y = myDate.get(Calendar.YEAR) + "";
								myRow[3] = y.substring(2);
							} else if (user.getE01DTF().equals("DMY")) {
								myRow[1] =
									myDate.get(Calendar.DAY_OF_MONTH) + "";
								myRow[2] =
									(myDate.get(Calendar.MONTH) + 1) + "";
								String y = myDate.get(Calendar.YEAR) + "";
								myRow[3] = y.substring(2);
							} else {
								String y = myDate.get(Calendar.YEAR) + "";
								myRow[1] = y.substring(2);
								myRow[2] =
									(myDate.get(Calendar.MONTH) + 1) + "";
								myRow[3] =
									myDate.get(Calendar.DAY_OF_MONTH) + "";
							}
							// Amount
							myRow[4] = req.getParameter("AMOUNT");
							// Interest
							myRow[5] = "";
							// Include Interest in Payments
							myRow[6] = req.getParameter("INTEREST");

							pmntList.addRow(myFlag, myRow);

						}

						flexLog("Putting java beans into the session");
						ses.setAttribute("pmnt", pmntList);
					} catch (Exception e) {
					}

					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0150_ln_pay_pln_det.jsp");
						callPage(
							LangPath + "EDL0150_ln_pay_pln_det.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
					break;
				}
			case 3 :
				{
					String row = req.getParameter("ROW");
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0150_ln_pay_pln_det.jsp?ROW="
								+ row);
						res.sendRedirect(
							super.srctx
								+ LangPath
								+ "EDL0150_ln_pay_pln_det.jsp?ROW="
								+ row);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
					break;
				}
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionNewTran(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL080030Message msgGenInf = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		//flexLog("Por aqui");
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		if (userPO.getSource().equals("FACT") && !userPO.getHeader23().equals("DFT") ) {
			EDL080001Message dftBasic = null;
			try {
				dftBasic = (EDL080001Message) ses.getAttribute("dftBasic");
				userPO.setHeader10("CONF");
				userPO.setHeader11("CONF");
				userPO.setHeader19(dftBasic.getE01DEARTE());
				userPO.setHeader23("DFT");
				userPO.setHeader4(dftBasic.getE01DSCPRO().trim());
				userPO.setHeader5(dftBasic.getE01DEAOAM().trim());
				userPO.setHeader6(dftBasic.getE01DEATRM().trim());
				userPO.setHeader7(dftBasic.getE01DEATRC().trim());
				userPO.setHeader8(dftBasic.getE01DEARET().trim());
				userPO.setAccNum(dftBasic.getE01DEAACC());
				userPO.setIdentifier(dftBasic.getE01DEAACC());
				userPO.setProdCode(dftBasic.getE01DEAPRO().trim());
				userPO.setCusNum(dftBasic.getE01DEACUN().trim());
				userPO.setCreditLineNum(dftBasic.getE01DEACMN().trim());
				userPO.setCusName(dftBasic.getE01CUSNA1().trim());
				userPO.setCurrency(dftBasic.getE01DEACCY());
				userPO.setBank(dftBasic.getE01DEABNK());
				userPO.setBranch(dftBasic.getE01DEABRN());
				msgGenInf = (EDL080030Message) ses.getAttribute("lnGenTran");
				userPO.setHeader5(msgGenInf.getE30TRNPRI());
				
				userPO.setSource("FACT");
				
			} catch (Exception e) {
				
			}
		}
		
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgGenInf = (EDL080030Message) ses.getAttribute("lnGenTran");

			msgGenInf.setH30USERID(user.getH01USR());
			msgGenInf.setH30PROGRM("EDL0800");
			msgGenInf.setH30TIMSYS(getTimeStamp());
			msgGenInf.setH30SCRCOD("01");
			msgGenInf.setH30OPECOD("0005");

			// all the fields here
			java.util.Enumeration enu = msgGenInf.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}

			//msgGenInf.send();
			mc.sendMessage(msgGenInf);
			msgGenInf.destroy();
			flexLog("EDL080030 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDL080030")) {
				try {
					msgGenInf = new datapro.eibs.beans.EDL080030Message();
					flexLog("EDL080030 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgGenInf = (EDL080030Message) newmessage;

				userPO.setIdentifier(msgGenInf.getE30DEAACC());
				userPO.setHeader1(msgGenInf.getE30DEAPRO());
				// userPO.setHeader8(msgGenInf.getE30DEARET());
				userPO.setHeader2(msgGenInf.getE30DEACUN());
				userPO.setHeader3(msgGenInf.getE30CUSNA1());
				userPO.setHeader5(msgGenInf.getE30TRNPRI());
				userPO.setHeader6(msgGenInf.getE30DEATRM());
				userPO.setHeader7(msgGenInf.getE30DEATRC());
				userPO.setCurrency(msgGenInf.getE30DEACCY());
				userPO.setBank(msgGenInf.getE30DEABNK());
				userPO.setBranch(msgGenInf.getE30DEABRN());

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("lnGenTran", msgGenInf);
				ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors 
					try {
						if (userPO.getPurpose().equals("MAINTENANCE")) {
							try {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_enter_maint.jsp");
								callPage(
									LangPath + "EDL0800_dft_enter_maint.jsp",
									req,
									res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						} else if (userPO.getPurpose().equals("NEW")) {
							try {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_confirm.jsp");
								callPage(
									LangPath + "EDL0800_dft_confirm.jsp",
									req,
									res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						}

					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else { // There are errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0800_dft_new_transac.jsp");
						callPage(
							LangPath + "EDL0800_dft_new_transac.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionSpecialCodes(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ESD000002Message dftBasic = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			dftBasic = (ESD000002Message) ses.getAttribute("lnCodes");
			//msgLN = (ESD000002Message)mc.getMessageRecord("ESD000002");
			dftBasic.setH02USR(user.getH01USR());
			dftBasic.setH02PGM("EDL0130");
			dftBasic.setH02TIM(getTimeStamp());
			dftBasic.setH02SCR("01");
			dftBasic.setH02OPE("0005");
			dftBasic.setH02WK1("M");
			// all the fields here
			java.util.Enumeration enu = dftBasic.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}

			//msgLN.send();
			mc.sendMessage(dftBasic);
			dftBasic.destroy();
			flexLog("ESD000002 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ESD000002")) {
				try {
					dftBasic = new datapro.eibs.beans.ESD000002Message();
					flexLog("ESD000002 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				dftBasic = (ESD000002Message) newmessage;
				// showESD008004(msgLN);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("lnCodes", dftBasic);

				if (IsNotError) { // There are no errors
					if (userPO.getPurpose().equals("NEW")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_new_transac.jsp");
							callPage(
								LangPath + "EDL0800_dft_new_transac.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_basic.jsp");
							callPage(
								LangPath + "EDL0800_dft_basic.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}
				} else { // There are errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0800_dft_codes.jsp");
						callPage(LangPath + "EDL0800_dft_codes.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionTit(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ESD000006Message dftBasic = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			//msgLN = (ESD000006Message)ses.getAttribute("cdTit");
			dftBasic = (ESD000006Message) mc.getMessageRecord("ESD000006");
			dftBasic.setH06USR(user.getH01USR());
			dftBasic.setH06PGM("EDL0800");
			dftBasic.setH06TIM(""); //getTimeStamp()
			dftBasic.setH06SCR("01");
			dftBasic.setH06OPE("0005");
			dftBasic.setE06ACC(userPO.getIdentifier());
			dftBasic.setE06RTP("H");
			dftBasic.setH06WK1("M");
			// all the fields here
			java.util.Enumeration enu = dftBasic.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}

			dftBasic.send();
			//mc.sendMessage(msgLN);
			dftBasic.destroy();

			flexLog("ESD000006 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ESD000006")) {
				try {
					dftBasic = new datapro.eibs.beans.ESD000006Message();
					flexLog("ESD000006 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				dftBasic = (ESD000006Message) newmessage;
				// showESD008004(msgLN);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("lnTit", dftBasic);

				if (IsNotError) { // There are no errors
					if (userPO.getPurpose().equals("NEW")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_new_transac.jsp");
							callPage(
								LangPath + "EDL0800_dft_new_transac.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_basic.jsp");
							callPage(
								LangPath + "EDL0800_dft_basic.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}
				} else { // There are errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0800_dft_tit.jsp");
						callPage(LangPath + "EDL0800_dft_tit.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionCancelDebit(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		EDL015210Message msgLN = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
	
			
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgLN = (EDL015210Message) ses.getAttribute("lnAutoDebit");
			msgLN.setH10USERID(user.getH01USR());
			msgLN.setH10PROGRM("EDL0152");
			msgLN.setH10TIMSYS(getTimeStamp());
			msgLN.setH10SCRCOD("01");
			msgLN.setH10OPECOD("0005");
	
			// all the fields here
			java.util.Enumeration enu = msgLN.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}
	
			//msgLN.send();
			mc.sendMessage(msgLN);
			msgLN.destroy();
	
		
		// Receive Error Message
		
			newmessage = mc.receiveMessage();
	
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				//showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");
	
		
		// Receive Data
		
			newmessage = mc.receiveMessage();
	
			if (newmessage.getFormatName().equals("EDL015210")) {
					
				msgLN = (EDL015210Message) newmessage;
				// showESD008004(msgLN);
	
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("lnAutoDebit", msgLN);
	
				if (IsNotError) { // There are no errors
					try {
						flexLog("About to call Page: " + LangPath + "EDL0800_dft_basic.jsp");
						callPage(LangPath + "EDL0800_dft_basic.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else { // There are errors
					try {
						flexLog("About to call Page: " + LangPath + "EDL0800_dft_cancel_auto_debit.jsp");
						callPage(LangPath + "EDL0800_dft_cancel_auto_debit.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");
	
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected boolean procRecMaintData(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL080001Message dftBasic = null;
		EDL080002Message dftDocument = null;
		EDL080003Message dftAcceptor = null;
		EDL080030Message dftTrans = null;

		JBListRec lstAcceptors = new JBListRec();
		JBObjList lstDocuments = new JBObjList();

		ELEERRMessage msgError = new ELEERRMessage();
		UserPos userPO = null;
		boolean IsNotError = true;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		if (userPO == null) {
			userPO = new datapro.eibs.beans.UserPos();
			userPO.setOption("LN");
			userPO.setSource("FACT");
			userPO.setPurpose("MAINTENANCE");
		}
		userPO.setHeader9("N");
		int screen = Integer.parseInt(req.getParameter("SCREEN"));

		// Receive Error Message
		try {

			String grp = req.getParameter("GRP");

			if (grp == null)
				grp = "";
			if (!grp.equals("4")) {

				if (screen != 1700) {
					newmessage = mc.receiveMessage();
					flexLog("Message " + newmessage.getFormatName() + " received.");
					if (newmessage.getFormatName().equals("ELEERR")) {
						msgError = (ELEERRMessage) newmessage;
						IsNotError = msgError.getERRNUM().equals("0");
						flexLog("IsNotError = " + IsNotError);
						showERROR(msgError);
					} else
						flexLog(
							"Message "
								+ newmessage.getFormatName()
								+ " received.");
				}
			} else
				IsNotError = true;

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
		// EDL080001  
		// Receive Data
		try {

			newmessage = mc.receiveMessage();
			flexLog(newmessage.getFormatName() + "Message Received.");

			if (newmessage.getFormatName().equals("EDL080001")) {

				dftBasic = (EDL080001Message) newmessage;

				userPO.setAccNum(dftBasic.getE01DEAACC());
				userPO.setIdentifier(dftBasic.getE01DEAACC());
				userPO.setProdCode(dftBasic.getE01DEAPRO().trim());
				userPO.setCusNum(dftBasic.getE01DEACUN().trim());
				userPO.setCreditLineNum(dftBasic.getE01DEACMN().trim());
				userPO.setCusName(dftBasic.getE01CUSNA1().trim());
				userPO.setCurrency(dftBasic.getE01DEACCY());
				userPO.setBank(dftBasic.getE01DEABNK());
				userPO.setBranch(dftBasic.getE01DEABRN());
				userPO.setType(dftBasic.getE01DEACCY());
				userPO.setHeader8(dftBasic.getE01DEARET());
				userPO.setHeader19("N");
				userPO.setHeader4(dftBasic.getE01DSCPRO());
				userPO.setHeader19(dftBasic.getE01DEARTE());
				userPO.setHeader23("DFT");
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("dftBasic", dftBasic);
				
				if (screen != 400 && screen != 200 && screen != 3 && screen != 1200 && screen != 1600) {
					newmessage = mc.receiveMessage();
					flexLog(newmessage.getFormatName() + "Message Received.");
					if (newmessage.getFormatName().equals("EDL080030")) {
						dftTrans = (EDL080030Message) newmessage;

						if (screen != 502) {
							userPO.setAccNum(dftTrans.getE30DEAACC());
							userPO.setIdentifier(dftTrans.getE30DEAACC());
							userPO.setProdCode(dftTrans.getE30DEAPRO().trim());
							userPO.setCusNum(dftTrans.getE30DEACUN().trim());
							userPO.setCusName(dftTrans.getE30CUSNA1().trim());
							userPO.setCurrency(dftTrans.getE30DEACCY());
							userPO.setBank(dftTrans.getE30DEABNK());
							userPO.setBranch(dftTrans.getE30DEABRN());
							userPO.setHeader5(dftTrans.getE30TRNPRI());
							userPO.setHeader6(dftTrans.getE30DEATRM());
							userPO.setHeader7(dftTrans.getE30DEATRC());
						}

						ses.setAttribute("lnGenTran", dftTrans);
					}
					
				}
			}
			if (newmessage.getFormatName().equals("EDL080003")) {

				dftAcceptor = (EDL080003Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("dftAcceptor", dftAcceptor);

			}
			if (newmessage.getFormatName().equals("EDL080002")) {

				lstAcceptors = new datapro.eibs.beans.JBListRec();

				int colnum = 9;
				lstAcceptors.init(colnum);
				String myRow[] = new String[colnum];
				for (int i = 0; i < colnum; i++) {
					myRow[i] = "";
				}

				dftDocument = (EDL080002Message) newmessage;

				boolean endList =
					(dftDocument.getE02ENDFLD().trim().equals("*")
						? true
						: false);
				String myFlag = "";
				String idAcceptor = "";
				String custNumb = "";
				String lineaCust = "";
				String lineaCred = "";
				String nameAcceptor = "";
				String mailAddr = "";
				String ejerRec = "";
				String lneAvl = "";
				String lneMatD = "";
				String lneMatM = "";
				String lmeMatY = "";
				BigDecimal totalAcceptorDocs = new BigDecimal("0");
				BigDecimal totalInterestDocs = new BigDecimal("0");
				if (!endList) {
					idAcceptor = dftDocument.getE02DLDDID();
					custNumb = dftDocument.getE02CUMCUN();
					lineaCust = dftDocument.getE02DLDCMC();
					lineaCred = dftDocument.getE02DLDCMN();
					nameAcceptor = dftDocument.getE02DLDNME();
					mailAddr = dftDocument.getE02CUMMAN();
					ejerRec = dftDocument.getE02CRLCON();
					totalAcceptorDocs = dftDocument.getBigDecimalE02DLDOAM();
					totalInterestDocs =  dftDocument.getBigDecimalE02DLDOIA().subtract(dftDocument.getBigDecimalE02DLDPIA());
				}
				boolean firstTime = true;

				//emat 03/15/2002
				BigDecimal totalDocs = new BigDecimal("0");
				BigDecimal totalInts = new BigDecimal("0");
				
				dftAcceptor = new EDL080003Message();
				dftAcceptor.setH03USERID(user.getH01USR());
				dftAcceptor.setH03PROGRM("EDL0800");
				dftAcceptor.setH03TIMSYS(getTimeStamp());
				dftAcceptor.setE03NUMIDE(idAcceptor);
				dftAcceptor.setE03DLDCMC(custNumb);
				dftAcceptor.setE03CUN(custNumb);
				dftAcceptor.setE03DLDCMN(lineaCred);
				dftAcceptor.setE03CUMMA1(nameAcceptor);
				dftAcceptor.setE03CUMMAN(mailAddr);
				dftAcceptor.setE03CUMNST(ejerRec);
				dftAcceptor.setE03LNEAVL(dftDocument.getE02AVLAMT());
				dftAcceptor.setE03LNEMAM(dftDocument.getE02LNEMAM());
				dftAcceptor.setE03LNEMAD(dftDocument.getE02LNEMAD());
				dftAcceptor.setE03LNEMAY(dftDocument.getE02LNEMAY());
				ses.setAttribute("dftAcceptor", dftAcceptor);

				while (!endList) {
					totalDocs =
						totalDocs.add(dftDocument.getBigDecimalE02DLDOAM());
					totalInts = dftDocument.getBigDecimalE02DLDOIA().subtract(dftDocument.getBigDecimalE02DLDPIA());
					
					lstDocuments.addRow(dftDocument);
					//capture acceptor data
					if (idAcceptor.trim().equals(dftDocument.getE02DLDDID().trim())) {
						if (firstTime) {
							firstTime = false;
							totalAcceptorDocs = dftDocument.getBigDecimalE02DLDOAM();
														totalInterestDocs =  
							dftDocument.getBigDecimalE02DLDOIA().subtract(dftDocument.getBigDecimalE02DLDPIA());
						} else {
							totalAcceptorDocs = totalAcceptorDocs.add(
									dftDocument.getBigDecimalE02DLDOAM());
							totalInterestDocs =  totalInterestDocs.add(
									(dftDocument.getBigDecimalE02DLDOIA().subtract(dftDocument.getBigDecimalE02DLDPIA())));
						}
					} else {
						myRow[0] = idAcceptor;
						myRow[1] = nameAcceptor;
						myRow[2] = totalAcceptorDocs.toString();
						myRow[3] = totalInterestDocs.toString();
						myRow[4] = mailAddr;
						myRow[5] = ejerRec;
						myRow[6] = custNumb;
						myRow[7] = lineaCust;
						myRow[8] = lineaCred;
						lstAcceptors.addRow(myFlag, myRow);
						idAcceptor = dftDocument.getE02DLDDID();
						nameAcceptor = dftDocument.getE02DLDNME();
						mailAddr = dftDocument.getE02CUMMAN();
						ejerRec = dftDocument.getE02CRLCON();
						totalAcceptorDocs =
							dftDocument.getBigDecimalE02DLDOAM();
						totalInterestDocs =  
							dftDocument.getBigDecimalE02DLDOIA().subtract(dftDocument.getBigDecimalE02DLDPIA()); 
					}
					newmessage = mc.receiveMessage();
					dftDocument = (EDL080002Message) newmessage;
					endList =
						(dftDocument.getE02ENDFLD().trim().equals("*")
							? true
							: false);
					if (endList) {
						myRow[0] = idAcceptor;
						myRow[1] = nameAcceptor;
						myRow[2] = totalAcceptorDocs.toString();
						myRow[3] = totalInterestDocs.toString();
						myRow[4] = mailAddr;
						myRow[5] = ejerRec;
						myRow[6] = custNumb;
						myRow[7] = lineaCust;
						myRow[8] = lineaCred;
						lstAcceptors.addRow(myFlag, myRow);
					}
				}

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				String grp2 = req.getParameter("GRP");
				if (grp2 == null)
					grp2 = "";
				if (!grp2.equals("4")) {
					ses.setAttribute("lstAcceptors", lstAcceptors);
				}
				ses.setAttribute("lstDocuments", lstDocuments);
				ses.removeAttribute("oldDocuments");

				//emat 03/15/2002
				//check if draft is new WRKFLG01 = 'N'
				//and if total of documents = total of draft , redirect to 
				//transactions
				dftBasic = (EDL080001Message) ses.getAttribute("dftBasic");
				BigDecimal totalDraft = null;
				totalDraft = dftBasic.getBigDecimalE01DEAOAM();

				if (dftBasic.getH01FLGWK1().trim().equals("N")) {
					if (totalDraft.equals(totalDocs)) {
						userPO.setHeader10("CONF");
						//get transaction 

						dftTrans = new datapro.eibs.beans.EDL080030Message();
						dftTrans.setH30USERID(user.getH01USR());
						dftTrans.setH30PROGRM("EDL0800");
						dftTrans.setH30TIMSYS(getTimeStamp());
						dftTrans.setH30SCRCOD("01");
						dftTrans.setH30OPECOD("0002");
						dftTrans.setE30DEAACC(dftBasic.getE01DEAACC());

						mc.sendMessage(dftTrans);
						flexLog(dftTrans.getFormatName() + "Message Sent.");
						dftTrans.destroy();
						//receive message
						newmessage = mc.receiveMessage();
						flexLog(newmessage.getFormatName() + "Message Received.");
						if (newmessage.getFormatName().equals("ELEERR")) {
							msgError = (ELEERRMessage) newmessage;
							IsNotError = msgError.getERRNUM().equals("0");
							flexLog("IsNotError = " + IsNotError);
						}

						newmessage = mc.receiveMessage();
						flexLog(newmessage.getFormatName() + "Message Received.");
						if (newmessage.getFormatName().equals("EDL080030")) {
							dftTrans = (EDL080030Message) newmessage;

							userPO.setIdentifier(dftTrans.getE30DEAACC());
							userPO.setHeader1(dftTrans.getE30DEAPRO());
							// userPO.setHeader8(dftTrans.getE30DEARET());
							userPO.setHeader2(dftTrans.getE30DEACUN());
							userPO.setHeader3(dftTrans.getE30CUSNA1());
							userPO.setHeader5(dftTrans.getE30TRNPRI());
							userPO.setHeader6(dftTrans.getE30DEATRM());
							userPO.setHeader7(dftTrans.getE30DEATRC());
							userPO.setCurrency(dftTrans.getE30DEACCY());
							userPO.setBank(dftTrans.getE30DEABNK());
							userPO.setBranch(dftTrans.getE30DEABRN());

							ses.setAttribute("lnGenTran", dftTrans);
							ses.setAttribute("userPO", userPO);
						}
					}

				}

				int flg = Util.parseInt(req.getParameter("REQFLG"));
				if (flg == 1) {
					if (!totalDraft.equals(totalDocs)) {
						if (!totalDraft.equals(new BigDecimal("0"))) {
							msgError = new datapro.eibs.beans.ELEERRMessage();
							msgError.setERRNUM("1");
							msgError.setERWF01("Y");
							msgError.setERNU01("xxxx");
							msgError.setERDS01(
								"Total Descuento diferente a Total Documentos");
							ses.setAttribute("error", msgError);
						}
					}
				}

				dftAcceptor.setH03USERID(user.getH01USR());
				dftAcceptor.setH03PROGRM("EDL0800");
				dftAcceptor.setH03TIMSYS(getTimeStamp());
				dftAcceptor.setE03NUMIDE(idAcceptor);
				dftAcceptor.setE03CUMMA1(nameAcceptor);
				dftAcceptor.setE03CUMMAN(mailAddr);
				dftAcceptor.setE03CUMNST(ejerRec);
				ses.setAttribute("dftAcceptor", dftAcceptor);
			}

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		return IsNotError;
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqEnterMaint(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos userPO = null;

		try {

			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = new datapro.eibs.beans.UserPos();
			userPO.setOption("LN");
			userPO.setSource("FACT");
			userPO.setPurpose("MAINTENANCE");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		try {
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDL0800_dft_enter_maint.jsp");
			callPage(LangPath + "EDL0800_dft_enter_maint.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqEnterAcceptorMaint(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos userPO = null;

		try {

			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = new datapro.eibs.beans.UserPos();
			userPO.setOption("LN");
			userPO.setSource("FACT");
			userPO.setPurpose("MAINTENANCE");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		try {
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDL0800_dft_enter_acc_maint.jsp");
			callPage(LangPath + "EDL0800_dft_enter_acc_maint.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqEspInst(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ESD000005Message dftBasic = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		String purpose = (String) ses.getAttribute("Purpose");

		String opCode = "0002";

		// Send Initial data
		try {
			dftBasic = (ESD000005Message) mc.getMessageRecord("ESD000005");
			dftBasic.setH05USR(user.getH01USR());
			dftBasic.setH05PGM("EDL0800");
			dftBasic.setH05TIM(""); //getTimeStamp()
			dftBasic.setH05SCR("01");
			dftBasic.setH05OPE(opCode);
			dftBasic.setE05ACC(userPO.getIdentifier());
			dftBasic.setE05ACD("10");
			dftBasic.setH05WK1("M");
			dftBasic.send();
			dftBasic.destroy();
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ESD000005")) {
				try {
					dftBasic = new datapro.eibs.beans.ESD000005Message();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				dftBasic = (ESD000005Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("lnInst", dftBasic);

				if (IsNotError) { // There are no errors 
					if (purpose.equals("READONLY")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_inq_special_inst.jsp");
							callPage(
								LangPath + "EDL0800_dft_inq_special_inst.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else if (purpose.equals("APPROVAL")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_ap_special_inst.jsp");
							callPage(
								LangPath + "EDL0800_dft_ap_special_inst.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_special_inst.jsp");
							callPage(
								LangPath + "EDL0800_dft_special_inst.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}

				} else { // There are errors
					if (userPO.getPurpose().equals("NEW")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_new_transac.jsp");
							callPage(
								LangPath + "EDL0800_dft_new_transac.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						if (purpose.equals("READONLY")) {
							try {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_inq_basic.jsp");
								callPage(
									LangPath + "EDL0800_dft_inq_basic.jsp",
									req,
									res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						} else {
							try {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_basic.jsp");
								callPage(
									LangPath + "EDL0800_dft_basic.jsp",
									req,
									res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						}
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqExchangeRate(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL015206Message msgLN = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		String opCode = "0002";

		// Send Initial data
		try {
			msgLN = (EDL015206Message) mc.getMessageRecord("EDL015206");
			msgLN.setH06USERID(user.getH01USR());
			msgLN.setH06PROGRM("EDL0150");
			msgLN.setH06TIMSYS(""); //getTimeStamp()
			msgLN.setH06SCRCOD("01");
			msgLN.setH06OPECOD(opCode);
			msgLN.setE06DEAACC(userPO.getIdentifier());
			msgLN.send();
			msgLN.destroy();
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDL015206")) {
				try {
					msgLN = new datapro.eibs.beans.EDL015206Message();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgLN = (EDL015206Message) newmessage;
				// showESD008004(msgLN);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("lnRate", msgLN);

				if (IsNotError) { // There are no errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0150_ln_xchg_rate.jsp");
						callPage(
							LangPath + "EDL0150_ln_xchg_rate.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else { // There are errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0150_ln_basic.jsp");
						callPage(LangPath + "EDL0150_ln_basic.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqIntPrep(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		MessageRecord newmessage = null;
		EDL015009Message msgLN = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		String opCode = "0002";

		// Send Initial data
		try {
			msgLN = (EDL015009Message) mc.getMessageRecord("EDL015009");
			msgLN.setH09USERID(user.getH01USR());
			msgLN.setH09PROGRM("EDL0150");
			msgLN.setH09TIMSYS(""); //getTimeStamp()
			msgLN.setH09SCRCOD("01");
			msgLN.setH09OPECOD(opCode);
			msgLN.setE09DEAACC(userPO.getIdentifier());
			msgLN.send();
			msgLN.destroy();
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("EDL015009")) {
				try {
					msgLN = new datapro.eibs.beans.EDL015009Message();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}
				msgLN = (EDL015009Message) newmessage;
				// showESD008004(msgLN);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("lnIntPrep", msgLN);
				if (IsNotError) { // There are no errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0130_cd_prep_int.jsp");
						callPage(
							LangPath + "EDL0130_cd_prep_int.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else { // There are errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0130_cd_finish.jsp");
						callPage(LangPath + "EDL0130_cd_finish.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqMaint(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL080001Message dftBasic = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		EDL080030Message msgGenInf = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		try {
				dftBasic = (EDL080001Message) ses.getAttribute("dftBasic");
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
				userPO.setCreditLineNum(dftBasic.getE01DEACMN().trim());
				userPO.setCusName(dftBasic.getE01CUSNA1().trim());
				userPO.setCurrency(dftBasic.getE01DEACCY());
				userPO.setBank(dftBasic.getE01DEABNK());
				userPO.setBranch(dftBasic.getE01DEABRN());
				msgGenInf = (EDL080030Message) ses.getAttribute("lnGenTran");
				userPO.setHeader5(msgGenInf.getE30TRNPRI());
				userPO.setSource("FACT");
				
		} catch (Exception e) {
				
		}

		// Send Initial data
		try {
			dftBasic = (EDL080001Message) mc.getMessageRecord("EDL080001");
			dftBasic.setH01USERID(user.getH01USR());
			dftBasic.setH01PROGRM("EDL0800");
			dftBasic.setH01TIMSYS(getTimeStamp());
			dftBasic.setH01SCRCOD("01");
			dftBasic.setH01OPECOD("0002");
			dftBasic.setE01DEAACD("10");
			dftBasic.setH01FLGWK1("A");
			try {
				dftBasic.setE01DEAACC(userPO.getIdentifier());
			} catch (Exception e) {
				dftBasic.setE01DEAACC("0");
			}

			dftBasic.send();
			dftBasic.destroy();
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		try {
			if (procRecMaintData(mc,
				user,
				req,
				res,
				ses)) { // There are no errors
				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "EDL0800_dft_basic.jsp");
					callPage(LangPath + "EDL0800_dft_basic.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else { // There are errors
				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "EDL0800_dft_enter_maint.jsp");
					callPage(
						LangPath + "EDL0800_dft_enter_maint.jsp",
						req,
						res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqNewTransaction(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		MessageRecord newmessage = null;
		EDL080030Message msgLN = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		String purpose = (String) ses.getAttribute("Purpose");

		// Send Initial data
		try {
			msgLN = (EDL080030Message) mc.getMessageRecord("EDL080030");
			msgLN.setH30USERID(user.getH01USR());
			msgLN.setH30PROGRM("EDL0800");
			msgLN.setH30TIMSYS(getTimeStamp());
			msgLN.setH30SCRCOD("01");
			msgLN.setH30OPECOD("0002");

			// all the fields here
			msgLN.setE30DEAACC(userPO.getIdentifier());

			mc.sendMessage(msgLN);
			msgLN.destroy();
			flexLog("EDL080030 Message Sent to Sockets");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("EDL080030")) {
				msgLN = (EDL080030Message) newmessage;
				flexLog("EDL080030 : " + msgLN);
				flexLog("EDL080030 Message Received");

				userPO.setIdentifier(msgLN.getE30DEAACC());
				userPO.setHeader1(msgLN.getE30DEAPRO());
				// userPO.setHeader8(msgLN.getE30DEARET());
				userPO.setHeader2(msgLN.getE30DEACUN());
				userPO.setHeader3(msgLN.getE30CUSNA1());
				userPO.setHeader5(msgLN.getE30TRNPRI());
				userPO.setHeader6(msgLN.getE30DEATRM());
				userPO.setHeader7(msgLN.getE30DEATRC());
				userPO.setCurrency(msgLN.getE30DEACCY());
				userPO.setBank(msgLN.getE30DEABNK());
				userPO.setBranch(msgLN.getE30DEABRN());
				userPO.setAccNum(msgLN.getE30DEAACC());
				userPO.setApplicationCode(msgLN.getE30DEAACD());
				userPO.setSource("FACT");
				userPO.setOption("LN");
				
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("lnGenTran", msgLN);
				if (IsNotError) { // There are no errors
					if (purpose.equals("READONLY")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_inq_new_transac.jsp");
							callPage(
								LangPath + "EDL0800_dft_inq_new_transac.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else if (purpose.equals("APPROVAL")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_ap_new_transac.jsp");
							callPage(
								LangPath + "EDL0800_dft_ap_new_transac.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_new_transac.jsp");
							callPage(
								LangPath + "EDL0800_dft_new_transac.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}
				} else { // There are errors
					if (purpose.equals("READONLY")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_inq_basic.jsp");
							callPage(
								LangPath + "EDL0800_dft_inq_basic.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else if (purpose.equals("APPROVAL")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_ap_basic.jsp");
							callPage(
								LangPath + "EDL0800_dft_ap_basic.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_basic.jsp");
							callPage(
								LangPath + "EDL0800_dft_basic.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqSpecialCodes(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ESD000002Message dftBasic = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		String purpose = (String) ses.getAttribute("Purpose");

		String opCode = "";
		if (userPO.getPurpose().equals("MAINTENANCE"))
			opCode = "0002";
		else
			opCode = "0004";

		// Send Initial data
		try {
			dftBasic = (ESD000002Message) mc.getMessageRecord("ESD000002");
			dftBasic.setH02USR(user.getH01USR());
			dftBasic.setH02PGM("EDL0800");
			dftBasic.setH02TIM(""); //getTimeStamp()
			dftBasic.setH02SCR("01");
			dftBasic.setH02OPE(opCode);
			dftBasic.setE02ACC(userPO.getIdentifier());
			dftBasic.setH02WK1("M");
			dftBasic.send();
			dftBasic.destroy();
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				//MOD : EMAT 9/5/2001
				// to display the page of special codes ...
				IsNotError = true;
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ESD000002")) {
				try {
					dftBasic = new datapro.eibs.beans.ESD000002Message();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				dftBasic = (ESD000002Message) newmessage;
				// showESD008004(msgLN);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("lnCodes", dftBasic);

				if (IsNotError) { // There are no errors
					if (purpose.equals("READONLY")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_inq_codes.jsp");
							callPage(
								LangPath + "EDL0800_dft_inq_codes.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else if (purpose.equals("APPROVAL")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_ap_codes.jsp");
							callPage(
								LangPath + "EDL0800_dft_ap_codes.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_codes.jsp");
							callPage(
								LangPath + "EDL0800_dft_codes.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}
				} else { // There are errors
					if (userPO.getPurpose().equals("NEW")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_new_transac.jsp");
							callPage(
								LangPath + "EDL0800_dft_new_transac.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						if (purpose.equals("READONLY")) {
							try {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_inq_basic.jsp");
								callPage(
									LangPath + "EDL0800_dft_inq_basic.jsp",
									req,
									res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						} else {
							try {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_basic.jsp");
								callPage(
									LangPath + "EDL0800_dft_basic.jsp",
									req,
									res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						}
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqTit(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ESD000006Message dftBasic = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		String purpose = (String) ses.getAttribute("Purpose");

		String opCode = null;
		opCode = "0002";

		// Send Initial data
		try {
			dftBasic = (ESD000006Message) mc.getMessageRecord("ESD000006");
			dftBasic.setH06USR(user.getH01USR());
			dftBasic.setH06PGM("EDL0130");
			dftBasic.setH06TIM(""); //getTimeStamp()
			dftBasic.setH06SCR("01");
			dftBasic.setH06OPE(opCode);
			dftBasic.setE06ACC(userPO.getIdentifier());
			dftBasic.setE06RTP("H");
			dftBasic.setH06WK1("M");

			dftBasic.send();
			dftBasic.destroy();
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ESD000006")) {
				try {
					dftBasic = new datapro.eibs.beans.ESD000006Message();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				dftBasic = (ESD000006Message) newmessage;
				// showESD008004(msgLN);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("lnTit", dftBasic);

				if (IsNotError) { // There are no errors
					if (purpose.equals("READONLY")) {
						try {
							flexLog(
								"About to call Page3: "
									+ LangPath
									+ "EDL0800_dft_inq_tit.jsp");
							callPage(
								LangPath + "EDL0800_dft_inq_tit.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else if (purpose.equals("APPROVAL")) {
						try {
							flexLog(
								"About to call Page3: "
									+ LangPath
									+ "EDL0800_dft_ap_tit.jsp");
							callPage(
								LangPath + "EDL0800_dft_ap_tit.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						try {
							flexLog(
								"About to call Page3: "
									+ LangPath
									+ "EDL0800_dft_tit.jsp");
							callPage(
								LangPath + "EDL0800_dft_tit.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}
				} else { // There are errors
					if (userPO.getPurpose().equals("NEW")) {
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0800_dft_new_transac.jsp");
							callPage(
								LangPath + "EDL0800_dft_new_transac.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						if (purpose.equals("READONLY")) {
							try {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_inq_basic.jsp");
								callPage(
									LangPath + "EDL0800_dft_inq_basic.jsp",
									req,
									res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						} else {
							try {
								flexLog(
									"About to call Page: "
										+ LangPath
										+ "EDL0800_dft_basic.jsp");
								callPage(
									LangPath + "EDL0800_dft_basic.jsp",
									req,
									res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						}
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqInqBalances(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
				throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		EDL016001Message msgCD = null;
		EDL016002Message msgCD2 = null;
		ELEERRMessage msgError = null;
		UserPos	userPO = null;	
		boolean IsNotError = false;
	
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		  	} 
		catch (Exception ex) {
			flexLog("Error: " + ex); 
	  	}
	
		userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
	
		String opCode = null;
		opCode = "0004";
		
		// Send Initial data for EDL016002
		try
		{
			msgCD2 = (EDL016002Message)mc.getMessageRecord("EDL016002");
		 	msgCD2.setH02USERID(user.getH01USR());
		 	msgCD2.setH02PROGRM("EDL0160");
		 	msgCD2.setH02TIMSYS(getTimeStamp());
		 	msgCD2.setH02SCRCOD("01");
		 	msgCD2.setH02OPECOD(opCode);
		 	msgCD2.setE02DEAACC(userPO.getIdentifier());
		 	msgCD2.setE02DEAACD("10");
			
			msgCD2.send();	
		 	msgCD2.destroy();
		}		
		catch (Exception e)
		{
			e.printStackTrace();
			flexLog("Error: " + e);
		  	throw new RuntimeException("Socket Communication Error");
		}
			
		//Receive Error Message
		try
		{
		  	newmessage = mc.receiveMessage();
		  
		  	if (newmessage.getFormatName().equals("ELEERR")) {
				try {
					msgError = new datapro.eibs.beans.ELEERRMessage();
				} 
				catch (Exception ex) {
					flexLog("Error: " + ex); 
			  	}
	
				msgError = (ELEERRMessage)newmessage;
				showERROR(msgError);
				
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
	
		  	}	
	   		else if (newmessage.getFormatName().equals("EDL016002")) {
				try {
					msgCD2 = new datapro.eibs.beans.EDL016002Message();
			  	} catch (Exception ex) {
					flexLog("Error: " + ex); 
			  	}
	
				msgCD2 = (EDL016002Message)newmessage; 
	
				flexLog("Putting java beans into the session");
				ses.setAttribute("inqBasic", msgCD2);
	
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
	
		}
		catch (Exception e)
		{
			e.printStackTrace();
			flexLog("Error: " + e);
		  	throw new RuntimeException("Socket Communication Error");
		}	
	
		// Send Initial data for EDL016001
		try
		{
			msgCD = (EDL016001Message)mc.getMessageRecord("EDL016001");
		 	msgCD.setH01USERID(user.getH01USR());
		 	msgCD.setH01PROGRM("EDL0160");
		 	msgCD.setH01TIMSYS(getTimeStamp());
		 	msgCD.setH01SCRCOD("01");
		 	msgCD.setH01OPECOD(opCode);
		 	msgCD.setE01DEAACC(userPO.getIdentifier());
		 	msgCD.setE01DEAACD("10");
			msgCD.send();	
		 	msgCD.destroy();
	
		 	flexLog("EDL016001 Message Sent");
		}		
		catch (Exception e)
		{
			e.printStackTrace();
			flexLog("Error: " + e);
		  	throw new RuntimeException("Socket Communication Error");
		}
	
		//Receive Error Message
		try
		{
		  	newmessage = mc.receiveMessage();
		  
		  	if (newmessage.getFormatName().equals("ELEERR")) {
				try {
					msgError = new datapro.eibs.beans.ELEERRMessage();
				} 
				catch (Exception ex) {
					flexLog("Error: " + ex); 
			  	}
	
				msgError = (ELEERRMessage)newmessage;
				showERROR(msgError);
				
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
	
				try {
					flexLog("About to call Page: " + LangPath + "EDL0800_dft_enter_inq.jsp");
					callPage(LangPath + "EDL0800_dft_enter_inq.jsp", req, res);	
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
		  	}	
	   		else if (newmessage.getFormatName().equals("EDL016001")) {
				try {
					msgCD = new datapro.eibs.beans.EDL016001Message();
					flexLog("EDL016001 Message Received");
			  	} catch (Exception ex) {
					flexLog("Error: " + ex); 
			  	}
	
				msgCD = (EDL016001Message)newmessage; 
	
	
				flexLog("Putting java beans into the session");
				ses.setAttribute("inqLoans", msgCD);
				ses.setAttribute("error", msgError);
	
				try {
					flexLog("About to call Page: " + LangPath + "EDL0800_dft_inq_balances.jsp");
					callPage(LangPath + "EDL0800_dft_inq_balances.jsp", req, res);	
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
				
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
	
		}
		catch (Exception e)
		{
			e.printStackTrace();
			flexLog("Error: " + e);
		  	throw new RuntimeException("Socket Communication Error");
		}	
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqCancelDebit(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		EDL015210Message msgLN = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
	
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	
		String opCode = "0002";
	
		// Send Initial data
		try {
			msgLN = (EDL015210Message) mc.getMessageRecord("EDL015210");
			msgLN.setH10USERID(user.getH01USR());
			msgLN.setH10PROGRM("EDL0150");
			msgLN.setH10TIMSYS(""); //getTimeStamp()
			msgLN.setH10SCRCOD("01");
			msgLN.setH10OPECOD(opCode);
			msgLN.setE10DEAACC(userPO.getIdentifier());
			msgLN.send();
			msgLN.destroy();
		
	
		// Receive Error Message
		
			newmessage = mc.receiveMessage();
	
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				//showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");
	
		
		// Receive Data
		
			newmessage = mc.receiveMessage();
	
			if (newmessage.getFormatName().equals("EDL015210")) {
				
	
				msgLN = (EDL015210Message) newmessage;
				// showESD008004(msgLN);
	
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("lnAutoDebit", msgLN);
	
				if (IsNotError) { // There are no errors
					try {
						flexLog("About to call Page: " + LangPath + "EDL0800_dft_cancel_auto_debit.jsp");
						callPage(LangPath + "EDL0800_dft_cancel_auto_debit.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else { // There are errors
					try {
						flexLog("About to call Page: " + LangPath + "EDL0800_dft_basic.jsp");
						callPage(LangPath + "EDL0800_dft_basic.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");
	
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	
	}
	public void service(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {

		MessageContext mc = null;

		ESS0030DSMessage msgUser = null;
		HttpSession session = null;

		session = (HttpSession) req.getSession(false);

		if (session == null) {
			try {
				res.setContentType("text/html");
				printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {

			int screen = R_ENTER_MAINT;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("EDL0800", req));
					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {

					}

					flexLog("Screen Number: " + screen);

					switch (screen) {
						// BEGIN CD
						// Request
						case R_MAINTENANCE :
							procReqMaint(mc, msgUser, req, res, session);
							break;
						case R_SPECIAL_INST :
							session.setAttribute("Purpose", "");
							procReqEspInst(mc, msgUser, req, res, session);
							break;
						case R_INQ_SPECIAL_INST :
							session.setAttribute("Purpose", "READONLY");
							procReqEspInst(mc, msgUser, req, res, session);
							break;
						case R_AP_SPECIAL_INST :
							session.setAttribute("Purpose", "APPROVAL");
							procReqEspInst(mc, msgUser, req, res, session);
							break;
						case R_TITULARES :
							session.setAttribute("Purpose", "");
							procReqTit(mc, msgUser, req, res, session);
							break;
						case R_INQ_TITULARES :
							session.setAttribute("Purpose", "READONLY");
							procReqTit(mc, msgUser, req, res, session);
							break;
						case R_AP_TITULARES :
							session.setAttribute("Purpose", "APPROVAL");
							procReqTit(mc, msgUser, req, res, session);
							break;
						case R_INQ_NEW_TRAN :
							session.setAttribute("Purpose", "READONLY");
							procReqNewTransaction(mc, msgUser, req, res, session);
							break;
						case R_AP_NEW_TRAN :
							session.setAttribute("Purpose", "APPROVAL");
							procReqNewTransaction(mc, msgUser, req, res, session);
							break;
						case R_EXCHANGE :
							procReqExchangeRate(mc, msgUser, req, res, session);
							break;
						case R_CODES :
							session.setAttribute("Purpose", "");
							procReqSpecialCodes(mc, msgUser, req, res, session);
							break;
						case R_INQ_CODES :
							session.setAttribute("Purpose", "READONLY");
							procReqSpecialCodes(mc, msgUser, req, res, session);
							break;
						case R_AP_CODES :
							session.setAttribute("Purpose", "APPROVAL");
							procReqSpecialCodes(mc, msgUser, req, res, session);
							break;
						case R_INT_PREP :
							procReqIntPrep(mc, msgUser, req, res, session);
							break;
						case R_OTHERS_TRANS :
							session.setAttribute("Purpose", "");
							procReqOthersTransaction(
								mc,
								msgUser,
								req,
								res,
								session);
							break;
						case R_INQ_OTHERS_TRANS :
							session.setAttribute("Purpose", "READONLY");
							procReqOthersTransaction(
								mc,
								msgUser,
								req,
								res,
								session);
							break;
						case R_INQ_BALANCES :
							procReqInqBalances(mc, msgUser, req, res, session);
							break;
							// Action
						case A_SPECIAL_INST :
							procActionEspInst(mc, msgUser, req, res, session);
							break;
						case A_MAINT_TO_BEAN :
							procReqEnterAcceptorMaint(
								msgUser,
								req,
								res,
								session);
							break;
						case A_MAINT_TO_SCK :
							procActionMaintBeansToSck(
								mc,
								msgUser,
								req,
								res,
								session);
							break;
						case A_MAINT_DED :
							procActionMaintDed(req, res, session);
							break;
						case A_MAINT_COLL :
							procActionMaintColl(req, res, session);
							break;
						case A_MAINT_PMNT :
							procActionMaintPay(msgUser, req, res, session);
							break;
						case A_TITULARES :
							procActionTit(mc, msgUser, req, res, session);
							break;
						case A_EXCHANGE :
							procActionExchangeRate(
								mc,
								msgUser,
								req,
								res,
								session);
							break;
						case A_CODES :
							procActionSpecialCodes(
								mc,
								msgUser,
								req,
								res,
								session);
							break;
						case A_NEW_TRAN :
							procActionNewTran(mc, msgUser, req, res, session);
							break;
						case A_ENTER_ACC_MAINT :
							procActionEnterNewAcc(
								mc,
								msgUser,
								req,
								res,
								session);
							break;
						case A_ENTER_DOCUMENT :
							procActionEnterDocument(
								mc,
								msgUser,
								req,
								res,
								session);
							break;
							// END LN
							// BEGIN Entering
							// Request
						case R_INQ_APPROVAL :
							procReqInqAppDraft(mc, msgUser, req, res, session);
							break;
						case R_INQUIRY :
							procReqInquiryDraft(mc, msgUser, req, res, session);
							break;
						case A_INQUIRY :
							procActionInquiryDraft(
								mc,
								msgUser,
								req,
								res,
								session);
							break;
						case R_ENTER_MAINT :
							procReqEnterMaint(msgUser, req, res, session);
							break;
							// Action 
						case A_ENTER_NEW :
							procActionEnterNew(mc, msgUser, req, res, session);
							break;
						case A_ENTER_MAINT :
							procActionEnterMaint(
								mc,
								msgUser,
								req,
								res,
								session);
							break;
						case A_ENTER_GEN_DOCS :
							procActionGenDocs(mc, msgUser, req, res, session);
							break;
						case R_ENTER_DOC_DET :
							procReqDocDet(mc, msgUser, req, res, session);
							break;
						case R_CANCEL_DEBIT :
							procReqCancelDebit(mc, msgUser, req, res, session);
							break;	
						case A_CANCEL_DEBIT :
							procActionCancelDebit(mc, msgUser, req, res, session);
							break;
							// END Entering
							
						case R_DOC_BASIC :
							procReqDocBasic(mc, msgUser, req, res, session);
							break;
						case A_DOC_BASIC :
							procActDocBasic(mc, msgUser, req, res, session);
							break;
						case R_DOC_LIST :
							procReqDocList(mc, msgUser, req, res, session);
							break;
						case A_DOC_LIST :
							procActDocList(mc, msgUser, req, res, session);
							break;
						default :
							res.sendRedirect(
								super.srctx + LangPath + super.devPage);
							break;
					}

				} catch (Exception e) {
					e.printStackTrace();
					res.sendRedirect(
						super.srctx + LangPath + super.sckNotOpenPage);
					//return;
				} finally {
					mc.close();
				}

			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(
					super.srctx + LangPath + super.sckNotRespondPage);
			}

		}

	}

	protected void showERROR(ELEERRMessage m) {
		if (logType != NONE) {

			flexLog("ERROR received.");

			flexLog("ERROR number:" + m.getERRNUM());
			flexLog("ERR001 = " + m.getERNU01() + " desc: " + m.getERDS01());
			flexLog("ERR002 = " + m.getERNU02() + " desc: " + m.getERDS02());
			flexLog("ERR003 = " + m.getERNU03() + " desc: " + m.getERDS03());
			flexLog("ERR004 = " + m.getERNU04() + " desc: " + m.getERDS04());
			flexLog("ERR005 = " + m.getERNU05() + " desc: " + m.getERDS05());
			flexLog("ERR006 = " + m.getERNU06() + " desc: " + m.getERDS06());
			flexLog("ERR007 = " + m.getERNU07() + " desc: " + m.getERDS07());
			flexLog("ERR008 = " + m.getERNU08() + " desc: " + m.getERDS08());
			flexLog("ERR009 = " + m.getERNU09() + " desc: " + m.getERDS09());
			flexLog("ERR010 = " + m.getERNU10() + " desc: " + m.getERDS10());

		}
	}

	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqOthersTransaction(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		UserPos userPO = null;
		boolean IsNotError = false;
		DataTransaction transData = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		String purpose = (String) ses.getAttribute("Purpose");

		userPO.setSource("FACT");
		userPO.setOption("DFT");

		try {

			transData = new datapro.eibs.beans.DataTransaction();

			transData.setWrkFile("4");
			transData.setBank(userPO.getBank());
			transData.setBranch(userPO.getBranch());
			transData.setAccNum(userPO.getIdentifier());

			flexLog("Putting java beans into the session");
			ses.setAttribute("transData", transData);
			ses.setAttribute("TARGET", "EGL0035");

			flexLog("About to redirect request to the procReqTr with specific parameters: ");
			res.sendRedirect(
				super.srctx
					+ "/servlet/datapro.eibs.products.JSEGL0035?SCREEN=1&PURPOSE="
					+ purpose);

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionMaintAcc(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos userPO = null;

		try {

			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = new datapro.eibs.beans.UserPos();
			userPO.setOption("LN");
			userPO.setSource("FACT");
			userPO.setPurpose("MAINTENANCE");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		try {
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDL0800_dft_enter_maint.jsp");
			callPage(LangPath + "EDL0800_dft_acceptor_basic.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionEnterNewAcc(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL080001Message dftBasic = null;
		EDL080003Message dftAcceptor = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		dftBasic = (EDL080001Message) ses.getAttribute("dftBasic");
		// Send Initial data
		boolean newAcceptor = false;
		try {
			dftAcceptor = (EDL080003Message) mc.getMessageRecord("EDL080003");
			dftAcceptor.setH03USERID(user.getH01USR());
			dftAcceptor.setH03PROGRM("EDL0800");
			dftAcceptor.setH03TIMSYS(getTimeStamp());
			dftAcceptor.setH03SCRCOD("01");
			String action = " ";
			try {
				action = req.getParameter("ACTION");
			} catch (Exception e) {
				action = " ";
			}
			if (action == null) {
				action = " ";
			}
			if (action.trim().equals("G")) {
				//inside drafts maintenance
				newAcceptor = true;
			} else {
				//inside acceptant maintenance
				newAcceptor = false;
			}
			if (action.trim().equals("G") && dftBasic.getBigDecimalE01DEAACC().compareTo(new BigDecimal("0")) > 0 ) {
				action = "A";
			}
			userPO.setAccOpt(action);
			dftAcceptor.setH03OPECOD("0002");
			if (req.getParameter("E01DEACUN") == null) {
				dftAcceptor.setE03CUMCUN("");

			} else {
				dftAcceptor.setE03CUMCUN(req.getParameter("E01DEACUN"));
			}
			if (req.getParameter("E01CUMMAN") == null) {
				dftAcceptor.setE03CUMMAN("");

			} else {
				dftAcceptor.setE03CUMMAN(req.getParameter("E01CUMMAN"));
			}
			if (req.getParameter("E01DEACMC") != null) {
				userPO.setPorfNum(req.getParameter("E01DEACMC"));
			}
			if (req.getParameter("E01DEACMN") != null) {
				userPO.setCreditLineNum(req.getParameter("E01DEACMN"));
			}
			try {
				dftAcceptor.setE03DEACCY(dftBasic.getE01DEACCY());
			} catch (Exception e) 
			{
			}
			try {
				dftAcceptor.setE03DEACMC(req.getParameter("E01DEACMC"));
			} catch (Exception e) 
			{
			}
			try {
				dftAcceptor.setE03DEACMC(req.getParameter("E01DEACMC"));
			} catch (Exception e) 
			{
			}
			dftAcceptor.send();
			dftAcceptor.destroy();
			flexLog("EDL080003 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		try {
			if (procRecMaintData(mc,
				user,
				req,
				res,
				ses)) { // There are no errors
				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "EDL0800_dft_acceptor_basic.jsp");
					callPage(
						LangPath + "EDL0800_dft_acceptor_basic.jsp",
						req,
						res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else { // There are errors

				try {
					if (newAcceptor) {
						//msgError = new datapro.eibs.beans.ELEERRMessage();
						//ses.setAttribute("error", msgError);
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0800_dft_acceptor_basic.jsp");
						callPage(
							LangPath + "EDL0800_dft_enter_acc_maint.jsp",
							req,
							res);
					} else {
						msgError = new datapro.eibs.beans.ELEERRMessage();
						//ses.setAttribute("dftAcceptor", dftAcceptor);
						ses.setAttribute("error", msgError);
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0800_dft_enter_acc_maint.jsp");
						callPage(
							LangPath + "EDL0800_dft_enter_acc_maint.jsp",
							req,
							res);
					}
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	protected void procActionEnterDocument(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		EDL080002Message dftDocument = null;
		// Send Initial data
		try {
			dftDocument = (EDL080002Message) mc.getMessageRecord("EDL080002");
			dftDocument.setH02USERID(user.getH01USR());
			dftDocument.setH02PROGRM("EDL0800");
			dftDocument.setH02TIMSYS(getTimeStamp());
			dftDocument.setH02SCRCOD("01");
			dftDocument.setH02OPECOD("0015");
			try {
				dftDocument.setE02DLDNLN(req.getParameter("E01DEAACC"));
				//dftDocument.setE02DLDDID(req.getParameter("IDEACC"));
				dftDocument.setE02DLDCMC(req.getParameter("IDEACC"));
				dftDocument.setE02CUMMAN(req.getParameter("MAILADDR"));
			} catch (Exception e) {
			}
			flexLog("EDL080002 :" + dftDocument);
			dftDocument.send();
			dftDocument.destroy();
			flexLog("EDL080002 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		try {
			if (procRecMaintData(mc,
				user,
				req,
				res,
				ses)) { // There are no errors
				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "EDL0800_dft_acceptor_docs_detail.jsp");
					callPage(
						LangPath + "EDL0800_dft_acceptor_docs_detail.jsp",
						req,
						res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else { // There are errors
				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "EDL0800_dft_acceptor_docs_detail.jsp");
					callPage(
						LangPath + "EDL0800_dft_enter_maint.jsp",
						req,
						res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	protected void procActionGenDocs(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL080002Message dftDocument = null;
		EDL080003Message dftAcceptor = null;
		ELEERRMessage msgError = null;
		JBObjList lstDocuments = null;
		Calendar lneMat = Calendar.getInstance();
		BigDecimal zero = new BigDecimal(0);
		BigDecimal lneAmt = zero;
		BigDecimal lneAvl = zero;
		int numError = 0;

		UserPos userPO = null;
		boolean IsNotError = true;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setHeader9("N");
		//lstDocuments2 = (datapro.eibs.beans.JBListRec) ses.getAttribute("lstDocuments");
		
		try {
			lstDocuments = new datapro.eibs.beans.JBObjList();
			ses.setAttribute("lstDocuments", lstDocuments);
			int docIni = 0;
			int docFin = 0;
			int docFreq = 0;
			int docMatDateMonth = 0;
			int docMatDateDay = 0;
			int docMatDateYear = 0;
			String oriAmount = "";
			String docAmount = "";
			String docRate = "";
			String docAutDebitAcc = "";
			String docChgTyp = "";
			String docFreqTyp = "";
			String docInstCob = "";
			String action = "";
			String autgen = "N";
			docRate = userPO.getHeader19();
			try {
				action = req.getParameter("ACTION");
				if (action == null)
					action = "";
				autgen = req.getParameter("AUTGEN");
				if (autgen == null)
					autgen = "N";
			} catch (Exception ex) {
				action = "";
				autgen = "N";
			}
			if (action.equals("")) {
				if (autgen.trim().equals("Y")) {
					
					try {
						dftAcceptor = (EDL080003Message) ses.getAttribute("dftAcceptor");
						int year = Integer.parseInt(dftAcceptor.getE03LNEMAY());
						int month = Integer.parseInt(dftAcceptor.getE03LNEMAM());
						int day = Integer.parseInt(dftAcceptor.getE03LNEMAD());
						lneMat.set(year, --month, day, 0, 0, 0);
						lneAmt = dftAcceptor.getBigDecimalE03LNEAVL();
						lneAvl = dftAcceptor.getBigDecimalE03LNEAVL();

					} catch (Exception e) {
						
					}
					try {
						docIni =
							Integer.parseInt(req.getParameter("DFTINIDOC"));
						dftAcceptor.setE03INIDOC(docIni + "");
					} catch (Exception e) {
						docIni = 0;
					}
					try {
						docFin =
							Integer.parseInt(req.getParameter("DFTFINDOC"));
						dftAcceptor.setE03FINDOC(docFin + "");
					} catch (Exception e) {
						docFin = 0;
					}
					try {
						docFreq =
							Integer.parseInt(req.getParameter("DFTFRECUENCY"));
						dftAcceptor.setE03FRECUE(docFreq + "");
					} catch (Exception e) {
						docFreq = 0;
					}
					//type of frecuency : D - days , M - Months , Y - Years
					try {
						docFreqTyp = req.getParameter("INDFREC");
						dftAcceptor.setE03FRECOD(docFreqTyp);
					} catch (Exception e) {
						docFreqTyp = " ";
					}
 
					try {
						oriAmount = req.getParameter("ORIAMOUNT");
						dftAcceptor.setE03AMTNEG(oriAmount);
					} catch (Exception ex) {
						oriAmount = "";
					}
					try {
						docAmount = req.getParameter("DFTAMOUNT");
						dftAcceptor.setE03AMOUNT(docAmount);
					} catch (Exception ex) {
						docAmount = "";
					}
					try {
						docRate = req.getParameter("DFTRATE");
						dftAcceptor.setE03DFTRTE(docRate);
					} catch (Exception ex) {
						docRate = userPO.getHeader19();
					}
					try {
						docAutDebitAcc = req.getParameter("DFTAUTDEBACCT");
						dftAcceptor.setE03DEBAUT(docAutDebitAcc);
					} catch (Exception ex) {
						docAutDebitAcc = "";
					}
					try {
						docChgTyp = req.getParameter("DFTCHGTYP");
						dftAcceptor.setE03CHGTYP(docChgTyp);
					} catch (Exception ex) {
						docChgTyp = " ";
					}
					docMatDateYear = Util.parseInt(req.getParameter("DFTDTMAT1"));
					docMatDateMonth = Util.parseInt(req.getParameter("DFTDTMAT2"));
					docMatDateDay = Util.parseInt(req.getParameter("DFTDTMAT3"));
					dftAcceptor.setE03DTMATD(docMatDateDay + "");
					dftAcceptor.setE03DTMATM(docMatDateMonth + "");
					dftAcceptor.setE03DTMATY(docMatDateYear + "");
					
					String myFlag = "";
					boolean endDocs = false;
					int seq = docIni;
					Calendar dateini = Calendar.getInstance();
					Calendar datetmp = Calendar.getInstance();
					dateini.set(
						docMatDateYear,
						--docMatDateMonth,
						docMatDateDay,0,0,0);
					datetmp = dateini;
					while (!endDocs) {
						EDL080002Message doc = new EDL080002Message();
						doc.setE02DLDNDR(String.valueOf(seq++));
						doc.setE02DLDOAM(oriAmount);
						doc.setE02DLDFAM(docAmount);
						doc.setE02DLDARC(docRate);
						doc.setE02DLDACC(docAutDebitAcc);
						doc.setE02DLDEXT(docChgTyp);
						doc.setE02DLDMAM(""+(datetmp.get(Calendar.MONTH) + 1));
						doc.setE02DLDMAD(""+datetmp.get(Calendar.DATE));
						doc.setE02DLDMAY(""+datetmp.get(Calendar.YEAR));
						// add frecuency of documents
						lneAvl = lneAvl.subtract(new BigDecimal(docAmount));
						if (lneAvl.compareTo(BigDecimal.ZERO) < 0 && !dftAcceptor.getE03DLDCMN().equals("9999")) {
							IsNotError = false;
							msgError = new datapro.eibs.beans.ELEERRMessage();
							msgError.setERRNUM(msgError.getBigDecimalERRNUM().add(BigDecimal.ONE));
							userPO.setHeader9("Y");
							++numError;
							switch (numError) {
								case 1 :
									msgError.setERNU01("0063");
									msgError.setERDS01("Documento Sobregira la Linea de Credito");
									break;
								case 2 :
									msgError.setERNU01("0063");
									msgError.setERDS01("Documento Sobregira la Linea de Credito");
									break;
							}
						}
						if (datetmp.after(lneMat) && !dftAcceptor.getE03DLDCMN().equals("9999")) {
							IsNotError = false;
							msgError = new datapro.eibs.beans.ELEERRMessage();
							msgError.setERRNUM(msgError.getBigDecimalERRNUM().add(BigDecimal.ONE));
							userPO.setHeader9("Y");
							++numError;
							switch (numError) {
							case 1 :
								msgError.setERNU01("0062");
								msgError.setERDS01("Vencimiento del Documento Mayor al de la Linea de Credito");
								break;
							case 2 :
								msgError.setERNU01("0062");
								msgError.setERDS01("Vencimiento del Documento Mayor al de la Linea de Credito");
								break;
						}
						}
						
						// validar monto y fecha
						if (docFreqTyp.equals("D"))
							dateini.add(Calendar.DATE, docFreq);
						if (docFreqTyp.equals("M"))
							dateini.add(Calendar.MONTH, docFreq);
						if (docFreqTyp.equals("Y"))
							dateini.add(Calendar.YEAR, docFreq);
						datetmp = dateini;
						// repeat while date is holiday
						// no more than 5 times
						int numTimes = 0;
						lstDocuments.addRow(doc);
						if (seq == docFin + 1)
							endDocs = true;
						
					}
					ses.setAttribute("lstDocuments", lstDocuments);
					ses.setAttribute("UserPO",userPO);
					ses.setAttribute("error", msgError);
					if (IsNotError) {
						callPage(
							LangPath + "EDL0800_dft_acceptor_docs_detail.jsp",
							req,
							res);
					} else {
						callPage(
							LangPath + "EDL0800_dft_acceptor_docs.jsp",
							req,
							res);
					}
				} else {
					EDL080002Message doc = new EDL080002Message();
					doc.setE02DLDNDR("1");
					doc.setE02DLDARC(docRate);

					lstDocuments.addRow(doc);
					ses.setAttribute("lstDocuments", lstDocuments);
					callPage(
						LangPath + "EDL0800_dft_acceptor_docs_detail.jsp",
						req,
						res);
				}
			} else {
				//ses.setAttribute("lstDocuments", lstDocuments2);
				
				procMaintDocs(mc, user, req, res, ses);
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	protected boolean procValidDate(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses,
		String month,
		String day,
		String year) {
		boolean retVal = true;
		MessageRecord newmessage = null;

		ESD000015Message msgValDate = null;
		ELEERRMessage msgError = null;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
		try {
			msgValDate = new datapro.eibs.beans.ESD000015Message();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
		try {
			msgValDate = (ESD000015Message) mc.getMessageRecord("ESD000015");
			msgValDate.setH15USERID(user.getH01USR());
			msgValDate.setH15PROGRM("ESD0000");
			msgValDate.setH15TIMSYS(getTimeStamp());
			msgValDate.setH15SCRCOD("01");
			msgValDate.setH15OPECOD("0001");

			if (user.getE01DTF().equals("MDY")) {
				msgValDate.setE15HOLDTM(month);
				msgValDate.setE15HOLDTD(day);
				msgValDate.setE15HOLDTY(year);
			}
			if (user.getE01DTF().equals("DMY")) {
				msgValDate.setE15HOLDTD(day);
				msgValDate.setE15HOLDTM(month);
				msgValDate.setE15HOLDTY(year);
			}
			if (user.getE01DTF().equals("YMD")) {
				msgValDate.setE15HOLDTY(year);
				msgValDate.setE15HOLDTM(month);
				msgValDate.setE15HOLDTD(day);
			}
			msgValDate.send();
			msgValDate.destroy();
			flexLog("ESD000015 Message Sent");

			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				boolean IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				msgError.setERRNUM("0");
				showERROR(msgError);
			} else {
				flexLog("Message " + newmessage.getFormatName() + " received.");
				msgValDate = (ESD000015Message) newmessage;
				if (msgValDate.getE15HOLFLG().equals("Y")) {
					retVal = false;
				} else {
					retVal = true;
				}
			}

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		return retVal;
	}

	protected void procMaintDocs(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses) {
		String action = "";
		int numdocs = 0;
		JBObjList lstDocuments = null;
		EDL080002Message dftDocument = null;
		ELEERRMessage msgError = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		try {
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			lstDocuments = (datapro.eibs.beans.JBObjList) ses.getAttribute("lstDocuments");
			action = req.getParameter("ACTION");
			//delete documents
			numdocs = Util.parseInt(req.getParameter("NUMRECORDS"));
			
			String checked = "";
			String numActualSeq = "";
			String numSeq = "";
			for (int i = 0; i < numdocs; i++) {
				numActualSeq = req.getParameter("E02DLDNDR" + i);
				numSeq = req.getParameter("CURSEQ" + i);
				checked = req.getParameter("NUMSEQ" + i);

				dftDocument = (EDL080002Message) mc.getMessageRecord("EDL080002");
				setMessageRecord(req, dftDocument, i);				
				dftDocument.setH02USERID(user.getH01USR());
				dftDocument.setH02PROGRM("EDL0800");
				dftDocument.setH02TIMSYS(getTimeStamp());
				dftDocument.setH02SCRCOD("01");
				dftDocument.setE02DLDNLN(userPO.getIdentifier());
				dftDocument.setE02DLDDID(req.getParameter("E03NUMIDE"));
				if (action.equals("0")) {
					dftDocument.setH02OPECOD("0005");
				} else {
					dftDocument.setH02OPECOD("0009");
				}
				if (action.equals("D")) {
					dftDocument.setE02DLDNDR("999999999");
				} else {
					dftDocument.setE02DLDNDR(numSeq);					
				}
				if (action.equals("D")) {
					//	if (!numActualSeq.trim().equals(numSeq.trim())) {
					if (checked == null	&& numActualSeq.trim().equals(numSeq.trim())){
						lstDocuments.addRow(dftDocument);
					}
				} else {
					lstDocuments.addRow(dftDocument);
				}
				
				if (msgError.getBigDecimalERRNUM().intValue() == 0) {
					dftDocument.send();
					//dftDocument.destroy();
					flexLog("EDL080002 Message Sent");
					
					newmessage = mc.receiveMessage();
					flexLog("Message " + newmessage.getFormatName() + " received.");
					if (newmessage.getFormatName().equals("ELEERR")) {
						msgError = (ELEERRMessage) newmessage;
						showERROR(msgError);
						newmessage = mc.receiveMessage();
					} 
				}
			}
	
			if (msgError.getBigDecimalERRNUM().intValue() > 0) {
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				out.println("<HTML>");
				out.println("<HEAD>");
				out.println("<TITLE>Close</TITLE>");
				out.println("</HEAD>");
				out.println("<BODY>");
				out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
				out.println(
					"		top.opener.document.forms[0].SCREEN.value = 400");
				out.println(
					"		top.opener.document.forms[0].E01DEAACC.value = "
						+ userPO.getIdentifier());
				out.println(
					"		top.opener.document.forms[0].submit();");
				out.println("		top.close();");
				out.println("</SCRIPT>");
				out.println("<P>Close it!!!</P>");
				out.println("</BODY>");
				out.println("</HTML>");
				out.close();
			} else {
				ses.setAttribute("error", msgError);
				ses.setAttribute("lstDocuments", lstDocuments);
				callPage(
					LangPath + "EDL0800_dft_acceptor_docs_detail.jsp",
					req,
					res);
			}
		} catch (Exception ex) {
			flexLog("Error: " + ex);
			ex.printStackTrace();
		}
	}

	protected void procReqInqAppDraft(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		EDL080001Message dftBasic = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("APPROVAL_INQ");
		userPO.setOption("DFT");

		// Send Initial data
		try {
			dftBasic = (EDL080001Message) mc.getMessageRecord("EDL080001");
			dftBasic.setH01USERID(user.getH01USR());
			dftBasic.setH01PROGRM("EDL0800");
			dftBasic.setH01TIMSYS(getTimeStamp());
			dftBasic.setH01SCRCOD("01");
			dftBasic.setH01OPECOD("0002");
			dftBasic.setE01DEAACD("10");
			try {
				dftBasic.setE01DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
			}
			try {
				dftBasic.setH01FLGWK2(req.getParameter("H01FLGWK2"));
			} catch (Exception e) {
			}
			dftBasic.send();
			dftBasic.destroy();
			flexLog("EDL080001 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		try {
			if (procRecMaintData(mc,
				user,
				req,
				res,
				ses)) { // There are no errors
				try {
					flexLog(
						"About to redirect : "
							+ LangPath
							+ "EDL0800_dft_basic.jsp");
					res.sendRedirect(
						super.srctx
							+ "/servlet/datapro.eibs.products.JSEDL0800?SCREEN=1700&REQFLG=3&E01DEAACC="
							+ req.getParameter("E01DEAACC"));
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else { // There are errors
				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "EDL0800_dft_enter_maint.jsp");
					callPage(
						LangPath + "EDL0800_dft_enter_maint.jsp",
						req,
						res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	protected void procReqInquiryDraft(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos userPO = null;

		try {

			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = new datapro.eibs.beans.UserPos();
			userPO.setOption("DFT");
			userPO.setSource("FACT");
			userPO.setPurpose("INQUIRY");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		try {
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDL0800_dft_enter_inq.jsp");
			callPage(LangPath + "EDL0800_dft_enter_inq.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}

	protected void procActionInquiryDraft(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL080001Message dftBasic = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			dftBasic = (EDL080001Message) mc.getMessageRecord("EDL080001");
			dftBasic.setH01USERID(user.getH01USR());
			dftBasic.setH01PROGRM("EDL0800");
			dftBasic.setH01TIMSYS(getTimeStamp());
			dftBasic.setH01SCRCOD("01");
			dftBasic.setH01OPECOD("0004");
			dftBasic.setE01DEAACD("10");
			
			String Acc = req.getParameter("E01DEAACC");
			
			if (Acc==null) {
				dftBasic.setE01DEAACC(userPO.getIdentifier());

			}
			else
			{
			dftBasic.setE01DEAACC(Acc);
			userPO.setIdentifier(dftBasic.getE01DEAACC());
			}

		
		try {
			dftBasic.setH01FLGWK2(req.getParameter("H01FLGWK2"));
		} catch (Exception e) {
		}

		dftBasic.send();
		dftBasic.destroy();
		flexLog("EDL080001 Message Sent");
	} catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e);
		throw new RuntimeException("Socket Communication Error");
	}

	try {
		if (procRecMaintData(mc, user, req, res, ses)) { // There are no errors
			try {
				flexLog(
					"About to redirect : "
						+ LangPath
						+ "EDL0800_dft_basic.jsp");
				res.sendRedirect(
					super.srctx
						+ "/servlet/datapro.eibs.products.JSEDL0800?SCREEN=1700&REQFLG=2&E01DEAACC="
						+ userPO.getIdentifier());
				//flexLog("About to call Page: " + LangPath + "EDL0800_dft_inq_basic.jsp");
				//callPage(LangPath + "EDL0800_dft_inq_basic.jsp", req, res);

			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}
		} else { // There are errors
			try {
				flexLog(
					"About to call Page: "
						+ LangPath
						+ "EDL0800_dft_enter_inq.jsp");
				callPage(LangPath + "EDL0800_dft_enter_inq.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e);
		throw new RuntimeException("Socket Communication Error");
	}

}

protected void procReqDocDet(
	MessageContext mc,
	ESS0030DSMessage user,
	HttpServletRequest req,
	HttpServletResponse res,
	HttpSession ses)
	throws ServletException, IOException {

	MessageRecord newmessage = null;

	EDL080002Message dftDocument = null;

	UserPos userPO = null;
	boolean IsNotError = false;
	try {
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		dftDocument = (EDL080002Message) mc.getMessageRecord("EDL080002");
		dftDocument.setH02USERID(user.getH01USR());
		dftDocument.setH02PROGRM("EDL0800");
		dftDocument.setH02TIMSYS(getTimeStamp());
		dftDocument.setH02SCRCOD("01");
		dftDocument.setH02OPECOD("0015");
		try {
			dftDocument.setE02DLDNLN(req.getParameter("E01DEAACC"));
		}
		catch (Exception e) {
			dftDocument.setE02DLDNLN(userPO.getIdentifier());
		}
		String man = "";
		try 
		{
			//dftDocument.setH02SCRCOD(req.getParameter("E03CUMNST"));
			man = req.getParameter("E03CUMNST");
		} catch (Exception e)
		{

		}
		mc.sendMessage(dftDocument);
		//dftDocument.destroy();
		flexLog("EDL080002 Message Sent");

		if (procRecMaintData(mc, user, req, res, ses)) { // There are no errors
			if (req.getParameter("REQFLG").equals("1")) {
				flexLog(
					"About to call Page: "
						+ LangPath
						+ "EDL0800_dft_basic.jsp");
				callPage(LangPath + "EDL0800_dft_basic.jsp", req, res);
			} else if (req.getParameter("REQFLG").equals("2")) {
				userPO.setPurpose("INQUIRY");
				ses.setAttribute("userPO", userPO);
				flexLog(
					"About to call Page: "
						+ LangPath
						+ "EDL0800_dft_inq_basic.jsp");
				callPage(LangPath + "EDL0800_dft_inq_basic.jsp", req, res);
			} else if (req.getParameter("REQFLG").equals("3")) {
				userPO.setPurpose("APPROVAL");
				flexLog(
					"About to call Page: "
						+ LangPath
						+ "EDL0800_dft_ap_basic.jsp");
				callPage(LangPath + "EDL0800_dft_ap_basic.jsp", req, res);
			}
		} else { // There are errors
			try {
				flexLog(
					"About to call Page: "
						+ LangPath
						+ "EDL0800_dft_enter_maint.jsp");
				callPage(LangPath + "EDL0800_dft_enter_maint.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e);
		throw new RuntimeException("Socket Communication Error");
	}

}

protected EDL080002Message addDoc(ESS0030DSMessage user, EDL080002Message doc, 
		HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		EDL080001Message dftBasic = (EDL080001Message) session.getAttribute("dftBasic");
		EDL080003Message dftAcceptor = (EDL080003Message) session.getAttribute("dftAcceptor");
		
		doc.setE02DLDARC(dftBasic.getE01DEARTE());
		doc.setE02DLDNLN(dftBasic.getE01DEAACC());
		doc.setE02DLDDTP(dftBasic.getE01DEARET());
		doc.setE02DLDDID(dftAcceptor.getE03NUMIDE().trim());
		doc.setE02DLDNME(dftAcceptor.getE03CUMMA1().trim());
		
		return doc;
}

protected void procReqDocBasic(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
	try {
		JBObjList list =  (JBObjList) ses.getAttribute("lstDocuments");
		boolean add = "true".equals(req.getParameter("ADD"));
		
		if (add) {
			EDL080002Message doc = new EDL080002Message();
			if (list.isEmpty()) {
				doc.setE02DLDNDR("1");
			} else {
				BigDecimal lastSequence = (((EDL080002Message) list.get(list.size()-1)).getBigDecimalE02DLDNDR());
				doc.setE02DLDNDR(lastSequence.add(new BigDecimal("1")));
				doc = addDoc(user, doc, req, res, ses);
			}
			try {
				doc.setE02AVLAMT(req.getParameter("LNEAVL"));
			} catch(Exception e) {
				
			}
			list.add(doc);
			ses.setAttribute("dftDoc", doc);
		}
		callPage(LangPath + "EDL0800_dft_acceptor_doc_basic.jsp", req, res);
	} catch (Exception e) {
		flexLog("Exception calling page " + e);
	}
	
}

protected void procActDocBasic(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
	ELEERRMessage msgError = new ELEERRMessage();
	ses.setAttribute("error", msgError);
	
	JBObjList list =  (JBObjList) ses.getAttribute("lstDocuments");
	EDL080002Message dftDoc = (EDL080002Message) list.get(list.size() - 1);
	setMessageRecord(req, dftDoc);
	printClose(res.getWriter());
}

protected void procReqDocList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
	try {
		JBObjList list =  (JBObjList) ses.getAttribute("lstDocuments");
		EDL080002Message doc = (EDL080002Message) list.get(Util.parseInt(req.getParameter("ROW")));
		ses.setAttribute("dftDoc", doc);
		callPage(LangPath + "EDL0800_dft_acceptor_doc_basic.jsp", req, res);
	} catch (Exception e) {
		flexLog("Exception calling page " + e);
	}
	
}

protected void procActDocList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
	try {
		UserPos userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		ELEERRMessage msgError = new ELEERRMessage();
		//Previous list
		JBObjList oldList =  (JBObjList) ses.getAttribute("oldDocuments");
		if (oldList == null) {
			oldList =  (JBObjList) ses.getAttribute("lstDocuments");
			ses.setAttribute("oldDocuments", oldList);
		}
		//Current dynamic list on page
		BeanDynaTable dynaList = new BeanDynaTable();
		dynaList.setKeyField("E02DLDNDR");
		dynaList.retrieveDyntableFields(req, "dtf_", EDL080002Message.class);
		ses.setAttribute("lstDocuments", dynaList);
		
		//List to be submitted
		List subList = new JBObjList();
		subList.addAll(dynaList);
		
		oldList.initRow();
		while (oldList.getNextRow()) {
			EDL080002Message oldDocument = (EDL080002Message) oldList.getRecord();
			if (!dynaList.getKeyMap().containsKey(oldDocument.getE02DLDNDR())) {
				oldDocument.setH02OPECOD("0011");
				subList.add(oldDocument);
			}

		}
		subList = Util.sortByField(subList, "E02DLDNDR");
		String man = "";
		String credLine = "";
		try 
		{
			man = req.getParameter("E03CUMMAN");
		} catch (Exception e)
		{
			 man = "";
		}
		try 
		{
			credLine = req.getParameter("E03DLDCMN");
		} catch (Exception e)
		{
			 credLine = "";
		}
		Iterator it = subList.listIterator();
		while (it.hasNext()) {
			EDL080002Message dftDocument = (EDL080002Message) it.next();
			addDoc(user, dftDocument, req, res, ses);
			dftDocument.setH02USERID(user.getH01USR());
			dftDocument.setH02PROGRM("EDL0800");
			dftDocument.setH02TIMSYS(getTimeStamp());
			dftDocument.setH02SCRCOD("01");
			if (dftDocument.getH02OPECOD().equals("")) {
				dftDocument.setH02OPECOD("0005");	
			}
			dftDocument.setE02CUMMAN(man);
			dftDocument.setE02DLDCMN(credLine);
			mc.sendMessage(dftDocument);
			MessageRecord newmessage = mc.receiveMessage();
			
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
			}
			if (!dftDocument.getH02OPECOD().equals("0011")) {
				newmessage = mc.receiveMessage();
			}
			if (msgError.getBigDecimalERRNUM().intValue() > 0) {
				showERROR(msgError);
				ses.setAttribute("error", msgError);
				callPage(LangPath + "EDL0800_dft_acceptor_docs_detail.jsp", req, res);
				return;
			}
		}
		
		ses.removeAttribute("oldDocuments");
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>Close</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
		out.println(
			"		top.opener.document.forms[0].SCREEN.value = 400");
		out.println(
			"		top.opener.document.forms[0].E01DEAACC.value = "
				+ userPO.getIdentifier());
		out.println(
			"		top.opener.document.forms[0].submit();");
		out.println("		top.close();");
		out.println("</SCRIPT>");
		out.println("<P>Close it!!!</P>");
		out.println("</BODY>");
		out.println("</HTML>");
		out.close();
	
	} catch (Exception e) {
		e.printStackTrace();
		throw new ServletException(e);
	} 

}

}
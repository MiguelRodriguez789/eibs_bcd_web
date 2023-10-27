package datapro.eibs.accounting;

/**
 * Consulta consolidada de cuentas contables
 * Creation date: (06/20/2012 6:08:55 PM)
 * @author: CSepulveda
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EGL075501Message;
import datapro.eibs.beans.EGL075502Message;
import datapro.eibs.beans.EGL075503Message;
import datapro.eibs.beans.EGL075504Message;
import datapro.eibs.beans.EGL075505Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEGL0755 extends JSEIBSServlet {

	protected static final int R_TRANSACTIONS	= 1;
	protected static final int R_FORWARD 		= 2;
	protected static final int R_OPTION 		= 3;
	protected static final int R_LIST 			= 4;
	protected static final int R_AVERAGE 		= 300;
	protected static final int R_BUDGET 		= 200;
	protected static final int R_BALANCE 		= 400;
	protected static final int R_ENTER_ACCOUNT 	= 100;


	/**
	 * procReqEnterAccount
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqEnterAccount(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		ELEERRMessage msgError = new datapro.eibs.beans.ELEERRMessage();
		UserPos userPO = new datapro.eibs.beans.UserPos();
		userPO.setOption("ACCOUNTS");
		userPO.setPurpose("INQUIRY");
		ses.setAttribute("error", msgError);
		ses.setAttribute("userPO", userPO);

		try {
			forward("EGL0755_inq_enter.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}
	}

	/**
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqForward(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException,
			IOException {
		// If the account is entered in the first page we go directly to the
		// balances inquiry if not
		// we show the accounts list
		if (req.getParameter("E01GLBGLN") != null
				&& !req.getParameter("E01GLBGLN").trim().equals("")) {
			// Go directly to the balances inquiry
			procReqBalancesInquiry(user, req, res, ses);
		} else {
			// Goes to the list of accounts
			procReqAccountsList(user, req, res, ses);
		}
	}

	/**
	 * procReqAccountsList 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqAccountsList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		EGL075502Message msgSearchList = null;
		ELEERRMessage msgError = new datapro.eibs.beans.ELEERRMessage();
		JBObjList beanList = null;
		UserPos userPO = (UserPos)ses.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EGL0755", req);

			msgSearchList = (EGL075502Message) mp.getMessageRecord("EGL075502");
			msgSearchList.setH02USERID(user.getH01USR());
			msgSearchList.setH02PROGRM("EGL0755");
			msgSearchList.setH02TIMSYS(getTimeStamp());
			msgSearchList.setH02SCRCOD("01");
			msgSearchList.setH02OPECOD("0004");
			
			if (req.getParameter("E01GLBBNK")!= null){
				msgSearchList.setE02SELBNK(req.getParameter("E01GLBBNK"));
				msgSearchList.setE02SELCCY(req.getParameter("E01GLBCCY"));
				msgSearchList.setE02GLBNIV(req.getParameter("E01GLBNIV"));
				userPO.setBank(msgSearchList.getE02SELBNK());
				userPO.setCurrency(msgSearchList.getE02SELCCY());
				userPO.setIdentifier(msgSearchList.getE02GLBNIV());
			} else {
				msgSearchList.setE02SELBNK(userPO.getBank());
				msgSearchList.setE02SELCCY(userPO.getCurrency());
				msgSearchList.setE02GLBNIV(userPO.getIdentifier());
			}
			
			String fromRecord = req.getParameter("Pos")==null?"0":req.getParameter("Pos");
			msgSearchList.setE02NUMREC(fromRecord);

			mp.sendMessage(msgSearchList);
			
			// Receive Data
			beanList = mp.receiveMessageRecordList("E02INDOPE", "E02NUMREC");

			if (mp.hasError(beanList)) {
				msgError = (ELEERRMessage) mp.getError(beanList);
				ses.setAttribute("error", msgError);
				forward("EGL0755_inq_enter.jsp", req, res);

			} else {
				ses.setAttribute("cifList", beanList);
				forward("EGL0755_inq_list.jsp", req, res);
			}

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			mp.close();
		}

	}

	/**
	 * procReqBalancesInquiry
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqBalancesInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageRecord newmessage = null;
		MessageProcessor mp = null;
		EGL075501Message msgSearch = null;
		ELEERRMessage msgError = new datapro.eibs.beans.ELEERRMessage();
		UserPos userPO = ses.getAttribute("userPO")==null?new UserPos():(UserPos)ses.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EGL0755", req);

			msgSearch = (EGL075501Message) mp.getMessageRecord("EGL075501");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EGL0755");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");
			
			if (req.getParameter("option")!= null && req.getParameter("option").equals("BP")){
				//if the inquiry comes from the options menu
				msgSearch.setE01GLBBNK(userPO.getBank());//Banco
				msgSearch.setE01GLBCCY(userPO.getCurrency());//Moneda
				msgSearch.setE01GLBGLN(userPO.getGenLedger());//Cuenta Contable
				msgSearch.setE01GLBNIV(userPO.getIdentifier());//Nivel
			} else {
				//if the inquiry comes from the entry page
				if (req.getParameter("E01GLBBNK") != null){
					msgSearch.setE01GLBBNK(req.getParameter("E01GLBBNK"));
					msgSearch.setE01GLBCCY(req.getParameter("E01GLBCCY"));
					msgSearch.setE01GLBGLN(req.getParameter("E01GLBGLN"));
					msgSearch.setE01GLBNIV(req.getParameter("E01GLBNIV"));		
					
				} else {
					//if the inquiry comes from the list
					int index = req.getParameter("index")==null?0:Integer.parseInt(req.getParameter("index"));
					JBObjList oldList = (JBObjList)ses.getAttribute("cifList");
					EGL075502Message oldMsg = (EGL075502Message)oldList.get(index);
					
					msgSearch.setE01GLBBNK(oldMsg.getE02SELBNK());
					msgSearch.setE01GLBCCY(oldMsg.getE02GLBCCY());
					msgSearch.setE01GLBGLN(oldMsg.getE02GLBGLN());
					msgSearch.setE01GLBNIV(oldMsg.getE02GLBNIV());				
				}
				
				userPO.setBank(msgSearch.getE01GLBBNK());//Banco
				userPO.setCurrency(msgSearch.getE01GLBCCY());//Moneda
				userPO.setGenLedger(msgSearch.getE01GLBGLN());//Cuenta Contable
				userPO.setIdentifier(msgSearch.getE01GLBNIV());//Nivel
			}
			
			//Send Message
			mp.sendMessage(msgSearch);
			flexLog("EGL075503 Message Sent");


			// Receive Data
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				forward("EGL0755_inq_enter.jsp", req, res);
			} else {
				msgSearch = (EGL075501Message) mp.receiveMessageRecord();
				ses.setAttribute("balance", msgSearch);
				forward("EGL0755_inq_balances.jsp", req, res);				
			}


		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			mp.close();
		}

	}
	
	/**
	 * procReqTransctionsInquiry
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqTransctionsInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageRecord newmessage = null;
		MessageProcessor mp = null;
		EGL075505Message msgSearch = null;
		ELEERRMessage msgError = new datapro.eibs.beans.ELEERRMessage();
		UserPos userPO = ses.getAttribute("userPO")==null?new UserPos():(UserPos)ses.getAttribute("userPO");
		JBObjList list = new JBObjList();

		// Send Initial data
		try {
			mp = getMessageProcessor("EGL0755", req);

			msgSearch = (EGL075505Message) mp.getMessageRecord("EGL075505");
			msgSearch.setH05USERID(user.getH01USR());
			msgSearch.setH05PROGRM("EGL0755");
			msgSearch.setH05TIMSYS(getTimeStamp());
			msgSearch.setH05SCRCOD("01");
			msgSearch.setH05OPECOD("0004");
			
			//if inquiry comes from search page
			if (req.getParameter("opt")!=null && req.getParameter("opt").equals("2")){
				int index = req.getParameter("index")==null?0:Integer.parseInt(req.getParameter("index"));
				JBObjList oldList = (JBObjList)ses.getAttribute("cifList");
				EGL075502Message oldMsg = (EGL075502Message)oldList.get(index);
				
				userPO.setBank(oldMsg.getE02SELBNK());
				userPO.setCurrency(oldMsg.getE02GLBCCY());
				userPO.setGenLedger(oldMsg.getE02GLBGLN());
				userPO.setIdentifier(oldMsg.getE02GLBNIV());
				userPO.setCusName(oldMsg.getE02GLMDSC());
				userPO.setHeader7(req.getParameter("E01HISCYC"));
				userPO.setHeader9(req.getParameter("E01FRDTE1"));
				userPO.setHeader10(req.getParameter("E01FRDTE2"));
				userPO.setHeader11(req.getParameter("E01FRDTE3"));
				userPO.setHeader12(req.getParameter("E01TODTE1"));
				userPO.setHeader13(req.getParameter("E01TODTE2"));
				userPO.setHeader14(req.getParameter("E01TODTE3"));
			}
			
			//Setting the search values in the message
			msgSearch.setE05SELBNK(userPO.getBank());//Banco
			msgSearch.setE05SELCCY(userPO.getCurrency());//Moneda
			msgSearch.setE05SELGLN(userPO.getGenLedger());//Cuenta Contable
			msgSearch.setE05SELHMO(userPO.getHeader7());//Tipo de Busqueda (M) Mensual - (H) Historico
			msgSearch.setE05FRMDT1(userPO.getHeader9());//Fecha desde
			msgSearch.setE05FRMDT2(userPO.getHeader10());//Fecha desde
			msgSearch.setE05FRMDT3(userPO.getHeader11());//Fecha desde
			msgSearch.setE05TODTE1(userPO.getHeader12());//Fecha hasta
			msgSearch.setE05TODTE2(userPO.getHeader13());//Fecha hasta
			msgSearch.setE05TODTE3(userPO.getHeader14());//Fecha hasta
			
			String fromRecord = req.getParameter("Pos")==null?"0":req.getParameter("Pos");
			msgSearch.setE05NUMREC(fromRecord);
			
			//Send Message
			mp.sendMessage(msgSearch);
			flexLog("EGL075505 Message Sent");


			// Receive Data
			list = mp.receiveMessageRecordList("E05INDOPE", "E05NUMREC");
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				ses.setAttribute("error", msgError);
				forward("EGL0755_inq_enter.jsp", req, res);
			} else {
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("glList", list);
				forward("EGL0755_inq_transac_list.jsp", req, res);				
			}


		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			mp.close();
		}

	}
	
	/**
	 * procReqAverageInquiry
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqAverageInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageRecord newmessage = null;
		MessageProcessor mp = null;
		EGL075503Message msgSearch = null;
		ELEERRMessage msgError = new datapro.eibs.beans.ELEERRMessage();
		UserPos userPO = ses.getAttribute("userPO")==null?new UserPos():(UserPos)ses.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EGL0755", req);

			msgSearch = (EGL075503Message) mp.getMessageRecord("EGL075503");
			msgSearch.setH03USERID(user.getH01USR());
			msgSearch.setH03PROGRM("EGL0755");
			msgSearch.setH03TIMSYS(getTimeStamp());
			msgSearch.setH03SCRCOD("01");
			msgSearch.setH03OPECOD("0004");
			
			if (req.getParameter("option")!= null && req.getParameter("option").equals("AV")){
				//if the inquiry comes from the options menu
				msgSearch.setE03GLBBNK(userPO.getBank());//Banco
				msgSearch.setE03GLBCCY(userPO.getCurrency());//Moneda
				msgSearch.setE03GLBGLN(userPO.getGenLedger());//Cuenta Contable
				msgSearch.setE03GLBNIV(userPO.getIdentifier());//Nivel
			} else {
				//if the inquiry comes from the list
				int index = req.getParameter("index")==null?0:Integer.parseInt(req.getParameter("index"));
				JBObjList oldList = (JBObjList)ses.getAttribute("cifList");
				EGL075502Message oldMsg = (EGL075502Message)oldList.get(index);
				
				msgSearch.setE03GLBBNK(oldMsg.getE02GLBBNK());
				msgSearch.setE03GLBCCY(oldMsg.getE02GLBCCY());
				msgSearch.setE03GLBGLN(oldMsg.getE02GLBGLN());
				msgSearch.setE03GLBNIV(oldMsg.getE02GLBNIV());				
			
				userPO.setBank(msgSearch.getE03GLBBNK());//Banco
				userPO.setCurrency(msgSearch.getE03GLBCCY());//Moneda
				userPO.setGenLedger(msgSearch.getE03GLBGLN());//Cuenta Contable
				userPO.setIdentifier(msgSearch.getE03GLBNIV());//Nivel
				userPO.setCusName(oldMsg.getE02GLMDSC());
			}
			
			//Send Message
			mp.sendMessage(msgSearch);
			flexLog("EGL075503 Message Sent");


			// Receive Data
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				forward("EGL0755_inq_enter.jsp", req, res);
			} else {
				msgSearch = (EGL075503Message) mp.receiveMessageRecord();
				ses.setAttribute("average", msgSearch);
				forward("EGL0755_inq_average.jsp", req, res);				
			}


		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			mp.close();
		}

	}
	
	/**
	 * Saldos vs presupuesto
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqBudgetInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageRecord newmessage = null;
		MessageProcessor mp = null;
		EGL075504Message msgSearch = null;		
		ELEERRMessage msgError = new datapro.eibs.beans.ELEERRMessage();
		UserPos userPO = ses.getAttribute("userPO")==null?new UserPos():(UserPos)ses.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EGL0755", req);

			msgSearch = (EGL075504Message) mp.getMessageRecord("EGL075504");
			msgSearch.setH04USERID(user.getH01USR());
			msgSearch.setH04PROGRM("EGL0755");
			msgSearch.setH04TIMSYS(getTimeStamp());
			msgSearch.setH04SCRCOD("01");
			msgSearch.setH04OPECOD("0004");
			
			if (req.getParameter("option")!= null && req.getParameter("option").equals("BA")){
				//if the inquiry comes from the options menu
				msgSearch.setE04GLBBNK(userPO.getBank());//Banco
				msgSearch.setE04GLBCCY(userPO.getCurrency());//Moneda
				msgSearch.setE04GLBGLN(userPO.getGenLedger());//Cuenta Contable
				msgSearch.setE04GLBNIV(userPO.getIdentifier());//Nivel
			} else {
				//if the inquiry comes from the list
				int index = req.getParameter("index")==null?0:Integer.parseInt(req.getParameter("index"));
				JBObjList oldList = (JBObjList)ses.getAttribute("cifList");
				EGL075502Message oldMsg = (EGL075502Message)oldList.get(index);
				
				msgSearch.setE04GLBBNK(oldMsg.getE02GLBBNK());
				msgSearch.setE04GLBCCY(oldMsg.getE02GLBCCY());
				msgSearch.setE04GLBGLN(oldMsg.getE02GLBGLN());
				msgSearch.setE04GLBNIV(oldMsg.getE02GLBNIV());	
			}
			mp.sendMessage(msgSearch);
			flexLog("EGL075504 Message Sent");


			// Receive Data
			newmessage = mp.receiveMessageRecord();

			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				forward("EGL0755_inq_enter.jsp", req, res);
			} else {
				msgSearch = (EGL075504Message) mp.receiveMessageRecord();
				ses.setAttribute("balVSbud", msgSearch);
				forward("EGL0755_inq_bal_vs_budget.jsp", req, res);
				
			}


		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		} finally {
			mp.close();
		}

	}

	

	/**
	 * MAIN
	 */
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		// Requests
		case R_ENTER_ACCOUNT:
			procReqEnterAccount(user, req, res, session);
			break;
		case R_FORWARD:
			procReqForward(user, req, res, session);
			break;
		case R_TRANSACTIONS:
			procReqTransctionsInquiry(user, req, res, session);
			break;
		case R_BALANCE:
			procReqBalancesInquiry(user, req, res, session);
			break;
		case R_AVERAGE:
			procReqAverageInquiry(user, req, res, session);
			break;
		case R_BUDGET:
			procReqBudgetInquiry(user, req, res, session);
			break;
		case R_LIST:
			procReqAccountsList(user, req, res, session);
			break;
		default:
			res.sendRedirect(super.srctx + super.devPage);
			break;
		}

	}
}
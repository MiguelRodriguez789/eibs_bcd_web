/*
 * Created on Nov 24, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.products;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ETL051001Message;
import datapro.eibs.beans.ETL051002Message;
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
public class JSETL0510 extends JSEIBSServlet {

	// CIF options
	protected static final int R_LIST 				= 1;
	protected static final int R_DET	 			= 3;
	protected static final int R_STOP				= 5;
	protected static final int R_LIST_STOP			= 6;
	protected static final int R_DET_CHK 			= 7;	

	protected static final int R_LIST_CANCEL		= 10;	
	
	// entering options
	protected static final int R_ENTER 				= 100;
	protected static final int R_CHK 				= 300;
	
	protected static final int A_ENTER 				= 200;
	protected static final int A_CHK 				= 400;
	
	protected static final int R_LIST_HELP 			= 1000;
	
	
	/* (non-Javadoc)
	 * @see datapro.eibs.master.JSEIBSServlet#processRequest(datapro.eibs.beans.ESS0030DSMessage, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpSession, int)
	 */
	protected void processRequest(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session,
		int screen)
		throws ServletException, IOException {

			switch (screen) {
				case R_LIST :
					procReqList(user, req, res, session);
					break;
				case R_DET :
					procReqDocDet(user, req, res, session);
					break;
				case R_DET_CHK :
					procReqChkDet(user, req, res, session);
					break;
					
				//entering options
				case R_ENTER :
					procReqSTEnterSearch(user, req, res, session);
					break;
				case R_CHK :
					procReqOFEnterSearch(user, req, res, session);
					break;
				case R_STOP :
					procReqStopSel(user, req, res, session);
					break;
				case R_LIST_STOP :
					procReqListStop(user, req, res, session);
					break;
				case R_LIST_CANCEL :
					procReqListCancel(user, req, res, session);
					break;
				case R_LIST_HELP :
					procReqListHelp(user, req, res, session);
					break;
	
				case A_ENTER :
					procActionSTEnterSearch(user, req, res, session);
					break;
				case A_CHK :
					procActionOFEnterSearch(user, req, res, session);
					break;
				default :
					forward(devPage, req, res);
					break;
			}
	}
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionOFEnterSearch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos	userPO = getUserPos(req);
		try {
			if (userPO.getOption() == null || userPO.getOption().equals("")){
				userPO.setHeader7("3");
			}
			else if (userPO.getOption().equals("OF")){
				userPO.setHeader7("1");
			} else {
				if (req.getParameter("E01SELDTY") != null 
						&& req.getParameter("E01SELDTY").length() > 0) {
					userPO.setHeader7(req.getParameter("E01SELDTY").toUpperCase());
				}
				userPO.setHeader7(userPO.getOption());
			}
		} catch (Exception e){
			userPO.setHeader7("3");			
		}
		
		try {
			if (req.getParameter("E01SELSCH") == null && userPO.getHeader2().equals(null)) {
				userPO.setHeader2("");
			}
			else
			{
				userPO.setHeader2(req.getParameter("E01SELSCH").toUpperCase());
			}
		} catch (Exception e){
			userPO.setHeader2("T");
		}
		try {
			if (req.getParameter("E01SELNCH") == null) {
				userPO.setHeader3("");
			}
			else
			{
				userPO.setHeader3(req.getParameter("E01SELNCH"));
			}
		} catch (Exception e){
			userPO.setHeader3("");
		}
		try {
			if (req.getParameter("E01SELACC") == null) {
				userPO.setHeader4("");
			}
			else
			{
				userPO.setHeader4(req.getParameter("E01SELACC"));
			}			
		} catch (Exception e){
			userPO.setHeader4("");
		}
		try {
			if (req.getParameter("E01SELBNF") == null) {
				userPO.setHeader5("");
			}
			else
			{
				userPO.setHeader5(req.getParameter("E01SELBNF").toUpperCase());
			}			
		} catch (Exception e){
			userPO.setHeader5("");
		}
		try {
			if (req.getParameter("E01SELAPL") == null) {
				userPO.setHeader6("");
			}
			else
			{
				userPO.setHeader6(req.getParameter("E01SELAPL").toUpperCase());
			}			
		} catch (Exception e){
			userPO.setHeader6("");
		}
		
		//datos nuevos
		try {
			if (req.getParameter("E01SELBNK") == null) {
				userPO.setHeader8("");
			}
			else
			{
				userPO.setHeader8(req.getParameter("E01SELBNK").toUpperCase());
			}			
		} catch (Exception e){
			userPO.setHeader8("");
		}
		try {
			if (req.getParameter("E01SELBRN") == null) {
				userPO.setHeader9("");
			}
			else
			{
				userPO.setHeader9(req.getParameter("E01SELBRN").toUpperCase());
			}			
		} catch (Exception e){
			userPO.setHeader9("");
		}
		try {
			if (req.getParameter("E01SELCCY") == null) {
				userPO.setHeader10("");
			}
			else
			{
				userPO.setHeader10(req.getParameter("E01SELCCY").toUpperCase());
			}			
		} catch (Exception e){
			userPO.setHeader10("");
		}
		
		flexLog("Putting java beans into the session");
		session.setAttribute("userPO", userPO);


		procReqList(user, req, res, session);
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionSTEnterSearch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos	userPO = getUserPos(req);
		try {
			if (req.getParameter("E01SELDTY") == null || req.getParameter("E01SELDTY").equals("")) {
				userPO.setHeader7("3");
			}
			else
			{
			userPO.setHeader7(req.getParameter("E01SELDTY").trim());
			}
		} catch (Exception e){
//			userPO.setHeader1("1"); 
			userPO.setHeader7("3");			
		}
		try {
			if (req.getParameter("E01SELSCH") == null) {
				userPO.setHeader2("");
			}
			else
			{
				userPO.setHeader2(req.getParameter("E01SELSCH").toUpperCase());
			}
		} catch (Exception e){
			userPO.setHeader2("");
		}
		try {
			if (req.getParameter("E01SELNCH") == null) {
				userPO.setHeader3("");
			}
			else
			{
				userPO.setHeader3(req.getParameter("E01SELNCH"));
			}
		} catch (Exception e){
			userPO.setHeader3("");
		}
		try {
			if (req.getParameter("E01SELACC") == null) {
				userPO.setHeader4("");
			}
			else
			{
				userPO.setHeader4(req.getParameter("E01SELACC"));
			}			
		} catch (Exception e){
			userPO.setHeader4("");
		}
		try {
			if (req.getParameter("E01SELBNF") == null) {
				userPO.setHeader5("");
			}
			else
			{
				userPO.setHeader5(req.getParameter("E01SELBNF").toUpperCase());
			}			
		} catch (Exception e){
			userPO.setHeader5("");
		}
		try {
			if (req.getParameter("E01SELAPL") == null) {
				userPO.setHeader6("");
			}
			else
			{
				userPO.setHeader6(req.getParameter("E01SELAPL").toUpperCase());
			}			
		} catch (Exception e){
			userPO.setHeader6("");
		}
		
		flexLog("Putting java beans into the session");
		session.setAttribute("userPO", userPO);

		procReqList(user, req, res, session);
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqListHelp(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String PageToCall = "";
		UserPos	userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ETL0510", req);
			ETL051001Message msg = (ETL051001Message) mp.getMessageRecord("ETL051001", user.getH01USR(), "0004");
			msg.setH01SCRCOD("01");
			msg.setE01OFMBNK(user.getE01UBK());			
			String type = (req.getParameter("E01SELDTY") == null || req.getParameter("E01SELDTY").equals("")) ? "3" : req.getParameter("E01SELDTY");
			msg.setE01SELDTY(type);
			String status = (req.getParameter("E01SELSCH") == null) ? " " : req.getParameter("E01SELSCH"); 	 	
			msg.setE01SELSCH(status);
			String print = ((req.getParameter("H01FLGWK1") == null)) ? "" : req.getParameter("H01FLGWK1");
            msg.setH01FLGWK1(print); // Nuevo parámetro
			String position = (req.getParameter("Pos") == null || req.getParameter("Pos").equals("")) ? "0" : req.getParameter("Pos");
			msg.setE01NUMREC(position);
			String account = (req.getParameter("E01SELACC") == null) ? "" : req.getParameter("E01SELACC");
			msg.setE01SELACC(account);
		
			mp.sendMessage(msg);
		
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			list.initRow();
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) list.getRecord();
				PageToCall = "error_viewer.jsp";
			} else {
				session.setAttribute("dvList", list);
				req.setAttribute("E01SELDTY", type);
				req.setAttribute("E01SELSCH", status);
				PageToCall = "ETL0510_chk_off_help.jsp";
			}
				
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqListCancel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String PageToCall = "";
		UserPos	userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ETL0510", req);
			ETL051001Message msg = (ETL051001Message) mp.getMessageRecord("ETL051001", user.getH01USR(), "0004");
			msg.setH01SCRCOD("01");
			msg.setE01OFMBNK(user.getE01UBK());
//			msg.setE01SELDTY("1");	
			msg.setE01SELDTY("3");				
			msg.setE01SELSCH("D");
			String position = (req.getParameter("Pos") == null) ? "0" : req.getParameter("Pos");
			msg.setE01NUMREC(position);
		
			mp.sendMessage(msg);
			
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			list.initRow();
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) list.getRecord();
				PageToCall = "error_viewer.jsp";
			} else {
				list.initRow();
				JBList beanList = new JBList();
				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				while (list.getNextRow()) {
					msg = (ETL051001Message) list.getRecord();
					marker = msg.getE01INDOPE();
					if (firstTime) {
						firstTime = false;
						position = (msg.getE01NUMREC().equals("")) ? "0" : msg.getE01NUMREC();
						beanList.setFirstRec(Integer.parseInt(position));
					}				
					String showStopOff = "showChkCanDet('" + msg.getE01OFMBNK() + "', '" + msg.getE01OFMBRN() + "', '" + msg.getE01OFMCCY() + "', '" + msg.getE01OFMMCH() + "', '" + msg.getE01OFMNCH() + "')";
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCell(msg.getE01OFMNCH()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCell(msg.getE01OFMCCY()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCell(msg.getE01OFMBRN()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCell(msg.getE01OFMMCH()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCell(msg.getE01OFMSTS()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCustomDate(user.getE01DTF(),msg.getE01OFMIDM(), msg.getE01OFMIDD(), msg.getE01OFMIDY()) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCell(msg.getE01OFMBNF()) + "</A></TD>");
					myRow.append("</TR>");
					beanList.addRow(myFlag, myRow.toString());
				}
				beanList.setShowNext(marker.equals("+"));
				session.setAttribute("dvList", beanList);
				PageToCall = "ETL0510_of_chk_list_cancel.jsp";
			}
				
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqListStop(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String PageToCall = "";
		UserPos	userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ETL0510", req);
			ETL051001Message msg = (ETL051001Message) mp.getMessageRecord("ETL051001", user.getH01USR(), "0004");
			msg.setH01SCRCOD("01");
			msg.setE01OFMBNK(user.getE01UBK());
//			msg.setE01SELDTY("1");
			msg.setE01SELDTY("3");			
			msg.setE01SELSCH("D");
			String position = (req.getParameter("Pos") == null) ? "0" : req.getParameter("Pos");
			msg.setE01NUMREC(position);
			
			mp.sendMessage(msg);
			
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			list.initRow();
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) list.getRecord();
				PageToCall = "error_viewer.jsp";
			} else {
				list.initRow();
				JBList beanList = new JBList();
				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				while (list.getNextRow()) {
					msg = (ETL051001Message) list.getRecord();
					marker = msg.getE01INDOPE();
					if (firstTime) {
						firstTime = false;
						position = (msg.getE01NUMREC().equals("")) ? "0" : msg.getE01NUMREC();
						beanList.setFirstRec(Integer.parseInt(position));
					}				
					String showStopOff = "setChkDet('" + msg.getE01OFMBNK() + "', '" + msg.getE01OFMBRN() + "', '" + msg.getE01OFMCCY() + "', '" + msg.getE01OFMMCH() + "', '" + msg.getE01OFMNCH() + "')";
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCell(msg.getE01OFMNCH()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCell(msg.getE01OFMCCY()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCell(msg.getE01OFMBRN()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCell(msg.getE01OFMMCH()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCell(msg.getE01OFMSTS()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCell(msg.getE01OFMFTY()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCustomDate(user.getE01DTF(),msg.getE01OFMIDM(), msg.getE01OFMIDD(), msg.getE01OFMIDY()) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:" + showStopOff + "\">" + Util.formatCell(msg.getE01OFMBNF()) + "</A></TD>");
					myRow.append("</TR>");
					beanList.addRow(myFlag, myRow.toString());
				}
				beanList.setShowNext(marker.equals("+"));
				session.setAttribute("dvList", beanList);
				PageToCall = "ETL0510_of_chk_list.jsp";
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqStopSel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos	userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		userPO.setOption("OCK");
		userPO.setPurpose("STOP_PAYMENT");
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		forward("EFE01000_off_enter_stop_pay.jsp", req, res);
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqOFEnterSearch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos	userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		//userPO.setOption("OF");
		userPO.setOption(req.getParameter("OPTION") == null ? "OF" : req.getParameter("OPTION"));
		userPO.setPurpose("INQUIRY");
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		session.setAttribute("checkSel", new ETL051001Message());
		session.removeAttribute("checkFilter");
		forward("ETL0510_chk_off_inq_sel_identif.jsp", req, res);
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqSTEnterSearch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos	userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		userPO.setOption("DV");
		userPO.setPurpose("INQUIRY");
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		forward("ETL0510_dv_inq_sel.jsp", req, res);

	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqChkDet(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		ELEERRMessage msgError = new ELEERRMessage();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ETL0510", req);
			ETL051002Message msg = (ETL051002Message) mp.getMessageRecord("ETL051002", user.getH01USR(), "0004");
		
			String bank = (req.getParameter("BNK") == null) ? "01" : req.getParameter("BNK");
			msg.setE02OFMBNK(bank);
			String branch = (req.getParameter("BRN") == null) ? "0" : req.getParameter("BRN");
			msg.setE02OFMBRN(branch);
			String currency = (req.getParameter("CCY") == null) ? "" : req.getParameter("CCY");
			msg.setE02OFMCCY(currency);
			String amount = (req.getParameter("AMT") == null) ? "0.00" : req.getParameter("AMT");
			msg.setE02OFMMCH(amount);
			String check = (req.getParameter("CHK") == null) ? "" : req.getParameter("CHK");
			msg.setE02OFMNCH(check);
			
			mp.sendMessage(msg);
			
			MessageRecord newmsg = mp.receiveMessageRecord();
			
			if (mp.hasError(newmsg)) {
				msgError = (ELEERRMessage) newmsg;
				session.setAttribute("error", msgError);
				res.setContentType("text/html");
				printClose(res.getWriter());
			} else {
				msg = (ETL051002Message) newmsg; 
				session.setAttribute("dvDocDet", msg);
				session.setAttribute("error", msgError);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEOF0100?SCREEN=7");	
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqDocDet(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String PageToCall = "";
		ELEERRMessage msgError = new ELEERRMessage();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ETL0510", req);
			ETL051002Message msg = (ETL051002Message) mp.getMessageRecord("ETL051002", user.getH01USR(), "0004");
			
			String bank = (req.getParameter("BNK") == null) ? "01" : req.getParameter("BNK");
			msg.setE02OFMBNK(bank);
			String branch = (req.getParameter("BRN") == null) ? "0" : req.getParameter("BRN");
			msg.setE02OFMBRN(branch);
			String currency = (req.getParameter("CCY") == null) ? "" : req.getParameter("CCY");
			msg.setE02OFMCCY(currency);
			String amount = (req.getParameter("AMT") == null) ? "0.00" : req.getParameter("AMT");
			msg.setE02OFMMCH(amount);
			String check = (req.getParameter("CHK") == null) ? "" : req.getParameter("CHK");
			msg.setE02OFMNCH(check);
			
			mp.sendMessage(msg);
			
			MessageRecord newmsg = mp.receiveMessageRecord();
			
			if (mp.hasError(newmsg)) {
				msgError = (ELEERRMessage) newmsg;
				session.setAttribute("error", msgError);
				res.setContentType("text/html");
				printClose(res.getWriter());
			} else {
				msg = (ETL051002Message) newmsg; 
				session.setAttribute("dvDocDet", msg);
				session.setAttribute("error", msgError);
				if (msg.getE02OFMDTY().equals("1")) { //Offical Check
					PageToCall = "ETL0510_chk_off_inq_det.jsp";	
				} else {			
					PageToCall = "ETL0510_dv_inq_doc_det.jsp";	
				}
				forward(PageToCall, req, res);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String PageToCall = "";
		UserPos	userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ETL0510", req);
			ETL051001Message msg = (ETL051001Message) session.getAttribute("checkSel");
			if (msg == null) {
				msg = (ETL051001Message) mp.getMessageRecord("ETL051001");
				setMessageRecord(req, msg);
			}
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0004");
			
			//msg.setE01SELDTY(userPO.getHeader1());
	        msg.setE01SELSCH(userPO.getHeader2());
	        msg.setE01SELNCH(userPO.getHeader3());
	        msg.setE01SELACC(userPO.getHeader4());
	        msg.setE01SELBNF(userPO.getHeader5());
	        msg.setE01SELAPL(userPO.getHeader6());
	        //datos nuevos
	        msg.setE01SELDTY(userPO.getHeader7());
	        msg.setE01SELBNK(userPO.getHeader8());
	        msg.setE01SELBRN(userPO.getHeader9());
	        msg.setE01SELCCY(userPO.getHeader10());
	        
			String position = (req.getParameter("Pos") == null) ? "0" : req.getParameter("Pos");		
			msg.setE01NUMREC(position);
			mp.sendMessage(msg);
			
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			list.initRow();
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) list.getRecord();
				if (userPO.getOption().equals("OF")) {
	//				PageToCall = "ETL0510_chk_off_inq_sel.jsp";
					PageToCall = "ETL0510_chk_off_inq_sel_identif.jsp";					
				} else { 
					PageToCall = "ETL0510_dv_inq_sel.jsp";
				}
			} else {
				list.initRow();
				JBList beanList = new JBList();
				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				while (list.getNextRow()) {
					msg = (ETL051001Message) list.getRecord();
					marker = msg.getE01INDOPE();
					if (firstTime) {
						firstTime = false;
						position = (msg.getE01NUMREC().equals("")) ? "0" : msg.getE01NUMREC();
						beanList.setFirstRec(Integer.parseInt(position));
					}				
					String showDocFunc = "showDocDet('" + msg.getE01OFMBNK() + "', '" + msg.getE01OFMBRN() + "', '" + msg.getE01OFMCCY() + "', '" + msg.getE01OFMMCH() + "', '" + msg.getE01OFMNCH() + "')";
					myRow = new StringBuffer("<TR>");
					if(userPO.getOption().equals("OF")){
						myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:" + showDocFunc + "\">" + Util.formatCell(msg.getE01OFMACC()) + "</A></TD>");
					}
					myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:" + showDocFunc + "\">" + Util.formatCell(msg.getE01OFMNCH()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:" + showDocFunc + "\">" + Util.formatCell(msg.getE01OFMCCY()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:" + showDocFunc + "\">" + Util.formatCell(msg.getE01OFMBRN()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:" + showDocFunc + "\">" + Util.formatCell(msg.getE01OFMMCH()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:" + showDocFunc + "\">" + Util.formatCell(msg.getE01OFMSTS()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:" + showDocFunc + "\">" + Util.formatCell(msg.getE01OFMFTY()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:" + showDocFunc + "\">" + Util.formatCustomDate(user.getE01DTF(),msg.getE01OFMIDM(), msg.getE01OFMIDD(), msg.getE01OFMIDY()) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:" + showDocFunc + "\">" + Util.formatCell(msg.getE01OFMBNF()) + "</A></TD>");
					myRow.append("</TR>");
					beanList.addRow(myFlag, myRow.toString());
				}
				beanList.setShowNext(marker.equals("+"));
				session.setAttribute("dvList", beanList);
				
				if (position.equals("0") && beanList.getLastRec() == 1) {
					
					String page = "/servlet/datapro.eibs.products.JSETL0510?SCREEN=3&BNK=" + msg.getE01OFMBNK() + "&BRN=" + msg.getE01OFMBRN() + "&CCY=" + msg.getE01OFMCCY() + "&AMT=" + msg.getE01OFMMCH() + "&CHK=" + msg.getE01OFMNCH();
					res.setContentType("text/html");
					PrintWriter  out = res.getWriter();
					out.println("<HTML>");
					out.println("<HEAD>");
					out.println("<TITLE>Close</TITLE>");
					out.println("</HEAD>");
					out.println("<BODY>");
					out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
					out.println("		window.location.href='" + webAppPath + page + "'");					
					out.println("</SCRIPT>");
					out.println("</BODY>");
					out.println("</HTML>");
					out.close();
					
				} else {
					PageToCall = "ETL0510_dv_inq_list_doc.jsp";	
				}
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("checkFilter", msg);
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

}

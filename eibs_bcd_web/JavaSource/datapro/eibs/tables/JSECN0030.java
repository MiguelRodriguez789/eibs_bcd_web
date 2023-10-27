package datapro.eibs.tables;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECN0030DSMessage;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSECN0030 extends JSEIBSServlet {

	protected static final int R_INQUIRY = 100;
	protected static final int A_INQUIRY = 200;
	protected static final int R_INQUIRY_PIZZ = 300;
	protected static final int A_INQUIRY_PIZZ = 400;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch(screen) {
			case R_INQUIRY: 
				procReqInquiry(user, req, res, session);
				break;
	
			case A_INQUIRY: 
				procActionInquiry(user, req, res, session);
				break;
	
			case R_INQUIRY_PIZZ: 
				procReqInquiryPizz(user, req, res, session);
				break;
	
			case A_INQUIRY_PIZZ: 
				procActionInquiryPizz(user, req, res, session);
				break;
	
			default:
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionInquiryPizz(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		String opCode = "0200";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECN0030", req);
			ECN0030DSMessage msgCDRenRat = (ECN0030DSMessage) mp.getMessageRecord("ECN0030DS");
			msgCDRenRat.setH02USERID(user.getH01USR());
			msgCDRenRat.setH02PROGRM("ESD0711");
			msgCDRenRat.setH02TIMSYS(getTimeStamp());
			msgCDRenRat.setH02SCRCOD("01");
			msgCDRenRat.setH02OPECOD(opCode);
			
			try {
				msgCDRenRat.setE02CDRCCY(req.getParameter("E02CDRCCY").trim());
			} catch (Exception e) {
				msgCDRenRat.setE02CDRCCY("");
			}
			
			try {
				msgCDRenRat.setE02CDRRTB(req.getParameter("E02CDRRTB").trim());
			} catch (Exception e) {
				msgCDRenRat.setE02CDRRTB("");
			}

			try {
				msgCDRenRat.setE02CDRDTM(req.getParameter("E02CDRDTM").trim());
				msgCDRenRat.setE02CDRDTD(req.getParameter("E02CDRDTD").trim());
				msgCDRenRat.setE02CDRDTY(req.getParameter("E02CDRDTY").trim());
			} catch (Exception e) {
				msgCDRenRat.setE02CDRDTM("0");
				msgCDRenRat.setE02CDRDTD("0");
				msgCDRenRat.setE02CDRDTY("0");
			}
			
			mp.sendMessage(msgCDRenRat);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "ECN0030_rate_table_pizz_enter.jsp";
			} else {
				session.setAttribute("error", new ELEERRMessage());
				session.setAttribute("cdRenRat", msg);
				pageName = "ECN0030_rate_table_pizz.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqInquiryPizz(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ECN0030_rate_table_pizz_enter.jsp", req, res);
	}

	private void procActionInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		String opCode = "0100";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECN0030", req);
			ECN0030DSMessage msgCDRenRat = (ECN0030DSMessage) mp.getMessageRecord("ECN0030DS");
			msgCDRenRat.setH02USERID(user.getH01USR());
			msgCDRenRat.setH02PROGRM("ECN0030");
			msgCDRenRat.setH02TIMSYS(getTimeStamp());
			msgCDRenRat.setH02SCRCOD("01");
			msgCDRenRat.setH02OPECOD(opCode);
			
			try {
				msgCDRenRat.setE02CDRCCY(req.getParameter("E02CDRCCY").trim());
			} catch (Exception e) {
				msgCDRenRat.setE02CDRCCY("");
			}
			
			try {
				msgCDRenRat.setE02CDRRTB(req.getParameter("E02CDRRTB").trim());
			} catch (Exception e) {
				msgCDRenRat.setE02CDRRTB("");
			}

			try {
				msgCDRenRat.setE02CDRDTM(req.getParameter("E02CDRDTM").trim());
				msgCDRenRat.setE02CDRDTD(req.getParameter("E02CDRDTD").trim());
				msgCDRenRat.setE02CDRDTY(req.getParameter("E02CDRDTY").trim());
			} catch (Exception e) {
				msgCDRenRat.setE02CDRDTM("0");
				msgCDRenRat.setE02CDRDTD("0");
				msgCDRenRat.setE02CDRDTY("0");
			}
			
			mp.sendMessage(msgCDRenRat);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "ECN0030_rate_table_enter.jsp";
			} else {
				session.setAttribute("error", new ELEERRMessage());
				session.setAttribute("cdRenRat", msg);
				pageName = "ECN0030_rate_table.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqInquiry(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ECN0030_rate_table_enter.jsp", req, res);
	}

}

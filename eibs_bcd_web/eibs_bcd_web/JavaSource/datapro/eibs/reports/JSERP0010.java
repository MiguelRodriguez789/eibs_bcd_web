package datapro.eibs.reports;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ERP001000Message;
import datapro.eibs.beans.ERP001001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSERP0010 extends JSEIBSServlet {

	protected static final int R_REPORT_DEMAND = 25;
	protected static final int A_REPORT_DEMAND = 26;
	protected static final int A_REPORT_PARAM  = 27;
	// entering options
	protected static final int R_ENTER = 100;
	protected static final int A_ENTER = 400;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			// Requests
			case R_REPORT_DEMAND :
				procReqReportDemand(user, req, res, session);
				break;
				// Actions
			case A_REPORT_DEMAND :
				procActionReportDemand(user, req, res, session);
				break;
			case A_REPORT_PARAM :
				procActionParameters(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionParameters(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		int totRows = Util.parseInt(req.getParameter("TOTROWS"));
		
		String rptnme = "";
		String rptprg = "";
		String pageName = "";
		MessageProcessor mp = null;
		boolean firstTime = true;
		try {
			mp = getMessageProcessor("ERP0010", req);
			for (int row = 0; row < totRows; row++) {
				ERP001001Message msgCC = (ERP001001Message) mp.getMessageRecord("ERP001001");
				msgCC.setH01USERID(user.getH01USR());
				msgCC.setH01PROGRM("ERP0010");
				msgCC.setH01TIMSYS(getTimeStamp());
				msgCC.setH01SCRCOD("01");
				msgCC.setH01OPECOD("0015");
				
				if (firstTime) {
					rptnme = req.getParameter("E01RPTNME_" + row);
					rptprg = req.getParameter("E01RPTPRG_" + row);
					firstTime = false;
				}
				msgCC.setE01RPTNME(req.getParameter("E01RPTNME_" + row));
				msgCC.setE01RPTPRG(req.getParameter("E01RPTPRG_" + row));
				msgCC.setE01RPTSEQ(req.getParameter("E01RPTSEQ_" + row));
				msgCC.setE01RPTCOD(req.getParameter("E01RPTCOD_" + row));
				msgCC.setE01RPTINS(req.getParameter("E01RPTINS_" + row));
				msgCC.setE01PMSPLN(req.getParameter("E01PMSPLN_" + row));
				msgCC.setE01PMSPTY(req.getParameter("E01PMSPTY_" + row));
				msgCC.setE01PMSNDC(req.getParameter("E01PMSNDC_" + row));
				msgCC.setE01PMSVAL(req.getParameter("E01PMSVAL_" + row));
				try {
					msgCC.setE01YY(req.getParameter("E01YY_" + row));
					msgCC.setE01MM(req.getParameter("E01MM_" + row));
					msgCC.setE01DD(req.getParameter("E01DD_" + row));
				} catch (Exception e) {
					msgCC.setE01YY("0000");
					msgCC.setE01MM("00");
					msgCC.setE01DD("00");
				}
				
				msgCC.setE01INDOPE(" ");
				
				mp.sendMessage(msgCC);
			}
			ERP001001Message msgCC = (ERP001001Message) mp.getMessageRecord("ERP001001");
			msgCC.setH01USERID(user.getH01USR());
			msgCC.setH01PROGRM("ERP0010");
			msgCC.setH01TIMSYS(getTimeStamp());
			msgCC.setH01SCRCOD("01");
			msgCC.setH01OPECOD("0015");
			msgCC.setE01RPTNME(rptnme);
			msgCC.setE01RPTPRG(rptprg);
			msgCC.setE01INDOPE("*");
			mp.sendMessage(msgCC);
			
			MessageRecord msg = mp.receiveMessageRecord();
			session.setAttribute("error", msg);
			
			if (mp.hasError(msg)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ERP0010_report_demand_confirm.jsp";
			}
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionReportDemand(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		int row = Util.parseInt(req.getParameter("ROW"));
		JBObjList list = (JBObjList) session.getAttribute("dvList");
		
		ERP001000Message msgList = (ERP001000Message) list.get(row);	
		
		if ("Y".equals(msgList.getE01REPPRM())) {
//			Report with parameters
			procReqParameters(msgList, user, req, res, session);
		} else {
			String pageName = "";
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ERP0010", req);
				ERP001000Message msgSearch = (ERP001000Message) mp.getMessageRecord("ERP001000");
				msgSearch.setH01USERID(user.getH01USR());
				msgSearch.setH01PROGRM("ERP0010");
				msgSearch.setH01TIMSYS(getTimeStamp());
				msgSearch.setH01SCRCOD("01");
				msgSearch.setH01OPECOD("0015");
				
				try {
					msgSearch.setE01PRGNME(msgList.getE01PRGNME().trim());
				} catch (Exception e) {
				}
				try {
					msgSearch.setE01REPNME(msgList.getE01REPNME().trim());
				} catch (Exception e) {
				}
				try {
					msgSearch.setE01APLCOD(msgList.getE01APLCOD().trim());
				} catch (Exception e) {
				}
				
				mp.sendMessage(msgSearch);
				MessageRecord msg = mp.receiveMessageRecord();
				
				session.setAttribute("error", msg);
				if (mp.hasError(msg)) {
					pageName = "error_viewer.jsp";
				} else {
					pageName = "ERP0010_report_demand_confirm.jsp";
				}
				forward(pageName, req, res);
			} finally {
				if (mp != null) mp.close();
			}
		}
		
	}

	private void procReqParameters(ERP001000Message msgList,
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERP0010", req);
			ERP001001Message msgCC = (ERP001001Message) mp.getMessageRecord("ERP001001");
			msgCC.setH01USERID(user.getH01USR());
			msgCC.setH01PROGRM("ERP0010");
			msgCC.setH01TIMSYS(getTimeStamp());
			msgCC.setH01SCRCOD("01");
			msgCC.setH01OPECOD("0010");
			try {
				msgCC.setE01RPTNME(msgList.getE01REPNME().trim());
			} catch (Exception e) {  
			}
			try {
				msgCC.setE01RPTPRG(msgList.getE01PRGNME().trim());
			} catch (Exception e) {
			}
			try {
				msgCC.setE01RPTCOD(msgList.getE01APLCOD().trim());
			} catch (Exception e) {
			}
			
			mp.sendMessage(msgCC);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("prList", list);
				pageName = "ERP0010_report_parameters.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqReportDemand(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERP0010", req);
			ERP001000Message msgCC = (ERP001000Message) mp.getMessageRecord("ERP001000");
			msgCC.setH01USERID(user.getH01USR());
			msgCC.setH01PROGRM("ERP0010");
			msgCC.setH01TIMSYS(getTimeStamp());
			msgCC.setH01SCRCOD("01");
			msgCC.setH01OPECOD("0010");
			msgCC.setE01REPNME("");
			try {
				msgCC.setE01APLCOD(req.getParameter("TYPE").trim());		
			} catch (Exception e) {
			}
			
			mp.sendMessage(msgCC);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("dvList", list);
				pageName = "ERP0010_report_demand.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

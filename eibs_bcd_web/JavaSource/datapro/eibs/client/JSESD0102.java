package datapro.eibs.client;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD010201Message;
import datapro.eibs.beans.ESD010202Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSESD0102 extends JSEIBSServlet {

	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen) {
        case 1: // Request Paswword 
            procReqPassword(req, res, session);
            break;

        case 2: // Send Approval  
            procActionApproval(user, req, res, session);
            break;

        case 3: //  Send Detail Inquiry for Approval
            procReqApprovalInq(user, req, res, session);
            break;

		case 5: // Send Portfolio for Approval
			procReqApproval(user, req, res, session);
			break;
        default:
        	forward(devPage, req, res);
            break;

        }
	}

	private void procReqApproval(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0102", req);
			ESD010201Message msgList = (ESD010201Message) mp.getMessageRecord("ESD010201");
            msgList.setH01USERID(user.getH01USR());
            msgList.setH01PROGRM("ESD0102");
            msgList.setH01TIMSYS(getTimeStamp());
            try {
            	 msgList.setH01FLGWK1(req.getParameter("typCode").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
                StringBuffer myRow = null;
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msgList = (ESD010201Message) iterator.next();
                    myRow = new StringBuffer("<TR>");
                    myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><input type=\"radio\" name=\"PORNUM\" value=\"" + msgList.getE01PRFNUM() + "\" onclick=\"getPortfClient('" + msgList.getE01PRFCUN() + "','" + msgList.getE01PRFNUM() + "')\"></TD>");                    
                    myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"20%\"><A HREF=\"javascript:showInqApprovalCport('" + msgList.getE01PRFCUN() + "','" + msgList.getE01PRFNUM() + "')\">" + Util.formatCell(msgList.getE01PRFNUM() + "-" + msgList.getE01PRFDSC()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:showInqApprovalCport('" + msgList.getE01PRFCUN() + "','" + msgList.getE01PRFNUM() + "')\">" + Util.formatCell(msgList.getE01PRFCUN()) + "</A></TD>");
                    myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:showInqApprovalCport('" + msgList.getE01PRFCUN() + "','" + msgList.getE01PRFNUM() + "')\">" + Util.formatCell(msgList.getE01OFCNME()) + "</A></TD>");
                    myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:showInqApprovalCport('" + msgList.getE01PRFCUN() + "','" + msgList.getE01PRFNUM() + "')\">" + Util.formatCell(msgList.getE01PRFVCY()) + "</A></TD>");
                    myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"20%\"><A HREF=\"javascript:showInqApprovalCport('" + msgList.getE01PRFCUN() + "','" + msgList.getE01PRFNUM() + "')\">" + 
                    		 Util.formatCustomDate(user.getE01DTF(),
										msgList.getBigDecimalE01PRFOPM().intValue(),
										msgList.getBigDecimalE01PRFOPD().intValue(),
										msgList.getBigDecimalE01PRFOPY().intValue()) + "</A></TD>");
                    myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"20%\"><A HREF=\"javascript:showInqApprovalCport('" + msgList.getE01PRFCUN() + "','" + msgList.getE01PRFNUM() + "')\">" + Util.formatCell(msgList.getE01OPEDSC()) + "</A></TD>");
                    myRow.append("</TR>");
                    beanList.addRow("", myRow.toString());
				}
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("appList", beanList);
				
				if (beanList.getNoResult()) {
					pageName = "MISC_no_result.jsp";
				} else {
					userPO.setCusType("P");
					pageName = "ESD0102_approval_list.jsp";
				}
			}

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqApprovalInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		String customer = req.getParameter("CUSTOMER");
		String portfolio = req.getParameter("PORTFOLIO");
		res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSESD0088?SCREEN=501" + "&CUSTOMER=" + customer + "&CODE=" + portfolio);
	}

	private void procActionApproval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0102", req);
			ESD010202Message msgList = (ESD010202Message) mp.getMessageRecord("ESD010202");
            msgList.setH02USERID(user.getH01USR());
            msgList.setH02PROGRM("ESD0102");
            msgList.setH02TIMSYS(getTimeStamp());
            try {
                msgList.setE02PRFNUM(req.getParameter("PORTFOLIO").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
            try {
                msgList.setE02PRFCUN(req.getParameter("CUSTOMER").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
            try {
                msgList.setE02ACTION(req.getParameter("action").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
            try {
                msgList.setE02MSGTXT(req.getParameter("reason").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgList);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
			} else {
				msgError = new ELEERRMessage();
			}

			session.setAttribute("error", msgError);

			res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSESD0102?SCREEN=1");

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqPassword(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		String typCode = "";
		try {
			typCode = "&typCode=" + req.getParameter("typCode").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		String appCode = "";
		try {
			appCode = "&appCode=" + req.getParameter("appCode").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		String CUSTOMER = "";
		try {
			CUSTOMER = "&CUSTOMER=" + req.getParameter("CUSTOMER").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		userPO.setOption("PR");
		userPO.setRedirect("/servlet/datapro.eibs.client.JSESD0102?SCREEN=5" + appCode + typCode + CUSTOMER);
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}

}

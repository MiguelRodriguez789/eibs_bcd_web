package datapro.eibs.helps;

import java.io.IOException;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.exception.DocumentException;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0150DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecordComparator;
import datapro.eibs.tools.xml.XMLSelectOptions;

public class JSEWD0150 extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
			case 2:
				ajaxProductTypes(user, req, res, session);
				break;
			default:
				main(user, req, res, session);
				break;
			}
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0150", req);
			EWD0150DSMessage msgHelp = (EWD0150DSMessage) mp.getMessageRecord("EWD0150DS", user.getH01USR(), "");
			msgHelp.setEWDSBK(user.getE01UBK());	
			
			String processType = req.getParameter("Process") == null ? "F" : req.getParameter("Process").toUpperCase();
			
			msgHelp.setEWDACD(req.getParameter("AppCode") == null ? "" : req.getParameter("AppCode").toUpperCase());
			msgHelp.setEWDTSL(processType);
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				StringBuffer myRow = null;
				JBList beanList = new JBList();
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0150DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					if (processType.equals("P")) {
						myRow.append(
								"<td NOWRAP ALIGN=CENTER><a href=\"javascript:enter('"
									+ msgHelp.getEWDACD()
									+ "')\">"
									+ Util.formatCell(msgHelp.getEWDACD())
									+ "</a></td>");
						myRow.append(
								"<td NOWRAP ><a href=\"javascript:enter('"
									+ msgHelp.getEWDACD()
									+ "')\">"
									+ Util.formatCell(msgHelp.getEWDDSC())
									+ "</a></td>");
					} else {
						myRow.append(
								"<td NOWRAP ALIGN=CENTER><a href=\"javascript:enter('"
									+ msgHelp.getEWDCDE()
									+ "','"
									+ Util.formatJavascript(msgHelp.getField("EWDDSC"))
									+ "')\">"
									+ Util.formatCell(msgHelp.getEWDCDE())
									+ "</a></td>");
						myRow.append(
							"<td NOWRAP ALIGN=CENTER><a href=\"javascript:enter('"
								+ msgHelp.getEWDCDE()
								+ "','"
								+ Util.formatJavascript(msgHelp.getField("EWDDSC"))
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDTYP())
								+ "</a></td>");
						myRow.append(
							"<td NOWRAP ALIGN=CENTER><a href=\"javascript:enter('"
								+ msgHelp.getEWDCDE()
								+ "','"
								+ Util.formatJavascript(msgHelp.getField("EWDDSC"))
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDCCY())
								+ "</a></td>");
						myRow.append(
							"<td NOWRAP ><a href=\"javascript:enter('"
								+ msgHelp.getEWDCDE()
								+ "','"
								+ Util.formatJavascript(msgHelp.getField("EWDDSC"))
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDDSC())
								+ "</a></td>");
					}
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setShowNext(list.getShowNext());
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0150Help", beanList);
				req.setAttribute("AppCode",	req.getParameter("AppCode"));
				
				if (processType.equals("P")) {
					pageName = "EWD0150_process_help_helpmessage.jsp";
				} else {
					pageName = "EWD0150_product_help_helpmessage.jsp";
				}
			}
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void ajaxProductTypes(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0150", req);
			EWD0150DSMessage msgHelp = (EWD0150DSMessage) mp.getMessageRecord("EWD0150DS");
			msgHelp.setEWDSBK(user.getE01UBK());
			msgHelp.setEWDTSL("P");
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				sendXMLResponse(res, msgError.toString());
			} else {
				Collections.sort(list, new MessageRecordComparator("EWDDSC"));
				XMLSelectOptions xmlResponse = new XMLSelectOptions("AppCode", "enter()");
				xmlResponse.addOption("", "");
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0150DSMessage) list.getRecord();
					xmlResponse.addOption(msgHelp.getEWDACD(), msgHelp.getEWDDSC());
				}
				sendXMLResponse(res, xmlResponse);
			}
			return;
			
		} catch (DocumentException e) {
			e.printStackTrace();
		} finally {
			if (mp != null) mp.close();
		}
		sendXMLResponse(res, "Error");
	}

}

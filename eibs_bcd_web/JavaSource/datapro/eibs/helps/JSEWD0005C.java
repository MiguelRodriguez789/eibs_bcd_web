package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0005DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEWD0005C extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0005", req);
			EWD0005DSMessage msgHelp = (EWD0005DSMessage) mp.getMessageRecord("EWD0005DS", user.getH01USR(), "");
			
			msgHelp.setEWDUSR(user.getH01USR());
			msgHelp.setEWDSHR(req.getParameter("NameSearch") == null ? "" :  req.getParameter("NameSearch").toUpperCase());
			msgHelp.setEWDSBK(user.getE01SEC().equals("Y") ? user.getE01UBK() : "");
			msgHelp.setEWDSCA(req.getParameter("shrAppCode") == null ? "" : req.getParameter("shrAppCode"));
			msgHelp.setEWDSEL(req.getParameter("shrSelect") == null ? "" : req.getParameter("shrSelect"));
			msgHelp.setEWDREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
			//search by Account
			msgHelp.setEWDACC(req.getParameter("shrAcc") == null ? "0" : req.getParameter("shrAcc"));
			//search by Old Account
			msgHelp.setEWDOAC(req.getParameter("shrOldAcc") == null ? "0" : req.getParameter("shrOldAcc"));
			//search by Client
			msgHelp.setEWDCUN(req.getParameter("shrClient") == null ? "0" : req.getParameter("shrClient"));
			//search by type 'W'=word, 'S'=short name, 'N'=client number
			msgHelp.setEWDTYP(req.getParameter("shrType") == null ? "W" : req.getParameter("shrType"));
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			} else {
				list.initRow();
				JBObjList beanList = new JBObjList();
				StringBuffer myRow = null;
				boolean firstTime = true;
				while (list.getNextRow()) {
					msgHelp = (EWD0005DSMessage) list.getRecord();
					if (firstTime) {
						firstTime = false;
						beanList.setFirstRec(
							Integer.parseInt(msgHelp.getEWDREC()));
						
					} 	
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<td nowrap ><a href=\"javascript:enter('"
							+ msgHelp.getEWDACC()
							+ "','"
							+ msgHelp.getEWDCUN()
							+ "','"
							+ msgHelp.getEWDIDN()
							+ "','"
							+ msgHelp.getEWDPRD()
							+ "','"
							+ msgHelp.getEWDNTA()
							+ "','"
							+ msgHelp.getEWDSCA()
							+ "','"
							+ msgHelp.getEWDNME()
							+ "')\">"
							+ Util.formatCell(msgHelp.getEWDNME())
							+ "</a></td>");
					myRow.append(
							"<td nowrap ><a href=\"javascript:enter('"
								+ msgHelp.getEWDACC()
								+ "','"
								+ msgHelp.getEWDCUN()
								+ "','"
								+ msgHelp.getEWDIDN()
								+ "','"
								+ msgHelp.getEWDPRD()
								+ "','"
								+ msgHelp.getEWDNTA()
								+ "','"
								+ msgHelp.getEWDSCA()
								+ "','"
								+ msgHelp.getEWDNME()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDACC())
								+ "</a></td>");
					myRow.append(
							"<td nowrap ><a href=\"javascript:enter('"
								+ msgHelp.getEWDACC()
								+ "','"
								+ msgHelp.getEWDCUN()
								+ "','"
								+ msgHelp.getEWDIDN()
								+ "','"
								+ msgHelp.getEWDPRD()
								+ "','"
								+ msgHelp.getEWDNTA()
								+ "','"
								+ msgHelp.getEWDSCA()
								+ "','"
								+ msgHelp.getEWDNME()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDBRN())
								+ "</a></td>");
					myRow.append(
							"<td nowrap ><a href=\"javascript:enter('"
								+ msgHelp.getEWDACC()
								+ "','"
								+ msgHelp.getEWDCUN()
								+ "','"
								+ msgHelp.getEWDIDN()
								+ "','"
								+ msgHelp.getEWDPRD()
								+ "','"
								+ msgHelp.getEWDNTA()
								+ "','"
								+ msgHelp.getEWDSCA()
								+ "','"
								+ msgHelp.getEWDNME()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDCCY())
								+ "</a></td>");
					myRow.append(
							"<td nowrap ><a href=\"javascript:enter('"
								+ msgHelp.getEWDACC()
								+ "','"
								+ msgHelp.getEWDCUN()
								+ "','"
								+ msgHelp.getEWDIDN()
								+ "','"
								+ msgHelp.getEWDPRD()
								+ "','"
								+ msgHelp.getEWDNTA()
								+ "','"
								+ msgHelp.getEWDSCA()
								+ "','"
								+ msgHelp.getEWDNME()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDATY())
								+ "</a></td>");
					myRow.append(
							"<td nowrap ><a href=\"javascript:enter('"
								+ msgHelp.getEWDACC()
								+ "','"
								+ msgHelp.getEWDCUN()
								+ "','"
								+ msgHelp.getEWDIDN()
								+ "','"
								+ msgHelp.getEWDPRD()
								+ "','"
								+ msgHelp.getEWDNTA()
								+ "','"
								+ msgHelp.getEWDSCA()
								+ "','"
								+ msgHelp.getEWDNME()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDPRD())
								+ "</a></td>");
					myRow.append(
							"<td nowrap ><a href=\"javascript:enter('"
								+ msgHelp.getEWDACC()
								+ "','"
								+ msgHelp.getEWDCUN()
								+ "','"
								+ msgHelp.getEWDIDN()
								+ "','"
								+ msgHelp.getEWDPRD()
								+ "','"
								+ msgHelp.getEWDNTA()
								+ "','"
								+ msgHelp.getEWDSCA()
								+ "','"
								+ msgHelp.getEWDNME()
								+ "')\">"
								+ Util.fcolorCCY(msgHelp.getEWDAMT())
								+ "</a></td>");
					myRow.append(
							"<td nowrap ><a href=\"javascript:enter('"
								+ msgHelp.getEWDACC()
								+ "','"
								+ msgHelp.getEWDCUN()
								+ "','"
								+ msgHelp.getEWDIDN()
								+ "','"
								+ msgHelp.getEWDPRD()
								+ "','"
								+ msgHelp.getEWDNTA()
								+ "','"
								+ msgHelp.getEWDSCA()
								+ "','"
								+ msgHelp.getEWDNME()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDNAR())
								+ "</a></td>");
					myRow.append(
							"<td nowrap ><a href=\"javascript:enter('"
								+ msgHelp.getEWDACC()
								+ "','"
								+ msgHelp.getEWDCUN()
								+ "','"
								+ msgHelp.getEWDIDN()
								+ "','"
								+ msgHelp.getEWDPRD()
								+ "','"
								+ msgHelp.getEWDNTA()
								+ "','"
								+ msgHelp.getEWDSCA()
								+ "','"
								+ msgHelp.getEWDNME()
								+ "')\">"
								+ Util.formatCell(msgHelp.getEWDSTS())
								+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow(myRow.toString());
				}
				beanList.setShowNext(list.getShowNext());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0005Help", beanList);
				
				req.setAttribute(
						"NameSearch",
						req.getParameter("NameSearch"));
					req.setAttribute(
						"shrBank",
						req.getParameter("shrBank"));
					req.setAttribute(
						"shrAppCode",
						req.getParameter("shrAppCode"));
					req.setAttribute(
						"shrSelect",
						req.getParameter("shrSelect"));
					req.setAttribute(
						"shrClient",
						req.getParameter("shrClient"));
					req.setAttribute(
						"shrType",
						req.getParameter("shrType"));
					
					forward("EWD0005C_client_help_helpmessage.jsp", req, res);
			}
		
		
		} finally {
			if (mp != null)	mp.close();
		}
	}

}

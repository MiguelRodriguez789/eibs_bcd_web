package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0406DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0406 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			//	Request from Menu
			case 100 :
				procReqEnterInquiry(user, req, res, session);
				break;
			//	Request from Help
			default :
				main(user, req, res, session);
				break;
		}		
	}

	private void procReqEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", new UserPos());
		
		forward("EWD0406_old_acc_help_container.jsp", req, res);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = super.getMessageProcessor("EWD0406", req);
			EWD0406DSMessage msgHelp = (EWD0406DSMessage) mp.getMessageRecord("EWD0406DS");
			try {
				msgHelp.setEWDSBK(req.getParameter("selBank") == null ? "" : req.getParameter("selBank"));
			} catch (Exception e) {
				msgHelp.setEWDSBK("  ");
			}
			try {
				msgHelp.setEWDOAC(req.getParameter("selOldAcc") == null ? "0" : req.getParameter("selOldAcc"));
			} catch (Exception e) {
				msgHelp.setEWDOAC("0");
			}
			try {
				msgHelp.setEWDACC(req.getParameter("selNewAcc") == null ? "0" : req.getParameter("selNewAcc"));
			} catch (Exception e) {
				msgHelp.setEWDACC("0");
			}
			try {
				msgHelp.setEWDSBR(req.getParameter("selBranch") == null ? "0" : req.getParameter("selBank").trim());
			} catch (Exception e) {
				msgHelp.setEWDSBR("0");
			}
			try {
				msgHelp.setEWDSCY(req.getParameter("selCurrency") == null ? "" : req.getParameter("selCurrency").toUpperCase());
			} catch (Exception e) {
				msgHelp.setEWDSCY("   ");
			}
			try {
				msgHelp.setEWDSTY(req.getParameter("selPrdType") == null ? "" : req.getParameter("selPrdType").toUpperCase());
			} catch (Exception e) {
				msgHelp.setEWDSTY(" ");
			}
			try {
				msgHelp.setEWDSCU(req.getParameter("selCustomer") == null ? "" : req.getParameter("selCustomer").trim());
			} catch (Exception e) {
				msgHelp.setEWDSCU("0");
			}
			msgHelp.setEWDREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));

			mp.sendMessage(msgHelp);

			JBObjList list = (JBObjList) mp.receiveMessageRecordList("EWDOPE", "EWDREC");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0406DSMessage) list.getRecord();
					String enter = "<a href=\"javascript:enter('"
						+ msgHelp.getEWDACC()
						+ "')\"> ";	

					myRow = new StringBuffer("<TR>");
					myRow.append("<td nowrap align=center>" + enter
							+ Util.formatCell(msgHelp.getEWDOAC())
							+ "</a></td>");
					myRow.append("<td nowrap align=center>" + enter
							+ Util.formatCell(msgHelp.getEWDACC())
							+ "</a></td>");
					myRow.append("<td nowrap align=center>" + enter
							+ Util.formatCell(msgHelp.getEWDSTS())
							+ "</a></td>");
					myRow.append("<td nowrap align=center>" + enter
							+ Util.formatCell(msgHelp.getEWDATY())
							+ "</a></td>");
					myRow.append("<td nowrap align=center>" + enter
							+ Util.formatCell(msgHelp.getEWDCUN())
							+ "</a></td>");
					myRow.append("<td nowrap align=left>" + enter
							+ msgHelp.getEWDDSC()
							+ "</a></td>");
					myRow.append("<td nowrap align=center>" + enter
							+ Util.formatCell(msgHelp.getEWDBNK())
							+ "</a></td>");
					myRow.append("<td nowrap align=center>" + enter
							+ Util.formatCell(msgHelp.getEWDBRN())
							+ "</a></td>");
					myRow.append("<td nowrap align=center>" + enter
							+ Util.formatCell(
								msgHelp.getEWDCCY().toUpperCase())
							+ "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				session.setAttribute("ewd0406Help", beanList);
				
				req.setAttribute("selOdlAcc",req.getParameter("selOldAcc"));
				req.setAttribute("selNewAcc",req.getParameter("selNewAcc"));
				req.setAttribute("selBank",req.getParameter("selBank"));
				req.setAttribute("selBranch",req.getParameter("selBranch"));
				req.setAttribute("selPrdType",req.getParameter("selPrdType"));
				req.setAttribute("selCurrency",req.getParameter("selCurrency"));
				req.setAttribute("selCustomer",req.getParameter("selCustomer"));
				
				pageName = "EWD0406_old_acc_help_helpmessage.jsp";
			}

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

}

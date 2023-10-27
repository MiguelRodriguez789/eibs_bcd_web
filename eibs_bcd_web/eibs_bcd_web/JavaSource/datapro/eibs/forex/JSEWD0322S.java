package datapro.eibs.forex;

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

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0322DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEWD0322S extends JSEIBSServlet {

	// Limits Inquiry
	static final int R_LIMIT 			= 1;
	static final int A_LIMIT 			= 2;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		// Requests
		case R_LIMIT :
			procReqPos(user, req, res, session);
			break;
		// Actions
		case A_LIMIT :
			procActionPos(user, req, res, session);
			break;				
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procActionPos(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		int inptOPT = 0;
		try {
			inptOPT = Integer.parseInt(req.getParameter("opt"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String CUNCOD = "";
		try {
			CUNCOD = req.getParameter("CUNCOD").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		String CusNumb = "";
		if (CUNCOD.length() == 0) {
			try {
				CusNumb = req.getParameter("CUSTOMER").trim();
			} catch (Exception e) {
				// TODO: handle exception
			}
		} else {
			CusNumb = CUNCOD;
		}
		String Date1 = "";
		try {
			Date1 = req.getParameter("date1").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		String Date2 = "";
		try {
			Date2 = req.getParameter("date2").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		String Date3 = "";
		try {
			Date3 = req.getParameter("date3").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		switch (inptOPT) {
		case 1 : //New
			res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0325?SCREEN=200&E01FEOCUN=" + CusNumb + "&E01FEOBNK=" + user.getE01UBK());
			break;				
		case 2 : //Maintenance
			res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0325?SCREEN=400&E01FEOCUN=" + CusNumb +  "&E01FEODT1=" + Date1 +  "&E01FEODT2=" + Date2 +  "&E01FEODT3=" + Date3 +  "&E01FEOBNK=" + user.getE01UBK());
			break;
		case 3  ://Delete
			res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0325?SCREEN=600&E01FEOCUN=" + CusNumb +  "&E01FEODT1=" + Date1 +  "&E01FEODT2=" + Date2 +  "&E01FEODT3=" + Date3 +  "&E01FEOBNK=" + user.getE01UBK());
			break;																				
		default :
			res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0325?SCREEN=200&E01FEOCUN=" + CusNumb);
		}
	}

	private void procReqPos(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0322", req);
			EWD0322DSMessage msgList = (EWD0322DSMessage) mp.getMessageRecord("EWD0322DS");
			msgList.setRWDUSR(user.getH01USR());
	        msgList.setRWDTYP("S");
			try {
		 	  	msgList.setSWDCUN(req.getParameter("E01FESCUN").trim());
		    	userPO.setCusNum(msgList.getSWDCUN());
			} catch (Exception e)	{
				msgList.setSWDCUN("0");
			}

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("SWDOPE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0000?SCREEN=1100");
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				Iterator iterator = list.iterator();
				int indexRow = 0;
				while (iterator.hasNext()) {
					msgList = (EWD0322DSMessage) iterator.next();
					myRow = new StringBuffer("<TR class=\"" + (indexRow % 2 == 0 ? "trclear" : "trdark") + "\">");
					myRow.append("<TD width=\"5%\" NOWRAP ALIGN=CENTER><input type=\"radio\" name=\"CUSTOMER\" value=\"" + msgList.getSWDCUN() + "\" onclick=\"getValor('" + msgList.getSWDCUN() + "', '" + msgList.getSWDVA1() + "', '" + msgList.getSWDVA2() +  "', '" + msgList.getSWDVA3() +"')\"></TD>");
					myRow.append("<TD width=\"25%\" NOWRAP ALIGN=LEFT>"+ Util.formatCell(msgList.getSWDCUN()) + "</TD>");
					myRow.append("<TD width=\"15%\" NOWRAP ALIGN=CENTER>"+ Util.formatDate(msgList.getSWDVA1(),msgList.getSWDVA2(),msgList.getSWDVA3()) + "</TD>");
					myRow.append("<TD width=\"10%\" NOWRAP ALIGN=CENTER>"+ Util.formatCell(msgList.getSWDCCY()) + "</TD>");
					myRow.append("<TD width=\"15%\" NOWRAP ALIGN=RIGHT>"+ Util.fcolorCCY(msgList.getSWDAMN()) + "</TD>");
					myRow.append("<TD width=\"15%\" NOWRAP ALIGN=RIGHT>"+ Util.formatCell(msgList.getSWDAMU()) + "</TD>");
					myRow.append("<TD width=\"15%\" NOWRAP ALIGN=RIGHT>"+ Util.formatCell(msgList.getSWDAMA()) + "</TD>");
					myRow.append("</TR>");
					indexRow ++;
					beanList.addRow(msgList.getSWDTYL(), myRow.toString());
				}
				
				session.setAttribute("limPos", beanList);
				session.setAttribute("userPO", userPO);

				forward("EWD0322S_client_limits.jsp", req, res);

			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}
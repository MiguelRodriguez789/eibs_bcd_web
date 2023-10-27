package datapro.eibs.helps;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0300DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEWD0300 extends JSEIBSServlet {

	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen) {
        case 1: // Show List according with parameters
            procReqList(user, req, res, session);
            break;

        case 2: // Show Detail Basic Inquiry Screen
            procActionPos(user, req, res, session);
            break;
            
		case 11: // Show List for window help
			procReqListHelp(user, req, res, session);
			break;
			
		case 100: // Show Paremeters Selection Screen
			procReqEnterSearch(user, req, res, session);
			break;

        default:
            forward(devPage, req, res);
            break;

        }
	}

	private void procReqEnterSearch(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setOption("PR");
		
		forward("ESD0088_cus_inquiry_sel_portfolio.jsp", req, res);
	}

	private void procReqListHelp(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0300", req);
			EWD0300DSMessage msgHelp = (EWD0300DSMessage) mp.getMessageRecord("EWD0300DS");
			try {
				msgHelp.setSWDCUN(req.getParameter("CUSTOMER").trim());
			} catch (Exception e) {
				msgHelp.setSWDCUN("0");
			}
			userPO.setCusNum(msgHelp.getSWDCUN());
			try {
				msgHelp.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgHelp.setRWDFRC("0");
			}
			msgHelp.setRWDTYP(" ");

			mp.sendMessage(msgHelp);
			JBObjList list = mp.receiveMessageRecordList("SWDOPE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				boolean firstTime = true;
				StringBuffer myRow = null;
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msgHelp = (EWD0300DSMessage) iterator.next();
					if( firstTime) {
						firstTime = false;
						beanList.setFirstRec(Integer.parseInt(msgHelp.getSWDREC()));
					}
					myRow = new StringBuffer("<TR>");
					myRow.append("<td nowrap><a href=\"javascript:enter('" + msgHelp.getSWDNUM() + "','" + msgHelp.getSWDCUN() + "')\">" + msgHelp.getSWDNME() + "</a></td>");
					myRow.append("<td nowrap><a href=\"javascript:enter('" + msgHelp.getSWDNUM() + "','" + msgHelp.getSWDCUN() + "')\">" + msgHelp.getSWDNUM() + "</a></td>");
					myRow.append("<td nowrap><a href=\"javascript:enter('" + msgHelp.getSWDNUM() + "','" + msgHelp.getSWDCUN() + "')\">" + msgHelp.getSWDDSC() + "</a></td>");
					myRow.append("<td nowrap><a href=\"javascript:enter('" + msgHelp.getSWDNUM() + "','" + msgHelp.getSWDCUN() + "')\">" + msgHelp.getSWDLEGNME() + "</a></td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("EWD0300Help", beanList);
				pageName = "EWD0300_cus_port_helpmessage.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionPos(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req); 
				
		int inptOPT = 0;
		try {
			inptOPT = Integer.parseInt(req.getParameter("opt"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String CODE = req.getParameter("CODE");
		String CUSTOMER = req.getParameter("CUSTOMER");
		
		userPO.setCusNum(req.getParameter("CODE"));
		userPO.setIdentifier(req.getParameter("CUSTOMER"));
		userPO.setPurpose("INQUIRY");
		
        switch(inptOPT) {
        case 4: // 
            res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSESD0088?SCREEN=500" + "&CODE=" + CODE + "&CUSTOMER=" + CUSTOMER);
            break;

        default:
            res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSESD0088?SCREEN=500" + "&CODE=" + CODE + "&CUSTOMER=" + CUSTOMER);
            break;

        }
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0300", req);
			EWD0300DSMessage msgList = (EWD0300DSMessage) mp.getMessageRecord("EWD0300DS");
			try {
				msgList.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgList.setRWDFRC("0");
			}
			try {
                msgList.setSWDNUM(req.getParameter("CUSTOMER").trim());
                userPO.setHeader20("C");
			} catch (Exception e) {
            	msgList.setSWDNUM("0");
                userPO.setHeader20("");
			}
			userPO.setCusNum(msgList.getSWDCUN());
			try {
				msgList.setSWDOFC(req.getParameter("OFFICER").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
                msgList.setSWDUP1(req.getParameter("SWDUP1").trim());
                msgList.setSWDUP2(req.getParameter("SWDUP2").trim());
                msgList.setSWDUP3(req.getParameter("SWDUP3").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgList.setRWDTYP(req.getParameter("RWDTYP").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgList.setSWDSTS(req.getParameter("SWDSTS").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			msgList.setSWDCUN("0");

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("SWDOPE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSEWD0300?SCREEN=100");
			} else {
				JBList beanList = new JBList();
                boolean firstTime = true;
                String chk = "";
                StringBuffer myRow = null;
                int indexRow = 0;
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msgList = (EWD0300DSMessage) iterator.next();
                    if (firstTime) {
                        firstTime = false;
                        beanList.setFirstRec(Integer.parseInt(msgList.getSWDREC()));
                        chk = "checked";
                    } else {
                        chk = "";
                    }
                    myRow = new StringBuffer("<TR>");
                    if(msgList.getSWDPRFOPE().trim().equals("A")) {
                        myRow.append("<TD ALIGN=\"CENTER\" nowrap width=\"10%\"><input type=\"radio\" name=\"PORTNUM\" value=\"" + msgList.getSWDNUM() + "\" " + chk + " onclick=\"getParams('" + msgList.getSWDNUM() + "', '" + msgList.getSWDCUN() + "', " + indexRow + ")\"></TD>");
                    } else {
                        myRow.append("<TD ALIGN=\"CENTER\" nowrap width=\"10%\"><img src=\"" + req.getContextPath() + "/images/1bori.gif\" title=\"Pending Approval\" align=\"absmiddle\" border=\"0\" ><input type=\"radio\" name=\"PORTNUM\" value=\"" + msgList.getSWDNUM() + "\" " + chk + " onclick=\"getParams('" + msgList.getSWDNUM() + "', '" + msgList.getSWDCUN() + "', " + indexRow + ")\"></TD>");
                    }                    
                    myRow.append("<TD ALIGN=\"CENTER\" nowrap width=\"20%\">" + msgList.getSWDNUM() + "</td>");
                    myRow.append("<TD ALIGN=\"LEFT\" nowrap width=\"30%\">" + msgList.getSWDDSC() + "</td>");
					myRow.append("<TD ALIGN=\"CENTER\" nowrap width=\"10%\">" + msgList.getSWDCUN() + "</td>");
                    myRow.append("<TD ALIGN=\"CENTER\" nowrap width=\"20%\">" + Util.formatDate(msgList.getSWDOP1(), msgList.getSWDOP2(), msgList.getSWDOP3()) + "</td>");
                    myRow.append("<TD ALIGN=\"CENTER\" nowrap width=\"10%\">" + msgList.getSWDVCY());
                    myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA" + indexRow + "\" VALUE=\"" + msgList.getSWDOFC() + "<br><div nowrap>" + msgList.getSWDOFN() + "</div><br>" + msgList.getSWDLEGNME() + "\"></TD>");
                    myRow.append("</TR>");
                    beanList.addRow("", myRow.toString());
                    indexRow++;
				}
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("EWD0300Help", beanList);
				forward("EWD0300_sel_portfolio.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}

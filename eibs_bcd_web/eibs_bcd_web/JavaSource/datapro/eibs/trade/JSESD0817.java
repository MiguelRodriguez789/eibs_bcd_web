package datapro.eibs.trade;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC045001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD081701Message;
import datapro.eibs.beans.ESD081702Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSESD0817 extends JSEIBSServlet {

	// CIF options
	protected static final int R_LIST 				= 1;
	protected static final int R_SEARCH 			= 2;
	protected static final int A_SEARCH 			= 3;
	protected static final int R_PRINT 				= 4;
	protected static final int R_DESC 				= 5;
	protected static final int R_IN_AN 				= 6;

	// entering options
	protected static final int R_ENTER 				= 100;
	protected static final int A_ENTER	 			= 200;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_LIST :
				procReqList(user, req, res, session);
				break;
			case R_PRINT :
				procReqPrintList(user, req, res, session);
				break;
			//entering options
			case R_ENTER :
				procReqSTEnterSearch(user, req, res, session);
				break;
			case A_ENTER :
				procActionSTEnterSearch(user, req, res, session);
				break;
			default :
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}

	protected void procActionSTEnterSearch(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0450", req);
			ELC045001Message msgLC = (ELC045001Message) mp.getMessageRecord("ELC045001", user.getH01USR(), "0002");
		 	msgLC.setH01SCRCOD("01");
		 	msgLC.setE01LCMACC(req.getParameter("E01LCMACC") == null ? "0" : req.getParameter("E01LCMACC"));
		 	
		 	mp.sendMessage(msgLC);
		 	
		 	ELEERRMessage msgError = new ELEERRMessage();
		 	MessageRecord msg = mp.receiveMessageRecord();
		 	
		 	if (mp.hasError(msg)) {
		 		msgError = (ELEERRMessage) msg;
		 		
				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
			 	forward("ESD0817_lc_enter_stat.jsp", req, res);
		 	} else {
		 		msgLC = (ELC045001Message) msg;
				userPO.setIdentifier(msgLC.getE01LCMACC());
				userPO.setHeader1(msgLC.getE01LCMPRO());
				userPO.setHeader2(msgLC.getE01LCMCUN());
				userPO.setHeader3(msgLC.getE01CUSNA1());
				userPO.setCurrency(msgLC.getE01LCMCCY());
				userPO.setOfficer(msgLC.getE01LCMOFC() + " - " + msgLC.getE01DSCOFC());
		 		
				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				procReqList(user, req, res, session);
		 	}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqSTEnterSearch(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("LC");
		userPO.setPurpose("STATEMENT");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("ESD0817_lc_enter_stat.jsp", req, res);
	}

	protected void procReqPrintList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0817", req);
			ESD081701Message msgSearch = (ESD081701Message) mp.getMessageRecord("ESD081701", user.getH01USR(), "0004");
		 	msgSearch.setH01SCRCOD("01");
		 	msgSearch.setE01NUMREC(req.getParameter("Pos") == null ? "0" : req.getParameter("Pos"));
		 	msgSearch.setE01TRAACC(userPO.getIdentifier());
		 	
			mp.sendMessage(msgSearch);
		 	
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
			ELEERRMessage msgError = new ELEERRMessage();
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				if (userPO.getPurpose().equals("INQUIRY")) {
					pageName = "ELC0450_lc_inq_basic.jsp";
				} else {
					pageName = "ESD0817_lc_enter_stat.jsp";
				}
			} else {
				list.initRow();
				if (list.getNextRow()) {
					ESD081702Message msgHeader = (ESD081702Message) list.getRecord();
					session.setAttribute("lcBalances", msgHeader);
				}
				JBList beanList = new JBList();
				boolean firstTime = true;
				StringBuffer myRow = null;
				String strDebito = "";
				String strCredito = "";
				BigDecimal debito = new BigDecimal("0.00");
				BigDecimal credito = new BigDecimal("0.00");
				
				while (list.getNextRow()) {
					ESD081701Message msgList = (ESD081701Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						beanList.setFirstRec(Integer.parseInt(msgList.getE01NUMREC()));
					}
					if (msgList.getE01TRADCC().equals("0")) {
						 strDebito = Util.fcolorCCY(msgList.getE01TRAAMT());
						 debito = debito.add(msgList.getBigDecimalE01TRAAMT());
						 strCredito ="&nbsp;";
					} else if (msgList.getE01TRADCC().equals("5")) {
						 strCredito = Util.fcolorCCY(msgList.getE01TRAAMT());
						 credito = credito.add(msgList.getBigDecimalE01TRAAMT());
						 strDebito ="&nbsp;";
					}
					myRow =  new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\">" + Util.formatCustomDate(user.getE01DTF(),
																						msgList.getBigDecimalE01TRABDM().intValue(),
																						msgList.getBigDecimalE01TRABDD().intValue(),
																						msgList.getBigDecimalE01TRABDY().intValue()) 
																						+ "</TD>");
					myRow.append("<TD NOWRAP ALIGN=CENTER>" + Util.formatCustomDate(user.getE01DTF(),
																					msgList.getBigDecimalE01TRAVDM().intValue(),
																					msgList.getBigDecimalE01TRAVDD().intValue(),
																					msgList.getBigDecimalE01TRAVDY().intValue()) 
																					+ "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\">" + Util.formatCell(msgList.getE01TRACDE()) + "</TD>");
					
					if(msgList.getE01NUMNAR().equals("0")){
						myRow.append("<TD>" + Util.formatCell(msgList.getE01TRANAR()) + "</TD>");}
					else if(msgList.getE01NUMNAR().trim().equals("1")) {
						myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"+ Util.formatCell(msgList.getE01TRANA1()) + "</TD>");
				    }				   		
				    else if(msgList.getE01NUMNAR().trim().equals("2")) {
					    myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA2()) + "</TD>");
					}
					else if(msgList.getE01NUMNAR().trim().equals("3")) {
					    myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA3()) + "</TD>");
					}
					else if(msgList.getE01NUMNAR().trim().equals("4")) {
					    myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA3()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA4()) + "</TD>");
					}
					else if(msgList.getE01NUMNAR().trim().equals("5")) {
					    myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA3()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA4()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA5()) + "</TD>");
					}
					else if(msgList.getE01NUMNAR().trim().equals("6")) {
					    myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA3()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA4()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA5()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA6()) + "</TD>");
					}
					else if(msgList.getE01NUMNAR().trim().equals("7")) {
					    myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA3()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA4()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA5()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA6()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA7()) + "</TD>");
					}
					else if(msgList.getE01NUMNAR().trim().equals("8")) {
					    myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA3()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA4()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA5()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA6()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA7()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA8()) + "</TD>");
					}
					else if(msgList.getE01NUMNAR().trim().equals("9")) {
					    myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA3()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA4()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA5()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA6()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA7()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA8()) + "<BR>"
						+ Util.formatCell(msgList.getE01TRANA9()) + "</TD>");
					}

					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(strDebito) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(strCredito) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(msgList.getE01TRABTH()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setShowNext(list.getShowNext());
				userPO.setHeader19(Util.fcolorCCY(debito.toString()));
				userPO.setHeader20(Util.fcolorCCY(credito.toString()));
				session.setAttribute("cifList", beanList);
				
				pageName = "ESD0817_lc_list_print_fp.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			
		 	forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0817", req);
			ESD081701Message msgSearch = (ESD081701Message) mp.getMessageRecord("ESD081701", user.getH01USR(), "0004");
		 	msgSearch.setH01SCRCOD("01");
		 	msgSearch.setE01NUMREC(req.getParameter("Pos") == null ? "0" : req.getParameter("Pos"));
		 	msgSearch.setE01TRAACC(userPO.getIdentifier());
		 	
			mp.sendMessage(msgSearch);
		 	
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
			ELEERRMessage msgError = new ELEERRMessage();
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				if (userPO.getPurpose().equals("INQUIRY")) {
					pageName = "ELC0450_lc_inq_basic.jsp";
				} else {
					pageName = "ESD0817_lc_enter_stat.jsp";
				}
			} else {
				list.initRow();
				if (list.getNextRow()) {
					ESD081702Message msgHeader = (ESD081702Message) list.getRecord();
					session.setAttribute("lcBalances", msgHeader);
				}
				JBList beanList = new JBList();
				boolean firstTime = true;
				StringBuffer myRow = null;
				String strDebito = "";
				String strCredito = "";
				BigDecimal debito = new BigDecimal("0.00");
				BigDecimal credito = new BigDecimal("0.00");
				
				while (list.getNextRow()) {
					ESD081701Message msgList = (ESD081701Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						beanList.setFirstRec(Integer.parseInt(msgList.getE01NUMREC()));
					}
					if (msgList.getE01TRADCC().equals("0")) {
						 strDebito = Util.fcolorCCY(msgList.getE01TRAAMT());
						 debito = debito.add(msgList.getBigDecimalE01TRAAMT());
						 strCredito ="&nbsp;";
					} else if (msgList.getE01TRADCC().equals("5")) {
						 strCredito = Util.fcolorCCY(msgList.getE01TRAAMT());
						 credito = credito.add(msgList.getBigDecimalE01TRAAMT());
						 strDebito ="&nbsp;";
					}
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:GetBatchDet('"+msgList.getE01TRABDM()+"','"+msgList.getE01TRABDD()+"','"+msgList.getE01TRABDY()+"','"+msgList.getE01TRABTH()+"','"+msgList.getE01TRAACR()+ "')\">"
					      + Util.formatCustomDate(user.getE01DTF(),
					    		  			msgList.getBigDecimalE01TRABDM().intValue(),
					    		  			msgList.getBigDecimalE01TRABDD().intValue(),
					    		  			msgList.getBigDecimalE01TRABDY().intValue()) 
					    		  			+ "</A></TD>");				
					myRow.append("<TD NOWRAP ALIGN=CENTER>" + Util.formatCustomDate(user.getE01DTF(),
																					msgList.getBigDecimalE01TRAVDM().intValue(),
																					msgList.getBigDecimalE01TRAVDD().intValue(),
																					msgList.getBigDecimalE01TRAVDY().intValue()) 
																					+ "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\">" + Util.formatCell(msgList.getE01TRACDE()) + "</TD>");
					if(msgList.getE01TRADRR().equals("0")){
					myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "</TD>");}
					else {
					myRow.append("<TD NOWRAP><A HREF=\"javascript:GetStatDesc('" + msgList.getE01TRADRR() + "','" + msgList.getE01TRANAR() 
							+ "','" + Util.formatCustomDate(user.getE01DTF(),
															msgList.getBigDecimalE01TRABDM().intValue(),
															msgList.getBigDecimalE01TRABDD().intValue(),
															msgList.getBigDecimalE01TRABDY().intValue()) 
															+ "','" + Util.formatCell(msgList.getE01TRACDE()) + "')\">" + Util.formatCell(msgList.getE01TRANAR()) + 
							"</A></TD>");
					}
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(strDebito) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(strCredito) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:GetBatchDet('"+msgList.getE01TRABDM()+"','"+msgList.getE01TRABDD()+"','"+msgList.getE01TRABDY()+"','"+msgList.getE01TRABTH()+"','"+msgList.getE01TRAACR()+ "')\">"
					      + Util.formatCell(msgList.getE01TRABTH()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=CENTER>" + msgList.getE01TRATIM() + "</TD>");				
					myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRAUSO()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=CENTER>" + Util.formatCell(msgList.getE01TRAOBK()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=CENTER>" + Util.formatCell(msgList.getE01TRAOBR()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setShowNext(list.getShowNext());
				userPO.setHeader19(Util.fcolorCCY(debito.toString()));
				userPO.setHeader20(Util.fcolorCCY(credito.toString()));
				session.setAttribute("cifList", beanList);
				
				pageName = "ESD0817_lc_list_fp.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			
		 	forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

}

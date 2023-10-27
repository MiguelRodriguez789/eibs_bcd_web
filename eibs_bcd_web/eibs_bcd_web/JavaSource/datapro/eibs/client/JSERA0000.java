package datapro.eibs.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ERA000001Message;
import datapro.eibs.beans.ERA000002Message;
import datapro.eibs.beans.ERA000003Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.products.JOActionRedirect;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSERA0000 extends JSEIBSServlet {

	// options
	protected static final int R_COLL_ASSETS					= 1;
	protected static final int A_COLLATERAL						= 2;
	protected static final int A_INQ_COLLATERAL					= 4;
	protected static final int R_COLL_LIABILITIES				= 3;
	protected static final int R_COLL_ASSETS_BY_CUSTOMER		= 5;
	protected static final int R_COLL_LIABILITIES_BY_CUSTOMER	= 7;
	protected static final int R_COLL_LIABILITIES_POPUP         = 8;
	
	// entering options
	protected static final int R_ENTER 							= 100;
	protected static final int A_ENTER	 						= 200;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			// Request
			case R_COLL_ASSETS :
				procReqListCollAssets(user, req, res, session);
				break;
			case R_COLL_LIABILITIES_POPUP : 
			case R_COLL_LIABILITIES : 
				procReqListCollLiabilities(user, req, res, session, screen);
				break;
			case R_COLL_LIABILITIES_BY_CUSTOMER :
				procReqListCollLiabilitiesByCustomer(user, req, res, session);
				break;
			// Action
			case A_COLLATERAL :
				procActionListColl(user, req, res, session);
				break;
			case A_INQ_COLLATERAL :
				procActionInqListColl(user, req, res, session);
				break;
			//entering options
			case R_ENTER : 
				procReqEnter(user, req, res, session);
				break;
			case A_ENTER : 
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("COLLATERAL");
		userPO.setPurpose("");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("ERA0000_collateral_enter.jsp", req, res);
	}

	private void procActionInqListColl(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		int appCode = 0;
		try {
			appCode = Integer.parseInt(req.getParameter("APPCODE"));
		} catch (Exception e) {
			appCode = 0;
		}
		String accNum = req.getParameter("ACCNUM") == null ? "" : req.getParameter("ACCNUM");
		
		JOActionRedirect red = null;
		if (appCode == 90) {
			String lnNum = "";
			try {
				lnNum = accNum.substring(accNum.length() - 4, accNum.length());
			} catch (Exception e) {
				lnNum = "";
			}
			String clientNum = "";
			try {
	  			clientNum = accNum.substring(0, accNum.length() - 4);
			} catch (Exception e) {
				clientNum = "";
			}
			red =
				new datapro.eibs.products.JOActionRedirect(
						lnNum,	
						ACC_INQUIRY,
						appCode,
						clientNum,
						getLangPath(user),
						session);
		} else {
			red =
				new datapro.eibs.products.JOActionRedirect(
						ACC_INQUIRY,
						appCode,
						accNum,
						getLangPath(user),
						session);
		}
		
		res.sendRedirect(srctx + red.action());
	}

	private void procActionListColl(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		int appCode = 0;
		try {
			appCode = Integer.parseInt(req.getParameter("APPCODE"));
		} catch (Exception e) {
			appCode = 0;
		}
		String accNum = req.getParameter("REF") == null ? "" : req.getParameter("REF");
		//String clientNum = req.getParameter("CUSNUM") == null ? "" : req.getParameter("CUSNUM");
		
		JOActionRedirect red =
			new datapro.eibs.products.JOActionRedirect(
				ACC_INQUIRY,
				appCode,
				accNum,
				getLangPath(user),
				session);
		res.sendRedirect(srctx + red.action());
	}

	private void procReqListCollLiabilitiesByCustomer(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0000", req);
			ERA000003Message msgList = (ERA000003Message) mp.getMessageRecord("ERA000003");
			msgList.setH03USERID(user.getH01USR());
		 	msgList.setH03PROGRM("ELN0110");
		 	msgList.setH03TIMSYS(getTimeStamp());
		 	msgList.setH03SCRCOD("01");
		 	msgList.setH03OPECOD("0004");
			try{
				msgList.setE03ROCCUN(userPO.getCusNum());
			} catch (Exception e) {
				msgList.setE03ROCCUN("0");
			}
			
			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("E03ENDFLD");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				boolean firstTime = true;
				String ref = "";
				String appCode = "";
				list.initRow();
				while (list.getNextRow()) {
					msgList = (ERA000003Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						userPO.setCusNum(msgList.getE03ROCCUN());
//						userPO.setCusName(msgList.getE03CUSNA1());
					}
					myRow = new StringBuffer("<TR>");					
					ref = msgList.getE03ROCREF();
					appCode = msgList.getE03CIFACD();
					myRow.append("<TD NOWRAP><A HREF=\"javascript:goCollInq('"
							+ ref + "', '" + appCode + "')\">"
							+ Util.formatCell(ref) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:goCollInq('"
							+ ref + "', '" + appCode + "')\">"
							+ Util.formatCell(msgList.getE03ROCTYP())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:goCollInq('"
							+ ref + "', '" + appCode + "')\">"
							+ Util.formatCell(msgList.getE03ROCCCY())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT><A HREF=\"javascript:goCollInq('"
									+ ref
									+ "', '"
									+ appCode
									+ "')\">"
									+ Util.fcolorCCY(msgList.getE03ROCAMT())
									+ "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT><A HREF=\"javascript:goCollInq('"
									+ ref
									+ "', '"
									+ appCode
									+ "')\">"
									+ Util.fcolorCCY(msgList.getE03ROCUSE())
									+ "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT><A HREF=\"javascript:goCollInq('"
									+ ref
									+ "', '"
									+ appCode
									+ "')\">"
									+ Util.fcolorCCY(msgList.getE03ROCBAL())
									+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:goCollInq('"
							+ ref
							+ "', '"
							+ appCode
							+ "')\">"
							+ Util.formatCustomDate(user.getE01DTF(), 
											msgList.getBigDecimalE03ROCODM().intValue(),
											msgList.getBigDecimalE03ROCODD().intValue(),
											msgList.getBigDecimalE03ROCODY().intValue())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:goCollInq('"
							+ ref
							+ "', '"
							+ appCode
							+ "')\">"
							+ Util.formatCustomDate(user.getE01DTF(), 
									msgList.getBigDecimalE03ROCMDM().intValue(),
									msgList.getBigDecimalE03ROCMDD().intValue(),
									msgList.getBigDecimalE03ROCMDY().intValue())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT><A HREF=\"javascript:goCollInq('"
							+ ref
							+ "', '"
							+ appCode
							+ "')\">"
							+ Util.fcolorCCY(msgList.getE03CUSNA1())
							+ "</A></TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				session.setAttribute("collList", beanList);
				
				pageName = "ERA0000_collateral_list_liabilities_by_client.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqListCollLiabilities(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session , int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		String collateralNum = "0";
		try {
			try {
				if(screen == R_COLL_LIABILITIES_POPUP){
					collateralNum = Util.justifyRight(Util.getReqParameter("COLLNUM", req), COLL_REF_B);
				} else {
					collateralNum = Util.justifyRight(userPO.getIdentifier(), COLL_REF_B);					
				}
			} catch (Exception e) {
			}			
			
			mp = getMessageProcessor("ERA0000", req);
			ERA000002Message msgList = (ERA000002Message) mp.getMessageRecord("ERA000002");
			msgList.setH02USERID(user.getH01USR());
		 	msgList.setH02PROGRM("ERA0000");
		 	msgList.setH02TIMSYS(getTimeStamp());
		 	msgList.setH02SCRCOD("01");
		 	msgList.setH02OPECOD("0004");
			msgList.setE02RCLACB(collateralNum);
			
			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("E02ENDFLD");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				boolean firstTime = true;
				list.initRow();
				while (list.getNextRow()) {
					msgList = (ERA000002Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						userPO.setCusNum("");
						userPO.setCusName("");
						userPO.setAccNum(msgList.getE02RCLACB());
						userPO.setCurrency(msgList.getE02RCLBCCY());
						userPO.setHeader5(msgList.getE02RCLBTYP());
						userPO.setHeader6(msgList.getE02RCLBPRO());
						userPO.setHeader7(Util.fcolorCCY(msgList.getE02RCLBBAL()));
						userPO.setHeader8(Util.fcolorCCY(msgList.getE02RCLBDIS()));
					}
					myRow = new StringBuffer("<TR>");					
					myRow
							.append("<TD NOWRAP><A HREF=\"javascript:showInqAcc('"
									+ msgList.getE02RCLACA()
									+ "','"
									+ msgList.getE02RCLAACD()
									+ "')\">"
									+ Util.formatCell(msgList.getE02RCLACA())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP><A HREF=\"javascript:showInqAcc('"
									+ msgList.getE02RCLACA()
									+ "','"
									+ msgList.getE02RCLAACD()
									+ "')\">"
									+ Util.formatCell(msgList.getE02RCLATYP())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP><A HREF=\"javascript:showInqAcc('"
									+ msgList.getE02RCLACA()
									+ "','"
									+ msgList.getE02RCLAACD()
									+ "')\">"
									+ Util.formatCell(msgList.getE02RCLACCY())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=RIGHT><A HREF=\"javascript:showInqAcc('"
									+ msgList.getE02RCLACA()
									+ "','"
									+ msgList.getE02RCLAACD()
									+ "')\">"
									+ Util.fcolorCCY(msgList.getE02RCLABAL())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=RIGHT><A HREF=\"javascript:showInqAcc('"
									+ msgList.getE02RCLACA()
									+ "','"
									+ msgList.getE02RCLAACD()
									+ "')\">"
									+ Util.fcolorCCY(msgList.getE02RCLACOL())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=RIGHT><A HREF=\"javascript:showInqAcc('"
									+ msgList.getE02RCLACA()
									+ "','"
									+ msgList.getE02RCLAACD()
									+ "')\">"
									+ Util.fcolorCCY(msgList.getE02RCLOCOL())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=RIGHT><A HREF=\"javascript:showInqAcc('"
									+ msgList.getE02RCLACA()
									+ "','"
									+ msgList.getE02RCLAACD()
									+ "')\">"
									+ Util.fcolorCCY(msgList.getE02RCLAREM())
									+ "</A></TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				session.setAttribute("clList", beanList);
				
				pageName = "ERA0000_collateral_list_liabilities.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqListCollAssets(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0000", req);
			ERA000001Message msgList = (ERA000001Message) mp.getMessageRecord("ERA000001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("ELN0110");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01OPECOD("0004");
			try {
				if( userPO.getCreditLineNum().trim().equals("")|| Integer.parseInt(userPO.getCreditLineNum())==0 
						||userPO.getOption().equals("LN"))
					msgList.setE01RCLACA(userPO.getIdentifier());
				else{
						msgList.setE01RCLACA(userPO.getIdentifier().substring(1,9));
						msgList.setE01RCLLNA(userPO.getCreditLineNum()); 
											
				}
			} catch (Exception e) {
				msgList.setE01RCLACA("");
			}
			
			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("E01ENDFLD");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				boolean firstTime = true;
				list.initRow();
				while (list.getNextRow()) {
					msgList = (ERA000001Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						userPO.setCusNum("");
						userPO.setCusName("");
						userPO.setAccNum(msgList.getE01RCLACA());
						userPO.setCurrency(msgList.getE01RCLACCY());
						userPO.setHeader5(msgList.getE01RCLATYP());
						userPO.setHeader6(msgList.getE01RCLAPRO());
						userPO.setHeader7(Util.fcolorCCY(msgList.getE01RCLABAL()));
						userPO.setHeader8(Util.fcolorCCY(msgList.getE01RCLADIS()));
					}
					myRow = new StringBuffer("<TR>");					
					myRow.append("<TD NOWRAP><A HREF=\"javascript:showInqCollateral('"
							+ msgList.getE01RCLACB() + "')\">"
							+ Util.formatCell(msgList.getE01RCLACB())
							+ "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=CENTER><A HREF=\"javascript:showInqCollateral('"
									+ msgList.getE01RCLACB()
									+ "')\">"
									+ Util.formatCell(msgList.getE01RCLBTYP())
									+ "</TD>");
					myRow
							.append("<TD NOWRAP ALIGN=CENTER><A HREF=\"javascript:showInqCollateral('"
									+ msgList.getE01RCLACB()
									+ "')\">"
									+ Util.formatCell(msgList.getE01RCLBCCY())
									+ "</TD>");
					myRow
							.append("<TD NOWRAP ALIGN=RIGHT><A HREF=\"javascript:showInqCollateral('"
									+ msgList.getE01RCLACB()
									+ "')\">"
									+ Util.fcolorCCY(msgList.getE01RCLBBAL())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=RIGHT><A HREF=\"javascript:showInqCollateral('"
									+ msgList.getE01RCLACB()
									+ "')\">"
									+ Util.fcolorCCY(msgList.getE01RCLBCOL())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=RIGHT><A HREF=\"javascript:showInqCollateral('"
									+ msgList.getE01RCLACB()
									+ "')\">"
									+ Util.fcolorCCY(msgList.getE01RCLOCOL())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=RIGHT><A HREF=\"javascript:showInqCollateral('"
									+ msgList.getE01RCLACB()
									+ "')\">"
									+ Util.fcolorCCY(msgList.getE01RCLBDIS())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=CENTER><A HREF=\"javascript:showInqCollateral('"
									+ msgList.getE01RCLACB()
									+ "')\">"
									+ Util.formatCell(msgList.getE01CUSNA1())
									+ "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				session.setAttribute("clList", beanList);
				
				pageName = "ERA0000_collateral_list_assets.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

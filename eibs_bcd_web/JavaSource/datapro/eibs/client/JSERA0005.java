package datapro.eibs.client;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ERA000501Message;
import datapro.eibs.beans.ERA000502Message;
import datapro.eibs.beans.ERA000503Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSERA0005 extends JSEIBSServlet {
	
	protected static final int A_ASSETS_LIST		= 6;	///////////////
	protected static final int A_BASIC				= 2;	//procActionBasic
	protected static final int A_COLL_LIST			= 4;	//////////////
	protected static final int A_ENTER_SELECTION 	= 200;	//procActionEnterSelection
	protected static final int R_ASSETS_LIST		= 5;	//procReqAssetsList
	// certificate of deposit 
	protected static final int R_BASIC				= 1;	//////////////
	protected static final int R_COLL_LIST			= 3;	//procReqCollList
	// entering options
	protected static final int R_ENTER_SELECTION	= 100;	//procReqEnterSelection
	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		// BEGIN CD
		//Request
		case R_COLL_LIST :
			procReqCollList(user, req, res, session);
			break;
		case R_ASSETS_LIST :
			procReqAssetsList(user, req, res, session);
			break;	
		// Action
		case A_BASIC :
			procActionBasic(user, req, res, session);
			break;
		// END CD

		// BEGIN Entering
		// Request
		case R_ENTER_SELECTION : 
			procReqEnterSelection(user, req, res, session);
			break;
		
		// Action 
		case A_ENTER_SELECTION : 
			procActionEnterSelection(user, req, res, session);
			break;
			
		// END Entering

		default :
			forward(devPage, req, res);
			break;
		}
	}


	private void procActionEnterSelection(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0005", req);
			ERA000501Message msgColl = (ERA000501Message) mp.getMessageRecord("ERA000501");
			msgColl.setH01USERID(user.getH01USR());
			msgColl.setH01PROGRM("ERA0005");
		 	msgColl.setH01TIMSYS(getTimeStamp());
			msgColl.setH01SCRCOD("01");
			msgColl.setH01OPECOD("0002");
			try {
				msgColl.setE01RCLTIPO(req.getParameter("OPTION").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgColl.setE01RCLAACC(req.getParameter("ACCOUNT").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			int tipo = Util.parseInt(req.getParameter("OPTION").trim());
			switch (tipo) {
			case 2:
				userPO.setHeader2(msgColl.getE01RCLAACC());
				break;
			case 4:
				userPO.setHeader4(msgColl.getE01RCLAACC());
				break;
			default:
				userPO.setHeader1(msgColl.getE01RCLAACC());
				break;
			}
			
			try {
				msgColl.setE01RCLACUN(req.getParameter("CUSTOMER").trim());
				userPO.setCusNum(msgColl.getE01RCLACUN());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgColl.setE01RCLALNE(req.getParameter("ACCOUNT3").trim());
				userPO.setHeader3(msgColl.getE01RCLALNE());
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			try {
				msgColl.setE01RCLBACC(req.getParameter("OTHERACC").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			tipo = Util.parseInt(req.getParameter("OPTIONACC").trim());
			switch (tipo) {
			case 2:
				userPO.setHeader7(msgColl.getE01RCLBACC());
				break;
			default:
				userPO.setHeader6(msgColl.getE01RCLBACC());
				break;
			}

			try {
				msgColl.setE01RCLBOPE(req.getParameter("AMOUNT").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgColl.setE01RCLINDE(req.getParameter("ACTION").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgColl);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgColl = (ERA000501Message) mp.receiveMessageRecord("ERA000501");

			if (mp.hasError(msgError)) {
				pageName = "ERA0005_ga_selection.jsp";
			} else {
				userPO.setIdentifier(msgColl.getE01RCLAACC());
				userPO.setHeader20(msgColl.getE01RCLBCUN());
				pageName = "ERA0005_ga_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("gaBasic", msgColl);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void procReqEnterSelection(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("GA");
		userPO.setPurpose("NEW");
		session.setAttribute("userPO", userPO);
		
		forward("ERA0005_ga_selection.jsp", req, res);
	}


	private void procActionBasic(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA005", req);
			ERA000501Message msgColl = (ERA000501Message) mp.getMessageRecord("ERA000501");
			msgColl.setH01USERID(user.getH01USR());
			msgColl.setH01PROGRM("ERA005");
		 	msgColl.setH01TIMSYS(getTimeStamp());
			msgColl.setH01SCRCOD("01");
			msgColl.setH01OPECOD("0005");
			try {
				msgColl.setE01RCLBACC(req.getParameter("E01RCLBACC").trim());
			} catch (Exception e)	{
			   	msgColl.setE01RCLBACC("0");
			}
			try {
				msgColl.setE01RCLAACC(req.getParameter("E01RCLAACC").trim());
			} catch (Exception e)	{
			   	msgColl.setE01RCLAACC("0");
			}
			
			setMessageRecord(req, msgColl);

			mp.sendMessage(msgColl);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgColl = (ERA000501Message) mp.receiveMessageRecord("ERA000501");

			if (mp.hasError(msgError)) {
				pageName = "ERA0005_ga_basic.jsp";
			} else {
				userPO.setIdentifier(msgColl.getE01RCLAACC());
				pageName = "ERA0005_ga_confirm.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("gaBasic", msgColl);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void procReqAssetsList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		int posi = 0;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0005", req);
			ERA000503Message msgList = (ERA000503Message) mp.getMessageRecord("ERA000503");
			msgList.setH03USERID(user.getH01USR());
		 	msgList.setH03PROGRM("ERA0005");
		 	msgList.setH03TIMSYS(getTimeStamp());
		 	msgList.setH03OPECOD("0004");
		 	try {
		 		posi = Integer.parseInt(req.getParameter("Pos"));
		 		msgList.setH03SCRCOD("" + posi);
			} catch (Exception e) {
				msgList.setH03SCRCOD("0");
			}
		 	try {
		 		msgList.setE03RCLACUN(req.getParameter("NUMACC").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("H03FLGMAS");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "ERA0005_ga_basic.jsp";
			} else {
				boolean firstTime = true;
				StringBuffer myRow = null;
				JBList beanList = new JBList();
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msgList = (ERA000503Message) iterator.next();
					if (firstTime) {
						firstTime = false;
						userPO.setHeader2(msgList.getE03RCLACUN());
						userPO.setHeader3(msgList.getE03CUSNA1A());					
					}
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(msgList.getE03RCLAACC()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(msgList.getE03RCLAATY()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(msgList.getE03RCLACCY()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE03RCLAGAN()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE03RCLABAL()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE03RCLAREM()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("gaList", beanList);
				
				pageName = "ERA0005_ga_assets_list.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void procReqCollList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		int posi = 0;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0005", req);
			ERA000502Message msgList = (ERA000502Message) mp.getMessageRecord("ERA000502");
			msgList.setH02USERID(user.getH01USR());
		 	msgList.setH02PROGRM("ERA0005");
		 	msgList.setH02TIMSYS(getTimeStamp());
		 	msgList.setH02OPECOD("0004");
		 	try {
		 		posi = Integer.parseInt(req.getParameter("Pos"));
		 		msgList.setH02SCRCOD("" + posi);
			} catch (Exception e) {
				msgList.setH02SCRCOD("0");
			}
		 	try {
		 		msgList.setE02RCLBCUN(req.getParameter("NUMACC").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "ERA0005_ga_basic.jsp";
			} else {
				boolean firstTime = true;
				StringBuffer myRow = null;
				JBList beanList = new JBList();
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msgList = (ERA000502Message) iterator.next();
					if (firstTime) {
						firstTime = false;
						userPO.setHeader2(msgList.getE02RCLBCUN());
						userPO.setHeader3(msgList. getE02CUSNA1A());					
					}
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(msgList.getE02RCLBACC()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(msgList.getE02RCLBATY()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(msgList.getE02RCLBCCY()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE02RCLBBAL()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE02RCLBAUS()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE02RCLBAVL()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("gaList", beanList);
				
				pageName = "ERA0005_ga_collateral_list.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}
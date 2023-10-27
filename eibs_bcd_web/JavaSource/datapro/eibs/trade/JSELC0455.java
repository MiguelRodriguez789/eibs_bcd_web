package datapro.eibs.trade;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC045501Message;
import datapro.eibs.beans.ELC045502Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
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
public class JSELC0455 extends JSEIBSServlet {

	protected static final int R_LIST	= 1;
	protected static final int R_DOC	= 2;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_LIST :
				procReqList(user, req, res, session);
				break;
			case R_DOC :
				procReqDocDet(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	protected void procReqDocDet(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0455", req);
			ELC045502Message msgSearch = (ELC045502Message) mp.getMessageRecord("ELC045502");
			msgSearch.setH02USERID(user.getH01USR());
		 	msgSearch.setH02PROGRM("EDL0455");
		 	msgSearch.setH02TIMSYS(getTimeStamp());
		 	msgSearch.setH02SCRCOD("01");
		 	msgSearch.setH02OPECOD("0004");
			
			try {
			 	msgSearch.setE02LCMACC(userPO.getIdentifier());
			} catch (Exception e){
			 	msgSearch.setE02LCMACC("");
			}
			try {
			 	msgSearch.setE02LCDTYP(userPO.getHeader5());
			} catch (Exception e){
			 	msgSearch.setE02LCDTYP("");
			}
			try {
				msgSearch.setE02LCDBNK(userPO.getBank());
			} catch (Exception e){
				msgSearch.setE02LCDBNK("");
			}
			try {
			 	msgSearch.setE02LCDDNO(userPO.getHeader4());
			} catch (Exception e){
			 	msgSearch.setE02LCDDNO("");
			}
			
			mp.sendMessage(msgSearch);
			ELEERRMessage msgError = new ELEERRMessage(); 
		 	JBObjList list = mp.receiveMessageRecordList("E02INDOPE");
		 	
		 	if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ELC0450_lc_inq_basic.jsp";
				} else {
					pageName = "ESD0817_lc_enter_stat.jsp";
				}
		 	} else {
		 		JBList beanList = new JBList();
		 		StringBuffer myRow = null;
		 		list.initRow();
		 		while (list.getNextRow()) {
		 			ELC045502Message msgList = (ELC045502Message) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(msgList.getE02LCDLNO()) + "</TD>");
					myRow.append("<TD NOWRAP >&nbsp;</TD>");
					myRow.append("<TD NOWRAP ALIGN=LEFT>" + Util.formatCell(msgList.getE02LCDLIN()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
		 		}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
		 		
				flexLog("Putting java beans into the session");
				session.setAttribute("cifList", beanList);
				session.setAttribute("userPO", userPO);
				
				pageName = "ELC0455_lc_list_doc_det.jsp";
		 	}
		 	
			session.setAttribute("error", msgError);
		 	forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0455", req);
			ELC045501Message msgSearch = (ELC045501Message) mp.getMessageRecord("ELC045501");
			msgSearch.setH01USERID(user.getH01USR());
		 	msgSearch.setH01PROGRM("EDL0455");
		 	msgSearch.setH01TIMSYS(getTimeStamp());
		 	msgSearch.setH01SCRCOD("01");
		 	msgSearch.setH01OPECOD("0004");
		 	
			try{
			 	msgSearch.setE01LCMACC(userPO.getIdentifier());
			} catch (Exception e){
			 	msgSearch.setE01LCMACC("");
			}
			
			mp.sendMessage(msgSearch);
			ELEERRMessage msgError = new ELEERRMessage(); 
		 	JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
		 	
		 	if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ELC0450_lc_inq_basic.jsp";
				} else {
					pageName = "ESD0817_lc_enter_stat.jsp";
				}
		 	} else {
		 		JBList beanList = new JBList();
		 		StringBuffer myRow = null;
		 		boolean firstTime = true;
		 		list.initRow();
		 		while (list.getNextRow()) {
		 			ELC045501Message msgList = (ELC045501Message) list.getRecord();
					if (firstTime) {
						userPO.setIdentifier(msgList.getE01LCMACC());
						userPO.setBank(msgList.getE01LCMBNK());
						userPO.setHeader1(msgList.getE01LCMPRO());
						userPO.setHeader2(msgList.getE01LCMCUN());
						userPO.setHeader3(msgList.getE01CUSNA1());
						userPO.setHeader4(msgList.getE01LCDDNO());
						userPO.setHeader5(msgList.getE01LCDTYP());
						userPO.setHeader6(msgList.getE01LCMBRN());
						userPO.setCurrency(msgList.getE01LCMCCY());
						firstTime = false;
					}
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:showDocDesc()\">" + Util.formatCell(msgList.getE01LCDDNO()) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:showDocDesc()\">" + Util.formatCell(msgList.getE01LCHFMT()) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:showDocDesc()\">" + Util.formatCell(msgList.getE01LCDLIN()) + "</A></TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
		 		}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
		 		
				flexLog("Putting java beans into the session");
				session.setAttribute("cifList", beanList);
				session.setAttribute("userPO", userPO);
				
				pageName = "ELC0455_lc_list_doc.jsp";
		 	}
		 	
			session.setAttribute("error", msgError);
		 	forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

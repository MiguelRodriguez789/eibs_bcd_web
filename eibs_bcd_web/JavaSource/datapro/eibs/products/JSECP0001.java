package datapro.eibs.products;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECP001001Message;
import datapro.eibs.beans.ECP001002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSECP0001 extends JSEIBSServlet {

	protected static final int R_PROFIT		= 2;
	protected static final int R_SERVICES	= 4;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_PROFIT :
				procReqProfit(user, req, res, session);
				break;	
			case R_SERVICES :
				procReqServices(user, req, res, session);
				break;				
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqServices(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		String opCode = "0002";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECP0010", req);
			ECP001002Message msgInst = (ECP001002Message) mp.getMessageRecord("ECP001002");
			msgInst.setH02USERID(user.getH01USR());
			msgInst.setH02PROGRM("EDL0130");
			msgInst.setH02TIMSYS(getTimeStamp());
			msgInst.setH02SCRCOD("01");
			msgInst.setH02OPECOD(opCode);
			try { 
				msgInst.setE02CUSNUM(req.getParameter("CUSTOMER").trim());
			} catch (Exception e) {
				msgInst.setE02CUSNUM(userPO.getCusNum());
			}
			
			mp.sendMessage(msgInst);
			JBObjList list = mp.receiveMessageRecordList("E02CUSTYP");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				BigDecimal income = new BigDecimal("0.00");
				list.initRow();
				while (list.getNextRow()) {
					msgInst = (ECP001002Message) list.getRecord();
					income = income.add(msgInst.getBigDecimalE02FEEINC());
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP  ALIGN=LEFT>" + msgInst.getE02NAR() + "</td>");
					myRow.append("<TD NOWRAP  ALIGN=LEFT>" + msgInst.getE02NTRN() + "</td>");
					myRow.append("<TD NOWRAP  ALIGN=RIGHT>" + Util.fcolorCCY(msgInst.getE02FEEINC()) + "</td>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				String realincome = income.toString();
				userPO.setHeader21(Util.fcolorCCY(realincome));
				userPO.setCusNum(msgInst.getE02CUSNUM());
				userPO.setCusName(msgInst.getE02CUSNME());
				userPO.setHeader3(msgInst.getE02CUSTYP());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				session.setAttribute("services", beanList);
				session.setAttribute("error", new ELEERRMessage());
				
				pageName = "ECP001_services.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqProfit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		String opCode = "0002";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECP0010", req);
			ECP001001Message msgProfit = (ECP001001Message) mp.getMessageRecord("ECP001001");
			msgProfit.setH01USERID(user.getH01USR());
			msgProfit.setH01PROGRM("EDL0130");
			msgProfit.setH01TIMSYS(getTimeStamp());
			msgProfit.setH01SCRCOD("01");
			msgProfit.setH01OPECOD(opCode);
			try { 
				msgProfit.setE01CUSNUM(req.getParameter("CUSTOMER").trim());
			} catch (Exception e) {
				msgProfit.setE01CUSNUM(userPO.getCusNum());
			}
			try {
				msgProfit.setE01SELMTH(req.getParameter("SELMTH").trim());
			} catch (Exception e) {
				msgProfit.setE01SELMTH("M");
			} 
			
			mp.sendMessage(msgProfit);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("profit", msg);
				pageName = "ECP001_cif_profit.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

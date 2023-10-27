package datapro.eibs.client;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD008901Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSESD0089 extends JSEIBSServlet {

	private static final int R_LIST   = 1;
	private static final int A_LIST   = 2;
	private static final int A_NEW    = 3;
	
	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		// Requests
		case R_LIST :
		case A_NEW :
			procReqList(user, req, res, session, screen);
			break;
			// Actions
		case A_LIST :
			procActionList(user, req, res, session);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procActionList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		
		int totRows = 0;
		try {
			totRows = Integer.parseInt(req.getParameter("TOTROWS"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0089", req);
			for (int row = 0; row < totRows ; row++) {
				ESD008901Message msgCC = (ESD008901Message) mp.getMessageRecord("ESD008901");
				msgCC.setH01USERID(user.getH01USR());
				msgCC.setH01PROGRM("ESD0089");
				msgCC.setH01TIMSYS(getTimeStamp());  
				msgCC.setH01SCRCOD("01");
				msgCC.setH01OPECOD("0005");
				msgCC.setE01CUPPRF(userPO.getCusNum());  // Portfolio Number
				try {
					msgCC.setE01CUPCUR(req.getParameter("E01CUPCUR_" + row).trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {
					msgCC.setE01CUPBSX(req.getParameter("E01CUPBSX_" + row).trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				if (req.getParameter("E01ACT_" + row) == null) {
					msgCC.setE01ACT(" ");
				} else {
					msgCC.setE01ACT("D");   // Delete Record
				}	
				msgCC.setH01FLGWK1("");

				mp.sendMessage(msgCC);
			}
			ESD008901Message msgCC = (ESD008901Message) mp.getMessageRecord("ESD008901");
			msgCC.setH01USERID(user.getH01USR());
			msgCC.setH01PROGRM("ESD0089");
			msgCC.setH01TIMSYS(getTimeStamp());  
			msgCC.setH01SCRCOD("01");
			msgCC.setH01OPECOD("0005");
			msgCC.setH01FLGWK1("S");
			
			mp.sendMessage(msgCC);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);	
				forward("ESD0089_cus_port_additional_cust.jsp", req, res);
			} else {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSESD0089?SCREEN=1&FromRecord=0");
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0089", req);
			ESD008901Message msgList = (ESD008901Message) mp.getMessageRecord("ESD008901");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0089");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD(screen == 3 ? "0001" : "0002");
			try {
				msgList.setE01NUMREC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgList.setE01NUMREC("0");
			}
			msgList.setE01CUPPRF(userPO.getCusNum());

			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("prList", list);
				pageName = "ESD0089_cus_port_additional_cust.jsp";
			}


			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}

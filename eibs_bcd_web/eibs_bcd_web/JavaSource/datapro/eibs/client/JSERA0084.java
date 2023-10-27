package datapro.eibs.client;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ERA008401Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSERA0084 extends JSEIBSServlet {


	// Action 
	// first screen
	protected static final int R_GET_LIST = 100;
	protected static final int R_GET_REC = 200;
	protected static final int A_TRANSACTION = 2;
	// second screen. list of deals 
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {

		//Request list
		case R_GET_LIST :
			procGetList(user, req, res, session);
			break;
		// First screen, only list data
		case R_GET_REC :
			procGetRec(user, req, res, session);
			break;
		// Action
		case A_TRANSACTION :
			procUpdAcc(user, req, res, session);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procGetList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setHeader2(req.getParameter("E01MODLGT"));
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0084", req);
			ERA008401Message mL0084 = (ERA008401Message) mp.getMessageRecord("ERA008401");
			mL0084.setH01USERID(user.getH01USR());
			mL0084.setH01PROGRM("ERA0084");
			mL0084.setH01TIMSYS(getTimeStamp());
			mL0084.setH01SCRCOD("01");
			mL0084.setH01OPECOD("0015");
			try {
				mL0084.setE01HVAREF(req.getParameter("E01HVAREF".trim()));
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(mL0084);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01OPECDE");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "ERA0050_ga_basic.jsp";
			} else {
				int gaColNum = 6;
				String myGaCode[] = new String[gaColNum];
				JBListRec gcodeList = new JBListRec();
				gcodeList.init(gaColNum);
				JBObjList beanList = new JBObjList();
				
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					mL0084 = (ERA008401Message) iterator.next();
					if (mL0084.getE01OPECDE().equals("H")) {
						session.setAttribute("trans", mL0084);
					} else {
						beanList.addRow(mL0084);
						myGaCode[0] = mL0084.getE01HVASEQ();
						gcodeList.addRow("", myGaCode);
					}
				}
				session.setAttribute("ERA008401Help", beanList);
				session.setAttribute("gaList", gcodeList);
				pageName = "ERA0084_valuation_history_list.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procGetRec(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0084", req);
			ERA008401Message mL0084 = (ERA008401Message) mp.getMessageRecord("ERA008401");
			mL0084.setH01USERID(user.getH01USR());
			mL0084.setH01PROGRM("ERA0084");
			mL0084.setH01TIMSYS(getTimeStamp());
			mL0084.setH01SCRCOD(req.getParameter("PURPOSE") != null ? "05" : "01");
			mL0084.setH01OPECOD("0020");
			try {
				mL0084.setE01HVAREF(req.getParameter("E01HVAREF").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				mL0084.setE01HVASEQ(req.getParameter("E01HVASEQ").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				mL0084.setE01HVASEA(req.getParameter("E01HVASEA").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(mL0084);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			mL0084 = (ERA008401Message) mp.receiveMessageRecord("ERA008401");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ERA0084_valuation_maintenance.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("trans", mL0084);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procUpdAcc(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0084", req);
			ERA008401Message mL0084 = (ERA008401Message) mp.getMessageRecord("ERA008401");
			mL0084.setH01USERID(user.getH01USR());
			mL0084.setH01PROGRM("ERA0084");
			mL0084.setH01TIMSYS(getTimeStamp());
			mL0084.setH01OPECOD("0001");
			
			setMessageRecord(req, mL0084);

			mp.sendMessage(mL0084);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			mL0084 = (ERA008401Message) mp.receiveMessageRecord("ERA008401");

			session.setAttribute("error", msgError);
			session.setAttribute("trans", mL0084);
			
			if (mp.hasError(msgError)) {
				forward("ERA0084_valuation_maintenance.jsp", req, res);
			} else {
				res.sendRedirect(srctx
						+ "/servlet/datapro.eibs.client.JSERA0084?SCREEN=200&E01HVAREF="
						+ mL0084.getE01HVAREF() + "&E01HVASEQ="
						+ mL0084.getE01HVASEQ() + "&E01HVASEA="
						+ mL0084.getE01HVASEA() + "&CONFIRM=Y");			
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}

package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EGL036001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEGL0360 extends JSEIBSServlet {

	static final int R_LIST = 1;
	static final int A_LIST = 2;
	static final int A_MAINT = 4;
	static final int R_DELETE = 3;
	static final int R_ENTER = 100;
	static final int R_NEW = 10; 
	static final int R_MAINT = 20;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
			case R_ENTER :
				procReqEnter(user, req, res, session);
				break;	
			case R_LIST :
				procReqList(user, req, res, session);
				break;
			case R_NEW :
				procReqNew(user, req, res, session);
				break;
			case R_MAINT :
				procReqMaint(user, req, res, session);
				break;
			case R_DELETE:
				procReqDelete(user, req, res, session);
				break;
			case A_LIST :
				procActionPos(user, req, res, session);
				break;
			case A_MAINT :
				procActionMaint(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}

	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		forward("EGL0360_fex_sel_bank.jsp", req, res);
		
	}
	
	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		 throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL036001", req);
			EGL036001Message msgList = (EGL036001Message) mp.getMessageRecord("EGL036001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EGL036001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			if (req.getParameter("E01RATBNK")== null){
				msgList.setE01RATBNK(userPO.getHeader1());
			}else{
				msgList.setE01RATBNK(req.getParameter("E01RATBNK"));
				userPO.setHeader1(req.getParameter("E01RATBNK"));
			}
			
			mp.sendMessage(msgList);
			
			JBObjList list = mp.receiveMessageRecordList("E01OPECDE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			}
				
			pageName = "EGL0360_fex_currency_list.jsp";
			session.setAttribute("userPO", userPO);
			session.setAttribute("EGL0360Help", list);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procActionPos(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		int inptOPT = 0;

		inptOPT = Integer.parseInt(req.getParameter("opt"));
		
		String CCY = req.getParameter("CCY");
		String BNK = req.getParameter("BNK");

		switch (inptOPT) {
			case 1 : //New
				procReqNew(user, req, res, session);
				break;
			case 2 : //Maintenance
				procReqMaint(user, req, res, session);
				break;
			case 3 : //Delete
				procReqDelete(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
		
	}
	
	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL036001", req);
			EGL036001Message msgList = (EGL036001Message) mp.getMessageRecord("EGL036001");
			
			userPO.setPurpose("NEW");
			userPO.setHeader10("3");
			
			msgList.setE01RATBNK(user.getE01UBK());
			msgList.setE01CNTBCU(user.getE01BCU());
			msgList.setE01CNTRD1(user.getE01RDD());
			msgList.setE01CNTRD2(user.getE01RDM());
			msgList.setE01CNTRD3(user.getE01RDY());
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("refCCY", msgList);

			forward("EGL0360_fex_reference_currency.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqMaint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL036001", req);
						
			JBObjList list = (JBObjList)session.getAttribute("EGL0360Help");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			EGL036001Message listMessage = (EGL036001Message)list.get(index);
			
			userPO.setPurpose("MAINTENANCE");
			
			if (listMessage.getE01CNTBCU().equals(listMessage.getE01RATCCY())) {
				userPO.setHeader10("1");
			} else {
				userPO.setHeader10("3");
			}
						
			session.setAttribute("userPO", userPO);
			session.setAttribute("refCCY",listMessage);

			forward("EGL0360_fex_reference_currency.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procActionMaint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL036001", req);
			EGL036001Message msgList = (EGL036001Message) mp.getMessageRecord("EGL036001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EGL036001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			
			if(userPO.getPurpose().equals("NEW")){
				msgList.setH01OPECOD("0001");				
			} else{
				msgList.setH01OPECOD("0005");
			}
			
			setMessageRecord(req,msgList);
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EGL036001Message) mp.receiveMessageRecord("EGL036001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error",msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("refCCY",msgList);
				forward("EGL0360_fex_reference_currency.jsp", req, res);
			}
			
			procReqList(user, req, res, session);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL052201", req);
				
			JBObjList list = (JBObjList)session.getAttribute("EGL0360Help");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			EGL036001Message listMessage = (EGL036001Message)list.get(index);
			
			EGL036001Message msgList = (EGL036001Message) mp.getMessageRecord("EGL036001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EGL036001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setE01RATBNK(listMessage.getE01RATBNK());
			msgList.setE01RATCCY(listMessage.getE01RATCCY());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EGL0360_fex_currency_list.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
		
	}

}

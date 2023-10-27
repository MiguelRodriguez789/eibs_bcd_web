package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD020501Message;
import datapro.eibs.beans.ESD020502Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EUT011001Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSESD0205 extends JSEIBSServlet {

	static final int R_ENTER = 1000;
	static final int R_LIST = 100;
	static final int R_NEW = 1;
	static final int R_MAINT = 2;
	static final int R_DELETE = 3;
	static final int A_MAINT = 200;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen){
			case R_ENTER:
				procEnterTable(user, req, res, session);
				break;
			case R_LIST:
				procReqList(user, req, res, session);
				break;
			case R_NEW:
				procReqNew(user, req, res, session);
				break;
			case R_MAINT:
				procReqMaintenance(user, req, res, session);
				break;
			case A_MAINT:
				procActionMaintenance(user, req, res, session);
				break;
			case R_DELETE:
				procReqDelete(user, req, res, session);
				break;
			default:
				forward(devPage, req, res); 
				break;
		}
	}

	private void procEnterTable(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		forward("ESD0205_rt_enter_sel_tables.jsp", req, res);
	}
	
	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0205", req);
			ESD020501Message msgList = (ESD020501Message) mp.getMessageRecord("ESD020501");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0205");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			if (req.getParameter("E01RTEBNK")== null){
				msgList.setE01RTEBNK(userPO.getHeader1());
			}else{
				msgList.setE01RTEBNK(req.getParameter("E01RTEBNK"));
				userPO.setHeader1(req.getParameter("E01RTEBNK"));
			}
			if (req.getParameter("E01RTEATY")== null){
				msgList.setE01RTEATY(userPO.getHeader2());
			}else{
				msgList.setE01RTEATY(req.getParameter("E01RTEATY"));
				userPO.setHeader2(req.getParameter("E01RTEATY"));
			}
			if (req.getParameter("E01RTECUN")== null){
				msgList.setE01RTECUN(userPO.getHeader3());
			}else{
				msgList.setE01RTECUN(req.getParameter("E01RTECUN"));
				userPO.setHeader3(req.getParameter("E01RTECUN"));
			}
						
			mp.sendMessage(msgList);
			
			JBObjList list = mp.receiveMessageRecordList("E01CDROPE");
			
			session.setAttribute("userPO", userPO);

			if (!mp.hasError(list)) {
				session.setAttribute("ESD0205Help", list);
				forward("ESD0205_rt_sel_tables.jsp", req, res);
			
			} else {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				forward("ESD0205_rt_enter_sel_tables.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0205", req);
			ESD020502Message msgList = (ESD020502Message) mp.getMessageRecord("ESD020502");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("ESD0205");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02SCRCOD("01");
			msgList.setH02OPECOD("0001");
			
			msgList.setE02RTEBNK(userPO.getHeader1());
			msgList.setE02RTEATY(userPO.getHeader2());
			msgList.setE02RTECUN(userPO.getHeader3());
			msgList.setE02RTETAR(req.getParameter("E01RTETAR"));
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD020502Message) mp.receiveMessageRecord("ESD020502");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward(devPage, req, res);
			} else {
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("charges", msgList);
				
				String E02RTEACD = msgList.getE02RTEACD();
				if (E02RTEACD.equals("01")) {
					forward ("ESD0205_rt_tables_dda_01.jsp", req, res);
				}
				if (E02RTEACD.equals("02") || E02RTEACD.equals("03")) {
					forward ("ESD0205_rt_tables_dda_02.jsp", req, res);
				}
				if (E02RTEACD.equals("04")) {
					forward ("ESD0205_rt_tables_dda_04.jsp", req, res);
				}
				if (E02RTEACD.equals("05")) {
					forward ("ESD0205_rt_tables_dda_05.jsp", req, res);
				}
				else {
					forward ("ESD0205_rt_tables_dda_01.jsp", req, res);
				}
				
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0205", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD0205Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			ESD020501Message listMessage = (ESD020501Message)list.get(index);
			
			
			ESD020502Message msgList = (ESD020502Message) mp.getMessageRecord("ESD020502");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("ESD0205");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02SCRCOD("01");
			msgList.setH02OPECOD("0002");
			
			msgList.setE02RTEBNK(userPO.getHeader1());
			msgList.setE02RTEATY(userPO.getHeader2());
			msgList.setE02RTECUN(userPO.getHeader3());
			msgList.setE02RTETAR(listMessage.getE01RTETAR());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD020502Message) mp.receiveMessageRecord("ESD020502");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward(devPage, req, res);
			} else {
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("charges", msgList);
				
				String E02RTEACD = msgList.getE02RTEACD();
				if (E02RTEACD.equals("01")) {
					forward ("ESD0205_rt_tables_dda_01.jsp", req, res);
				}
				if (E02RTEACD.equals("02") || E02RTEACD.equals("03")) {
					forward ("ESD0205_rt_tables_dda_02.jsp", req, res);
				}
				if (E02RTEACD.equals("04")) {
					forward ("ESD0205_rt_tables_dda_04.jsp", req, res);
				}
				if (E02RTEACD.equals("05")) {
					forward ("ESD0205_rt_tables_dda_05.jsp", req, res);
				}
				else {
					forward ("ESD0205_rt_tables_dda_01.jsp", req, res);
				}
				
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD020502", req);
						
			ESD020502Message msgList = (ESD020502Message) mp.getMessageRecord("ESD020502");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("ESD0205");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02SCRCOD("01");
			msgList.setH02OPECOD("0005");	
			
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD020502Message) mp.receiveMessageRecord("ESD020502");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute ("charges", msgList);

				String E02RTEACD = msgList.getE02RTEACD();
				if (E02RTEACD.equals("01")) {
					forward ("ESD0205_rt_tables_dda_01.jsp", req, res);
				}
				if (E02RTEACD.equals("02") || E02RTEACD.equals("03")) {
					forward ("ESD0205_rt_tables_dda_02.jsp", req, res);
				}
				if (E02RTEACD.equals("04")) {
					forward ("ESD0205_rt_tables_dda_04.jsp", req, res);
				}
				if (E02RTEACD.equals("05")) {
					forward ("ESD0205_rt_tables_dda_05.jsp", req, res);
				}
				else {
					forward ("ESD0205_rt_tables_dda_01.jsp", req, res);
				}
				
			} else {
				procReqList(user, req, res, session);
			}
						
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
		throws IOException, ServletException {
		
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ESD020502", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD0205Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			ESD020501Message listMessage = (ESD020501Message)list.get(index);
			
			ESD020502Message msgList = (ESD020502Message) mp.getMessageRecord("ESD020502");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("ESD0205");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02SCRCOD("01");
			msgList.setH02OPECOD("0009");
			msgList.setE02RTEBNK(listMessage.getE01RTEBNK());
			msgList.setE02RTETAR(listMessage.getE01RTETAR());
			msgList.setE02RTEATY(listMessage.getE01RTEATY());
			msgList.setE02RTECUN(listMessage.getE01RTECUN());
			
			mp.sendMessage(msgList);
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("ESD0205_rt_tables.jsp", req, res);
			} else {
				
				procReqList(user, req, res, session);
				
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
		

}

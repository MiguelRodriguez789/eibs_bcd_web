package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD020201Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSESD0202 extends JSEIBSServlet {

	static final int R_ENTER = 1000;
	static final int R_LIST = 100;
	static final int R_NEW = 1;
	static final int R_MAINT = 2;
	static final int R_DELETE = 3;
	static final int R_INQUIRY = 4;

	static final int A_APPROVAL = 6;
	static final int R_INQUIRY_APP = 7;
	static final int R_INQUIRY_DET_ONE = 8;
	static final int R_INQUIRY_DET = 9;
	static final int A_MAINT = 200;

	protected static final int R_PASSWORD = 10;	
	protected static final int R_LIST_INQUIRY = 20;
	protected static final int A_LIST_INQUIRY = 21;
	protected static final int R_LIST_PACKS = 30;
	protected static final int R_LIST_PACKS_INQ = 40;
	protected static final int R_LIST_PACKS_INQ_APR = 41;
	protected static final int R_APPROVAL = 50;	
	
	protected static final int CHANGE_DATOS_ADDIOCIONAL = 999;	

	
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
			case R_INQUIRY:
				procReqInquiry(user, req, res, session);
				break;
			case R_INQUIRY_APP:
				procReqInquiryApp(user, req, res, session);
				break;
			case R_INQUIRY_DET:
				procReqInquiryDetail(user, req, res, session);
				break;
			case R_INQUIRY_DET_ONE:
				procReqInquiryDetailOne(user, req, res, session);
				break;
			case A_MAINT:
				procActionMaintenance(user, req, res, session);
				break;
			case R_DELETE:
				procReqDelete(user, req, res, session);
				break;
			case R_PASSWORD :
				procReqPassword(req, res, session);
				break;
			case R_APPROVAL :
				procReqApproval(user, req, res, session);
				break;
			case R_LIST_INQUIRY :
				procReqListInquiry(user, req, res, session);
				break;
			case A_LIST_INQUIRY :
				procActListInquiry(user, req, res, session);
				break;
			case R_LIST_PACKS :
				procReqListPacks(user, req, res, session);
				break;
			case R_LIST_PACKS_INQ :
				procReqListPacksInq(user, req, res, session);
				break;
			case R_LIST_PACKS_INQ_APR :
				procReqListPacksInqApr(user, req, res, session);
				break;
			case A_APPROVAL:
				procActionApproval(user, req, res, session);
				break;
			case CHANGE_DATOS_ADDIOCIONAL:
				procChangeDatosAddicional(user, req, res, session);
				break;				
			default:
				forward(devPage, req, res); 
				break;
		}
	}

	private void procEnterTable(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		forward("ESD0202_rt_enter_sel_tables.jsp", req, res);
	}
	
	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0202", req);
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			msgList.setE01DDCBNK("01");				
			userPO.setHeader1(msgList.getE01DDCBNK());
			
			mp.sendMessage(msgList);
			
			//ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

			session.setAttribute("userPO", userPO);
			session.setAttribute("ESD0202Help", list);

			forward("ESD0202_rt_sel_tables.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	
	
	private void procReqApproval(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0202", req);
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0025");
			msgList.setE01DDCBNK("01");				
			userPO.setHeader1(msgList.getE01DDCBNK());
			
			mp.sendMessage(msgList);
			
			//ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

			session.setAttribute("userPO", userPO);
			session.setAttribute("ESD0202Help", list);

			forward("ESD0202_rt_sel_tables_approval.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	

	
	private void procReqListInquiry(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0202", req);
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0035");
			msgList.setE01DDCBNK("01");				
			userPO.setHeader1(msgList.getE01DDCBNK());
			msgList.setE01DDCBNK(req.getParameter("E01DDCBNK") == null ? " " : req.getParameter("E01DDCBNK").trim());
			msgList.setE01DDCCDE(req.getParameter("E01DDCCDE") == null ? " " : req.getParameter("E01DDCCDE").trim());
			msgList.setE01DDCDSC(req.getParameter("E01DDCDSC") == null ? " " : req.getParameter("E01DDCDSC").trim());
			
			mp.sendMessage(msgList);
			
			//ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

			session.setAttribute("userPO", userPO);
			session.setAttribute("ESD0202Help", list);

			forward("ESD0202_rt_sel_tables_inquiry.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procActListInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("IN");
		userPO.setPurpose("INQUIRY");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSESD0202?SCREEN=20");
		userPO.setProdCode("04");
		//Others Parameters
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("ESD0202_rt_sel_tables_inquiry_enter_param.jsp", req, res);
	}

	
	
	
	private void procReqListPacks(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		int scn = Integer.parseInt(req.getParameter("SCREEN").trim());		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0202", req);

			
			JBObjList list = (JBObjList)session.getAttribute("ESD0202Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			ESD020201Message listMessage = (ESD020201Message)list.get(index);
			
			
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0025");

			userPO.setHeader4(listMessage.getE01DDCCDE());			
			userPO.setHeader6(listMessage.getE01DDCCDE());
			userPO.setHeader7(listMessage.getE01DDCDSC());
			msgList.setE01DDCBNK(userPO.getHeader1());
			msgList.setE01DDCBNK(listMessage.getE01DDCBNK());
			msgList.setE01DDCCDE(listMessage.getE01DDCCDE());

			
			mp.sendMessage(msgList);
			
			//ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			JBObjList listpack = mp.receiveMessageRecordList("E02NUMOPE");

			session.setAttribute("userPO", userPO);
			session.setAttribute("ESD0202Help", listpack);

			forward("ESD0202_rt_sel_tables_pack.jsp", req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	

	
	private void procReqListPacksInq(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		int scn = Integer.parseInt(req.getParameter("SCREEN").trim());		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0202", req);
			
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0025");
			msgList.setE01DDCCDE(userPO.getHeader4());
			//userPO.setHeader4(msgList.getE01DDCCDE());			
			userPO.setHeader6(msgList.getE01DDCCDE());
			userPO.setHeader7(msgList.getE01DDCDSC());
			msgList.setE01DDCBNK(userPO.getHeader1());

			
			mp.sendMessage(msgList);
			
			//ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			JBObjList listpack = mp.receiveMessageRecordList("E02NUMOPE");

			session.setAttribute("userPO", userPO);
			session.setAttribute("ESD0202Help", listpack);

			forward("ESD0202_rt_sel_tables_pack_inquiry.jsp", req, res);				

			
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	

	
	private void procReqListPacksInqApr(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		int scn = Integer.parseInt(req.getParameter("SCREEN").trim());		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0202", req);
			
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0025");
			msgList.setE01DDCCDE(userPO.getHeader4());
			//userPO.setHeader4(msgList.getE01DDCCDE());			
			userPO.setHeader6(req.getParameter("E02DDCCDE"));
			userPO.setHeader7(req.getParameter("E02DDCDSC"));
			msgList.setE01DDCBNK(userPO.getHeader1());

			
			mp.sendMessage(msgList);
			
			//ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			JBObjList listpack = mp.receiveMessageRecordList("E02NUMOPE");

			session.setAttribute("userPO", userPO);
			session.setAttribute("ESD0202Help", listpack);

			forward("ESD0202_rt_sel_tables_pack_inquiry_apr.jsp", req, res);				

			
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	
	private void procReqInquiryApp(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0202", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD0202Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			userPO.setHeader9(req.getParameter("key").trim());
			
			ESD020201Message listMessage = (ESD020201Message)list.get(index);
			
			
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0002");

			userPO.setHeader4(listMessage.getE01DDCCDE());			
			userPO.setHeader7(listMessage.getE01DDCDSC());
			msgList.setE01DDCBNK(userPO.getHeader1());
			msgList.setE01DDCBNK(listMessage.getE01DDCBNK());
			msgList.setE01DDCCDE(listMessage.getE01DDCCDE());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD020201Message) mp.receiveMessageRecord("ESD020201");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ESD0202_rt_sel_tables_approval.jsp", req, res);
			} else {
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("charges", msgList);
				
					forward ("ESD0202_rt_tables_detail_inq_apr.jsp", req, res);
				
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	
	
	private void procReqInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0202", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD0202Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			userPO.setHeader9(req.getParameter("key").trim());
			
			ESD020201Message listMessage = (ESD020201Message)list.get(index);
			
			
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0002");

			userPO.setHeader4(listMessage.getE01DDCCDE());			
			userPO.setHeader7(listMessage.getE01DDCDSC());
			msgList.setE01DDCBNK(userPO.getHeader1());
			msgList.setE01DDCBNK(listMessage.getE01DDCBNK());
			msgList.setE01DDCCDE(listMessage.getE01DDCCDE());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD020201Message) mp.receiveMessageRecord("ESD020201");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ESD0202_rt_sel_tables.jsp", req, res);
			} else {
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("charges", msgList);
				
					forward ("ESD0202_rt_tables_detail_inq.jsp", req, res);
				
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	
	private void procReqInquiryDetail(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0202", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD0202Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			ESD020201Message listMessage = (ESD020201Message)list.get(index);
			
			
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0002");
	
			userPO.setHeader4(listMessage.getE01DDCCDE());			
			userPO.setHeader7(listMessage.getE01DDCDSC());
			msgList.setE01DDCBNK(userPO.getHeader1());
			msgList.setE01DDCBNK(listMessage.getE01DDCBNK());
			msgList.setE01DDCCDE(listMessage.getE01DDCCDE());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD020201Message) mp.receiveMessageRecord("ESD020201");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ESD0202_rt_sel_tables.jsp", req, res);
			} else {
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("charges", msgList);
				
					forward ("ESD0202_rt_tables_detail_inquiry.jsp", req, res);
				
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	
	
	private void procReqInquiryDetailOne(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0202", req);
			
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0002");

			msgList.setE01DDCBNK(userPO.getHeader1());
			msgList.setE01DDCCDE(req.getParameter("E01DDCCDE1"));
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD020201Message) mp.receiveMessageRecord("ESD020201");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ESD0202_rt_sel_tables.jsp", req, res);
			} else {
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("charges", msgList);
				
					forward ("ESD0202_rt_tables_detail_inquiry.jsp", req, res);
				
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
			mp = getMessageProcessor("ESD0202", req);
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0001");

			userPO.setHeader4(req.getParameter("E01DDCCDE"));			
			msgList.setE01DDCBNK(userPO.getHeader1());
			msgList.setE01DDCCDE(req.getParameter("E01DDCCDE"));
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD020201Message) mp.receiveMessageRecord("ESD020201");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ESD0202_rt_sel_tables.jsp", req, res);
			} else {
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("charges", msgList);
				
					forward ("ESD0202_rt_tables_detail.jsp", req, res);
				
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
			mp = getMessageProcessor("ESD0202", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD0202Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			ESD020201Message listMessage = (ESD020201Message)list.get(index);
			
			
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0002");

			userPO.setHeader4(listMessage.getE01DDCCDE());			
			msgList.setE01DDCBNK(userPO.getHeader1());
			msgList.setE01DDCBNK(listMessage.getE01DDCBNK());
			msgList.setE01DDCCDE(listMessage.getE01DDCCDE());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD020201Message) mp.receiveMessageRecord("ESD020201");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ESD0202_rt_sel_tables.jsp", req, res);
			} else {
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("charges", msgList);
				
					forward ("ESD0202_rt_tables_detail.jsp", req, res);
				
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	
	
	private void procActionApproval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0202", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD0202Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			ESD020201Message listMessage = (ESD020201Message)list.get(index);
			
			
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0010");
			msgList.setH01FLGWK1(req.getParameter("action").trim());
			
			userPO.setHeader4(listMessage.getE01DDCCDE());			
			msgList.setE01DDCBNK(userPO.getHeader1());
			msgList.setE01DDCBNK(listMessage.getE01DDCBNK());
			msgList.setE01DDCCDE(listMessage.getE01DDCCDE());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD020201Message) mp.receiveMessageRecord("ESD020201");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ESD0202_rt_sel_tables.jsp", req, res);
			} else {
				
				procReqApproval(user, req, res, session);				
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
			mp = getMessageProcessor("ESD020201", req);
						
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0005");	
			
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD020201Message) mp.receiveMessageRecord("ESD020201");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute ("charges", msgList);

					forward ("ESD0202_rt_tables_detail.jsp", req, res);
				
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
			mp = getMessageProcessor("ESD020201", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD0202Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			ESD020201Message listMessage = (ESD020201Message)list.get(index);
			
			ESD020201Message msgList = (ESD020201Message) mp.getMessageRecord("ESD020201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0202");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0004");
			msgList.setE01DDCBNK(listMessage.getE01DDCBNK());
			msgList.setE01DDCCDE(listMessage.getE01DDCCDE());
			
			mp.sendMessage(msgList);
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("ESD0202_rt_tables.jsp", req, res);
			} else {
				
				procReqList(user, req, res, session);
				
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	
	
	private void procReqPassword(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
	
		userPO.setRedirect("/servlet/datapro.eibs.params.JSESD0202?SCREEN="
							+ R_APPROVAL);
		session.setAttribute("userPO", userPO);
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}
	
	private void procChangeDatosAddicional(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			ESD020201Message msgData = new ESD020201Message();
			setMessageRecord(req, msgData);
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("charges", msgData);
			forward ("ESD0202_rt_tables_detail.jsp", req, res);

		} finally {
			if ( null != mp)
				mp.close();
		}
		
	}		
	

	
	
}

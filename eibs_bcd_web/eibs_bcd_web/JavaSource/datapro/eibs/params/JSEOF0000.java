package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDD018001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EOF000001Message;
import datapro.eibs.beans.EOF000002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EUT011001Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEOF0000 extends JSEIBSServlet {
	
	protected static final int R_ENTER = 1;
	protected static final int A_ENTER = 100;
	protected static final int R_NEW = 11;
	protected static final int R_MAINTENANCE = 12;
	protected static final int R_DELTE = 13;
	protected static final int A_MAINTENANCE = 14;
	protected static final int A_CHECK = 1000;


	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_ENTER :
				 procReqEnter(user, req, res, session);							
				 break;
			case A_ENTER :
				procActionEnterList(user, req, res, session);
				break;
			case R_NEW :
				 procReqNew(user, req, res, session);							
				break;	
			case R_MAINTENANCE :
				procReqMaint(user, req, res, session);							
				break;
			case R_DELTE :
				procReqDelete(user, req, res, session);							
				break;
			case A_MAINTENANCE :
				procActionMaint(user, req, res, session);							
				break;
			case A_CHECK :
				procActionCheck(user, req, res, session);							
				break;
			default :
				forward(devPage, req, res);
				break;
		}

	}


	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		forward("EOF0000_of_chk_enter_parameter.jsp", req, res);
		
	}


	private void procActionEnterList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF000001", req);
			EOF000001Message msgList = (EOF000001Message) mp.getMessageRecord("EOF000001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EOF000001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			if (req.getParameter("E01OFCBNK") == null){
				msgList.setE01OFCBNK(userPO.getBank());
			} else {
				msgList.setE01OFCBNK(req.getParameter("E01OFCBNK"));
				userPO.setBank(req.getParameter("E01OFCBNK"));
			}
			if (req.getParameter("E01OFCCCY") == null){
				msgList.setE01OFCCCY(userPO.getCurrency());
			} else {
				msgList.setE01OFCCCY(req.getParameter("E01OFCCCY"));
				userPO.setCurrency(req.getParameter("E01OFCCCY"));
			}
						
			mp.sendMessage(msgList);
			
			JBObjList list = mp.receiveMessageRecordList("E01OFCOPE");

			session.setAttribute("userPO", userPO);
			session.setAttribute("EOF000001Help", list);

			if(mp.hasError(list)){
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				forward("EOF0000_of_chk_enter_parameter.jsp", req, res);
			} else {
				forward("EOF0000_of_chk_parameter_list.jsp", req, res);
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
			mp = getMessageProcessor("EOF0000", req);
			EOF000001Message msgList = (EOF000001Message) mp.getMessageRecord("EOF000001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EOF000001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0001");
			msgList.setE01OFCBNK(userPO.getBank());
			msgList.setE01OFCCCY(userPO.getCurrency());
			
			userPO.setPurpose("NEW");

			session.setAttribute("checksParam", msgList);
			session.setAttribute("userPO", userPO);

			forward("EOF0000_of_chk_parameters_details.jsp", req, res);

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
			mp = getMessageProcessor("EOF0000", req);
			
			userPO.setPurpose("MAINTENANCE");
			
			JBObjList list = (JBObjList)session.getAttribute("EOF000001Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EOF000001Message listMessage = (EOF000001Message)list.get(index);
			
			session.setAttribute("checksParam", listMessage);
			session.setAttribute("userPO", userPO);

			forward("EOF0000_of_chk_parameters_details.jsp", req, res);

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
			mp = getMessageProcessor("EOF0000", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EOF000001Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EOF000001Message listMessage = (EOF000001Message)list.get(index);
			
			EOF000001Message msgList = (EOF000001Message) mp.getMessageRecord("EOF000001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EOF0000");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01OPECOD("0009");
		 	msgList.setE01OFCBNK(listMessage.getE01OFCBNK());
		 	msgList.setE01OFCCCY(listMessage.getE01OFCCCY());
		 	msgList.setE01OFCFTY(listMessage.getE01OFCFTY());
		 	msgList.setE01OFCDSC(listMessage.getE01OFCDSC());

		 	
			mp.sendMessage(msgList);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EOF0000_of_chk_parameter_list.jsp", req, res);
			} else {
				procActionEnterList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
		
	}


	private void procActionMaint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0000", req);
			EOF000001Message msgList = (EOF000001Message) mp.getMessageRecord("EOF000001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EOF0000");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	if (userPO.getPurpose().equals("MAINTENANCE")){
		 		msgList.setH01OPECOD("0005");
			} else {
				msgList.setH01OPECOD("0001");
			}
		 	
		 	setMessageRecord(req, msgList);
		 	
		 	userPO.setHeader1(msgList.getE01OFCNXO().trim());
			userPO.setHeader3(msgList.getE01BAFDTY().trim());

			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				msgList = (EOF000001Message) mp.receiveMessageRecord();
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("checksParam", msgList);
				forward("EOF0000_of_chk_parameters_details.jsp", req, res);
			} else {
				 if (!userPO.getHeader1().equals("3")) {
					 EOF000002Message msgnumber = (EOF000002Message) mp.receiveMessageRecord();
					 userPO.setHeader2(msgnumber.getE02OFNNUM());
				 }
				 if (userPO.getHeader1().equals("3") 
					|| userPO.getHeader3().equals("4")){
					 JBObjList msglst = mp.receiveMessageRecordList("H02FLGMAS");
					 session.setAttribute("EOF000002Help", msglst);
				 }
				 session.setAttribute("userPO",	userPO);
				 forward("EOF0000_of_chk_parameters_last_check.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procActionCheck(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		JBObjList beanList = null;
		MessageProcessor mp = null;
		beanList = (JBObjList) session.getAttribute("EOF000002Help");
		
		try {
			mp = getMessageProcessor("EOF0000", req);
			EOF000002Message msgchk = (EOF000002Message) mp.getMessageRecord("EOF000002");
			
			if (userPO.getHeader3().equals("4")) {
				beanList.initRow();
				while (beanList.getNextRow()) {
					msgchk = (EOF000002Message) beanList.getRecord();
					msgchk.setH02USERID(user.getH01USR());
					msgchk.setH02PROGRM("EOF0000");
					msgchk.setH02TIMSYS(getTimeStamp());				
					msgchk.setE02OFNBNK(userPO.getBank());
					msgchk.setE02OFNCCY(userPO.getCurrency());
					msgchk.setE02OFCNXO(userPO.getHeader1());
					msgchk.setE02OFCDTY(userPO.getHeader3());
					msgchk.setE02OFNBN1(req.getParameter("E02OFNBN1_" + beanList.getCurrentRow()));
					msgchk.setE02OFNBN2(req.getParameter("E02OFNBN2_" + beanList.getCurrentRow()));			
					mp.sendMessage(msgchk);
				}
				
			} else {
				if (userPO.getHeader1().equals("3")) {
					beanList.initRow();
					while (beanList.getNextRow()) {
						if (req.getParameter("E02OFNNUM_" + beanList.getCurrentRow()) != null 
								&& !req.getParameter("E02OFNNUM_" + beanList.getCurrentRow()).trim().equals("0")){

							msgchk = (EOF000002Message) beanList.getRecord();
							msgchk.setH02USERID(user.getH01USR());
							msgchk.setH02PROGRM("EOF0000");
							msgchk.setH02TIMSYS(getTimeStamp());
							msgchk.setE02OFNBNK(userPO.getBank());
							msgchk.setE02OFNCCY(userPO.getCurrency());
							msgchk.setE02OFCNXO(userPO.getHeader1());
							msgchk.setE02OFCDTY(userPO.getHeader3());
							msgchk.setE02OFNNUM(req.getParameter("E02OFNNUM_" + beanList.getCurrentRow()));
							setMessageField(req, msgchk, "E02OFNBN1", beanList.getCurrentRow());
							setMessageField(req, msgchk, "E02OFNBN2", beanList.getCurrentRow());
							mp.sendMessage(msgchk);
						}
					}
				} else {
					msgchk.setH02USERID(user.getH01USR());
					msgchk.setH02PROGRM("EOF0000");
					msgchk.setH02TIMSYS(getTimeStamp());
					msgchk.setE02OFNBNK(userPO.getBank());
					msgchk.setE02OFNCCY(userPO.getCurrency());
					msgchk.setE02OFCNXO(userPO.getHeader1());
					msgchk.setE02OFCDTY(userPO.getHeader3());
					msgchk.setE02OFNBNK(req.getParameter("E02OFNBNK"));
					msgchk.setE02OFNNUM(req.getParameter("E02OFNNUM"));
					mp.sendMessage(msgchk);
				}
			}

				procActionEnterList(user, req, res, session);

			
			

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}

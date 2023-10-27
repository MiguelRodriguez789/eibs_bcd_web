package datapro.eibs.alerts;


import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD005001Message;
import datapro.eibs.beans.ESD005002Message;
import datapro.eibs.beans.ESD005003Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSESD0050 extends JSEIBSServlet {

	private ServletConfig config = null;
	
	protected static final int A_ESPECIAL_NEW = 2;
	protected static final int A_ESPECIAL_ADD = 3;
	protected static final int A_ESPECIAL_MAN = 4;
	protected static final int A_ESPECIAL_INQ = 5;
	protected static final int A_ESPECIAL_INQ_GEN = 6;
	
	protected static final int A_EXPIRED_MSQ_INQ = 50;
	protected static final int A_EXPIRED_MSQ_DETAIL = 51;
	
	protected static final int A_ESPECIAL_CL = 120;
	protected static final int A_ESPECIAL_AH = 210;
	protected static final int A_ESPECIAL_CT = 220;
	protected static final int A_ESPECIAL_CD = 240;
	protected static final int A_ESPECIAL_LN = 400;
	protected static final int A_ESPECIAL_LIST = 500;
	
	protected static final int R_BENEFICI_AH = 230;
	protected static final int R_BENEFICI_NEW = 231;
	protected static final int R_BENEFICI_ADD = 232;
	protected static final int R_BENEFICI_MAN = 233;
	protected static final int R_BENEFICI_INQ = 234;

	protected static final int R_ENTER_CL = 501;
	protected static final int R_ENTER_AH = 502;
	protected static final int R_ENTER_CT = 503;
	protected static final int R_ENTER_CD = 504;
	protected static final int R_ENTER_LN = 505;	
	
	
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen){
        case A_ESPECIAL_NEW :
        	procActionRecNew(user, req, res, session, screen);
			break;
        case A_ESPECIAL_ADD :
        	procActionRec(user, req, res, session, screen);
			break;
        case A_ESPECIAL_MAN :
        	procActionRecMan(user, req, res, session, screen);
			break;
        case A_ESPECIAL_INQ :
        	procActionRecInq(user, req, res, session, screen);
			break;
        case A_ESPECIAL_INQ_GEN :
        	procActionRecInqGen(user, req, res, session, screen);
			break;
        case A_ESPECIAL_CL :
			procActionSpecial_CL(user, req, res, session);
			break;
        case A_ESPECIAL_AH :
			procActionSpecial_AH(user, req, res, session);
			break;
        case A_EXPIRED_MSQ_INQ :
        	procAction_ExpiredMessages(user, req, res, session);
			break;
        case A_EXPIRED_MSQ_DETAIL :
        	procAction_ExpiredMessagesDetails(user, req, res, session, screen);
			break;			
        case A_ESPECIAL_LIST :
			procActionSpecialList(user, req, res, session);
			break;
        case A_ESPECIAL_CT :
			procActionSpecial_CT(user, req, res, session);
			break;
        case A_ESPECIAL_CD :
			procActionSpecial_CD(user, req, res, session);
			break;
        case A_ESPECIAL_LN :
			procActionSpecial_LN(user, req, res, session);
			break;
		case R_ENTER_CL :
			procReqRTEnterMaint_CL(user, req, res, session);
			break;
        case R_ENTER_AH :
			procReqRTEnterMaint_AH(user, req, res, session);
			break;
        case R_ENTER_CT :
			procReqRTEnterMaint_CT(user, req, res, session);
			break;
        case R_ENTER_CD :
			procReqRTEnterMaint_CD(user, req, res, session);
			break;
        case R_ENTER_LN :
			procReqRTEnterMaint_LN(user, req, res, session);
			break;

        default :
				forward(devPage, req, res);
				break;
		}
	}

	protected void procActionRecNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0050");
				ESD005002Message msgRT = (ESD005002Message) mp.getMessageRecord("ESD005002");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0050");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("02");
				msgRT.setH02OPECOD("0002");
				userPO.setPurpose("NEW");
				msgRT.setE02WNMACC(userPO.getAccNum());
				msgRT.setE02WNMACD(userPO.getApplicationCode());

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0050_rt_alert_messages_1.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("rtInstX", newmessage);
						forward("ESD0050_rt_alert_messages_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0050");
				ESD005002Message msgRT = (ESD005002Message) mp.getMessageRecord("ESD005002");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0050");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("03");
				msgRT.setH02OPECOD("0003");
				msgRT.setE02WNMACC(userPO.getAccNum());
				msgRT.setE02WNMACD(userPO.getApplicationCode());

				try {
					msgRT.setE02WNMNME(req.getParameter("E02WNMNME"));
				} catch (Exception e) {
					msgRT.setE02WNMNME("0");
				}
					// Get all fields in page
					try {
						super.setMessageRecord(req, msgRT);
					} catch (Exception e) {				
					}
				
				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("rtInstX", newmessage );
						forward("ESD0050_rt_alert_messages_2.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(srctx + "/servlet/datapro.eibs.alerts.JSESD0050?SCREEN=210");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procActionRecMan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0050");
				ESD005002Message msgRT = (ESD005002Message) mp.getMessageRecord("ESD005002");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0050");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("04");
				msgRT.setH02OPECOD("0004");
				userPO.setPurpose("MAINTENANCE");
				msgRT.setE02WNMACC(userPO.getAccNum());
				msgRT.setE02WNMACD(userPO.getApplicationCode());

				try {
					msgRT.setE02WNMNME(req.getParameter("E01WNMNME"));
				} catch (Exception e) {
					msgRT.setE02WNMNME("0");
				}
				
				try {
					msgRT.setE02WNMSEQ(req.getParameter("E01WNMSEQ"));
				} catch (Exception e) {
					msgRT.setE02WNMSEQ("0");
				}

				
				//buscamo el registro segun la secuencia que selecciono, al conseguila enviamos el TYP (tipo)
				JBObjList list = (JBObjList) ses.getAttribute("ESD005001List");
				list.initRow();    
			    while (list.getNextRow()) {
			      ESD005001Message msgSes = (ESD005001Message) list.getRecord();
			      if (msgSes.getE01WNMSEQ().equals(msgRT.getE02WNMSEQ())){			    	  			    	  
			    	  msgRT.setE02WNMTYP(msgSes.getE01WNMTYP());			    
			    	  break;
			      }
			    }								
								
				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0050_rt_alert_messages_1.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("rtInstX", newmessage);
						forward("ESD0050_rt_alert_messages_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
	
	protected void procAction_ExpiredMessagesDetails(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0050");
				ESD005002Message msgRT = (ESD005002Message) mp.getMessageRecord("ESD005002");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0050");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("04");
				msgRT.setH02OPECOD("0004");			
				msgRT.setE02WNMACC(userPO.getAccNum());
				msgRT.setE02WNMACD(userPO.getApplicationCode());

				try {
					msgRT.setE02WNMSEQ(req.getParameter("E01WNMSEQ"));
				} catch (Exception e) {
					msgRT.setE02WNMSEQ("0");
				}

				//buscamo el registro segun la secuencia que selecciono, al conseguila enviamos el TYP (tipo)
				JBObjList list = (JBObjList) ses.getAttribute("ESD005001ListEX");
				list.initRow();    
			    while (list.getNextRow()) {
			      ESD005001Message msgSes = (ESD005001Message) list.getRecord();
			      if (msgSes.getE01WNMSEQ().equals(msgRT.getE02WNMSEQ())){			    	  			    	  
			    	  msgRT.setE02WNMTYP(msgSes.getE01WNMTYP());			    
			    	  break;
			      }
			    }
			    
				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0050_rt_alert_expired_messages_1.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("rtInstX", newmessage);
						forward("ESD0050_rt_alert_expired_messages_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}	

	protected void procActionRecInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0050");
				ESD005002Message msgRT = (ESD005002Message) mp.getMessageRecord("ESD005002");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0050");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("04");
				msgRT.setH02OPECOD("0004");
				userPO.setPurpose("INQUIRY");
				msgRT.setE02WNMACC(userPO.getAccNum());
				msgRT.setE02WNMACD(userPO.getApplicationCode());

				try {
					msgRT.setE02WNMNME(req.getParameter("E01WNMNME"));
				} catch (Exception e) {
					msgRT.setE02WNMNME("0");
				}
				try {
					msgRT.setE02WNMSEQ(req.getParameter("E01WNMSEQ"));
				} catch (Exception e) {
					msgRT.setE02WNMSEQ("0");
				}

				//buscamo el registro segun la secuencia que selecciono, al conseguila enviamos el TYP (tipo)
				JBObjList list = (JBObjList) ses.getAttribute("ESD005001List");
				list.initRow();    
			    while (list.getNextRow()) {
			      ESD005001Message msgSes = (ESD005001Message) list.getRecord();
			      if (msgSes.getE01WNMSEQ().equals(msgRT.getE02WNMSEQ())){			    	  			    	  
			    	  msgRT.setE02WNMTYP(msgSes.getE01WNMTYP());			    
			    	  break;
			      }
			    }
			    
				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0050_rt_alert_messages_1.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("rtInstX", newmessage);
						forward("ESD0050_rt_alert_messages_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	

	protected void procActionRecInqGen(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0050");
				ESD005002Message msgRT = (ESD005002Message) mp.getMessageRecord("ESD005002");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0050");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("04");
				msgRT.setH02OPECOD("0004");
				userPO.setPurpose("INQUIRY");

				try {
					msgRT.setE02WNMNME(req.getParameter("E01WNMNME"));
				} catch (Exception e) {
					msgRT.setE02WNMNME("0");
				}

				try {
					msgRT.setE02WNMACC(req.getParameter("E01WNMACC"));
				} catch (Exception e) {
					msgRT.setE02WNMACC("0");
				}

				try {
					msgRT.setE02WNMACD(req.getParameter("E01WNMACD"));
				} catch (Exception e) {
					msgRT.setE02WNMACD("C1");
				}

				try {
					msgRT.setE02WNMSEQ(req.getParameter("E01WNMSEQ"));
				} catch (Exception e) {
					msgRT.setE02WNMSEQ("0");
				}
				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0050_rt_alert_messages_4.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("rtInstX", newmessage);
						forward("ESD0050_rt_alert_messages_5.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	

	protected void procActionSpecial_CL(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String AccNum = "";

			try {

				mp = new MessageProcessor("ESD0050");
				ESD005003Message msgSP = (ESD005003Message) mp.getMessageRecord("ESD005003");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgSP.setH03USERID(user.getH01USR());
				msgSP.setH03PROGRM("ESD0050");
				msgSP.setH03TIMSYS(getTimeStamp());
				msgSP.setH03SCRCOD("01");
				msgSP.setH03OPECOD("0005");
				userPO.setOption("C1");
				userPO.setProdCode("C1");
				userPO.setAccNum(userPO.getCusNum());
				AccNum = req.getParameter("E01ACMCUN") == null ? "0" : req.getParameter("E01ACMCUN").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				if (userPO.getApplicationCode().equals("")) {
					userPO.setApplicationCode(userPO.getProdCode());
				}
				msgSP.setE03WNMACC(userPO.getAccNum());
				msgSP.setE03WNMACD(userPO.getApplicationCode());

				mp.sendMessage(msgSP);

				msgSP = (ESD005003Message) mp.receiveMessageRecord();
				ses.setAttribute("spInst", msgSP);

			} finally {
				if (mp != null)	mp.close();
			}

			try {

				mp = new MessageProcessor("ESD0050");
				ESD005001Message msgRT = (ESD005001Message) mp.getMessageRecord("ESD005001");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0050");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("01");
				msgRT.setH01OPECOD("0001");
				AccNum = req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				if (userPO.getApplicationCode().equals("")) {
					userPO.setApplicationCode(userPO.getProdCode());
				}
				msgRT.setE01WNMACC(userPO.getAccNum());
				msgRT.setE01WNMACD(userPO.getApplicationCode());

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01WNMIND","E01WNMNUM");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD005001List", list);
				}
				forward("ESD0050_rt_alert_messages_1.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}
	
	
	protected void procActionSpecial_AH(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String AccNum = "";

			try {

				mp = new MessageProcessor("ESD0050");
				ESD005003Message msgSP = (ESD005003Message) mp.getMessageRecord("ESD005003");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgSP.setH03USERID(user.getH01USR());
				msgSP.setH03PROGRM("ESD0050");
				msgSP.setH03TIMSYS(getTimeStamp());
				msgSP.setH03SCRCOD("01");
				msgSP.setH03OPECOD("0005");
				AccNum = req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				if (userPO.getApplicationCode().equals("")) {
					userPO.setApplicationCode(userPO.getProdCode());
				}
				msgSP.setE03WNMACC(userPO.getAccNum());
				msgSP.setE03WNMACD(userPO.getApplicationCode());

				mp.sendMessage(msgSP);

				msgSP = (ESD005003Message) mp.receiveMessageRecord();
				ses.setAttribute("spInst", msgSP);

			} finally {
				if (mp != null)	mp.close();
			}

			try {

				mp = new MessageProcessor("ESD0050");
				ESD005001Message msgRT = (ESD005001Message) mp.getMessageRecord("ESD005001");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0050");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("01");
				msgRT.setH01OPECOD("0001");
				AccNum = req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				if (userPO.getApplicationCode().equals("")) {
					userPO.setApplicationCode(userPO.getProdCode());
				}
				msgRT.setE01WNMACC(userPO.getAccNum());
				msgRT.setE01WNMACD(userPO.getApplicationCode());

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01WNMIND","E01WNMNUM");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD005001List", list);
				}
				forward("ESD0050_rt_alert_messages_1.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}

	protected void procAction_ExpiredMessages(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;


			try {

				mp = new MessageProcessor("ESD0050");
				ESD005001Message msgRT = (ESD005001Message) mp.getMessageRecord("ESD005001");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0050");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("01");
				msgRT.setH01OPECOD("0003");
				msgRT.setE01WNMACC(userPO.getAccNum());
				msgRT.setE01WNMACD(userPO.getApplicationCode());

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01WNMIND","E01WNMNUM");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD005001ListEX", list);
				}
				forward("ESD0050_rt_alert_expired_messages_1.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}
	
	
	protected void procActionSpecialList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String AccNum = "";

			try {

				mp = new MessageProcessor("ESD0050");
				ESD005003Message msgSP = (ESD005003Message) mp.getMessageRecord("ESD005003");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgSP.setH03USERID(user.getH01USR());
				msgSP.setH03PROGRM("ESD0050");
				msgSP.setH03TIMSYS(getTimeStamp());
				msgSP.setH03SCRCOD("01");
				msgSP.setH03OPECOD("0005");
				AccNum = req.getParameter("E01CUSCUN") == null ? "0" : req.getParameter("E01CUSCUN").trim();
				if (!AccNum.equals("0")) {
					userPO.setCusNum(AccNum.trim());
				}
				msgSP.setE03WNMACC(userPO.getCusNum());
				msgSP.setE03WNMCUN(userPO.getCusNum());
				msgSP.setE03WNMACD("C1");

				mp.sendMessage(msgSP);

				msgSP = (ESD005003Message) mp.receiveMessageRecord();
				ses.setAttribute("spInst", msgSP);

			} finally {
				if (mp != null)	mp.close();
			}

			try {

				mp = new MessageProcessor("ESD0050");
				ESD005001Message msgRT = (ESD005001Message) mp.getMessageRecord("ESD005001");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0050");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("01");
				msgRT.setH01OPECOD("0002");
				AccNum = req.getParameter("E01CUSCUN") == null ? "0" : req.getParameter("E01CUSCUN").trim();
				if (!AccNum.equals("0")) {
					userPO.setCusNum(AccNum.trim());
				}
				msgRT.setE01WNMACC(userPO.getCusNum());
				msgRT.setE01WNMACD("C1");
				userPO.setPurpose("INQUIRY");
				userPO.setOption("C1");
				
				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01WNMIND","E01WNMNUM");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD005001List", list);
				}
				forward("ESD0050_rt_alert_messages_4.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}
	

	protected void procActionSpecial_CT(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String AccNum = "";

			try {

				mp = new MessageProcessor("ESD0050");
				ESD005003Message msgSP = (ESD005003Message) mp.getMessageRecord("ESD005003");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgSP.setH03USERID(user.getH01USR());
				msgSP.setH03PROGRM("ESD0050");
				msgSP.setH03TIMSYS(getTimeStamp());
				msgSP.setH03SCRCOD("01");
				msgSP.setH03OPECOD("0005");
				AccNum = req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				if (userPO.getApplicationCode().equals("")) {
					userPO.setApplicationCode(userPO.getProdCode());
				}
				msgSP.setE03WNMACC(userPO.getAccNum());
				msgSP.setE03WNMACD(userPO.getApplicationCode());

				mp.sendMessage(msgSP);

				msgSP = (ESD005003Message) mp.receiveMessageRecord();
				ses.setAttribute("spInst", msgSP);

			} finally {
				if (mp != null)	mp.close();
			}

			try {

				mp = new MessageProcessor("ESD0050");
				ESD005001Message msgRT = (ESD005001Message) mp.getMessageRecord("ESD005001");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0050");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("01");
				msgRT.setH01OPECOD("0001");
				AccNum = req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				if (userPO.getApplicationCode().equals("")) {
					userPO.setApplicationCode(userPO.getProdCode());
				}
				msgRT.setE01WNMACC(userPO.getAccNum());
				msgRT.setE01WNMACD(userPO.getApplicationCode());

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01WNMIND","E01WNMNUM");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD005001List", list);
				}
				forward("ESD0050_rt_alert_messages_1.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}

	protected void procActionSpecial_CD(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String AccNum = "";

			try {

				mp = new MessageProcessor("ESD0050");
				ESD005003Message msgSP = (ESD005003Message) mp.getMessageRecord("ESD005003");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgSP.setH03USERID(user.getH01USR());
				msgSP.setH03PROGRM("ESD0050");
				msgSP.setH03TIMSYS(getTimeStamp());
				msgSP.setH03SCRCOD("01");
				msgSP.setH03OPECOD("0005");
				AccNum = req.getParameter("E01DEAACC") == null ? "0" : req.getParameter("E01DEAACC").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				if (userPO.getApplicationCode().equals("")) {
					userPO.setApplicationCode(userPO.getProdCode());
				}
				msgSP.setE03WNMACC(userPO.getAccNum());
				msgSP.setE03WNMACD(userPO.getApplicationCode());

				mp.sendMessage(msgSP);

				msgSP = (ESD005003Message) mp.receiveMessageRecord();
				ses.setAttribute("spInst", msgSP);

			} finally {
				if (mp != null)	mp.close();
			}

			try {

				mp = new MessageProcessor("ESD0050");
				ESD005001Message msgRT = (ESD005001Message) mp.getMessageRecord("ESD005001");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0050");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("01");
				msgRT.setH01OPECOD("0001");
				AccNum = req.getParameter("E01DEAACC") == null ? "0" : req.getParameter("E01DEAACC").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				if (userPO.getApplicationCode().equals("")) {
					userPO.setApplicationCode(userPO.getProdCode());
				}
				msgRT.setE01WNMACC(userPO.getAccNum());
				msgRT.setE01WNMACD(userPO.getApplicationCode());

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01WNMIND","E01WNMNUM");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD005001List", list);
				}
				forward("ESD0050_rt_alert_messages_1.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}

	

	protected void procActionSpecial_LN(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String AccNum = "";

			try {

				mp = new MessageProcessor("ESD0050");
				ESD005003Message msgSP = (ESD005003Message) mp.getMessageRecord("ESD005003");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgSP.setH03USERID(user.getH01USR());
				msgSP.setH03PROGRM("ESD0050");
				msgSP.setH03TIMSYS(getTimeStamp());
				msgSP.setH03SCRCOD("01");
				msgSP.setH03OPECOD("0005");
				AccNum = req.getParameter("E01DEAACC") == null ? "0" : req.getParameter("E01DEAACC").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				if (userPO.getApplicationCode().equals("")) {
					userPO.setApplicationCode(userPO.getProdCode());
				}
				msgSP.setE03WNMACC(userPO.getAccNum());
				msgSP.setE03WNMACD(userPO.getApplicationCode());

				mp.sendMessage(msgSP);

				msgSP = (ESD005003Message) mp.receiveMessageRecord();
				ses.setAttribute("spInst", msgSP);

			} finally {
				if (mp != null)	mp.close();
			}

			try {

				mp = new MessageProcessor("ESD0050");
				ESD005001Message msgRT = (ESD005001Message) mp.getMessageRecord("ESD005001");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0050");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("01");
				msgRT.setH01OPECOD("0001");
				AccNum = req.getParameter("E01DEAACC") == null ? "0" : req.getParameter("E01DEAACC").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				if (userPO.getApplicationCode().equals("")) {
					userPO.setApplicationCode(userPO.getProdCode());
				}
				msgRT.setE01WNMACC(userPO.getAccNum());
				msgRT.setE01WNMACD(userPO.getApplicationCode());

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01WNMIND","E01WNMNUM");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD005001List", list);
				}
				forward("ESD0050_rt_alert_messages_1.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}

	
	protected void procReqRTEnterMaint_CL(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {

			UserPos userPO = null;

			try {
				userPO = new datapro.eibs.beans.UserPos();
				userPO.setOption("C1");
				userPO.setPurpose("MAINTENANCE");
				userPO.setRedirect("/servlet/datapro.eibs.alerts.JSESD0050?SCREEN=120");
				userPO.setProdCode("C1");

				//Others Parameters
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", new ELEERRMessage());
				
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			forward("ESD0050_rt_alert_messages_3.jsp", req, res);
		}

	
	
	
	
	
	protected void procReqRTEnterMaint_AH(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("SV");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.alerts.JSESD0050?SCREEN=210");
		userPO.setProdCode("04");
		//Others Parameters
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		
		forward("GENERIC_account_enter.jsp", req, res);
	}

	protected void procReqRTEnterMaint_CT(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RA");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.alerts.JSESD0050?SCREEN=220");
		userPO.setProdCode("RA");
		//Others Parameters
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		
		forward("GENERIC_account_enter.jsp", req, res);
	}
	
	protected void procReqRTEnterMaint_LN(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("LN");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.alerts.JSESD0050?SCREEN=400");
		userPO.setProdCode("10");
		//Others Parameters
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		userPO.setHeader1("E01DEAACC");
		userPO.setHeader2("H01FLGWK2");
		
		forward("GENERIC_account_enter.jsp", req, res);
	}
	

	protected void procReqRTEnterMaint_CD(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.alerts.JSESD0050?SCREEN=240");
		userPO.setProdCode("11");
		//Others Parameters
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		userPO.setHeader1("E01DEAACC");
		userPO.setHeader2("H01FLGWK2");
		
		forward("GENERIC_account_enter.jsp", req, res);
	}

	
}

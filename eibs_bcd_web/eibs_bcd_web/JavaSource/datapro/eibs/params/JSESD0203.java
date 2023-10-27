package datapro.eibs.params;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

import datapro.eibs.beans.DataTransaction;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD020301Message;
import datapro.eibs.beans.ESD020302Message;
import datapro.eibs.beans.ESD020303Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelResultSet;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.services.ExcelXLSXResultSet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

public class JSESD0203 extends JSEIBSServlet {

	private ServletConfig config = null;
	
	protected static final int R_ESCALA_BNK = 100;
	protected static final int A_ESCALA_GEN = 101;
	protected static final int A_ESCALA_NEW = 102;
	protected static final int A_ESCALA_ADD = 103;
	protected static final int A_ESCALA_MAN = 104;
	protected static final int A_ESCALA_INQ = 105;
	protected static final int A_ESCALA_DEL = 106;

	protected static final int R_GRUPO_BNK = 200;
	protected static final int A_GRUPO_GEN = 201;
	protected static final int A_GRUPO_NEW = 202;
	protected static final int A_GRUPO_ADD = 203;
	protected static final int A_GRUPO_MAN = 204;
	protected static final int A_GRUPO_INQ = 205;
	protected static final int A_GRUPO_DEL = 206;
	protected static final int A_GRUPO_CNO = 207;
	
	protected static final int R_CANAL_BNK = 300;
	protected static final int A_CANAL_GEN = 301;
	protected static final int A_CANAL_NEW = 302;
	protected static final int A_CANAL_ADD = 303;
	protected static final int A_CANAL_MAN = 304;
	protected static final int A_CANAL_INQ = 305;
	protected static final int A_CANAL_DEL = 306;

	
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen){
        case R_ESCALA_BNK :
        	proActionScaleBnk(user, req, res, session);
			break;
        case A_ESCALA_GEN :
        	proActionScaleGen(user, req, res, session);
			break;
        case A_ESCALA_NEW :
        	proActionScaleNew(user, req, res, session, screen);
			break;
        case A_ESCALA_ADD :
        	proActionScaleAdd(user, req, res, session, screen);
			break;
        case A_ESCALA_MAN :
        	proActionScaleMan(user, req, res, session, screen);
			break;
        case A_ESCALA_INQ :
        	proActionScaleInq(user, req, res, session, screen);
			break;
        case A_ESCALA_DEL :
        	proActionScaleDel(user, req, res, session, screen);
			break;

        case R_GRUPO_BNK :
        	proActionGroupBnk(user, req, res, session);
			break;
        case A_GRUPO_CNO :
        	proActionGroupCno(user, req, res, session);
			break;
        case A_GRUPO_GEN :
        	proActionGroupGen(user, req, res, session);
			break;
        case A_GRUPO_NEW :
        	proActionGroupNew(user, req, res, session, screen);
			break;
        case A_GRUPO_ADD :
        	proActionGroupAdd(user, req, res, session, screen);
			break;
        case A_GRUPO_MAN :
        	proActionGroupMan(user, req, res, session, screen);
			break;
        case A_GRUPO_INQ :
        	proActionGroupInq(user, req, res, session, screen);
			break;
        case A_GRUPO_DEL :
        	proActionGroupDel(user, req, res, session, screen);
			break;

        
        case R_CANAL_BNK :
        	proActionChannelBnk(user, req, res, session);
			break;
        case A_CANAL_GEN :
        	proActionChannelGen(user, req, res, session);
			break;
        case A_CANAL_NEW :
        	proActionChannelNew(user, req, res, session, screen);
			break;
        case A_CANAL_ADD :
        	proActionChannelAdd(user, req, res, session, screen);
			break;
        case A_CANAL_MAN :
        	proActionChannelMan(user, req, res, session, screen);
			break;
        case A_CANAL_INQ :
        	proActionChannelInq(user, req, res, session, screen);
			break;
        case A_CANAL_DEL :
        	proActionChannelDel(user, req, res, session, screen);
			break;

			
        default :
				forward(devPage, req, res);
				break;
		}
	}

	protected void proActionScaleBnk(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setRedirect("/servlet/datapro.eibs.products.JSESD0203?SCREEN=101");
		//Others Parameters
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		//userPO.setHeader1("E01DDTBNK");
		userPO.setHeader2("H01FLGWK2");
		
		forward("ESD0203_rt_scale_sel.jsp", req, res);
	}


	protected void proActionScaleGen(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String BnkNum = "";

			try {

				mp = new MessageProcessor("ESD0203");
				ESD020301Message msgRT = (ESD020301Message) mp.getMessageRecord("ESD020301");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0203");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("01");
				msgRT.setH01OPECOD("0001");
				BnkNum = req.getParameter("E01DDTBNK") == null ? "0" : req.getParameter("E01DDTBNK").trim();
				if (!BnkNum.equals("0")) {
					userPO.setBank(BnkNum.trim());
				} 
				msgRT.setE01DDTBNK(userPO.getBank());
				
				try {
					msgRT.setE01NUMREC(req.getParameter("FromRecord"));
				} catch (Exception e) {
					msgRT.setE01NUMREC("0"); 
				}


				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD020301List", list);
				}
				forward("ESD0203_rt_scale_list.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}

	
	protected void proActionScaleNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020301Message msgRT = (ESD020301Message) mp.getMessageRecord("ESD020301");

				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0203");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("02");
				msgRT.setH01OPECOD("0002");
				userPO.setPurpose("NEW");
				msgRT.setE01DDTBNK(userPO.getBank());

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0203_rt_scale_list.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("Scale", newmessage);
						forward("ESD0203_rt_scale_detail.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void proActionScaleAdd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020301Message msgRT = (ESD020301Message) mp.getMessageRecord("ESD020301");

				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0203");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("03");
				msgRT.setH01OPECOD("0003");
				msgRT.setE01DDTBNK(userPO.getBank());

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
					ses.setAttribute("Scale", newmessage );
						forward("ESD0203_rt_scale_detail.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSESD0203?SCREEN=101");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void proActionScaleMan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020301Message msgRT = (ESD020301Message) mp.getMessageRecord("ESD020301");

				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0203");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("04");
				msgRT.setH01OPECOD("0004");
				userPO.setPurpose("MAINTENANCE");
				msgRT.setE01DDTBNK(userPO.getBank());

				try {
					msgRT.setE01DDTCDE(req.getParameter("E01DDTCDE").trim());
				} catch (Exception e) {
					msgRT.setE01DDTCDE(" ");
				}
				try {
					msgRT.setE01DDTBRN(req.getParameter("E01DDTBRN").trim());
				} catch (Exception e) {
					msgRT.setE01DDTBRN(" ");
				}

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0203_rt_scale_list.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("Scale", newmessage);
						forward("ESD0203_rt_scale_detail.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void proActionScaleInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020301Message msgRT = (ESD020301Message) mp.getMessageRecord("ESD020301");

				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0203");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("05");
				msgRT.setH01OPECOD("0005");
				userPO.setPurpose("INQUIRY");
				msgRT.setE01DDTBNK(userPO.getBank());


				try {
					msgRT.setE01DDTCDE(req.getParameter("E01DDTCDE"));
				} catch (Exception e) {
					msgRT.setE01DDTCDE(" ");
				}


				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0203_rt_scale_list.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("Scale", newmessage);
						forward("ESD0203_rt_scale_detail.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void proActionScaleDel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020301Message msgRT = (ESD020301Message) mp.getMessageRecord("ESD020301");

				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0203");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("06");
				msgRT.setH01OPECOD("0006");
				userPO.setPurpose("DELETE");
				msgRT.setE01DDTBNK(userPO.getBank());
				
				msgRT.setE01DDTCDE(req.getParameter("E01DDTCDE") == null ? " " : req.getParameter("E01DDTCDE").trim());
				msgRT.setE01DDTBRN(req.getParameter("E01DDTBRN") == null ? "0" : req.getParameter("E01DDTBRN").trim());
				
				// Send Message 
				mp.sendMessage(msgRT);

				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0203_rt_scale_list.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSESD0203?SCREEN=101");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	
	protected void proActionGroupBnk(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setRedirect("/servlet/datapro.eibs.products.JSESD0203?SCREEN=201");
		//Others Parameters
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		//userPO.setHeader1("E02DDGBNK");
		userPO.setHeader2("H02FLGWK2");
		
		forward("ESD0203_rt_group_sel.jsp", req, res);
	}


	protected void proActionGroupGen(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String BnkNum = "";
			String Code = "";
			
			try {

				mp = new MessageProcessor("ESD0203");
				ESD020302Message msgRT = (ESD020302Message) mp.getMessageRecord("ESD020302");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0203");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("01");
				msgRT.setH02OPECOD("0001");
				BnkNum = req.getParameter("E02DDGBNK") == null ? "0" : req.getParameter("E02DDGBNK").trim();
				Code = req.getParameter("E02DDGCDE") == null ? "0" : req.getParameter("E02DDGCDE").trim();
				if (!BnkNum.equals("0")) {
					userPO.setBank(BnkNum.trim());
				}

				if (!Code.equals("0")) {
					userPO.setHeader8(Code.trim());
				}
				
				msgRT.setE02DDGBNK(userPO.getBank());
				msgRT.setE02DDGCDE(userPO.getHeader8());
				try {
					msgRT.setE02NUMREC(req.getParameter("FromRecord"));
				} catch (Exception e) {
					msgRT.setE02NUMREC("0"); 
				}

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD020302List", list);
				}
				forward("ESD0203_rt_group_list.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}


	protected void proActionGroupCno(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String BnkNum = "";

			try {

				mp = new MessageProcessor("ESD0203");
				ESD020302Message msgRT = (ESD020302Message) mp.getMessageRecord("ESD020302");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0203");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("01");
				msgRT.setH02OPECOD("0015");
				BnkNum = req.getParameter("E02DDGBNK") == null ? "0" : req.getParameter("E02DDGBNK").trim();
				if (!BnkNum.equals("0")) {
					userPO.setBank(BnkNum.trim());
				}
				msgRT.setE02DDGBNK(userPO.getBank());
				try {
					msgRT.setE02NUMREC(req.getParameter("FromRecord"));
				} catch (Exception e) {
					msgRT.setE02NUMREC("0"); 
				}

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD020302List", list);
				}
				forward("ESD0203_rt_group_list_CNOFC.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}

	
	protected void proActionGroupNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020302Message msgRT = (ESD020302Message) mp.getMessageRecord("ESD020302");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0203");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("02");
				msgRT.setH02OPECOD("0002");
				userPO.setPurpose("NEW");
				msgRT.setE02DDGBNK(userPO.getBank());
				msgRT.setE02DDGCDE(userPO.getHeader8());
				
				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0203_rt_group_list.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("Group", newmessage);
						forward("ESD0203_rt_group_detail.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void proActionGroupAdd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020302Message msgRT = (ESD020302Message) mp.getMessageRecord("ESD020302");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0203");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("03");
				msgRT.setH02OPECOD("0003");
				msgRT.setE02DDGBNK(userPO.getBank());

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
					ses.setAttribute("Group", newmessage );
						forward("ESD0203_rt_group_detail.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSESD0203?SCREEN=201");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void proActionGroupMan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020302Message msgRT = (ESD020302Message) mp.getMessageRecord("ESD020302");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0203");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("04");
				msgRT.setH02OPECOD("0004");
				userPO.setPurpose("MAINTENANCE");
				msgRT.setE02DDGBNK(userPO.getBank());

				try {
					msgRT.setE02DDGCDE(req.getParameter("E02DDGCDE"));
				} catch (Exception e) {
					msgRT.setE02DDGCDE(" ");
				}

				try {
					msgRT.setE02DDGCUN(req.getParameter("E02DDGCUN"));
				} catch (Exception e) {
					msgRT.setE02DDGCUN(" ");
				}

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0203_rt_group_list.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("Group", newmessage);
						forward("ESD0203_rt_group_detail.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void proActionGroupInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020302Message msgRT = (ESD020302Message) mp.getMessageRecord("ESD020302");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0203");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("04");
				msgRT.setH02OPECOD("0004");
				userPO.setPurpose("INQUIRY");
				msgRT.setE02DDGBNK(userPO.getBank());


				try {
					msgRT.setE02DDGCDE(req.getParameter("E02DDGCDE"));
				} catch (Exception e) {
					msgRT.setE02DDGCDE(" ");
				}


				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0203_rt_group_list.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("Group", newmessage);
						forward("ESD0203_rt_group_detail.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void proActionGroupDel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020302Message msgRT = (ESD020302Message) mp.getMessageRecord("ESD020302");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0203");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("06");
				msgRT.setH02OPECOD("0006");
				userPO.setPurpose("DELETE");
				msgRT.setE02DDGBNK(userPO.getBank());
				try {
					msgRT.setE02DDGCDE(req.getParameter("E02DDGCDE"));
				} catch (Exception e) {
					msgRT.setE02DDGCDE(" ");
				}

				// Send Message 
				mp.sendMessage(msgRT);

				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0203_rt_group_list.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSESD0203?SCREEN=201");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	
	
	protected void proActionChannelBnk(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setRedirect("/servlet/datapro.eibs.products.JSESD0203?SCREEN=301");
		//Others Parameters
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		//userPO.setHeader1("E03DDCBNK");
		userPO.setHeader2("H03FLGWK2");
		
		forward("ESD0203_rt_channel_sel.jsp", req, res);
	}


	protected void proActionChannelGen(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String BnkNum = "";

			try {

				mp = new MessageProcessor("ESD0203");
				ESD020303Message msgRT = (ESD020303Message) mp.getMessageRecord("ESD020303");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("ESD0203");
				msgRT.setH03TIMSYS(getTimeStamp());
				msgRT.setH03SCRCOD("01");
				msgRT.setH03OPECOD("0001");
				BnkNum = req.getParameter("E03DDHBNK") == null ? "0" : req.getParameter("E03DDHBNK").trim();
				if (!BnkNum.equals("0")) {
					userPO.setBank(BnkNum.trim());
				}
				msgRT.setE03DDHBNK(userPO.getBank());
				try {
					msgRT.setE03NUMREC(req.getParameter("FromRecord"));
				} catch (Exception e) {
					msgRT.setE03NUMREC("0"); 
				}

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E03INDOPE","E03NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD020303List", list);
				}
				forward("ESD0203_rt_channel_list.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}

	
	protected void proActionChannelNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020303Message msgRT = (ESD020303Message) mp.getMessageRecord("ESD020303");

				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("ESD0203");
				msgRT.setH03TIMSYS(getTimeStamp());
				msgRT.setH03SCRCOD("02");
				msgRT.setH03OPECOD("0002");
				userPO.setPurpose("NEW");
				msgRT.setE03DDHBNK(userPO.getBank());

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0203_rt_channel_list.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("Channel", newmessage);
						forward("ESD0203_rt_channel_detail.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void proActionChannelAdd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020303Message msgRT = (ESD020303Message) mp.getMessageRecord("ESD020303");

				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("ESD0203");
				msgRT.setH03TIMSYS(getTimeStamp());
				msgRT.setH03SCRCOD("03");
				msgRT.setH03OPECOD("0003");
				msgRT.setE03DDHBNK(userPO.getBank());
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
					ses.setAttribute("Channel", newmessage );
						forward("ESD0203_rt_channel_detail.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSESD0203?SCREEN=301");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void proActionChannelMan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020303Message msgRT = (ESD020303Message) mp.getMessageRecord("ESD020303");

				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("ESD0203");
				msgRT.setH03TIMSYS(getTimeStamp());
				msgRT.setH03SCRCOD("04");
				msgRT.setH03OPECOD("0004");
				userPO.setPurpose("MAINTENANCE");
				msgRT.setE03DDHBNK(userPO.getBank());
				msgRT.setE03DDHCHN(req.getParameter("XHHCHN"));
				msgRT.setE03DDHCDE(req.getParameter("XHHCDE"));
				msgRT.setE03DDHPRV(req.getParameter("XHHPRV"));

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0203_rt_channel_list.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("Channel", newmessage);
						forward("ESD0203_rt_channel_detail.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void proActionChannelInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020303Message msgRT = (ESD020303Message) mp.getMessageRecord("ESD020303");

				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("ESD0203");
				msgRT.setH03TIMSYS(getTimeStamp());
				msgRT.setH03SCRCOD("04");
				msgRT.setH03OPECOD("0004");
				userPO.setPurpose("INQUIRY");
				msgRT.setE03DDHBNK(userPO.getBank());
				msgRT.setE03DDHCHN(req.getParameter("XHHCHN"));
				msgRT.setE03DDHCDE(req.getParameter("XHHCDE"));



				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0203_rt_channel_list.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("Channel", newmessage);
						forward("ESD0203_rt_channel_detail.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void proActionChannelDel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0203");
				ESD020303Message msgRT = (ESD020303Message) mp.getMessageRecord("ESD020303");

				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("ESD0203");
				msgRT.setH03TIMSYS(getTimeStamp());
				msgRT.setH03SCRCOD("06");
				msgRT.setH03OPECOD("0006");
				userPO.setPurpose("DELETE");
				msgRT.setE03DDHBNK(userPO.getBank());
				msgRT.setE03DDHCHN(req.getParameter("XHHCHN"));
				msgRT.setE03DDHCDE(req.getParameter("XHHCDE"));
				msgRT.setE03DDHPRV(req.getParameter("XHHPRV"));


				// Send Message 
				mp.sendMessage(msgRT);

				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0203_rt_channel_list.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSESD0203?SCREEN=301");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}


	
}

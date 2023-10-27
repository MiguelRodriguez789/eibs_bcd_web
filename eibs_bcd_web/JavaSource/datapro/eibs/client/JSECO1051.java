package datapro.eibs.client;

/**
 * Aprobación de Convenios
 * Creation date: (15/01/14)
 * @author: elias vargas
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECO010001Message;
import datapro.eibs.beans.ECO105001Message;

import datapro.eibs.beans.ECO105003Message;
import datapro.eibs.beans.ECO105004Message;
import datapro.eibs.beans.ECO105101Message;
import datapro.eibs.beans.ECO105102Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageRecord;

public class JSECO1051 extends JSEIBSServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4078635231437884800L;
	
	protected static final int R_COLLECT_DEAL_APPROVAL_LIST = 500;
	protected static final int R_PASSWORD = 100;	
	protected static final int R_APROVE = 200;	
	protected static final int R_REJECT = 300;
	protected static final int R_DELETE = 400;	
	protected static final int R_INQUIRY = 900;
	
	protected static final String APPROVE = "A";
	protected static final String REJECT = "R";
	protected static final String DELETE = "D";
	

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case R_COLLECT_DEAL_APPROVAL_LIST:
				procReqCollectDealApprovalList(user, req, res, session);
				break;		
			case R_APROVE:
				procActionApproveReject(user, req, res, session, APPROVE);
				break;
			case R_REJECT:
				procActionApproveReject(user, req, res, session, REJECT);
				break;	
			case R_DELETE:
				procActionApproveReject(user, req, res, session, DELETE);
				break;	
			case R_INQUIRY :
				procReqInquiry(user, req, res, session);
				break;	
			case R_PASSWORD :
				procReqPassword(req, res, session);
				break;				
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}

	/**
	 * procActionApproveReject
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @param option
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionApproveReject(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session, String option)
			throws ServletException, IOException {
			
			UserPos userPO = getUserPos(req);
			
			MessageProcessor mp = null;
			
			try {
				
				mp = getMessageProcessor("ECO1051", req);
				JBObjList list = (JBObjList)session.getAttribute("ECO105101List");
				int index = req.getParameter("key")==null?0:req.getParameter("key").equals("")?0:Integer.parseInt(req.getParameter("key"));
				
				ECO105101Message listMessage = (ECO105101Message)list.get(index);

				ECO105102Message msg = (ECO105102Message) mp.getMessageRecord("ECO105102", user.getH01USR(), "0005");
				msg.setH02SCRCOD("01");
			 	msg.setE02ACTION(option);
			 	msg.setE02COMNUM(listMessage.getE01COMNUM());
			 	msg.setE02COMBNK(listMessage.getE01COMBNK());			 	
			 	msg.setE02MSGTXT(req.getParameter("reason")==null?"":req.getParameter("reason"));
			 	mp.sendMessage(msg);
			 	
			 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
	            
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				
				if (!mp.hasError(msgError)){
					procReqCollectDealApprovalList(user, req, res, session);
				} else {
					session.setAttribute("convObj", msg);
					forward("ECO1051_collect_deal_approval_list.jsp", req, res);
				}
				
				

			} finally {
				if (mp != null)	mp.close();
			}
	    }	
	

	protected void procReqCollectDealApprovalList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException { 
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ECO1051", req);

				//Grab Search Parameters
				ECO105101Message searchParameters = (ECO105101Message) session.getAttribute("searchParameters");
				if(null != searchParameters){
					setMessageRecord(req, searchParameters);
				} else {
					searchParameters = new ECO105101Message();
				}						
				
				ECO105101Message msgList = (ECO105101Message) mp.getMessageRecord("ECO105101", user.getH01USR(), "0015");
				setMessageRecord(req, msgList);
				mp.sendMessage(msgList);
			 	
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
				
				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
					flexLog("About to call Error Page: sckNotRespondPage");
					forward(sckNotRespondPage, req, res);	
				} else {
					session.setAttribute("searchParameters", searchParameters);
					session.setAttribute("ECO105101List", list);
					forwardOnSuccess("ECO1051_collect_deal_approval_list.jsp", req, res);
				}	

			} finally {
				if (mp != null)	mp.close();
			}
		}	

	/**
	 * procReqInquiry
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqInquiry(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			UserPos userPO = getUserPos(req);
			
			MessageProcessor mp = null;
			MessageProcessor mp3 = null;
			MessageProcessor mp4 = null;
			ELEERRMessage msgError = new ELEERRMessage();
			ECO105001Message msg = null;
			ECO105003Message msg3 = null;
			ECO105004Message msg4 = null;
			try {
				
				JBObjList list = (JBObjList)session.getAttribute("ECO105101List");
				int index = req.getParameter("key")==null?0:req.getParameter("key").equals("")?0:Integer.parseInt(req.getParameter("key"));
				
				ECO105101Message listMessage = (ECO105101Message)list.get(index);
							
				mp = getMessageProcessor("ECO001002", req);
	
				msg = (ECO105001Message) mp.getMessageRecord("ECO105001");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ECO0010");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01SCR("01");
				msg.setH01OPECOD("0002");//para consultar
			 	msg.setE01COMNUM(listMessage.getE01COMNUM());
			 	msg.setE01COMCUN(listMessage.getE01COMCUN());
			 	
			 	mp.sendMessage(msg);
			 
			 	
			 	MessageRecord generic = mp.receiveMessageRecord();
				if (generic.getFormatName().equals("ELEERR")) {
					msgError = (ELEERRMessage) generic;
					session.setAttribute("error", msgError);
				}else if (generic.getFormatName().equals("ECO105001")) {
					msg = (ECO105001Message) generic;
				}				
				
				//*******************************************
				//set key and send data dds03
				//*******************************************
				mp3 = getMessageProcessor("ECO1050", req);
				msg3 = (ECO105003Message) mp3.getMessageRecord("ECO105003", user.getH01USR(), "0002");//TODO: luego cambiar por 0004	
				msg3.setE03MEIBNK(msg.getE01COMBNK());
				msg3.setE03MEICUN(msg.getE01COMCUN());
				msg3.setE03MEINUM(msg.getE01COMNUM());
				msg3.setE03MEIDCL(msg.getE01COMDCL());
				msg3.setE03MEIIDN(msg.getE01COMIDN());
				mp3.sendMessage(msg3);
				MessageRecord generic3 = mp3.receiveMessageRecord();
				if (generic3.getFormatName().equals("ELEERR")) {
					msgError = (ELEERRMessage) generic3;
					session.setAttribute("error", msgError);
				}else if (generic3.getFormatName().equals("ECO105003")) {
					 msg3 = (ECO105003Message) generic3;
				}
				
				//*******************************************
				//set key and send data dds04
				//*******************************************					
				mp4 = getMessageProcessor("ECO1050", req);
				msg4 = (ECO105004Message) mp4.getMessageRecord("ECO105004", user.getH01USR(), "0002");//TODO: luego cambiar por 0004	
				msg4.setE04DCBBNK(msg.getE01COMBNK());
				msg4.setE04DCBCUN(msg.getE01COMCUN());
				msg4.setE04DCBNUM(msg.getE01COMNUM());
				msg4.setE04DCBDCL(msg.getE01COMDCL());
				msg4.setE04DCBIDN(msg.getE01COMIDN());
				mp4.sendMessage(msg4);
				MessageRecord generic4 = mp4.receiveMessageRecord();
				if (generic4.getFormatName().equals("ELEERR")) {
					msgError = (ELEERRMessage) generic4;
					session.setAttribute("error", msgError);
				}else if (generic4.getFormatName().equals("ECO105004")) {
					 msg4 = (ECO105004Message) generic4;
				}
				
				
				userPO.setPurpose("APPROVAL");//Set Purpose
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("cdeObj", msg);
				session.setAttribute("cdeObj3", msg3);
				session.setAttribute("cdeObj4", msg4);
				forward("ECO1050_collect_deal_maintenance.jsp", req, res);
				
	
			} finally {
				if (mp != null)	mp.close();
			}
	  }	
	protected void procReqPassword(
			HttpServletRequest req, 
			HttpServletResponse res, 
			HttpSession ses)
			throws ServletException, IOException {
				flexLog ("Entre en procReqPassword ");
				UserPos	userPO = new UserPos();			
				try {
				
					userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
					userPO.setRedirect("/servlet/datapro.eibs.client.JSECO1051?SCREEN=" + R_COLLECT_DEAL_APPROVAL_LIST);
					ses.setAttribute("userPO", userPO);
					ses.removeAttribute("searchParameters");
					
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
				
				}
				catch (Exception e)	{
					e.printStackTrace();
					flexLog("Error: " + e);
					throw new RuntimeException("Socket Communication Error");
				}	
			
			}
 }	




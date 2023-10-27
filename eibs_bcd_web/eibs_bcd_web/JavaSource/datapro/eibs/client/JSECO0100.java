package datapro.eibs.client;

/**
 * Aprobación de Convenios
 * Creation date: (03/07/12)
 * @author: Catalina Sepulveda
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import datapro.eibs.beans.ECO001002Message;
import datapro.eibs.beans.ECO010001Message;
import datapro.eibs.beans.ECO010002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSECO0100 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5374590957161957090L;

	protected static final int R_COVENANT_APPROVAL_LIST = 500;
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
			case R_COVENANT_APPROVAL_LIST:
				procReqCovenantApprovalList(user, req, res, session);
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
				
				mp = getMessageProcessor("ECO0100", req);
				JBObjList list = (JBObjList)session.getAttribute("ECO010001List");
				int index = req.getParameter("key")==null?0:req.getParameter("key").equals("")?0:Integer.parseInt(req.getParameter("key"));
				
				ECO010001Message listMessage = (ECO010001Message)list.get(index);

				ECO010002Message msg = (ECO010002Message) mp.getMessageRecord("ECO010002", user.getH01USR(), "0005");
				msg.setH02SCRCOD("01");
			 	msg.setE02ACTION(option);
			 	msg.setE02EMPNUM(listMessage.getE01EMPNUM());
			 	msg.setE02EMPCUN(listMessage.getE01EMPCUN());
			 	
			 	mp.sendMessage(msg);
			 	
			 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
	            
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				
				if (!mp.hasError(msgError)){
					procReqCovenantApprovalList(user, req, res, session);
				} else {
					session.setAttribute("convObj", msg);
					forward("ECO0100_covenant_approval_list.jsp", req, res);
				}
				
				

			} finally {
				if (mp != null)	mp.close();
			}
	    }	
	

	/**
	 * LCrosby
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqCovenantApprovalList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ECO0100", req);
				
				//Grab Search Parameters
				ECO010001Message searchParameters = (ECO010001Message) session.getAttribute("searchParameters");
				if(null != searchParameters){
					setMessageRecord(req, searchParameters);
				} else {
					searchParameters = new ECO010001Message();
				}						

				ECO010001Message msgList = (ECO010001Message) mp.getMessageRecord("ECO010001", user.getH01USR(), "0015");
				setMessageRecord(req, msgList);
				mp.sendMessage(msgList);
			 	
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
				
				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
					flexLog("About to call Error Page: sckNotRespondPage");
					forward(sckNotRespondPage, req, res);	
				} else {
					session.setAttribute("searchParameters", searchParameters);
					session.setAttribute("ECO010001List", list);
					forwardOnSuccess("ECO0100_covenant_approval_list.jsp", req, res);
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
			
			try {
				
				JBObjList list = (JBObjList)session.getAttribute("ECO010001List");
				int index = req.getParameter("key")==null?0:req.getParameter("key").equals("")?0:Integer.parseInt(req.getParameter("key"));
				
				ECO010001Message listMessage = (ECO010001Message)list.get(index);
							
				mp = getMessageProcessor("ECO001002", req);
	
				ECO001002Message msg = (ECO001002Message) mp.getMessageRecord("ECO001002");
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("ECO0010");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("01");
				msg.setH02OPECOD("0004");
			 	msg.setE02COSNUM(listMessage.getE01EMPNUM());
			 	msg.setE02COSECU(listMessage.getE01EMPCUN());
			 	
			 	mp.sendMessage(msg);
			 
			 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
				msg = (ECO001002Message) mp.receiveMessageRecord();
	
				if (!mp.hasError(msgError)) {
					session.setAttribute("error", msgError);
					session.setAttribute("userPO", userPO);
					session.setAttribute("cnvObj", msg);
					forward("ECO0010_covenant_maintenance.jsp?readOnly=true", req, res);
				} else {	
					session.setAttribute("error", msgError);
					forward("error_viewer.jsp", req, res);
				}				
	
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
			UserPos	userPO = null;
			
			try {
			
			userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
			userPO.setRedirect("/servlet/datapro.eibs.client.JSECO0100?SCREEN=" + R_COVENANT_APPROVAL_LIST);
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




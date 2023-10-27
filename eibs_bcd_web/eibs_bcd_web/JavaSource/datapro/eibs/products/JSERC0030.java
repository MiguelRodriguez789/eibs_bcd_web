package datapro.eibs.products;

/**
 * Aprobación de Cartolas de Bancos
 * Creation date: (24/01/2013)
 * @author: Jose M. Buitrago
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generic.tool.Util;


import datapro.eibs.beans.ERC000003Message;
import datapro.eibs.beans.ERC003001Message;
import datapro.eibs.beans.ERC003002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSERC0030 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5374590957161957090L;

	protected static final int R__APPROVAL_LIST = 100;
	
	protected static final int R_APROVE = 200;	
	protected static final int R_REJECT = 300;
	protected static final int R_DELETE = 400;	
	protected static final int R_INQUIRY = 900;
	protected static final int R_INQUIRY_APV = 901;
	
	protected static final String APPROVE = "A";
	protected static final String REJECT = "R";
	protected static final String DELETE = "D";
	

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case R__APPROVAL_LIST:
				procReqRcbankApprovalList(user, req, res, session);
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
			case R_INQUIRY_APV :
				procReqInquiryAPV(user, req, res, session);
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
				
				mp = getMessageProcessor("ERC0030", req);
				JBObjList list = (JBObjList)session.getAttribute("ERC003001List");
				int index = Util.parseInt(req.getParameter("key"));
				
				ERC003001Message listMessage = (ERC003001Message)list.get(index);

				ERC003002Message msg = (ERC003002Message) mp.getMessageRecord("ERC003002", user.getH01USR(), "0005");
				msg.setH02SCRCOD("01");
			 	msg.setE02ACTION(option);
			 	msg.setE02RCIRBK(listMessage.getE01RCIRBK());
			 	msg.setE02RCICTA(listMessage.getE01RCICTA());
			 	msg.setE02RCISTN(listMessage.getE01RCISTN());
			 	msg.setE02RCISDD(listMessage.getE01RCISDD());
			 	msg.setE02RCISDM(listMessage.getE01RCISDM());
			 	msg.setE02RCISDY(listMessage.getE01RCISDY());
			 	flexLog("mensaje enviado..." + msg);
			 	mp.sendMessage(msg);
			 	
			 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
	            
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				
				if (!mp.hasError(msgError)){
					procReqRcbankApprovalList(user, req, res, session);
				} else {
					session.setAttribute("convObj", msg);
					forward("ERC0030_PAC_seguros_approval_list.jsp", req, res);
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
	protected void procReqRcbankApprovalList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ERC0030", req);

				ERC003001Message msgList = (ERC003001Message) mp.getMessageRecord("ERC003001", user.getH01USR(), "0015");
				mp.sendMessage(msgList);
			 	
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
				
				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
					flexLog("About to call Error Page: sckNotRespondPage");
					forward(sckNotRespondPage, req, res);	
				} else {
					session.setAttribute("ERC003001List", list);
					forwardOnSuccess("ERC0030_rcbank_approval_list.jsp", req, res);
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
				
				JBObjList list = (JBObjList)session.getAttribute("ERC003001List");
				int index = req.getParameter("key")==null?0:req.getParameter("key").equals("")?0:Integer.parseInt(req.getParameter("key"));
				
				ERC003001Message listMessage = (ERC003001Message)list.get(index);
							
				mp = getMessageProcessor("ERC003001", req);
	
				ERC003001Message msg = (ERC003001Message) mp.getMessageRecord("ERC003001");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ERC0030");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01SCRCOD("01");
				msg.setH01OPECOD("0004");
			 	msg.setE01RCIRBK(listMessage.getE01RCIRBK());
			 	msg.setE01RCICTA(listMessage.getE01RCICTA());
			 	msg.setE01RCISTN(listMessage.getE01RCISTN());
			 	msg.setE01RCISDD(listMessage.getE01RCISDD());
			 	msg.setE01RCISDM(listMessage.getE01RCISDM());
			 	msg.setE01RCISDY(listMessage.getE01RCISDY());
			 	
			 	mp.sendMessage(msg);
			 
			 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
				msg = (ERC003001Message) mp.receiveMessageRecord();
	
				if (!mp.hasError(msgError)) {
					session.setAttribute("error", msgError);
					session.setAttribute("userPO", userPO);
					session.setAttribute("cnvObj", msg);
					forward("ERC0030_PAC_seguros_maintenance.jsp?readOnly=true", req, res);
				} else {	
					session.setAttribute("error", msgError);
					forward("error_viewer.jsp", req, res);
				}				
	
			} finally {
				if (mp != null)	mp.close();
			}
	  }	
	protected void procReqInquiryAPV(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {
			JBObjList listinp = (JBObjList)session.getAttribute("ERC003001List");
			int index = req.getParameter("key")==null?0:req.getParameter("key").equals("")?0:Integer.parseInt(req.getParameter("key"));
			
			ERC003001Message listMessage = (ERC003001Message)listinp.get(index);
			mp = getMessageProcessor("ERC0000", req);
 
			ERC000003Message msg = (ERC000003Message) mp.getMessageRecord("ERC000003");
			msg.setH03USERID(user.getH01USR());
			msg.setH03OPECOD("0015");
			msg.setH03TIMSYS(getTimeStamp());
			
		 	msg.setE03RCIRBK(listMessage.getE01RCIRBK());
		 	msg.setE03RCICTA(listMessage.getE01RCICTA());
		 	msg.setE03RCISTN(listMessage.getE01RCISTN());
		 	msg.setE03RCISDD(listMessage.getE01RCISDD());
		 	msg.setE03RCISDM(listMessage.getE01RCISDM());
		 	msg.setE03RCISDY(listMessage.getE01RCISDY());
			
			//Sends message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERC000003Message) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				
				session.setAttribute("error", msgError);
				forward("ERC0000_rcbank_enter_selection.jsp", req, res);
				
			} else {
				userPO.setHeader20(msg.getE03RCIRBK());
				userPO.setHeader21(msg.getE03RCICTA());
				userPO.setCusName(msg.getE03CUSNA1());
				userPO.setHeader10(msg.getE03RCISTN());
				userPO.setHeader11(msg.getE03RCISDD());
				userPO.setHeader12(msg.getE03RCISDM());
				userPO.setHeader13(msg.getE03RCISDY());
				userPO.setHeader14(msg.getE03RCIACC());
				JBObjList list = mp.receiveMessageRecordList("H04FLGMAS");
	 
				session.setAttribute("rcbank", msg);
				session.setAttribute("userpPO", userPO);
				session.setAttribute("ERC000004List", list);
				forwardOnSuccess("ERC0030_rcbank_transaction_list.jsp", req, res);
				
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

 }



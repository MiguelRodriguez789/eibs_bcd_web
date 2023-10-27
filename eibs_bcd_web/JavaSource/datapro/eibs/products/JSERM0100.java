package datapro.eibs.products;

/**
 * Curse
 * Creation date: (03/07/12)
 * @author: JMBE
 */
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ERM000001Message;
import datapro.eibs.beans.ERM000003Message;
import datapro.eibs.beans.ERM010001Message;
import datapro.eibs.beans.ERM010002Message;
import datapro.eibs.beans.ELC525001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSERM0100 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5374590957161957090L;

	protected static final int R_PASSWORD = 100;
	
	protected static final int R_APPROVAL_LIST = 101;
	
	protected static final int R_APROVE = 200;	
	protected static final int R_REJECT = 300;
	protected static final int R_DELETE = 400;	
	protected static final int R_INQUIRY = 900;
	
	protected static final String APPROVE = "A";
	protected static final String REJECT = "R";
	protected static final String DELETE = "D";
	

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case R_PASSWORD :
				procReqPassword(user, req, res, session);
				break;
			case R_APPROVAL_LIST:
				procReqRenanentestApprovalList(user, req, res, session);
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
				procReqPlatformLiquidacionInquiry(user, req, res, session);
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
				
				mp = getMessageProcessor("ERM0100", req);
				JBObjList list = (JBObjList)session.getAttribute("ERM010001List");
				//int index = req.getParameter("key")==null?0:req.getParameter("key").equals("")?0:Integer.parseInt(req.getParameter("key"));
				int index = Integer.parseInt(req.getParameter("keysel").trim());
				
				ERM010001Message listMessage = (ERM010001Message)list.get(index);

				ERM010002Message msg = (ERM010002Message) mp.getMessageRecord("ERM010002", user.getH01USR(), "0005");
				msg.setH02SCRCOD("01");
			 	msg.setE02ACTION(option);
			 	msg.setE02RMMACC(listMessage.getE01RMMACC());
			 	
			 	mp.sendMessage(msg);
			 	
			 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
	            
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				
				if (!mp.hasError(msgError)){
						procReqRenanentestApprovalList(user, req, res, session);
				} else {
					session.setAttribute("convObj", msg);
					forward("ERM0100_remanentes_aprobacion_list.jsp", req, res);
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
	protected void procReqRenanentestApprovalList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ERM0100", req);
				
				//Grab Search Parameters
				ERM010001Message searchParameters = (ERM010001Message) session.getAttribute("searchParameters");
				if(null != searchParameters){
					setMessageRecord(req, searchParameters);
				} else {
					searchParameters = new ERM010001Message();
				}						

				ERM010001Message msgList = (ERM010001Message) mp.getMessageRecord("ERM010001", user.getH01USR(), "0015");
				setMessageRecord(req, msgList);			
				mp.sendMessage(msgList);
			 	
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
				
				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
					flexLog("About to call Error Page: sckNotRespondPage");
					forward("ERM0100_remanentes_aprobacion_list.jsp", req, res);
				} else {
					session.setAttribute("searchParameters", searchParameters);
					session.setAttribute("ERM010001List", list);
					forward("ERM0100_remanentes_aprobacion_list.jsp", req, res);
				}	

			} finally {
				if (mp != null)	mp.close();
			}
		}	


	private void procReqPassword(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		String appCode = req.getParameter("appCode") == null ? "" : "&appCode=" + req.getParameter("appCode");
		String account = req.getParameter("ACCNUM") == null ? "" : "&ACCNUM=" + req.getParameter("ACCNUM");
		String afcCode = req.getParameter("afcCode") == null ? "" : "&afcCode=" + req.getParameter("afcCode");
		
		UserPos	userPO = getUserPos(req);
		session.removeAttribute("searchParameters");
		
		userPO.setRedirect("/servlet/datapro.eibs.products.JSERM0100?SCREEN=" + R_APPROVAL_LIST);
		session.setAttribute("userPO", userPO);
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}
	
	
	/**
	 * procActionPlatformList: find the list of forms depending on status, the program will epvl1005
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqPlatformLiquidacionInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		MessageProcessor mp = null;

		try {

			mp = getMessageProcessor("ERM0000", req);
			JBObjList aplist = (JBObjList)session.getAttribute("ERM010001List");
			int index = req.getParameter("key")==null?0:req.getParameter("key").equals("")?0:Integer.parseInt(req.getParameter("key"));
			
			ERM010001Message listMessage = (ERM010001Message)aplist.get(index);

			if (listMessage.getE01RMMOPE().equals("02")){
				ERM000003Message msg = (ERM000003Message) mp.getMessageRecord("ERM000003");
				msg.setH03USERID(user.getH01USR());
				msg.setH03OPECOD("0004");
				msg.setH03TIMSYS(getTimeStamp());
				msg.setE03RMMACC(listMessage.getE01RMMACC());

				// Sends message
				mp.sendMessage(msg);

				//Receive error and data
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
				msg = (ERM000003Message) mp.receiveMessageRecord();
				// Receive salesPlatform list
				session.setAttribute("transaction", msg);
				if (!mp.hasError(msgError)) {
					// if there are no errors go to maintenance page
					forward("ERM0000_remanentes_transaccion.jsp?readOnly=true", req, res);
				} else {
					// if there are errors go back to list page
					session.setAttribute("error", msgError);
					forward("ERM0100_remanentes_aprobacion_list.jsp", req, res);
				}
				
			} else {
				ERM000001Message msg = (ERM000001Message) mp.getMessageRecord("ERM000001");
				msg.setH01USERID(user.getH01USR());
				msg.setH01OPECOD("0004");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setE01RMMACC(listMessage.getE01RMMACC());

				// Sends message
				mp.sendMessage(msg);

				//Receive error and data
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
				msg = (ERM000001Message) mp.receiveMessageRecord();
				// Receive salesPlatform list
				session.setAttribute("remanentes", msg);
				if (!mp.hasError(msgError)) {
					// if there are no errors go to maintenance page
					forward("ERM0000_remanentes_basic.jsp?readOnly=true", req, res);
				} else {
					// if there are errors go back to list page
					session.setAttribute("error", msgError);
					forward("ERM0100_remanentes_aprobacion_list.jsp", req, res);
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (mp != null)
				mp.close();
		}
	}

 }	




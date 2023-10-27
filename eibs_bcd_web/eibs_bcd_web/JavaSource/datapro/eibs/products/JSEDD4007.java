package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.beans.Beans;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDD400701Message;
import datapro.eibs.beans.EGL003501Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD059001Message;
import datapro.eibs.beans.ESD400001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSEDD4007 extends JSEIBSServlet {

	// Action 

	protected static final int R_CNBS_LIST = 100;	
	protected static final int R_NEW = 300;
	protected static final int R_MAINTENANCE = 500;
	protected static final int R_DELETE = 700;
	protected static final int A_MAINTENANCE = 600;
	protected static final int R_INQUIRY_LIST = 800;
	protected static final int R_INQUIRY = 900;
	protected static final int R_APPROVAL = 200;
	protected static final int A_APPROVAL = 1000;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case R_CNBS_LIST :
				procReqCnbsList(user, req, res, session);
				break;
			case R_APPROVAL :
				procAppCnbsList(user, req, res, session);
				break;	
			case R_MAINTENANCE :
				procReqMaintenance(user, req, res, session);
				break;	
			case A_MAINTENANCE :
				procActionMaintenance(user, req, res, session);
				break;	
			case R_NEW :
				procReqNew(user, req, res, session);
				break;
			case R_DELETE :
				procReqDelete(user, req, res, session);
				break;
			case R_INQUIRY_LIST :
				procReqInquiryList(user, req, res, session);
				break;		
			case R_INQUIRY :
				procReqInquiry(user, req, res, session);
				break;		
			case A_APPROVAL :
				procReqApproval(user, req, res, session);
				break;		
			default :
				//forward("MISC_not_available.jsp", req, res);
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}
	
	protected void procReqCnbsList(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD4007", req);

			EDD400701Message msgList = (EDD400701Message) mp.getMessageRecord("EDD400701");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("EDD4007");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0004");
			msgList.setE01SELCUN(userPO.getIdentifier());
		 	msgList.setE01SELRTP("K");
		 	
		 	mp.sendMessage(msgList);
		 	
			JBObjList list = mp.receiveMessageRecordList("H01MAS");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("EDD400701List", list);
				forwardOnSuccess("EDD4007_cnbs_list.jsp", req, res);
			}	

		} finally {
			if (mp != null)	mp.close();
		}
	}  


	protected void procAppCnbsList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			UserPos userPO = getUserPos(req);
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("EDD4007", req);

				EDD400701Message msgList = (EDD400701Message) mp.getMessageRecord("EDD400701");
				msgList.setH01USR(user.getH01USR());
				msgList.setH01PGM("EDD4007");
				msgList.setH01TIM(getTimeStamp());
				msgList.setH01SCR("01");
				msgList.setH01OPE("0004");
				msgList.setE01SELCUN(userPO.getIdentifier());
			 	msgList.setE01SELRTP("K");
			 	
			 	mp.sendMessage(msgList);
			 	
				JBObjList list = mp.receiveMessageRecordList("H01MAS");
				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
					forward("error_viewer.jsp", req, res);
				} else {
					session.setAttribute("userPO", userPO);
					session.setAttribute("EDD400701List", list);
					forwardOnSuccess("EDD4007_cnbs_list_app.jsp", req, res);
				}	

			} finally {
				if (mp != null)	mp.close();
			}
		}  	
	
	
protected void procReqMaintenance(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		
		try {
			
			JBObjList bl = (JBObjList) session.getAttribute("EDD400701Help");
						
			mp = getMessageProcessor("EDD4007", req);

			EDD400701Message msgList = (EDD400701Message) mp.getMessageRecord("EDD400701");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("EDD4007");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			
			if ( userPO.getPurpose().equals("APPROVAL_INQ") )
				msgList.setH01OPE("0009");	
			else msgList.setH01OPE("0002");
			
			msgList.setE01SELCUN(userPO.getIdentifier());
		 	msgList.setE01SELRTP("K");
		 	
		 	try {
				msgList.setE01SELMAN(req.getParameter("ROW"));
			} catch (Exception e) {
				msgList.setE01SELMAN("01");
			}
		 	
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (EDD400701Message) mp.receiveMessageRecord();
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnbsDetails", msgList);
            
			if ( userPO.getPurpose().equals("APPROVAL_INQ") )
			{
				if (!mp.hasError(msgError)) 				
					forward("EDD4007_cnbs_approval.jsp", req, res);
				else	
					forward("EDD4007_cnbs_list_app.jsp", req, res);
				
			}
			else
			{	
			    if (!mp.hasError(msgError)) 			
				   forward("EDD4007_cnbs_maintenance.jsp", req, res);
			    else 	
				 forward("EDD4007_cnbs_list.jsp", req, res);
			}

		} finally {
			if (mp != null)	mp.close();
		}
  }	
  	

protected void procReqApproval(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		
		try {
			
			JBObjList bl = (JBObjList) session.getAttribute("EDD400701Help");
						
			mp = getMessageProcessor("EDD4007", req);

			EDD400701Message msgList = (EDD400701Message) mp.getMessageRecord("EDD400701");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("EDD4007");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			
			
			msgList.setH01OPE("0009");	
			
			
			msgList.setE01SELCUN(userPO.getIdentifier());
		 	msgList.setE01SELRTP("K");
		 	
		 	try {
				msgList.setE01SELMAN(req.getParameter("ROW"));
			} catch (Exception e) {
				msgList.setE01SELMAN("01");
			}
		 	
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (EDD400701Message) mp.receiveMessageRecord();
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnbsDetails", msgList);

			if (!mp.hasError(msgError)) {				
				forward("EDD4007_cnbs_approval.jsp", req, res);
			} else {	
				forward("EDD4007_cnbs_list_app.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
  }	
protected void procActionMaintenance(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		
		try {
			
			JBObjList bl = (JBObjList) session.getAttribute("EDD400701Help");
						
			mp = getMessageProcessor("EDD4007", req);

			EDD400701Message msgList = (EDD400701Message) mp.getMessageRecord("EDD400701");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("EDD4007");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0005");
			msgList.setE01SELCUN(userPO.getIdentifier());
		 	msgList.setE01SELRTP("K");
			
		 	try {
				msgList.setE01SELMAN(req.getParameter("E01MAN"));
			} catch (Exception e) {
				msgList.setE01SELMAN("01");
			}
		 	
			java.util.Enumeration enu = msgList.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}
			
		 	mp.sendMessage(msgList);
		 	
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
		 	msgList = (EDD400701Message) mp.receiveMessageRecord();
            
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnbsDetails", msgList);
			
			if (!mp.hasError(msgError)) {
				redirectToPage("/servlet/datapro.eibs.products.JSEDD4007?SCREEN=100", res);
			} else {	
				forward("EDD4007_cnbs_maintenance.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
    }

protected void procReqNew(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		
		try {
			
			JBObjList bl = (JBObjList) session.getAttribute("EDD400701Help");
						
			mp = getMessageProcessor("EDD4007", req);

			EDD400701Message msgList = (EDD400701Message) mp.getMessageRecord("EDD400701");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("EDD4007");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0006");
			msgList.setE01SELCUN(userPO.getIdentifier());
		 	msgList.setE01SELRTP("K");
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (EDD400701Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("cnbsDetails", msgList);
				forward("EDD4007_cnbs_maintenance.jsp", req, res);
			} else {	
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
  }	

protected void procReqDelete(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("MAINTENANCE");
		
		MessageProcessor mp = null;
		
		try {
			
			JBObjList bl = (JBObjList) session.getAttribute("EDD400701Help");
						
			mp = getMessageProcessor("EDD4007", req);

			EDD400701Message msgList = (EDD400701Message) mp.getMessageRecord("EDD400701");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("EDD4007");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0003");
			msgList.setE01SELCUN(userPO.getIdentifier());
		 	msgList.setE01SELRTP("K");
		 	
		 	try {
				msgList.setE01SELMAN(req.getParameter("ROW"));
			} catch (Exception e) {
				msgList.setE01SELMAN("01");
			}
		 	
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (EDD400701Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				redirectToPage("/servlet/datapro.eibs.products.JSEDD4007?SCREEN=100", res);
			} else {	
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
  }	

protected void procReqInquiryList(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD4007", req);

			EDD400701Message msgList = (EDD400701Message) mp.getMessageRecord("EDD400701");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("EDD4007");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0007");
			msgList.setE01SELCUN(userPO.getIdentifier());
		 	msgList.setE01SELRTP("K");
		 	
		 	mp.sendMessage(msgList);
		 	
			JBObjList list = mp.receiveMessageRecordList("H01MAS");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("EDD400701List", list);
				forwardOnSuccess("EDD4007_cnbs_list_inquiry.jsp", req, res);
			}	

		} finally {
			if (mp != null)	mp.close();
		}
	}

protected void procReqInquiry(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		
		try {
			
			JBObjList bl = (JBObjList) session.getAttribute("EDD400701Help");
						
			mp = getMessageProcessor("EDD4007", req);

			EDD400701Message msgList = (EDD400701Message) mp.getMessageRecord("EDD400701");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("EDD4007");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0008");
			msgList.setE01SELCUN(userPO.getIdentifier());
		 	msgList.setE01SELRTP("K");
		 	
		 	try {
				msgList.setE01SELMAN(req.getParameter("ROW"));
			} catch (Exception e) {
				msgList.setE01SELMAN("01");
			}
		 	
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (EDD400701Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("cnbsDetails", msgList);
				forward("EDD4007_cnbs_inq.jsp", req, res);
			} else {	
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
  }	

 }	




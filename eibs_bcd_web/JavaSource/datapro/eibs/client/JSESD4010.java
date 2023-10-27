package datapro.eibs.client;

/*********************************************************************************************************************************/
/**  Modificado por          :  Patricia Cataldo L.                 DATAPRO                                                     **/
/**  Identificacion          :  PCL01                                                                                           **/
/**  Fecha                   :  02/14/2012                                                                                      **/
/**  Objetivo                :  Servicio de mantencion de referencias de un cliente                                             **/
/**                                                                                                                             **/
/*********************************************************************************************************************************/
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

import datapro.eibs.beans.EGL003501Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD059001Message;
import datapro.eibs.beans.ESD401001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSESD4010 extends JSEIBSServlet {

	// Action 

	protected static final int R_REFERENCE_LIST = 100;	
	protected static final int R_NEW = 300;
	protected static final int R_MAINTENANCE = 500;
	protected static final int R_DELETE = 700;
	protected static final int A_MAINTENANCE = 600;
	protected static final int R_INQUIRY_LIST = 800;
	protected static final int R_INQUIRY = 900;
	protected static final int R_APPROVAL = 200;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case R_REFERENCE_LIST :
				procReqREFERENCEList(user, req, res, session);
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
			default :
				//forward("MISC_not_available.jsp", req, res);
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}
	
	protected void procReqREFERENCEList(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD4010", req);

			ESD401001Message msgList = (ESD401001Message) mp.getMessageRecord("ESD401001");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD4010");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0015");
			userPO.setHeader10(req.getParameter("RECTYP"));
			msgList.setE01SELCUN(userPO.getCusNum());
		 	msgList.setE01SELRTP(userPO.getHeader10());
		 	
		 	mp.sendMessage(msgList);
		 	
			JBObjList list = mp.receiveMessageRecordList("H01MAS");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("ESD401001List", list);
				forwardOnSuccess("ESD4010_reference_list.jsp", req, res);
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
			
			JBObjList bl = (JBObjList) session.getAttribute("ESD401001Help");
						
			mp = getMessageProcessor("ESD4010", req);

			ESD401001Message msgList = (ESD401001Message) mp.getMessageRecord("ESD401001");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD4010");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0002");
			msgList.setH01WK1(" ");
			if ( userPO.getPurpose().equals("APPROVAL_INQ") )
				msgList.setH01WK1("A");	
			
			msgList.setE01SELCUN(userPO.getCusNum());
		 	msgList.setE01SELRTP(userPO.getHeader10());
		 	
		 	try {
				msgList.setE01SELMAN(req.getParameter("ROW"));
			} catch (Exception e) {
				msgList.setE01SELMAN("01");
			}
		 	
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (ESD401001Message) mp.receiveMessageRecord();
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("reference", msgList);

			if (!mp.hasError(msgError)) {				
				forward("ESD4010_reference_maintenance.jsp", req, res);
			} else {	
				forward("ESD4010_reference_list.jsp", req, res);
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
			
			JBObjList bl = (JBObjList) session.getAttribute("ESD401001Help");
						
			mp = getMessageProcessor("ESD4010", req);

			ESD401001Message msgList = (ESD401001Message) mp.getMessageRecord("ESD401001");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD4010");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0005");
			msgList.setE01SELCUN(userPO.getCusNum());
		 	msgList.setE01SELRTP(userPO.getHeader10());
 	
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
	
		 	flexLog("selman2 " + msgList.getE01SELMAN() );	
		 	mp.sendMessage(msgList);
		 	
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
		 	msgList = (ESD401001Message) mp.receiveMessageRecord();
            
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("reference", msgList);
			
			if (!mp.hasError(msgError)) {
				redirectToPage("/servlet/datapro.eibs.client.JSESD4010?SCREEN=100&RECTYP=" +userPO.getHeader10(), res);
			} else {	
				forward("ESD4010_reference_maintenance.jsp", req, res);
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
			
			JBObjList bl = (JBObjList) session.getAttribute("ESD401001Help");
						
			mp = getMessageProcessor("ESD4010", req);

			ESD401001Message msgList = (ESD401001Message) mp.getMessageRecord("ESD401001");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD4010");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0001");
			msgList.setE01SELCUN(userPO.getCusNum());
		 	msgList.setE01SELRTP(userPO.getHeader10());
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (ESD401001Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("reference", msgList);
				forward("ESD4010_reference_maintenance.jsp", req, res);
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
			
			JBObjList bl = (JBObjList) session.getAttribute("ESD401001Help");
						
			mp = getMessageProcessor("ESD4010", req);

			ESD401001Message msgList = (ESD401001Message) mp.getMessageRecord("ESD401001");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD4010");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0009");
			msgList.setE01SELCUN(userPO.getCusNum());
		 	msgList.setE01SELRTP(userPO.getHeader10());
		 	
		 	try {
				msgList.setE01SELMAN(req.getParameter("ROW"));
			} catch (Exception e) {
				msgList.setE01SELMAN("01");
			}
		 	flexLog("Linea a Borrar = " + msgList.getE01SELMAN());
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			if (!mp.hasError(msgError)) {
				redirectToPage("/servlet/datapro.eibs.client.JSESD4010?SCREEN=100&RECTYP=" +userPO.getHeader10(), res);
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
			mp = getMessageProcessor("ESD4010", req);

			ESD401001Message msgList = (ESD401001Message) mp.getMessageRecord("ESD401001");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD4010");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0015");
			userPO.setHeader10(req.getParameter("RECTYP"));
			msgList.setE01SELCUN(userPO.getCusNum());
		 	msgList.setE01SELRTP(userPO.getHeader10());
		 	
		 	try {
				msgList.setE01SELMAN(req.getParameter("ROW"));
			} catch (Exception e) {
				msgList.setE01SELMAN("01");
			}
		 	
		 	mp.sendMessage(msgList);
		 	
			JBObjList list = mp.receiveMessageRecordList("H01MAS");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("ESD401001List", list);
				forwardOnSuccess("ESD4010_reference_list.jsp", req, res);
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
			
			JBObjList bl = (JBObjList) session.getAttribute("ESD401001Help");
						
			mp = getMessageProcessor("ESD4010", req);

			ESD401001Message msgList = (ESD401001Message) mp.getMessageRecord("ESD401001");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD4010");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0004");
			msgList.setE01SELCUN(userPO.getCusNum());
		 	msgList.setE01SELRTP(userPO.getHeader10());
		 	
		 	try {
				msgList.setE01SELMAN(req.getParameter("ROW"));
			} catch (Exception e) {
				msgList.setE01SELMAN("01");
			}
		 	
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (ESD401001Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("reference", msgList);
				forward("ESD4010_reference_maintenance.jsp", req, res);
			} else {	
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
  }	

 }	




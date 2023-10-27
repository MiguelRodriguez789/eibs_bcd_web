
/**@author J.Leo.Buitrago  **/

package datapro.eibs.params;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD036001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;


public class JSESD0360 extends JSEIBSServlet {

	protected static final int DEF_LIST    	    = 100;
	protected static final int A_MAINTENANCE 	= 600;
	protected static final int A_POSITION 		= 800;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case DEF_LIST :
				procReqDefList(user, req, res, session);
				break;
				// Action
			case A_POSITION :
				procActionPos(user, req, res, session);
				break;
			case A_MAINTENANCE :
				procActionMaintenance(user, req, res, session);
				break;
			default :
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0360", req);
			ESD036001Message msgRT = (ESD036001Message) session.getAttribute("refDefs");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("ESD0360");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01OPECOD("");
			setMessageRecord(req, msgRT);
			
			mp.sendMessage(msgRT);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD036001Message) mp.receiveMessageRecord("ESD036001");
			
			if (mp.hasError(msgError)) {
				flexLog("Putting java beans into the session");
				session.setAttribute("error", msgError);
				session.setAttribute("refDefs", msgRT);
				session.setAttribute("userPO", userPO);
				
				forward("ESD0360_canal_table_details.jsp", req, res);
			} else {
				flexLog("Putting java beans into the session");
				session.setAttribute("error", msgError);
				session.setAttribute("refDefs", msgRT);
				session.setAttribute("userPO", userPO);
				
				procReqDefList(user, req, res, session);
			}
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionPos(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		int inptOPT = 0;
		try {
			inptOPT = Integer.parseInt(req.getParameter("opt").trim());
		} catch (Exception e) {
			inptOPT = 0;
		}
		switch (inptOPT) {
			case 1 : //New
				userPO.setPurpose("NEW");
				session.setAttribute("userPO", userPO);
				procReqNew(user, req, res, session);
				break;
			case 3 : //Deletion
				userPO.setPurpose("DELETE");
				session.setAttribute("userPO", userPO);
				procActionDelete(user, req, res, session);
				break;
			default : //Maintenance
				userPO.setPurpose("MAINTENANCE");
				session.setAttribute("userPO", userPO);
				procReqMaintenance(user, req, res, session);
				break;
		}
	}

	private void procReqMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0360", req);
		
				JBObjList list = (JBObjList) session.getAttribute("ESD036001Help");
				int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
				
				
				ESD036001Message msgDoc = (ESD036001Message) list.get(index);
				
				ESD036001Message msgMenu = (ESD036001Message) mp.getMessageRecord("ESD036001");
				msgMenu.setH01USERID(user.getH01USR());
				msgMenu.setH01PROGRM("ESD0360");
				msgMenu.setH01TIMSYS(getTimeStamp());
				msgMenu.setH01SCRCOD("01");
				msgMenu.setH01OPECOD("0002");
				
				msgMenu.setE01CNLCOD(msgDoc.getE01CNLCOD());
				msgMenu.setE01CNLRES(msgDoc.getE01CNLRES());
		
				mp.sendMessage(msgMenu);
				
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
				msgMenu = (ESD036001Message) mp.receiveMessageRecord();
			
				session.setAttribute("userPO", userPO);
				session.setAttribute("refDefs", msgMenu);
				session.setAttribute("error", msgError);
			
				flexLog("Putting java beans into the session");
				forward("ESD0360_canal_table_details.jsp", req, res);
							
			} finally {
				if(mp !=null)
					mp.close();
			}		
	}

	private void procActionDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ESD0360", req);
						

			JBObjList list = (JBObjList)session.getAttribute("ESD036001Help");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			ESD036001Message listMessage = (ESD036001Message)list.get(index);
			
			ESD036001Message msgMenu = (ESD036001Message) mp.getMessageRecord("ESD036001");
		 	msgMenu.setH01USERID(user.getH01USR());
		 	msgMenu.setH01TIMSYS(getTimeStamp());
		 	msgMenu.setH01SCRCOD("01");
		 	msgMenu.setH01OPECOD("0009");	
			msgMenu.setE01CNLCOD(listMessage.getE01CNLCOD());
			msgMenu.setE01CNLRES(listMessage.getE01CNLRES());
		 				
			mp.sendMessage(msgMenu);
			
			//Receive Error
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				procReqDefList(user, req, res, session);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("ESD0360_canal_table_list.jsp", req, res);
			}
		} finally {
			if (mp != null)	mp.close();
		}		
}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0360", req);
			ESD036001Message msgMenu = (ESD036001Message) mp.getMessageRecord("ESD036001");
			msgMenu.setH01USERID(user.getH01USR());
			msgMenu.setH01PROGRM("ESD0360");
			msgMenu.setH01TIMSYS(getTimeStamp());
	    	msgMenu.setH01SCRCOD("01");
	    	msgMenu.setH01OPECOD("0001");
	    	try {
		    	msgMenu.setE01CNLCOD(req.getParameter("E01CNLCOD"));
		    	msgMenu.setE01CNLRES(req.getParameter("E01CNLRES"));
			} catch (Exception e) {
		    	msgMenu.setE01CNLCOD("");
		    	msgMenu.setE01CNLRES("");
			}
			
			mp.sendMessage(msgMenu);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMenu = (ESD036001Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				//if there are no errors
				session.setAttribute("userPO", userPO);
				session.setAttribute("refDefs", msgMenu);
				session.setAttribute("error", msgError);
				
				forward("ESD0360_canal_table_details.jsp", req, res);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("ESD0360_canal_table_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}		
	}

	private void procReqDefList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0360", req);
			ESD036001Message msgList = (ESD036001Message) mp.getMessageRecord("ESD036001");		
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0360");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("0015");
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("error_viewer.jsp", req, res);

			}else{
				session.setAttribute("ESD036001Help", list);
				session.setAttribute("userPO", userPO);
				forward("ESD0360_canal_table_list.jsp", req, res);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

}



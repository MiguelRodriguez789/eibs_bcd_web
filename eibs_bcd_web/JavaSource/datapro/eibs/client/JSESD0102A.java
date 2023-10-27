package datapro.eibs.client;


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
import datapro.eibs.beans.ESD010201Message;
import datapro.eibs.beans.ESD010202Message;
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

public class JSESD0102A extends JSEIBSServlet {

	private ServletConfig config = null;
	
	protected static final int A_PORTFOLIO_ACTION_S = 5;
	protected static final int A_PORTFOLIO_APPROVAL = 9;
	protected static final int A_PORTFOLIO_DELETE = 10;	
	
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen){
        case A_PORTFOLIO_ACTION_S :
        	procCnofActSearcS(user, req, res, session, screen);
			break;

        case A_PORTFOLIO_APPROVAL :
        	procActApproval(user, req, res, session, screen);
			break;
			
        case A_PORTFOLIO_DELETE :
        	procActDelete(user, req, res, session, screen);
			break;

			

        default :
				forward(devPage, req, res);
				break;
		}
	}

	protected void procCnofActSearcS(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses , int screen)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
		    MessageRecord newmessage = null;
			
			try {

				mp = new MessageProcessor("ESD0102");
				ESD010201Message msgRT = (ESD010201Message) mp.getMessageRecord("ESD010201");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0102");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("01");
				msgRT.setH01OPECOD("0002");


				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("appList", list);
				}
				forward("ESD0102_approval_list.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}
	
	protected void procActApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0102");
				ESD010202Message msgRT = (ESD010202Message) mp.getMessageRecord("ESD010202");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0102");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("09");
				msgRT.setH02OPECOD("0009");
				userPO.setPurpose("APPROVAL");
				msgRT.setE02ACTION("A");				
				msgRT.setE02PRFNUM((req.getParameter("PORTFOLIO") == null ? "0" : req.getParameter("PORTFOLIO")));
				msgRT.setE02PRFCUN((req.getParameter("CUSTOMER") == null ? "0" : req.getParameter("CUSTOMER")));

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0102_approval_list.jsp", req, res);
					} else {

						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.client.JSESD0102A?SCREEN=5");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
	protected void procActDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0102");
				ESD010202Message msgRT = (ESD010202Message) mp.getMessageRecord("ESD010202");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0102");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("10");
				msgRT.setH02OPECOD("0010");
				userPO.setPurpose("DELETE");
				msgRT.setE02ACTION("D");
				msgRT.setE02PRFNUM((req.getParameter("PORTFOLIO") == null ? "0" : req.getParameter("PORTFOLIO")));
				msgRT.setE02PRFCUN((req.getParameter("CUSTOMER") == null ? "0" : req.getParameter("CUSTOMER")));

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0102_approval_list.jsp", req, res);
					} else {

						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.client.JSESD0102A?SCREEN=5");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	
}

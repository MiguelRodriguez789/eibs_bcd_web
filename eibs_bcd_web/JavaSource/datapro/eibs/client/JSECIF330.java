package datapro.eibs.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import datapro.eibs.beans.ECIF33001Message;
import datapro.eibs.beans.ECO020001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

/**
 * 
 * @author evargas
 *
 */
public class JSECIF330 extends JSEIBSServlet {

	protected static final int STATEMENT_SEARCH = 100;
	protected static final int STATEMENT_SHOW = 200;
	protected static final int STATEMENT_PROCESS = 300;
		

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case STATEMENT_SEARCH:
				procSearchStatement(user, req, res, session);
			break;		

			case STATEMENT_SHOW:
				procStatementshow(user, req, res, session);
				break;	
			case STATEMENT_PROCESS:
				procStatementProcess(user, req, res, session);
				break;					
					
			default :
				//forward("MISC_not_available.jsp", req, res);
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}
	
	
	protected void procSearchStatement(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ECIF330_statement_account_enter.jsp");
			forward("ECIF330_statement_account_enter.jsp", req, res);			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	

	protected void procStatementshow(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ECIF330", req);

				ECIF33001Message msgList = (ECIF33001Message) mp.getMessageRecord("ECIF33001");
				msgList.setH01USERID(user.getH01USR());
				if (req.getParameter("E01SELACC")!=null && !"".equals(req.getParameter("E01SELACC").trim())){
					msgList.setE01SELACC(req.getParameter("E01SELACC"));
				}
				if (req.getParameter("E01SELRDY")!=null && !"".equals(req.getParameter("E01SELRDY").trim())){
					msgList.setE01SELRDY(req.getParameter("E01SELRDY"));
				}
				if (req.getParameter("E01SELRDM")!=null && !"".equals(req.getParameter("E01SELRDM").trim())){
					msgList.setE01SELRDM(req.getParameter("E01SELRDM"));
				}
				
			 	mp.sendMessage(msgList);
			
			 	MessageRecord resp = mp.receiveMessageRecord(); //receive first messaje, errors or header.
			 	 
		        if(resp.getFormatName().equals("ELEERR")){
		        	 session.setAttribute("error", ((ELEERRMessage)resp));
		        	 forward("ECIF330_statement_account_enter.jsp", req, res);
		        }else{
		        	JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
		        	session.setAttribute("header", ((ECIF33001Message)resp));	//header dds01
		        	session.setAttribute("stmlist", list);
					forwardOnSuccess("ECIF330_statement_account_list.jsp", req, res);
		        }

			} finally {
				if (mp != null)	mp.close();
			}
		}
	

	protected void procStatementProcess(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res, 
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				
				//proceso presentacion del estado de cuenta
				
			} finally {
				if (mp != null)	mp.close();
			}
		}		

 }
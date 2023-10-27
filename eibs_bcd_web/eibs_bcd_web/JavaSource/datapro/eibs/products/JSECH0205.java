package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (8/28/2000 4:02:17 PM)
 * @author: Orestes Garcia
**/

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECH020501Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;


public class JSECH0205 extends JSEIBSServlet {

	protected static final int R_ENTER = 300;
	protected static final int R_CHECK_BOOK_LIST = 200;
	protected static final int R_MODIFICAR_STOCK = 1;
	protected static final int R_ANULAR_CHEQUES = 2;
	protected static final int A_ANULAR = 300;

	protected static final int R_BORRAR = 4;
	protected static final int R_ENTER_S = 500;
	protected static final int R_CHECK_BOOK_LIST_S = 600;
	protected static final int R_ANULAR_CHEQUES_S = 22;
	protected static final int A_ANULAR_S = 700;

	protected String LangPath = "S";

	/**
	 * JSECLI001 constructor comment.
	 */
	public JSECH0205() {
		// TODO Auto-generated constructor stub
		super();
	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSEECH0205");

	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
		@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		// TODO Auto-generated method stub
		
		LangPath = super.rootPath + user.getE01LAN() + "/";	
		
		switch (screen) {
		
			case R_ENTER:
				procActionInit(user, req, res, session);
				break;
			case R_CHECK_BOOK_LIST:
				processReqCheckBookList(user, req, res, session);
				break;
			case R_MODIFICAR_STOCK:
				processReqModificarStock(user, req, res, session);
				break;
			case R_BORRAR:
				processReqBorrarStock(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}
		
		/**
		 * This method was created in VisualAge.
		 */
		protected void procActionInit(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			ECH020501Message msgsend = null;
			ECH020501Message msgreceived = null;
			ELEERRMessage msgError = null;
			

			try {
				msgError = new ELEERRMessage();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}
			
			//userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			try {
				flexLog("Send Initial Data");
				mp = getMessageProcessor("ECH0205", req);
				msgsend= (ECH020501Message)mp.getMessageRecord("ECH020501");
				msgsend.setH01PROGRM("ECH0205");
				msgsend.setH01USERID(user.getH01USR());
				msgsend.setH01TIMSYS(getTimeStamp());
				msgsend.setH01OPECOD("0001");
				
				mp.sendMessage(msgsend);
				
				// Receive Error Message
			
				try {
					
					msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
					
//					if (mp.hasError(msgError)) {
//						log("Error " + msgreceived.getFormatName() + " received.");
//					} else
//						log("Message " + msgreceived.getFormatName() + " received.");

				} catch (Exception e) {
					e.printStackTrace();
					flexLog("Error: " + e);
					throw new RuntimeException("Socket Communication Error");
				}
				// Receive Data
				
				try {
					msgreceived = (ECH020501Message)mp.receiveMessageRecord("ECH020501");
					msgsend.setE01CHLBNK(msgreceived.getE01CHLBNK());
					session.setAttribute("error", msgError);
					session.setAttribute("msgMT", msgsend);
					forward("ECH0205_stock_checks_enter.jsp", req, res);
				} catch (Exception e) {
					e.printStackTrace();
					flexLog("Error: " + e);
					throw new RuntimeException("Socket Communication Error");
				}

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception calling page " + e);
			}

		}

		
		
		private void processReqCheckBookList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		ELEERRMessage msgError =null;
		int x = 0;
		try {
			mp = getMessageProcessor("ECH0205", req);
			ECH020501Message msgList = (ECH020501Message) mp.getMessageRecord("ECH020501");
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ECH0205");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0002");
		
			if(req.getParameter("E01CHLBNK")!=null)
				req.getSession().setAttribute("E01CHLBNK", req.getParameter("E01CHLBNK"));
			if(req.getParameter("E01CHLBRN")!=null)
				req.getSession().setAttribute("E01CHLBRN", req.getParameter("E01CHLBRN"));
			
			if(req.getSession().getAttribute("E01CHLBNK")!=null)
				msgList.setE01CHLBNK(req.getSession().getAttribute("E01CHLBNK").toString());
			if(req.getSession().getAttribute("E01CHLBRN")!=null)
				msgList.setE01CHLBRN(req.getSession().getAttribute("E01CHLBRN").toString());
		
			 
			System.out.println("banco: "+msgList.getE01CHLBNK());
			System.out.println("oficina: "+msgList.getE01CHLBRN());
				
			mp.sendMessage(msgList);
			
			try {
			
				msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
			
			// Receive Data
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ECH0205_stock_checks_enter.jsp", req, res);
			}else{
			try {
			
				msgList = (ECH020501Message)mp.receiveMessageRecord("ECH020501");
				
				JBObjList checkBooks = mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
				
				session.setAttribute("error", msgError);
				session.setAttribute("msgMT", msgList);
				session.setAttribute("checkBooks", checkBooks);
				
				if (mp != null){
					mp.close();
					x = 1;
				}
				
				forward("ECH0205_stock_checks_list.jsp", req, res);
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
			if (mp != null && x == 0)
				mp.close();
			}	

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
		
	}	
		
		private void processReqModificarStock(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		ELEERRMessage msgError =null;
		JBObjList beanList = null;
		beanList = (JBObjList) session.getAttribute("checkBooks");
		
		try {
			mp = getMessageProcessor("ECH0205", req);
			
			ECH020501Message check = (ECH020501Message) mp.getMessageRecord("ECH020501");
			ECH020501Message record= null;
			beanList.initRow();
			while (beanList.getNextRow()) {
				record = (ECH020501Message)beanList.getRecord();
				if (!record.getE01CHLBNK().equals(null) && !record.getE01CHLBRN().equals(null) && !record.getE01CHLTCB().equals(null)){
					check.setH01USERID(user.getH01USR());
					check.setH01PROGRM("ECH0205");
					check.setH01TIMSYS(getTimeStamp());
					check.setH01SCRCOD("01");
					check.setH01OPECOD("0003");
					check.setE01CHLBNK(record.getE01CHLBNK());
					check.setE01CHLBRN(record.getE01CHLBRN());
					check.setE01CHLTCB(record.getE01CHLTCB());
					check.setE01CHLMSK(req.getParameter("E01CHLMSK_"+beanList.getCurrentRow()));
					check.setE01CHLTSK(req.getParameter("E01CHLTSK_"+beanList.getCurrentRow()));
					check.send();
					flexLog("ECH020501 Message Sent "+beanList.getCurrentRow());
				}
			}	
			check.destroy();
			if (mp != null)
				mp.close();

			try{
				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.products.JSECH0205?SCREEN=300");
			}catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}

			
 		}catch(Exception e){
 			flexLog("Error: "+e.getMessage());
 			e.printStackTrace();
 		}
		
	}
	

		private void processReqBorrarStock(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
				throws ServletException, IOException {

				UserPos userPO = getUserPos(session);
				MessageProcessor mp = null;
				ELEERRMessage msgError =null;
				try {
					mp = getMessageProcessor("ECH0205", req);
					
					ECH020501Message check = (ECH020501Message) mp.getMessageRecord("ECH020501");
					check.setH01USERID(user.getH01USR());
					check.setH01PROGRM("ECH0205");
					check.setH01TIMSYS(getTimeStamp());
					check.setH01SCRCOD("01");
					check.setH01OPECOD("0004");
					check.setE01CHLBNK(req.getParameter("E01CHLBNK"));
					check.setE01CHLBRN(req.getParameter("E01CHLBRN"));
					check.setE01CHLTCB(req.getParameter("E01CHLTCB"));
					
					mp.sendMessage(check);
					if (mp != null)
						mp.close();
					try{
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.products.JSECH0205?SCREEN=200");
					}catch (Exception e) {
						e.printStackTrace();
						flexLog("Error: " + e);
						throw new RuntimeException("Socket Communication Error");
					}
					
		 		}catch(Exception e){
		 			flexLog("Error: "+e.getMessage());
		 			e.printStackTrace();
		 		}
				
			}
	
		

}

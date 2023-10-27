package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EGL134001Message;
import datapro.eibs.beans.EGL134002Message;
import datapro.eibs.beans.EGL134003Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEGL1340 extends JSEIBSServlet {

	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {


		switch ( screen ) {
		
//		case 50:  // INICIAL
//			forward("EGL1340_gledger_enter.jsp", req, res);
//			break;

		case 100:  // LISTA APROBACION
			getGLApprovalList(user, req, res, session);
			break;

		case 200:  // CONSULTA APROBACION
			getGLApprovalInfo(user, req, res, session);
			break;

		case 300:  // ACCIONES: APROBAR, BORRAR, RECHAZAR
			approveGL(user, req, res, session);
			break;
			
		case 1000:
			requestInquiryGL(user, req, res, session);
			break;
			
		default:
			break;
		}
		
	}

	

	private void getGLApprovalList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;

  		try {
			mp = getMessageProcessor("EGL0340", req);
			EGL134001Message msgGL = (EGL134001Message) mp.getMessageRecord("EGL134001");
			msgGL.setH01USERID(user.getH01USR());
			msgGL.setH01PROGRM("EGL1340");
			msgGL.setH01TIMSYS(getTimeStamp());
			msgGL.setH01SCRCOD("01");
			msgGL.setH01OPECOD("0001");
			
			setMessageRecord(req, msgGL);
			
			mp.sendMessage(msgGL);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList GLAppList = mp.receiveMessageRecordList("H01FLGMAS");
			
			pageName = "EGL1340_gl_approval_list.jsp";
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("EGL1340GLList", GLAppList );
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	
	
	
	private void getGLApprovalInfo(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;

  		try {
  			
  			String row = req.getParameter("ROW");
  			JBObjList glList = (JBObjList)session.getAttribute("EGL1340GLList");
  			glList.setCurrentRow( Integer.parseInt( row ) );
  			EGL134001Message gl = (EGL134001Message)glList.getRecord();
  			
			mp = getMessageProcessor("EGL0340", req);
			EGL134002Message msgGL = (EGL134002Message) mp.getMessageRecord("EGL134002");
			msgGL.setH02USERID(user.getH01USR());
			msgGL.setH02PROGRM("EGL1340");
			msgGL.setH02TIMSYS(getTimeStamp());
			msgGL.setH02SCRCOD("01");
			msgGL.setH02OPECOD("0001");
			msgGL.setE02GLMBNK( gl.getE01GLMBNK() );
			msgGL.setE02GLMCCY( gl.getE01GLMCCY() );
			msgGL.setE02GLMGLN( gl.getE01GLMGLN() );
			
			mp.sendMessage(msgGL);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			EGL134002Message GLInfo = (EGL134002Message) mp.receiveMessageRecord("EGL134002");

			
			if (mp.hasError(msgError))
			{
				pageName = "EGL1340_gl_approval_list.jsp";
			} 
			else
			{
				pageName = "EGL1340_app_inq_gledger_detail.jsp";
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("GLedger", GLInfo );
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	
	
	
	private void approveGL(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;

  		try {
  			
  			String row = req.getParameter("ROW");
  			JBObjList glList = (JBObjList)session.getAttribute("EGL1340GLList");
  			glList.setCurrentRow( Integer.parseInt( row ) );
  			EGL134001Message gl = (EGL134001Message)glList.getRecord();
  			
			mp = getMessageProcessor("EGL0340", req);
			EGL134003Message msgGL = (EGL134003Message) mp.getMessageRecord("EGL134003");
			msgGL.setH03USERID(user.getH01USR());
			msgGL.setH03PROGRM("EGL1340");
			msgGL.setH03TIMSYS(getTimeStamp());
			msgGL.setH03SCRCOD("01");
			msgGL.setH03OPECOD("0001");
			msgGL.setE03GLMBNK( gl.getE01GLMBNK() );
			msgGL.setE03GLMCCY( gl.getE01GLMCCY() );
			msgGL.setE03GLMGLN( gl.getE01GLMGLN() );
			try {
				msgGL.setE03ACTION( req.getParameter("pAction").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgGL.setE03MSGTXT( req.getParameter("reason").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			mp.sendMessage(msgGL);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError))
			{
				session.setAttribute("error", msgError);
				pageName = "EGL1340_gl_approval_list.jsp";
				forward(pageName, req, res);
			} 
			else
			{
				getGLApprovalList(user, req, res, session);
			}

			
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	
	private void requestInquiryGL(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws IOException, ServletException {
			
			String pageName = "";
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("EGL0340", req);
				EGL134002Message msgGL = (EGL134002Message) mp.getMessageRecord("EGL134002");
				msgGL.setH02USERID(user.getH01USR());
				msgGL.setH02PROGRM("EGL1340");
				msgGL.setH02TIMSYS(getTimeStamp());
				msgGL.setH02SCRCOD("01");
				msgGL.setH02OPECOD("0004");
				msgGL.setE02GLMBNK( Util.getReqParameter("BNK", req) );
				msgGL.setE02GLMCCY( Util.getReqParameter("CCY", req));
				msgGL.setE02GLMGLN( Util.getReqParameter("GLN", req) );
				
				mp.sendMessage(msgGL);
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				EGL134002Message GLInfo = (EGL134002Message) mp.receiveMessageRecord("EGL134002");

				
				if (mp.hasError(msgError)){
					session.setAttribute("error", msgError);
					pageName = "error_viewer.jsp";
				} else {
					session.setAttribute("GLedger", GLInfo );
					pageName = "EGL1340_app_inq_gledger_detail.jsp";
				}
				
				forward(pageName, req, res);
			} finally {
				if (mp != null) mp.close();
			}
		}
}

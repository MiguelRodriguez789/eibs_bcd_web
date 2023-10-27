package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EFE122001Message;
import datapro.eibs.beans.EFE122002Message;
import datapro.eibs.beans.EFE122003Message;
import datapro.eibs.beans.EGL134001Message;
import datapro.eibs.beans.EGL134003Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEFE1220 extends JSEIBSServlet {

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
			getRateApprovalList(user, req, res, session);
			break;

		case 200:  // CONSULTA APROBACION
			getRateApprovalInfo(user, req, res, session);
			break;

		case 300:  // ACCIONES: APROBAR, BORRAR, RECHAZAR
			approveRate(user, req, res, session);
			break;

		default:
			break;
		}
		
	}

	

	private void getRateApprovalList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;

  		try {
			mp = getMessageProcessor("EGL0340", req);
			EFE122001Message rate = (EFE122001Message) mp.getMessageRecord("EFE122001");
			rate.setH01USERID(user.getH01USR());
			rate.setH01PROGRM("EFE1220");
			rate.setH01TIMSYS(getTimeStamp());
			rate.setH01SCRCOD("01");
			rate.setH01OPECOD("0001");
			
			setMessageRecord(req, rate);
			
			mp.sendMessage(rate);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList RateApprovalList = mp.receiveMessageRecordList("H01FLGMAS");
			
			pageName = "EFE1220_rate_approval_list.jsp";
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("EFE122001RateList", RateApprovalList );
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	
	
	
	private void getRateApprovalInfo(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;

  		try {
  			
  			String row = req.getParameter("ROW");
  			JBObjList rateList = (JBObjList)session.getAttribute("EFE122001RateList");
  			rateList.setCurrentRow( Integer.parseInt( row ) );
  			EFE122001Message rate = (EFE122001Message)rateList.getRecord();
  			
			mp = getMessageProcessor("EGL0340", req);
			EFE122002Message msgRate = (EFE122002Message) mp.getMessageRecord("EFE122002");
			msgRate.setH02USERID(user.getH01USR());
			msgRate.setH02PROGRM("EGL1220");
			msgRate.setH02TIMSYS(getTimeStamp());
			msgRate.setH02SCRCOD("01");
			msgRate.setH02OPECOD("0001");
			msgRate.setE02RATBNK( rate.getE01RATBNK() );
			msgRate.setE02RATCCY( rate.getE01RATCCY() );
			
			mp.sendMessage(msgRate);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			EFE122002Message RateInfo = (EFE122002Message) mp.receiveMessageRecord("EFE122002");

			
			if (mp.hasError(msgError))
			{
				pageName = "EFE1220_rate_approval_list.jsp";
			} 
			else
			{
				pageName = "EFE1220_app_inq_rate_detail.jsp";
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("rateInfo", RateInfo );
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	
	
	
	private void approveRate(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;

  		try {
  			
  			String row = req.getParameter("ROW");
  			JBObjList glList = (JBObjList)session.getAttribute("EFE122001RateList");
  			glList.setCurrentRow( Integer.parseInt( row ) );
  			EFE122001Message rate = (EFE122001Message)glList.getRecord();
  			
			mp = getMessageProcessor("EFE1220", req);
			EFE122003Message msgRate = (EFE122003Message ) mp.getMessageRecord("EFE122003");
			msgRate.setH03USERID(user.getH01USR());
			msgRate.setH03PROGRM("EGL1340");
			msgRate.setH03TIMSYS(getTimeStamp());
			msgRate.setH03SCRCOD("01");
			msgRate.setH03OPECOD("0001");
			msgRate.setE03RATBNK( rate.getE01RATBNK() );
			msgRate.setE03RATCCY( rate.getE01RATCCY() );
			msgRate.setE03ACTION( req.getParameter("pAction") );
			msgRate.setE03MSGTXT( req.getParameter("reason") );
			
			mp.sendMessage(msgRate);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError))
			{
				session.setAttribute("error", msgError);
				pageName = "EFE1220_rate_approval_list.jsp";
				forward(pageName, req, res);
			} 
			else
			{
				getRateApprovalList( user, req, res, session );
			}

			
		} finally {
			if (mp != null) mp.close();
		}
	}

	
	
	
}

package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECN000701Message;
import datapro.eibs.beans.ECN000702Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSECN0007 extends JSEIBSServlet {

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
  		
  			String option = ( null == req.getParameter("OPTION") || "".equals(req.getParameter("OPTION")) )?
  							"":req.getParameter("OPTION");
  		
			mp = getMessageProcessor("ECN0007", req);
			ECN000701Message rate = (ECN000701Message) mp.getMessageRecord("ECN000701");
			rate.setH71USERID(user.getH01USR());
			rate.setH71PROGRM("ECN0007");
			rate.setH71TIMSYS(getTimeStamp());
			rate.setH71SCRCOD("01");
			rate.setH71OPECOD("0001");
			rate.setE71CDRSFL( option );
			
//			setMessageRecord(req, rate);
			
			mp.sendMessage(rate);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			session.setAttribute("error", msgError);
			
			if ( "0".equals(msgError.getERRNUM() ) ) {
				JBObjList RateApprovalList = mp.receiveMessageRecordList("E71CDRIND");
				session.setAttribute("ECN000701List", RateApprovalList );
			} 			
			
			pageName = "ECN0007_rate_approval_list.jsp";
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
  			JBObjList rateList = (JBObjList)session.getAttribute("ECN000701List");
  			rateList.setCurrentRow( Integer.parseInt( row ) );
  			ECN000701Message rate = (ECN000701Message)rateList.getRecord();
  			
			mp = getMessageProcessor("EGL0340", req);
			ECN000702Message msgRate = (ECN000702Message) mp.getMessageRecord("ECN000702");
			msgRate.setH72USERID(user.getH01USR());
			msgRate.setH72PROGRM("EGL1220");
			msgRate.setH72TIMSYS(getTimeStamp());
			msgRate.setH72SCRCOD("01");
			msgRate.setH72OPECOD("0001");
			
			msgRate.setE72CDRRTB(rate.getE71CDRRTB());
			msgRate.setE72CDRDSC(rate.getE71CDRDSC());
			msgRate.setE72CDRDT3(rate.getE71CDRDTY());
			msgRate.setE72CDRDT2(rate.getE71CDRDTD());
			msgRate.setE72CDRDT1(rate.getE71CDRDTM());
			msgRate.setE72CDRCCY(rate.getE71CDRCCY());
			msgRate.setE72CDRSFL(rate.getE71CDRSFL());

			
			mp.sendMessage(msgRate);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			ECN000702Message RateInfo = (ECN000702Message) mp.receiveMessageRecord("ECN000702");

			
			if (mp.hasError(msgError))
			{
				session.setAttribute("error", msgError);
			} 
			else
			{
				session.setAttribute("rateInfo", RateInfo );
			}

			if ( "X".equals( req.getParameter("OPTION") ) || "P".equals( req.getParameter("OPTION") ) ) {
				pageName = "ECN0007_app_inq_rate_table_loans.jsp";
			} else {
				pageName = "ECN0007_app_inq_rate_detail.jsp";
			}

						
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	
	
	
	private void approveRate(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;

  		try {
  			
  			String row = req.getParameter("ROW");
  			JBObjList rateList = (JBObjList)session.getAttribute("ECN000701List");
  			rateList.setCurrentRow( Integer.parseInt( row ) );
  			ECN000701Message rate = (ECN000701Message)rateList.getRecord();
  			
			mp = getMessageProcessor("EGL0340", req);

			rate.setH71USERID(user.getH01USR());
			rate.setH71PROGRM("EGL1220");
			rate.setH71TIMSYS(getTimeStamp());
			rate.setH71SCRCOD("01");
			rate.setH71OPECOD( "A".equals( req.getParameter("pACTION"))?"0002":"0003"  );
			
			mp.sendMessage(rate);
//			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			rate = (ECN000701Message) mp.receiveMessageRecord("ECN000701");

			getRateApprovalList(user, req, res, session);

			
		} finally {
			if (mp != null) mp.close();
		}	}

	
	
	
}

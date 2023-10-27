package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD052501Message;
import datapro.eibs.beans.ESD070001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;

@SuppressWarnings("serial")
public class JSESD0525EX extends JSESD0525 {

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
			throws ServletException, IOException {

        switch (screen) {
			case R_COMISION_FROM_PRODUCT :
				procReqCommision(user, req, res, session);
				break;
			case A_COMISION_FROM_PRODUCT :
				redirectTOProd(user, req, res, session);
				break;
			default :
				super.processRequest(user, req, res, session, screen);
				break;
        }
	}
	
	private void procReqCommision(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException  {
		String readOnly = "true";
		Boolean hasNoError = true;
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;		
		
		try {
			 //Keep Information from Product Page
			ESD070001Message msgPrd = (ESD070001Message) session.getAttribute("prd");
			setMessageRecord(req, msgPrd);
			session.setAttribute("prd", msgPrd);
			
			//Sending Info To Comission Information
			mp = getMessageProcessor("ESD0525", req);
			
			ESD052501Message msg = (ESD052501Message) mp.getMessageRecord("ESD052501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0525");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			msg.setE01DLFBNK(msgPrd.getE01APCBNK());
			msg.setE01DLFTYP(msgPrd.getE01APCTYP());
			msg.setE01DLFACD(msgPrd.getE01APCACD());
			msg.setE01DLFTBL(msgPrd.getE01APCTAR().equals("") ? "@G" : msgPrd.getE01APCTAR());

			mp.sendMessage(msg);	
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			ESD052501Message msgRecieved = (ESD052501Message) mp.receiveMessageRecord("ESD052501");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("ESD0700_products_loans.jsp", req, res);
			} else {
				userPO.setSource("PRODUCTS");
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgRecieved);
				forward("ESD0525_tarifas_maintenance.jsp?readOnly="+readOnly, req, res);
			}
			
		} finally {
			mp.close();
		}		
		
		
		
		
	}	

	private void redirectTOProd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,  HttpSession session) 
			throws ServletException, IOException {
		forward("ESD0700_products_loans.jsp", req, res);
		
	}


}

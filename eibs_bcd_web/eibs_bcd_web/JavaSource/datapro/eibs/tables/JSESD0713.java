package datapro.eibs.tables;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD0713DSMessage;
import datapro.eibs.beans.ESD0714DSMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESD0713 extends JSEIBSServlet {

	protected static final int R_CHARGES = 100;
	protected static final int A_CHARGES = 4;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		

		switch (screen) {
			case R_CHARGES :
				procReqCharges(user, req, res, session);
				break;
			case A_CHARGES :
				procActionCharges(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
	}

	}

	private void procActionCharges(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		forward("ESD0700_products_loans.jsp", req, res);
		
	}

	private void procReqCharges(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0713", req);
			ESD0713DSMessage msgDDAServCharge = (ESD0713DSMessage) mp.getMessageRecord("ESD0713DS");
			msgDDAServCharge.setH01USERID(user.getH01USR());
			msgDDAServCharge.setH01PROGRM("ESD0713");
			msgDDAServCharge.setH01TIMSYS(getTimeStamp());
			msgDDAServCharge.setH01SCRCOD("01");
			msgDDAServCharge.setH01OPECOD("0004");
			try {
				msgDDAServCharge.setE01SELBNK(userPO.getBank());
			} catch (Exception e) {
				msgDDAServCharge.setE01SELBNK("");
			}
			try {
				msgDDAServCharge.setE01SELTLN(userPO.getHeader16());
			} catch (Exception e) {
				msgDDAServCharge.setE01SELTLN("");
			}
			try {
				msgDDAServCharge.setE01SELTYP(userPO.getHeader15());
			} catch (Exception e) {
				msgDDAServCharge.setE01SELTYP("");
			}
			
			mp.sendMessage(msgDDAServCharge);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("error", new ELEERRMessage());
				session.setAttribute("lnServCharge", msgDDAServCharge);
				pageName = "ESD0713_ln_inq_serv_charge.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

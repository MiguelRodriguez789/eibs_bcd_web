package datapro.eibs.tables;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESD0712DSMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESD0712 extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0712", req);
			ESD0712DSMessage msgDDAServCharge = (ESD0712DSMessage) mp.getMessageRecord("ESD0712DS");
			msgDDAServCharge.setH01USERID(user.getH01USR());
			msgDDAServCharge.setH01PROGRM("ESD0711");
			msgDDAServCharge.setH01TIMSYS(getTimeStamp());
			msgDDAServCharge.setH01SCRCOD("01");
			msgDDAServCharge.setH01OPECOD("0004");
			try {
				msgDDAServCharge.setE01SELBNK(req.getParameter("BANK").trim());
			} catch (Exception e) {
				msgDDAServCharge.setE01SELBNK("");
			}
			try {
				msgDDAServCharge.setE01SELTBL(req.getParameter("TABLE").trim());
			} catch (Exception e) {
				msgDDAServCharge.setE01SELTBL("");
			}
			try {
				msgDDAServCharge.setE01SELTYP(req.getParameter("TYPE").trim());
			} catch (Exception e) {
				msgDDAServCharge.setE01SELTYP("");
			}
			
			mp.sendMessage(msgDDAServCharge);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("ddaServCharge", msg);
				pageName = "ESD0712_dda_inq_serv_charge.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

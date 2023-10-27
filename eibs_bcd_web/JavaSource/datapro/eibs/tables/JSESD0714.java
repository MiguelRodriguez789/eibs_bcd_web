package datapro.eibs.tables;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD0714DSMessage;
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
public class JSESD0714 extends JSEIBSServlet {

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
			mp = getMessageProcessor("ESD0714", req);
			ESD0714DSMessage msgLCTariff = (ESD0714DSMessage) mp.getMessageRecord("ESD0714DS");
		 	msgLCTariff.setH01USERID(user.getH01USR());
		 	msgLCTariff.setH01PROGRM("ESD0714");
		 	msgLCTariff.setH01TIMSYS(getTimeStamp());
		 	msgLCTariff.setH01SCRCOD("01");
		 	msgLCTariff.setH01OPECOD("0004");
			try {
				msgLCTariff.setE01SELBNK(req.getParameter("BANK").trim());
			} catch (Exception e) {
				msgLCTariff.setE01SELBNK("");
			}
			try {
				msgLCTariff.setE01SELTLN(req.getParameter("TABLE").trim());
			} catch (Exception e) {
				msgLCTariff.setE01SELTLN("");
			}
			try {
				msgLCTariff.setE01SELTYP(req.getParameter("TYPE").trim());
			} catch (Exception e) {
				msgLCTariff.setE01SELTYP("");
			}
			
			mp.sendMessage(msgLCTariff);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("error", new ELEERRMessage());
				session.setAttribute("lctProdInq", msgLCTariff);
				pageName = "ESD0714_products_inq_lc_tab.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

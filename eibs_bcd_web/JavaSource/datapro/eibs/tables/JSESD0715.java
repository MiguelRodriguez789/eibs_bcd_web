package datapro.eibs.tables;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD0715DSMessage;
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
public class JSESD0715 extends JSEIBSServlet {

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
			mp = getMessageProcessor("ESD0715", req);
			ESD0715DSMessage msgColTariff = (ESD0715DSMessage) mp.getMessageRecord("ESD0715DS");
		 	msgColTariff.setH01USERID(user.getH01USR());
		 	msgColTariff.setH01PROGRM("ESD0711");
		 	msgColTariff.setH01TIMSYS(getTimeStamp());
		 	msgColTariff.setH01SCRCOD("01");
		 	msgColTariff.setH01OPECOD("0004");
			try {
				msgColTariff.setE01SELBNK(req.getParameter("BANK").trim());
			} catch (Exception e) {
				msgColTariff.setE01SELBNK("");
			}
			try {
				msgColTariff.setE01SELTLN(req.getParameter("TABLE").trim());
			} catch (Exception e) {
				msgColTariff.setE01SELTLN("");
			}
			try {
				msgColTariff.setE01SELTYP(req.getParameter("TYPE").trim());
			} catch (Exception e) {
				msgColTariff.setE01SELTYP("");
			}
			
			mp.sendMessage(msgColTariff);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("error", new ELEERRMessage());
				session.setAttribute("colProdInq", msgColTariff);
				pageName = "ESD0715_products_inq_col_tab.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

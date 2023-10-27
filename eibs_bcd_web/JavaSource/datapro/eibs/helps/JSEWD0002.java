package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0002DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0002 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String codeflag = req.getParameter("codeflag") == null ? "" : req.getParameter("codeflag");
		String selNew = req.getParameter("SelNew") == null ? "" : req.getParameter("SelNew");
		String selOld = req.getParameter("SelOld") == null ? "" : req.getParameter("SelOld");
		String fromRec = req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord");
		String codeaux = req.getParameter("codeaux") == null ? "" : req.getParameter("codeaux");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0002", req);
			EWD0002DSMessage msgHelp = (EWD0002DSMessage) mp.getMessageRecord("EWD0035DS");
			try { 
	       	 	msgHelp.setEWDTBL(codeflag);
			} catch (Exception e) {
	       	 	msgHelp.setEWDTBL("");
			}
			try { 
	       	 	msgHelp.setEWDSHO(selOld);
			} catch (Exception e) {
	       	 	msgHelp.setEWDSHO("");
			}
			try { 
				msgHelp.setEWDSHN(selNew);
			} catch (Exception e) {
				msgHelp.setEWDSHN("");
			}
			try { 
				msgHelp.setEWDREC(fromRec);
			} catch (Exception e) {
				msgHelp.setEWDREC("0");
			}
			if ("07".equals(codeaux)) {
				try { 
					msgHelp.setEWDF02(codeaux.substring(3));
				} catch (Exception e) {
					msgHelp.setEWDF02("");
				}
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE", "EWDREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				req.setAttribute("rows", new Integer(list.size()));
				req.setAttribute("codFlag", codeflag);
				req.setAttribute("SelNew", selNew);
				req.setAttribute("SelOld", selOld);
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0002Help", list);
				
				pageName = "EWD0002_helpfile_CNOFC.jsp";
			}
			
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}

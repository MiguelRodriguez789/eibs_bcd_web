package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0005DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0005 extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = super.getMessageProcessor("EWD0005", req);
			EWD0005DSMessage msgHelp = (EWD0005DSMessage) mp.getMessageRecord("EWD0005DS");
			msgHelp.setEWDUSR(user.getH01USR());
			msgHelp.setEWDSHR(req.getParameter("NameSearch").toUpperCase());

			if (user.getE01SEC().equals("Y")) {
				msgHelp.setEWDSBK(user.getE01UBK());
			} else {
				msgHelp.setEWDSBK("");
			}
			try {
				msgHelp.setEWDSCA(req.getParameter("shrAppCode").trim());
			} catch (Exception e) {
				msgHelp.setEWDSCA("");
			}
			//search by type 'W'=word, 'S'=short name, 'N'=client number, 'A'=account number
			try {
				msgHelp.setEWDSEL(req.getParameter("shrSelect").trim());
			} catch (Exception e) {
				msgHelp.setEWDSEL("");
			}
			try {
				msgHelp.setEWDREC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgHelp.setEWDREC("0");
			}
			//search by Account
			try {
				msgHelp.setEWDACC(req.getParameter("shrAcc") == null ? "0" : req.getParameter("shrAcc"));
			} catch (Exception e) {
				msgHelp.setEWDACC("0");
			}
			//search by Client
			try {
				msgHelp.setEWDCUN(req.getParameter("shrClient") == null ? "0" : req.getParameter("shrClient"));
			} catch (Exception e) {
				msgHelp.setEWDCUN("0");
			}
			try {
				msgHelp.setEWDTYP(req.getParameter("shrType") == null ? "W" : req.getParameter("shrType"));
			} catch (Exception e) {
				msgHelp.setEWDTYP("W");
			}
			//search by old account 'O'=old account
			if ("O".equals(req.getParameter("shrSelect"))) {
				msgHelp.setEWDTYP("O");
				msgHelp.setEWDOAC(req.getParameter("NameSearch").toUpperCase());
				msgHelp.setEWDSHR("");
			}
			try {
				msgHelp.setEWDOPE(req.getParameter("shrStatus").trim());
			} catch (Exception e) {
				msgHelp.setEWDOPE(" ");
			}
			
			mp.sendMessage(msgHelp);

			JBObjList list = (JBObjList) mp.receiveMessageRecordList("EWDOPE", "EWDREC");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
			} else {
				session.setAttribute("ewd0005Help", list);
			}
			req.setAttribute("NameSearch", req.getParameter("NameSearch"));
			req.setAttribute("shrBank", req.getParameter("shrBank"));
			req.setAttribute("shrAppCode", req.getParameter("shrAppCode"));
			req.setAttribute("shrSelect", req.getParameter("shrSelect"));
			req.setAttribute("shrClient", req.getParameter("shrClient"));
			req.setAttribute("shrType", req.getParameter("shrType"));

			forward("EWD0005_client_help_helpmessage.jsp", req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

}

package datapro.eibs.helps;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0037DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEWD0037 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0037", req);
			EWD0037DSMessage msgHelp = (EWD0037DSMessage) mp.getMessageRecord("EWD0037DS");
			msgHelp.setEWDUSR(user.getH01USR());
			try {
				msgHelp.setEWDSHR(req.getParameter("NameSearch").toUpperCase());
			} catch (Exception e) {
				// TODO: handle exception
			}
			//msgHelp.setEWDSBK(req.getParameter("shrBank"));
			msgHelp.setEWDSBK(user.getE01SEC().equals("Y") ? user.getE01UBK() : "");
			try {
				msgHelp.setEWDSCA(req.getParameter("shrAppCode").trim());						
			} catch (Exception e) {
			}
			try {
				msgHelp.setEWDSEL(req.getParameter("shrSelect").trim());						
			} catch (Exception e) {
			}
			try {
				msgHelp.setEWDREC(req.getParameter("FromRecord").trim());						
			} catch (Exception e) {
				msgHelp.setEWDREC("0");
			}
			//search by Account
			try {
				msgHelp.setEWDACC(req.getParameter("shrAcc").trim());
			} catch (Exception e) {
				msgHelp.setEWDACC("0");
			}
			//search by Client
			try {
				msgHelp.setEWDCUN(req.getParameter("shrClient").trim());
			} catch (Exception e) {
				msgHelp.setEWDCUN("0");
			}
			//search by type 'W'=word, 'S'=short name, 'N'=client number
			try {
				msgHelp.setEWDTYP(req.getParameter("shrType").trim());
			} catch (Exception e) {
				msgHelp.setEWDTYP("W");
			}
			//search by old account 'O'=old account
			if (req.getParameter("shrSelect").equals("O")) {
				msgHelp.setEWDTYP(req.getParameter("shrSelect"));
				try {
					msgHelp.setEWDOAC(req.getParameter("shrAcc").trim());
				} catch (Exception e) {
					msgHelp.setEWDOAC("0");
				}
				try {
					msgHelp.setEWDCMP(req.getParameter("shrAcc").trim());
				} catch (Exception e) {
					msgHelp.setEWDCMP(" ");
				}
			}

			mp.sendMessage(msgHelp);
			JBObjList list = mp.receiveMessageRecordList("EWDOPE", "EWDREC");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				req.setAttribute(
						"NameSearch",
						req.getParameter("NameSearch"));
					req.setAttribute(
						"shrBank",
						req.getParameter("shrBank"));
					req.setAttribute(
						"shrAppCode",
						req.getParameter("shrAppCode"));
					req.setAttribute(
						"shrSelect",
						req.getParameter("shrSelect"));
					req.setAttribute(
						"shrClient",
						req.getParameter("shrClient"));
					req.setAttribute(
						"shrType",
						req.getParameter("shrType"));
					
				pageName = "EWD0037_client_help_helpmessage.jsp";
			}

			session.setAttribute("userPO", userPO);
			session.setAttribute("EWD0037Help", list);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}

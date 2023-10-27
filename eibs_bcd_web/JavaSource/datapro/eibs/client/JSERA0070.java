package datapro.eibs.client;

/**
* Insert the type's description here.
* Creation date: (1/19/00 6:08:55 PM)
*/

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ERA007001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.CharacterField;

public class JSERA0070 extends JSEIBSServlet {
	
	protected static final int REQ_R = 102;
	protected static final int ACT_R = 202;
	// entering options
	protected static final int R_ENTER = 100;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		case REQ_R :
		case ACT_R :
			procActionV(user, req, res, session);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procActionV(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String opecode = "0004";
		try {
			opecode = req.getParameter("OPECOD").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0070", req);
			ERA007001Message msgL70 = (ERA007001Message) mp.getMessageRecord("ERA007001");
			msgL70.setH01USERID(user.getH01USR());
			msgL70.setH01PROGRM("ERA0070");
			msgL70.setH01TIMSYS(getTimeStamp());
			msgL70.setH01SCRCOD("01");
			msgL70.setH01OPECOD(opecode);
			try {
				msgL70.setE01TBLTYP(req.getParameter("E01TBLTYP").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgL70.setE01TBLCDE(req.getParameter("E01TBLCDE").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			setMessageRecord(req, msgL70);
			
			for (int i = 1; i < 9; i++) {
				String name = "E01TBLLB" + i;
				try {
				((CharacterField)msgL70.getField(name)).setStringUD(req.getParameter(name).trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
			}

			mp.sendMessage(msgL70);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgL70 = (ERA007001Message) mp.receiveMessageRecord("ERA007001");

			session.setAttribute("error", msgError);
			session.setAttribute("gaDetail", msgL70);
			
			if (mp.hasError(msgError)) {
				forward("ERA0070_ga_user_fld.jsp", req, res);
			} else {
				if (opecode.equals("0002")
						|| opecode.equals("0003")) {
					PrintWriter  out = res.getWriter();
					out.println("<HTML>");
					out.println("<HEAD>");
					out.println("<TITLE>Close</TITLE>");
					out.println("</HEAD>");
					out.println("<BODY>");
					out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
					out.println(" var myOpener= top.opener;");
					out.println("		top.close();");
					out.println("</SCRIPT>");
					out.println("<P>Close it!!!</P>");
					out.println("</BODY>");
					out.println("</HTML>");
					out.close();
				} else {
					forward("ERA0070_ga_user_fld.jsp", req, res);
				}
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
}
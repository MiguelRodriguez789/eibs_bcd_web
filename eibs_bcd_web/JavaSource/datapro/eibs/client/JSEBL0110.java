package datapro.eibs.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EBL011001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageRecord;

public class JSEBL0110 extends JSEIBSServlet {
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		case 1:// Search Customer
			procSearhCust(user, req, res, session);
			break;
		case 2: // create a new customer
		case 3:// modify a customer
		case 4:// aprove a customer
			procClient(user, req, res, session, screen);
			break;
		case 5:// aprove a customer
			subClient(user, req, res, session);
			break;
		default:
			forward(SuperServlet.devPage, req, res);
			break;
		}
	}

	protected void procSearhCust(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException,
			IOException {
		if (req.getParameter("OPT") != null) {
			req.setAttribute("OPT", req.getParameter("OPT").trim());
		}

		EBL011001Message msg = new EBL011001Message();
		msg.setE01CURPID(user.getE01CTR());
		msg.setD01CURPID(user.getE01CTD());
		ses.setAttribute("userPO", new UserPos());
		ses.setAttribute("ebl0110Msg", msg);
		forward("EBL0110_client_enter_new.jsp", req, res);
	}

	protected void procClient(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses, int screen)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		// Send data
		try {
			mp = new MessageProcessor("EBL0110");
			EBL011001Message msg = (EBL011001Message) mp
					.getMessageRecord("EBL011001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBL0110");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");

			switch (screen) {
			case 2:
				msg.setH01OPECOD("0001");
				break;
			case 3:
				msg.setH01OPECOD("0002");
				break;
			case 4:
				msg.setH01OPECOD("0003");
				break;
			}

			setMessageRecord(req, msg);
			// Send Message
			mp.sendMessage(msg);
			// Receive Error Message y Data Message (Optional)
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EBL0110_client_enter_new.jsp", req, res);
			} else {
				if (newmessage.getFormatName().equals("EBL011001")) {
					ses.setAttribute("ebl0110Msg", newmessage);					
				} else {
					ses.setAttribute("ebl0110Msg", mp.receiveMessageRecord("EBL011001"));
				}
				switch (screen) {
				case 2:
				case 3:
					forward("EBL0110_client_detail.jsp", req, res);
					break;
				default:
					forward("EBL0110_client_detail_inquiry.jsp", req, res);
				}				
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void subClient(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		boolean success = true;

		// Send data
		try {
			mp = new MessageProcessor("EBL0110");
			EBL011001Message msg = (EBL011001Message) mp.getMessageRecord("EBL011001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBL0110");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");

			setMessageRecord(req, msg);

			// Send Message
			mp.sendMessage(msg);
			// Receive Error Message or Data Message (Optional)
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EBL011001Message) mp.receiveMessageRecord("EBL011001");
			
			ses.setAttribute("error", msgError);
			ses.setAttribute("ebl0110Msg", msg);
			
			if (mp.hasError(msgError)) {
				forward("EBL0110_client_detail.jsp", req, res);
			} else {
				forward("EBL0110_client_enter_new.jsp", req, res);
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

}

/**
 * @author Luis Crosby
 * @date 2011-12-06
 */

package datapro.eibs.tools;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import datapro.eibs.beans.EBL013001Message;
import datapro.eibs.beans.EBL013002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

public class JSEBL0130 extends JSEIBSServlet {
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		case 1: // Search Request Historico OFAC (Black list)
			procReqHistOfacBlackList(user, req, res, session);
			break;
		case 2: // Search Action Historico OFAC (Black list)
			procActionHistOfacBlackList(user, req, res, session);
			break;
		case 3:
			procActionGetClientData(user, req, res, session);
			break;
		default:
			forward(SuperServlet.devPage, req, res);
			break;
		}
	}

	protected void procReqHistOfacBlackList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {
		MessageProcessor mp = null;
		MessageRecord record = null;
		ELEERRMessage error = null;
		UserPos userPO = null;
		String opt = req.getParameter("OPT");
		ses.setAttribute("OPT", opt);

		try {
			mp = new MessageProcessor("EBL0130");
			EBL013001Message msg = (EBL013001Message) mp
					.getMessageRecord("EBL013001");
			error = new ELEERRMessage();
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("ebl0130Msg", msg);
			forward("EBL0130_ofac_inq_blacklist.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procActionHistOfacBlackList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException

	{

		MessageContext mc = null;
		HttpSession session;
		MessageRecord newmessage = null;
		EBL013001Message msgHelp = null;
		ELEERRMessage msgError = null;
		ESS0030DSMessage msgUser = null;
		JBObjList beanList = null;

		String searchType = "", NameSearch = "";
		session = (HttpSession) req.getSession(false);

		if (session == null) {
			try {
				res.setContentType("text/html");
				printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {

			msgUser = (datapro.eibs.beans.ESS0030DSMessage) session
					.getAttribute("currUser");
			String Language = msgUser.getE01LAN();
			String LangPath = super.rootPath + Language + "/";
			try {
				flexLog("Opennig Socket Connection");
				try {
					msgError = new datapro.eibs.beans.ELEERRMessage();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				mc = new MessageContext(getMessageHandler("EBL0130", req));

				try {
					msgHelp = (EBL013001Message) mc
							.getMessageRecord("EBL013001");
					msgHelp.setH01USERID(msgUser.getH01USR());
					msgHelp.setH01PROGRM("EBL0130");
					msgHelp.setH01SCRCOD("04");
					msgHelp.setH01TIMSYS(getTimeStamp());
					searchType = req.getParameter("Type");
					NameSearch = req.getParameter("NameSearch");
					msgHelp.setH01OPECOD(searchType);

					if (searchType.equals("0001"))
						msgHelp.setE01OFACUN(NameSearch);
					else if (searchType.equals("0002"))
						msgHelp.setE01OFAIDN(NameSearch);
					else if (searchType.equals("0003"))
						msgHelp.setE01OFANA1(NameSearch);
					else if (searchType.equals("0004"))
						msgHelp.setE01OFAACC(NameSearch);
					else if (searchType.equals("0005")) {
						msgHelp.setE01OFALMD(req.getParameter("LMD"));
						msgHelp.setE01OFALMM(req.getParameter("LMM"));
						msgHelp.setE01OFALMY(req.getParameter("LMY"));
						msgHelp.setE01OFASMD(req.getParameter("SMD"));
						msgHelp.setE01OFASMM(req.getParameter("SMM"));
						msgHelp.setE01OFASMY(req.getParameter("SMY"));
					} else
						msgHelp.setH01FLGWK1(NameSearch);

					msgHelp.send();
					msgHelp.destroy();
					flexLog("EBL013001 Message Sent");
				} catch (Exception e) {
					e.printStackTrace();
					flexLog("Error: " + e);
					res.sendRedirect(super.srctx + LangPath
							+ super.sckNotRespondPage);
					return;
				}

				// Receiving
				try {

					newmessage = mc.receiveMessage();

					if (newmessage.getFormatName().equals("EBL013001")) {

						try {
							beanList = new JBObjList();
							flexLog("EBL013001 Message Received");
						} catch (Exception ex) {
							flexLog("Error: " + ex);
						}

						boolean firstTime = true;
						String marker = "";
						String myFlag = "";
						StringBuffer myRow = null;
						String chk = "";

						while (true) {

							msgHelp = (EBL013001Message) newmessage;

							marker = msgHelp.getH01FLGMAS();
							msgHelp.setHandler(null);

							if (marker.equals("*")) {
								beanList.setShowNext(false);
								break;
							} else {

								if (firstTime) {
									firstTime = false;
									beanList.setFirstRec(Integer
											.parseInt(msgHelp.getE01RECNUM()));
									chk = "checked";
								} else {
									chk = "";
								}

								beanList.addRow(msgHelp);

								if (marker.equals("+")) {
									beanList.setShowNext(true);
									break;
								}
							}
							newmessage = mc.receiveMessage();
						}

						flexLog("Putting java beans into the session");
						session.setAttribute("ebl013001List", beanList);

						try {
							req.setAttribute("NameSearch", req
									.getParameter("NameSearch"));
							req.setAttribute("Type", req.getParameter("Type"));
							flexLog("About to call Page: " + LangPath
									+ "EBL0130_ofac_inq_blacklist_message.jsp");
							callPage(LangPath
									+ "EBL0130_ofac_inq_blacklist_message.jsp",
									req, res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					flexLog("Error: " + e);
					res.sendRedirect(super.srctx + LangPath
							+ super.sckNotRespondPage);
				}
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				res.sendRedirect(super.srctx + LangPath + super.sckNotOpenPage);
				// return;
			} finally {
				mc.close();
			}

		}
	}

	protected void procActionGetClientData(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		boolean success = true;

		String Type = req.getParameter("Type").trim();

		req.setAttribute("NameSearch", req.getParameter("NameSearch"));

		// Send data
		try {
			mp = new MessageProcessor("EBL0130");
			EBL013002Message msg = (EBL013002Message) mp
					.getMessageRecord("EBL013002");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EBL0130");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD(req.getParameter("HOPECOD"));
			msg.setE02OPECOD(Type);
			msg.setE02OFACUN(req.getParameter("OFACUN"));
			msg.setE02OFALMT(req.getParameter("OFALMT"));
			msg.setE02OFAIDN(req.getParameter("OFAIDN"));
			if (Type.equals("0005")) {
				msg.setE02OFALMD(req.getParameter("LMD"));
				msg.setE02OFALMM(req.getParameter("LMM"));
				msg.setE02OFALMY(req.getParameter("LMY"));
				msg.setE02OFASMD(req.getParameter("SMD"));
				msg.setE02OFASMM(req.getParameter("SMM"));
				msg.setE02OFASMY(req.getParameter("SMY"));
			}
			String recNum = req.getParameter("RecNum");

			if (recNum != null) {
				if (recNum.equals("plus"))
					msg.setE02RECNUM(new BigDecimal(1));
				else
					msg.setE02RECNUM(new BigDecimal(-1));
			}

			try {
				super.setMessageRecord(req, msg);
			} catch (Exception e) {
			}

			ses.setAttribute("ebl0130Msg", msg);
			// Send Message
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				ses.setAttribute("ebl0130Msg", msg);
				success = false;
			}

			newmessage = mp.receiveMessageRecord();
			if (newmessage.getFormatName().equals("EBL013002")) {
				ses.setAttribute("ebl0130Msg", newmessage);
			}

			if (success) {
				forward("EBL0130_ofac_blacklist_client_detail.jsp", req, res);
			} else {
			//EBL0130_ofac_inq_blacklist.jsp
				forward("EBL0130_ofac_blacklist_client_detail.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

}
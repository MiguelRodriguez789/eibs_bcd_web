package datapro.eibs.products;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

import datapro.eibs.beans.EDL099801Message;
import datapro.eibs.beans.EDL099802Message;
import datapro.eibs.beans.EDL099803Message;
import datapro.eibs.beans.EDL099804Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelResultSet;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.services.ExcelXLSXResultSet;
import datapro.eibs.sockets.DecimalField;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0998 extends JSEIBSServlet {

	private ServletConfig config = null;
	
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		switch (screen) {
			case 1:
				procReqEnterMaint(user, req, res, session);
				break;
			case 2:
				procReqMaintIPC(user, req, res, session);
				break;
			case 3: // New
			case 5: // Maintenance
			case 6: // Inquiry
			case 7: // Delete
				procActionRecMan(user, req, res, session, screen);
				break;
			case 4: // Update
			case 8: // Delete
				procActionMaiReg(user, req, res, session, screen);
				break;
			case 9:
				procReqMaintGLN(user, req, res, session);
				break;
			case 10: // New
			case 12: // Maintenance
			case 13: // Inquiry
			case 14: // Delete
				procActionGlnMan(user, req, res, session, screen);
				break;
			case 11: // Update
			case 15: // Delete
				procActionGlnReg(user, req, res, session, screen);
				break;
			case 16:
				procReqEnterData(user, req, res, session);
				break;
			case 17:
				procReqMaintData(user, req, res, session);
				break;

			default:
				forward(devPage, req, res);
				break;
		}
	}

	
	private void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, 
			HttpServletResponse res, 
			HttpSession session) 
			throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos userPO = null;

		try {

			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = new datapro.eibs.beans.UserPos();
			userPO.setPurpose("MAINTENANCE");
			userPO.setProdCode("C1");

			//Others Parameters
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", new ELEERRMessage());


		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		forward("EDL0998_IPC_year_select.jsp", req, res);
	}
		
	protected void procReqMaintIPC(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String YearPro = "";

			try {

				mp = new MessageProcessor("EDL0998");
				EDL099801Message msgSP = (EDL099801Message) mp.getMessageRecord("EDL099801");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgSP.setH01USERID(user.getH01USR());
				msgSP.setH01PROGRM("EDL0998");
				msgSP.setH01TIMSYS(getTimeStamp());
				msgSP.setH01SCRCOD("01");
				msgSP.setH01OPECOD("0001");
				userPO.setAccNum(userPO.getCusNum());
				YearPro = req.getParameter("E01INDVDY") == null ? "0" : req.getParameter("E01INDVDY").trim();
				if (!YearPro.equals("0")) {
					userPO.setHeader23(YearPro.trim());
				}

				msgSP.setE01INDVDY(userPO.getHeader23());

				mp.sendMessage(msgSP);

				msgSP = (EDL099801Message) mp.receiveMessageRecord();
				ses.setAttribute("hdList", msgSP);

			} finally {
				if (mp != null)	mp.close();
			}

			try {

				mp = new MessageProcessor("EDL0998");
				EDL099802Message msgRT = (EDL099802Message) mp.getMessageRecord("EDL099802");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("EDL0998");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("02");
				msgRT.setH02OPECOD("0002");
				YearPro = req.getParameter("E01INDVDY") == null ? "0" : req.getParameter("E01INDVDY").trim();
				if (!YearPro.equals("0")) {
					userPO.setHeader23(YearPro.trim());
				}
				msgRT.setE02INDVDY(userPO.getHeader23());

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("EDL099802List", list);
				}
				forward("EDL0998_IPC_year_list.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}
	
	protected void procActionRecMan(
			ESS0030DSMessage user, 
			HttpServletRequest req, 
			HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String YearPro = "";

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDL0998");
				EDL099802Message msgRT = (EDL099802Message) mp.getMessageRecord("EDL099802");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("EDL0998");
				msgRT.setH02TIMSYS(getTimeStamp());
				switch (screen) {
				case 3 : // Request New Record
		     	    msgRT.setH02SCRCOD("03");
				    msgRT.setH02OPECOD("0003");
				    userPO.setPurpose("NEW");
				case 5 : // Request MAINTENANCE Record
					msgRT.setH02SCRCOD("05");
					msgRT.setH02OPECOD("0005");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 6 : // Request INQUIRY Record
					msgRT.setH02SCRCOD("06");
					msgRT.setH02OPECOD("0006");
					userPO.setPurpose("INQUIRY");
					break;
				case 7 : // Request Delete Record
					msgRT.setH02SCRCOD("07");
					msgRT.setH02OPECOD("0007");
					userPO.setPurpose("DELETE");
					break;

				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}

				YearPro = req.getParameter("E01INDVDY") == null ? "0" : req.getParameter("E01INDVDY").trim();
				if (!YearPro.equals("0")) {
					userPO.setHeader23(YearPro.trim());
				}
				msgRT.setE02INDVDY(userPO.getHeader23());

				try {
					msgRT.setE02INDVDM(req.getParameter("E02INDVDM"));
				} catch (Exception e) {
					msgRT.setE02INDVDM("0");
				}

				try {
					msgRT.setE02INDVDD(req.getParameter("E02INDVDD"));
				} catch (Exception e) {
					msgRT.setE02INDVDD("0");
				}
				
				
								
				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("EDL0998_IPC_year_list.jsp", req, res);
					} else {
						// Receive Data
						ses.setAttribute("IPC", newmessage);
						forward("EDL0998_IPC_year.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}


	protected void procActionMaiReg(
			ESS0030DSMessage user, 
			HttpServletRequest req, 
			HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String YearPro = "";

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDL0998");
				EDL099802Message msgRT = (EDL099802Message) mp.getMessageRecord("EDL099802");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("EDL0998");
				msgRT.setH02TIMSYS(getTimeStamp());
				switch (screen) {
				case 4 : // Request Update Record
					msgRT.setH02OPECOD("0004");
					msgRT.setH02SCRCOD("04");
					break;
				case 8 : // Request Delete Record
					msgRT.setH02OPECOD("0008");
					msgRT.setH02SCRCOD("08");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
				
				YearPro = req.getParameter("E01INDVDY") == null ? "0" : req.getParameter("E01INDVDY").trim();
				if (!YearPro.equals("0")) {
					userPO.setHeader23(YearPro.trim());
				}
				msgRT.setE02INDVDY(userPO.getHeader23());

				try {
					msgRT.setE02INDVDY(req.getParameter("E02INDVDY"));
				} catch (Exception e) {
					msgRT.setE02INDVDY("0");
				}
				try {
					msgRT.setE02INDVDM(req.getParameter("E02INDVDM"));
				} catch (Exception e) {
					msgRT.setE02INDVDM("0");
				}

				try {
					msgRT.setE02INDVDD(req.getParameter("E02INDVDD"));
				} catch (Exception e) {
					msgRT.setE02INDVDD("0");
				}
					// Get all fields in page
					try {
						super.setMessageRecord(req, msgRT);
					} catch (Exception e) {				
					}
				
				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("IPC", newmessage );
						forward("EDL0998_IPC_year.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEDL0998?SCREEN=2");

					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procReqMaintGLN(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String YearPro = "";

			try {

				mp = new MessageProcessor("EDL0998");
				EDL099803Message msgRT = (EDL099803Message) mp.getMessageRecord("EDL099803");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("EDL0998");
				msgRT.setH03TIMSYS(getTimeStamp());
				msgRT.setH03SCRCOD("02");
				msgRT.setH03OPECOD("0002");

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E03INDOPE","E03NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("EDL099803List", list);
				}
				forward("EDL0998_GLN_list.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}
	
	protected void procActionGlnMan(
			ESS0030DSMessage user, 
			HttpServletRequest req, 
			HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String YearPro = "";

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDL0998");
				EDL099803Message msgRT = (EDL099803Message) mp.getMessageRecord("EDL099803");
				
				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("EDL0998");
				msgRT.setH03TIMSYS(getTimeStamp());
				switch (screen) {
				case 10 : // Request New Record
		     	    msgRT.setH03SCRCOD("03");
				    msgRT.setH03OPECOD("0003");
				    userPO.setPurpose("NEW");
				case 12 : // Request MAINTENANCE Record
					msgRT.setH03SCRCOD("05");
					msgRT.setH03OPECOD("0005");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 13 : // Request INQUIRY Record
					msgRT.setH03SCRCOD("06");
					msgRT.setH03OPECOD("0006");
					userPO.setPurpose("INQUIRY");
					break;
				case 14 : // Request Delete Record
					msgRT.setH03SCRCOD("07");
					msgRT.setH03OPECOD("0007");
					userPO.setPurpose("DELETE");
					break;

				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}

				try {
					msgRT.setE03GLNCDE(req.getParameter("E03GLNCDE"));
				} catch (Exception e) {
					msgRT.setE03GLNCDE(" ");
				}

				try {
					msgRT.setE03GLNBNK(req.getParameter("E03GLNBNK"));
				} catch (Exception e) {
					msgRT.setE03GLNBNK(" ");
				}

				try {
					msgRT.setE03GLNCCY(req.getParameter("E03GLNCCY"));
				} catch (Exception e) {
					msgRT.setE03GLNCCY(" ");
				}
				
				try {
					msgRT.setE03GLNGLN(req.getParameter("E03GLNGLN"));
				} catch (Exception e) {
					msgRT.setE03GLNGLN("0");
				}
				
				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("EDL0998_GLN_list.jsp", req, res);
					} else {
						// Receive Data
						ses.setAttribute("gln", newmessage);
						forward("EDL0998_GLN.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procActionGlnReg(
			ESS0030DSMessage user, 
			HttpServletRequest req, 
			HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String YearPro = "";

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDL0998");
				EDL099803Message msgRT = (EDL099803Message) mp.getMessageRecord("EDL099803");

				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("EDL0998");
				msgRT.setH03TIMSYS(getTimeStamp());
				switch (screen) {
				case 11 : // Request Update Record
					msgRT.setH03OPECOD("0004");
					msgRT.setH03SCRCOD("04");
					break;
				case 15 : // Request Delete Record
					msgRT.setH03OPECOD("0008");
					msgRT.setH03SCRCOD("08");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
				
				try {
					msgRT.setE03GLNCDE(req.getParameter("E03GLNCDE"));
				} catch (Exception e) {
					msgRT.setE03GLNCDE(" ");
				}

				try {
					msgRT.setE03GLNBNK(req.getParameter("E03GLNBNK"));
				} catch (Exception e) {
					msgRT.setE03GLNBNK(" ");
				}

				try {
					msgRT.setE03GLNCCY(req.getParameter("E03GLNCCY"));
				} catch (Exception e) {
					msgRT.setE03GLNCCY(" ");
				}
				
				try {
					msgRT.setE03GLNGLN(req.getParameter("E03GLNGLN"));
				} catch (Exception e) {
					msgRT.setE03GLNGLN("0");
				}

				// Get all fields in page
					try {
						super.setMessageRecord(req, msgRT);
					} catch (Exception e) {				
					}
				
				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("gln", newmessage );
						forward("EDL0998_GLN.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEDL0998?SCREEN=9");

					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	private void procReqEnterData(ESS0030DSMessage user,
			HttpServletRequest req, 
			HttpServletResponse res, 
			HttpSession session) 
			throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos userPO = null;

		try {

			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = new datapro.eibs.beans.UserPos();
			userPO.setPurpose("INQUIRY");
			userPO.setProdCode("C1");

			//Others Parameters
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", new ELEERRMessage());


		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		forward("EDL0998_Data_year_select.jsp", req, res);
	}

	protected void procReqMaintData(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String YearPro = "";

			try {

				mp = new MessageProcessor("EDL0998");
				EDL099801Message msgSP = (EDL099801Message) mp.getMessageRecord("EDL099801");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgSP.setH01USERID(user.getH01USR());
				msgSP.setH01PROGRM("EDL0998");
				msgSP.setH01TIMSYS(getTimeStamp());
				msgSP.setH01SCRCOD("01");
				msgSP.setH01OPECOD("0001");
				userPO.setAccNum(userPO.getCusNum());
				YearPro = req.getParameter("E01INDVDY") == null ? "0" : req.getParameter("E01INDVDY").trim();
				if (!YearPro.equals("0")) {
					userPO.setHeader23(YearPro.trim());
				}

				msgSP.setE01INDVDY(userPO.getHeader23());

				mp.sendMessage(msgSP);

				msgSP = (EDL099801Message) mp.receiveMessageRecord();
				ses.setAttribute("hdList", msgSP);

			} finally {
				if (mp != null)	mp.close();
			}

			try {

				mp = new MessageProcessor("EDL0998");
				EDL099804Message msgRT = (EDL099804Message) mp.getMessageRecord("EDL099804");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH04USERID(user.getH01USR());
				msgRT.setH04PROGRM("EDL0998");
				msgRT.setH04TIMSYS(getTimeStamp());
				msgRT.setH04SCRCOD("02");
				msgRT.setH04OPECOD("0002");
				YearPro = req.getParameter("E01INDVDY") == null ? "0" : req.getParameter("E01INDVDY").trim();
				if (!YearPro.equals("0")) {
					userPO.setHeader23(YearPro.trim());
				}
				msgRT.setE04TRAVDY(userPO.getHeader23());

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E04INDOPE","E04NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("EDL099804List", list);
				}
				forward("EDL0998_Data_list.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}
	
	
}

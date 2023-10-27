package datapro.eibs.taxes;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

import datapro.eibs.beans.ESD005001Message;
import datapro.eibs.beans.ESD005002Message;
import datapro.eibs.beans.ESD009601Message;
import datapro.eibs.beans.ESD009602Message;
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

public class JSESD0096 extends JSEIBSServlet {

	private ServletConfig config = null;
	
	protected static final int R_ENTER_MAINT = 1;
	protected static final int R_MAINT_CUST  = 2;
	protected static final int A_NEW_EXC = 3;
	protected static final int A_MAN_REG = 4;
	protected static final int A_MAI_EXC = 5;
	protected static final int A_INQ_EXC = 6;
	protected static final int A_DEL_EXC = 7;
	protected static final int A_DEL_REG = 8;
	
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
				procReqMaintCust(user, req, res, session);
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
			userPO.setOption("TAXES");
			userPO.setPurpose("MAINTENANCE");
			userPO.setProdCode("C1");

			//Others Parameters
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", new ELEERRMessage());


		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		forward("ESD0096_tax_customer_select.jsp", req, res);
	}
		
	protected void procReqMaintCust(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String CusNum = "";

			try {

				mp = new MessageProcessor("ESD0096");
				ESD009601Message msgSP = (ESD009601Message) mp.getMessageRecord("ESD009601");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgSP.setH01USERID(user.getH01USR());
				msgSP.setH01PROGRM("ESD0096");
				msgSP.setH01TIMSYS(getTimeStamp());
				msgSP.setH01SCRCOD("01");
				msgSP.setH01OPECOD("0001");
				userPO.setAccNum(userPO.getCusNum());
				CusNum = req.getParameter("E01CUSCUN") == null ? "0" : req.getParameter("E01CUSCUN").trim();
				if (!CusNum.equals("0")) {
					userPO.setCusNum(CusNum.trim());
				}

				msgSP.setE01CUSCUN(userPO.getCusNum());

				mp.sendMessage(msgSP);

				msgSP = (ESD009601Message) mp.receiveMessageRecord();
				ses.setAttribute("hdList", msgSP);

			} finally {
				if (mp != null)	mp.close();
			}

			try {

				mp = new MessageProcessor("ESD0096");
				ESD009602Message msgRT = (ESD009602Message) mp.getMessageRecord("ESD009602");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0096");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("02");
				msgRT.setH02OPECOD("0002");
				CusNum = req.getParameter("E01CUSCUN") == null ? "0" : req.getParameter("E01CUSCUN").trim();
				if (!CusNum.equals("0")) {
					userPO.setAccNum(CusNum.trim());
				}
				msgRT.setE02CUSCUN(userPO.getCusNum());

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD009602List", list);
				}
				forward("ESD0096_tax_exception_list.jsp", req, res);

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
			String CusNum = "";

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0096");
				ESD009602Message msgRT = (ESD009602Message) mp.getMessageRecord("ESD009602");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0096");
				msgRT.setH02TIMSYS(getTimeStamp());
				switch (screen) {
				case 3 : // Request New Record
		     	    msgRT.setH02SCRCOD("03");
				    msgRT.setH02OPECOD("0003");
				    userPO.setPurpose("NEW");
				    break;
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

				CusNum = req.getParameter("E01CUSCUN") == null ? "0" : req.getParameter("E01CUSCUN").trim();
				if (!CusNum.equals("0")) {
					userPO.setCusNum(CusNum.trim());
				}
				msgRT.setE02CUSCUN(userPO.getCusNum());

				try {
					msgRT.setE02TXEATY(req.getParameter("E02TXEATY"));
				} catch (Exception e) {
					msgRT.setE02TXEATY(" ");
				}
				try {
					msgRT.setE02TXETYP(req.getParameter("E02TXETYP"));
				} catch (Exception e) {
					msgRT.setE02TXETYP(" ");
				}
				try {
					msgRT.setE02TXETTP(req.getParameter("E02TXETTP"));
				} catch (Exception e) {
					msgRT.setE02TXETTP(" ");
				}

				try {
					msgRT.setE02TXEACC(req.getParameter("E02TXEACC"));
				} catch (Exception e) {
					msgRT.setE02TXEACC("0");
				}
								
				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0096_tax_exception_list.jsp", req, res);
					} else {
						// Receive Data
						ses.setAttribute("Taxes", newmessage);
						forward("ESD0096_tax_exception.jsp", req, res);
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
			String CusNum = "";

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0096");
				ESD009602Message msgRT = (ESD009602Message) mp.getMessageRecord("ESD009602");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0096");
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
				
				CusNum = req.getParameter("E01CUSCUN") == null ? "0" : req.getParameter("E01CUSCUN").trim();
				if (!CusNum.equals("0")) {
					userPO.setCusNum(CusNum.trim());
				}
				msgRT.setE02CUSCUN(userPO.getCusNum());

				try {
					msgRT.setE02TXEATY(req.getParameter("E02TXEATY"));
				} catch (Exception e) {
					msgRT.setE02TXEATY(" ");
				}
				try {
					msgRT.setE02TXETYP(req.getParameter("E02TXETYP"));
				} catch (Exception e) {
					msgRT.setE02TXETYP(" ");
				}
				try {
					msgRT.setE02TXETTP(req.getParameter("E02TXETTP"));
				} catch (Exception e) {
					msgRT.setE02TXETTP(" ");
				}

				try {
					msgRT.setE02TXEACC(req.getParameter("E02TXEACC"));
				} catch (Exception e) {
					msgRT.setE02TXEACC("0");
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
					ses.setAttribute("Taxes", newmessage );
						forward("ESD0096_tax_exception.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(srctx + "/servlet/datapro.eibs.taxes.JSESD0096?SCREEN=2");

					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
	
}

package datapro.eibs.client;


import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSESD0085 extends JSEIBSServlet {


	protected static final int R_ENTER_FATCA_CL = 3;
	protected static final int R_DELETE_FATCA_CL = 4;
	protected static final int R_MAINTENANCE_FATCA_CL = 5;
	protected static final int R_ENTER_FATCA_LST = 6;	
	protected static final int R_ENTER_CRS_CL = 23;
	protected static final int R_DELETE_CRS_CL = 24;
	protected static final int R_MAINTENANCE_CRS_CL = 25;
	protected static final int R_ENTER_CRS_LST = 26;	
	protected static final int R_PAR_FATCA_LST = 100;
	protected static final int A_PAR_FATCA_NEW = 101;
	protected static final int A_PAR_FATCA_ADD = 102;
	protected static final int A_PAR_FATCA_MAN = 103;
	protected static final int A_PAR_FATCA_INQ = 104;
	protected static final int A_PAR_FATCA_DEL = 105;
	protected static final int R_PAR_CRS_LST = 200;
	protected static final int A_PAR_CRS_NEW = 201;
	protected static final int A_PAR_CRS_ADD = 202;
	protected static final int A_PAR_CRS_MAN = 203;
	protected static final int A_PAR_CRS_INQ = 204;
	protected static final int A_PAR_CRS_DEL = 205;


	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen){
		case R_ENTER_FATCA_CL:
			procActClFatca(user, req, res, session, screen);
			break;
		case R_DELETE_FATCA_CL:
			procActClFatca(user, req, res, session, screen);
			break;
		case R_MAINTENANCE_FATCA_CL:
			procActClFatca(user, req, res, session, screen);
			break;
		case R_ENTER_FATCA_LST :
			procLstClFatca(user, req, res, session, screen);
			break;
		case R_PAR_FATCA_LST :
        	procFatcaCtySearc(user, req, res, session, screen);
			break;
        case A_PAR_FATCA_NEW :
        	procFatcaCtyNew(user, req, res, session, screen);
			break;
        case A_PAR_FATCA_ADD :
        	procFatcaCtyAdd(user, req, res, session, screen);
			break;
        case A_PAR_FATCA_MAN :
        	procFatcaCtyMan(user, req, res, session, screen);
			break;
        case A_PAR_FATCA_INQ :
        	procFatcaCtyInq(user, req, res, session, screen);
			break;
        case A_PAR_FATCA_DEL :
        	procFatcaCtyDel(user, req, res, session, screen);
			break;
		case R_ENTER_CRS_CL:
			procActClCrs(user, req, res, session, screen);
			break;
		case R_DELETE_CRS_CL:
			procActClCrs(user, req, res, session, screen);
			break;
		case R_MAINTENANCE_CRS_CL:
			procActClCrs(user, req, res, session, screen);
			break;
		case R_ENTER_CRS_LST :
			procLstClCrs(user, req, res, session, screen);
			break;
        case R_PAR_CRS_LST :
        	procCrsCtySearc(user, req, res, session, screen);
			break;
        case A_PAR_CRS_NEW :
        	procCrsCtyNew(user, req, res, session, screen);
			break;
        case A_PAR_CRS_ADD :
        	procCrsCtyAdd(user, req, res, session, screen);
			break;
        case A_PAR_CRS_MAN :
        	procCrsCtyMan(user, req, res, session, screen);
			break;
        case A_PAR_CRS_INQ :
        	procCrsCtyInq(user, req, res, session, screen);
			break;
        case A_PAR_CRS_DEL :
        	procCrsCtyDel(user, req, res, session, screen);
			break;
			
			
        default :
				forward(devPage, req, res);
				break;
		}
	}


	protected void procActClFatca(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0085");
				ESD008501Message msg = (ESD008501Message) mp.getMessageRecord("ESD008501");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ESD0085");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setE01OPE((req.getParameter("OPE") == null ? "01" : req.getParameter("OPE")));
				msg.setH01FLGWK1((req.getParameter("VALMOT") == null ? "Y" : req.getParameter("VALMOT")));
				
				switch (screen) {
					case 2 : // Request new Record
						msg.setH01OPECOD("0001");
						userPO.setPurpose("NEW");
						break;
					case 3 : // Request old Record
						userPO.setPurpose("MAINTENANCE");
						msg.setH01OPECOD("0003");
						break;
					case 4 : // Delete Record
						userPO.setPurpose("MAINTENANCE");
						msg.setH01OPECOD("0009");
						break;
					case 5 : // Submit the Record for update
						msg.setH01OPECOD("0005");
						break;
					case 7 : // Submit the Record for Approval Inquiry
						userPO.setPurpose("APPROVAL");
						msg.setH01OPECOD("0007");	
						break;
					case 8 : // Submit the Record for Inquiry
						userPO.setPurpose("INQUIRY");
						msg.setH01OPECOD("0008");	
						break;	
					default :
						forward(SuperServlet.devPage, req, res);
						break;
				}
				// Get key field
				try {
					msg.setE01CUN(req.getParameter("E01CUN"));
				} catch (Exception e) {
					msg.setE01CUN(userPO.getCusNum());
				}
				userPO.setCusNum(msg.getE01CUN());
				userPO.setSource(msg.getE01OPE());
				userPO.setOption("C1");
				if(screen == 8){
					userPO.setIdentifier(msg.getE01CUN());
				}					
				if (screen == 2 || screen == 5) {
					// Get all fields in page
					try {
  						super.setMessageRecord(req, msg);
					} catch (Exception e) {				
					}
				}
				// Send Message 
				mp.sendMessage(msg);
				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
	 			newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0085_client_fatca_list.jsp", req, res);
					} else {
						// Receive Data
						userPO.setCusNum(msg.getE01CUN());
						userPO.setCusName(msg.getE01NA1());
						userPO.setCusType(msg.getE01LGT());

						ses.setAttribute("client", newmessage);
						if(msg.getH01OPECOD().equals("0009") || msg.getH01OPECOD().equals("0005")) {
							res.sendRedirect(super.srctx + "/servlet/datapro.eibs.client.JSESD0085?SCREEN=6&OPE=30");
						} else {
						forward("ESD0085_client_fatca.jsp", req, res);
						}
					}

				
			} finally {

				if (mp != null) 
					mp.close();
			}
		}

	protected void procLstClFatca(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			UserPos userPO = null;
			MessageProcessor mp = null;
			String searchType = "";
			try {
				mp = new MessageProcessor("ESD0085");
				ESD008501Message msg = (ESD008501Message) mp.getMessageRecord("ESD008501");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				userPO.setPurpose("MAINTENANCE");
				// Send Initial data
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ESD0085");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01OPECOD("0015");
				if (screen == 6) {
					userPO.setPurpose("MAINTENANCE");
				} else {
					userPO.setPurpose("INQUIRY");
				}
				try {
					msg.setE01NUMREC(req.getParameter("FromRecord"));
				} catch (Exception e) {
					msg.setE01NUMREC("0"); 
				}
				try {
					searchType = req.getParameter("SEARCHTYPE");
				} catch (Exception e) { }
				if (searchType == null) {
					searchType = "C";
				}
				if (searchType.equals("C")) {
					try {
						msg.setE01CUN(req.getParameter("SEARCHCDE"));
					} catch (Exception e) { 
						msg.setE01CUN("0");
					}
				} else if (searchType.equals("S")) {
					try {
						msg.setE01SHN(req.getParameter("SEARCHCDE"));
					} catch (Exception e) {	
						msg.setE01SHN("");
					}
				} else if(searchType.equals("I")) {
					try {
						msg.setE01IDN(req.getParameter("SEARCHCDE"));
					} catch (Exception e) {
						msg.setE01IDN("");
					}
				}
				msg.setE01OPE((req.getParameter("OPE") == null ? "01" : req.getParameter("OPE")));
				msg.setH01FLGWK1(searchType);
				userPO.setType(msg.getH01FLGWK1());
				try {
					userPO.setHeader11(req.getParameter("SEARCHCDE"));
				} catch (Exception e) { }
				
				userPO.setCusNum(msg.getE01CUN());
				userPO.setCusName(msg.getE01SHN());
				userPO.setIdentifier(msg.getE01IDN());
				userPO.setOption("C1");
				// Send Message	
				mp.sendMessage(msg);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD0085List", list);
				}
				String lstPage = "ESD0085_client_fatca_list.jsp";
				forward(lstPage, req, res);
			} finally {
				if (mp != null)
					mp.close();
			}
		}
	
	
	protected void procFatcaCtySearc(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses , int screen)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
		    MessageRecord newmessage = null;
			
			try {

				mp = new MessageProcessor("ESD0083");
				ESD008301Message msgRT = (ESD008301Message) mp.getMessageRecord("ESD008301");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0083");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("15");
				msgRT.setH01OPECOD("0015");
				try {
					msgRT.setE01NUMREC(req.getParameter("FromRecord"));
				} catch (Exception e) {
					msgRT.setE01NUMREC("0"); 
				}


				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD008301List", list);
				}
				forward("ESD0083_client_param_fatca_1.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}

	protected void procFatcaCtyNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0083");
				ESD008301Message msgRT = (ESD008301Message) mp.getMessageRecord("ESD008301");

				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0083");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("01");
				msgRT.setH01OPECOD("0001");
				userPO.setPurpose("NEW");

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0083_client_param_fatca_1.jsp", req, res);
					} else {
						// Receive Data

						ses.setAttribute("client", newmessage);
						forward("ESD0083_client_param_fatca_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procFatcaCtyAdd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String CtyNum = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0083");
				ESD008301Message msgRT = (ESD008301Message) mp.getMessageRecord("ESD008301");

				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0083");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("02");
				msgRT.setH01OPECOD("0002");

				CtyNum = req.getParameter("E01CFACTY") == null ? " " : req.getParameter("E01CFACTY").trim();
				if (!CtyNum.equals(" ")) {
					msgRT.setE01CFACTY(CtyNum.trim());
					
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
					ses.setAttribute("client", newmessage );
						forward("ESD0083_client_param_fatca_2.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.client.JSESD0085?SCREEN=100");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procFatcaCtyMan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String CtyNum = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0083");
				ESD008301Message msgRT = (ESD008301Message) mp.getMessageRecord("ESD008301");

				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0083");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("03");
				msgRT.setH01OPECOD("0003");
				userPO.setPurpose("MAINTENANCE");
				CtyNum = req.getParameter("E01CFACTY") == null ? " " : req.getParameter("E01CFACTY").trim();
				if (!CtyNum.equals(" ")) {
					userPO.setHeader10(CtyNum.trim());
					}
				msgRT.setE01CFACTY(userPO.getHeader10());

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0083_client_param_fatca_2.jsp", req, res);
					} else {
						// Receive Data
						ses.setAttribute("client", newmessage);
						forward("ESD0083_client_param_fatca_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procFatcaCtyInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String CtyNum = "";

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0083");
				ESD008301Message msgRT = (ESD008301Message) mp.getMessageRecord("ESD008301");

				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0083");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("04");
				msgRT.setH01OPECOD("0004");
				userPO.setPurpose("INQUIRY");
				CtyNum = req.getParameter("E01CFACTY") == null ? " " : req.getParameter("E01CFACTY").trim();
				if (!CtyNum.equals(" ")) {
					userPO.setHeader10(CtyNum.trim());
					}
				msgRT.setE01CFACTY(userPO.getHeader10());
				

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0083_client_param_fatca_2.jsp", req, res);
					} else {
						// Receive Data
						ses.setAttribute("client", newmessage);
						forward("ESD0083_client_param_fatca_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procFatcaCtyDel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String CtyNum = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0083");
				ESD008301Message msgRT = (ESD008301Message) mp.getMessageRecord("ESD008301");

				msgRT.setH01USERID(user.getH01USR());
				msgRT.setH01PROGRM("ESD0083");
				msgRT.setH01TIMSYS(getTimeStamp());
				msgRT.setH01SCRCOD("05");
				msgRT.setH01OPECOD("0005");
				userPO.setPurpose("DELETE");
				CtyNum = req.getParameter("E01CFACTY") == null ? " " : req.getParameter("E01CFACTY").trim();
				if (!CtyNum.equals(" ")) {
					userPO.setHeader10(CtyNum.trim());
					}
				msgRT.setE01CFACTY(userPO.getHeader10());

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0083_client_param_fatca_2.jsp", req, res);
					} else {

						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.client.JSESD0085?SCREEN=100");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procActClCrs(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0085");
				ESD008502Message msg = (ESD008502Message) mp.getMessageRecord("ESD008502");
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("ESD0085");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setE02OPE((req.getParameter("OPE") == null ? "01" : req.getParameter("OPE")));
				msg.setH02FLGWK1((req.getParameter("VALMOT") == null ? "Y" : req.getParameter("VALMOT")));
				
				switch (screen) {
					case 22 : // Request new Record
						msg.setH02OPECOD("0001");
						userPO.setPurpose("NEW");
						break;
					case 23 : // Request old Record
						userPO.setPurpose("MAINTENANCE");
						msg.setH02OPECOD("0003");
						break;
					case 24 : // Delete Record
						userPO.setPurpose("MAINTENANCE");
						msg.setH02OPECOD("0009");
						break;
					case 25 : // Submit the Record for update
						msg.setH02OPECOD("0005");
						break;
					case 27 : // Submit the Record for Approval Inquiry
						userPO.setPurpose("APPROVAL");
						msg.setH02OPECOD("0007");	
						break;
					case 28 : // Submit the Record for Inquiry
						userPO.setPurpose("INQUIRY");
						msg.setH02OPECOD("0008");	
						break;	
					default :
						
						forward(SuperServlet.devPage, req, res);
						break;
				}
				// Get key field
				try {
					msg.setE02CUN(req.getParameter("E02CUN"));
				} catch (Exception e) {
					msg.setE02CUN(userPO.getCusNum());
				}
				userPO.setCusNum(msg.getE02CUN());
				userPO.setSource(msg.getE02OPE());
				userPO.setOption("C1");
				if(screen == 28){
					userPO.setIdentifier(msg.getE02CUN());
				}					
				if (screen == 22 || screen == 25) {
					// Get all fields in page
					try {
  						super.setMessageRecord(req, msg);
					} catch (Exception e) {				
					}
				}
				// Send Message 
				mp.sendMessage(msg);
				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
	 			newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0085_client_crs_list.jsp", req, res);
					} else {
						// Receive Data
						userPO.setCusNum(msg.getE02CUN());
						userPO.setCusName(msg.getE02NA1());
						userPO.setCusType(msg.getE02LGT());

						ses.setAttribute("client", newmessage);
						if(msg.getH02OPECOD().equals("0009") || msg.getH02OPECOD().equals("0005")) {
							res.sendRedirect(super.srctx + "/servlet/datapro.eibs.client.JSESD0085?SCREEN=26&OPE=30");
						} else {
						forward("ESD0085_client_crs.jsp", req, res);
						}
					}

				
			} finally {

				if (mp != null) 
					mp.close();
			}
		}

	protected void procLstClCrs(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			UserPos userPO = null;
			MessageProcessor mp = null;
			String searchType = "";
			try {
				mp = new MessageProcessor("ESD0085");
				ESD008502Message msg = (ESD008502Message) mp.getMessageRecord("ESD008502");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				userPO.setPurpose("MAINTENANCE");
				// Send Initial data
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("ESD0085");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02OPECOD("0015");
				if (screen == 26) {
					userPO.setPurpose("MAINTENANCE");
				} else {
					userPO.setPurpose("INQUIRY");
				}
				try {
					msg.setE02NUMREC(req.getParameter("FromRecord"));
				} catch (Exception e) {
					msg.setE02NUMREC("0"); 
				}
				try {
					searchType = req.getParameter("SEARCHTYPE");
				} catch (Exception e) { }
				if (searchType == null) {
					searchType = "C";
				}
				if (searchType.equals("C")) {
					try {
						msg.setE02CUN(req.getParameter("SEARCHCDE"));
					} catch (Exception e) { 
						msg.setE02CUN("0");
					}
				} else if (searchType.equals("S")) {
					try {
						msg.setE02SHN(req.getParameter("SEARCHCDE"));
					} catch (Exception e) {	
						msg.setE02SHN("");
					}
				} else if(searchType.equals("I")) {
					try {
						msg.setE02IDN(req.getParameter("SEARCHCDE"));
					} catch (Exception e) {
						msg.setE02IDN("");
					}
				}
				msg.setE02OPE((req.getParameter("OPE") == null ? "01" : req.getParameter("OPE")));
				msg.setH02FLGWK1(searchType);
				userPO.setType(msg.getH02FLGWK1());
				try {
					userPO.setHeader11(req.getParameter("SEARCHCDE"));
				} catch (Exception e) { }
				
				userPO.setCusNum(msg.getE02CUN());
				userPO.setCusName(msg.getE02SHN());
				userPO.setIdentifier(msg.getE02IDN());
				userPO.setOption("C1");
				// Send Message	
				mp.sendMessage(msg);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD0085List", list);
				}
				String lstPage = "ESD0085_client_crs_list.jsp";
				forward(lstPage, req, res);
			} finally {
				if (mp != null)
					mp.close();
			}
		}

	protected void procCrsCtySearc(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses , int screen)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
		    MessageRecord newmessage = null;
			
			try {

				mp = new MessageProcessor("ESD0083");
				ESD008302Message msgCr = (ESD008302Message) mp.getMessageRecord("ESD008302");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgCr.setH02USERID(user.getH01USR());
				msgCr.setH02PROGRM("ESD0083");
				msgCr.setH02TIMSYS(getTimeStamp());
				msgCr.setH02SCRCOD("20");
				msgCr.setH02OPECOD("0020");
				try {
					msgCr.setE02NUMREC(req.getParameter("FromRecord"));
				} catch (Exception e) {
					msgCr.setE02NUMREC("0"); 
				}


				mp.sendMessage(msgCr);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD008302List", list);
				}
				forward("ESD0083_client_param_crs_1.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}
	
	protected void procCrsCtyNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0083");
				ESD008302Message msgCr = (ESD008302Message) mp.getMessageRecord("ESD008302");

				msgCr.setH02USERID(user.getH01USR());
				msgCr.setH02PROGRM("ESD0083");
				msgCr.setH02TIMSYS(getTimeStamp());
				msgCr.setH02SCRCOD("21");
				msgCr.setH02OPECOD("0021");
				userPO.setPurpose("NEW");

				// Send Message 
				mp.sendMessage(msgCr);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0083_client_crs_fatca_1.jsp", req, res);
					} else {
						// Receive Data

						ses.setAttribute("client", newmessage);
						forward("ESD0083_client_param_crs_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procCrsCtyAdd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String CtyNum = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0083");
				ESD008302Message msgCr = (ESD008302Message) mp.getMessageRecord("ESD008302");

				msgCr.setH02USERID(user.getH01USR());
				msgCr.setH02PROGRM("ESD0083");
				msgCr.setH02TIMSYS(getTimeStamp());
				msgCr.setH02SCRCOD("22");
				msgCr.setH02OPECOD("0022");

				CtyNum = req.getParameter("E02CFACTY") == null ? " " : req.getParameter("E02CFACTY").trim();
				if (!CtyNum.equals(" ")) {
					msgCr.setE02CFACTY(CtyNum.trim());
					
					}
			
				
					// Get all fields in page
					try {
						super.setMessageRecord(req, msgCr);
					} catch (Exception e) {				
					}
				
				// Send Message 
				mp.sendMessage(msgCr);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("client", newmessage );
						forward("ESD0083_client_param_crs_2.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.client.JSESD0085?SCREEN=200");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	protected void procCrsCtyMan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String CtyNum = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0083");
				ESD008302Message msgCr = (ESD008302Message) mp.getMessageRecord("ESD008302");

				msgCr.setH02USERID(user.getH01USR());
				msgCr.setH02PROGRM("ESD0083");
				msgCr.setH02TIMSYS(getTimeStamp());
				msgCr.setH02SCRCOD("23");
				msgCr.setH02OPECOD("0023");
				userPO.setPurpose("MAINTENANCE");
				CtyNum = req.getParameter("E02CFACTY") == null ? " " : req.getParameter("E02CFACTY").trim();
				if (!CtyNum.equals(" ")) {
					userPO.setHeader10(CtyNum.trim());
					}
				msgCr.setE02CFACTY(userPO.getHeader10());

				// Send Message 
				mp.sendMessage(msgCr);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0083_client_param_crs_2.jsp", req, res);
					} else {
						// Receive Data
						ses.setAttribute("client", newmessage);
						forward("ESD0083_client_param_crs_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procCrsCtyInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String CtyNum = "";

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0083");
				ESD008302Message msgCr = (ESD008302Message) mp.getMessageRecord("ESD008302");

				msgCr.setH02USERID(user.getH01USR());
				msgCr.setH02PROGRM("ESD0083");
				msgCr.setH02TIMSYS(getTimeStamp());
				msgCr.setH02SCRCOD("24");
				msgCr.setH02OPECOD("0024");
				userPO.setPurpose("INQUIRY");
				CtyNum = req.getParameter("E02CFACTY") == null ? " " : req.getParameter("E02CFACTY").trim();
				if (!CtyNum.equals(" ")) {
					userPO.setHeader10(CtyNum.trim());
					}
				msgCr.setE02CFACTY(userPO.getHeader10());
				

				// Send Message 
				mp.sendMessage(msgCr);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0083_client_param_crs_2.jsp", req, res);
					} else {
						// Receive Data
						ses.setAttribute("client", newmessage);
						forward("ESD0083_client_param_crs_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procCrsCtyDel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String CtyNum = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0083");
				ESD008302Message msgCr = (ESD008302Message) mp.getMessageRecord("ESD008302");

				msgCr.setH02USERID(user.getH01USR());
				msgCr.setH02PROGRM("ESD0083");
				msgCr.setH02TIMSYS(getTimeStamp());
				msgCr.setH02SCRCOD("25");
				msgCr.setH02OPECOD("0025");
				userPO.setPurpose("DELETE");
				CtyNum = req.getParameter("E02CFACTY") == null ? " " : req.getParameter("E02CFACTY").trim();
				if (!CtyNum.equals(" ")) {
					userPO.setHeader10(CtyNum.trim());
					}
				msgCr.setE02CFACTY(userPO.getHeader10());

				// Send Message 
				mp.sendMessage(msgCr);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0083_client_param_crs_2.jsp", req, res);
					} else {

						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.client.JSESD0085?SCREEN=200");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

}

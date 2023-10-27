package datapro.eibs.params;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

import datapro.eibs.beans.DataTransaction;
import datapro.eibs.beans.ECN000601Message;
import datapro.eibs.beans.ECN000701Message;
import datapro.eibs.beans.ECN000703Message;
import datapro.eibs.beans.ECN000801Message;
import datapro.eibs.beans.ECN000901Message;
import datapro.eibs.beans.ECN000903Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelResultSet;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.services.ExcelXLSXResultSet;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSECN0000A extends JSEIBSServlet {

	private ServletConfig config = null;
	
	protected static final int A_CARGA_FILE_REN = 1;
	protected static final int A_CARGA_FILE_PIZ = 2;
	protected static final int A_APPROVAL_GRAL = 3;
	protected static final int A_REJECTED_GRAL = 4;
	protected static final int A_INQUIRY_GRAL = 5;	
	protected static final int A_MAINT_FILE_GRAL = 10;
	protected static final int A_MAINT_FILE_LIST = 20;
	protected static final int A_CARGA_FILE_ESP = 31;
	protected static final int A_APPROVAL_ESP = 33;
	protected static final int A_REJECTED_ESP = 34;
	protected static final int A_INQUIRY_ESP = 35;	
	protected static final int A_MAINT_FILE_ESP= 40;
	protected static final int A_MAINT_FILE_LIST_ESP = 50;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen){
		case A_CARGA_FILE_REN :
			procActionCargaFil_REN(user, req, res, session);
			break;
		case A_CARGA_FILE_PIZ :
			procActionCargaFil_PIZ(user, req, res, session);
			break;
		case A_APPROVAL_GRAL:
			procActionCarga_Approval(user, req, res, session);
			break;
		case A_REJECTED_GRAL :
			procActionCarga_Rejected(user, req, res, session);
			break;
		case A_INQUIRY_GRAL:
			procActionCarga_Inquiry(user, req, res, session);
			break;
		case A_MAINT_FILE_GRAL :
			procActionMaintFil_GRA(user, req, res, session);
			break;
		case A_MAINT_FILE_LIST :
			procActionMaintFil_LIST(user, req, res, session);
			break;
		case A_CARGA_FILE_ESP :
			procActionCargaFil_ESP(user, req, res, session);
			break;
		case A_MAINT_FILE_ESP :
			procActionCargaFil_ESP_GRA(user, req, res, session);
			break;
		case A_APPROVAL_ESP:
			procActionCarga_Approval_ESP(user, req, res, session);
			break;
		case A_REJECTED_ESP :
			procActionCarga_Rejected_ESP(user, req, res, session);
			break;
		case A_INQUIRY_ESP:
			procActionCarga_Inquiry_ESP(user, req, res, session);
			break;
		case A_MAINT_FILE_LIST_ESP :
			procActionMaintFil_LIST_ESP(user, req, res, session);
			break;

		default :
				forward(devPage, req, res);
				break;
		}
	}


	protected void procActionCargaFil_REN(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			ELEERRMessage msgError = null;
			UserPos userPO = null;

			try {

				msgError = new datapro.eibs.beans.ELEERRMessage();
				userPO = new datapro.eibs.beans.UserPos();
				userPO.setOption("RE");
				userPO.setPurpose("");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			forward("ECN0006_rate_table_mass.jsp", req, res);
			
		}

	protected void procActionCargaFil_PIZ(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			ELEERRMessage msgError = null;
			UserPos userPO = null;

			try {

				msgError = new datapro.eibs.beans.ELEERRMessage();
				userPO = new datapro.eibs.beans.UserPos();
				userPO.setOption("PI");
				userPO.setPurpose("");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			forward("ECN0006_rate_table_mass.jsp", req, res);
			
		}

	protected void procActionCarga_Approval(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

	MessageProcessor mp = null;
	MessageRecord newmessage = null;
	UserPos userPO = null;

	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	
	// Send data
	try {
		mp = new MessageProcessor("ECN0007");
		ECN000701Message msgRT = (ECN000701Message) mp.getMessageRecord("ECN000701");

		msgRT.setH71USERID(user.getH01USR());
		msgRT.setH71PROGRM("ECN0007");
		msgRT.setH71TIMSYS(getTimeStamp());
		msgRT.setH71SCRCOD("01");
		msgRT.setH71OPECOD("0002");

		try {
			msgRT.setE71CDRRTB(req.getParameter("E71CDRRTB"));
		} catch (Exception e) {
			msgRT.setE71CDRRTB(" ");
		}

		try {
			msgRT.setE71CDRSFL(req.getParameter("E71CDRSFL"));
		} catch (Exception e) {
			msgRT.setE71CDRSFL(" ");
		}

		try {
			msgRT.setE71CDRCCY(req.getParameter("E71CDRCCY"));
		} catch (Exception e) {
			msgRT.setE71CDRCCY(" ");
		}

		try {
			msgRT.setE71CDRDTM(req.getParameter("E71CDRDTM"));
		} catch (Exception e) {
			msgRT.setE71CDRDTM("0");
		}

		try {
			msgRT.setE71CDRDTD(req.getParameter("E71CDRDTD"));
		} catch (Exception e) {
			msgRT.setE71CDRDTD("0");
		}

		try {
			msgRT.setE71CDRDTY(req.getParameter("E71CDRDTY"));
		} catch (Exception e) {
			msgRT.setE71CDRDTY("0");
		}

		// Send Message 
		mp.sendMessage(msgRT);

		// Receive Error Message or Data Message (Optional)
		ses.setAttribute("userPO", userPO);
		if (mp.hasError(newmessage)) {
			ses.setAttribute("error", newmessage);
				forward("ECN0007_rate_approval_list.jsp", req, res);
			} else {
				// Receive Data
				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSECN0000A?SCREEN=20");
			}

		
	} finally {
		if (mp != null) 
			mp.close();
	}
}

	protected void procActionCarga_Rejected(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

	MessageProcessor mp = null;
	MessageRecord newmessage = null;
	UserPos userPO = null;

	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	
	// Send data
	try {
		mp = new MessageProcessor("ECN0007");
		ECN000701Message msgRT = (ECN000701Message) mp.getMessageRecord("ECN000701");

		msgRT.setH71USERID(user.getH01USR());
		msgRT.setH71PROGRM("ECN0007");
		msgRT.setH71TIMSYS(getTimeStamp());
		msgRT.setH71SCRCOD("01");
		msgRT.setH71OPECOD("0003");

		try {
			msgRT.setE71CDRRTB(req.getParameter("E71CDRRTB"));
		} catch (Exception e) {
			msgRT.setE71CDRRTB(" ");
		}

		try {
			msgRT.setE71CDRSFL(req.getParameter("E71CDRSFL"));
		} catch (Exception e) {
			msgRT.setE71CDRSFL(" ");
		}

		try {
			msgRT.setE71CDRCCY(req.getParameter("E71CDRCCY"));
		} catch (Exception e) {
			msgRT.setE71CDRCCY(" ");
		}

		try {
			msgRT.setE71CDRDTM(req.getParameter("E71CDRDTM"));
		} catch (Exception e) {
			msgRT.setE71CDRDTM("0");
		}

		try {
			msgRT.setE71CDRDTD(req.getParameter("E71CDRDTD"));
		} catch (Exception e) {
			msgRT.setE71CDRDTD("0");
		}

		try {
			msgRT.setE71CDRDTY(req.getParameter("E71CDRDTY"));
		} catch (Exception e) {
			msgRT.setE71CDRDTY("0");
		}

		// Send Message 
		mp.sendMessage(msgRT);

		// Receive Error Message or Data Message (Optional)
		ses.setAttribute("userPO", userPO);
		if (mp.hasError(newmessage)) {
			ses.setAttribute("error", newmessage);
				forward("ECN0007_rate_approval_list.jsp", req, res);
			} else {
				// Receive Data
				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSECN0000A?SCREEN=20");
			}

		
	} finally {
		if (mp != null) 
			mp.close();
	}
}
	
	protected void procActionCarga_Inquiry(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

	MessageProcessor mp = null;
	MessageRecord newmessage = null;
	UserPos userPO = null;

	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	userPO.setPurpose("READONLY");
	
	// Send data
	try {
		mp = new MessageProcessor("ECN0007");
		ECN000703Message msgRT = (ECN000703Message) mp.getMessageRecord("ECN000703");

		msgRT.setH73USERID(user.getH01USR());
		msgRT.setH73PROGRM("ECN0007");
		msgRT.setH73TIMSYS(getTimeStamp());
		msgRT.setH73SCRCOD("01");
		msgRT.setH73OPECOD("0004");

		try {
			msgRT.setE73CDRRTB(req.getParameter("E71CDRRTB"));
		} catch (Exception e) {
			msgRT.setE73CDRRTB(" ");
		}

		try {
			msgRT.setE73CDRSFL(req.getParameter("E71CDRSFL"));
		} catch (Exception e) {
			msgRT.setE73CDRSFL(" ");
		}

		try {
			msgRT.setE73CDRCCY(req.getParameter("E71CDRCCY"));
		} catch (Exception e) {
			msgRT.setE73CDRCCY(" ");
		}

		try {
			msgRT.setE73CDRDT1(req.getParameter("E71CDRDTM"));
		} catch (Exception e) {
			msgRT.setE73CDRDT1("0");
		}

		try {
			msgRT.setE73CDRDT2(req.getParameter("E71CDRDTD"));
		} catch (Exception e) {
			msgRT.setE73CDRDT2("0");
		}

		try {
			msgRT.setE73CDRDT3(req.getParameter("E71CDRDTY"));
		} catch (Exception e) {
			msgRT.setE73CDRDT3("0");
		}

		// Send Message 
		mp.sendMessage(msgRT);
		newmessage = mp.receiveMessageRecord();
		// Receive Error Message or Data Message (Optional)
		ses.setAttribute("userPO", userPO);
		if (mp.hasError(newmessage)) {
			ses.setAttribute("error", newmessage);
				forward("ECN0007_rate_approval_list.jsp", req, res);
			} else {
				// Receive Data
				ses.setAttribute("tbRate", newmessage);
				forward("ECN0007_rate_table_inquiry.jsp", req, res);
			}

		
	} finally {
		if (mp != null) 
			mp.close();
	}
}
	
	
	private void procActionMaintFil_GRA(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		int colNum = 121;
		ResultSet rs = null;
		JBListRec pmntList = new JBListRec();
		pmntList.init(colNum);
		UserPos userPO = getUserPos(session);
		
		try {
			
			String myRow[] = new String[colNum];
			for (int i = 0; i < colNum; i++) {
				myRow[i] = "";
			}			
			
			SmartUpload mySmartUpload = new SmartUpload();
			mySmartUpload.initialize(config, req, res);
			mySmartUpload.upload();
			com.jspsmart.upload.File file =  mySmartUpload.getFiles().getFile(0);
			
			InputStream xls = Util.getStreamFromFile(file);													
		
			if (ExcelUtils.isXLSXVersion(file.getFilePathName())) {
				rs = new ExcelXLSXResultSet(xls, 0);
				((ExcelXLSXResultSet)rs).init();
			} else {
				rs = new ExcelResultSet(xls, 0);
				((ExcelResultSet)rs).init();
			}
			
			while (rs.next()) {
				
				for (int i = 0; i < colNum; i++) {				
					myRow[i] = rs.getString(i);
				}

				pmntList.addRow("", myRow);

			}

			ECN000601Message msgPmnt = null;
		    MessageProcessor mpPmnt = null;
			MessageRecord newmessage = null;
			mpPmnt = getMessageProcessor("ECN0006", req);
			msgPmnt = (ECN000601Message) mpPmnt.getMessageRecord("ECN000601");

			   
			if (pmntList != null) {
		
					pmntList.initRow();

				    while (pmntList.getNextRow()) {

				     msgPmnt.setH61USERID(user.getH01USR());
				     msgPmnt.setH61PROGRM("ECN0006");
				     msgPmnt.setH61TIMSYS(getTimeStamp());
				     msgPmnt.setH61SCRCOD(userPO.getOption());
				     msgPmnt.setH61OPECOD("0001");
				     msgPmnt.setH61FLGMAS("");

					try {
						 msgPmnt.setE61CDRRTB(pmntList.getRecord(0) == null ? "" : pmntList.getRecord(0).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRRTB(" ");
						}

					try {
						 msgPmnt.setE61CDRCCY(pmntList.getRecord(1) == null ? "" : pmntList.getRecord(1).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRCCY(" ");
						}
						
					try {
						 msgPmnt.setE61CDRSFL(pmntList.getRecord(2) == null ? "" : pmntList.getRecord(2).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRSFL(" ");
						}
						
					try {
						 msgPmnt.setE61CDRDTM(pmntList.getRecord(3) == null ? "" : pmntList.getRecord(3).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRDTM("0");
						}
						
					try {
						 msgPmnt.setE61CDRDTD(pmntList.getRecord(4) == null ? "" : pmntList.getRecord(4).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRDTD("0");
						}
						
					try {
						msgPmnt.setE61CDRDTY(pmntList.getRecord(5) == null ? "" : pmntList.getRecord(5).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRDTY("0");
						}
						
					try {
						msgPmnt.setE61CDRDSC(pmntList.getRecord(6) == null ? "" : pmntList.getRecord(6).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRDSC(" ");
						}
						
					try {
						msgPmnt.setE61CDRRAT(pmntList.getRecord(7) == null ? "" : pmntList.getRecord(7).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRRAT(" ");
						}
						
					try {
						msgPmnt.setE61CDRMIR(pmntList.getRecord(8) == null ? "" : pmntList.getRecord(8).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRMIR("0");
						}
						
					try {
						msgPmnt.setE61CDRMXR(pmntList.getRecord(9) == null ? "" : pmntList.getRecord(9).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRMXR("0");
						}
					
					try {
						msgPmnt.setE61CDRDPE(pmntList.getRecord(10) == null ? "" : pmntList.getRecord(10).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRDPE("0");
						}
						
						
					try {
						msgPmnt.setE61CDRPRT(pmntList.getRecord(11) == null ? "" : pmntList.getRecord(11).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRPRT("0");
						}

					try {
						msgPmnt.setE61CDRBAS(pmntList.getRecord(12) == null ? "" : pmntList.getRecord(12).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRBAS("0");
						}
						
					try {
						msgPmnt.setE61CDRBSE(pmntList.getRecord(13) == null ? "" : pmntList.getRecord(13).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRBSE("0");
						}
						
					try {
						msgPmnt.setE61CDRFTB(pmntList.getRecord(14) == null ? "" : pmntList.getRecord(14).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRFTB(" ");
						}
						
					try {
						msgPmnt.setE61CDRFTY(pmntList.getRecord(15) == null ? "" : pmntList.getRecord(15).trim());
						} catch (Exception e) {
							msgPmnt.setE61CDRFTY(" ");
						}

					java.util.Enumeration enu = msgPmnt.fieldEnumeration();
					MessageField field = null;
					String fieldName = "";
					int sub = 0;
					int ind = 0;
					String value = null;		

					while (enu.hasMoreElements()) {
					   field = (MessageField) enu.nextElement();
					   try {
							if (field.getTag().substring(0,4).equals("E61C")) {
								sub = Util.parseInt(field.getTag().substring(4,5));
								ind = Util.parseInt(field.getTag().substring(5));
								if (sub > 0 && ind > 0) { 
									value = pmntList.getRecord(ind+15);
									if (value != null) {
										try {
											field.setString(value);
										} catch (Exception e) {
											field.setString("0");
										}
									}
								}
							}
					   } catch (Exception e) {
					   }

					}											
										
					mpPmnt.sendMessage(msgPmnt);

				    }
				     
				     msgPmnt.setH61USERID(user.getH01USR());
				     msgPmnt.setH61PROGRM("ECN0006");
				     msgPmnt.setH61TIMSYS(getTimeStamp());
				     msgPmnt.setH61SCRCOD(userPO.getOption());
				     msgPmnt.setH61OPECOD("0001");
				     msgPmnt.setH61FLGMAS("*");
				    
			    

				    mpPmnt.sendMessage(msgPmnt);

				   }

			   ELEERRMessage msgError = (ELEERRMessage) mpPmnt.receiveMessageRecord("ELEERR");
			   //newmessage = mpPmnt.receiveMessageRecord();
	
			
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			forward("ECN0006_rate_table_mass_confirm.jsp", req, res);
		}

	}
	
	protected void procActionMaintFil_LIST(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String searchType = "";

			try {
				mp = new MessageProcessor("ECN0007");
				ECN000701Message msgRT = (ECN000701Message) mp.getMessageRecord("ECN000701");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH71USERID(user.getH01USR());
				msgRT.setH71PROGRM("ECN0007");
				msgRT.setH71TIMSYS(getTimeStamp());
				msgRT.setH71SCRCOD("01");
				msgRT.setH71OPECOD("0001");


				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E71CDRIND","E71CDRNUM");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ECN000701List", list);
				}
				forward("ECN0007_rate_approval_list.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}

	protected void procActionCargaFil_ESP(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			ELEERRMessage msgError = null;
			UserPos userPO = null;

			try {

				msgError = new datapro.eibs.beans.ELEERRMessage();
				userPO = new datapro.eibs.beans.UserPos();
				userPO.setOption("ES");
				userPO.setPurpose("");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			forward("ECN0008_rate_table_mass.jsp", req, res);
			
		}

	private void procActionCargaFil_ESP_GRA(
			ESS0030DSMessage user,
			HttpServletRequest req, 
			HttpServletResponse res, 
			HttpSession session) throws IOException, ServletException {
		
		int colNum = 40;
		ResultSet rs = null;
		JBListRec pmntList = new JBListRec();
		pmntList.init(colNum);
		UserPos userPO = getUserPos(session);
		
		try {
			
			String myRow[] = new String[colNum];
			for (int i = 0; i < colNum; i++) {
				myRow[i] = "";
			}			
			
			SmartUpload mySmartUpload = new SmartUpload();
			mySmartUpload.initialize(config, req, res);
			mySmartUpload.upload();
			com.jspsmart.upload.File file =  mySmartUpload.getFiles().getFile(0);
			
			InputStream xls = Util.getStreamFromFile(file);													
		
			if (ExcelUtils.isXLSXVersion(file.getFilePathName())) {
				rs = new ExcelXLSXResultSet(xls, 0);
				((ExcelXLSXResultSet)rs).init();
			} else {
				rs = new ExcelResultSet(xls, 0);
				((ExcelResultSet)rs).init();
			}
			
			while (rs.next()) {
				
				for (int i = 0; i < colNum; i++) {				
					myRow[i] = rs.getString(i);
				}

				pmntList.addRow("", myRow);

			}

			ECN000801Message msgPmnt = null;
		    MessageProcessor mpPmnt = null;
			MessageRecord newmessage = null;
			mpPmnt = getMessageProcessor("ECN0008", req);
			msgPmnt = (ECN000801Message) mpPmnt.getMessageRecord("ECN000801");

			   
			if (pmntList != null) {
		
					pmntList.initRow();

				    while (pmntList.getNextRow()) {

				     msgPmnt.setH81USERID(user.getH01USR());
				     msgPmnt.setH81PROGRM("ECN0008");
				     msgPmnt.setH81TIMSYS(getTimeStamp());
				     msgPmnt.setH81SCRCOD(userPO.getOption());
				     msgPmnt.setH81OPECOD("0001");
				     msgPmnt.setH81FLGMAS("");


						try {
							 msgPmnt.setE81RTEATY(pmntList.getRecord(0) == null ? "" : pmntList.getRecord(0).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEATY(" ");
							}

						try {
							 msgPmnt.setE81RTETID(pmntList.getRecord(1) == null ? "" : pmntList.getRecord(1).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTETID(" ");
							}

						try {
							 msgPmnt.setE81RTEIDN(pmntList.getRecord(2) == null ? "" : pmntList.getRecord(2).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEIDN(" ");
							}
							
						try {
							 msgPmnt.setE81RTEACC(pmntList.getRecord(3) == null ? "" : pmntList.getRecord(3).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEACC("0");
							}
							
						try {
							 msgPmnt.setE81RTEOPM(pmntList.getRecord(4) == null ? "" : pmntList.getRecord(4).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEOPM("0");
							}
							
						try {
							 msgPmnt.setE81RTEOPD(pmntList.getRecord(5) == null ? "" : pmntList.getRecord(5).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEOPD("0");
							}
							
						try {
							msgPmnt.setE81RTEOPY(pmntList.getRecord(6) == null ? "" : pmntList.getRecord(6).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEOPY("0");
							}

						try {
							 msgPmnt.setE81RTEMAM(pmntList.getRecord(7) == null ? "" : pmntList.getRecord(7).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEMAM("0");
							}
							
						try {
							 msgPmnt.setE81RTEMAD(pmntList.getRecord(8) == null ? "" : pmntList.getRecord(8).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEMAD("0");
							}
							
						try {
							msgPmnt.setE81RTEMAY(pmntList.getRecord(9) == null ? "" : pmntList.getRecord(9).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEMAY("0");
							}
						
						try {
							msgPmnt.setE81C1001(pmntList.getRecord(10) == null ? "" : pmntList.getRecord(10).trim());
							} catch (Exception e) {
								msgPmnt.setE81C1001("0");
							}
							
						try {
							msgPmnt.setE81C2001(pmntList.getRecord(11) == null ? "" : pmntList.getRecord(11).trim());
							} catch (Exception e) {
								msgPmnt.setE81C2001("0");
							}
							
						try {
							msgPmnt.setE81C1002(pmntList.getRecord(12) == null ? "" : pmntList.getRecord(12).trim());
							} catch (Exception e) {
								msgPmnt.setE81C1002("0");
							}
							
						try {
							msgPmnt.setE81C2002(pmntList.getRecord(13) == null ? "" : pmntList.getRecord(13).trim());
							} catch (Exception e) {
								msgPmnt.setE81C2002("0");
							}
					
						try {
							msgPmnt.setE81C1003(pmntList.getRecord(14) == null ? "" : pmntList.getRecord(14).trim());
							} catch (Exception e) {
								msgPmnt.setE81C1003("0");
							}
							
						try {
							msgPmnt.setE81C2003(pmntList.getRecord(15) == null ? "" : pmntList.getRecord(15).trim());
							} catch (Exception e) {
								msgPmnt.setE81C2003("0");
							}
							
						try {
							msgPmnt.setE81C1004(pmntList.getRecord(16) == null ? "" : pmntList.getRecord(16).trim());
							} catch (Exception e) {
								msgPmnt.setE81C1004("0");
							}
						
						try {
							msgPmnt.setE81C2004(pmntList.getRecord(17) == null ? "" : pmntList.getRecord(17).trim());
							} catch (Exception e) {
								msgPmnt.setE81C2004("0");
							}
										
						try {
							msgPmnt.setE81C1005(pmntList.getRecord(18) == null ? "" : pmntList.getRecord(18).trim());
							} catch (Exception e) {
								msgPmnt.setE81C1005("0");
							}
							
						try {
							msgPmnt.setE81C2005(pmntList.getRecord(19) == null ? "" : pmntList.getRecord(19).trim());
							} catch (Exception e) {
								msgPmnt.setE81C2005("0");
							}
							
						try {
							msgPmnt.setE81C1006(pmntList.getRecord(20) == null ? "" : pmntList.getRecord(20).trim());
							} catch (Exception e) {
								msgPmnt.setE81C1006("0");
							}
							
						try {
							msgPmnt.setE81C2006(pmntList.getRecord(21) == null ? "" : pmntList.getRecord(21).trim());
							} catch (Exception e) {
								msgPmnt.setE81C2006("0");
							}
					
						try {
							msgPmnt.setE81C1007(pmntList.getRecord(22) == null ? "" : pmntList.getRecord(22).trim());
							} catch (Exception e) {
								msgPmnt.setE81C1007("0");
							}
							
						try {
							msgPmnt.setE81C2007(pmntList.getRecord(23) == null ? "" : pmntList.getRecord(23).trim());
							} catch (Exception e) {
								msgPmnt.setE81C2007("0");
							}
							
						try {
							msgPmnt.setE81C1008(pmntList.getRecord(24) == null ? "" : pmntList.getRecord(24).trim());
							} catch (Exception e) {
								msgPmnt.setE81C1008("0");
							}
						
						try {
							msgPmnt.setE81C2008(pmntList.getRecord(25) == null ? "" : pmntList.getRecord(25).trim());
							} catch (Exception e) {
								msgPmnt.setE81C2008("0");
							}

						try {
							msgPmnt.setE81C1009(pmntList.getRecord(26) == null ? "" : pmntList.getRecord(26).trim());
							} catch (Exception e) {
								msgPmnt.setE81C1009("0");
							}
							
						try {
							msgPmnt.setE81C2009(pmntList.getRecord(27) == null ? "" : pmntList.getRecord(27).trim());
							} catch (Exception e) {
								msgPmnt.setE81C2009("0");
							}
							
						try {
							msgPmnt.setE81C1010(pmntList.getRecord(28) == null ? "" : pmntList.getRecord(28).trim());
							} catch (Exception e) {
								msgPmnt.setE81C1010("0");
							}
							
						try {
							msgPmnt.setE81C2010(pmntList.getRecord(29) == null ? "" : pmntList.getRecord(29).trim());
							} catch (Exception e) {
								msgPmnt.setE81C2010("0");
							}
					
						try {
							msgPmnt.setE81C1011(pmntList.getRecord(30) == null ? "" : pmntList.getRecord(30).trim());
							} catch (Exception e) {
								msgPmnt.setE81C1011("0");
							}
							
						try {
							msgPmnt.setE81C2011(pmntList.getRecord(31) == null ? "" : pmntList.getRecord(31).trim());
							} catch (Exception e) {
								msgPmnt.setE81C2011("0");
							}
							
						try {
							msgPmnt.setE81C1012(pmntList.getRecord(32) == null ? "" : pmntList.getRecord(32).trim());
							} catch (Exception e) {
								msgPmnt.setE81C1012("0");
							}
						
						try {
							msgPmnt.setE81C2012(pmntList.getRecord(33) == null ? "" : pmntList.getRecord(33).trim());
							} catch (Exception e) {
								msgPmnt.setE81C2012("0");
							}
							
						try {
							msgPmnt.setE81RTEFTL(pmntList.getRecord(34) == null ? "" : pmntList.getRecord(34).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEFTL(" ");
							}
							
						try {
							msgPmnt.setE81RTEFYL(pmntList.getRecord(35) == null ? "" : pmntList.getRecord(35).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEFYL(" ");
							}
						
						try {
							msgPmnt.setE81RTEFCL(pmntList.getRecord(36) == null ? "" : pmntList.getRecord(36).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEFCL("0");
							}
							
							
						try {
							msgPmnt.setE81RTEFFL(pmntList.getRecord(37) == null ? "" : pmntList.getRecord(37).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEFFL(" ");
							}

						try {
							msgPmnt.setE81RTEDBC(pmntList.getRecord(38) == null ? "" : pmntList.getRecord(38).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEDBC(" ");
							}
							
						try {
							msgPmnt.setE81RTEBTY(pmntList.getRecord(39) == null ? "" : pmntList.getRecord(39).trim());
							} catch (Exception e) {
								msgPmnt.setE81RTEBTY(" ");
							}
										
					mpPmnt.sendMessage(msgPmnt);

				    }
				     
				     msgPmnt.setH81USERID(user.getH01USR());
				     msgPmnt.setH81PROGRM("ECN0008");
				     msgPmnt.setH81TIMSYS(getTimeStamp());
				     msgPmnt.setH81SCRCOD(userPO.getOption());
				     msgPmnt.setH81OPECOD("0001");
				     msgPmnt.setH81FLGMAS("*");

				    mpPmnt.sendMessage(msgPmnt);

				   }

			   ELEERRMessage msgError = (ELEERRMessage) mpPmnt.receiveMessageRecord("ELEERR");

	
			
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			forward("ECN0008_rate_table_mass_confirm.jsp", req, res);
		}

	}
	
	protected void procActionCarga_Approval_ESP(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

	MessageProcessor mp = null;
	MessageRecord newmessage = null;
	UserPos userPO = null;

	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	
	// Send data
	try {
		mp = new MessageProcessor("ECN0009");
		ECN000901Message msgRT = (ECN000901Message) mp.getMessageRecord("ECN000901");

		msgRT.setH91USERID(user.getH01USR());
		msgRT.setH91PROGRM("ECN0009");
		msgRT.setH91TIMSYS(getTimeStamp());
		msgRT.setH91SCRCOD("01");
		msgRT.setH91OPECOD("0002");

		try {
			msgRT.setE91RTEACC(req.getParameter("E91RTEACC"));
		} catch (Exception e) {
			msgRT.setE91RTEACC("0");
		}

		try {
			msgRT.setE91RTEBNK(req.getParameter("E91RTEBNK"));
		} catch (Exception e) {
			msgRT.setE91RTEBNK(" ");
		}

		try {
			msgRT.setE91RTEATY(req.getParameter("E91RTEATY"));
		} catch (Exception e) {
			msgRT.setE91RTEATY(" ");
		}

		try {
			msgRT.setE91RTEBLN(req.getParameter("E91RTEBLN"));
		} catch (Exception e) {
			msgRT.setE91RTEBLN(" ");
		}

		try {
			msgRT.setE91RTECUN(req.getParameter("E91RTECUN"));
		} catch (Exception e) {
			msgRT.setE91RTECUN("0");
		}

		// Send Message 
		mp.sendMessage(msgRT);

		// Receive Error Message or Data Message (Optional)
		ses.setAttribute("userPO", userPO);
		if (mp.hasError(newmessage)) {
			ses.setAttribute("error", newmessage);
				forward("ECN0008_rate_approval_list.jsp", req, res);
			} else {
				// Receive Data
				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSECN0000A?SCREEN=50");
			}

		
	} finally {
		if (mp != null) 
			mp.close();
	}
}

	protected void procActionCarga_Rejected_ESP(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

	MessageProcessor mp = null;
	MessageRecord newmessage = null;
	UserPos userPO = null;

	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	
	// Send data
	try {
		mp = new MessageProcessor("ECN0009");
		ECN000901Message msgRT = (ECN000901Message) mp.getMessageRecord("ECN000901");

		msgRT.setH91USERID(user.getH01USR());
		msgRT.setH91PROGRM("ECN0009");
		msgRT.setH91TIMSYS(getTimeStamp());
		msgRT.setH91SCRCOD("01");
		msgRT.setH91OPECOD("0003");

		try {
			msgRT.setE91RTEACC(req.getParameter("E91RTEACC"));
		} catch (Exception e) {
			msgRT.setE91RTEACC("0");
		}

		try {
			msgRT.setE91RTEBNK(req.getParameter("E91RTEBNK"));
		} catch (Exception e) {
			msgRT.setE91RTEBNK(" ");
		}

		try {
			msgRT.setE91RTEATY(req.getParameter("E91RTEATY"));
		} catch (Exception e) {
			msgRT.setE91RTEATY(" ");
		}

		try {
			msgRT.setE91RTEBLN(req.getParameter("E91RTEBLN"));
		} catch (Exception e) {
			msgRT.setE91RTEBLN(" ");
		}

		try {
			msgRT.setE91RTECUN(req.getParameter("E91RTECUN"));
		} catch (Exception e) {
			msgRT.setE91RTECUN("0");
		}

		// Send Message 
		mp.sendMessage(msgRT);

		// Receive Error Message or Data Message (Optional)
		ses.setAttribute("userPO", userPO);
		if (mp.hasError(newmessage)) {
			ses.setAttribute("error", newmessage);
				forward("ECN0009_rate_approval_list.jsp", req, res);
			} else {
				// Receive Data
				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSECN0000A?SCREEN=50");
			}

		
	} finally {
		if (mp != null) 
			mp.close();
	}
}
	
	protected void procActionCarga_Inquiry_ESP(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

	MessageProcessor mp = null;
	MessageRecord newmessage = null;
	UserPos userPO = null;

	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	userPO.setPurpose("READONLY");
	
	// Send data
	try {
		mp = new MessageProcessor("ECN0009");
		ECN000903Message msgRT = (ECN000903Message) mp.getMessageRecord("ECN000903");

		msgRT.setH93USERID(user.getH01USR());
		msgRT.setH93PROGRM("ECN0009");
		msgRT.setH93TIMSYS(getTimeStamp());
		msgRT.setH93SCRCOD("01");
		msgRT.setH93OPECOD("0004");
		try {
			msgRT.setE93RTEACC(req.getParameter("E91RTEACC"));
		} catch (Exception e) {
			msgRT.setE93RTEACC("0");
		}

		try {
			msgRT.setE93RTEBNK(req.getParameter("E91RTEBNK"));
		} catch (Exception e) {
			msgRT.setE93RTEBNK(" ");
		}

		try {
			msgRT.setE93RTEATY(req.getParameter("E91RTEATY"));
		} catch (Exception e) {
			msgRT.setE93RTEATY(" ");
		}

		try {
			msgRT.setE93RTEBLN(req.getParameter("E91RTEBLN"));
		} catch (Exception e) {
			msgRT.setE93RTEBLN(" ");
		}

		try {
			msgRT.setE93RTECUN(req.getParameter("E91RTECUN"));
		} catch (Exception e) {
			msgRT.setE93RTECUN("0");
		}

		// Send Message 
		mp.sendMessage(msgRT);
		newmessage = mp.receiveMessageRecord();
		// Receive Error Message or Data Message (Optional)
		ses.setAttribute("userPO", userPO);
		if (mp.hasError(newmessage)) {
			ses.setAttribute("error", newmessage);
				forward("ECN0009_rate_approval_list.jsp", req, res);
			} else {
				// Receive Data
				ses.setAttribute("charges", newmessage);
				forward("ECN0009_rate_table_account_inquiry.jsp", req, res);
			}

		
	} finally {
		if (mp != null) 
			mp.close();
	}
}
	
	protected void procActionMaintFil_LIST_ESP(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String searchType = "";

			try {
				mp = new MessageProcessor("ECN0009");
				ECN000901Message msgRT = (ECN000901Message) mp.getMessageRecord("ECN000901");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH91USERID(user.getH01USR());
				msgRT.setH91PROGRM("ECN0009");
				msgRT.setH91TIMSYS(getTimeStamp());
				msgRT.setH91SCRCOD("01");
				msgRT.setH91OPECOD("0001");


				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E91RTEIND","E91RTENUM");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ECN000901List", list);
				}
				forward("ECN0009_rate_approval_list.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}

	
	
	
}



package datapro.eibs.alerts;


import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD005101Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelResultSet;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.services.ExcelXLSXResultSet;
import datapro.eibs.sockets.MessageRecord;

public class JSESD0051 extends JSEIBSServlet {

	private ServletConfig config = null;
	
	protected static final int A_CARGA_FILE_SP = 4;
	protected static final int A_MAINT_FILE_SP = 5;	

	
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen){
		case A_CARGA_FILE_SP :
			procActionCargaFil_SP(user, req, res, session);
			break;
		case A_MAINT_FILE_SP :
			procActionMaintFil_SP(user, req, res, session);
			break;

		default :
				forward(devPage, req, res);
				break;
		}
	}

		
	protected void procActionCargaFil_SP(
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
				userPO.setOption("SP");
				userPO.setPurpose("");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			forward("ESD0051_rt_alert_messages_mass.jsp", req, res);
			
		}

	private void procActionMaintFil_SP(
			ESS0030DSMessage user,
			HttpServletRequest req, 
			HttpServletResponse res, 
			HttpSession session) 
	        throws IOException, ServletException {
		
		int colNum = 19;
		ResultSet rs = null;
		JBListRec pmntList = new JBListRec();
		pmntList.init(colNum);
		UserPos userPO = getUserPos(req);
		
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

			ESD005101Message msgPmnt = null;
			  MessageProcessor mpPmnt = null;
			  MessageRecord newmessage = null;
			   mpPmnt = getMessageProcessor("ESD0051", req);
			   msgPmnt = (ESD005101Message) mpPmnt.getMessageRecord("ESD005101");

			if (pmntList != null) {
				    pmntList.initRow();

				    while (pmntList.getNextRow()) {

				     msgPmnt.setH51USR(user.getH01USR());
				     msgPmnt.setH51PGM("ESD0051");
				     msgPmnt.setH51TIM(getTimeStamp());
				     msgPmnt.setH51SCR(userPO.getOption());
				     msgPmnt.setH51OPE("0001");
				     msgPmnt.setH51WK1("");

					try {
						 msgPmnt.setE51TYP(pmntList.getRecord(0) == null ? "" : pmntList.getRecord(0).trim());
						} catch (Exception e) {
							msgPmnt.setE51TYP(" ");
						}

					try {
						 msgPmnt.setE51CDE(pmntList.getRecord(1) == null ? "" : pmntList.getRecord(1).trim());						
						} catch (Exception e) {
							msgPmnt.setE51CDE(" ");
						}

					try {
					     msgPmnt.setE51ACC(pmntList.getRecord(2) == null ? "" : pmntList.getRecord(2).trim());						
						} catch (Exception e) {
							msgPmnt.setE51ACC("0");
						}

					try {
						msgPmnt.setE51TID(pmntList.getRecord(3) == null ? "" : pmntList.getRecord(3).trim());						
						} catch (Exception e) {
							msgPmnt.setE51TID(" ");
						}

					try {
						msgPmnt.setE51IDN(pmntList.getRecord(4) == null ? "" : pmntList.getRecord(4).trim());						
						} catch (Exception e) {
							msgPmnt.setE51IDN(" ");
						}

					try {
						msgPmnt.setE51FVM(pmntList.getRecord(5) == null ? "" : pmntList.getRecord(5).trim());
						} catch (Exception e) {
							msgPmnt.setE51FVM("0");
						}
					
					try {
						msgPmnt.setE51FVD(pmntList.getRecord(6) == null ? "" : pmntList.getRecord(6).trim());
						} catch (Exception e) {
							msgPmnt.setE51FVD("0");
						}
					
					try {
						msgPmnt.setE51FVY(pmntList.getRecord(7) == null ? "" : pmntList.getRecord(7).trim());
						} catch (Exception e) {
							msgPmnt.setE51FVY("0");
						}
				     
					try {
							msgPmnt.setE51MOT(pmntList.getRecord(8) == null ? "" : pmntList.getRecord(8).trim());
						} catch (Exception e) {
							msgPmnt.setE51MOT(" ");
						}
				    
					try {
						     msgPmnt.setE51RES(pmntList.getRecord(9) == null ? "" : pmntList.getRecord(9).trim());
						} catch (Exception e) {
							msgPmnt.setE51RES(" ");
						}

					try {
							msgPmnt.setE511SC(pmntList.getRecord(10) == null ? "" : pmntList.getRecord(10).trim());
						} catch (Exception e) {
							msgPmnt.setE511SC(" ");
						}

					try {
							msgPmnt.setE512SC(pmntList.getRecord(11) == null ? "" : pmntList.getRecord(11).trim());
						} catch (Exception e) {
							msgPmnt.setE512SC(" ");
						}

					try {
							msgPmnt.setE513SC(pmntList.getRecord(12) == null ? "" : pmntList.getRecord(12).trim());
						} catch (Exception e) {
							msgPmnt.setE513SC(" ");
						}

					try {
							msgPmnt.setE514SC(pmntList.getRecord(13) == null ? "" : pmntList.getRecord(13).trim());
						} catch (Exception e) {
							msgPmnt.setE514SC(" ");
						}

					try {
							msgPmnt.setE515SC(pmntList.getRecord(14) == null ? "" : pmntList.getRecord(14).trim());
						} catch (Exception e) {
							msgPmnt.setE515SC(" ");
						}

					try {
							msgPmnt.setE516SC(pmntList.getRecord(15) == null ? "" : pmntList.getRecord(15).trim());
						} catch (Exception e) {
							msgPmnt.setE516SC(" ");
						}

					try {
							msgPmnt.setE517SC(pmntList.getRecord(16) == null ? "" : pmntList.getRecord(16).trim());
						} catch (Exception e) {
							msgPmnt.setE517SC(" ");
						}

					try {
							msgPmnt.setE518SC(pmntList.getRecord(17) == null ? "" : pmntList.getRecord(17).trim());
						} catch (Exception e) {
							msgPmnt.setE518SC(" ");
						}

					try {
							msgPmnt.setE519SC(pmntList.getRecord(18) == null ? "" : pmntList.getRecord(18).trim());
						} catch (Exception e) {
							msgPmnt.setE519SC(" ");
						}

					try {
							msgPmnt.setE510SC(pmntList.getRecord(19) == null ? "" : pmntList.getRecord(19).trim());
						} catch (Exception e) {
							msgPmnt.setE510SC(" ");
						}
						
					mpPmnt.sendMessage(msgPmnt);

				    }
				     
				     msgPmnt.setH51USR(user.getH01USR());
				     msgPmnt.setH51PGM("ESD0051");
				     msgPmnt.setH51TIM(getTimeStamp());
				     msgPmnt.setH51SCR("01");
				     msgPmnt.setH51OPE("0001");
				     msgPmnt.setH51WK1("*");
				     mpPmnt.sendMessage(msgPmnt);

				   }

			   ELEERRMessage msgError = (ELEERRMessage) mpPmnt.receiveMessageRecord("ELEERR");
			   newmessage = mpPmnt.receiveMessageRecord();
	
			
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			forward("ESD0051_rt_alert_messages_confirm.jsp", req, res);
		}

	}


}



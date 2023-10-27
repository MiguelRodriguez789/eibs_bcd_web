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
import datapro.eibs.beans.EDD092601Message;
import datapro.eibs.beans.ESD003101Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD006001Message;
import datapro.eibs.beans.ESD006002Message;
import datapro.eibs.beans.ESD006003Message;
import datapro.eibs.beans.ESD006004Message;
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

public class JSESD0031 extends JSEIBSServlet {

	private ServletConfig config = null;
	

	protected static final int R_CARGA_FILE_CNOFC = 200;
	protected static final int A_CARGA_FILE_CNOFC = 201;
	
	protected static final int A_STATEMENT_INI = 500;
	protected static final int A_STATEMENT_LIST = 501;
	protected static final int A_STATEMENT_NEW = 502;
	protected static final int A_STATEMENT_ADD = 503;
	protected static final int A_STATEMENT_MAN = 504;
	protected static final int A_STATEMENT_INQ = 505;
	protected static final int A_STATEMENT_DEL = 506;
	protected static final int A_PARM_STATEMENT_INI = 600;	
	protected static final int A_PARM_STATEMENT_LIST = 601;
	protected static final int A_PARM_STATEMENT_NEW = 602;
	protected static final int A_PARM_STATEMENT_ADD = 603;
	protected static final int A_PARM_STATEMENT_MAN = 604;
	protected static final int A_PARM_STATEMENT_INQ = 605;
	protected static final int A_PARM_STATEMENT_DEL = 606;
	
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen){
		case R_CARGA_FILE_CNOFC :
			procReqCargaFil_CNOFC(user, req, res, session);
			break;
		case A_CARGA_FILE_CNOFC :
			procActionCargaFil_CNOFC(user, req, res, session);
			break;
        case A_STATEMENT_INI:
			procReqExtraSeleIni(user, req, res, session);
			break;
        case A_STATEMENT_LIST:
			procActExtraMainList(user, req, res, session);
			break;
        case A_STATEMENT_NEW :
        	procActExtraRecNew(user, req, res, session, screen);
			break;
        case A_STATEMENT_ADD :
        	procActExtraRecAdd(user, req, res, session, screen);
			break;
        case A_STATEMENT_MAN :
        	procActExtraRecMan(user, req, res, session, screen);
			break;
        case A_STATEMENT_INQ :
        	procActExtraRecInq(user, req, res, session, screen);
			break;
        case A_STATEMENT_DEL :
        	procActExtraRecDel(user, req, res, session, screen);
			break;
        case A_PARM_STATEMENT_INI :
        	procParBankStaIni(user, req, res, session, screen);
			break;
        case A_PARM_STATEMENT_LIST:
        	procParBankStaList(user, req, res, session, screen);
			break;
        case A_PARM_STATEMENT_NEW :
        	procParBankStaNew(user, req, res, session, screen);
			break;
        case A_PARM_STATEMENT_ADD :
        	procParBankStaAdd(user, req, res, session, screen);
			break;
        case A_PARM_STATEMENT_MAN :
        	procParBankStaMan(user, req, res, session, screen);
			break;
        case A_PARM_STATEMENT_INQ :
        	procParBankStaInq(user, req, res, session, screen);
			break;
        case A_PARM_STATEMENT_DEL :
        	procParBankStaDel(user, req, res, session, screen);
			break;

						
			
		default :
				forward(devPage, req, res);
				break;
		}
	}


	protected void procReqCargaFil_CNOFC(
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
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			forward("ESD0031_charge_mass_cnofc.jsp", req, res);
			
		}

	
	private void procActionCargaFil_CNOFC(
			ESS0030DSMessage user,
			HttpServletRequest req, 
			HttpServletResponse res, 
			HttpSession session) 
	        throws IOException, ServletException {
		
		int colNum = 91;
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

			ESD003101Message msgPmnt = null;
		    MessageProcessor mpPmnt = null;
			MessageRecord newmessage = null;
			mpPmnt = getMessageProcessor("ESD003101", req);
			msgPmnt = (ESD003101Message) mpPmnt.getMessageRecord("ESD003101");

			   
			if (pmntList != null) {
		
					pmntList.initRow();

				    while (pmntList.getNextRow()) {

				     msgPmnt.setH01USERID(user.getH01USR());
				     msgPmnt.setH01PROGRM("ESD0031");
				     msgPmnt.setH01TIMSYS(getTimeStamp());
				     msgPmnt.setH01SCRCOD(userPO.getOption());
				     msgPmnt.setH01OPECOD("0001");
				     msgPmnt.setH01FLGMAS("");

					try {
						 msgPmnt.setE01CNOCFL(pmntList.getRecord(0) == null ? "" : pmntList.getRecord(0).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOCFL(" ");
						}

					try {
						 msgPmnt.setE01CNORCD(pmntList.getRecord(1) == null ? "" : pmntList.getRecord(1).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNORCD(" ");
						}
						
					try {
						 msgPmnt.setE01CNODSC(pmntList.getRecord(2) == null ? "" : pmntList.getRecord(2).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNODSC(" ");
						}
						
					try {
						 msgPmnt.setE01CNOFRP(pmntList.getRecord(3) == null ? "" : pmntList.getRecord(3).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOFRP("0");
						}
						
					try {
						 msgPmnt.setE01CNOCHG(pmntList.getRecord(4) == null ? "" : pmntList.getRecord(4).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOCHG("0");
						}
						
					try {
						msgPmnt.setE01CNODCC(pmntList.getRecord(5) == null ? "" : pmntList.getRecord(5).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNODCC(" ");
						}
						
					try {
						msgPmnt.setE01CNOPAF(pmntList.getRecord(6) == null ? "" : pmntList.getRecord(6).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOPAF(" ");
						}
						
					try {
						msgPmnt.setE01CNOADI(pmntList.getRecord(7) == null ? "" : pmntList.getRecord(7).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOADI(" ");
						}
						
					try {
						msgPmnt.setE01CNOAPC(pmntList.getRecord(8) == null ? "" : pmntList.getRecord(8).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOAPC(" ");
						}
						
					try {
						msgPmnt.setE01CNOCPF(pmntList.getRecord(9) == null ? "" : pmntList.getRecord(9).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOCPF(" ");
						}
					
					try {
						msgPmnt.setE01CNOF01(pmntList.getRecord(10) == null ? "" : pmntList.getRecord(10).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOF01(" ");
						}
						
						
					try {
						msgPmnt.setE01CNODCB(pmntList.getRecord(11) == null ? "" : pmntList.getRecord(11).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNODCB(" ");
						}

					try {
						msgPmnt.setE01CNOSCY(pmntList.getRecord(12) == null ? "" : pmntList.getRecord(12).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOSCY(" ");
						}
						
					try {
						msgPmnt.setE01CNOSCG(pmntList.getRecord(13) == null ? "" : pmntList.getRecord(13).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOSCG("0");
						}
						
					try {
						msgPmnt.setE01CNOMID(pmntList.getRecord(14) == null ? "" : pmntList.getRecord(14).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOMID(" ");
						}
						
					try {
						msgPmnt.setE01CNOMIC(pmntList.getRecord(15) == null ? "" : pmntList.getRecord(15).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOMIC(" ");
						}

					try {
						msgPmnt.setE01CNOCPC(pmntList.getRecord(16) == null ? "" : pmntList.getRecord(16).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOCPC(" ");
						}

					try {
						 msgPmnt.setE01CNOTCF(pmntList.getRecord(17) == null ? "" : pmntList.getRecord(17).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOTCF(" ");
						}

					try {
						 msgPmnt.setE01CNOMXC(pmntList.getRecord(18) == null ? "" : pmntList.getRecord(18).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOMXC("0");
						}
							
					try {
						 msgPmnt.setE01CNOMNC(pmntList.getRecord(19) == null ? "" : pmntList.getRecord(19).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOMNC("0");
						}
							
					try {
						 msgPmnt.setE01CNOIVA(pmntList.getRecord(20) == null ? "" : pmntList.getRecord(20).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOIVA(" ");
						}
							
					try {
						 msgPmnt.setE01CNOCST(pmntList.getRecord(21) == null ? "" : pmntList.getRecord(21).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOCST("0");
						}
							
					try {
						msgPmnt.setE01CNOF03(pmntList.getRecord(22) == null ? "" : pmntList.getRecord(22).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOF03(" ");
						}
							
					try {
						msgPmnt.setE01CNOACD(pmntList.getRecord(23) == null ? "" : pmntList.getRecord(23).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOACD(" ");
						}
						
					try {
						msgPmnt.setE01CNOACS(pmntList.getRecord(24) == null ? "" : pmntList.getRecord(24).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOACS("0");
						}
						
					try {
						msgPmnt.setE01CNOF04(pmntList.getRecord(25) == null ? "" : pmntList.getRecord(25).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOF04(" ");
						}
							
					try {
						msgPmnt.setE01CNOPER(pmntList.getRecord(26) == null ? "" : pmntList.getRecord(26).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOPER("0");
						}
					
					try {
						msgPmnt.setE01CNOF05(pmntList.getRecord(27) == null ? "" : pmntList.getRecord(27).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOF05(" ");
						}
						
					try {
						msgPmnt.setE01CNOF06(pmntList.getRecord(28) == null ? "" : pmntList.getRecord(28).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOF06(" ");
						}

					try {
						msgPmnt.setE01CNOF07(pmntList.getRecord(29) == null ? "" : pmntList.getRecord(29).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOF07(" ");
						}
							
					try {
						msgPmnt.setE01CNOUS1(pmntList.getRecord(30) == null ? "" : pmntList.getRecord(30).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOUS1(" ");
						}
						
					try {
						msgPmnt.setE01CNOUS2(pmntList.getRecord(31) == null ? "" : pmntList.getRecord(31).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOUS2(" ");
						}
						
					try {
						msgPmnt.setE01CNOUS3(pmntList.getRecord(32) == null ? "" : pmntList.getRecord(32).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOUS3(" ");
						}

					try {
						msgPmnt.setE01CNOEML(pmntList.getRecord(33) == null ? "" : pmntList.getRecord(33).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOEML(" ");
						}

					try {
						 msgPmnt.setE01CNOPHN(pmntList.getRecord(34) == null ? "" : pmntList.getRecord(34).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOPHN("0");
						}
						
					try {
						 msgPmnt.setE01CNOPXT(pmntList.getRecord(35) == null ? "" : pmntList.getRecord(35).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOPXT("0");
						}
							
					try {
						 msgPmnt.setE01CNOCCN(pmntList.getRecord(36) == null ? "" : pmntList.getRecord(36).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOCCN("0");
						}
							
					try {
						 msgPmnt.setE01CNORUT(pmntList.getRecord(37) == null ? "" : pmntList.getRecord(37).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNORUT(" ");
						}
							
					try {
						 msgPmnt.setE01CNOBNK(pmntList.getRecord(38) == null ? "" : pmntList.getRecord(38).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOBNK(" ");
						}
							
					try {
						msgPmnt.setE01CNOBRN(pmntList.getRecord(39) == null ? "" : pmntList.getRecord(39).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOBRN("0");
						}
							
					try {
						msgPmnt.setE01CNOTYP(pmntList.getRecord(40) == null ? "" : pmntList.getRecord(40).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOTYP(" ");
						}
						
					try {
						msgPmnt.setE01CNOSUP(pmntList.getRecord(41) == null ? "" : pmntList.getRecord(41).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNOSUP(" ");
						}

					try {
						 msgPmnt.setE01CNALB1(pmntList.getRecord(42) == null ? "" : pmntList.getRecord(42).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALB1(" ");
						}
								
					try {
						msgPmnt.setE01CNALN1(pmntList.getRecord(43) == null ? "" : pmntList.getRecord(43).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALN1("0");
						}
								
					try {
						msgPmnt.setE01CNAPT1(pmntList.getRecord(44) == null ? "" : pmntList.getRecord(44).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNAPT1(" ");
						}
							
					try {
						msgPmnt.setE01CNADE1(pmntList.getRecord(45) == null ? "" : pmntList.getRecord(45).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNADE1("0");
						}

					try {
						 msgPmnt.setE01CNALB2(pmntList.getRecord(46) == null ? "" : pmntList.getRecord(46).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALB2(" ");
						}
								
					try {
						msgPmnt.setE01CNALN2(pmntList.getRecord(47) == null ? "" : pmntList.getRecord(47).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALN2("0");
						}
									
					try {
						msgPmnt.setE01CNAPT2(pmntList.getRecord(48) == null ? "" : pmntList.getRecord(48).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNAPT2(" ");
						}
								
					try {
						msgPmnt.setE01CNADE2(pmntList.getRecord(49) == null ? "" : pmntList.getRecord(49).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNADE2("0");
						}

					try {
						 msgPmnt.setE01CNALB3(pmntList.getRecord(50) == null ? "" : pmntList.getRecord(50).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALB3(" ");
						}
									
					try {
						msgPmnt.setE01CNALN3(pmntList.getRecord(51) == null ? "" : pmntList.getRecord(51).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALN3("0");
						}
									
					try {
						msgPmnt.setE01CNAPT3(pmntList.getRecord(52) == null ? "" : pmntList.getRecord(52).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNAPT3(" ");
						}
								
					try {
						msgPmnt.setE01CNADE3(pmntList.getRecord(53) == null ? "" : pmntList.getRecord(53).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNADE3("0");
						}

					try {
						 msgPmnt.setE01CNALB4(pmntList.getRecord(54) == null ? "" : pmntList.getRecord(54).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALB4(" ");
						}
									
					try {
						msgPmnt.setE01CNALN4(pmntList.getRecord(55) == null ? "" : pmntList.getRecord(55).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALN4("0");
						}
										
					try {
						msgPmnt.setE01CNAPT4(pmntList.getRecord(56) == null ? "" : pmntList.getRecord(56).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNAPT4(" ");
						}
								
					try {
						msgPmnt.setE01CNADE4(pmntList.getRecord(57) == null ? "" : pmntList.getRecord(57).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNADE4("0");
						}
								

					try {
						 msgPmnt.setE01CNALB5(pmntList.getRecord(58) == null ? "" : pmntList.getRecord(58).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALB5(" ");
						}
								
					try {
						msgPmnt.setE01CNALN5(pmntList.getRecord(59) == null ? "" : pmntList.getRecord(59).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALN5("0");
						}
								
					try {
						msgPmnt.setE01CNAPT5(pmntList.getRecord(60) == null ? "" : pmntList.getRecord(60).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNAPT5(" ");
						}
							
					try {
						msgPmnt.setE01CNADE5(pmntList.getRecord(61) == null ? "" : pmntList.getRecord(61).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNADE5("0");
						}

					try {
						msgPmnt.setE01CNALB6(pmntList.getRecord(62) == null ? "" : pmntList.getRecord(62).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALB6(" ");
						}
									
					try {
						msgPmnt.setE01CNALN6(pmntList.getRecord(63) == null ? "" : pmntList.getRecord(63).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALN6("0");
						}
										
					try {
						msgPmnt.setE01CNAPT6(pmntList.getRecord(64) == null ? "" : pmntList.getRecord(64).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNAPT6(" ");
						}
								
					try {
						msgPmnt.setE01CNADE6(pmntList.getRecord(65) == null ? "" : pmntList.getRecord(65).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNADE6("0");
						}

					try {
						 msgPmnt.setE01CNALB7(pmntList.getRecord(66) == null ? "" : pmntList.getRecord(66).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALB7(" ");
						}
										
					try {
						msgPmnt.setE01CNALN7(pmntList.getRecord(67) == null ? "" : pmntList.getRecord(67).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALN7("0");
						}
										
					try {
						msgPmnt.setE01CNAPT7(pmntList.getRecord(68) == null ? "" : pmntList.getRecord(68).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNAPT7(" ");
						}
									
					try {
						msgPmnt.setE01CNADE7(pmntList.getRecord(69) == null ? "" : pmntList.getRecord(69).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNADE7("0");
						}

					try {
						 msgPmnt.setE01CNALB8(pmntList.getRecord(70) == null ? "" : pmntList.getRecord(70).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALB8(" ");
						}
										
					try {
						msgPmnt.setE01CNALN8(pmntList.getRecord(71) == null ? "" : pmntList.getRecord(71).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALN8("0");
						}
											
					try {
						msgPmnt.setE01CNAPT8(pmntList.getRecord(72) == null ? "" : pmntList.getRecord(72).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNAPT8(" ");
						}
									
					try {
						msgPmnt.setE01CNADE8(pmntList.getRecord(73) == null ? "" : pmntList.getRecord(73).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNADE8("0");
						}

					try {
						 msgPmnt.setE01CNALB9(pmntList.getRecord(74) == null ? "" : pmntList.getRecord(74).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALB9(" ");
						}
									
					try {
						msgPmnt.setE01CNALN9(pmntList.getRecord(75) == null ? "" : pmntList.getRecord(75).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALN9("0");
						}
									
					try {
						msgPmnt.setE01CNAPT9(pmntList.getRecord(76) == null ? "" : pmntList.getRecord(76).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNAPT9(" ");
						}
								
					try {
						msgPmnt.setE01CNADE9(pmntList.getRecord(77) == null ? "" : pmntList.getRecord(77).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNADE9("0");
						}

					try {
						 msgPmnt.setE01CNALB0(pmntList.getRecord(78) == null ? "" : pmntList.getRecord(78).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALB0(" ");
						}
									
					try {
						msgPmnt.setE01CNALN0(pmntList.getRecord(79) == null ? "" : pmntList.getRecord(79).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNALN0("0");
						}
										
					try {
						msgPmnt.setE01CNAPT0(pmntList.getRecord(80) == null ? "" : pmntList.getRecord(80).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNAPT0(" ");
						}
									
					try {
						msgPmnt.setE01CNADE0(pmntList.getRecord(81) == null ? "" : pmntList.getRecord(81).trim());
						} catch (Exception e) {
							msgPmnt.setE01CNADE0("0");
						}

					mpPmnt.sendMessage(msgPmnt);

				    }
				     
				     msgPmnt.setH01USERID(user.getH01USR());
				     msgPmnt.setH01PROGRM("ESD0031");
				     msgPmnt.setH01TIMSYS(getTimeStamp());
				     msgPmnt.setH01SCRCOD(userPO.getOption());
				     msgPmnt.setH01OPECOD("0001");
				     msgPmnt.setH01FLGMAS("*");
				    
			    

				    mpPmnt.sendMessage(msgPmnt);

				   }

			   ELEERRMessage msgError = (ELEERRMessage) mpPmnt.receiveMessageRecord("ELEERR");
			   //newmessage = mpPmnt.receiveMessageRecord();
	
			
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {

			forward("ESD0031_charge_mass_cnofc_confirm.jsp", req, res);
		}

	}

	protected void procReqExtraSeleIni(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RT");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.params.JSESD0031?SCREEN=501");
		userPO.setProdCode("RT");
		//Others Parameters
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		
		forward("GENERIC_account_enter.jsp", req, res);
	}
	
	protected void procActExtraMainList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String AccNum = "";

			try {

				mp = new MessageProcessor("ESD0060");
				ESD006001Message msgSP = (ESD006001Message) mp.getMessageRecord("ESD006001");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgSP.setH01USERID(user.getH01USR());
				msgSP.setH01PROGRM("ESD0060");
				msgSP.setH01TIMSYS(getTimeStamp());
				msgSP.setH01SCRCOD("01");
				msgSP.setH01OPECOD("0001");
				AccNum = req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				msgSP.setE01DDSBNK(userPO.getBank());
				msgSP.setE01DDSACC(userPO.getAccNum());

				mp.sendMessage(msgSP);

				msgSP = (ESD006001Message) mp.receiveMessageRecord();
				ses.setAttribute("rtExtra", msgSP);

			} finally {
				if (mp != null)	mp.close();
			}

			try {

				mp = new MessageProcessor("ESD0060");
				ESD006002Message msgRT = (ESD006002Message) mp.getMessageRecord("ESD006002");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0060");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("01");
				msgRT.setH02OPECOD("0002");
				AccNum = req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				msgRT.setE02DDSACC(userPO.getAccNum());

				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD006002List", list);
				}
				forward("ESD0060_rt_bank_statements_1.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}

	protected void procActExtraRecNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String AccNum = "";

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0060");
				ESD006002Message msgRT = (ESD006002Message) mp.getMessageRecord("ESD006002");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0060");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("02");
				msgRT.setH02OPECOD("0003");
				userPO.setPurpose("NEW");
				AccNum = req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				msgRT.setE02DDSACC(userPO.getAccNum());

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0060_rt_bank_statements_1.jsp", req, res);
					} else {
						// Receive Data

						ses.setAttribute("rtExtrac", newmessage);
						forward("ESD0060_rt_bank_statements_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procActExtraRecAdd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String AccNum = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0060");
				ESD006002Message msgRT = (ESD006002Message) mp.getMessageRecord("ESD006002");

				setMessageRecord(req, msgRT);
				
				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0060");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("02");
				msgRT.setH02OPECOD("0004");
				userPO.setPurpose("ADD");
				AccNum = req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				msgRT.setE02DDSACC(userPO.getAccNum());
				
				
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
					ses.setAttribute("rtExtrac", newmessage );
						forward("ESD0060_rt_bank_statements_2.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSESD0031?SCREEN=501");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
	protected void procActExtraRecMan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String AccNum = "";
			String AccTyp = "";
			String AccCod = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0060");
				ESD006002Message msgRT = (ESD006002Message) mp.getMessageRecord("ESD006002");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0060");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("05");
				msgRT.setH02OPECOD("0005");
				userPO.setPurpose("MAINTENANCE");
				AccNum = req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC").trim();
				AccTyp = req.getParameter("E02DDSTYP") == null ? "0" : req.getParameter("E02DDSTYP").trim();
				AccCod = req.getParameter("E02ACMATY") == null ? "0" : req.getParameter("E02ACMATY").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				msgRT.setE02DDSACC(userPO.getAccNum());
				msgRT.setE02DDSTYP(AccTyp.trim());
				msgRT.setE02ACMATY(AccCod.trim());				



				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0060_rt_bank_statements_1.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("rtExtrac", newmessage);
						forward("ESD0060_rt_bank_statements_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procActExtraRecInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String AccNum = "";
			String AccTyp = "";
			String AccCod = "";

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0060");
				ESD006002Message msgRT = (ESD006002Message) mp.getMessageRecord("ESD006002");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0060");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("05");
				msgRT.setH02OPECOD("0006");
				userPO.setPurpose("INQUIRY");
				AccNum = req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC").trim();
				AccTyp = req.getParameter("E02DDSTYP") == null ? "0" : req.getParameter("E02DDSTYP").trim();
				AccCod = req.getParameter("E02ACMATY") == null ? "0" : req.getParameter("E02ACMATY").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				msgRT.setE02DDSACC(userPO.getAccNum());
				msgRT.setE02DDSTYP(AccTyp.trim());
				msgRT.setE02ACMATY(AccCod.trim());				
				

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0060_rt_bank_statements_1.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("rtExtrac", newmessage);
						forward("ESD0060_rt_bank_statements_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procActExtraRecDel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String AccNum = "";
			String AccTyp = "";
			String AccCod = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0060");
				ESD006002Message msgRT = (ESD006002Message) mp.getMessageRecord("ESD006002");

				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("ESD0060");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02SCRCOD("05");
				msgRT.setH02OPECOD("0007");
				userPO.setPurpose("DELETE");
				AccNum = req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC").trim();
				AccTyp = req.getParameter("E02DDSTYP") == null ? "0" : req.getParameter("E02DDSTYP").trim();
				AccCod = req.getParameter("E02ACMATY") == null ? "0" : req.getParameter("E02ACMATY").trim();
				if (!AccNum.equals("0")) {
					userPO.setAccNum(AccNum.trim());
				}
				msgRT.setE02DDSACC(userPO.getAccNum());
				msgRT.setE02DDSTYP(AccTyp.trim());
				msgRT.setE02ACMATY(AccCod.trim());				
				

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0060_rt_bank_statements_1.jsp", req, res);
					} else {

						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSESD0031?SCREEN=501");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
	private void procParBankStaIni(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
	throws ServletException, IOException {
		
		ses.setAttribute("error", new ELEERRMessage());

		forward("ESD0060_rt_param_bank_statements_1.jsp", req, res);

	}
	

	protected void procParBankStaList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
	throws ServletException, IOException {

		    UserPos userPO = getUserPos(ses);
		    MessageProcessor mp = null;
			String BankNum = "";

			try {

				mp = new MessageProcessor("ESD0060");
				ESD006004Message msgSP = (ESD006004Message) mp.getMessageRecord("ESD006004");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgSP.setH04USERID(user.getH01USR());
				msgSP.setH04PROGRM("ESD0060");
				msgSP.setH04TIMSYS(getTimeStamp());
				msgSP.setH04SCRCOD("01");
				msgSP.setH04OPECOD("0001");
				BankNum = req.getParameter("E04STMBNK") == null ? "0" : req.getParameter("E04STMBNK").trim();
				if (!BankNum.equals("0")) {
					userPO.setBank(BankNum.trim());
					}
				msgSP.setE04STMBNK(userPO.getBank());		
				
				
				mp.sendMessage(msgSP);

				msgSP = (ESD006004Message) mp.receiveMessageRecord();
				ses.setAttribute("rtExtra", msgSP);

			} finally {
				if (mp != null)	mp.close();
			}

			try {

				mp = new MessageProcessor("ESD0060");
				ESD006003Message msgRT = (ESD006003Message) mp.getMessageRecord("ESD006003");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("ESD0060");
				msgRT.setH03TIMSYS(getTimeStamp());
				msgRT.setH03SCRCOD("01");
				msgRT.setH03OPECOD("0002");
				BankNum = req.getParameter("E04STMBNK") == null ? "0" : req.getParameter("E04STMBNK").trim();
				if (!BankNum.equals("0")) {
					userPO.setBank(BankNum.trim());
					}
				msgRT.setE03STMBNK(userPO.getBank());
				
				mp.sendMessage(msgRT);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E03INDOPE","E03NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("ESD006003List", list);
				}
				forward("ESD0060_rt_param_bank_statements_2.jsp", req, res);

			} finally {
				if (mp != null)	mp.close();
			}
		}
	
	
	
	
	protected void procParBankStaNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String BankNum = "";

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0060");
				ESD006003Message msgRT = (ESD006003Message) mp.getMessageRecord("ESD006003");

				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("ESD0060");
				msgRT.setH03TIMSYS(getTimeStamp());
				msgRT.setH03SCRCOD("02");
				msgRT.setH03OPECOD("0003");
				userPO.setPurpose("NEW");
				BankNum = req.getParameter("E04STMBNK") == null ? "0" : req.getParameter("E04STMBNK").trim();
				if (!BankNum.equals("0")) {
					msgRT.setE03STMBNK(BankNum.trim());
					}

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0060_rt_param_bank_statements_2.jsp", req, res);
					} else {
						// Receive Data

						ses.setAttribute("rtExtrac", newmessage);
						forward("ESD0060_rt_param_bank_statements_3.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
	protected void procParBankStaAdd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String BankNum = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0060");
				ESD006003Message msgRT = (ESD006003Message) mp.getMessageRecord("ESD006003");

				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("ESD0060");
				msgRT.setH03TIMSYS(getTimeStamp());
				msgRT.setH03SCRCOD("02");
				msgRT.setH03OPECOD("0004");
				userPO.setPurpose("ADD");
				BankNum = req.getParameter("E04STMBNK") == null ? "0" : req.getParameter("E04STMBNK").trim();
				if (!BankNum.equals("0")) {
					userPO.setBank(BankNum.trim());
					}
				msgRT.setE03STMBNK(userPO.getBank());
				
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
					ses.setAttribute("rtExtrac", newmessage );
						forward("ESD0060_rt_param_bank_statements_3.jsp", req, res);
					} else {
						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSESD0031?SCREEN=601");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procParBankStaMan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String BankNum = "";
			String AccTyp = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0060");
				ESD006003Message msgRT = (ESD006003Message) mp.getMessageRecord("ESD006003");

				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("ESD0060");
				msgRT.setH03TIMSYS(getTimeStamp());
				msgRT.setH03SCRCOD("05");
				msgRT.setH03OPECOD("0005");
				userPO.setPurpose("MAINTENANCE");
				AccTyp = req.getParameter("E03STMTYP") == null ? " " : req.getParameter("E03STMTYP").trim();
				BankNum = req.getParameter("E04STMBNK") == null ? "0" : req.getParameter("E04STMBNK").trim();
				if (!BankNum.equals("0")) {
					userPO.setBank(BankNum.trim());
					}
				msgRT.setE03STMBNK(userPO.getBank());
				msgRT.setE03STMTYP(AccTyp.trim());

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0060_rt_param_bank_statements_1.jsp", req, res);
					} else {
						// Receive Data
						ses.setAttribute("rtExtrac", newmessage);
						forward("ESD0060_rt_param_bank_statements_3.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procParBankStaInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String BankNum = "";
			String AccTyp = "";

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0060");
				ESD006003Message msgRT = (ESD006003Message) mp.getMessageRecord("ESD006003");

				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("ESD0060");
				msgRT.setH03TIMSYS(getTimeStamp());
				msgRT.setH03SCRCOD("05");
				msgRT.setH03OPECOD("0006");
				userPO.setPurpose("INQUIRY");
				AccTyp = req.getParameter("E03STMTYP") == null ? " " : req.getParameter("E03STMTYP").trim();
				BankNum = req.getParameter("E04STMBNK") == null ? "0" : req.getParameter("E04STMBNK").trim();
				if (!BankNum.equals("0")) {
					msgRT.setE03STMBNK(BankNum.trim());
					}
				msgRT.setE03STMTYP(AccTyp.trim());
				

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0060_rt_param_bank_statements_3.jsp", req, res);
					} else {
						// Receive Data
						// newmessage = mp.receiveMessageRecord();
						ses.setAttribute("rtExtrac", newmessage);
						forward("ESD0060_rt_param_bank_statements_2.jsp", req, res);
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	protected void procParBankStaDel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			String BankNum = "";
			String AccTyp = "";
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ESD0060");
				ESD006003Message msgRT = (ESD006003Message) mp.getMessageRecord("ESD006003");
				msgRT.setH03USERID(user.getH01USR());
				msgRT.setH03PROGRM("ESD0060");
				msgRT.setH03TIMSYS(getTimeStamp());
				msgRT.setH03SCRCOD("05");
				msgRT.setH03OPECOD("0007");
				msgRT.setH03FLGMAS( req.getParameter("H03FLGMAS") );
				
				userPO.setPurpose("DELETE");
				AccTyp = req.getParameter("E03STMTYP") == null ? " " : req.getParameter("E03STMTYP").trim();
				BankNum = req.getParameter("E04STMBNK") == null ? "0" : req.getParameter("E04STMBNK").trim();
				if (!BankNum.equals("0")) {
					msgRT.setE03STMBNK(BankNum.trim());
					}
				msgRT.setE03STMTYP(AccTyp.trim());
				

				// Send Message 
				mp.sendMessage(msgRT);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
						forward("ESD0060_rt_param_bank_statements_2.jsp", req, res);
					} else {

						// Receive Data
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSESD0031?SCREEN=601");
					}

				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
	
}



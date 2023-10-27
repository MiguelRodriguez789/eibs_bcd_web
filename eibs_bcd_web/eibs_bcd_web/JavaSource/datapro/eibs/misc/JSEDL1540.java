package datapro.eibs.misc;

import java.io.IOException;
import java.io.InputStream;
import java.io.LineNumberReader;
import java.io.StringReader;
import java.math.BigDecimal;
import java.util.Iterator;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import datapro.eibs.beans.EDL154001Message;
import datapro.eibs.beans.EDL154002Message;
import datapro.eibs.beans.EDL154003Message;
import datapro.eibs.beans.EDL154004Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author jcamperos
 *
 *
 */
public class JSEDL1540 extends JSEIBSServlet {

	private ServletConfig config = null;

	protected static final int R_ENTER_FILE = 2;
	protected static final int A_ENTER_FILE = 1;
	protected static final int F_ENTER_FILE = 3;
	protected static final int R_APPROVAL_LIST = 21;
	protected static final int R_APPROVAL_INQ = 24;
	protected static final int A_APPROVAL_LIST = 25;
	protected static final int R_GLN_LIST = 30;
	protected static final int R_GLN_NEW = 31;
	protected static final int R_GLN_UPD = 32;
	protected static final int A_GLN_NEW_UPD = 33;
	protected static final int A_GLN_DEL = 34;
	protected static final int R_ENTER_TARIFF = 39;
	protected static final int R_TARIFF_LIST = 40;
	protected static final int R_TARIFF_NEW = 41;
	protected static final int R_TARIFF_UPD = 42;
	protected static final int A_TARIFF_NEW_UPD = 43;
	protected static final int A_TARIFF_DEL = 44;
	protected static final int R_ENTER_INPUT = 49;
	protected static final int A_ENTER_INPUT = 50;
	
	
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException, IOException {

		switch (screen) {
		// Request
		case R_ENTER_FILE:
			procReqImport(user, req, res, session);
			break;
		case A_ENTER_FILE:
			procReadExcelFile(user, req, res, session);
			break;
		case R_APPROVAL_LIST :	
			procReqApprovalList(user, req, res, session);
			break;
		case R_APPROVAL_INQ:	
			procActionApprovalInq(user, req, res, session, screen);
			break;
			
		case A_APPROVAL_LIST : // Approval Update
			procActionApprovalRec(user, req, res, session);
			break;		
		case R_GLN_LIST:	
			procReqGlList(user, req, res, session);
			break;
		case R_GLN_NEW:	
		case R_GLN_UPD:	
			procActionGlRec(user, req, res, session, screen);
			break;
		case A_GLN_NEW_UPD:	
			procSubmitGlRec(user, req, res, session);
			break;
		case A_GLN_DEL:	
			procActionGlDel(user, req, res, session, screen);
			break;
		case R_ENTER_TARIFF:
			procReqTariff(user, req, res, session);
			break;	
		case R_TARIFF_LIST:	
			procReqTariffList(user, req, res, session);
			break;
		case R_TARIFF_NEW:	
		case R_TARIFF_UPD:	
			procActionTariffRec(user, req, res, session, screen);
			break;
		case A_TARIFF_NEW_UPD:	
			procSubmitTariffRec(user, req, res, session);
			break;
		case A_TARIFF_DEL:	
			procActionTariffDel(user, req, res, session, screen);
			break;
		case R_ENTER_INPUT:
			procReqInput(user, req, res, session);
			break;
		case A_ENTER_INPUT:
			procActionInput(user, req, res, session);
			break;	
		case F_ENTER_FILE:
			res.sendRedirect(srctx + "/pages/background.jsp");
			break;
		default:
			forward("MISC_not_available.jsp", req, res);
			break;
		}
	}

	private void procReadExcelFile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws ServletException, IOException {

		String pageName = "";
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		SmartUpload mySmartUpload = new SmartUpload();
		String mode = "";
		String conc = "";
		String pyear = "";
		String pmonth = "";
		String flg = "";
		try {
			
			mySmartUpload.initialize(config, req, res);
			mySmartUpload.upload();

			try{
				mode = mySmartUpload.getRequest().getParameter("MODE");
			}catch(Exception e){
				mode = "";
			}
			try{
				conc = mySmartUpload.getRequest().getParameter("CONC");
			}catch(Exception e){
				conc = "";
			}
			try{
				pyear = mySmartUpload.getRequest().getParameter("PYEAR");
			}catch(Exception e){
				pyear = "";
			}
			try{
				pmonth = mySmartUpload.getRequest().getParameter("PMONTH");
			}catch(Exception e){
				pmonth = "";
			}
			
			
			com.jspsmart.upload.File file = mySmartUpload.getFiles().getFile(0);
			userPO.setSource(file.getFilePathName());
			InputStream xls = Util.getStreamFromFile(file);

			String[] data = null;
			String ext = file.getFileExt();

			boolean firstTime = true;
			ELEERRMessage errors = new ELEERRMessage();
			boolean validRow = true;
			if ("TXT".equalsIgnoreCase(ext)) {
				StringReader sr = new StringReader(file.getContentString());
				LineNumberReader lnr = new LineNumberReader(sr);
				String line = "";
				if (lnr.ready()) { //Header
					line = lnr.readLine();
				}
				mp = getMessageProcessor("EDL1540", req);
				while (lnr.ready() && (line = lnr.readLine()) != null) {
					if (line.trim().length() > 0) {
						flg = "S";
						if (firstTime) {
							firstTime = false;
							flg = "P";
						}
						data = line.split("\t");
						ELEERRMessage error = sendData(mp, user, req, res, session, data, mode, conc, pyear, pmonth, file, flg);
						if (mp.hasError(error)) {
							addError(error, errors);
						}
					}
				}
				lnr.close();
				sr.close();
			} else {
				try {
					Workbook book = WorkbookFactory.create(xls);
					Sheet sheet = book.getSheetAt(0);
					Iterator<Row> itr = sheet.rowIterator();
					if (itr.hasNext()) { //Header
						Row header = itr.next();
					}
					mp = getMessageProcessor("EDL1540", req);
					while (itr.hasNext()) {
						validRow = true;
						Row row = itr.next();
						flg = "S";
						if (firstTime) {
							firstTime = false;
							flg = "P";
						}
						if (row.getCell(0) == null) {
							break;
						}
						if (!validRow) {
							break;
						}
						data = new String[row.getLastCellNum()];
						Iterator<Cell> cellIterator = row.cellIterator();
						int counter = 0;
						while (cellIterator.hasNext()) {
							Object result;
							Cell cell = cellIterator.next();
							switch (cell.getCellType()) {
							case Cell.CELL_TYPE_NUMERIC:
								result = new BigDecimal(cell.getNumericCellValue());
								data[counter++] = result.toString();
								break;
							default:
								result = cell.getRichStringCellValue().toString();
								data[counter++] = (String) result;
								break;
							}
							if (counter == 1) {
								if (data[0].trim().length() < 2) {
									validRow = false;
								}
								BigDecimal acc = new BigDecimal("0");
								BigDecimal cero = new BigDecimal("0");
								try {
									acc = new BigDecimal(data[0]);
								} catch (Exception e) {
									acc = new BigDecimal("0");
								}
								if (acc.compareTo(cero) <= 0 ) {
									validRow = false;	
								}
								
								if (!validRow) {
									break;
								}
							}
						}
						if (!validRow) {
							break;
						}
						ELEERRMessage error = sendData(mp, user, req, res, session, data, mode, conc, pyear, pmonth, file, flg);
						if (mp.hasError(error)) {
							addError(error, errors);
						}
					}
				} catch (InvalidFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			session.setAttribute("userPO", userPO);

			if (!mp.hasError(errors)) {
				try {
					EDL154001Message msg = (EDL154001Message) mp.getMessageRecord("EDL154001");
					msg.setH01USERID(user.getH01USR());
					msg.setH01PROGRM("EDL1540");
					msg.setH01TIMSYS(getTimeStamp());
					msg.setH01SCRCOD("01");
					msg.setH01OPECOD("0002");
					msg.setH01FLGWK1("*");
					msg.setE01MOD(mode);

					mp.sendMessage(msg);
					ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
					msg = (EDL154001Message) mp.receiveMessageRecord("EDL154001");
					session.setAttribute("error", msgError);
					session.setAttribute("msgRcd", msg);
					if (mp.hasError(msgError)) {
						pageName = "EDL1540_file_request.jsp";
					} else {
						pageName = "EDL1540_file_confirmation.jsp";
					}

				} finally {
					if (mp != null)
						mp.close();
				}
			} else {
				session.setAttribute("error", errors);
				pageName = "EDL1540_file_request.jsp";
			}

			forward(pageName, req, res);

		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (mp != null)
				mp.close();
		}

	}

	private ELEERRMessage sendData(MessageProcessor mp, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String[] data, String mode, String conc, String pyear, String pmonth, com.jspsmart.upload.File file,
			String flg) throws ServletException, IOException {

		EDL154001Message msg = (EDL154001Message) mp.getMessageRecord("EDL154001");
		msg.setH01USERID(user.getH01USR());
		msg.setH01PROGRM("EDL1540");
		msg.setH01TIMSYS(getTimeStamp());
		msg.setH01SCRCOD("01");
		msg.setH01OPECOD("0001");
		msg.setH01FLGWK1(flg);
		try{
			msg.setE01FIL(file.getFileName());
		}catch(Exception e){
			msg.setE01FIL("");
		}
		try{
			msg.setE01MOD(mode);
		}catch(Exception e){
			msg.setE01FIL("");
		}
		try{
			msg.setE01CON(conc);
		}catch(Exception e){
			msg.setE01CON("");
		}
		try{
			msg.setE01PDY(pyear);
		}catch(Exception e){
			msg.setE01PDY("");
		}
		try{
			msg.setE01PDM(pmonth);
		}catch(Exception e){
			msg.setE01PDM("");
		}
		try{
			msg.setE01ACC(data[0]);
		}catch(Exception e){
			msg.setE01ACC("0");
		}
		try{
			msg.setE01STG(data[1]);
		}catch(Exception e){
			msg.setE01STG("0");
		}
		try{
			msg.setE01BAS(data[2]);
		}catch(Exception e){
			msg.setE01BAS("0");
		}
		try{
			msg.setE01ADV(data[3]);
		}catch(Exception e){
			msg.setE01ADV("0");
		}
		try{
			msg.setE01OPT(data[4]);
		}catch(Exception e){
			msg.setE01OPT("0");
		}
		try{
			msg.setE01PON(data[5]);
		}catch(Exception e){
			msg.setE01PON("0");
		}
		
		mp.sendMessage(msg);
		
		return (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		
	}

	private void procReqImport(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws ServletException, IOException {
		
		forward("EDL1540_file_request.jsp", req, res);
	}
	
	// SCREEN = 11 , 16 , 21
		// Send List   
		//
	protected void procReqApprovalList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {

			UserPos userPO = null;
			MessageProcessor mp = null;
			try {
				mp = new MessageProcessor("EDL154001");
				EDL154001Message msg = (EDL154001Message) mp.getMessageRecord("EDL154001");
				userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");
				// Send Initial data
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EDL1540");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01SCRCOD("02");
				msg.setH01OPECOD("0015");
				
				//msg.setH02OPECOD(screen  == 11 ? "0011" : (screen == 21 ? "0021" :"0016"));
				//userPO.setPurpose(screen  == 11 ? "MAINTENANCE" : (screen == 21 ? "APPROVAL" :"INQUIRY"));
				msg.setE01NUMREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
				msg.setE01MOD(req.getParameter("E01MOD") == null ? userPO.getSource() : req.getParameter("E01MOD"));
				msg.setE01CON(req.getParameter("E01CON") == null ? userPO.getIdentifier() : req.getParameter("E01CON"));
				userPO.setSource(msg.getE01MOD());
				userPO.setIdentifier(msg.getE01CON());
				
				// Send Message	
				mp.sendMessage(msg);
				session.setAttribute("userPO", userPO);
				
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
				} else {
					session.setAttribute("msgList", list);
				}
				forward("EDL1540_approval_list.jsp", req, res);
			} finally {
				if (mp != null)
					mp.close();
			}
	}
	
	protected void procActionApprovalInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException, IOException 
		{

			MessageProcessor mp = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");
			userPO.setPurpose("INQUIRY");

			// Send data
			try 
			{
				mp = new MessageProcessor("EDL1540");
				EDL154001Message msg = (EDL154001Message) mp.getMessageRecord("EDL154001");
				
				//Send Initial data
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EDL1540");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01SCRCOD("02");
				msg.setH01OPECOD("0002");
				// Get key field
				msg.setE01BNK(user.getE01UBK());
				msg.setE01MOD(req.getParameter("E01MOD") == null ? " " : req.getParameter("E01MOD"));
				msg.setE01CON(req.getParameter("E01CON") == null ? " " : req.getParameter("E01CON"));
				msg.setE01PDY(req.getParameter("E01PDY") == null ? " " : req.getParameter("E01PDY"));
				msg.setE01PDM(req.getParameter("E01PDM") == null ? " " : req.getParameter("E01PDM"));
				//userPO.setSource(msg.getE02EMDCUN());
				userPO.setBank(msg.getE01BNK());
				userPO.setHeader15(msg.getE01MOD());
				userPO.setHeader16(msg.getE01CON());
				userPO.setHeader17(msg.getE01PDY());
				userPO.setHeader18(msg.getE01PDM());
				
				// Send Message	
				mp.sendMessage(msg);
				session.setAttribute("userPO", userPO);
				
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
					forward("EDL1540_approval_list.jsp", req, res);
				} else {
					session.setAttribute("msgList", list);
					forward("EDL1540_approval_inq.jsp", req, res);
				}
			}finally {
				if (mp != null) 
					mp.close();
			}
		}

	
	protected void procActionApprovalRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

			// Send data
			try {
				mp = new MessageProcessor("EDL1540");
				EDL154001Message msg = (EDL154001Message) mp.getMessageRecord("EDL154001");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EDL1540");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01SCRCOD("02");
				msg.setH01OPECOD("0005");
				msg.setE01ACT(req.getParameter("E01ACT") == null ? " " : req.getParameter("E01ACT"));
				
				// Get key field
				msg.setE01MOD(req.getParameter("E01MOD") == null ? " " : req.getParameter("E01MOD"));
				msg.setE01CON(req.getParameter("E01CON") == null ? " " : req.getParameter("E01CON"));
				msg.setE01PDY(req.getParameter("E01PDY") == null ? " " : req.getParameter("E01PDY"));
				msg.setE01PDM(req.getParameter("E01PDM") == null ? " " : req.getParameter("E01PDM"));
				//userPO.setSource(msg.getE02EMDCUN());
				userPO.setSource(msg.getE01MOD());
				userPO.setIdentifier(msg.getE01CON());
				userPO.setOption(msg.getE01ACT());
				msg.setH01FLGWK1(""); 				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				session.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
						session.setAttribute("error", newmessage);
						forward("EDL1540_approval_list.jsp", req, res);
				} else {
					if (userPO.getOption().equals("I")) { //Inquiry
						session.setAttribute("msgRcd", newmessage);
						//forward("EMB0010_embargos_accounts_.jsp", req, res);
					} else {
						msg.setE01MOD(req.getParameter("E01MOD") == null ? " " : req.getParameter("E01MOD"));
						msg.setE01CON(req.getParameter("E01CON") == null ? " " : req.getParameter("E01CON"));
						String parm = "?SCREEN=" + R_APPROVAL_LIST + "&FromRecord=0&E01MOD=" + userPO.getSource() + "&E01CON=" + userPO.getIdentifier();
						redirectToPage("/servlet/datapro.eibs.misc.JSEDL1540" + parm, res);
					}
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
	protected void procReqGlList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses) throws ServletException, IOException 
	{

		UserPos userPO = null;
		MessageProcessor mp = null;
		MessageRecord record = null;
		ELEERRMessage error = null;
		try 
		{
			mp = new MessageProcessor("EDL1540");
			EDL154002Message msg = (EDL154002Message) mp.getMessageRecord("EDL154002");
						
			//Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL1540");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("0015");
			msg.setE02BNK(user.getE01UBK());

			// Send Message	
			mp.sendMessage(msg);
		
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");

			ses.setAttribute("EDL1540List", list);
			
			if(mp.hasError(list)) 
			{
				forward("Under_construction.jsp", req, res);				
			} 
			else 
			{
				forward("EDL1540_ledger_accounts_list.jsp", req, res);
			}
			
		} 
		finally 
		{
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procActionGlRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen) throws ServletException, IOException 
		{

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");

			// Send data
			try 
			{
				mp = new MessageProcessor("EDL1540");
				EDL154002Message msg = (EDL154002Message) mp.getMessageRecord("EDL154002");
				
				//Send Initial data
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EDL1540");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("01");
				msg.setH02OPECOD("0002");
				
				switch (screen) 
				{
					case R_GLN_NEW : // Request new Record
						userPO.setPurpose("NEW");
						break;
					case R_GLN_UPD : // Request old Record
						userPO.setPurpose("MAINT");
						break;
				}
				if(screen != R_GLN_NEW)
				{
//					//Get List from session and get the specific row from the list
					try
					{
						JBObjList list =(JBObjList)ses.getAttribute("EDL1540List");
						msg = (EDL154002Message)list.get(Integer.parseInt(req.getParameter("ROW")));
						ses.setAttribute("EDL1540Record", msg);
						forward("EDL1540_ledger_accounts_maint.jsp", req, res);
					}
					catch (Exception e)
					{
						ses.setAttribute("error", newmessage);
						forward("EDL1540_ledger_accounts_list.jsp", req, res);
					} 
				}
				else
				{
					EDL154002Message record = new EDL154002Message();
					ses.setAttribute("EDL1540Record", record);
					forward("EDL1540_ledger_accounts_maint.jsp", req, res);				
				}
				
				ses.setAttribute("userPO", userPO);
	        } 
			finally 
			{
				if (mp != null) 
					mp.close();
			}
		}
	
	protected void procSubmitGlRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses) throws ServletException, IOException 
		{

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			boolean success = true;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			// Send data
			try 
			{
				mp = new MessageProcessor("EDL1540");
//				EDL154002Message msg = (EDL154002Message) mp.getMessageRecord("EDL154002");
				EDL154002Message msg = (EDL154002Message) ses.getAttribute("EDL1540Record");
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EDL1540");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("01");
				msg.setH02OPECOD("0005");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				// Get all fields in page
				try 
				{
					super.setMessageRecord(req, msg);
				} 
				catch (Exception e) {	}
						
				ses.setAttribute("EDL1540Record", msg);
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) 
				{
					ses.setAttribute("error", newmessage);
					ses.setAttribute("EDL1540Record", msg);
					success = false;				
				}
					
				newmessage = mp.receiveMessageRecord();
				if(newmessage.getFormatName().equals("EDL154002"))
				{
					ses.setAttribute("EDL1540Record", newmessage);	
				}
				
				if(success)
				{				
					procReqGlList(user, req, res, ses);
				}
				else
				{
					forward("EDL1540_ledger_accounts_maint.jsp", req, res);
				}
		    } 
			finally
			{
				if (mp != null) 
					mp.close();
			}
		}
	
	protected void procActionGlDel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen) throws ServletException, IOException 
		{

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			boolean success = true;
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("DELETE");

			// Send data
			try 
			{
				mp = new MessageProcessor("EDL1540");
				EDL154002Message msg = (EDL154002Message) mp.getMessageRecord("EDL154002");
				
//					//Get List from session and get the specific row from the list
					try
					{
						JBObjList list =(JBObjList)ses.getAttribute("EDL1540List");
						msg = (EDL154002Message)list.get(Integer.parseInt(req.getParameter("ROW")));
						//Send Initial data
						msg.setH02USERID(user.getH01USR());
						msg.setH02PROGRM("EDL1540");
						msg.setH02TIMSYS(getTimeStamp());
						msg.setH02SCRCOD("01");
						msg.setH02OPECOD("0009");
						
						ses.setAttribute("EDL1540Record", msg);
						mp.sendMessage(msg);
						ses.setAttribute("userPO", userPO);
						// Receive Error Message or Data Message (Optional)
					
						newmessage = mp.receiveMessageRecord();
						if (mp.hasError(newmessage)) 
						{
							ses.setAttribute("error", newmessage);
							ses.setAttribute("EDL1540Record", msg);
							success = false;				
						}
							
						if(newmessage.getFormatName().equals("EDL154002"))
						{
							ses.setAttribute("EDL1540Record", newmessage);	
						}
						
						if(success)
						{				
							procReqGlList(user, req, res, ses);
						}
						else
						{
							forward("EDL1540_ledger_accounts_list.jsp", req, res);
						}
						
						
						
					}
					catch (Exception e)
					{
						ses.setAttribute("error", newmessage);
						forward("EDL0526_ledger_accounts_list.jsp", req, res);
					} 
				
				
				ses.setAttribute("userPO", userPO);
	        } 
			finally 
			{
				if (mp != null) 
					mp.close();
			}
		}
	
	private void procReqTariff(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws ServletException, IOException {
		
		forward("EDL1540_tariff_enter.jsp", req, res);
	}
	
	protected void procReqTariffList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses) throws ServletException, IOException 
	{

		UserPos userPO = null;
		MessageProcessor mp = null;
		MessageRecord record = null;
		ELEERRMessage error = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		try 
		{
			mp = new MessageProcessor("EDL1540");
			EDL154003Message msg = (EDL154003Message) mp.getMessageRecord("EDL154003");
						
			//Send Initial data
			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("EDL1540");
			msg.setH03TIMSYS(getTimeStamp());
			msg.setH03SCRCOD("01");
			msg.setH03OPECOD("0015");
			try{
				if(userPO.getBank().equals("") || userPO.getBank().equals(null)){
					userPO.setBank(req.getParameter("BANK") == null ? " " : req.getParameter("BANK"));
				}
			}catch(Exception e){
			}
			try{
				if(userPO.getHeader1().equals("") || userPO.getHeader1().equals(null)){
					userPO.setHeader1(req.getParameter("YEAR") == null ? " " : req.getParameter("YEAR"));
				}	
			}catch(Exception e){
			}
			msg.setE03BNK(userPO.getBank());
			msg.setE03VDY(userPO.getHeader1());
			

			// Send Message	
			mp.sendMessage(msg);
		
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E03INDOPE","E03NUMREC");

			ses.setAttribute("EDL1540List", list);
			
			if(mp.hasError(list)) 
			{
				forward("Under_construction.jsp", req, res);				
			} 
			else 
			{
				forward("EDL1540_tariff_list.jsp", req, res);
			}
			
		} 
		finally 
		{
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procActionTariffRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen) throws ServletException, IOException 
		{

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINT");

			// Send data
			try 
			{
				mp = new MessageProcessor("EDL1540");
				EDL154003Message msg = (EDL154003Message) mp.getMessageRecord("EDL154003");
				
				//Send Initial data
				msg.setH03USERID(user.getH01USR());
				msg.setH03PROGRM("EDL1540");
				msg.setH03TIMSYS(getTimeStamp());
				msg.setH03SCRCOD("01");
				msg.setH03OPECOD("0002");
				
				switch (screen) 
				{
					case R_TARIFF_NEW : // Request new Record
						userPO.setPurpose("NEW");
						break;
					case R_TARIFF_UPD : // Request old Record
						userPO.setPurpose("MAINT");
						break;
				}
				if(screen != R_TARIFF_NEW)
				{
//					//Get List from session and get the specific row from the list
					try
					{
						JBObjList list =(JBObjList)ses.getAttribute("EDL1540List");
						msg = (EDL154003Message)list.get(Integer.parseInt(req.getParameter("ROW")));
						ses.setAttribute("EDL1540Record", msg);
						forward("EDL1540_tariff_maint.jsp", req, res);
					}
					catch (Exception e)
					{
						ses.setAttribute("error", newmessage);
						forward("EDL1540_tariff_list.jsp", req, res);
					} 
				}
				else
				{
					EDL154003Message record = new EDL154003Message();
					ses.setAttribute("EDL1540Record", record);
					forward("EDL1540_tariff_maint.jsp", req, res);				
				}
				
				ses.setAttribute("userPO", userPO);
	        } 
			finally 
			{
				if (mp != null) 
					mp.close();
			}
		}

	protected void procSubmitTariffRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses) throws ServletException, IOException 
		{

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			boolean success = true;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			// Send data
			try 
			{
				mp = new MessageProcessor("EDL1540");
//				EDL154002Message msg = (EDL154002Message) mp.getMessageRecord("EDL154002");
				EDL154003Message msg = (EDL154003Message) ses.getAttribute("EDL1540Record");
				msg.setH03USERID(user.getH01USR());
				msg.setH03PROGRM("EDL1540");
				msg.setH03TIMSYS(getTimeStamp());
				msg.setH03SCRCOD("01");
				msg.setH03OPECOD("0005");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				try{
					msg.setE03BNK(req.getParameter("E03BNK") == null ? " " : req.getParameter("E03BNK"));
				}catch(Exception e){
				}
				try{
					msg.setE03CDE(req.getParameter("E03CDE") == null ? " " : req.getParameter("E03CDE"));
				}catch(Exception e){
				}
				try{
					msg.setE03VDY(req.getParameter("E03VDY") == null ? " " : req.getParameter("E03VDY"));
				}catch(Exception e){
				}
				try{
					msg.setE03VDD(req.getParameter("E03VDD") == null ? " " : req.getParameter("E03VDD"));
				}catch(Exception e){
				}
				
				// Get all fields in page
				try 
				{
					super.setMessageRecord(req, msg);
				} 
				catch (Exception e) {	}
						
				ses.setAttribute("EDL1540Record", msg);
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) 
				{
					ses.setAttribute("error", newmessage);
					ses.setAttribute("EDL1540Record", msg);
					success = false;				
				}
					
				newmessage = mp.receiveMessageRecord();
				if(newmessage.getFormatName().equals("EDL154003"))
				{
					ses.setAttribute("EDL1540Record", newmessage);	
				}
				
				if(success)
				{				
					procReqTariffList(user, req, res, ses);
				}
				else
				{
					forward("EDL1540_tariff_maint.jsp", req, res);
				}
		    } 
			finally
			{
				if (mp != null) 
					mp.close();
			}
		}

	protected void procActionTariffDel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen) throws ServletException, IOException 
		{

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			boolean success = true;
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("DELETE");

			// Send data
			try 
			{
				mp = new MessageProcessor("EDL1540");
				EDL154003Message msg = (EDL154003Message) mp.getMessageRecord("EDL154003");
				
//					//Get List from session and get the specific row from the list
					try
					{
						JBObjList list =(JBObjList)ses.getAttribute("EDL1540List");
						msg = (EDL154003Message)list.get(Integer.parseInt(req.getParameter("ROW")));
						//Send Initial data
						msg.setH03USERID(user.getH01USR());
						msg.setH03PROGRM("EDL1540");
						msg.setH03TIMSYS(getTimeStamp());
						msg.setH03SCRCOD("01");
						msg.setH03OPECOD("0009");
						
						ses.setAttribute("EDL1540Record", msg);
						mp.sendMessage(msg);
						ses.setAttribute("userPO", userPO);
						// Receive Error Message or Data Message (Optional)
					
						newmessage = mp.receiveMessageRecord();
						if (mp.hasError(newmessage)) 
						{
							ses.setAttribute("error", newmessage);
							ses.setAttribute("EDL1540Record", msg);
							success = false;				
						}
							
						if(newmessage.getFormatName().equals("EDL154003"))
						{
							ses.setAttribute("EDL1540Record", newmessage);	
						}
						
						if(success)
						{				
							procReqTariffList(user, req, res, ses);
						}
						else
						{
							forward("EDL1540_tariff_list.jsp", req, res);
						}
						
						
						
					}
					catch (Exception e)
					{
						ses.setAttribute("error", newmessage);
						forward("EDL0526_tariff_list.jsp", req, res);
					} 
				
				
				ses.setAttribute("userPO", userPO);
	        } 
			finally 
			{
				if (mp != null) 
					mp.close();
			}
		}
	
	private void procReqInput(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws ServletException, IOException {
		
		forward("EDL1540_input_enter.jsp", req, res);
	}
	
	protected void procActionInput(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses) throws ServletException, IOException 
		{

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;
			boolean success = true;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			// Send data
			try 
			{
				mp = new MessageProcessor("EDL1540");
				EDL154004Message msg = (EDL154004Message) mp.getMessageRecord("EDL154004");
				msg.setH04USERID(user.getH01USR());
				msg.setH04PROGRM("EDL1540");
				msg.setH04TIMSYS(getTimeStamp());
				msg.setH04SCRCOD("01");
				msg.setH04OPECOD("0005");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				// Get all fields in page
				try 
				{
					super.setMessageRecord(req, msg);
				} 
				catch (Exception e) {	}
				ses.setAttribute("EDL1540Record", msg);
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) 
				{
					ses.setAttribute("error", newmessage);
					ses.setAttribute("EDL1540Record",msg);
					success = false;				
				}
					
				newmessage = mp.receiveMessageRecord();
				if(newmessage.getFormatName().equals("EDL154004"))
				{
					ses.setAttribute("EDL1540Record", newmessage);	
				}
				
				if(success)
				{				
					forward("EDL1540_input_file_confirmation.jsp", req, res);
				}
				else
				{
					forward("EDL1540_input_enter.jsp", req, res);
				}
		    } 
			finally
			{
				if (mp != null) 
					mp.close();
			}
		}


	
}

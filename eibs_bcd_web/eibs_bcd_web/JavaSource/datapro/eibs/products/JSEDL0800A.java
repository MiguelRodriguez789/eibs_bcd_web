package datapro.eibs.products;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import datapro.eibs.beans.EDL080001Message;
import datapro.eibs.beans.EDL080004Message;
import datapro.eibs.beans.EDL080030Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.sockets.DecimalField;

public class JSEDL0800A extends JSEIBSServlet {

	protected static final int R_REQ_IMPORT = 1500;
	protected static final int A_REQ_IMPORT = 1510;
	protected static final int A_IMPORT_FILE = 1520;
	protected static final int A_PROCESS_EXCEL_FILE = 1530;

	private ServletConfig config = null;
	
	protected static final int cellDate = 6;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}
	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		if (screen == 1) screen = A_PROCESS_EXCEL_FILE;
			
		switch (screen) {
		case R_REQ_IMPORT :
			procReqImport(user, req, res, session);
			break;
		case A_REQ_IMPORT :
			procActionImport(user, req, res, session);
			break;
		case A_IMPORT_FILE :
			procActionImportFile(user, req, res, session);
			break;
		case A_PROCESS_EXCEL_FILE :
			procReadExcelFile(user, req, res, session);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procReqImport(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		MessageProcessor mp = null;
		String action = "E";
		UserPos userPO = getUserPos(req);
		userPO.setSource("FACT");
		userPO.setHeader23("DFT");
		userPO.setPurpose("NEW");
		EDL080001Message dftBasic = null;
		userPO.setHeader6("H");
		try {
			dftBasic = (EDL080001Message)session.getAttribute("dftBasic");

			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}
		try {
			action = req.getParameter("ACTION");
		} catch( Exception e) {
			
		}
		if (action != null && action.equals("B")) {
			dftBasic.setE01DEAPRO(req.getParameter("E01DEAPRO"));
			userPO.setProdCode(dftBasic.getE01DEAPRO().trim());
			userPO.setCusNum(dftBasic.getE01DEACUN().trim());
			userPO.setCusName(dftBasic.getE01CUSNA1().trim());
			userPO.setCurrency(dftBasic.getE01DEACCY());
			userPO.setBank(dftBasic.getE01DEABNK());
			userPO.setBranch(dftBasic.getE01DEABRN());
			userPO.setType(dftBasic.getE01DEACCY());
			userPO.setHeader4(dftBasic.getE01DSCPRO());
			userPO.setHeader23("DFT");
			session.setAttribute("dftBasic", dftBasic);
		}
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		forward("EDL0800_dft_upload_enter.jsp", req, res);
	}

	private void procActionImport(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0800", req);
			EDL080001Message dftBasic = (EDL080001Message) mp.getMessageRecord("EDL080001");
			dftBasic.setH01USERID(user.getH01USR());
			dftBasic.setH01PROGRM("EDL0800");
			dftBasic.setH01TIMSYS(getTimeStamp());
			dftBasic.setH01SCRCOD("01");
			dftBasic.setH01OPECOD("0100");
			dftBasic.setE01DEAACD("10");
			try {
				dftBasic.setE01DEAPRO(req.getParameter("E01DEAPRO"));
			} catch (Exception e) {
				dftBasic.setE01DEAPRO("");
			}

			try {
				dftBasic.setE01DEACUN(req.getParameter("E01DEACUN"));
			} catch (Exception e) {
				dftBasic.setE01DEACUN(" ");
			}
			
			mp.sendMessage(dftBasic);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			dftBasic = (EDL080001Message) mp.receiveMessageRecord("EDL080001");
			
			if (mp.hasError(msgError)) {
				pageName = "EDL0800_dft_upload_enter.jsp";
			} else {
				userPO.setProdCode(dftBasic.getE01DEAPRO().trim());
				userPO.setCusNum(dftBasic.getE01DEACUN().trim());
				userPO.setCusName(dftBasic.getE01CUSNA1().trim());
				userPO.setCurrency(dftBasic.getE01DEACCY());
				userPO.setBank(dftBasic.getE01DEABNK());
				userPO.setBranch(dftBasic.getE01DEABRN());
				userPO.setType(dftBasic.getE01DEACCY());
				userPO.setHeader4(dftBasic.getE01DSCPRO());
				userPO.setHeader23("DFT");
				
				pageName = "EDL0800_dft_upload_data.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("dftBasic", dftBasic);
			session.setAttribute("userPO", userPO);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionImportFile(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0800", req);
			EDL080001Message dftBasic = (EDL080001Message) mp.getMessageRecord("EDL080001");
			dftBasic.setH01USERID(user.getH01USR());
			dftBasic.setH01PROGRM("EDL0800");
			dftBasic.setH01TIMSYS(getTimeStamp());
			dftBasic.setH01SCRCOD("01");
			dftBasic.setH01OPECOD("0101");
			dftBasic.setE01DEAACD("10");
			dftBasic.setE01DEAACR("0");
			
			setMessageRecord(req, dftBasic);
			
			mp.sendMessage(dftBasic);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			dftBasic = (EDL080001Message) mp.receiveMessageRecord("EDL080001");
			
			if (mp.hasError(msgError)) {
				pageName = "EDL0800_dft_upload_data.jsp";
			} else {
				userPO.setProdCode(dftBasic.getE01DEAPRO().trim());
				userPO.setCusNum(dftBasic.getE01DEACUN().trim());
				userPO.setCusName(dftBasic.getE01CUSNA1().trim());
				userPO.setCurrency(dftBasic.getE01DEACCY());
				userPO.setBank(dftBasic.getE01DEABNK());
				userPO.setBranch(dftBasic.getE01DEABRN());
				userPO.setType(dftBasic.getE01DEACCY());
				userPO.setHeader4(dftBasic.getE01DSCPRO());
				userPO.setHeader23("DFT");
				
				pageName = "EDL0800_dft_upload_file.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("dftBasic", dftBasic);
			session.setAttribute("userPO", userPO);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReadExcelFile(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		SmartUpload mySmartUpload = new SmartUpload();
		String action = "";
		EDL080001Message dftBasic = null;
		try {
			mySmartUpload.initialize(config, req, res);
			mySmartUpload.upload();
			action = mySmartUpload.getRequest().getParameter("ACTION");
			if (action != null && !action.equals("V")) {
				if (action.equals("B")) {
					try {
						dftBasic = (EDL080001Message)session.getAttribute("dftBasic");
					} catch (Exception ex) {
						flexLog("Error: " + ex);
					}
					session.setAttribute("dftBasic", dftBasic);
					pageName = "EDL0800_dft_upload_data.jsp";
					forward(pageName, req, res);
				} else {
					res.sendRedirect(srctx + "/pages/background.jsp");
				}
				
			} else {
				com.jspsmart.upload.File file =  mySmartUpload.getFiles().getFile(0);
				userPO.setSource(file.getFilePathName());
				InputStream xls = Util.getStreamFromFile(file);
				
				Workbook book = null;
				int fromSheet = 0;
				int toSheet = 0;
				Sheet sheet = null;
				Row row = null;
				Cell cell = null;
				int rowCount = 0;
				int colCount = 0;
				int[] cellType = null;
				String[] fieldNames = null;
				Object[] data = null;
				String numF = "";
				String numFmt = "";
				
				JBObjList errors = new JBObjList();
				JBObjList list = new JBObjList();
				int counter = 0;
				
				if (ExcelUtils.isXLSXVersion(file.getFilePathName())) {
					book = new XSSFWorkbook(xls);
				} else {
					book = new HSSFWorkbook(xls);
				}
				
				for (int s = fromSheet;s == toSheet;s++) {
					sheet = book.getSheetAt(0);
					rowCount = sheet.getLastRowNum();
					colCount = sheet.getRow(0).getLastCellNum();
					cellType = new int[colCount];
					fieldNames = new String[colCount];
					row = sheet.getRow(1);
					if (row.getCell(0) != null) {
						for (int c = 0;c < colCount;c++) {
							cell = row.getCell(c);
							if (cell != null) {
								if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
									fieldNames[c] = cell.getStringCellValue();
								}
							}
						}
					}
					for (int r = 2; r <= rowCount;r++) {
						data = new Object[colCount];
						row = sheet.getRow(r);
						if (row.getCell(0) == null && row.getCell(15) == null) {
							rowCount = r - 1;
							break;
						}
						counter++;
						for (int c = 0;c < colCount;c++) {
							cell = row.getCell(c);
							if (cell == null) {
								cell = row.createCell(c);
								cell.setCellType(XSSFCell.CELL_TYPE_BLANK);
							}
							int type = cell.getCellType();
							try {
								numF = cell.getCellStyle().getDataFormatString();
								numF = numF.replace('@', ' ').trim();
								numF = numF.replace(';', ' ').trim();
								numFmt = numF.toLowerCase();
								numFmt = numFmt.replaceAll("d", "");
								numFmt = numFmt.replaceAll("m", "");
								numFmt = numFmt.replaceAll("y", "");
								numFmt = numFmt.replaceAll("/", "");
								numFmt = numFmt.replaceAll("-", "");
							} catch (Exception e) {
							
							}
							String DateFmt = cell.getCellStyle().getDataFormatString().toLowerCase();
							if (DateFmt.indexOf('m') >= 0 && DateFmt.indexOf('d') >= 0 &&
									DateFmt.indexOf('y') >= 0 && numFmt.trim().length() == 0)  {
								type = cellDate;
								numF = numF.replace("mm", "MM");
							}
							cellType[c] = type;
							switch (type) {
							case Cell.CELL_TYPE_BLANK:
								data[c] = (" ");
								break;
							case Cell.CELL_TYPE_BOOLEAN:
								data[c] = cell.getBooleanCellValue();
								break;
							case Cell.CELL_TYPE_ERROR:
								data[c] = "ERROR";
								break;
							case Cell.CELL_TYPE_FORMULA:
								data[c] = cell.getCellFormula();
								break;
							case cellDate:
								SimpleDateFormat sdf = new SimpleDateFormat(numF);
								Calendar date = Calendar.getInstance();
								try {
									if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
										date = DateUtil.getJavaCalendar(cell.getNumericCellValue(),false);
									} else {
										String dateStr = cell.getStringCellValue();
										date.setTime(sdf.parse(dateStr));
									}
								} catch (Exception e) {
									date.set(1900, 01, 01);
								}
								data[c] = date;
								break;
							case Cell.CELL_TYPE_NUMERIC:
								int dtaFmt = cell.getCellStyle().getDataFormat();
								if (dtaFmt == 49) {
									try {
										data[c] = new BigDecimal(cell.getNumericCellValue());
									} catch (Exception e) {
										cellType[c] = XSSFCell.CELL_TYPE_STRING;
										data[c] = cell.getStringCellValue();
									}
								} else {
									data[c] = new BigDecimal(cell.getNumericCellValue());
								}
								break;
							default:
								char dat = cell.getStringCellValue().charAt(0);
								if (c == 0 && dat == '*') {
									c = colCount;
									r = rowCount;
								} else {
									data[c] = cell.getStringCellValue();
								}
								break;
							}
						}	
						String numDoc = counter + "";
						dftBasic = (EDL080001Message) session.getAttribute("dftBasic");
						mp = getMessageProcessor("EDL0800", req);
						EDL080004Message msg = (EDL080004Message) mp.getMessageRecord("EDL080004");
						msg = loadMessage(user, msg, cellType, fieldNames, data);
						msg = loadHeader(user, msg, dftBasic);
						//msg.setE04DLDNDR(numDoc);
						msg.setH04USERID(user.getH01USR());
						msg.setH04PROGRM("EDL0800");
						msg.setH04USERID(user.getH01USR());
						msg.setH04TIMSYS(getTimeStamp());
						msg.setH04SCRCOD("01");
						msg.setH04OPECOD("0001");
						msg.setE04DLDRRN(String.valueOf(counter));
						mp.sendMessage(msg);
						
						ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
						msg = (EDL080004Message) mp.receiveMessageRecord("EDL080004");
	
						if (mp.hasError(msgError)) {
							errors.add(msgError);
							list.add(msg);
							list.add(msgError);
						}	
	
					}
				}
				session.setAttribute("userPO", userPO);
				dftBasic = (EDL080001Message) session.getAttribute("dftBasic");
				session.setAttribute("dftBasic", dftBasic);
				
				if (errors.isEmpty()) {
					try {
						mp = getMessageProcessor("EDL0800", req);
						dftBasic.setH01USERID(user.getH01USR());
						dftBasic.setH01PROGRM("EDL0800");
						dftBasic.setH01TIMSYS(getTimeStamp());
						dftBasic.setH01SCRCOD("01");
						dftBasic.setH01OPECOD("0102");
						dftBasic.setE01DEAACD("10");
						
						setMessageRecord(req, dftBasic);
						
						mp.sendMessage(dftBasic);
						ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
						dftBasic = (EDL080001Message) mp.receiveMessageRecord("EDL080001");
						session.setAttribute("dftBasic", dftBasic);
						session.setAttribute("error", msgError);
						if (msgError.getERRNUM().equals("0")) {
							EDL080030Message dftTrans = (EDL080030Message) mp.receiveMessageRecord("EDL080030");
							session.setAttribute("userPO", userPO);
							session.setAttribute("lnGenTran", dftTrans);
							pageName = "EDL0800_dft_new_transac.jsp";
						}else {
							session.setAttribute("list", list);
							session.setAttribute("errors", errors);
							pageName = "EDL0800_dft_upload_file.jsp";
						}
					} finally {
						if (mp != null) mp.close();
					}
				} else {
					session.setAttribute("list", list);
					session.setAttribute("errors", errors);
					pageName = "EDL0800_dft_upload_file.jsp";
				}
				
				forward(pageName, req, res);
			}
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (mp != null) mp.close();
		}
		
		
	}

	private EDL080004Message loadMessage(ESS0030DSMessage user, EDL080004Message msg, int[] cellType, String[] fieldNames, Object[] data) {

//		String[] fieldNames = { "E04DLDDID", "E04CUMMAN", "E04CUMMA1", "E04DPNE", "E04DPNI", "E04DPCA", "E04DPCP", 
//				"E04DLDRFN", "E04DLDMAM-D-Y", "E04DLDFAM", "E04DLDOAM", "E04DLDCTA",
//				"E04DLDEXT"};
		int numFields = fieldNames.length;
		if (data.length < numFields) {
			numFields = data.length;
		}
		for (int x = 0;x < fieldNames.length;x++) {
			msg = getData(user, fieldNames[x], msg, cellType[x], data[x], x);
		}
		return msg;

	}
	
	private EDL080004Message getData(ESS0030DSMessage user, String field, EDL080004Message msg, int cellType, Object data, int col) {
		String dateField = field;
		if (field.indexOf('-') > 0) {
			field = field.substring(0, field.indexOf('-')) ;
		}
		
		try {
			msg.getField(field);
		} catch (Exception e) {
			return msg;
		}
		int fldLen = msg.getField(field).getLength();
		int fldType = msg.getField(field).getType();
		if (fldType == 1) {
			cellType = XSSFCell.CELL_TYPE_STRING;
		}
		switch (cellType) {
		case Cell.CELL_TYPE_NUMERIC:
			try {
//				double value = Util.parseCCYtoDouble(data.toString());
				((DecimalField)msg.getField(field)).setBigDecimal(new BigDecimal(data.toString()));
			} catch (Exception e) {
				msg.getField(field).setString("0");
			}
			break;
		case Cell.CELL_TYPE_BLANK:
		case Cell.CELL_TYPE_BOOLEAN:
		case Cell.CELL_TYPE_ERROR:
		case Cell.CELL_TYPE_STRING:
			String dataStr = data.toString();
			try {
				if (fldLen < dataStr.length()) {
					msg.getField(field).setString(dataStr.substring(0,fldLen));
				}
				else {
					msg.getField(field).setString(dataStr);
				}
			} catch (Exception e) {
				msg.getField(field).setString("0");
			}
			break;
		case cellDate:
			String field0 = "";
			String field1 = "";
			String field2 = "";
			String field3 = "";
			String fecha8 = "";
			String fecha6 = "";
			Calendar date = (Calendar)data;
			field0 = field.substring(0, field.length() - 1);
			String lstChar = field.substring(field.length() - 1);
			if (dateField.indexOf("-") > 0 && (dateField.lastIndexOf("-") > 0 && dateField.indexOf("-") != dateField.lastIndexOf("-"))) {
				if (lstChar.equals("M") || lstChar.equals("D") || lstChar.equals("Y") ) {
					field1 = field0 + "M";
					field2 = field0 + "D";
					field3 = field0 + "Y";
				} else {
					if (user.getE01DTF().trim().equals("MDY") ) {
						field1 = field0 + "1";
						field2 = field0 + "2";
						field3 = field0 + "3";
					} else if (user.getE01DTF().trim().equals("DMY") ) {
						field2 = field0 + "1";
						field1 = field0 + "2";
						field3 = field0 + "3";
					} else if (user.getE01DTF().trim().equals("YMD")) {
						field3 = field0 + "1";
						field1 = field0 + "2";
						field2 = field0 + "3";
					}
				}
			}
			fldLen = msg.getField(field).getLength();
			String day = String.valueOf(date.get(Calendar.DATE));  
			String month = String.valueOf(date.get(Calendar.MONTH) + 1);
			String year = String.valueOf(date.get(Calendar.YEAR));
			day = "00" + day.trim();
			day = day.substring(day.length()-2);
			month = "00" + month.trim();
			month = month.substring(month.length()-2);
			year = "0000" + year.trim();
			year = year.substring(year.length()-4);
			fecha8 = month + day + year;
			fecha6 = month + day + year.substring(2, 4);
			switch (fldLen) {
			case 8:
				try {
					msg.getField(field).setString(fecha8);
				} catch (Exception e) {
					msg.getField(field).setString("0");
				}
				break;
			case 6:
				try {
					msg.getField(field).setString(fecha6);
				} catch (Exception e) {
					msg.getField(field).setString("0");
				}
				break;
			case 2:
				try {
					msg.getField(field1).setString(month);
					msg.getField(field2).setString(day);
					msg.getField(field3).setString(year);
				} catch (Exception e) {
					msg.getField(field1).setString("0");
					msg.getField(field2).setString("0");
					msg.getField(field3).setString("0");
				}
			}
		}
		return msg;
	}
	
	private EDL080004Message loadHeader(ESS0030DSMessage user, EDL080004Message msg, EDL080001Message dftBasic) {
		msg.setE04DLDBNK(dftBasic.getE01DEABNK());
		msg.setE04DLDBRN(dftBasic.getE01DEABRN());
		msg.setE04DLDCCY(dftBasic.getE01DEACCY());
		msg.setE04DLDGLN(dftBasic.getE01DEAGLN());
		msg.setE04CUN(dftBasic.getE01DEACUN());
		msg.setE04DLDNLN(dftBasic.getE01DEAACR());
		msg.setE04DLDDTP(dftBasic.getE01DEARET());
		msg.setE04DLDRFM(dftBasic.getE01DEAODM());
		msg.setE04DLDRFD(dftBasic.getE01DEAODD());
		msg.setE04DLDRFY(dftBasic.getE01DEAODY());
		msg.setE04DLDBAS(dftBasic.getE01DEABAS());

		return msg;
	}
}

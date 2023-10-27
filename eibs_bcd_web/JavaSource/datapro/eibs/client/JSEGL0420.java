package datapro.eibs.client;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: erodriguez
 */
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Iterator;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.HeaderFooter;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import datapro.eibs.beans.EGL042001Bean;
import datapro.eibs.beans.EGL042001Message;
import datapro.eibs.beans.EGL042002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ExcelColStyle;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.sockets.MessageRecord;

public class JSEGL0420 extends JSEIBSServlet {

	// GL Statement options
	protected static final int R_LIST 	= 1;
	protected static final int R_PRINT 	= 3;
	protected static final int R_EXCEL 	= 5;
	protected static final int R_PDF 	= 6;

	// entering options
	protected static final int R_SELECTION = 100;
	protected static final int A_SELECTION = 200;
	protected static final int R_COMEBACK  = 300;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		case R_LIST :
			procReqList(user, req, res, session);
			break;
		case R_PRINT :
			procReqPrintList(user, req, res, session);
			break;
			// Entering Options
		case R_SELECTION :
			procReqSelection(user, req, res, session);
			break;
		case A_SELECTION :
			procActionSelection(user, req, res, session);
			break;
		case R_COMEBACK :
			forward("EGL0420_st_selection.jsp", req, res);
			break;
		case R_EXCEL :
			procReqExcel(user, req, res, session);
			break;
		case R_PDF :
			procReqPDF(user, req, res, session, screen);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procReqPDF(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen) throws IOException, ServletException {
		
		final float BLACK = 0.0f;
		final float LITEGRAY = 0.9f;
		final float DARKGRAY = 0.7f;
		final float WHITE = 1.0f;
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0420", req);
			EGL042001Message msgSearch = (EGL042001Message) mp.getMessageRecord("EGL042001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EGL0420");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");
			msgSearch.setH01FLGWK1("P");

			msgSearch.setE01TRABNK(userPO.getBank());
			msgSearch.setE01TRABRN(userPO.getBranch());
			msgSearch.setE01TRACCY(userPO.getCurrency());
			msgSearch.setE01TRAGLN(userPO.getAccNum());
			msgSearch.setE01HISCYC(userPO.getHeader7());
			msgSearch.setE01VALBTH(userPO.getHeader8());
			msgSearch.setE01FRDTEM(userPO.getHeader9());
			msgSearch.setE01FRDTED(userPO.getHeader10());
			msgSearch.setE01FRDTEY(userPO.getHeader11());
			msgSearch.setE01TODTEM(userPO.getHeader12());
			msgSearch.setE01TODTED(userPO.getHeader13());
			msgSearch.setE01TODTEY(userPO.getHeader14());
			msgSearch.setE01FRREFN(userPO.getHeader15());
			msgSearch.setE01TOREFN(userPO.getHeader16());
			msgSearch.setE01FRAMNT(userPO.getHeader17());
			msgSearch.setE01TOAMNT(userPO.getHeader18());
			
			mp.sendMessage(msgSearch);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				forward("error_viewer.jsp", req, res);
			} else {
				String title = "Estado de la Contabilidad";
				String creator = "";
				
				Document doc = new Document(PageSize.LETTER, 36, 36, 36, 36);
				
				ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
				PdfWriter docWriter = null;
				try {
					docWriter = PdfWriter.getInstance(doc, baosPDF);
					
					doc.addAuthor("eIBS");
					doc.addCreationDate();
					doc.addProducer();
					doc.addTitle(title);
					doc.addKeywords("pdf, itext, Java, open source, http");

					
					Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.NORMAL);
					Font headerBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD);
					
					String header0 = "Cuenta Contable";
					String header1 = "Tipo de Cuenta";
					String header2 = "Clase de Cuenta";
					String header3 = "Cuenta Reconciliable";
					String header4 = "Fecha de Apertura";
					String header5 = "Requiere Centro de Costo";
					String header6 = "Fecha de Ultima Transacción";
					String header7 = "Promedio del Mes";
					String header8 = "Balance Actual";
					String header9 = "Saldo Inicial";
					
					String detail1 = "Fecha Proceso";
					if ("V".equals(userPO.getHeader8())) {
						detail1 = "Fecha Valor";
					}
					String detail2 = "Referencia";
					String detail3 = "Descripción";
					String detail4 = "Débito";
					String detail5 = "Crédito";
					String detail6 = "Saldo";
					
					String page = "Numero de Pagina: ";
					
					String footer1 = "Total Debitos";
					String footer2 = "Total Creditos";
					String footer3 = "Saldo Final";
					
					Paragraph TITLE = new Paragraph(title, headerBoldFont);

					Paragraph BLANK = new Paragraph("", headerBoldFont);

					HeaderFooter header = new HeaderFooter(TITLE, false);
					header.setBorder(Rectangle.NO_BORDER);
					header.setAlignment(Element.ALIGN_CENTER);
					doc.setHeader(header);

					HeaderFooter footer = new HeaderFooter(new Phrase(page), true);
					footer.setBorder(Rectangle.TOP);
					footer.setAlignment(Element.ALIGN_RIGHT);
					doc.setFooter(footer);

					doc.open();

					Table table = new Table(2, 6);
					table.setBorderWidth(0);
					table.setCellsFitPage(true);
					table.setPadding(1);
					table.setSpacing(1);
					table.setWidth(100);
					
					PdfPTable datatable = new PdfPTable(6);
					
					boolean firstTime = true;
					BigDecimal debit = new BigDecimal("0.00");
					BigDecimal credit = new BigDecimal("0.00");
					int countDebit = 0;
					int countCredit = 0;
					String processDate = "";
					String valueDate = "";
					String reference = "";
					String description = "";
					String strDebit = "";
					String strCredit = "";
					String balance = "";
					int index = 0;
					
					EGL042001Message msgList = null;
					while (true) {
						if (msg.getFormatName().equals("EGL042002")) {
							EGL042002Message stGLBal = (EGL042002Message) msg;
							creator = stGLBal.getH02USERID();
							doc.addCreator(creator);
							
							String text0 =  userPO.getBank().trim() + " " + 
									userPO.getCurrency().trim() + " " +
									userPO.getBranch().trim() + " " +
									userPO.getAccNum().trim() + " " +
									stGLBal.getE02GLMDSC().trim();
							String text1 = "(" + stGLBal.getE02GLMATY().trim() + ") " +
									stGLBal.getE02DSCATY().trim();
							String text2 = "(" + stGLBal.getE02GLMCLS().trim() + ") " +
									stGLBal.getE02DSCCLS().trim();	
							String text3 = "Y".equals(stGLBal.getE02GLMRCL()) ? "Si" : "No";
							String text4 = Util.formatCustomDate(user.getE01DTF(),
									stGLBal.getBigDecimalE02GLBOPM().intValue(),
									stGLBal.getBigDecimalE02GLBOPD().intValue(),
									stGLBal.getBigDecimalE02GLBOPY().intValue());	
							String text5 = "Y".equals(stGLBal.getE02GLMCCN()) ? "Si" : "No";
							String text6 = Util.formatCustomDate(user.getE01DTF(),
									stGLBal.getBigDecimalE02GLBLUM().intValue(),
									stGLBal.getBigDecimalE02GLBLUD().intValue(),
									stGLBal.getBigDecimalE02GLBLUY().intValue());	
							String text7 = Util.fcolorCCY(stGLBal.getE02GLBAVG().trim());
							String text8 = Util.fcolorCCY(stGLBal.getE02GLBBAL().trim());
							
							Cell cell = new Cell(new Paragraph(header0 + " : " + text0, headerBoldFont));
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setBorder(Rectangle.NO_BORDER);
							cell.setColspan(2);
							table.addCell(cell);
							
							cell = new Cell(new Paragraph(header1 + " : " + text1, headerBoldFont));
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setBorder(Rectangle.NO_BORDER);
							cell.setColspan(2);
							table.addCell(cell);
							
							cell = new Cell(new Paragraph(header2 + " : " + text2, headerBoldFont));
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setBorder(Rectangle.NO_BORDER);
							table.addCell(cell);
							
							cell = new Cell(new Paragraph(header3 + " : " + text3, headerBoldFont));
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setBorder(Rectangle.NO_BORDER);
							table.addCell(cell);
							
							cell = new Cell(new Paragraph(header4 + " : " + text4, headerBoldFont));
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setBorder(Rectangle.NO_BORDER);
							table.addCell(cell);
							
							cell = new Cell(new Paragraph(header5 + " : " + text5, headerBoldFont));
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setBorder(Rectangle.NO_BORDER);
							table.addCell(cell);
							
							cell = new Cell(new Paragraph(header6 + " : " + text6, headerBoldFont));
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setBorder(Rectangle.NO_BORDER);
							table.addCell(cell);
							
							cell = new Cell(new Paragraph(header7 + " : " + text7, headerBoldFont));
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setBorder(Rectangle.NO_BORDER);
							table.addCell(cell);
							
							cell = new Cell(new Paragraph(header8 + " : " + text8, headerBoldFont));
							cell.setHorizontalAlignment(Element.ALIGN_LEFT);
							cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
							cell.setBorder(Rectangle.NO_BORDER);
							table.addCell(cell);
							
						} else if (msg.getFormatName().equals("EGL042001")) {
							msgList = (EGL042001Message) msg;
							if ("*".equals(msgList.getE01INDOPE())) {
								break;
							} else {
								if (firstTime) {
									firstTime = false;
									userPO.setHeader5(msgList.getE01BEGBAL());
									String text9 = Util.fcolorCCY(userPO.getHeader5().trim());
									
									Cell cell = new Cell(new Paragraph(header9 + " : " + text9, headerBoldFont));
									cell.setHorizontalAlignment(Element.ALIGN_LEFT);
									cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
									cell.setBorder(Rectangle.NO_BORDER);
									table.addCell(cell);
									
									cell = new Cell(BLANK);
									cell.setHorizontalAlignment(Element.ALIGN_LEFT);
									cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
									cell.setBorder(Rectangle.NO_BORDER);
									cell.setColspan(2);
									table.addCell(cell);
									
									doc.add(table);
									
									datatable.setComplete(false);
									datatable.getDefaultCell().setPadding(3);
									int headerwidths[] = { 10, 15, 30, 15, 15, 15 }; // percentage
									datatable.setWidths(headerwidths);
									datatable.setWidthPercentage(100); // percentage

									datatable.getDefaultCell().setBorderWidth(1);
									datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
									datatable.getDefaultCell().setGrayFill(DARKGRAY);
									datatable.addCell(new Paragraph(detail1, headerBoldFont));
									datatable.addCell(new Paragraph(detail2, headerBoldFont));
									datatable.addCell(new Paragraph(detail3, headerBoldFont));
									datatable.addCell(new Paragraph(detail4, headerBoldFont));
									datatable.addCell(new Paragraph(detail5, headerBoldFont));
									datatable.addCell(new Paragraph(detail6, headerBoldFont));

									datatable.setHeaderRows(1); // this is the end of the table header

									datatable.getDefaultCell().setBorderWidth(1);
								}
								
								index++;
								if (index % 2 == 1) {
									datatable.getDefaultCell().setGrayFill(WHITE);
								} else {
									datatable.getDefaultCell().setGrayFill(LITEGRAY);
								}
								
								strDebit = "0.00";
								strCredit = "0.00";
								
								if ("0".equals(msgList.getE01TRADCC())) {
									debit =
										debit.add(msgList.getBigDecimalE01TRAAMT());
									strDebit =
										Util.fcolorCCY(msgList.getE01TRAAMT().trim());
									countDebit++;
								} else if ("5".equals(msgList.getE01TRADCC())) {
									credit =
										credit.add(
											msgList.getBigDecimalE01TRAAMT());
									strCredit =
										Util.fcolorCCY(msgList.getE01TRAAMT().trim());
									countCredit++;
								}
								if ("V".equals(userPO.getHeader8())) {
									valueDate = Util.formatCustomDate(user.getE01DTF(),
											msgList.getBigDecimalE01DATE2M().intValue(),
											msgList.getBigDecimalE01DATE2D().intValue(),
											msgList.getBigDecimalE01DATE2Y().intValue());
									datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
									datatable.addCell(new Paragraph(valueDate, normalFont));
								} else {
									processDate = Util.formatCustomDate(user.getE01DTF(),
											msgList.getBigDecimalE01DATE1M().intValue(),
											msgList.getBigDecimalE01DATE1D().intValue(),
											msgList.getBigDecimalE01DATE1Y().intValue());
									datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
									datatable.addCell(new Paragraph(processDate, normalFont));
								}
								reference = Util.formatCell(msgList.getE01TRAACC().trim());
								datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
								datatable.addCell(new Paragraph(reference, normalFont));
								
								description = Util.formatCell(msgList.getE01TRANAR().trim());
								datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
								datatable.addCell(new Paragraph(description, normalFont));

								datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
								datatable.addCell(new Paragraph(strDebit, normalFont));

								datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
								datatable.addCell(new Paragraph(strCredit, normalFont));
								
								balance = Util.fcolorCCY(msgList.getE01ENDBAL().trim());
								datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
								datatable.addCell(new Paragraph(balance, normalFont));
								
								if (index % 100 == 0) {
									doc.add(datatable);
								}
							}		
						}
						msg = mp.receiveMessageRecord();
					}
					
					if (msgList != null) { //Balance Final
						userPO.setHeader21(msgList.getE01ENDBAL());
					}
					
					datatable.setComplete(true);
					doc.add(datatable);
					
					table = new Table(1, 1);
					table.setBorderWidth(0);
					table.setCellsFitPage(true);
					table.setPadding(1);
					table.setSpacing(1);
					table.setWidth(100);

					Cell cell = new Cell(BLANK);
					cell.setHorizontalAlignment(Element.ALIGN_LEFT);
					cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
					cell.setBorder(Rectangle.NO_BORDER);
					table.addCell(cell);

					doc.add(table);
					
					Paragraph TDEBIT =
						new Paragraph(
							Util.formatCCY(String.valueOf(debit))
								+ " ("
								+ countDebit
								+ ")",
							headerBoldFont);
					Paragraph TCREDIT =
						new Paragraph(
							Util.formatCCY(String.valueOf(credit))
								+ "( "
								+ countCredit
								+ ")",
							headerBoldFont);
					Paragraph ENDBAL = new Paragraph(Util.fcolorCCY(userPO.getHeader21().trim()), headerBoldFont);

					datatable = new PdfPTable(3);

					datatable.getDefaultCell().setPadding(3);
					datatable.getDefaultCell().setGrayFill(DARKGRAY);

					int headerwidths2[] = { 33, 34, 33 }; // percentage
					datatable.setWidths(headerwidths2);
					datatable.setWidthPercentage(100); // percentage

					datatable.getDefaultCell().setBorderWidth(1);
					datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
					datatable.addCell(new Paragraph(footer1, headerBoldFont));
					datatable.addCell(new Paragraph(footer2, headerBoldFont));
					datatable.addCell(new Paragraph(footer3, headerBoldFont));

					datatable.setHeaderRows(1); // this is the end of the table header

					datatable.getDefaultCell().setGrayFill(WHITE);
					datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
					datatable.addCell(TDEBIT);
					datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
					datatable.addCell(TCREDIT);
					datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
					datatable.addCell(ENDBAL);

					doc.add(datatable);
					
					if (doc != null) doc.close();
					if (docWriter != null) docWriter.close();
					
					StringBuffer sbFilename = new StringBuffer();
					String fn = com.datapro.generic.tool.Util.getTimestamp().toString();
					fn = Util.replace(fn,":", "-");
					fn = Util.replace(fn,".", "-");
					sbFilename.append(fn);
					sbFilename.append(".pdf");
					
					res.setHeader("Cache-Control", "max-age=30");
					res.setContentType("application/pdf");

					StringBuffer sbContentDispValue = new StringBuffer();
					sbContentDispValue.append("inline");
					sbContentDispValue.append("; filename=");
					sbContentDispValue.append(sbFilename);
					
					res.setHeader("Content-disposition", sbContentDispValue.toString());
					res.setContentLength(baosPDF.size());

					ServletOutputStream sos = res.getOutputStream();
					baosPDF.writeTo(sos);
					sos.flush();
					
				} catch (DocumentException dex) {
					if (docWriter != null) docWriter.close();
					if (doc != null) doc.close();
					res.setContentType("text/html");
					PrintWriter writer = res.getWriter();
					writer.println(
						this.getClass().getName()
							+ " caught an exception: "
							+ dex.getClass().getName()
							+ "<br>");
					writer.println("<pre>");
					dex.printStackTrace(writer);
					writer.println("</pre>");
				} finally {
					if (docWriter != null) docWriter.close();
					if (doc != null && doc.isOpen()) doc.close();
					if (baosPDF != null) baosPDF.close(); 
				}
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqExcel(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("", req);
			EGL042001Message msgSearch = (EGL042001Message) mp.getMessageRecord("EGL042001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EGL0420");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");
			msgSearch.setH01FLGWK1("P");
			
			msgSearch.setE01NUMREC("0");
			msgSearch.setE01TRABNK(userPO.getBank());
			msgSearch.setE01TRABRN(userPO.getBranch());
			msgSearch.setE01TRACCY(userPO.getCurrency());
			msgSearch.setE01TRAGLN(userPO.getAccNum());
			msgSearch.setE01HISCYC(userPO.getHeader7());
			msgSearch.setE01VALBTH(userPO.getHeader8());
			msgSearch.setE01FRDTEM(userPO.getHeader9());
			msgSearch.setE01FRDTED(userPO.getHeader10());
			msgSearch.setE01FRDTEY(userPO.getHeader11());
			msgSearch.setE01TODTEM(userPO.getHeader12());
			msgSearch.setE01TODTED(userPO.getHeader13());
			msgSearch.setE01TODTEY(userPO.getHeader14());
			msgSearch.setE01FRREFN(userPO.getHeader15());
			msgSearch.setE01TOREFN(userPO.getHeader16());
			msgSearch.setE01FRAMNT(userPO.getHeader17());
			msgSearch.setE01TOAMNT(userPO.getHeader18());
			
			mp.sendMessage(msgSearch);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				forward("error_viewer.jsp", req, res);
			} else {
				String fileName = "EGL0420_" + getTimeStamp() + "." + JSEIBSProp.getExcelFormat();
				String excelName = "attachment; filename=\"" + fileName + "\"";
				res.setContentType("application/vnd.ms-excel");			
				res.setHeader("Content-disposition", excelName);
				
				String[] fields = {"processDate", "registerDate", "reference", "code", "description", "debitAmount", "creditAmount", "balance", "lote", "valueDate", "valueTime", "user", "bank", "branch"};
				
				Vector headers = new Vector();
				for (int i = 0; i < fields.length; i++) {
					String name = fields[i];
					if (name.equals("class")) continue;
					if (name.equals("processDate")) { // E01DATE1M / E01DATE1D / E01DATE1Y
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("FECHA PROCESO");
						style.setFormat("dd/mm/yyyy");
						style.setAlign("center");
						headers.add(style);
					} else if (name.equals("registerDate")) { // ???
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("FECHA REGISTRO");
						style.setFormat("dd/mm/yyyy");
						style.setAlign("center");
						headers.add(style);
					} else if (name.equals("reference")) { // E01TRAACC
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("REFERENCIA");
						style.setAlign("center");
						style.setFormat("text");
						headers.add(style);
					} else if (name.equals("code")) { // E01TRACDE
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("TC");
						style.setAlign("center");
						headers.add(style);
					} else if (name.equals("description")) { // E01TRANAR
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("DESCRIPCION");
						style.setAlign("left");
						style.setWidth(30);
						headers.add(style);
					} else if (name.equals("debitAmount")) { // E01TRADCC = 0 E01TRAAMT
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("DEBITO");
						style.setFormat("#,##0.00");
						style.setAlign("right");
						style.setWidth(12);
						headers.add(style);
					} else if (name.equals("creditAmount")) { // E01TRADCC = 5 E01TRAAMT
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("CREDITO");
						style.setFormat("#,##0.00");
						style.setAlign("right");
						style.setWidth(12);
						headers.add(style);
					} else if (name.equals("balance")) { // E01ENDBAL
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("SALDO");
						style.setFormat("#,##0.00");
						style.setAlign("right");
						style.setWidth(12);
						headers.add(style);
					} else if (name.equals("lote")) { // E01TRABTH
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("LOTE");
						style.setAlign("center");
						headers.add(style);
					} else if (name.equals("valueDate")) { // E01DATE2M / E01DATE2D / E01DATE2Y
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("FECHA VALOR");
						style.setFormat("dd/mm/yyyy");
						style.setAlign("center");
						headers.add(style);
					} else if (name.equals("valueTime")) { // E01TRATMS
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("HORA");
						style.setAlign("center");
						style.setWidth(15);
						headers.add(style);
					} else if (name.equals("user")) { // E01TRAUSA
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("USUARIO");
						style.setAlign("center");
						style.setWidth(10);
						headers.add(style);
					} else if (name.equals("bank")) { // E01TRAOBK
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("BANCO");
						style.setAlign("center");
						headers.add(style);
					} else if (name.equals("branch")) { // E01TRAOBR
						ExcelColStyle style = new ExcelColStyle();
						style.setTag(name);
						style.setHidden(false);
						style.setLocked(false);
						style.setName("SUCURSAL");
						style.setAlign("center");
						headers.add(style);
					}	
				}	
				
				Workbook book = ExcelUtils.createWorkBook(headers, "xlsx".equalsIgnoreCase(JSEIBSProp.getExcelFormat()));
				Sheet sheet = book.getSheetAt(0);
				
				while (true) {
					if (msg.getFormatName().equals("EGL042002")) {
						EGL042002Message  msgHeader = (EGL042002Message) msg;
						//TODO something....
					} else if (msg.getFormatName().equals("EGL042001")) {
						msgSearch = (EGL042001Message) msg;
						if ("*".equals(msgSearch.getE01INDOPE())) {
							break;
						} else {
							EGL042001Bean bean = new EGL042001Bean();
							
							bean.setProcessDate(Util.getSqlDate(msgSearch.getBigDecimalE01DATE1M(), 
									msgSearch.getBigDecimalE01DATE1D(), msgSearch.getBigDecimalE01DATE1Y()));
							bean.setReference(msgSearch.getE01TRAACC().trim());
							bean.setCode(msgSearch.getE01TRACDE().trim());
							bean.setDescription(msgSearch.getE01TRANAR().trim());
							if ("5".equals(msgSearch.getE01TRADCC())) { //Credit
								bean.setDebitAmount(new BigDecimal("0.00"));
								bean.setCreditAmount(msgSearch.getBigDecimalE01TRAAMT());
							} else { //Debit
								bean.setCreditAmount(new BigDecimal("0.00"));
								bean.setDebitAmount(msgSearch.getBigDecimalE01TRAAMT());
							}
							bean.setBalance(msgSearch.getBigDecimalE01ENDBAL());
							bean.setLote(msgSearch.getE01TRABTH().trim());
							bean.setValueDate(Util.getSqlDate(msgSearch.getBigDecimalE01DATE2M(), 
									msgSearch.getBigDecimalE01DATE2D(), msgSearch.getBigDecimalE01DATE2Y()));
							bean.setValueTime(Util.getTimeFromTimestamp(msgSearch.getE01TRATMS()));
							bean.setUser(msgSearch.getE01TRAUSA().trim());
							bean.setBank(msgSearch.getE01TRAOBK().trim());
							bean.setBranch(msgSearch.getE01TRAOBR().trim());
							
							ExcelUtils.insertRow(book, sheet, headers, bean);
						}
					}
					msg = mp.receiveMessageRecord();
				}
				
				OutputStream out = ExcelUtils.getWorkBook(book, res.getOutputStream());
				out.flush();
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionSelection(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		try {
			userPO.setBank(req.getParameter("E01TRABNK").trim());
		} catch (Exception e) {
		}
		try {
			userPO.setBranch(req.getParameter("E01TRABRN").trim());
		} catch (Exception e) {
		}
		try {
			userPO.setCurrency(req.getParameter("E01TRACCY").toUpperCase());
		} catch (Exception e) {
		}
		try {
			userPO.setAccNum(req.getParameter("E01TRAGLN").trim());
		} catch (Exception e) {
		}
		try {
			userPO.setHeader7(req.getParameter("E01HISCYC").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setHeader8(req.getParameter("E01VALBTH").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setHeader9(req.getParameter("E01FRDTE1").trim());
			userPO.setHeader10(req.getParameter("E01FRDTE2").trim());
			userPO.setHeader11(req.getParameter("E01FRDTE3").trim());
		} catch (Exception e) {
			userPO.setHeader9("");
			userPO.setHeader10("");
			userPO.setHeader11("");
		}
		try {
			userPO.setHeader12(req.getParameter("E01TODTE1").trim());
			userPO.setHeader13(req.getParameter("E01TODTE2").trim());
			userPO.setHeader14(req.getParameter("E01TODTE3").trim());
		} catch (Exception e) {
			userPO.setHeader12("");
			userPO.setHeader13("");
			userPO.setHeader14("");
		}
		try {
			userPO.setHeader15(req.getParameter("E01FRREFN").trim());
		} catch (Exception e) {
		}
		try {
			userPO.setHeader16(req.getParameter("E01TOREFN").trim());
		} catch (Exception e) {
		}

		try {
			userPO.setHeader17(req.getParameter("E01FRAMNT").trim());
		} catch (Exception e) {
		}
		try {
			userPO.setHeader18(req.getParameter("E01TOAMNT").trim());
		} catch (Exception e) {
		}

		session.setAttribute("userPO", userPO);

		procReqList(user, req, res, session);
	}

	private void procReqSelection(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("GL");
		userPO.setPurpose("STATEMENT");
		session.setAttribute("userPO", userPO);
		
		forward("EGL0420_st_selection.jsp", req, res);
	}

	private void procReqPrintList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		int startPos = 0;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0420", req);
			EGL042001Message msgSearch = (EGL042001Message) mp.getMessageRecord("EGL042001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EGL0420");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");
			msgSearch.setH01FLGWK1("P");

			msgSearch.setE01TRABNK(userPO.getBank());
			msgSearch.setE01TRABRN(userPO.getBranch());
			msgSearch.setE01TRACCY(userPO.getCurrency());
			msgSearch.setE01TRAGLN(userPO.getAccNum());
			msgSearch.setE01HISCYC(userPO.getHeader7());
			msgSearch.setE01VALBTH(userPO.getHeader8());
			msgSearch.setE01FRDTEM(userPO.getHeader9());
			msgSearch.setE01FRDTED(userPO.getHeader10());
			msgSearch.setE01FRDTEY(userPO.getHeader11());
			msgSearch.setE01TODTEM(userPO.getHeader12());
			msgSearch.setE01TODTED(userPO.getHeader13());
			msgSearch.setE01TODTEY(userPO.getHeader14());
			msgSearch.setE01FRREFN(userPO.getHeader15());
			msgSearch.setE01TOREFN(userPO.getHeader16());
			msgSearch.setE01FRAMNT(userPO.getHeader17());
			msgSearch.setE01TOAMNT(userPO.getHeader18());

			mp.sendMessage(msgSearch);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EGL0420_st_selection.jsp";
			} else {
				boolean firstTime = true;
				StringBuffer myRow = null;
				String strDebit = "";
				String strCredit = "";
				BigDecimal debit = new BigDecimal("0.00");
				BigDecimal credit = new BigDecimal("0.00");
				int countDebit = 0;
				int countCredit = 0;
				JBList beanList = new JBList();
				EGL042001Message msgList = null;
				while (true) {
					if (msg.getFormatName().equals("EGL042002")) {
						session.setAttribute("stGLBal", msg);
					} else if (msg.getFormatName().equals("EGL042001")) {
						msgList = (EGL042001Message) msg;
						if ("*".equals(msgList.getE01INDOPE())) {
							break;
						} else {
							if (firstTime) {
								firstTime = false;
								if (startPos == 0) {
									userPO.setHeader5(msgList.getE01BEGBAL());
								}
							}
							strDebit = "0.00";
							strCredit = "0.00";

							if ("0".equals(msgList.getE01TRADCC())) {
								debit =
									debit.add(msgList.getBigDecimalE01TRAAMT());
								strDebit =
									Util.fcolorCCY(msgList.getE01TRAAMT().trim());
								countDebit++;
							} else if ("5".equals(msgList.getE01TRADCC())) {
								credit =
									credit.add(
										msgList.getBigDecimalE01TRAAMT());
								strCredit =
									Util.fcolorCCY(msgList.getE01TRAAMT().trim());
								countCredit++;
							}

							myRow = new StringBuffer("<TR>");
							myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\">"
								+ Util.formatCustomDate(user.getE01DTF(),
										msgList.getBigDecimalE01DATE1M().intValue(),
										msgList.getBigDecimalE01DATE1D().intValue(),
										msgList.getBigDecimalE01DATE1Y().intValue())
								+ "</TD>");
							myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"15%\">"
								+ Util.formatCell(msgList.getE01TRAACC())
								+ "</TD>");
							if (msgList.getE01NUMNAR().equals("0")) {
								myRow.append("<TD NOWRAP width=\"30%\">"
									+ Util.formatCell(msgList.getE01TRANAR())
									+ "</TD>");
							} else {
								if (msgList
									.getE01NUMNAR()
									.trim()
									.equals("1")) {
									myRow.append("<TD NOWRAP width=\"30%\">"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA1())
										+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"2")) {
									myRow.append("<TD NOWRAP width=\"30%\">"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA1())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA2())
										+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"3")) {
									myRow.append("<TD NOWRAP width=\"30%\">"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA1())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA2())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA3())
										+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"4")) {
									myRow.append("<TD NOWRAP width=\"30%\">"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA1())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA2())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA3())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA4())
										+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"5")) {
									myRow.append("<TD NOWRAP width=\"30%\">"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA1())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA2())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA3())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA4())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA5())
										+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"6")) {
									myRow.append("<TD NOWRAP width=\"30%\">"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA1())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA2())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA3())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA4())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA5())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA6())
										+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"7")) {
									myRow.append("<TD NOWRAP width=\"30%\">"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA1())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA2())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA3())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA4())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA5())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA6())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA7())
										+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"8")) {
									myRow.append("<TD NOWRAP width=\"30%\">"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA1())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA2())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA3())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA4())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA5())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA6())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA7())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA8())
										+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"9")) {
									myRow.append("<TD NOWRAP width=\"30%\">"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA1())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA2())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA3())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA4())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA5())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA6())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA7())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA8())
										+ "<BR>"
										+ Util.formatCell(msgList.getE01TRANA9())
										+ "</TD>");
								}
							}

							myRow.append("<TD NOWRAP ALIGN=RIGHT width=\"15%\">"
								+ strDebit
								+ "</TD>");
							myRow.append("<TD NOWRAP ALIGN=RIGHT width=\"15%\">"
								+ strCredit
								+ "</TD>");
							myRow.append("<TD NOWRAP ALIGN=RIGHT width=\"15%\">"
								+ Util.fcolorCCY(msgList.getE01ENDBAL().trim())
								+ "</TD>");
							myRow.append("</TR>");
							beanList.addRow("", myRow.toString());
						}	
					}
					msg = mp.receiveMessageRecord();
				}
				
				if (msgList != null) { //Balance Final
					userPO.setHeader21(msgList.getE01ENDBAL());
				}
				
				userPO.setHeader19(Util.fcolorCCY(debit.toString().trim()));
				userPO.setHeader20(Util.fcolorCCY(credit.toString().trim()));
				userPO.setHeader22(countDebit + "");
				userPO.setHeader23(countCredit + "");
				
				session.setAttribute("glList", beanList);
				
				if ("V".equals(userPO.getHeader8())) {
					pageName = "EGL0420_st_list_print_fv.jsp";
				} else {
					pageName = "EGL0420_st_list_print_fp.jsp";
				}
			}
				
				

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		int startPos = 0;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0420", req);
			EGL042001Message msgSearch = (EGL042001Message) mp.getMessageRecord("EGL042001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EGL0420");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");

			try {
				startPos = Integer.parseInt(req.getParameter("Pos"));
				msgSearch.setE01NUMREC("" + startPos);
			} catch (Exception e) {
			}

			msgSearch.setE01TRABNK(userPO.getBank());
			msgSearch.setE01TRABRN(userPO.getBranch());
			msgSearch.setE01TRACCY(userPO.getCurrency());
			msgSearch.setE01TRAGLN(userPO.getAccNum());
			msgSearch.setE01HISCYC(userPO.getHeader7());
			msgSearch.setE01VALBTH(userPO.getHeader8());
			msgSearch.setE01FRDTEM(userPO.getHeader9());
			msgSearch.setE01FRDTED(userPO.getHeader10());
			msgSearch.setE01FRDTEY(userPO.getHeader11());
			msgSearch.setE01TODTEM(userPO.getHeader12());
			msgSearch.setE01TODTED(userPO.getHeader13());
			msgSearch.setE01TODTEY(userPO.getHeader14());
			msgSearch.setE01FRREFN(userPO.getHeader15());
			msgSearch.setE01TOREFN(userPO.getHeader16());
			msgSearch.setE01FRAMNT(userPO.getHeader17());
			msgSearch.setE01TOAMNT(userPO.getHeader18());

			mp.sendMessage(msgSearch);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EGL0420_st_selection.jsp";
			} else {
				boolean firstTime = true;
				StringBuffer myRow = null;
				String strDebit = "";
				String strCredit = "";
				BigDecimal debit = new BigDecimal("0.00");
				BigDecimal credit = new BigDecimal("0.00");
				String DT1 = "";
				String DT2 = "";
				String DT3 = "";
				JBList beanList = new JBList();
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					MessageRecord msg = (MessageRecord) iterator.next();
					if (msg.getFormatName().equals("EGL042002")) {
						EGL042002Message msgHeader = (EGL042002Message) msg;
						session.setAttribute("stGLBal", msgHeader);
					} else if (msg.getFormatName().equals("EGL042001")) {
						EGL042001Message msgList = (EGL042001Message) msg;
						if (firstTime) {
							firstTime = false;
							if (startPos == 0) {
								userPO.setHeader5(msgList.getE01BEGBAL());
							}
						}
						strDebit = "&nbsp;";
						strCredit = "&nbsp;";
						if ("0".equals(msgList.getE01TRADCC())) {
							debit =
								debit.add(msgList.getBigDecimalE01TRAAMT());
							strDebit =
								Util.fcolorCCY(msgList.getE01TRAAMT().trim());
						} else if ("5".equals(msgList.getE01TRADCC())) {
							credit =
								credit.add(
									msgList.getBigDecimalE01TRAAMT());
							strCredit =
								Util.fcolorCCY(msgList.getE01TRAAMT().trim());
						}

						String Future = "";

						if (msgList.getE01TRACNU().equals("1")) {
							Future = "<Font Color='BLACK'>" + "Future"
									+ "</Font>";
						} else {
							Future = "";
						}
						
						myRow = new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\">"
							+ datapro.eibs.master.Util.formatCustomDate(user.getE01DTF(),msgList.getBigDecimalE01DATE1M().intValue(),msgList.getBigDecimalE01DATE1D().intValue(),msgList.getBigDecimalE01DATE1Y().intValue())  + "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatCell(Future) + "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\">"
							+ Util.formatCell(msgList.getE01TRAACC())
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\">"
							+ Util.formatCell(msgList.getE01TRACDE())
							+ "</TD>");
						if (msgList.getE01TRADRR().equals("0")) {
							myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01TRANAR())
								+ "</TD>");
						} else {
							myRow.append("<TD NOWRAP><A HREF=\"javascript:GetStatDesc('"
								+ msgList.getE01TRADRR()
								+ "','"
								+ msgList.getE01TRANAR()
								+ "','"
								+ datapro.eibs.master.Util.formatCustomDate(user.getE01DTF(),msgList.getBigDecimalE01DATE1M().intValue(),msgList.getBigDecimalE01DATE1D().intValue(),msgList.getBigDecimalE01DATE1Y().intValue())  
								
								+ "','"
								+ Util.formatCell(msgList.getE01TRACDE())
								+ "')\">"
								+ Util.formatCell(msgList.getE01TRANAR())
								+ "</A></TD>");
						}
						myRow.append("<TD NOWRAP ALIGN=RIGHT>"
							+ strDebit
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=RIGHT>"
							+ strCredit
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=RIGHT>"
							+ Util.fcolorCCY(msgList.getE01ENDBAL().trim())
							+ "</TD>");
						
						DT1 = (userPO.getHeader8().equals("B")) ? msgList
								.getE01DATE1M() : msgList.getE01DATE2M();
						DT2 = (userPO.getHeader8().equals("B")) ? msgList
								.getE01DATE1D() : msgList.getE01DATE2D();
						DT3 = (userPO.getHeader8().equals("B")) ? msgList
								.getE01DATE1Y() : msgList.getE01DATE2Y();

						myRow.append("<TD NOWRAP ALIGN=CENTER><A HREF=\"javascript:GetBatchDet('"
								+ DT1
								+ "','"
								+ DT2
								+ "','"
								+ DT3
								+ "','"
								+ msgList.getE01TRABTH()
								+ "','"
								+ msgList.getE01TRAACR()
								+ "')\">"
								+ Util.formatCell(msgList
										.getE01TRABTH())
								+ "</A></TD>");					
				

						
						myRow.append("<TD NOWRAP ALIGN=CENTER>"
							+ datapro.eibs.master.Util.formatCustomDate(user.getE01DTF(),msgList.getBigDecimalE01DATE2M().intValue(),msgList.getBigDecimalE01DATE2D().intValue(),msgList.getBigDecimalE01DATE2Y().intValue())
							
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=CENTER>"
							+ Util.getTimeFromTimestamp(msgList.getE01TRATMS())
							+ "</TD>");
						myRow.append("<TD NOWRAP>"
							+ Util.formatCell(msgList.getE01TRAUSA())
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=CENTER>"
							+ Util.formatCell(msgList.getE01TRAOBK())
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=CENTER>"
							+ Util.formatCell(msgList.getE01TRAOBR())
							+ "</TD>");
						myRow.append("</TR>");
						beanList.addRow("", myRow.toString());
					}
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				beanList.setLastRec(list.getLastRec());
				
				userPO.setHeader19(Util.fcolorCCY(debit.toString().trim()));
				userPO.setHeader20(Util.fcolorCCY(credit.toString().trim()));
				
				session.setAttribute("glList", beanList);
				
				if ("V".equals(userPO.getHeader8())) {
					pageName = "EGL0420_st_list_fv.jsp";
				} else if ("B".equals(userPO.getHeader8())) {
					pageName = "EGL0420_st_list_fp.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}
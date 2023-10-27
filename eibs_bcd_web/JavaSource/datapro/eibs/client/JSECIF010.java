package datapro.eibs.client;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lowagie.text.BadElementException;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.HeaderFooter;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfCell;
import com.lowagie.text.pdf.PdfWriter;

import datapro.eibs.beans.ECIF01001Message;
import datapro.eibs.beans.ECIF01002Message;
import datapro.eibs.beans.ECIF01003Message;
import datapro.eibs.beans.ECIF01004Message;
import datapro.eibs.beans.ECIF01005Message;
import datapro.eibs.beans.ECIF01006Message;
import datapro.eibs.beans.ECIF01007Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.products.JOActionRedirect;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSECIF010 extends JSEIBSServlet {

	// CIF options
	protected static final int R_SEARCH = 1;
	protected static final int A_SEARCH = 2;
	protected static final int R_LIST = 3;
	protected static final int A_LIST = 4;
	protected static final int R_TOTAL = 5;
	protected static final int A_TOTAL = 6;
	protected static final int R_PRODUCTS = 7;
	protected static final int A_PRODUCTS = 8;
	protected static final int R_ACCOUNT = 9;
	protected static final int R_ACCOUNT_GRP = 19;//addry
	protected static final int R_ACCOUNT_EXT = 29;
	protected static final int A_ACCOUNT = 10;
	protected static final int R_POSITION = 11;
	protected static final int A_POSITION = 12;
	// entering options
	protected static final int R_ENTER_ACC = 100;
	protected static final int A_ENTER_ACC = 400;
	protected static final int R_PDF = 500;
	protected static final int R_PRT_PDF = 501;
	protected static final int R_VALUATION = 600;
	protected static final int R_LIST_GRP_MBR = 666;//addry
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			// Requests
			case R_ENTER_ACC :
				procReqEnterAcc(user, req, res, session);
				break;
			case R_SEARCH :
				procReqSearch(user, req, res, session);
				break;
			case R_LIST :
				procReqList(user, req, res, session);
				break;
			case R_TOTAL :
				procReqTotal(user, req, res, session);
				break;
			case R_PRODUCTS :
				procReqProd(user, req, res, session);
				break;
			case R_ACCOUNT :
				procReqAcc(user, req, res, session);
				break;
			case R_ACCOUNT_EXT :
				procReqAccExt(user, req, res, session);
				break;
				
//addry:
			case R_ACCOUNT_GRP :
				procReqAccGrp(user, req, res, session);
				break;
//addry:
			case R_LIST_GRP_MBR :
				procReqListGroup(user, req, res, session);
				
			case R_POSITION :
				procReqPos(user, req, res, session);
				break;
			// Actions
			case A_POSITION : 
			case A_ACCOUNT :
			case A_ENTER_ACC :
				procActionEnterAcc(user, req, res, session);
				break;
			case A_SEARCH :
				procActionSearch(user, req, res, session);
				break;
			case A_LIST :
				procActionList(user, req, res, session);
				break;
			case A_TOTAL :
				break;
			case A_PRODUCTS :
				break;
			case R_PDF :
			case R_PRT_PDF :
				procReqPDF(user, req, res, session, screen);
				break;
			case R_VALUATION :
				procReqVAL(user, req, res, session);
				break;					
			default :
				forward(devPage, req, res);
				break;
		}
	}
	
	private void insertBL(Table datatable) throws BadElementException {
		// Blank Line
		float WHITE = 1.0f;
		Cell cell = new Cell(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD)));
		cell.setColspan(datatable.getColumns());
		cell.setRowspan(4);
		cell.setBorder(PdfCell.NO_BORDER);
		cell.setGrayFill(WHITE);
		datatable.addCell(cell);
	}

	private void procReqPDF(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen) throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		if (req.getParameter("CUSNUM") != null) {
			userPO.setCusNum(req.getParameter("CUSNUM").trim());
		}
		// Check if user has selected to validate future transactions (Henry 9/2/2008)
		String valfut = req.getParameter("CHKFUTURE") == null ? "" : req.getParameter("CHKFUTURE").trim();;
		// Parameter of Interest Earned
		String valint = req.getParameter("CHKINTER") == null ? "" : req.getParameter("CHKINTER").trim();
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECIF010", req);
			ECIF01005Message msgList = (ECIF01005Message) mp.getMessageRecord("ECIF01005");
			msgList.setH05USERID(user.getH01USR());
		 	msgList.setH05PROGRM("ECIF010");
		 	msgList.setH05TIMSYS(getTimeStamp());
		 	msgList.setH05SCRCOD("01");
		 	msgList.setH05OPECOD("0004");
			msgList.setH05FLGWK1("P");
			msgList.setH05FLGWK2(valfut);	// Validate Future Transactions
			msgList.setE05CUSCUN(userPO.getCusNum());
			
			mp.sendMessage(msgList);
			
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			if (mp.hasError(newmessage)) {
				ELEERRMessage  msgError = (ELEERRMessage) newmessage;
				session.setAttribute("error", msgError);
				forward("ECIF010_cif_valuation_enter.jsp?CUSPRF=0", req, res);
			} else {
				if (newmessage.getFormatName().equals("ECIF01005")) {
					msgList = (ECIF01005Message) newmessage;
					// Check the if portfolio has future transactions pending (Henry 9/2/2008)
					if (msgList.getH05FLGWK2().equals("Y")) {
						forward("ECIF010_cif_valuation_enter.jsp?VALFUT=Y&CUSPRF="+msgList.getE05CUSCUN() , req, res);														
					} else {
						boolean ACT = screen == R_PRT_PDF;
						
						//Colors
						float BLACK = 0.0f;
						float LITEGRAY = 0.9f;
						float DARKGRAY = 0.7f;
						float WHITE = 1.0f;
						
						String title = "";

						String header01 = "";
						String header02 = "";
						String header03 = "";
						String header04 = "";
						String header05 = "";
						String header06 = "";
						String header07 = ""; // Officer Code
						String header08 = userPO.getHeader11();
						String header09 = ""; //userPO.getHeader12();
						String header10 = ""; //userPO.getHeader13();
						String header11 = ""; //userPO.getHeader14();
						String header12 = userPO.getHeader15();
						String header13 = "";
						
						String rundte = "";

						String footer1 = "";
						String footer2 = "";
						String footer3 = "";
						String footer4 = "";
						String footer5 = "";

						String page = "";
						String pagefoot = "";
					    
						String cuscun = userPO.getCusNum();

						rundte = Util.formatCustomDate(user.getE01DTF(), "dd ' de ' MMMMM yyyy", (user.getE01LAN().equals("s") ? "es" : "en"), user.getE01RDD(), user.getE01RDM(), user.getE01RDY());
						
						String ssn = "";
						if ("e".equals(user.getE01LAN().toLowerCase())) {
							title = "Portfolio Valuation";

							header01 = "\n"; // Bank Name
							header02 = "Valuation Currency";
							header03 = "Portfolio";
							header04 = "              "; // Name
							header05 = "";
							header06 = "Value Date";
							header07 = "         ";		// Before label "Officer" was here, and it was deleted requested by the bank (Henry 08/28/08)

							// Detail header for retails, loans, CDs, etc... except Securities
							// Detail header for Securities only
							footer1 = "Liabilities";
							footer2 = "Assets";
							footer3 = "Net Position";
							footer4 = "TOTAL";
							footer5 = "Total Interest earned during the Year";

							page = "Page Number ";
							pagefoot = "The above listed price is indicative only and was obtained from reliable sources, without any liability on our part.";
						}

						if ("s".equals(user.getE01LAN().toLowerCase())) {
							title = "Posicion de Portafolio";

							header01 = "            "; // Nombre de Banco
							header02 = "Moneda Valuacion";
							header03 = "Portafolio";
							header04 = "             "; // Nombre
							header05 = "";
							header06 = "Fecha Valor";
							header07 = "          ";	// Before label "Oficial" was here, and it was deleted requested by the bank (Henry 08/28/08)

							footer1 = "Pasivos";
							footer2 = "Activos";
							footer3 = "Posicion Neta";
							footer4 = "TOTAL";
							footer5 = "Total de intereses ganados en el año";

							page = "Numero de Pagina ";
							pagefoot = " ";
						}
						
						String name = Util.unformatHTML(userPO.getHeader1());
						String accnum = userPO.getCusNum() + ' ' + name;
						
						Document doc = new Document(PageSize.LETTER.rotate(), 36, 36, 36, 36);
						
						ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
						PdfWriter docWriter = null;
						try {
							docWriter = PdfWriter.getInstance(doc, baosPDF);
							if (ACT) {
								docWriter.setEncryption(accnum.getBytes(), 
										cuscun.getBytes(), 
										PdfWriter.ALLOW_COPY | PdfWriter.ALLOW_PRINTING,
										PdfWriter.STANDARD_ENCRYPTION_128);
								/*
								docWriter.setEncryption(
									PdfWriter.STRENGTH128BITS,
									accnum,
									cuscun,
									PdfWriter.AllowCopy | PdfWriter.AllowPrinting);
								*/	
							}
							// Add some meta information to the document
							doc.addAuthor("eIBS");
							doc.addCreationDate();
							doc.addProducer();
							doc.addCreator(user.getH01USR());
							doc.addTitle(title);
							doc.addKeywords("pdf, itext, Java, open source, http");

							// Some General Fonts defaults
							Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 7, Font.NORMAL);	// Before font size 7
							Font normalBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD);	// Before font size 8
							Font normalBoldUnderFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD | Font.UNDERLINE); // Before font size 8
							Font headerFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.NORMAL);	// Before font size 8
							Font headerBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD);	// Before font size 8
							Font headerBoldUnderFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD | Font.UNDERLINE); // Before font size 8
							Font titleBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD);

							Paragraph BLANK = new Paragraph("", headerBoldFont);
							Paragraph TITLE = new Paragraph(title, titleBoldFont);

							Paragraph HEADER01 = new Paragraph(header01 + "   " + user.getE01NME(), headerBoldFont);
							Paragraph HEADER02 = new Paragraph(header02 + ": " + user.getE01BCU(), headerBoldFont);
							Paragraph HEADER03 = new Paragraph(header03 + ": " + accnum, headerBoldFont);
							Paragraph HEADER04 = new Paragraph(header04 + "  " + name, headerBoldFont);
							Paragraph HEADER05 = new Paragraph(header05 + ": " + " ", headerBoldFont);
							Paragraph HEADER06 = new Paragraph(header06 + ": " + rundte, headerBoldFont);
							Paragraph HEADER07 = new Paragraph(header07 + "  " + userPO.getHeader11(), headerBoldFont); // Officer Code
							Paragraph HEADER09 = new Paragraph(header09, normalFont); // Bank Address 1
							Paragraph HEADER10 = new Paragraph(header10, normalFont); // Bank Address 2
							Paragraph HEADER11 = new Paragraph(header11, normalFont); // Country
							Paragraph HEADER12 = new Paragraph(header12, normalFont); // Phone 1
							Paragraph DETAILZ3 = new Paragraph(footer4, headerBoldFont);

							HeaderFooter header = new HeaderFooter(TITLE, false);
							header.setBorder(Rectangle.NO_BORDER);
							header.setAlignment(Element.ALIGN_CENTER);
							doc.setHeader(header);

							HeaderFooter footer = new HeaderFooter(new Phrase(page, normalFont), new Phrase(".       " + pagefoot));
							footer.setBorder(Rectangle.NO_BORDER);
							doc.setFooter(footer);

							doc.open();

							// Table of Earns 
							Table datatable2 = null;
							
							// Table of Content
							int NumColumns = 9;
							Table datatable = new Table(NumColumns);
							datatable.setBorder(PdfCell.NO_BORDER);
							datatable.setBorderWidth(1);

							datatable.setPadding(1);
							datatable.setSpacing(0);
							//int headerwidths[] = { 37, 13, 8, 10, 16, 15, 11, 17 }; 
							//int headerwidths[] = { 37, 10, 8, 10, 14, 13, 11, 13, 8 };
							int headerwidths[] = { 20, 10, 10, 10, 10, 10, 10, 10, 10 };
							datatable.setWidths(headerwidths);
							datatable.setWidth(100); // percentage
							
							Cell defaultCell = new Cell();
							defaultCell.setHorizontalAlignment(Element.ALIGN_LEFT);
							defaultCell.setVerticalAlignment(Element.ALIGN_TOP);
							datatable.setDefaultCell(defaultCell);

							Cell cell = new Cell();
							// Logo Image
							try {
								Image xLogo = Image.getInstance(getServletContext().getResource("/images/BNP_Logo.jpg"));
								xLogo.setAlignment(Image.LEFT);
								xLogo.setDeflated(true);
								cell.add(xLogo);
								cell.setRowspan(2);
								cell.setBorder(Rectangle.NO_BORDER);
								datatable.addCell(cell);

							} catch (IOException dex) {
								System.out.println("Read error :" + dex);
								cell.setRowspan(2);
								cell.setBorder(Rectangle.NO_BORDER);
								datatable.addCell(BLANK); // Not Logo Image
							}
							
							cell = new Cell(HEADER03); // Portfolio Number
							cell.setRowspan(2);
							cell.setColspan(4);
							datatable.addCell(cell);

							cell = new Cell(HEADER02); 		// Valuation Currency
							cell.setColspan(4);
							datatable.addCell(cell);

							cell = new Cell(HEADER06); 		// Value Date		
							cell.setColspan(4);
							datatable.addCell(cell);

							datatable.endHeaders(); // End Header

							int i = 0;
							int countDebit = 0;
							int countCredit = 0;
							int countBrk = 0;
							int countPage = 0;

							BigDecimal debit = new BigDecimal("0.00");
							BigDecimal credit = new BigDecimal("0.00");
							BigDecimal netpos = new BigDecimal("0.00");
							BigDecimal totbrk = new BigDecimal("0.00"); // Total by break lavel

							String auxType = "";
							String dit11 = "";
							String dit21 = "";
							String dit31 = "";
							String dit41 = "";
							String dit51 = "";
							String dit61 = "";
							//String dit71 = "";
							String dit81 = "";
							String dit91 = "";
							BigDecimal dit101 = new BigDecimal("0.00");
							BigDecimal dit71 = new BigDecimal("0.00");
							BigDecimal total = new BigDecimal("0.00");
							ArrayList rows = new ArrayList();
							ECIF01005Message prevSec = null;
							
							String marker = msgList.getE05INDOPE();
							
							if (!marker.equals("*")) {
								
								userPO.setHeader1(msgList.getE05CUSNA1().trim());
								userPO.setHeader2(msgList.getE05CUSSTS().trim());
								
								while (true) {
									
									marker = msgList.getE05INDOPE();
									if (marker.equals("*")) {
										break;
									}
									total = total.add(msgList.getBigDecimalE05BSETOT());
									i++;
									
									if (marker.equals("I")) { //Earns List
										if (valint.equals("Y")) { // Print Total Interest Earned during the year 
											int NumColumns2 = 1;
											datatable2 = new Table(NumColumns2);

											datatable2.setPadding(1);
											datatable2.setSpacing(0);
											int headerwidths2[] = { 100 };
											datatable2.setWidths(headerwidths2);
											datatable2.setWidth(100); // percentage
											datatable2.setBorderWidth(0);
											
											defaultCell.setBorder(PdfCell.NO_BORDER);
											defaultCell.setHorizontalAlignment(Element.ALIGN_LEFT);
											defaultCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
															
											datatable2.setDefaultCell(defaultCell);
											// Blank Line
											insertBL(datatable2);
											
											Paragraph INTAMT = new Paragraph(footer5 + " " + msgList.getE05ACCSTS() + " " + msgList.getE05BSETOT(), titleBoldFont);
											cell = new Cell(INTAMT);
											datatable2.addCell(cell);
										}
									} else { // Transactions List
										if (prevSec == null) {
											prevSec = msgList;
										}
										if (!auxType.equals(msgList.getE05ACCTYP())
												&& rows.size() > 0) {
											//print headers
											printColHead(datatable, prevSec, user.getE01LAN());
											// print detail
											printDetail(datatable, rows, totbrk);
	
											// print subtotal
											if (countBrk != 0) {
												datatable.getDefaultCell().setBorder(PdfCell.TOP);
												
												cell = new Cell(DETAILZ3); //TOTAL
												cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
												cell.setColspan(7);
												datatable.addCell(cell);
												
												Paragraph DETAILZ10 = new Paragraph(Util.formatCCY(String.valueOf(totbrk)), normalBoldFont);
												cell = new Cell(DETAILZ10);
												cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
												datatable.addCell(cell);
												
												// Percentage of total
												String perOfTot = "";
												try {
													double totBrk = totbrk.doubleValue();
													double allTot = total.doubleValue();
													double result = totBrk / allTot;
													double percentage = result * 100;
													perOfTot = String.valueOf(Util.round(percentage, 2)) + "%";
												} catch (Exception e) {
													perOfTot = "ERROR";
												}
												Paragraph perc = new Paragraph(perOfTot, normalBoldFont);
												cell = new Cell(perc);
												cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
												datatable.addCell(cell);
											}
	
											//	Initialize Variable again
											auxType = msgList.getE05ACCTYP();
											i = 0;
											countBrk = 0;
											prevSec = msgList;
	
											rows.clear();
											totbrk = new BigDecimal("0");
										}	
									}
									//----------------------- End of Break Level ------------------------------------
									ArrayList fields = new ArrayList();

									dit11 = msgList.getE05ACCNUM();
									dit21 = msgList.getE05ACCTYP();
									dit31 = msgList.getE05PRODSC();
									dit41 = msgList.getE05ACCSTS();
									if (dit21.equals("&nbsp;") || dit21.equals("0")) {
										dit21 = "";
									}
									if (dit31.equals("&nbsp;") || dit31.equals("0")) {
										dit31 = "";
									}

									fields.add(0, dit11);
									fields.add(1, dit21);
									fields.add(2, dit31);
									fields.add(3, dit41);					
										
									dit51 = msgList.getE05CCYCDE();
									dit61 = Util.formatCustomDate(user.getE01DTF(), msgList.getE05OPEDTM(), msgList.getE05OPEDTD(), msgList.getE05OPEDTY());
									try {
										dit71 = msgList.getBigDecimalE05BSEPRI();
									} catch (Exception e) {
										dit71 = new BigDecimal("0.00");
									}
										
									dit81 = msgList.getE05BSEINT();
						                 
									fields.add(4, dit51);
									fields.add(5, dit61);
									fields.add(6, dit71);
									fields.add(7, dit81);

									dit91 = msgList.getE05BSEOTH();

									dit101 = msgList.getBigDecimalE05BSETOT();
									fields.add(8, dit91);
									fields.add(9, dit101);
										
									if (msgList.getE05CLSACC().equals("3")){
									   Object temp = fields.get(3);
									   fields.set(3,fields.get(8));
									   fields.set(8,temp);	
									}	
									rows.add(fields);
										
									// If record is marked with "X", then do not considere in net position amount
									if (!msgList.getH05FLGWK1().equals("X")) {
										if (msgList.getE05CLSACC().equals("1")) {
											debit = debit.add(msgList.getBigDecimalE05BSETOT());
											countDebit++;
										} else {
											credit = credit.add(msgList.getBigDecimalE05BSETOT());
											countCredit++;
										}
									}
										
									countBrk++;
									totbrk = totbrk.add(msgList.getBigDecimalE05BSETOT());
									
									msgList = (ECIF01005Message) mp.receiveMessageRecord();
								}
								
								if (countBrk != 0) {
									// print last records
									if (rows.size() > 0) {
										printColHead(datatable, msgList, user.getE01LAN());
										printDetail(datatable, rows, totbrk);
									}
									
									datatable.getDefaultCell().setBorder(PdfCell.TOP);
									
									cell = new Cell(DETAILZ3); //TOTAL
									cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
									cell.setColspan(7);
									datatable.addCell(cell);
									
									Paragraph DETAILZ10 = new Paragraph(Util.formatCCY(String.valueOf(totbrk)),	normalBoldFont);
									cell = new Cell(DETAILZ10);
									cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
									datatable.addCell(cell);
									
									String perOfTot = "";
									try {
										double totBrk = totbrk.doubleValue();
										double allTot = total.doubleValue();
										double result = totBrk / allTot;
										double percentage = result * 100;
										perOfTot = String.valueOf(Util.round(percentage, 2)) + "%";
									} catch (Exception e) {
										perOfTot = "ERROR";
									}
									Paragraph perc = new Paragraph(perOfTot, normalBoldFont);
									cell = new Cell(perc);
									cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
									datatable.addCell(cell);
								}
							}
							// Blank Line
							insertBL(datatable);
							
							Paragraph FOOTER3 = new Paragraph(footer3, titleBoldFont);
							cell = new Cell(FOOTER3); //Posicion Neta
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							cell.setColspan(8);
							datatable.addCell(cell);
							
							netpos = credit.subtract(debit);
							Paragraph NETBAL = new Paragraph(Util.formatCCY(String.valueOf(netpos)), titleBoldFont);
							cell = new Cell(NETBAL); 
							cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
							datatable.addCell(cell);
						
							doc.add(datatable);
							
							// Print Total Interest Earned during the year
							if (datatable2 != null) doc.add(datatable2);
							
							if (doc != null) doc.close();
							if (docWriter != null) docWriter.close();
							
							if (!ACT) {
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
							}
							
						} catch (DocumentException dex) {
							dex.printStackTrace();
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
				}
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void printDetail(Table datatable, ArrayList rows, BigDecimal total) throws BadElementException {
		
		// PRINT every row then with percentages calculated
		Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 7, Font.NORMAL);	// Before font size 7
		Font normalBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD);	// Before font size 8
		Font normalBoldUnderFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD | Font.UNDERLINE);
		
		float WHITE = 1.0f;
		datatable.getDefaultCell().setBorder(PdfCell.BOX);
		datatable.getDefaultCell().setGrayFill(WHITE);
	
		for (int l = 0; l < rows.size(); l++) {
			ArrayList fields = (ArrayList) rows.get(l);
			Paragraph DIT11 = new Paragraph(fields.get(0).toString(), normalFont);
			Paragraph DIT21 = new Paragraph(fields.get(1).toString(), normalFont);
			Paragraph DIT31 = new Paragraph(fields.get(2).toString(), normalFont);
			Paragraph DIT41 = new Paragraph(fields.get(3).toString(), normalFont);
			Paragraph DIT51 = new Paragraph(fields.get(4).toString(), normalFont);
			Paragraph DIT61 = new Paragraph(fields.get(5).toString(), normalFont);
			Paragraph DIT71 = new Paragraph(Util.formatCCY(fields.get(6).toString()), normalFont);
			Paragraph DIT81 = new Paragraph(fields.get(7).toString(), normalFont);
			Paragraph DIT91 = new Paragraph(fields.get(8).toString(), normalFont);
			Paragraph DIT101 = new Paragraph(Util.formatCCY(fields.get(9).toString()), normalFont);
			String dit111 = "";
			try {
				BigDecimal field10 = (BigDecimal) fields.get(9);
				double tot = total.doubleValue();
				double res = field10.doubleValue();
				res = res / tot;
				double percentage = res * 100;
				dit111 = String.valueOf(Util.round(percentage, 2)) + "%";
			} catch (Exception e) {
				dit111 = "";
			}
			Paragraph DIT111 = new Paragraph(dit111, normalFont);

			Cell cell = null;
			
			cell = new Cell(DIT31);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			datatable.addCell(cell);

			cell = new Cell(DIT41); // client Price Or Rate
			cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			datatable.addCell(cell);
			
			cell = new Cell(DIT51); // CCY
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DIT61); // Open Date
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DIT71); // Principal 
			cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			datatable.addCell(cell);
			
			cell = new Cell(DIT81); // Interest
			cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			datatable.addCell(cell);
			
			cell = new Cell(DIT91); //Market Price and others
			cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			datatable.addCell(cell);
			
			cell = new Cell(DIT101); // Valuation Amt.
			cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			datatable.addCell(cell);
			
			cell = new Cell(DIT111); //Percentage
			cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			datatable.addCell(cell);
		}
	}

	private void printColHead(Table datatable, ECIF01005Message msgList,
			String langPath) throws BadElementException {
		
		String detail1 = "";
		String detail2 = "";
		String detail3 = "";
		String detail4 = "";
		String detail5 = "";
		String detail6 = "";
		String detail7 = "";
		String detail8 = "";
		String detail9 = "";
		String detail10 = "";
		String detail11 = "";

		String detailx1 = "";
		String detailx2 = "";
		String detailx3 = "";
		String detailx4 = "";
		String detailx5 = "";
		String detailx6 = "";
		String detailx7 = "";
		String detailx71 = "";
		String detailx8 = "";
		String detailx9 = "";
		String detailx10 = "";
		String detailx11 = "";
		
		Font headerFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.NORMAL);	// Before font size 8
		Font headerBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD);	// Before font size 8
		Paragraph BLANK = new Paragraph("", headerBoldFont);
		
		float WHITE = 1.0f;
		float DARKGRAY = 0.8f;
		
		if ("e".equals(langPath.toLowerCase())) {
			// Detail header for retails, loans, CDs, etc... except Securities
			detail1 = "Number";
			detail2 = "Type";
			detail3 = "Description";
			detail4 = "Rate";
			detail5 = "Ccy";
			detail6 = "Opn/Mat";
			detail7 = "Principal";
			detail8 = "Interest";
			detail9 = "Others";
			detail10 = "Valuation Amt.";
			detail11 = "Percentage";
			// Detail header for Securities only
			detailx1 = "Number";
			detailx2 = "Type";
			detailx3 = "Description";
			detailx4 = "Client Price";
			detailx5 = "Ccy";
			detailx6 = "Open";
			detailx7 = "Face Value";
			detailx71 = "Quantity";
			detailx8 = "Interest";
			detailx9 = "Mrk Price";
			detailx10 = "Valuation Amt.";
			detailx11 = "Percentage";
		}

		if ("s".equals(langPath.toLowerCase())) {
			detail1 = "Numero";
			detail2 = "Tipo";
			detail3 = "Descripcion";
			detail4 = "Tasa";
			detail5 = "Mnd";
			detail6 = "Aper/Vcto";
			detail7 = "Principal";
			detail8 = "Interes";
			detail9 = "Otros";
			detail10 = "Monto Valuacion";
			detail11 = "Porcentaje";
			// Detail header for Securities only
			detailx1 = "Numero";
			detailx2 = "Tipo";
			detailx3 = "Descripcion";
			detailx4 = "Precio Cliente";
			detailx5 = "Mnd";
			detailx6 = "Apert";
			detailx7 = "Valor Nominal";
			detailx71 = "Cantidad";
			detailx8 = "Interes";
			detailx9 = "Precio mercado";
			detailx10 = "Monto Valuacion";
			detailx11 = "Porcentaje";
		}

		Paragraph DETAIL1 = new Paragraph(detail1, headerBoldFont);
		Paragraph DETAIL2 = new Paragraph(detail2, headerBoldFont);
		//Paragraph DETAIL3 = new Paragraph(detail3, headerBoldFont);
		Paragraph DETAIL4 = new Paragraph(detail4, headerBoldFont);
		Paragraph DETAIL5 = new Paragraph(detail5, headerBoldFont);
		Paragraph DETAIL6 = new Paragraph(detail6, headerBoldFont);
		Paragraph DETAIL7 = new Paragraph(detail7, headerBoldFont);
		Paragraph DETAIL8 = new Paragraph(detail8, headerBoldFont);
		Paragraph DETAIL9 = new Paragraph(detail9, headerBoldFont);
		Paragraph DETAIL10 = new Paragraph(detail10, headerBoldFont);
		Paragraph DETAIL11 = new Paragraph(detail11, headerBoldFont);

		Paragraph DETAILX1 = new Paragraph(detailx1, headerBoldFont);
		Paragraph DETAILX2 = new Paragraph(detailx2, headerBoldFont);
		//Paragraph DETAILX3 = new Paragraph(detailx3, headerBoldFont);
		Paragraph DETAILX4 = new Paragraph(detailx4, headerBoldFont);
		Paragraph DETAILX5 = new Paragraph(detailx5, headerBoldFont);
		Paragraph DETAILX6 = new Paragraph(detailx6, headerBoldFont);
		Paragraph DETAILX7 = new Paragraph(detailx7, headerBoldFont);
		Paragraph DETAILX71= new Paragraph(detailx71, headerBoldFont);
		Paragraph DETAILX8 = new Paragraph(detailx8, headerBoldFont);
		Paragraph DETAILX9 = new Paragraph(detailx9, headerBoldFont);
		Paragraph DETAILX10 = new Paragraph(detailx10, headerBoldFont);
		Paragraph DETAILX11 = new Paragraph(detailx11, headerBoldFont);
		
		datatable.getDefaultCell().setBorder(PdfCell.BOX);
		datatable.getDefaultCell().setGrayFill(DARKGRAY);
		
		Cell cell = new Cell();
		
		if (!msgList.getE05CLSACC().equals("3")) {
			// Liabilities and Assets Header
			
			// Blank Line
			insertBL(datatable);

			Paragraph DETAIL3 = new Paragraph(msgList.getE05TYPDSC(), headerBoldFont); // Description
			cell = new Cell(DETAIL3); //Percentage
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			datatable.addCell(cell);
			
			cell = new Cell(DETAIL4); //Tasa
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DETAIL5); //Mnd
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DETAIL6); //Aper/Vcto
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DETAIL7); //Principal
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DETAIL8); //Interes
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DETAIL9); //Otros
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DETAIL10); //Monto Valuacion
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DETAIL11); //Porcentaje
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			datatable.getDefaultCell().setBorderWidth(1);
		}

		if (msgList.getE05CLSACC().equals("3")) {
			// Securities Header

			// Blank Line
			insertBL(datatable);

			Paragraph DETAILX3 = new Paragraph(msgList.getE05TYPDSC(), headerBoldFont);
			cell = new Cell(DETAILX3); //Descripcion
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			datatable.addCell(cell);

			cell = new Cell(DETAILX4); //Precio Cliente
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DETAILX5); //Mnd
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DETAILX6); //Apert
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(msgList.getH05SCRCOD().equals("98") ? DETAILX7 : DETAILX71); //Valor Nominal/Cantidad
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DETAILX8); //Interes
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DETAILX9); //Precio mercado
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DETAILX10); //Monto Valuacion
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			cell = new Cell(DETAILX11); //Porcentaje
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.addCell(cell);
			
			datatable.getDefaultCell().setBorderWidth(1);
		}
	}

	private void procReqVAL(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", getUserPos(req));
		
		forward("ECIF010_cif_valuation_enter.jsp?CUSPRF=0", req, res);
	}

	private void procActionList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		int option = 0;
		try {
			option = Integer.parseInt(req.getParameter("opt"));
		} catch (Exception e) {
			option = 0;
		}
		String clientNum = req.getParameter("CUSTOMER") == null ? "" : req.getParameter("CUSTOMER").trim();
		userPO.setCusNum(clientNum);
		session.setAttribute("userPO", userPO);

		switch (option) {
			case 1 : // Customer Access and Liabilities Total
				procReqTotal(user, req, res, session);
				break;
			case 2 : // Customer Position
				procReqPos(user, req, res, session);
				break;
			case 3 : // Customer Products
				procReqProd(user, req, res, session);
				break;
			case 4 : // Customer Account Listing
				procReqAcc(user, req, res, session);
				break;
			case 5 : // Lines of Credit
				res.sendRedirect(srctx + "/servlet/datapro.eibs.credit.JSELN0110?SCREEN=1&Pos=0");
				break;
			case 6 :
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0000?SCREEN=7");
				break;
			case 9 :
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSECP001?SCREEN=2&CUSTOMER=" + clientNum);
				break;
			case 10 : //Portfolio
				res.sendRedirect(srctx + "/servlet/datapro.eibs.invest.JSEIE0300?SCREEN=1&CUSTOMER=" + clientNum);
				break;		
			default :
				forward("Under_construction.jsp", req, res);
		}
	}

	private void procActionSearch(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		int type = 0;
		try {
			type = Integer.parseInt(req.getParameter("Type"));
		} catch (Exception e) {
			type = 0;
		}
		String clientNum = req.getParameter("NameSearch") == null ? "" : req.getParameter("NameSearch").toUpperCase();
		
		userPO.setCusNum(clientNum);
		session.setAttribute("userPO", userPO);
		
	 	switch (type) {
		 	case 1 :
	 			procReqTotal(user, req, res, session);
		 		break;
		 	default :
	 			procReqList(user, req, res, session);
	 	}
	}

	private void procActionEnterAcc(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECIF010", req);
			ECIF01007Message msgAcc = (ECIF01007Message) mp.getMessageRecord("ECIF01007");
		 	msgAcc.setH07USERID(user.getH01USR());
		 	msgAcc.setH07PROGRM("ECIF010");
		 	msgAcc.setH07TIMSYS(getTimeStamp());
		 	try {
			 	//flexLog("header8 =" + userPO.getHeader8());//tempo
			 	msgAcc.setH07FLGWK1(userPO.getHeader8()); //delry: esta trayendo datos mas de un caracter
			} catch (Exception e) {
				msgAcc.setH07FLGWK1("");
			}
		 	msgAcc.setH07SCRCOD("01");
		 	msgAcc.setH07OPECOD("0004");
		 	msgAcc.setE07ACCNUM(req.getParameter("ACCNUM") == null ? "0" : req.getParameter("ACCNUM").trim());
		 	
		 	mp.sendMessage(msgAcc);
		 	
		 	ELEERRMessage msgError = new ELEERRMessage();
		 	MessageRecord message = mp.receiveMessageRecord();
		 	
		 	if (mp.hasError(message)) {
		 		msgError = (ELEERRMessage) message;
				session.setAttribute("error", msgError);
				forward("ECIF010_cif_enter_acc.jsp", req, res);
		 	} else {
		 		msgAcc = (ECIF01007Message) message;
				int option = 0;
				try {
					option = Integer.parseInt(req.getParameter("opt"));
				} catch (Exception e) {
					option = 0;
				}
				int appCode = 0;
				try {
					appCode = Integer.parseInt(msgAcc.getE07APCCDE());
				} catch (Exception e) {
					appCode = 0;
				}
				String accNum = msgAcc.getE07ACCNUM();

				JOActionRedirect red = new JOActionRedirect(option, appCode, accNum, getLangPath(user), session);
				res.sendRedirect(srctx + red.action());
		 	}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqPos(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		String PageToCall = "MISC_no_result.jsp";
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECIF010", req);
			ECIF01005Message msgList = (ECIF01005Message) mp.getMessageRecord("ECIF01005");
			msgList.setH05USERID(user.getH01USR());
		 	msgList.setH05PROGRM("ECIF010");
		 	msgList.setH05TIMSYS(getTimeStamp());
		 	msgList.setH05SCRCOD("01");
		 	msgList.setH05OPECOD("0004");
		 	msgList.setE05CUSCUN(userPO.getCusNum());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("E05INDOPE");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				PageToCall = "ECIF010_cif_client_search.jsp";
			} else {
				list.initRow();
				JBList beanList = new JBList();
				boolean firstTime = true;
				StringBuffer myRow = null;
				String chk = "";
				String myFlag = "";
				BigDecimal totalAssets = new BigDecimal(0);
				BigDecimal totalLiabilities = new BigDecimal(0);
				BigDecimal netPosition = new BigDecimal(0);
				while (list.getNextRow()) {
					msgList = (ECIF01005Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
						userPO.setHeader1(msgList.getE05CUSNA1().trim());
						userPO.setHeader2(msgList.getE05CUSSTS().trim());
					} else {
						chk = "";
					}
					myFlag = msgList.getE05CLSACC();
					if ( myFlag.trim().equals("1") ) {
						totalAssets = totalAssets.add(msgList.getBigDecimalE05BSETOT());
					} else if ( myFlag.trim().equals("2") ) {
						totalLiabilities = totalLiabilities.add(msgList.getBigDecimalE05BSETOT());
					}
					myRow =  new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP WIDTH=\"5%\" ALIGN=CENTER><input type=\"radio\" name=\"ACCNUM\" value=\"" + msgList.getE05ACCNUM() + "\" " + chk + "></TD>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=CENTER>" + Util.formatCell(msgList.getE05ACCNUM()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"5%\" ALIGN=CENTER>" + Util.formatCell(msgList.getE05ACCTYP()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"15%\" ALIGN=LEFT>" + Util.formatCell(msgList.getE05TYPDSC()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=CENTER>" + Util.formatCell(msgList.getE05ACCSTS()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"5%\" ALIGN=CENTER>" + Util.formatCell(msgList.getE05CCYCDE()) + "</TD>");
					String maturityDate = Util.formatCustomDate(user.getE01DTF(), msgList.getE05MATDTM(), msgList.getE05MATDTD(), msgList.getE05MATDTY());
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=CENTER>"
							+ Util.formatCustomDate(user.getE01DTF(), msgList.getE05OPEDTM(), msgList.getE05OPEDTD(), msgList.getE05OPEDTY())
							+ (!maturityDate.trim().equals("") ? (" - "  + maturityDate) : "")
							+ 	"</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE05BSEPRI()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE05BSEINT()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE05BSEOTH()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE05BSETOT()) + "</TD>");
					myRow.append("</TR>");
					
					beanList.addRow(myFlag, myRow.toString());
				}
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				netPosition = totalAssets.subtract(totalLiabilities);
				userPO.setHeader3(Util.fcolorCCY(totalAssets.toString()));
				userPO.setHeader4(Util.fcolorCCY(totalLiabilities.toString()));
				userPO.setHeader5(Util.fcolorCCY(netPosition.toString()));
				
				session.setAttribute("cifPos", beanList);
				PageToCall = "ECIF010_cif_position.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(PageToCall, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqAcc(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		String PageToCall = "MISC_no_result.jsp";
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECIF010", req);
			ECIF01006Message msgList = (ECIF01006Message) mp.getMessageRecord("ECIF01006");
			msgList.setH06USERID(user.getH01USR());
		 	msgList.setH06PROGRM("ECIF010");
		 	msgList.setH06TIMSYS(getTimeStamp());
		 	msgList.setH06SCRCOD("01");
		 	msgList.setH06OPECOD("0004");
		 	msgList.setE06SELCUN(userPO.getCusNum());
			try {
				msgList.setE06SELACD(req.getParameter("appCode").trim());
			} catch (Exception ex) {
		 		msgList.setE06SELACD("");
			}
			try {
				msgList.setE06SELFLG(req.getParameter("flag").trim());
			} catch (Exception ex) {
		 		msgList.setE06SELFLG("");
			}
			try {
				msgList.setE06SELTYP(req.getParameter("prodType").trim());
			} catch (Exception ex) {
		 		msgList.setE06SELTYP("");
			}
			try {
				msgList.setE06SELPRO(req.getParameter("prodCode").trim());
			} catch (Exception ex) {
		 		msgList.setE06SELPRO("");
			}
			try {
				msgList.setE06ACCTYP(req.getParameter("ofc").trim());
				msgList.setH06SCRCOD("OF");
			} catch (Exception ex) {
				msgList.setE06ACCTYP("");
			}
			msgList.setH06FLGWK1((req.getParameter("STATUS") == null ? "T" : req.getParameter("STATUS")));
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("E06INDOPE");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				PageToCall = "ECIF010_cif_client_search.jsp";
			} else {
				list.initRow();
				JBList beanList = new JBList();
				boolean firstTime = true;
				StringBuffer myRow = null;
				String chk = "";
				int indexRow = 0;
				BigDecimal sumTotal = new BigDecimal("0.00");
				while (list.getNextRow()) {
					msgList = (ECIF01006Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}

					if (msgList.getE06SELACD().equals("72") || msgList.getE06SELACD().equals("73")) {
						myRow =  new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP  width=\"10%\" align=center>"
								+ "<input type=\"radio\" name=\"ACCNUM\" value=\"" + msgList.getE06ACCNUM() + "\" " + chk + " onclick=\"showAddInfo("+indexRow+")\"></TD>");
						myRow.append("<TD NOWRAP width=\"15%\">" + Util.formatCell(msgList.getE06ACCNUM()) + "</TD>");
						myRow.append("<TD NOWRAP width=\"15%\" align=center>" + Util.formatCell(msgList.getE06ACCSTS()) + "</TD>");
						myRow.append("<TD NOWRAP width=\"15%\" align=center>" + Util.formatCell(msgList.getE06PROCDE()) + "</TD>");
						myRow.append("<TD NOWRAP width=\"15%\" align=center>" + Util.formatCell(msgList.getE06CCYCDE()) + "</TD>");
						myRow.append("<TD NOWRAP width=\"15%\" align=right>" + Util.fcolorCCY(msgList.getBigDecimalE06TOTAMN().toString()) + "</TD>");
						myRow.append("<TD NOWRAP width=\"15%\" align=center>" + Util.formatCell(msgList.getE06OFFICR()));
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"+indexRow+"\" VALUE=\"" + Util.formatCell(msgList.getE06BNKNUM()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE06BRNNUM()) + "<br>");
						//myRow.append(Util.formatCustomDate(user.getE01DTF(), msgList.getE06OPEDTM(), msgList.getE06OPEDTD(), msgList.getE06OPEDTY()) + "<br>");
						myRow.append(Util.fcolorCCY(msgList.getBigDecimalE06PRIAMN().toString()) + "<br>");
						myRow.append(Util.fcolorCCY(msgList.getBigDecimalE06INTAMN().toString()) + "<br>");
						myRow.append(Util.fcolorCCY(msgList.getBigDecimalE06OTHAMN().toString()) + "<br>");
						myRow.append(Util.fcolorCCY(msgList.getBigDecimalE06TOTAMN().toString()) + "\">");
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"CODACD"+indexRow+"\" VALUE=\"" + Util.formatCell(msgList.getE06SELACD()) + "\"></TD>");
						myRow.append("</TR>");

					} else {

						myRow =  new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP width=\"10%\" align=center>"
								+ "<input type=\"radio\" name=\"ACCNUM\" value=\"" + msgList.getE06ACCNUM() + "\" " + chk + " onclick=\"showAddInfo("+indexRow+")\"></TD>");
						myRow.append("<TD NOWRAP width=\"15%\">" + Util.formatCell(msgList.getE06ACCNUM()) + "</TD>");
						myRow.append("<TD NOWRAP width=\"15%\" align=center>" + Util.formatCell(msgList.getE06ACCSTS()) + "</TD>");
						myRow.append("<TD NOWRAP width=\"15%\" align=center>" + Util.formatCell(msgList.getE06PROCDE()) + "</TD>");
						myRow.append("<TD NOWRAP width=\"15%\" align=center>" + Util.formatCell(msgList.getE06CCYCDE()) + "</TD>");
						myRow.append("<TD NOWRAP width=\"15%\" align=right>" + Util.fcolorCCY(msgList.getBigDecimalE06PRIAMN().toString()) + "</TD>");
						myRow.append("<TD NOWRAP width=\"15%\" align=center>" + Util.formatCell(msgList.getE06OFFICR()));
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"+indexRow+"\" VALUE=\"" + Util.formatCell(msgList.getE06BNKNUM()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE06BRNNUM()) + "<br>");
						myRow.append(Util.formatCustomDate(user.getE01DTF(), msgList.getE06OPEDTM(), msgList.getE06OPEDTD(), msgList.getE06OPEDTY()) + "<br>");
						myRow.append(Util.fcolorCCY(msgList.getBigDecimalE06PRIAMN().toString()) + "<br>");
						myRow.append(Util.fcolorCCY(msgList.getBigDecimalE06INTAMN().toString()) + "<br>");
						myRow.append(Util.fcolorCCY(msgList.getBigDecimalE06OTHAMN().toString()) + "<br>");
						myRow.append(Util.fcolorCCY(msgList.getBigDecimalE06TOTAMN().toString()) + "\">");
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"CODACD"+indexRow+"\" VALUE=\"" + Util.formatCell(msgList.getE06SELACD()) + "\"></TD>");
						myRow.append("</TR>");
					}
					
					beanList.addRow("", myRow.toString());
					indexRow ++;
					sumTotal= sumTotal.add(msgList.getBigDecimalE06PRIAMN());	
				}
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				req.setAttribute("Total",""+ sumTotal);
				session.setAttribute("cifAcc", beanList);
				if (msgList.getE06SELACD().equals("72") || msgList.getE06SELACD().equals("73")) {
					PageToCall = "ECIF010_cif_accounts_external.jsp";
				} else {
					PageToCall = "ECIF010_cif_accounts.jsp";					
				}
				}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(PageToCall, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}
	

	private void procReqAccExt(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		String PageToCall = "MISC_no_result.jsp";
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECIF010", req);
			ECIF01006Message msgList = (ECIF01006Message) mp.getMessageRecord("ECIF01006");
			msgList.setH06USERID(user.getH01USR());
		 	msgList.setH06PROGRM("ECIF010");
		 	msgList.setH06TIMSYS(getTimeStamp());
		 	msgList.setH06SCRCOD("01");
		 	msgList.setH06OPECOD("0004");
		 	msgList.setE06SELCUN(userPO.getCusNum());
			try {
				msgList.setE06ACCNUM(req.getParameter("ACCNUM").trim());
			} catch (Exception ex) {
		 		msgList.setE06ACCNUM("");
			}
		 	try {
				msgList.setE06SELACD(req.getParameter("appCode").trim());
			} catch (Exception ex) {
		 		msgList.setE06SELACD("");
			}
			try {
				msgList.setE06SELFLG(req.getParameter("flag").trim());
			} catch (Exception ex) {
		 		msgList.setE06SELFLG("");
			}
			try {
				msgList.setE06SELTYP(req.getParameter("prodType").trim());
			} catch (Exception ex) {
		 		msgList.setE06SELTYP("");
			}
			try {
				msgList.setE06SELPRO(req.getParameter("prodCode").trim());
			} catch (Exception ex) {
		 		msgList.setE06SELPRO("");
			}
			try {
				msgList.setE06ACCTYP(req.getParameter("ofc").trim());
				msgList.setH06SCRCOD("OF");
			} catch (Exception ex) {
				msgList.setE06ACCTYP("");
			}
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("E06INDOPE");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				PageToCall = "ECIF010_cif_client_search.jsp";
			} else {
				list.initRow();
				JBList beanList = new JBList();
				boolean firstTime = true;
				StringBuffer myRow = null;
				String chk = "";
				int indexRow = 0;
				BigDecimal sumTotal = new BigDecimal("0.00");
				while (list.getNextRow()) {
					msgList = (ECIF01006Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}

					myRow =  new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP width=10% align=center>" + Util.formatCell(msgList.getE06ACCNUM()) + "</TD>");
					myRow.append("<TD NOWRAP width=20% align=right>" + Util.fcolorCCY(msgList.getBigDecimalE06PRIAMN().toString()) + "</TD>");
					myRow.append("<TD NOWRAP width=20% align=right>" + Util.fcolorCCY(msgList.getBigDecimalE06INTAMN().toString()) + "</TD>");
					myRow.append("<TD NOWRAP width=20% align=right>" + Util.fcolorCCY(msgList.getBigDecimalE06OTHAMN().toString()) + "</TD>");
					myRow.append("<TD NOWRAP width=20% align=right>" + Util.fcolorCCY(msgList.getBigDecimalE06TOTAMN().toString()) + "</TD>");
					myRow.append("<TD NOWRAP width=5% align=center>" + Util.formatCustomDate(user.getE01DTF(), msgList.getE06OPEDTM(), msgList.getE06OPEDTD(), msgList.getE06OPEDTY()) + "</TD>");					
					
					myRow.append("</TR>");
					
					beanList.addRow("", myRow.toString());
					indexRow ++;
					sumTotal= sumTotal.add(msgList.getBigDecimalE06PRIAMN());	
				}
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				req.setAttribute("Total",""+ sumTotal);
				session.setAttribute("cifAcc", beanList);
				PageToCall = "ECIF010_cif_accounts_external_det.jsp";
				}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(PageToCall, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	
//addry:ini
	private void procReqAccGrp(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		String PageToCall = "MISC_no_result.jsp";
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECIF010", req);
			ECIF01006Message msgList = (ECIF01006Message) mp.getMessageRecord("ECIF01006");
			msgList.setH06USERID(user.getH01USR());
		 	msgList.setH06PROGRM("ECIF010");
		 	msgList.setH06TIMSYS(getTimeStamp());
		 	msgList.setH06SCRCOD("01");
		 	try {
		 		msgList.setE06SELCUN(req.getParameter("Grupo").trim());
		 		msgList.setH06OPECOD("0014");
		 	} catch (Exception ex) {
		 		msgList.setE06SELCUN(userPO.getCusNum());
			 	msgList.setH06OPECOD("0004");
		 	}
			try {
				msgList.setE06SELACD(req.getParameter("appCode").trim());
			} catch (Exception ex) {
		 		msgList.setE06SELACD("");
			}
			try {
				msgList.setE06SELFLG(req.getParameter("flag").trim());
			} catch (Exception ex) {
		 		msgList.setE06SELFLG("");
			}
			try {
				msgList.setE06SELTYP(req.getParameter("prodType").trim());
			} catch (Exception ex) {
		 		msgList.setE06SELTYP("");
			}
			try {
				msgList.setE06SELPRO(req.getParameter("prodCode").trim());
			} catch (Exception ex) {
		 		msgList.setE06SELPRO("");
			}
			try {
				msgList.setE06ACCTYP(req.getParameter("ofc").trim());
				msgList.setH06SCRCOD("OF");
			} catch (Exception ex) {
				msgList.setE06ACCTYP("");
			}
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("E06INDOPE");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				PageToCall = "ECIF010_cif_client_search.jsp";
			} else {
				list.initRow();
				JBList beanList = new JBList();
				boolean firstTime = true;
				StringBuffer myRow = null;
				String chk = "";
				int indexRow = 0;
				BigDecimal sumTotal = new BigDecimal("0.00");
				while (list.getNextRow()) {
					msgList = (ECIF01006Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					myRow =  new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP><input type=\"radio\" name=\"ACCNUM\" value=\"" + msgList.getE06ACCNUM() + "\" " + chk + " onclick=\"showAddInfo("+indexRow+")\"></TD>");
					myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE06ACCNUM()) + "</TD>");
					myRow.append("<TD NOWRAP align=center>" + Util.formatCell(msgList.getE06ACCSTS()) + "</TD>");
					myRow.append("<TD NOWRAP align=center>" + Util.formatCell(msgList.getE06PROCDE()) + "</TD>");
					myRow.append("<TD NOWRAP align=center>" + Util.formatCell(msgList.getE06CCYCDE()) + "</TD>");
					myRow.append("<TD NOWRAP align=right>" + Util.fcolorCCY(msgList.getBigDecimalE06PRIAMN().toString()) + "</TD>");
					myRow.append("<TD NOWRAP align=center>" + Util.formatCell(msgList.getE06OFFICR()));
					myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"+indexRow+"\" VALUE=\"" + Util.formatCell(msgList.getE06BNKNUM()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE06BRNNUM()) + "<br>");
					myRow.append(Util.formatCustomDate(user.getE01DTF(), msgList.getE06OPEDTM(), msgList.getE06OPEDTD(), msgList.getE06OPEDTY()) + "<br>");
					myRow.append(Util.fcolorCCY(msgList.getBigDecimalE06PRIAMN().toString()) + "<br>");
					myRow.append(Util.fcolorCCY(msgList.getBigDecimalE06INTAMN().toString()) + "<br>");
					myRow.append(Util.fcolorCCY(msgList.getBigDecimalE06OTHAMN().toString()) + "<br>");
					myRow.append(Util.fcolorCCY(msgList.getBigDecimalE06TOTAMN().toString()) + "\">");
					myRow.append("<INPUT TYPE=HIDDEN NAME=\"CODACD"+indexRow+"\" VALUE=\"" + Util.formatCell(msgList.getE06SELACD()) + "\"></TD>");
					myRow.append("</TR>");
					
					beanList.addRow("", myRow.toString());
					indexRow ++;
					sumTotal= sumTotal.add(msgList.getBigDecimalE06PRIAMN());	
				}
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				req.setAttribute("Total",""+ sumTotal);
				session.setAttribute("cifAcc", beanList);
				PageToCall = "ECIF010_cif_accounts.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(PageToCall, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
//addry:end	
	private void procReqProd(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		String PageToCall = "MISC_no_result.jsp";
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECIF010", req);
			ECIF01004Message msgList = (ECIF01004Message) mp.getMessageRecord("ECIF01004");
			msgList.setH04USERID(user.getH01USR());
		 	msgList.setH04PROGRM("ECIF010");
		 	msgList.setH04TIMSYS(getTimeStamp());
		 	msgList.setH04SCRCOD("01");
		 	msgList.setH04OPECOD("0004");
		 	msgList.setE04CUSCUN(userPO.getCusNum());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("E04INDOPE");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				PageToCall = "ECIF010_cif_client_search.jsp";
			} else {
				list.initRow();
				JBList beanList = new JBList();
				boolean firstTime = true;
				StringBuffer myRow = null;
				BigDecimal totalAssets = new BigDecimal("0.00");
				BigDecimal totalLiabilities = new BigDecimal("0.00");
				BigDecimal netPosition = new BigDecimal("0.00");
				String graphAssets = "";
				String graphLiabilities = "";
				int colAssets = 0;
				int colLiabilities = 0;
				String myFlag = "";
				while (list.getNextRow()) {
					msgList = (ECIF01004Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						userPO.setHeader1(msgList.getE04CUSNA1());
						userPO.setHeader2(msgList.getE04CUSSTS());
					}
					myFlag = msgList.getE04CLSACC();
					if ( myFlag.trim().equals("1") ) {
						totalAssets = totalAssets.add(msgList.getBigDecimalE04BSETOT());
						colAssets ++;
						graphAssets += "<param name=c" + colAssets + "_label value=\"" + msgList.getE04PROCDE() + "\">";
		            	graphAssets += "<param name=c" + colAssets + " value=\"" + msgList.getE04BSEPRI() + "\">";
		            	graphAssets += "<param name=c1" + colAssets + "color value=\"red\">";
		            	graphAssets += "<param name=c1" + colAssets + "style value=\"solid\">";
						colAssets ++;
						graphAssets += "<param name=c" + colAssets + "_label value=\"\">";
		            	graphAssets += "<param name=c" + colAssets + " value=\"" + msgList.getE04BSEINT() + "\">";
		            	graphAssets += "<param name=c" + colAssets + "_color value=\"blue\">";
		            	graphAssets += "<param name=c" + colAssets + "_style value=\"solid\">";
					} else if ( myFlag.trim().equals("2") ) {
						totalLiabilities = totalLiabilities.add(msgList.getBigDecimalE04BSETOT());
						colLiabilities ++;
						graphLiabilities += "<param name=c" + colLiabilities + "_label value=\"" + msgList.getE04PROCDE() + "\">";
		            	graphLiabilities += "<param name=c" + colLiabilities + " value=\"" + msgList.getE04BSEPRI() + "\">";
		            	graphLiabilities += "<param name=c" + colLiabilities + "_color value=\"red\">";
		            	graphLiabilities += "<param name=c" + colLiabilities + "_style value=\"solid\">";
						colLiabilities ++;
						graphLiabilities += "<param name=c" + colLiabilities + "_label value=\"\">";
		            	graphLiabilities += "<param name=c" + colLiabilities + " value=\"" + msgList.getE04BSEINT() + "\">";
		            	graphLiabilities += "<param name=c" + colLiabilities + "_color value=\"blue\">";
		            	graphLiabilities += "<param name=c" + colLiabilities + "_style value=\"solid\">";
					}
					myRow =  new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP WIDTH=\"35%\" ALIGN=LEFT><A HREF=\"javascript:showProdAcc('" + msgList.getE04APLCDE() + "','" + msgList.getE04FLGOPE() + "','" + msgList.getE04ACCTYP() + "','" + msgList.getE04PROCDE() + "')\">" + Util.formatCell(msgList.getE04PRODSC().trim()) + "</A></TD>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=CENTER>" + Util.formatCell(msgList.getE04PROCDE()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"5%\" ALIGN=CENTER>" + Util.formatCell(msgList.getE04BNKNUM()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"5%\" ALIGN=CENTER>" + Util.formatCell(msgList.getE04CCYCDE()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"5%\" ALIGN=CENTER>" + Util.formatCell(msgList.getE04NUMOPE()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE04BSEPRI()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE04BSEINT()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE04BSEOTH()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE04BSETOT()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow(myFlag, myRow.toString());
				}
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
			    String appHeader = "<TR><TD colspan=\"9\"><applet code=\"datapro.eibs.applets.graph.Chart.class\" width=100% height=150 align=\"absmiddle\"  codebase=\"" + webAppPath + "/applets/\">";   
				if ( !graphAssets.equals("")) {
			    	graphAssets = appHeader + "<param name=title value=\"\"><param name=columns value=" + colAssets + "><param name=orientation value=\"vertical\"><param name=scale value=\"1\">" + graphAssets + "</applet></TD></TR>";
				}
				if ( !graphLiabilities.equals("")) {
					graphLiabilities = appHeader + "<param name=title value=\"\"><param name=columns value=" + colLiabilities + "><param name=orientation value=\"vertical\"><param name=scale value=\"1\">" + graphLiabilities + "</applet></TD></TR>";
				}
				
		 		netPosition = totalAssets.subtract(totalLiabilities);

		 		userPO.setHeader3(Util.fcolorCCY(totalAssets.toString()));
				userPO.setHeader4(Util.fcolorCCY(totalLiabilities.toString()));
				userPO.setHeader5(Util.fcolorCCY(netPosition.toString()));
				userPO.setHeader6("");
				userPO.setHeader7("");
				
				session.setAttribute("cifProd", beanList);
				PageToCall = "ECIF010_cif_products.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(PageToCall, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqTotal(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		String PageToCall = "MISC_no_result.jsp";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECIF010", req);
			ECIF01003Message msgTotal = (ECIF01003Message) mp.getMessageRecord("ECIF01003");
		 	msgTotal.setH03USERID(user.getH01USR());
		 	msgTotal.setH03PROGRM("ECIF010");
		 	msgTotal.setH03TIMSYS(getTimeStamp());
		 	msgTotal.setH03FLGWK1(userPO.getHeader8());
		 	msgTotal.setH03SCRCOD("01");
		 	msgTotal.setH03OPECOD("0004");
		 	try {
			 	msgTotal.setE03CUSCUN(req.getParameter("E03CUSCUN") == null ? userPO.getCusNum() : req.getParameter("E03CUSCUN").trim());
			} catch (Exception e) {
				msgTotal.setE03CUSCUN(userPO.getCusNum());
			}
		 	
		 	mp.sendMessage(msgTotal);
		 	
		 	ELEERRMessage msgError = new ELEERRMessage();
		 	MessageRecord message = mp.receiveMessageRecord();
		 	
		 	if (mp.hasError(message)) {
		 		msgError = (ELEERRMessage) message;
				PageToCall = "ECIF010_cif_client_search.jsp";
		 	} else {
		 		msgTotal = (ECIF01003Message) message;
				PageToCall = "ECIF010_cif_total.jsp";
		 	}
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("cifTotal", msgTotal);
			//addry:ini
			if (PageToCall.trim().equals("ECIF010_cif_total.jsp")
				&&(!msgTotal.getE03CUSGRP().trim().equals("000000000"))){
				ECIF01003Message msgTotalGroup = (ECIF01003Message) mp.getMessageRecord("ECIF01003");
				msgTotalGroup.setH03USERID(user.getH01USR());
				msgTotalGroup.setH03PROGRM("ECIF010");
				msgTotalGroup.setH03TIMSYS(getTimeStamp());
				msgTotalGroup.setH03FLGWK1(userPO.getHeader8());
				msgTotalGroup.setH03SCRCOD("01");
				msgTotalGroup.setH03OPECOD("0004");
				msgTotalGroup.setE03CUSCUN(msgTotal.getE03CUSGRP().trim());
			 	mp.sendMessage(msgTotalGroup);
			 	message = mp.receiveMessageRecord();
			 	if (mp.hasError(message)) {
			 		msgTotalGroup.setE03CUSCUN("000000000"); 				 	
			 	} else {
			 		msgTotalGroup = (ECIF01003Message) message;
					PageToCall = "ECIF010_cif_total_group.jsp";
			 		userPO.setHeader23(msgTotalGroup.getE03CUSCUN());
					session.setAttribute("userPO", userPO);
					session.setAttribute("cifTotalG", msgTotalGroup);
				}  
			}	
			//addry:end
			forward(PageToCall, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		String PageToCall = "MISC_no_result.jsp";
		int posi = 0;
		try {
			posi = Integer.parseInt(req.getParameter("Pos"));
		} catch (Exception e) {
			posi = 0;
		}
		int type = 0;
		try {
			type = Integer.parseInt(req.getParameter("Type"));
		} catch (Exception e) {
			type = 0;
		}
		String num = req.getParameter("NameSearch") == null ? "" : req.getParameter("NameSearch").toUpperCase();
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECIF010", req);
			ECIF01001Message msgSearch = (ECIF01001Message) mp.getMessageRecord("ECIF01001");
			msgSearch.setH01USERID(user.getH01USR());
		 	msgSearch.setH01PROGRM("ECIF010");
		 	msgSearch.setH01TIMSYS(getTimeStamp());
		 	msgSearch.setH01FLGWK1(userPO.getHeader8());
		 	msgSearch.setH01SCRCOD("01");
		 	msgSearch.setH01OPECOD("0004");
		 	msgSearch.setE01SELTYP("" + type);
		 	switch (type) {
			 	case 1 :
		 			msgSearch.setE01SELCUN(num);
			 		break;
			 	case 5 :
		 			msgSearch.setE01SELACC(num);
			 		break;
			 	default :
		 			msgSearch.setE01SELNME(num);
		 	}
		 	msgSearch.setE01NUMREC("" + posi);
			
			mp.sendMessage(msgSearch);
			
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("E02INDOPE", "E02NUMREC");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				PageToCall = "ECIF010_cif_client_search.jsp";
			} else {
				list.initRow();
				JBList beanList = new JBList();
				boolean firstTime = true;
				StringBuffer myRow = null;
				String chk = "";
				int indexRow = 0;
				while (list.getNextRow()) {
					ECIF01002Message msgList = (ECIF01002Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						beanList.setFirstRec(Integer.parseInt(msgList.getE02NUMREC()));
						chk = "checked";
					} else {
						chk = "";
					}
					myRow =  new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=CENTER><input type=\"radio\" name=\"CUSTOMER\" value=\"" + msgList.getE02CUSCUN() + "\" " + chk + " onclick=\"showAddInfo("+indexRow+")\"></TD>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\">" + Util.formatCell(msgList.getE02CUSCUN()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"40%\">" + Util.formatCell(msgList.getE02CUSNA1()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"40%\">" + Util.formatCell(msgList.getE02CUSSHN()));
					
					if (msgList.getE02CUSLN3().indexOf("-") == -1) {
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"+indexRow+"\" VALUE=\"" +  Util.formatCell(msgList.getE02CUSIDN()) + "<br>");						
					} else {
						//PANAMA long identification
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"+indexRow+"\" VALUE=\"" +  Util.formatCell(msgList.getE02CUSLN3()) + "<br>");
					}					
					myRow.append(Util.formatCell(msgList.getE02CUSTID()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE02CUSPID()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE02CLISTS()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE02CLILGT()) + "\"></TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
					indexRow ++;				
				}
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				beanList.setSearchText(num);
				beanList.setSearchType(String.valueOf(type));
				
				session.setAttribute("cifList", beanList);
				PageToCall = "ECIF010_cif_list.jsp";
			}
			
			session.setAttribute("error", msgError);
			
			forward(PageToCall, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}
//addry_ini:
	private void procReqListGroup(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		String PageToCall = "MISC_no_result.jsp";
		int posi = 0;
		try {
			posi = Integer.parseInt(req.getParameter("Pos"));
		} catch (Exception e) {
			posi = 0;
		}
 		String num = req.getParameter("grpNum") == null ? "" : req.getParameter("grpNum").toUpperCase();
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECIF010", req);
			ECIF01001Message msgSearch = (ECIF01001Message) mp.getMessageRecord("ECIF01001");
			msgSearch.setH01USERID(user.getH01USR());
		 	msgSearch.setH01PROGRM("ECIF010");
		 	msgSearch.setH01TIMSYS(getTimeStamp());
		 	msgSearch.setH01FLGWK1(userPO.getHeader8());
		 	msgSearch.setH01SCRCOD("01");
		 	msgSearch.setH01OPECOD("0004");
		 	msgSearch.setE01SELTYP("G");
 		 	msgSearch.setE01SELCUN(num);
 		 	msgSearch.setE01NUMREC("" + posi);
			
			mp.sendMessage(msgSearch);
			
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("E02INDOPE", "E02NUMREC");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				PageToCall = "ECIF010_cif_client_search.jsp";
			} else {
				list.initRow();
				JBList beanList = new JBList();
				boolean firstTime = true;
				StringBuffer myRow = null;
				String chk = "";
				int indexRow = 0;
				while (list.getNextRow()) {
					ECIF01002Message msgList = (ECIF01002Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						beanList.setFirstRec(Integer.parseInt(msgList.getE02NUMREC()));
						chk = "checked";
					} else {
						chk = "";
					}
					myRow =  new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\" ALIGN=CENTER><input type=\"radio\" name=\"CUSTOMER\" value=\"" + msgList.getE02CUSCUN() + "\" " + chk + " onclick=\"showAddInfo("+indexRow+")\"></TD>");
					myRow.append("<TD NOWRAP WIDTH=\"10%\">" + Util.formatCell(msgList.getE02CUSCUN()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"40%\">" + Util.formatCell(msgList.getE02CUSNA1()) + "</TD>");
					myRow.append("<TD NOWRAP WIDTH=\"40%\">" + Util.formatCell(msgList.getE02CUSSHN()));
					
					if (msgList.getE02CUSLN3().indexOf("-") == -1) {
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"+indexRow+"\" VALUE=\"" +  Util.formatCell(msgList.getE02CUSIDN()) + "<br>");						
					} else {
						//PANAMA long identification
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"+indexRow+"\" VALUE=\"" +  Util.formatCell(msgList.getE02CUSLN3()) + "<br>");
					}					
					myRow.append(Util.formatCell(msgList.getE02CUSTID()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE02CUSPID()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE02CLISTS()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE02CLILGT()) + "\"></TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
					indexRow ++;				
				}
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("cifList", beanList);
				PageToCall = "ECIF010_cif_list.jsp";
			}
			
			session.setAttribute("error", msgError);
			
			forward(PageToCall, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
//addry_end.	
	private void procReqSearch(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		userPO.setOption("CIF");
		userPO.setPurpose("INQUIRY");
		userPO.setHeader8(req.getParameter("OPTION") == null ? "" : req.getParameter("OPTION").trim());
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("ECIF010_cif_client_search.jsp", req, res);
	}

	private void procReqEnterAcc(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = getUserPos(req);
		userPO.setOption("ACCOUNTS");
		userPO.setPurpose("INQUIRY");
		userPO.setHeader8(req.getParameter("OPTION") == null ? "" : req.getParameter("OPTION").trim());
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("ECIF010_cif_enter_acc.jsp", req, res);
	}

}

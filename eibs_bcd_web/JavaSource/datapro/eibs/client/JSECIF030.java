package datapro.eibs.client;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.MissingResourceException;
import java.util.Properties;
import java.util.PropertyResourceBundle;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import datapro.eibs.beans.ECIF03001Message;
import datapro.eibs.beans.ECIF03002Message;
import datapro.eibs.beans.EDD009001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.generic.SimpleAthenticator;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.DecimalField;
import datapro.eibs.sockets.MessageRecord;


/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSECIF030 extends JSEIBSServlet {

	// CIF options
	protected static final int R_LIST = 1;
	protected static final int R_SEARCH = 2;
	protected static final int A_SEARCH = 3;
	protected static final int R_PRINT = 4;
	protected static final int R_DESC = 5;
	protected static final int R_PDF = 6;
	protected static final int R_EMAIL = 7;

	// entering options
	protected static final int R_ENTER = 100;
	protected static final int A_ENTER = 200;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_SEARCH :
				procReqSearch(user, req, res, session);
				break;
			case A_SEARCH :
				procActionSearch(user, req, res, session);
				break;
			case R_LIST :
				procReqList(user, req, res, session);
				break;
			case R_PRINT :
				procReqPrintList(user, req, res, session);
				break;
			case R_PDF :
			case R_EMAIL :
				procReqPDF(user, req, res, session, screen);
				break;
			case R_ENTER :
				procReqSTEnterSearch(user, req, res, session);
				break;
			case A_ENTER :
				procActionSTEnterSearch(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionSTEnterSearch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECIF030", req);
			EDD009001Message msg = (EDD009001Message) mp.getMessageRecord("EDD009001", user.getH01USR(), "0002");
			msg.setH01SCRCOD("01");
			try {
				if (req.getParameter("E01ACMACC") != null) {
					msg.setE01ACMACC(req.getParameter("E01ACMACC"));
				} else {
					msg.setE01ACMACC(userPO.getIdentifier());
				}
			} catch (Exception e) {
			}

			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDD009001Message) mp.receiveMessageRecord("EDD009001");

			session.setAttribute("error", msgError);
			
			if (mp.hasError(msgError)) {
				forward("ECIF030_st_enter_stat.jsp", req, res);
			} else {
				userPO.setIdentifier(msg.getE01ACMACC());
				userPO.setHeader1(msg.getE01ACMPRO());
				userPO.setCusNum(msg.getE01ACMCUN());
				userPO.setHeader2(msg.getE01ACMCUN());
				userPO.setHeader3(msg.getE01CUSNA1());
				userPO.setCurrency(msg.getE01ACMCCY());
				userPO.setOfficer(msg.getE01ACMOFC() + " - " + msg.getE01DSCOFC());

				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				procReqSearch(user, req, res, session);
			}
		
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqSTEnterSearch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		//UserPos userPO = (UserPos) session.getAttribute("userPO");
		UserPos userPO = new UserPos();
		String opt = "RT";
		String prd = "RA";
		if (req.getParameter("Type") != null) {
			if (req.getParameter("Type").equals("SV")) {
				opt = "SV";
				prd = "04";
			} else if (req.getParameter("Type").equals("CP")) { 
				opt = "CP";
				prd = "06";
			}	
		}
		userPO.setOption(opt);
		userPO.setPurpose("STATEMENT");
		userPO.setRedirect("/servlet/datapro.eibs.client.JSECIF030?SCREEN=200");
		userPO.setProdCode(prd);
		//Others Parameters
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		session.setAttribute("userPO", userPO);
		ELEERRMessage msgError = new ELEERRMessage();
		session.setAttribute("error", msgError);
		forward("GENERIC_account_enter.jsp", req, res);
	}
	
	protected Hashtable formatInterestTable(ECIF03002Message ms)
	{
		DecimalFormat interestFormatter = new DecimalFormat("#,##0.000000");
		DecimalFormat rangeFormatter = new DecimalFormat("#,##0");
		String[] keys = {"L","1","2","3","4","5","6","7","8","9","X","Y"};
		final String MESSAGE_MAX = " en adelante";
		final BigDecimal ZERO = new BigDecimal("0");
		BigDecimal interest;
		String amountRange;
		ArrayList amountColumn = new ArrayList();
		ArrayList interestColumn = new ArrayList();
		double rangeMin;
		double rangeMax;
		final double RANGE_MAX_FACTOR = 1.00;
		Hashtable ht = new Hashtable();
		try{//set starting interest rate
			interest = ((DecimalField)ms.getField("E02STHMKR")).getBigDecimal();
		} catch(Exception ex){
			interest = ZERO;
		}
		
		if(interest.compareTo(ZERO)>0)
		{
			
			for(int i = 0; i < keys.length;i++) 
			{
				if(i != 0){
					if(i+1 < keys.length){ //protect against array out of bounds ex.
						interest = ((DecimalField)ms.getField("E02STHMR"+keys[i])).getBigDecimal();
					} else {
						interest = null;
					}
				}
				
				if(interest != null && interest.compareTo(ZERO)>0) {
					rangeMax = ((DecimalField)ms.getField("E02STHMB"+keys[i+1]))
						.getBigDecimal().doubleValue() - RANGE_MAX_FACTOR;
					if(i == 0){
						if(rangeMax != (-RANGE_MAX_FACTOR)){
							rangeMin = ((DecimalField)ms.getField("E02STHMK"+keys[i])).getBigDecimal().doubleValue();
							amountRange = rangeFormatter.format(rangeMin)+" a "+ rangeFormatter.format(rangeMax);
						}else{
							rangeMin = ((DecimalField)ms.getField("E02STHMK"+keys[i])).getBigDecimal().doubleValue();
							amountRange = rangeFormatter.format(rangeMin)+ MESSAGE_MAX;
						}						
					} else {
						if(rangeMax == (-RANGE_MAX_FACTOR)){//make sure maximum amount is not zero
							rangeMin = ((DecimalField)ms.getField("E02STHMB"+keys[i])).getBigDecimal().doubleValue();
							amountRange = rangeFormatter.format(rangeMin)+ MESSAGE_MAX;
							
						} else {
							rangeMin = ((DecimalField)ms.getField("E02STHMB"+keys[i])).getBigDecimal().doubleValue();
							amountRange = rangeFormatter.format(rangeMin)+" a "+ rangeFormatter.format(rangeMax);
						}
						 
					}
					
					//add interest/amount to corresponding column objects
					interestColumn.add(interestFormatter.format(interest.doubleValue())+"%");
					amountColumn.add(amountRange);
				}			
				
			}
			ht.put(interestColumn, amountColumn);
			
		}
		return ht;
	}
	
	/**
	 * @param baosPDF
	 * @param session
	 * @return
	 */
	private String procSendEmail(ByteArrayOutputStream baosPDF, HttpSession session) throws ServletException, IOException {
		ECIF03002Message msgHeader = (ECIF03002Message) session.getAttribute("stBalances");

		String senderror = "0";
		String host = "";
		String protocol = "";
		String to = "";
		String toerror = "";
		String from = "";
		String fromalias = "";
		String subject = "";
		String text = "";
		String user = "";
		String password = "";
		String path = "";
		String filename = "";

		to = msgHeader.getE02CUSIAD();

		String fn = com.datapro.generic.tool.Util.getTimestamp().toString();
		fn = Util.replace(fn, ":", "-");
		fn = Util.replace(fn, ".", "-");
		filename = fn + ".pdf";

		// Getting Properties
		String propertyFileName = "email";

		try {

			PropertyResourceBundle  appProp =
				(PropertyResourceBundle) PropertyResourceBundle.getBundle(
					propertyFileName);

			// Read email pool sender properties
			try {
				host = appProp.getString("email.server.host");
			} catch (Exception e) {
				host = "";
			}

			try {
				protocol = appProp.getString("email.server.protocol");
			} catch (Exception e) {
				protocol = "";
			}

			try {
				from = appProp.getString("email.from");
			} catch (Exception e) {
				from = "";
			}

			try {
				fromalias = appProp.getString("email.fromalias");
			} catch (Exception e) {
				fromalias = "";
			}

			try {
				subject = appProp.getString("email.subject");
			} catch (Exception e) {
				subject = "";
			}

			try {
				text = appProp.getString("email.message");
			} catch (Exception e) {
				text = "";
			}

			try {
				user = appProp.getString("email.username");
			} catch (Exception e) {
				user = "";
			}

			try {
				password = appProp.getString("email.password");
			} catch (Exception e) {
				password = "";
			}

			try {
				path = appProp.getString("email.path");
			} catch (Exception e) {
				path = "";
			}

			try {
				toerror = appProp.getString("email.toerror");
			} catch (Exception e) {
				toerror = "";
			}

		} catch (MissingResourceException e) {
			flexLog("Error: " + e);
			senderror = e.toString();
			throw new RuntimeException("Propeties File Error");
		}

		if (to.equals("")) {
			to = toerror;
		}

		File file = new File(path);
		if (file.exists()) {
			try {
				// Writing file to disk
				OutputStream fo = new FileOutputStream(path + filename);
				byte buf[] = baosPDF.toByteArray();
				fo.write(buf);
				fo.close();
			
				File filetoattach = new File(path + filename);
				// Get system properties
				Properties props = new Properties();

				// Setup mail server
				props.put("mail." + protocol.toLowerCase().trim() + ".host", host);

				// Athentication
				SimpleAthenticator sa = null;
				//
				if (!user.equals("")) {
					sa = new SimpleAthenticator(user, password);
				}
				// Get session
				Session mailsession = Session.getInstance(props, sa);
				// Define message
				MimeMessage message = new MimeMessage(mailsession);
				// Set the from address
				message.setFrom(new InternetAddress(from, fromalias));
				// Set the to address
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				// Set the subject
				message.setSubject(subject);
				// Set the content
				MimeBodyPart mbp1 = new MimeBodyPart();
				mbp1.setText(text);
				// Set attachment
				MimeBodyPart mbp2 = new MimeBodyPart();

				FileDataSource fds = new FileDataSource(filetoattach);
				mbp2.setDataHandler(new DataHandler(fds));
				mbp2.setFileName(fds.getName());

				Multipart mp = new MimeMultipart();
				mp.addBodyPart(mbp1);
				mp.addBodyPart(mbp2);

				message.setContent(mp);

				// Send message
				Transport.send(message);
			
				filetoattach.delete();

			} catch (Exception e) {
				senderror = e.toString();
				flexLog("Error: " + senderror);
			}
		} else {
			senderror = "Path " + path + " not found in Local File System.";
			flexLog("Error: " + senderror);
		}
		return (senderror);
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqPDF(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		MessageProcessor mp = null;
		//Colors
		float BLACK = 0.0f;
		float LITEGRAY = 0.9f;
		float DARKGRAY = 0.7f;
		float WHITE = 1.0f;
		
		int posi = 0;
		try {
			try {
				posi = Integer.parseInt(req.getParameter("Pos"));
			} catch (Exception e) {
				posi = 0;
			}
			mp = getMessageProcessor("ECIF030", req);
			ECIF03001Message msg = (ECIF03001Message) mp.getMessageRecord("ECIF03001", user.getH01USR(), "0004");
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("P");
			msg.setE01NUMREC(String.valueOf(posi));
			try {
				msg.setE01NUMACC(userPO.getIdentifier());
			} catch (Exception e) {
				flexLog("E01NUMACC is null");
			}
			msg.setE01HISCYC(userPO.getHeader7());
			msg.setE01VALBTH(userPO.getHeader8());
			//flexLog("DATE FROM");
			msg.setE01FRDTED(userPO.getHeader9());
			msg.setE01FRDTEM(userPO.getHeader10());
			msg.setE01FRDTEY(userPO.getHeader11());
			//flexLog("DATE TO");
			msg.setE01TODTED(userPO.getHeader12());
			msg.setE01TODTEM(userPO.getHeader13());
			msg.setE01TODTEY(userPO.getHeader14());
			//flexLog("CHECK FROM");
			msg.setE01FRCHKN(userPO.getHeader15());
			//flexLog("CHECK TO");
			msg.setE01TOCHKN(userPO.getHeader16());
			//flexLog("AMOUNT FROM");
			msg.setE01FRAMNT(userPO.getHeader17());
			//flexLog("AMOUNT TO");
			msg.setE01TOAMNT(userPO.getHeader18());
		
			mp.sendMessage(msg);

			MessageRecord newmessage = mp.receiveMessageRecord();
			
			if (mp.hasError(newmessage)) {
				ELEERRMessage  msgError = (ELEERRMessage) newmessage;
				session.setAttribute("error", msgError);
				forward("ECIF030_st_selection.jsp", req, res);
			} else {
				boolean ACT = screen == R_EMAIL;
				
				String title = "";

				String header01 = "";
				String header02 = "";
				String header021= "";
				String header022= "";
				String header03 = "";
				String header04 = "";
				String header05 = "";
				String header06 = "";
				String header07 = "";
				String header08 = "";
				String header09 = "";
				String header10 = "";
				String header11 = "";
				String header12 = "";
				String header13 = "";
				String header14="";

				String detail1 = "";
				String detail2 = "";
				String detail3 = "";
				String detail4 = "";
				String detail5 = "";
				String detail6 = "";
				String detail7 = "";
				String detail8 = "";

				String footer0 = "";
				String footer1 = "";
				String footer2 = "";
				String footer3 = "";

				String page = "";
				String cuscun = "";
				String accnum = "";
				String name = "";
				String add = "";
				String add1 = "";
				String add2 = "";
				String pro = "";
				String ccy = "";
				String bal = "";
				String uncol = "";
				String hold = "";
				String climit = "";
				String avabal = "";
				String grobal = "";
				String purAcc = "";
				String dd1 = "";
				String dd2 = "";
				String dd3 = "";
				String creator = "";
				
				Hashtable ht = null;
				
				if (newmessage.getFormatName().equals("ECIF03002")) {
					ECIF03002Message msgHeader = (ECIF03002Message) newmessage; 
					cuscun = msgHeader.getE02ACMCUN();
					accnum = msgHeader.getE02ACMACC();
					name =
						Util.unformatHTML(
							msgHeader.getE02LGNA01()
								+ " "
								+ msgHeader.getE02LGNA02()
								+ " "
								+ msgHeader.getE02LGNA03()
								+ " "
								+ msgHeader.getE02LGNA04()
								+ " "
								+ msgHeader.getE02LGNA05()
								+ " "
								+ msgHeader.getE02LGNA06()
								+ " "
								+ msgHeader.getE02LGNA07()
								+ " "
								+ msgHeader.getE02LGNA08()
								+ " "
								+ msgHeader.getE02LGNA09());				
					add = Util.unformatHTML(msgHeader.getE02CUMMA1());
					add1 = Util.unformatHTML(msgHeader.getE02CUMMA2());
					add2 = Util.unformatHTML(msgHeader.getE02CUMMA3() + " " + msgHeader.getE02CUMMA4());
					pro = Util.unformatHTML(msgHeader.getE02ACMPRO());
					ccy = msgHeader.getE02ACMCCY();
					bal = msgHeader.getE02ACMMGB();
					uncol = msgHeader.getE02UNCBAL();
					hold = msgHeader.getE02ACMHAM();
					climit = msgHeader.getE02ACMCLI();
					avabal = msgHeader.getE02AVALBL();
					grobal = msgHeader.getE02ACMGAV();
					purAcc = Util.unformatHTML(msgHeader.getE02LGNA10());
					dd1 = Util.addLeftChar('0', 2, msgHeader.getE02LSSTMD());
					dd2 = Util.addLeftChar('0', 2, msgHeader.getE02LSSTMM());
					dd3 = Util.addLeftChar('0', 2, msgHeader.getE02LSSTMY());
					creator = msgHeader.getE02ACMACC();
					ht = formatInterestTable(msgHeader);
					if (user.getE01LAN().toUpperCase().equals("E")) {
						title = "Account Statement";

						header01 = "Account";
						header02 = "       "; //Name
						header03 = "       "; //Address
						header04 = "Product";
						header05 = "Gross";
						header06 = "Balance";
						header07 = "Uncollected Balance";
						header08 = "Hold Amount";
						header09 = "Credit Limit";
						header10 = "Available Balance";
						header11 = "Gross Average";
						header12 = "Balance as of";
						header13 = "Purpose of Account";
						header14= "Branch";

						detail1 = "Process Date";
						detail2 = "Reference";
						detail3 = "Description";
						detail4 = "Debit";
						detail5 = "Credit";
						detail6 = "Balance";
						detail7 = "Amount";
						detail8 = "Interest";

						footer0 = "ITBMS";
						footer1 = "Total Debits";
						footer2 = "Total Credits";
						footer3 = "Ending Balance";

						page = "Page Number: ";
					} else if (user.getE01LAN().toUpperCase().equals("S")) {
						title = "Estado de Cuentas";

						header01 = "Cuenta";
						header02 = "Cliente"; // Nombre
						header021= "      ";  // Nombre Cuenta
						header022= "      ";  // Nombre Cuenta
						header03 = "      ";  // Direccion
						header04 = "Producto";
						header05 = "Saldo Global";
						header06 = "Saldo";
						header07 = "Saldo Diferido";
						header08 = "Monto Retenido";
						header09 = "Limite de Credito";
						header10 = "Balance Disponible";
						header11 = "Promedio Global";
						header12 = "Saldo a la Fecha";
						header13 = "Proposito de la Cuenta";
						header14 = "Sucursal";

						detail1 = "Fecha Proceso";
						detail2 = "Referencia";
						detail3 = "Descripción";
						detail4 = "Debito";
						detail5 = "Credito";
						detail6 = "Saldo";
						detail7 = "Monto";
						detail8 = "Tasa";

						footer0 = "ITBMS";
						footer1 = "Total Debitos";
						footer2 = "Total Creditos";
						footer3 = "Saldo Final";

						page = "Numero de Pagina: ";
					}
					
					//String baldat = dd1 + "/" + dd2 + "/" + dd3;
					String baldat = user.getE01RDD() + "/" + user.getE01RDM() + "/" + user.getE01RDY();
					Document doc = new Document(PageSize.LETTER, 36, 36, 36, 36);
					
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
						doc.addAuthor("eIBS");
						doc.addCreationDate();
						doc.addProducer();
						doc.addCreator(creator);
						doc.addTitle(title);
						doc.addKeywords("pdf, itext, Java, open source, http");

						Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.NORMAL);
						Font headerBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD);
						
						//Font normalBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD);
						//Font normalBoldUnderFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD | Font.UNDERLINE);
						//Font headerFont = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL);
						//Font headerBoldUnderFont = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD | Font.UNDERLINE);
						
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

						Table table = new Table(2, 7);
						table.setBorderWidth(0);
						table.setCellsFitPage(true);
						table.setPadding(1);
						table.setSpacing(1);
						table.setWidth(100);

						Cell cell = new Cell(new Paragraph(header01 + ": " + accnum, headerBoldFont));
						cell.setHorizontalAlignment(Element.ALIGN_LEFT);
						cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						cell.setBorder(Rectangle.NO_BORDER);
						table.addCell(cell);
						
						
						// Cell for image
						 cell = new Cell();
						 cell.setRowspan(7);
						 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			             cell.setVerticalAlignment(Element.ALIGN_TOP);
			             cell.setBorder(Rectangle.NO_BORDER);


						 try{
						   URL url = getServletContext().getResource("/images/logo.jpg");	 
						   cell.add(Image.getInstance(url));
						 } catch(Exception e) {
							 flexLog("Error loading Logo :" + e.getMessage());
						 }
						 table.addCell(cell);
						
						cell = new Cell(new Paragraph(header021 + "        " , headerBoldFont));
						cell.setHorizontalAlignment(Element.ALIGN_LEFT);
						cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						cell.setBorder(Rectangle.NO_BORDER);
						table.addCell(cell);

						cell = new Cell(new Paragraph(header02 + ":  " + name, headerBoldFont));
						cell.setHorizontalAlignment(Element.ALIGN_LEFT);
						cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						cell.setBorder(Rectangle.NO_BORDER);
						table.addCell(cell);
						
						cell = new Cell(new Paragraph(header03 + "        " + add, headerBoldFont));
						cell.setHorizontalAlignment(Element.ALIGN_LEFT);
						cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						cell.setBorder(Rectangle.NO_BORDER);
						table.addCell(cell);
						
						cell = new Cell(new Paragraph(header03 + "        " + add1, headerBoldFont));
						cell.setHorizontalAlignment(Element.ALIGN_LEFT);
						cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						cell.setBorder(Rectangle.NO_BORDER);
						table.addCell(cell);

						cell = new Cell(new Paragraph(header03 + "        " + add2, headerBoldFont));
						cell.setHorizontalAlignment(Element.ALIGN_LEFT);
						cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						cell.setBorder(Rectangle.NO_BORDER);
						table.addCell(cell);

						cell = new Cell(new Paragraph(header12 + ": " + baldat, headerBoldFont));
						cell.setHorizontalAlignment(Element.ALIGN_LEFT);
						cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						cell.setBorder(Rectangle.NO_BORDER);
						table.addCell(cell);
						
						cell = new Cell(BLANK);
						cell.setHorizontalAlignment(Element.ALIGN_LEFT);
						cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						cell.setBorder(Rectangle.NO_BORDER);
						table.addCell(cell);

						cell = new Cell(new Paragraph(header10 + ": " + avabal, headerBoldFont));
						cell.setHorizontalAlignment(Element.ALIGN_LEFT);
						cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						cell.setBorder(Rectangle.NO_BORDER);
						table.addCell(cell);
			               
						cell = new Cell(new Paragraph(header14 + ": " + user.getE01UBR(), headerBoldFont));
						cell.setHorizontalAlignment(Element.ALIGN_LEFT);
						cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						cell.setBorder(Rectangle.NO_BORDER);
						table.addCell(cell);

						doc.add(table);
						
						//Interest Table
						if (ht.size()>0) {
							
							PdfPTable interestTable = new PdfPTable(2); //two columns
							interestTable.getDefaultCell().setPadding(3);
							int headwidths[] = {50, 50}; // percentage
							interestTable.setWidths(headwidths);
							interestTable.setWidthPercentage(100); // percentage

							interestTable.getDefaultCell().setBorderWidth(1);
							interestTable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
							interestTable.getDefaultCell().setGrayFill(DARKGRAY);
							interestTable.addCell(new Paragraph(detail7, headerBoldFont));
							interestTable.addCell(new Paragraph(detail8, headerBoldFont));
							interestTable.setHeaderRows(1); // this is the end of the table header

							interestTable.getDefaultCell().setBorderWidth(1);
							interestTable.getDefaultCell().setGrayFill(WHITE);
							
							ArrayList interestValues =(ArrayList)ht.keys().nextElement();
							ArrayList amountValues = (ArrayList)ht.elements().nextElement();
							
							for (int i = 0; i < interestValues.size(); i++) {
								interestTable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
								interestTable.addCell(new Paragraph((String)amountValues.get(i), normalFont));
								interestTable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
								interestTable.addCell(new Paragraph((String)interestValues.get(i), normalFont));
							}
							
							doc.add(interestTable);
						}
						
						table = new Table(1, 1);
						table.setBorderWidth(0);
						table.setCellsFitPage(true);
						table.setPadding(1);
						table.setSpacing(1);
						table.setWidth(100);

						cell = new Cell(BLANK);
						cell.setHorizontalAlignment(Element.ALIGN_LEFT);
						cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						cell.setBorder(Rectangle.NO_BORDER);
						table.addCell(cell);

						doc.add(table);

						int NumColumns = 6;
						PdfPTable datatable = new PdfPTable(NumColumns);
						datatable.setComplete(false);

						datatable.getDefaultCell().setPadding(3);
						int headerwidths[] = { 10, 14, 35, 13, 13, 15 }; // percentage
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

						int i = 0;
						int countDebit = 0;
						int countCredit = 0;
						BigDecimal debit = new BigDecimal("0.00");
						BigDecimal credit = new BigDecimal("0.00");

						String dit11 = "";
						String dit21 = "";
						String dit31 = "";
						String dit41 = "";
						String dit51 = "";
						String dit61 = "";
						
						String E01NUTIBMS = "";
						String E01SUITBMS = "";
						
						String marker = "";
						boolean first = true;
						while (true) {
							ECIF03001Message msgList = (ECIF03001Message) mp.receiveMessageRecord();
							marker = msgList.getE01INDOPE();
							if ("*".equals(marker)) {
								break;
							} else if (first) {
								E01NUTIBMS = msgList.getE01NUITBMS().trim();
								E01SUITBMS = msgList.getE01SUITBMS().trim();
								first = false;
							}
							i++;
							if (i % 2 == 1) {
								datatable.getDefaultCell().setGrayFill(WHITE);
							} else {
								datatable.getDefaultCell().setGrayFill(LITEGRAY);
							}
							dit11 = Util.formatCustomDate(user.getE01DTF(), msgList.getE01DATE1M(), msgList.getE01DATE1D(), msgList.getE01DATE1Y());
							dit21 = msgList.getE01TRACKN(); // Reference
							if (dit21.equals("&nbsp;") || dit21.equals("0")) {
								dit21 = "";
							}
							dit31 = msgList.getE01TRANAR();
							dit41 = "";
							dit51 = "";

							if (msgList.getE01TRADCC().equals("0")) {
								debit = debit.add(msgList.getBigDecimalE01TRAAMT());
								countDebit++;
								dit41 = msgList.getE01TRAAMT();
							} else if (msgList.getE01TRADCC().equals("5")) {
								credit = credit.add(msgList.getBigDecimalE01TRAAMT());
								countCredit++;
								dit51 = msgList.getE01TRAAMT();
							}

							dit61 = msgList.getE01ENDBAL(); // Balance

							datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
							datatable.addCell(new Paragraph(dit11, normalFont));
							datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
							datatable.addCell(new Paragraph(dit21, normalFont));
							datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
							datatable.addCell(new Paragraph(dit31, normalFont));
							datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
							datatable.addCell(new Paragraph(dit41, normalFont));
							datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
							datatable.addCell(new Paragraph(dit51, normalFont));
							datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
							datatable.addCell(new Paragraph(dit61, normalFont));
							if (i % 100 == 0) {
								doc.add(datatable);
							}
						}
						datatable.setComplete(true);
						doc.add(datatable);

						table = new Table(1, 1);
						table.setBorderWidth(0);
						table.setCellsFitPage(true);
						table.setPadding(1);
						table.setSpacing(1);
						table.setWidth(100);

						cell = new Cell(BLANK);
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
						Paragraph ENDBAL = new Paragraph(dit61, headerBoldFont);

						NumColumns = 4;
						datatable = new PdfPTable(NumColumns);

						datatable.getDefaultCell().setPadding(3);
						datatable.getDefaultCell().setGrayFill(DARKGRAY);

						int headerwidths2[] = { 25, 25, 25,25 }; // percentage
						datatable.setWidths(headerwidths2);
						datatable.setWidthPercentage(100); // percentage

						datatable.getDefaultCell().setBorderWidth(1);
						datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
						datatable.addCell(new Paragraph(footer0, headerBoldFont));
						datatable.addCell(new Paragraph(footer1, headerBoldFont));
						datatable.addCell(new Paragraph(footer2, headerBoldFont));
						datatable.addCell(new Paragraph(footer3, headerBoldFont));

						datatable.setHeaderRows(1); // this is the end of the table header

						datatable.getDefaultCell().setGrayFill(WHITE);
						Paragraph test = new Paragraph(E01NUTIBMS + "                 " + E01SUITBMS, headerBoldFont);
						datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
						datatable.addCell(test);
						datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
						datatable.addCell(TDEBIT);
						datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
						datatable.addCell(TCREDIT);
						datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
						datatable.addCell(ENDBAL);

						doc.add(datatable);
						
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
							
						} else {
							String senderror = procSendEmail(baosPDF, session);
							String text = "";
							if (senderror.equals("0")) {
								if (user.getE01LAN().toUpperCase().equals("E")) {
									text = "Your email send OK";
								}
								if (user.getE01LAN().toUpperCase().equals("S")) {
									text = "Su email enviado OK";
								}
							} else {
								if (user.getE01LAN().toUpperCase().equals("E")) {
									text = "Your email did not send";
								}
								if (user.getE01LAN().toUpperCase().equals("S")) {
									text = "Su email no fue enviado";
								}
								text = text +  "<br><font color=\"red\">" + "Error: " + senderror + "</font>";
							}

							userPO.setHeader3(text); //Mail Confirmation
							session.setAttribute("userPO", userPO);
							
							forward("ECIF030_email_confirm.jsp", req, res);
						}
						
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
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqPrintList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		String PageToCall = "";
		MessageProcessor mp = null;
		int posi = 0;
		try {
			try {
				posi = Integer.parseInt(req.getParameter("Pos"));
			} catch (Exception e) {
				posi = 0;
			}
			mp = getMessageProcessor("ECIF030", req);
			ECIF03001Message msg = (ECIF03001Message) mp.getMessageRecord("ECIF03001", user.getH01USR(), "0004");
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("P");
			msg.setE01NUMREC(String.valueOf(posi));
			try {
				msg.setE01NUMACC(userPO.getIdentifier());
			} catch (Exception e) {
				flexLog("E01NUMACC is null");
			}
			msg.setE01HISCYC(userPO.getHeader7());
			msg.setE01VALBTH(userPO.getHeader8());
			//flexLog("DATE FROM");
			msg.setE01FRDTED(userPO.getHeader9());
			msg.setE01FRDTEM(userPO.getHeader10());
			msg.setE01FRDTEY(userPO.getHeader11());
			//flexLog("DATE TO");
			msg.setE01TODTED(userPO.getHeader12());
			msg.setE01TODTEM(userPO.getHeader13());
			msg.setE01TODTEY(userPO.getHeader14());
			//flexLog("CHECK FROM");
			msg.setE01FRCHKN(userPO.getHeader15());
			//flexLog("CHECK TO");
			msg.setE01TOCHKN(userPO.getHeader16());
			//flexLog("AMOUNT FROM");
			msg.setE01FRAMNT(userPO.getHeader17());
			//flexLog("AMOUNT TO");
			msg.setE01TOAMNT(userPO.getHeader18());
		
			mp.sendMessage(msg);

			//JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			MessageRecord newmessage = mp.receiveMessageRecord();
			ELEERRMessage msgError = new ELEERRMessage();
			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				session.setAttribute("error", msgError);
				PageToCall = "ECIF030_st_selection.jsp";
			} else if (newmessage.getFormatName().equals("ECIF03002")) {
				ECIF03002Message msgHeader = (ECIF03002Message) newmessage;
				session.setAttribute("stBalances", msgHeader);
				boolean firstTime = true;
				StringBuffer myRow = null;
				String strDebit = "";
				String strCredit = "";
				BigDecimal debit = new java.math.BigDecimal("0.00");
				BigDecimal credit = new java.math.BigDecimal("0.00");
				int countDebit = 0;
				int countCredit = 0;
				JBList beanList = new JBList();
				while (true) {
					ECIF03001Message msgList = (ECIF03001Message) mp.receiveMessageRecord();
					if ("*".equals(msgList.getE01INDOPE())) {
						break;
					} else {
						if (firstTime) {
							firstTime = false;
							if (posi == 0) {
								//userPO.setHeader5(msgList.getE01BEGBAL());
							}
							userPO.setHeader21(msgList.getE01ENDBAL());
							if (msgList.getE01VALBTH().equals("V")) {
								PageToCall = "ECIF030_st_list_print_fv.jsp";
							} else {	
								PageToCall = "ECIF030_st_list_print_fp.jsp";
							}
						}
		
						if (msgList.getE01TRADCC().equals("0")) {
							debit =
								debit.add(msgList.getBigDecimalE01TRAAMT());
							countDebit++;
							strDebit =
								Util.fcolorCCY(msgList.getE01TRAAMT());
							strCredit = "&nbsp;";
						} else if (msgList.getE01TRADCC().equals("5")) {
							credit =
								credit.add(
									msgList.getBigDecimalE01TRAAMT());
							countCredit++;
							strDebit = "&nbsp;";
							strCredit =
								Util.fcolorCCY(msgList.getE01TRAAMT());
						}
		
						myRow = new StringBuffer("<TR>");
						myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\">"
									+ Util.formatCustomDate(user.getE01DTF(),
										msgList.getE01DATE1M(),
										msgList.getE01DATE1D(),
										msgList.getE01DATE1Y())
									+ "</TD>");
						myRow.append(
								"<TD NOWRAP ALIGN=\"RIGHT\">"
									+ Util.formatCell(msgList.getE01TRACKN())
									+ "</TD>");
						if (msgList.getE01NUMNAR().equals("0")) {
								myRow.append(
									"<TD>"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "</TD>");
						} else {
							if (msgList
									.getE01NUMNAR()
									.trim()
									.equals("1")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "</TD>");
							} else if (
								msgList.getE01NUMNAR().trim().equals(
										"2")) {
								myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "</TD>");
							} else if (
									msgList.getE01NUMNAR().trim().equals(
										"3")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "</TD>");
							} else if (
									msgList.getE01NUMNAR().trim().equals(
										"4")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA4())
											+ "</TD>");
							} else if (
									msgList.getE01NUMNAR().trim().equals(
										"5")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA4())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA5())
											+ "</TD>");
							} else if (
									msgList.getE01NUMNAR().trim().equals(
										"6")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA4())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA5())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA6())
											+ "</TD>");
							} else if (
									msgList.getE01NUMNAR().trim().equals(
										"7")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA4())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA5())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA6())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA7())
											+ "</TD>");
							} else if (
									msgList.getE01NUMNAR().trim().equals(
										"8")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA4())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA5())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA6())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA7())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA8())
											+ "</TD>");
							} else if (
									msgList.getE01NUMNAR().trim().equals(
										"9")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA4())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA5())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA6())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA7())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA8())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA9())
											+ "</TD>");
							}
						}
						myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>" + strDebit + "</TD>");
						myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>"
									+ strCredit
									+ "</TD>");
						myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>"
									+ Util.fcolorCCY(msgList.getE01ENDBAL())
									+ "</TD>");
						myRow.append("</TR>");
						userPO.setHeader5(Util.fcolorCCY(msgList.getE01ENDBAL()));
						beanList.addRow("", myRow.toString());
					}	
				}
				
				userPO.setHeader19(Util.fcolorCCY(debit.toString()));
				userPO.setHeader20(Util.fcolorCCY(credit.toString()));
				userPO.setHeader22(countDebit + "");
				userPO.setHeader23(countCredit + "");
				flexLog("Putting java beans into the session");
				session.setAttribute("cifList", beanList);
				session.setAttribute("userPO", userPO);
			}
			forward(PageToCall, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		String PageToCall = "ECIF030_st_list_fp.jsp";// "MISC_no_result.jsp";
		MessageProcessor mp = null;
		int posi = 0;
		try {
			try {
				posi = Integer.parseInt(req.getParameter("Pos"));
			} catch (Exception e) {
				posi = 0;
				flexLog("E01NUMPOS");
			}
			mp = getMessageProcessor("ECIF030", req);
			ECIF03001Message msg = (ECIF03001Message) mp.getMessageRecord("ECIF03001", user.getH01USR(), "0004");
			msg.setE01NUMREC(String.valueOf(posi));
			try {
				msg.setE01NUMACC(userPO.getIdentifier());
			} catch (Exception e) {
				flexLog("E01NUMACC is null");
			}
			msg.setE01HISCYC(userPO.getHeader7());
			msg.setE01VALBTH(userPO.getHeader8());
			//flexLog("DATE FROM");
			msg.setE01FRDTED(userPO.getHeader9());
			msg.setE01FRDTEM(userPO.getHeader10());
			msg.setE01FRDTEY(userPO.getHeader11());
			//flexLog("DATE TO");
			msg.setE01TODTED(userPO.getHeader12());
			msg.setE01TODTEM(userPO.getHeader13());
			msg.setE01TODTEY(userPO.getHeader14());
			//flexLog("CHECK FROM");
			msg.setE01FRCHKN(userPO.getHeader15());
			//flexLog("CHECK TO");
			msg.setE01TOCHKN(userPO.getHeader16());
			//flexLog("AMOUNT FROM");
			msg.setE01FRAMNT(userPO.getHeader17());
			//flexLog("AMOUNT TO");
			msg.setE01TOAMNT(userPO.getHeader18());

			mp.sendMessage(msg);
		
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			list.initRow();
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) list.getRecord();
				session.setAttribute("error", msgError);
				PageToCall = "ECIF030_st_selection.jsp";
			} else {
				//First Massage must be ECIF03002 Header
				MessageRecord msgHeader = (MessageRecord) list.getRecord();
				if (msgHeader.getFormatName().equals("ECIF03002")) {
					flexLog("Putting java beans into the session for header");
					session.setAttribute("stBalances", msgHeader);
				}
				
				boolean firstTime = true;
				StringBuffer myRow = null;
				String grpData = "";
				String grpDate = "";
				String checkgraph = "";
				String strDebit = "";
				String strCredit = "";
				String oldacnu = "";
				String ibsacnu = "";
				String chknum = "";
				BigDecimal debit = new BigDecimal("0.00");
				BigDecimal credit = new BigDecimal("0.00");
				int row = 0;
				JBList beanList = new JBList();
				while (list.getNextRow()) {
					ECIF03001Message msgList = (ECIF03001Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						beanList.setFirstRec(Integer.parseInt(msgList.getE01NUMREC()));
						grpData = msgList.getE01ENDBAL();
						grpDate =
							Util.formatCustomDate(user.getE01DTF(),
								msgList.getE01DATE2M(),
								msgList.getE01DATE2D(),
								msgList.getE01DATE2Y());
						if (posi == 0) {
							userPO.setHeader5(msgList.getE01BEGBAL());
						}
						if (msgList.getE01VALBTH().equals("V")) {
							PageToCall = "ECIF030_st_list_fv.jsp";
						} else {	
							PageToCall = "ECIF030_st_list_fp.jsp";
						}
					} else {
						grpData =
							grpData + "|" + msgList.getE01ENDBAL();
						grpDate =
							grpDate
								+ "|"
								+ Util.formatCustomDate(user.getE01DTF(),
									msgList.getE01DATE2M(),
									msgList.getE01DATE2D(),
									msgList.getE01DATE2Y());

					}

					if (msgList.getE01TRADCC().equals("0")) {
						debit =
							debit.add(msgList.getBigDecimalE01TRAAMT());
						strDebit =
							Util.fcolorCCY(msgList.getE01TRAAMT());
						strCredit = "&nbsp;";
					} else if (msgList.getE01TRADCC().equals("5")) {
						credit =
							credit.add(
								msgList.getBigDecimalE01TRAAMT());
						strDebit = "&nbsp;";
						strCredit =
							Util.fcolorCCY(msgList.getE01TRAAMT());
					}

					String day =
						(userPO.getHeader8().equals("B"))
							? msgList.getE01DATE1D()
							: msgList.getE01DATE2D();
					String month =
						(userPO.getHeader8().equals("B"))
							? msgList.getE01DATE1M()
							: msgList.getE01DATE2M();
					String year =
						(userPO.getHeader8().equals("B"))
							? msgList.getE01DATE1Y()
							: msgList.getE01DATE2Y();

					try {
						chknum =
							Util.addLeftChar(
								'0',
								9,
								msgList.getE01TRACKN());
						ibsacnu =
							Util.addLeftChar(
								'0',
								12,
								msgList.getE01NUMACC());
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}

					if (chknum.equals("0")) {
						checkgraph = " ";
					} else {
						checkgraph =
							"<A HREF=\"javascript:showCheckImage('"
								+ ibsacnu
								+ "','"
								+ chknum
								+ "')\">"
								+ chknum
								+ "</A>";
					}

					myRow = new StringBuffer("<TR>");
					if (userPO.getHeader8().equals("B")) {
						myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:GetBatchDet('"
								+ month
								+ "','"
								+ day
								+ "','"
								+ year
								+ "','"
								+ msgList.getE01TRABTH()
								+ "','"
								+ msgList.getE01TRAACR()
								+ "')\">"
								+ Util.formatCustomDate(user.getE01DTF(),
									msgList.getE01DATE1M(),
									msgList.getE01DATE1D(),
									msgList.getE01DATE1Y())
								+ "</A></TD>");
					} else {
						myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatCustomDate(user.getE01DTF(),
									msgList.getE01DATE1M(),
									msgList.getE01DATE1D(),
									msgList.getE01DATE1Y())
								+ "</TD>");
					}
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\">"
							+ Util.formatCustomDate(user.getE01DTF(),
								msgList.getE01TRAPDM(),
								msgList.getE01TRAPDD(),
								msgList.getE01TRAPDY())
							+ "</TD>");

					if (msgList.getH01FLGWK2().equalsIgnoreCase("C")
						|| msgList.getE01TRACDE().equalsIgnoreCase("CK")
						|| msgList.getE01TRACDE().equalsIgnoreCase("K1")
						|| msgList.getE01TRACDE().equalsIgnoreCase("K5")) {
						myRow.append(
							"<TD NOWRAP ALIGN=\"RIGHT\">"
								+ checkgraph
								+ "</TD>");
					} else {
						myRow.append(
							"<TD NOWRAP ALIGN=\"RIGHT\"><a href=\"javascript:showTransfer('"
								+ msgList.getH01FLGWK3()
								+ Util.justifyRight(
									msgList.getE01TRACKN(),
									6)
								+ "')\">"
								+ msgList.getH01FLGWK3()
								+ " - "
								+ msgList.getE01TRACKN()
								+ "</a></TD>");
					}

					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\">"
							+ Util.formatCell(msgList.getE01TRACDE())
							+ "</TD>");
						
					if (msgList.getE01TRADRR().equals("0")) {
						myRow.append(
							"<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01TRANAR())
								+ "</TD>");
					} else {
						myRow.append(
							"<TD NOWRAP><A HREF=\"javascript:GetStatDesc('"
								+ msgList.getE01TRADRR()
								+ "','"
								+ msgList.getE01TRANAR()
								+ "','"
								+ Util.formatCustomDate(user.getE01DTF(),
									msgList.getE01DATE1M(),
									msgList.getE01DATE1D(),
									msgList.getE01DATE1Y())
								+ "','"
								+ Util.formatCell(msgList.getE01TRACDE())
								+ "')\">"
								+ Util.formatCell(msgList.getE01TRANAR())
								+ "</A></TD>");
					}

					myRow.append(
						"<TD NOWRAP ALIGN=RIGHT>" + strDebit + "</TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=RIGHT>"
							+ strCredit
							+ "</TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=RIGHT>"
							+ Util.fcolorCCY(msgList.getE01ENDBAL())
							+ "</TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=CENTER><A HREF=\"javascript:GetBatchDet('"
							+ month
							+ "','"
							+ day
							+ "','"
							+ year
							+ "','"
							+ msgList.getE01TRABTH()
							+ "','"
							+ msgList.getE01TRAACR()
							+ "')\">"
							+ Util.formatCell(msgList.getE01TRABTH())
							+ "</A></TD>");
					if (userPO.getHeader8().equals("V")) {
						myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:GetBatchDet('"
								+ month
								+ "','"
								+ day
								+ "','"
								+ year
								+ "','"
								+ msgList.getE01TRABTH()
								+ "','"
								+ msgList.getE01TRAACR()
								+ "')\">"
								+ Util.formatCustomDate(user.getE01DTF(),
									msgList.getE01DATE2M(),
									msgList.getE01DATE2D(),
									msgList.getE01DATE2Y())
								+ "</A></TD>");
					} else {
						myRow.append(
							"<TD NOWRAP ALIGN=CENTER>"
								+ Util.formatCustomDate(user.getE01DTF(),
									msgList.getE01DATE2M(),
									msgList.getE01DATE2D(),
									msgList.getE01DATE2Y())
								+ "</TD>");
					}
					myRow.append(
						"<TD NOWRAP ALIGN=CENTER>"
							+ msgList.getE01TRATMS()
							+ "</TD>");
					myRow.append(
						"<TD NOWRAP>"
							+ Util.formatCell(msgList.getE01TRAUSA().trim())
							+ "</TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=CENTER>"
							+ Util.formatCell(msgList.getE01TRAOBK())
							+ "</TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=CENTER>"
							+ Util.formatCell(msgList.getE01TRAOBR())
							+ "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
					row++;
					userPO.setHeader5(Util.fcolorCCY(msgList.getE01ENDBAL()));
					if (msgList.getE01INDOPE().equals("+")) {
						beanList.setShowNext(true);
					}
				}	
				
				userPO.setHeader19(Util.fcolorCCY(debit.toString()));
				userPO.setHeader20(Util.fcolorCCY(credit.toString()));
				userPO.setHeader21(grpData);
				userPO.setHeader22(grpDate);

				flexLog("Putting java beans into the session");
				session.setAttribute("cifList", beanList);
				session.setAttribute("userPO", userPO);
			}
			
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionSearch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		userPO.setHeader7(req.getParameter("E01HISCYC") == null ? "" : req.getParameter("E01HISCYC"));
		userPO.setHeader8(req.getParameter("E01VALBTH") == null ? "" : req.getParameter("E01VALBTH"));
		userPO.setHeader9(req.getParameter("E01FRDTE1") == null ? "" : req.getParameter("E01FRDTE1"));
		userPO.setHeader10(req.getParameter("E01FRDTE2") == null ? "" : req.getParameter("E01FRDTE2"));
		userPO.setHeader11(req.getParameter("E01FRDTE3") == null ? "" : req.getParameter("E01FRDTE3"));
		userPO.setHeader12(req.getParameter("E01TODTE1") == null ? "" : req.getParameter("E01TODTE1"));
		userPO.setHeader13(req.getParameter("E01TODTE2") == null ? "" : req.getParameter("E01TODTE2"));
		userPO.setHeader14(req.getParameter("E01TODTE3") == null ? "" : req.getParameter("E01TODTE3"));
		userPO.setHeader15(req.getParameter("E01FRCHKN") == null ? "" : req.getParameter("E01FRCHKN"));
		userPO.setHeader16(req.getParameter("E01TOCHKN") == null ? "" : req.getParameter("E01TOCHKN"));
		userPO.setHeader17(req.getParameter("E01FRAMNT") == null ? "" : req.getParameter("E01FRAMNT"));
		userPO.setHeader18(req.getParameter("E01TOAMNT") == null ? "" : req.getParameter("E01TOAMNT"));

		session.setAttribute("userPO", userPO);
		
		procReqList(user, req, res, session);
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqSearch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		forward("ECIF030_st_selection.jsp", req, res);
	}
	
}

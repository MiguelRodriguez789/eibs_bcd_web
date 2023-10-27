package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lowagie.text.BadElementException;
import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.ColumnText;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfPageEventHelper;
import com.lowagie.text.pdf.PdfWriter;

import datapro.eibs.beans.EDL029001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEDL0290 extends JSEIBSServlet {

	private static final float rowSpacing = 30f;
	
	// certificate of deposit 
	protected static final int R_CALC_INT 				= 1;
	protected static final int A_CALC_INT 				= 2;
	protected static final int R_SIMULACION 			= 100;
	protected static final int A_SIMULACION 			= 102;
	protected static final int P_SIMULACION 			= 200;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		// BEGIN CD
		// Request
		case R_CALC_INT:
			procReqCalcInt(user, req, res, session);
			break;					
									
		// Action
		case A_CALC_INT :
			procActionCalcInt(user, req, res, session);
			break;

		case R_SIMULACION :
			procReqSimulacion(user, req, res, session);
			break;

		case A_SIMULACION :
			procActSimulacion(user, req, res, session);
			break;
		
		case P_SIMULACION :
			procReqPrint(user, req, res, session);
			break;
		// END CD

		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procReqPrint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		EDL029001Message msgCD = (EDL029001Message) session.getAttribute("calcLoans");
		procReqPDF(user, req, res, msgCD);
	}

	private void procReqPDF(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, EDL029001Message msg)
			throws ServletException, IOException {

		ByteArrayOutputStream baosPDF = null;
		try {
			// Imprimir Comprobante de Simulacion
			baosPDF = generatePDFDocumentByte(user, req,
					this.getServletContext(), msg);

			StringBuffer sbFilename = new StringBuffer();
			String fn = com.datapro.generic.tool.Util.getTimestamp().toString();
			fn = Util.replace(fn, ":", "-");
			fn = Util.replace(fn, ".", "-");
			sbFilename.append(fn);
			sbFilename.append(".pdf");

			sendPdfResponse(res, baosPDF.toByteArray(), sbFilename.toString());

		} catch (DocumentException dex) {
			res.setContentType("text/html");
			PrintWriter writer = res.getWriter();
			writer.println(this.getClass().getName() + " caught an exception: "
					+ dex.getClass().getName() + "<br>");
			writer.println("<pre>");
			dex.printStackTrace(writer);
			writer.println("</pre>");
		} finally {
			if (baosPDF != null) {
				baosPDF.reset();
			}
		}

		return;
	}
	
	private Image getLogo() {
		try {
			URL url = getServletContext().getResource(JSEIBSProp.getProperty("eIBS.BankLogo"));
			return Image.getInstance(url);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	private PdfPTable getHeader() throws BadElementException {
		
		Font headerBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD);
		
		Paragraph HEADER_PAGE = new Paragraph("SIMULACION PRODUCTOS DE PLAZO", headerBoldFont);
		
		PdfPTable table = new PdfPTable(1);
		table.setSpacingAfter(rowSpacing);
		
		Image image = getLogo();
		image.setAlignment(Element.ALIGN_CENTER);
		image.scalePercent(25);
		
		PdfPCell cell = new PdfPCell(image); 
		cell.setVerticalAlignment(Element.ALIGN_TOP);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setBorder(Rectangle.NO_BORDER);
		table.addCell(cell);

		cell = new PdfPCell(HEADER_PAGE);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setVerticalAlignment(Element.ALIGN_CENTER);
		cell.setBorder(Rectangle.NO_BORDER);
		table.addCell(cell);
		
		return table;
	}
	
	private void setFooter(PdfWriter writer) throws BadElementException {
		
		class HeaderFooterPageEvent extends PdfPageEventHelper {

			public void onStartPage(PdfWriter writer, Document document) {
		        //ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_CENTER, new Phrase("Top Left"), 30, 800, 0);
		        //ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_CENTER, new Phrase("Top Right"), 550, 800, 0);
		    }
			
		    public void onEndPage(PdfWriter writer, Document document) {
		        ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_CENTER, new Phrase("Página " + document.getPageNumber()), 550, 30, 0);
		    }
		}
		
		HeaderFooterPageEvent event = new HeaderFooterPageEvent();
		writer.setPageEvent(event);
	}
	
	private String getDescriptionTerms(String term) {
		if ("D".equals(term)) {
			return "DIA(S)";
		} else if ("M".equals(term)) {
			return "MES(ES)";
		} else if ("Y".equals(term)) {
			return "AÑO(S)";
		} else {
			return "";
		}
	}
	
	private String getDescriptionInteres(String key) {
		if (key.length() > 0) {
			switch (key.charAt(0)) {
			case '1':
			case 'S':
				return "Al Vencimiento Calendario";
			case '2':
			case 'M':
				return "Al Vencimiento Comercial";
			case '3':
			case 'P':
				return "Prepagados Calendario";
			case '4':
			case 'A':
				return "Prepagados Comerciales";
			case '5':
			case 'D':
				return "Descontados Calendario";
			case '6':
			case 'T':
				return "Descontados Comerciales";
			case '7':
			case 'R':
				return "Capitalizados (CD's)";
			case '8':
			case 'C':
				return "Interes Compuesto";
			default:
				return "";
			}
		} else {
			return "";
		}
	}
	
	private PdfPTable getFixedText() throws BadElementException {
		
		Font normalBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD);			
		Paragraph BLANK = new Paragraph(" ", normalBoldFont);
		
		String text = "Los valores y tasas anteriormente estipulados se mantendrán hasta el fin de la Jornada Bancaria, " +
					"dado que dichos valores están sujetos a cambios por política del Banco.";
		
		Chunk chunck = new Chunk(text, normalBoldFont);
		Paragraph paragrah = new Paragraph(chunck);
		
		PdfPTable table = new PdfPTable(1);
		table.setSpacingAfter(rowSpacing);
		
		PdfPCell cell = new PdfPCell(paragrah); 
		cell.setVerticalAlignment(Element.ALIGN_TOP);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setBorder(Rectangle.NO_BORDER);
		table.addCell(cell);

		cell = new PdfPCell(BLANK); 
		cell.setVerticalAlignment(Element.ALIGN_TOP);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setBorder(Rectangle.NO_BORDER);
		table.addCell(cell);
		
		text = "En caso de constitución del depósito a terminos dentro del plazo anteriormente mencionado, la firma del cliente " +
			"constituye la aceptación de las condiciones reflejadas en este documento, y por ende, éstas no podrán ser modificadas " +
			"antes del vencimiento del plazo pactado del depósito a término.";
		
		chunck = new Chunk(text, normalBoldFont);
		paragrah = new Paragraph(chunck);
		
		cell = new PdfPCell(paragrah); 
		cell.setVerticalAlignment(Element.ALIGN_TOP);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setBorder(Rectangle.NO_BORDER);
		table.addCell(cell);

		cell = new PdfPCell(BLANK); 
		cell.setVerticalAlignment(Element.ALIGN_TOP);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setBorder(Rectangle.NO_BORDER);
		table.addCell(cell);
		
		paragrah = new Paragraph("FIRMA DEL CLIENTE _________________________________________________", normalBoldFont);
		
		cell = new PdfPCell(paragrah); 
		cell.setVerticalAlignment(Element.ALIGN_TOP);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setBorder(Rectangle.NO_BORDER);
		table.addCell(cell);

		cell = new PdfPCell(BLANK); 
		cell.setVerticalAlignment(Element.ALIGN_TOP);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setBorder(Rectangle.NO_BORDER);
		table.addCell(cell);
		
		paragrah = new Paragraph("DOCUMENTO DE IDENTIDAD No _______________________________________", normalBoldFont);
		
		cell = new PdfPCell(paragrah); 
		cell.setVerticalAlignment(Element.ALIGN_TOP);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setBorder(Rectangle.NO_BORDER);
		table.addCell(cell);

		cell = new PdfPCell(BLANK); 
		cell.setVerticalAlignment(Element.ALIGN_TOP);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setBorder(Rectangle.NO_BORDER);
		table.addCell(cell);
		
		return table;
	}

	private PdfPTable getCurrentDate(ESS0030DSMessage user) throws BadElementException {
		
		Font normalBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD);			
		Paragraph BLANK = new Paragraph(" ", normalBoldFont);
		
		String date = Util.formatCustomDate(user.getE01DTF(), 
						user.getBigDecimalE01RDM().intValue(), 
						user.getBigDecimalE01RDD().intValue(), 
						user.getBigDecimalE01RDY().intValue());
		String time = Util.formatTime(new Timestamp(System.currentTimeMillis()));
		
		Chunk chunck = new Chunk(date + " " + time, normalBoldFont);
		Paragraph paragrah = new Paragraph(chunck);
		
		PdfPTable table = new PdfPTable(1);
		table.setSpacingAfter(rowSpacing);
		
		PdfPCell cell = new PdfPCell(paragrah); 
		cell.setVerticalAlignment(Element.ALIGN_TOP);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setBorder(Rectangle.NO_BORDER);
		table.addCell(cell);

		cell = new PdfPCell(BLANK); 
		cell.setVerticalAlignment(Element.ALIGN_TOP);
		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		cell.setBorder(Rectangle.NO_BORDER);
		table.addCell(cell);
		
		return table;
	}
	
	private ByteArrayOutputStream generatePDFDocumentByte(ESS0030DSMessage user,
			HttpServletRequest req, ServletContext servletContext,
			EDL029001Message msg) throws DocumentException {

		Document doc = new Document(PageSize.LETTER, 6, 6, 36, 36); 

		ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
		PdfWriter docWriter = null;
		
			
		try {
			docWriter = PdfWriter.getInstance(doc, baosPDF);
			
			doc.addAuthor("eIBS");
			doc.addCreationDate();
			doc.addProducer();
			doc.addCreator(msg.getH01USERID());
			doc.addKeywords("pdf, itext, Java, open source, http");

			setFooter(docWriter);
			
			Font normalBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD);			
			
			Paragraph BLANK = new Paragraph(" ", normalBoldFont);
			
			PdfPTable header = getHeader();
			
			doc.open();

			doc.add(header);
			
			PdfPTable table = new PdfPTable(2);
			float[] columnWidths = {1f, 2f};
			table.setWidths(columnWidths);
			table.setSpacingAfter(rowSpacing);
			
			PdfPCell cell1 = new PdfPCell(BLANK);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			PdfPCell cell2 = new PdfPCell(BLANK);
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);

			Paragraph LABEL_2 = new Paragraph("PRODUCTO", normalBoldFont);
			cell1 = new PdfPCell(LABEL_2);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(new Paragraph(Util.formatCell(msg.getE01DEAPRO() + " / " + msg.getE01PRDDSC().trim()), normalBoldFont));
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			cell1 = new PdfPCell(BLANK);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(BLANK);
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			Paragraph LABEL_3 = new Paragraph("VALOR DEL CERTIFICADO", normalBoldFont);
			cell1 = new PdfPCell(LABEL_3);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(new Paragraph("$ " + Util.formatCCY(msg.getE01DEAPRI()), normalBoldFont));
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			cell1 = new PdfPCell(BLANK);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(BLANK);
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			Paragraph LABEL_4 = new Paragraph("PLAZO", normalBoldFont);
			cell1 = new PdfPCell(LABEL_4);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(new Paragraph(Util.formatCell(msg.getE01DEATRM() + " - " + getDescriptionTerms(msg.getE01DEATRC())), normalBoldFont));
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			cell1 = new PdfPCell(BLANK);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(BLANK);
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			Paragraph LABEL_5 = new Paragraph("FECHA DE VENCIMIENTO", normalBoldFont);
			cell1 = new PdfPCell(LABEL_5);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(new Paragraph(Util.formatDateFull("DMY", user.getE01LAN(), msg.getE01DEAMDD(), msg.getE01DEAMDM(), msg.getE01DEAMDY()), normalBoldFont));
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			cell1 = new PdfPCell(BLANK);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(BLANK);
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			Paragraph LABEL_6 = new Paragraph("INTERESES PAGADOS", normalBoldFont);
			cell1 = new PdfPCell(LABEL_6);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(new Paragraph(Util.formatCell(getDescriptionInteres(msg.getE01DEAICT())), normalBoldFont));
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			cell1 = new PdfPCell(BLANK);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(BLANK);
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			Paragraph LABEL_7 = new Paragraph("TASA EFECTIVA ANUAL", normalBoldFont);
			cell1 = new PdfPCell(LABEL_7);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(new Paragraph(Util.formatCell(msg.getE01APYRTE()) + " %", normalBoldFont));
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			cell1 = new PdfPCell(BLANK);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(BLANK);
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			Paragraph LABEL_8 = new Paragraph("TASA INTERES NOMINAL", normalBoldFont);
			cell1 = new PdfPCell(LABEL_8);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(new Paragraph(Util.formatCell(msg.getE01TOTRTE()) + " %", normalBoldFont));
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			cell1 = new PdfPCell(BLANK);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(BLANK);
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			Paragraph LABEL_10 = new Paragraph("INTERESES CALCULADO", normalBoldFont);
			cell1 = new PdfPCell(LABEL_10);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(new Paragraph("$ " + Util.formatCCY(msg.getE01DEAINT()), normalBoldFont));
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			cell1 = new PdfPCell(BLANK);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(BLANK);
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);

			Paragraph LABEL_11 = new Paragraph("RETENCION DE IMPUESTO", normalBoldFont);
			cell1 = new PdfPCell(LABEL_11);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(new Paragraph("$ " + Util.formatCCY(msg.getE01TOTHLD()), normalBoldFont));
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			cell1 = new PdfPCell(BLANK);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(BLANK);
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);

			Paragraph LABEL_12 = new Paragraph("INTERES A PAGAR", normalBoldFont);
			cell1 = new PdfPCell(LABEL_12);
			cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell1.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell1);
			cell2 = new PdfPCell(new Paragraph("$ " + Util.formatCCY(msg.getE01WRKAM1()), normalBoldFont));
			cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell2.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell2);
			
			doc.add(table);

			PdfPTable text = getFixedText();
			doc.add(text);
			
			PdfPTable date = getCurrentDate(user);
			doc.add(date);
			
			
		} catch (DocumentException dex) {
			baosPDF.reset();
			throw dex;
		} finally {
			if (doc != null) {
				doc.close();
			}
			if (docWriter != null) {
				docWriter.close();
			}
		}

		if (baosPDF.size() < 1) {
			throw new DocumentException("document has " + baosPDF.size()
					+ " bytes");
		}

		return baosPDF;
	}

	private void procReqCalcInt(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("", req);
			EDL029001Message msgCalc = (EDL029001Message) mp.getMessageRecord("EDL029001");
		 	msgCalc.setH01USERID(user.getH01USR());
		 	msgCalc.setH01PROGRM("EDL0290");
		 	msgCalc.setH01TIMSYS(getTimeStamp());
		 	msgCalc.setH01SCRCOD("01");
		 	msgCalc.setH01OPECOD("0002");
		 	msgCalc.setE01DEAACC(userPO.getAccNum());

			mp.sendMessage(msgCalc);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCalc = (EDL029001Message) mp.receiveMessageRecord("EDL029001");

			pageName = "EDL0290_ln_cal.jsp";
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("calcLoans", msgCalc);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionCalcInt(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0290", req);
			EDL029001Message msgCD = (EDL029001Message) session.getAttribute("calcLoans");
			msgCD.setH01USERID(user.getH01USR());
		 	msgCD.setH01PROGRM("EDL0290");
		 	msgCD.setH01TIMSYS(getTimeStamp());
		 	msgCD.setH01SCRCOD("01");
		 	msgCD.setH01OPECOD("0002");
		 	
		 	setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (EDL029001Message) mp.receiveMessageRecord("EDL029001");

			
			if (mp.hasError(msgError)) {
				pageName = "EDL0290_ln_cal.jsp";
			} else {
				userPO.setAccNum(msgCD.getE01DEAACC());
				pageName = "EDL0290_ln_cal.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("calcLoans", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqSimulacion(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setHeader9("S");
		if (req.getParameter("appcode") == null){
			userPO.setApplicationCode("11");
		}else{
			userPO.setApplicationCode(req.getParameter("appcode"));
		}
		EDL029001Message msg = new EDL029001Message();
		msg.setE01DEAODD(user.getE01RDD());
		msg.setE01DEAODM(user.getE01RDM());
		msg.setE01DEAODY(user.getE01RDY());
		//msg.setE01DEABAS("365");
		//msg.setE01DEAICT("S");
		
		session.setAttribute("userPO", userPO);
		session.setAttribute("calcLoans", msg);
		
		forward("EDL0290_cd_cal.jsp", req, res);
	}

	private void procActSimulacion(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0290", req);
			EDL029001Message msgCD = (EDL029001Message) session.getAttribute("calcLoans");
			msgCD.setH01USERID(user.getH01USR());
		 	msgCD.setH01PROGRM("EDL0290");
		 	msgCD.setH01TIMSYS(getTimeStamp());
		 	msgCD.setH01SCRCOD("01");
		 	msgCD.setH01OPECOD("0002");
		 	
		 	setMessageRecord(req, msgCD);
		 	msgCD.setH01FLGWK1("Y");

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (EDL029001Message) mp.receiveMessageRecord("EDL029001");

			
			if (mp.hasError(msgError)) {
				pageName = "EDL0290_cd_cal.jsp";
			} else {
				userPO.setAccNum(msgCD.getE01DEAACC());
				pageName = "EDL0290_cd_cal.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("calcLoans", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
}
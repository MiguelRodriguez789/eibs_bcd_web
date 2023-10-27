package datapro.eibs.ofac; 
/**
 * Denial List - General Inquiry 
 * Creation date: (02/05/12)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List by UID / NAME / IDENTIFICATION 
 *	// SCREEN =    3    Request detail record
 *  // SCREEN =    6    Print Screen in PDF
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

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

public class JSEDEN000 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 :
				procReqList(user, req, res, session, screen);
				break;
			case 3 : // Request detail Record
				procActionRec(user, req, res, session, screen);
				break;
			case 6 : // Print Screen in PDF
				procActionPDF(user, req, res, session); 
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1 
	// Send List   
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		String searchType = "";
		String searchCde = "";
		String searchCon = "";
		
		try {
			mp = new MessageProcessor("EDEN000");
			EDEN000DSMessage msg = (EDEN000DSMessage) mp.getMessageRecord("EDEN000DS");
			userPO = new datapro.eibs.beans.UserPos();
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDEN000");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("");
			msg.setH01OPECOD("0001");
			msg.setRWDUSR(user.getH01USR());
			userPO.setPurpose("INQUIRY");
			try {
				msg.setRWDFRC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setRWDFRC("0"); 
			}
			try {
				searchType = req.getParameter("SEARCHTYPE");
			} catch (Exception e) { }
			if (searchType == null) {
				searchType = "N";
			}
			msg.setRWDTYP(searchType);
			userPO.setType(msg.getRWDTYP());
			try {
				searchCde = req.getParameter("SEARCHCDE");
			} catch (Exception e) { }
			if (searchCde == null) {
				searchCde = " ";
			}
			msg.setRWDNAM(searchCde);
			userPO.setHeader11(msg.getRWDNAM());
			try {
				searchCon = req.getParameter("NROCON");
			} catch (Exception e) { }
			if (searchCon == null) {
				searchCon = "0";
			}
			msg.setRWDCON(searchCon);
			userPO.setHeader1(msg.getRWDCON());
			if (msg.getRWDTYP().equals("C")) {
				userPO.setCusNum(msg.getRWDNAM());
			} else {
				userPO.setCusNum("");
			}
			if (msg.getRWDTYP().equals("N") || msg.getRWDTYP().equals("S") || msg.getRWDTYP().equals("W")) {
				userPO.setCusName(msg.getRWDNAM());
			} else {
				userPO.setCusName("");
			}
			if (msg.getRWDTYP().equals("I")) {
				userPO.setIdentifier(msg.getRWDNAM());
			} else {
				userPO.setIdentifier("");
			}

			msg.setE01DCOUN("0");
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("SWDOPE","SWDREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EDEN000List", list);
			}
			forward("EDEN000_denial_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 3
	// Get detail Record  
	//
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EDEN000");
			EDEN000DSMessage msg = (EDEN000DSMessage) mp.getMessageRecord("EDEN000DS");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDEN000");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("");
			msg.setH01OPECOD("0001");
			msg.setRWDUSR(user.getH01USR());
			// Get key field
			try {
				msg.setE01DCOUN(req.getParameter("E01DCOUN"));
			} catch (Exception e) {
				msg.setE01DCOUN("0");
			}
			
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDEN000_denial_list.jsp", req, res);
			} else {
				// Receive Data
				ses.setAttribute("EDEN000Record", newmessage);
				forward("EDEN000_denial_detail.jsp", req, res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	//
	// Screen 6 - Print Results in PDF
	//
	protected void procActionPDF(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
			throws ServletException, IOException {

		ByteArrayOutputStream baosPDF = null;

		try {
			baosPDF = generatePDFDocumentBytes(req, this.getServletContext(), ses, false);

			StringBuffer sbFilename = new StringBuffer();
			String fn = com.datapro.generic.tool.Util.getTimestamp().toString();
			fn = Util.replace(fn,":","-");
			fn = Util.replace(fn,".","-");
			sbFilename.append(fn);
			sbFilename.append(".pdf");
			res.setHeader("Cache-Control", "s-maxage=0");
			res.setContentType("application/pdf");
			StringBuffer sbContentDispValue = new StringBuffer();
			sbContentDispValue.append("inline");
			sbContentDispValue.append("; filename=");
			sbContentDispValue.append(sbFilename);
			res.setHeader("Content-disposition", sbContentDispValue.toString());
			res.setContentLength(baosPDF.size());
			ServletOutputStream sos;
			sos = res.getOutputStream();
			baosPDF.writeTo(sos);
			sos.flush();
		} catch (DocumentException dex) {
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
			if (baosPDF != null) {
				baosPDF.reset();
			}
		}
		return;
	}

	protected ByteArrayOutputStream generatePDFDocumentBytes(final HttpServletRequest req,
			final ServletContext ctx, HttpSession session, boolean FLG) 
			throws DocumentException {

		ESS0030DSMessage msgUser = null;
		msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
		String LNG = msgUser.getE01LAN();

		EDEN000DSMessage msgSearch = null;
		JBObjList beanList = null;
		beanList = (JBObjList) session.getAttribute("EDEN000List");
		UserPos userPO = null;
		userPO = getUserPos(req);
					
		String title = "Lista de Control - Consulta General";
		String header01 = "Buscar : ";
		String header02 = "Tipo de Busqueda : ";
		String header03 = "Mínimo Coincidencias : (Solo para Sonido o Palabras): ";
			
		String detail01 = "Nombre";
		String detail02 = "Código";
		String detail03 = "Tipo e Identificación";

		String page = "Pagina No.";
		String name = "";
		try {
			name = userPO.getCusName();
		} catch (Exception e) {}
			String typ = "";
		try {
			if (userPO.getType().equals("N")) { 
				typ = "Ordenada Alfabéticamente por Nombre";
			} else if (userPO.getType().equals("C")) { 
				typ = "Ordenada por Código (UID)";	
			} else if (userPO.getType().equals("I")) { 
				typ = "Ordenada por Identificación";	
			} else if (userPO.getType().equals("W")) { 
				typ = "Filtrada por Palabras que coinciden en el Nombre";		
			} else if (userPO.getType().equals("S")) { 
				typ = "Filtrada por Palabras que suenan como otras en el Nombre";		
			} else { typ = "Alfabética";
			} 
		} catch (Exception e) {}
		
		String coinc = "";
		try {
			coinc = userPO.getHeader1();
		} catch (Exception e) {}

		Document doc = new Document(PageSize.A4, 36, 36, 36, 36);
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
			Font normalBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD);
			Font normalBoldUnderFont = FontFactory.getFont(FontFactory.HELVETICA,8,Font.BOLD | Font.UNDERLINE);
			Font headerFont = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL);
			Font headerBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD);
			Font headerBoldUnderFont = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD | Font.UNDERLINE);
			Paragraph TITLE = new Paragraph(title, headerBoldFont);
			Paragraph RAYA = new Paragraph(
				"____________________________________________________________________________________________________________________",
				normalBoldFont);
			Paragraph HEADER01 = new Paragraph(header01 + "  " + name, headerBoldFont);
			Paragraph HEADER02 = new Paragraph(header02 + "  " + typ, headerBoldFont);
			Paragraph HEADER03 = new Paragraph(header03 + "  " + coinc, headerBoldFont);
			Paragraph BLANK = new Paragraph("", headerBoldFont);
			Paragraph DETAIL1 = new Paragraph(detail01, headerBoldFont);
			Paragraph DETAIL2 = new Paragraph(detail02, headerBoldFont);
			Paragraph DETAIL3 = new Paragraph(detail03, headerBoldFont);
			HeaderFooter header = new HeaderFooter(TITLE, false);
			header.setBorder(Rectangle.NO_BORDER);
			header.setAlignment(Element.ALIGN_CENTER);
			doc.setHeader(header);

			HeaderFooter footer = new HeaderFooter(new Phrase(page), false);
			footer.setBorder(Rectangle.NO_BORDER);
			doc.setFooter(footer);
			doc.open();

			Table table = new Table(1, 3);
			table.setBorderWidth(0);
			table.setCellsFitPage(true);
			table.setPadding(1);
			table.setSpacing(1);
			table.setWidth(100);

			Cell cell = new Cell(HEADER01);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);

			cell = new Cell(HEADER02);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);

			cell = new Cell(HEADER03);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);

			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);

			doc.add(table);

			int NumColumns = 3;
			PdfPTable datatable = new PdfPTable(NumColumns);

			datatable.getDefaultCell().setPadding(3);
			int headerwidths[] = { 70, 10, 20}; // percentage
			datatable.setWidths(headerwidths);
			datatable.setWidthPercentage(100); // percentage

			datatable.getDefaultCell().setBorderWidth(1);
			datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.getDefaultCell().setGrayFill(0.9f);
			datatable.addCell(DETAIL1);
			datatable.addCell(DETAIL2);
			datatable.addCell(DETAIL3);

			datatable.setHeaderRows(1); // this is the end of the table header

			datatable.getDefaultCell().setBorderWidth(1);

			beanList.initRow();
			int i = 0;
			String dit1 = "";
			String dit2 = "";
			String dit3 = "";

			while (beanList.getNextRow()) {
				i++;
				if (i % 2 == 1) {
					datatable.getDefaultCell().setGrayFill(0.5f);
				} else {
					datatable.getDefaultCell().setGrayFill(0.9f);
				}

				msgSearch = new EDEN000DSMessage();
				msgSearch = (EDEN000DSMessage) beanList.getRecord();

				dit1 = msgSearch.getE01DNAME();
				dit2 = msgSearch.getE01DCOUN();
				dit3 = msgSearch.getE01DTID() + '-' + msgSearch.getE01DIDN();

				Paragraph DIT11 = new Paragraph(dit1, normalFont);
				Paragraph DIT21 = new Paragraph(dit2, normalFont);
				Paragraph DIT31 = new Paragraph(dit3, normalFont);

				datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
				datatable.addCell(DIT11);
				datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
				datatable.addCell(DIT21);
				datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
				datatable.addCell(DIT31);	
			}

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
			throw new DocumentException(
				"documento tiene " + baosPDF.size() + " bytes");
		}

		return baosPDF;
	}

}
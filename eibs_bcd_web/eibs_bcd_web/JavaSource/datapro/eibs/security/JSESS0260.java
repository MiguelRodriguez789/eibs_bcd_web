package datapro.eibs.security;

/**
 * Inquiry DB
 * Creation date: (03/22/12)
 * @author: Linet Riaño
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send screen for selection parameters
 *	// SCREEN =    2    Send List with results for inquiry
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

public class JSESS0260 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			//  
		case 1 : // Request Search Parameters 
			procReqSrhPrm(user, req, res, session);
			break;
		case 2 : // Send list with results for inquiry
		    procReqList(user, req, res, session, screen);
			break;  
		case 3 : // Send Source Document - Request old record
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
	// Send Screen for Search Parameters  
	//
	protected void procReqSrhPrm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("ENTER");
		ses.setAttribute("userPO", userPO);
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ESS0260");
			ESS026001Message msg = (ESS026001Message) mp.getMessageRecord("ESS026001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESS0260");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
	
			ses.setAttribute("msgList", msg);
			forwardOnSuccess("ESS0260_db_inquiry_search.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	// SCREEN = 2, 
	// Send List with Search Results  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		String searchType = "";
		String searchCde = "";
		
		try {
			mp = new MessageProcessor("ESS0260");
			ESS026001Message msg = (ESS026001Message) mp.getMessageRecord("ESS026001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESS0260");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			
		    msg.setH01OPECOD("0001");
			userPO.setPurpose("INQUIRY");
					
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			
			try {
				searchType = req.getParameter("SEARCHTYPE");
			} catch (Exception e) { }
			if (searchType == null) {
				searchType = "";
			}
			msg.setE01TYP(searchType);
			userPO.setType(msg.getE01TYP());
			try {
				searchCde = req.getParameter("SEARCHCDE");
			} catch (Exception e) { }
			if (searchCde == null) {
				searchCde = "";
			}
			msg.setE01CDE(searchCde);
			
			if (msg.getE01TYP().equals("N")) {
				userPO.setHeader22(msg.getE01CDE());
				msg.setE01REQFRM(msg.getE01CDE());
			} else {
				userPO.setHeader22("");
			}
			if (msg.getE01TYP().equals("U")) {
				userPO.setHeader21(msg.getE01CDE());
				msg.setE01REQFRM(msg.getE01CDE());
			} else {
				userPO.setHeader21("");
			}
			try {
				msg.setE01REQTYP(req.getParameter("E01REQTYP"));
			} catch (Exception e) { }
			if (msg.getE01REQTYP() == null) {
				msg.setE01REQTYP("12");
			}

			try {
				msg.setE01REQORD(req.getParameter("E01REQORD"));
			} catch (Exception e) { 
				msg.setE01REQORD("N");
			}
			
			try {
				msg.setE01REQFRM(req.getParameter("E01REQFRM"));
			} catch (Exception e) { 
				msg.setE01REQFRM("");
			}
						
			userPO.setHeader1(req.getParameter("E01REQTYP"));
			userPO.setHeader2(req.getParameter("E01REQORD"));
			userPO.setHeader3(req.getParameter("E01REQFRM"));
			userPO.setHeader4(req.getParameter("E01REQDFD"));
			userPO.setHeader5(req.getParameter("E01REQDFM"));
			userPO.setHeader6(req.getParameter("E01REQDFY"));
			userPO.setHeader7(req.getParameter("E01REQDTD"));
			userPO.setHeader8(req.getParameter("E01REQDTM"));
			userPO.setHeader9(req.getParameter("E01REQDTY"));
			
			msg.setE01REQDFD(req.getParameter("E01REQDFD"));
			msg.setE01REQDFM(req.getParameter("E01REQDFM"));
			msg.setE01REQDFY(req.getParameter("E01REQDFY"));
			msg.setE01REQDTD(req.getParameter("E01REQDTD"));
			msg.setE01REQDTM(req.getParameter("E01REQDTM"));
			msg.setE01REQDTY(req.getParameter("E01REQDTY"));
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("ESS0260List", list);
			}
			forward("ESS0260_db_inquiry_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	//	 SCREEN = 3
	// Get or Process Record  
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
			mp = new MessageProcessor("ESS0260");
			ESS026001Message msg = (ESS026001Message) mp.getMessageRecord("ESS026001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESS0260");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0003");
			
			msg.setE01REQTYP(userPO.getHeader1());
			msg.setE01REQORD(userPO.getHeader2());
			msg.setE01REQFRM(userPO.getHeader3());
			msg.setE01REQDFD(userPO.getHeader4());
			msg.setE01REQDFM(userPO.getHeader5());
			msg.setE01REQDFY(userPO.getHeader6());
			msg.setE01REQDTD(userPO.getHeader7());
			msg.setE01REQDTM(userPO.getHeader8());
			msg.setE01REQDTY(userPO.getHeader9());
			
			// Get key field
			try {
				msg.setE01MNPREF(req.getParameter("E01MNPREF"));
			} catch (Exception e) {
				msg.setE01MNPREF("0");
			}
			try {
				msg.setE01MNPSEC(req.getParameter("E01MNPSEC"));
			} catch (Exception e) {
				msg.setE01MNPSEC("1");
			}
			userPO.setIdentifier(msg.getE01MNPREF());
			userPO.setHeader21(msg.getE01MNPSEC());
			
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("ESS0260_db_inquiry_detail.jsp", req, res);				 
			} else {
				// Receive Data
				ses.setAttribute("ESS0260Record", newmessage);
				forwardOnSuccess("ESS0260_db_inquiry_detail.jsp", req, res);
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

		ESS026001Message msgSearch = null;
		JBObjList beanList = null;
		beanList = (JBObjList) session.getAttribute("ESS0260List");
		UserPos userPO = null;
		userPO = getUserPos(req);
					
		String title = "Consulta de Auditoria sobre operaciones en e-IBS";
		String header01 = "   ";
		String header02 = "   ";
		String header03 = "   ";
		String blancos = "     ";
			
		String detail01 = "Usuario";
		String detail02 = "Operación";
		String detail03 = "Fecha";
		String detail04 = "Referencia";

		String page = "Pagina No.";
		String name = "";
		try {
			name = userPO.getCusName();
		} catch (Exception e) {}
			String typ = "";
			String srhtyp = "";
		try {
			if (userPO.getType().equals("R")) { 
				typ = "Ordenada por Referencia";
			} else if (userPO.getType().equals("U")) { 
				typ = "Ordenada por Usuario";	
			} 
		} catch (Exception e) {}
		try {
			if (userPO.getHeader1().equals("Z")) { 
				srhtyp = "Perfiles usuario";
			} else if (userPO.getHeader1().equals("1")) { 
				srhtyp = "Clientes";	
			} else if (userPO.getHeader1().equals("2")) { 
				srhtyp = "Cuentas Detalle";	
			}
		} catch (Exception e) {}

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
			Paragraph HEADER03 = new Paragraph(header03 + "  " + srhtyp, headerBoldFont);
			
			Paragraph BLANK = new Paragraph("", headerBoldFont);
			Paragraph DETAIL1 = new Paragraph(detail01, headerBoldFont);
			Paragraph DETAIL2 = new Paragraph(detail02, headerBoldFont);
			Paragraph DETAIL3 = new Paragraph(detail03, headerBoldFont);
			Paragraph DETAIL4 = new Paragraph(detail04, headerBoldFont);
			HeaderFooter header = new HeaderFooter(TITLE, false);
			header.setBorder(Rectangle.NO_BORDER);
			header.setAlignment(Element.ALIGN_CENTER);
			doc.setHeader(header);

			HeaderFooter footer = new HeaderFooter(new Phrase(page), true);
			footer.setBorder(Rectangle.NO_BORDER);
			doc.setFooter(footer);
			doc.open();

			Table table = new Table(1, 4);
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

			int NumColumns = 4;
			PdfPTable datatable = new PdfPTable(NumColumns);

			datatable.getDefaultCell().setPadding(3);
			int headerwidths[] = { 40, 20, 20, 20}; // percentage
			datatable.setWidths(headerwidths);
			datatable.setWidthPercentage(100); // percentage

			datatable.getDefaultCell().setBorderWidth(1);
			datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			datatable.getDefaultCell().setGrayFill(0.9f);
			datatable.addCell(DETAIL1);
			datatable.addCell(DETAIL2);
			datatable.addCell(DETAIL3);
			datatable.addCell(DETAIL4);

			datatable.setHeaderRows(1); // this is the end of the table header

			datatable.getDefaultCell().setBorderWidth(1);

			beanList.initRow();
			int i = 0;
			String dit1 = "";
			String dit2 = "";
			String dit3 = "";
			String dit4 = "";

			while (beanList.getNextRow()) {
				i++;
				if (i % 2 == 1) {
					datatable.getDefaultCell().setGrayFill(0.0f);
				} else {
					datatable.getDefaultCell().setGrayFill(0.9f);
				}

				msgSearch = new ESS026001Message();
				msgSearch = (ESS026001Message) beanList.getRecord();

				dit1 = msgSearch.getE01MNPUSR()+ blancos + '-' + blancos + msgSearch.getD01MNPUSR();
				dit2 = msgSearch.getE01MNPUSA();
				dit3 = msgSearch.getE01MNPSDY() + '/' + msgSearch.getE01MNPSDM()+ '/' + msgSearch.getE01MNPSDD();
				dit4 = msgSearch.getE01MNPREF() + '-' + msgSearch.getE01MNPSEC();

				Paragraph DIT11 = new Paragraph(dit1, normalFont);
				Paragraph DIT21 = new Paragraph(dit2, normalFont);
				Paragraph DIT31 = new Paragraph(dit3, normalFont);
				Paragraph DIT41 = new Paragraph(dit4, normalFont);

				datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
				datatable.addCell(DIT11);
				datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
				datatable.addCell(DIT21);
				datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
				datatable.addCell(DIT31);	
				datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
				datatable.addCell(DIT41);
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
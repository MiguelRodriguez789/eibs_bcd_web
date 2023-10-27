package datapro.eibs.security;

/**
 * Biometric Log - Inquiry 
 * Creation date: (08/09/17)
 * @author: Carlos Castillo
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send screen for selection parameters
 *	// SCREEN =    2    Send List with results for inquiry
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

public class JSESS0265 extends JSEIBSServlet { 
	 
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
		userPO.setPurpose("INQUIRY");
		ses.setAttribute("userPO", userPO);
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		try {
			mp = new MessageProcessor("ESS0265");
			ESS026501Message msg = (ESS026501Message) mp.getMessageRecord("ESS026501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESS0265");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			msg.setH01SCRCOD("01");
			msg.setH01CUN(userPO.getCusNum());
			mp.sendMessage(msg);
			newmessage = mp.receiveMessageRecord();
			msg = (ESS026501Message) newmessage;
			ses.setAttribute("msgRecord", msg);
			forward("ESS0265_log_inquiry_search.jsp", req, res);
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
		
		try {
			mp = new MessageProcessor("ESS0265");
			ESS026501Message msg = (ESS026501Message) mp.getMessageRecord("ESS026501");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESS0265");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
		    msg.setH01OPECOD("0002");
		    msg.setH01CUN(userPO.getCusNum());
			userPO.setPurpose("INQUIRY");
			
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01REQTYP((req.getParameter("E01REQTYP") == null ? userPO.getHeader1() : req.getParameter("E01REQTYP")));
			msg.setE01REQORD((req.getParameter("E01REQORD") == null ? userPO.getHeader2() : req.getParameter("E01REQORD")));
			msg.setE01REQFRM((req.getParameter("E01REQFRM") == null ? userPO.getHeader3() : req.getParameter("E01REQFRM")));
			msg.setE01REQDFD((req.getParameter("E01REQDFD") == null ? userPO.getHeader4() : req.getParameter("E01REQDFD")));
			msg.setE01REQDFM((req.getParameter("E01REQDFM") == null ? userPO.getHeader5() : req.getParameter("E01REQDFM")));
			msg.setE01REQDFY((req.getParameter("E01REQDFY") == null ? userPO.getHeader6() : req.getParameter("E01REQDFY")));
			msg.setE01REQDTD((req.getParameter("E01REQDTD") == null ? userPO.getHeader7() : req.getParameter("E01REQDTD")));
			msg.setE01REQDTM((req.getParameter("E01REQDTM") == null ? userPO.getHeader8() : req.getParameter("E01REQDTM")));
			msg.setE01REQDTY((req.getParameter("E01REQDTY") == null ? userPO.getHeader9() : req.getParameter("E01REQDTY")));
			
			userPO.setHeader1(req.getParameter("E01REQTYP"));
			userPO.setHeader2(req.getParameter("E01REQORD"));
			userPO.setHeader3(req.getParameter("E01REQFRM"));
			userPO.setHeader4(req.getParameter("E01REQDFD"));
			userPO.setHeader5(req.getParameter("E01REQDFM"));
			userPO.setHeader6(req.getParameter("E01REQDFY"));
			userPO.setHeader7(req.getParameter("E01REQDTD"));
			userPO.setHeader8(req.getParameter("E01REQDTM"));
			userPO.setHeader9(req.getParameter("E01REQDTY"));
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
			forward("ESS0265_log_inquiry_list.jsp", req, res);
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

		ESS026501Message msgSearch = null;
		JBObjList beanList = null;
		beanList = (JBObjList) session.getAttribute("msgList");
		UserPos userPO = null;
		userPO = getUserPos(req);
					
		String title = "Consulta de Log de Biometria en e-IBS";
		String header01 = "   ";
		String header02 = "   ";
		String header03 = "   ";
		String blancos = "     ";
			
		String detail01 = "Usuario";
		String detail02 = "Cliente";
		String detail03 = "Fecha";
		String detail04 = "Resultado";

		String page = "Pagina No.";
		String name = "";
		try {
			name = userPO.getCusName();
		} catch (Exception e) {}
			String typ = "Por Cliente";
			String srhtyp = "";
		try {
			if (userPO.getHeader2().equals("U")) { 
				srhtyp = "Por Usuario";
			} else { 
				srhtyp = "Todas";	
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

				msgSearch = new ESS026501Message();
				msgSearch = (ESS026501Message) beanList.getRecord(); 

				dit1 = msgSearch.getE01CULMUS()+ blancos + '-' + blancos + msgSearch.getD01CULMUS();
				dit2 = msgSearch.getE01CULIDN();
				dit3 = msgSearch.getE01CULMTM();
				dit4 = msgSearch.getE01CULRMK();

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
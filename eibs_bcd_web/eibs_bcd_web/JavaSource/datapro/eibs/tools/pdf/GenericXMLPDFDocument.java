package datapro.eibs.tools.pdf;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.PdfWriter;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.sockets.MessageRecord;

/**
 *  Genera PDF desde Mensaje de Datos con Formato Generico
 */
public class GenericXMLPDFDocument extends XMLPDFDocument {

	public GenericXMLPDFDocument() throws IOException, DocumentException {
		super();
	}

	public GenericXMLPDFDocument(String ClassesRoot) throws IOException, DocumentException {
		super(ClassesRoot);
	}

	public void generate(HttpServletRequest req, HttpServletResponse res, 
		ESS0030DSMessage user, MessageRecord msgMT, 
		String sXMLfilename, String sprefixPDFname) 
		throws DocumentException, IOException {

		XMLPDFDocument XMLPDFdoc = null;
		JBObjList beanList = null;
		ByteArrayOutputStream baosPDF = null;

		try {

			try {
				// XMLPDFdoc = new XMLPDFDocument();
				XMLPDFdoc = (XMLPDFDocument) this;
				XMLPDFdoc.readXMLDoc(sXMLfilename);
			} catch (Exception ex) {
				System.err.println(ex.getMessage());
			}

			XMLPDFdoc.setPDFDocumentHeader();
			com.lowagie.text.Document doc = XMLPDFdoc.getPDFDoc();
			doc.addCreator("Datapro Inc.@2011");

			baosPDF = new ByteArrayOutputStream();
			PdfWriter docWriter = null;
			// PdfContentByte cb = null;
			// PdfPTable myTable = null;

			try {
				docWriter = PdfWriter.getInstance(doc, baosPDF);
				doc.open();
				XMLPDFdoc.setPDFcb(docWriter, beanList, user, msgMT);
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

			// return baosPDF;

			// baosPDF = generatePDFDocumentBytes(req, user, msgMT, beanList,
			// false);

			StringBuffer sbFilename = new StringBuffer();
			sbFilename.append(sprefixPDFname);
			sbFilename.append(System.currentTimeMillis());
			sbFilename.append(".pdf");

			StringBuffer sbContentDispValue = new StringBuffer();
			sbContentDispValue.append("inline");
			sbContentDispValue.append("; filename=");
			sbContentDispValue.append(sbFilename);

			res.setHeader("Content-disposition", sbContentDispValue.toString());
			res.setHeader("Cache-Control", "max-age=30");
			res.setContentType("application/pdf");
			res.setContentLength(baosPDF.size());

			ServletOutputStream sos;
			sos = res.getOutputStream();
			baosPDF.writeTo(sos);
			sos.flush();
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

	// addry:end Imprime Mensaje de Datos Formato Generico

}
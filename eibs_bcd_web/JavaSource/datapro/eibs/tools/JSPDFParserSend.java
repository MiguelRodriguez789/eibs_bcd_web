package datapro.eibs.tools;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.facade.FAReports;
import com.datapro.sql.SerialBlob;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0900DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.services.PDFTextParser;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

/**
 * Takes the PDF report file and parses it in a CSV file. Creation date:
 * (24/02/2010 06:32:32 PM)
 * 
 * @author: Catalina Sepulveda
 */
public class JSPDFParserSend extends JSEIBSServlet {
	
	private void setResponseHeader(HttpServletRequest req, HttpServletResponse res, String format) throws IOException {
		String fileName = req.getParameter("REPNAME");
		if (fileName == null || fileName.equals("")) {
			fileName = "temp." + format;
		} else if (!fileName.toLowerCase().endsWith(format)) {
			fileName = fileName + format;
		}
		super.setResponseHeader(res, fileName);
	}
	
	private InputStream getInputStream(HttpServletRequest req, HttpServletResponse res) throws ItemNotFoundException {
		try {
			InputStream input = null;
			String source = req.getParameter("source");
			if (source != null) {
				//Coming from User Spool
				input = getInputStreamForUserSpool(req);
			} else {
				String fileName = req.getParameter("REPNAME");
				URL url = new URL(JSEIBSProp.getEODPDFURL() + "/" + fileName);
				flexLog("About to read file " + url.toString());
				input = url.openStream();
			}
			return input;
		} catch (IOException e) {
			e.printStackTrace();
			throw new ItemNotFoundException();
		}
	}	
	
	private String getURLToUserTempReport(HttpServletRequest req, String textFile){
		String target = req.getRequestURL().toString();
		String absoluteURL = target.substring(0, 
			target.indexOf(req.getRequestURI().split("/")[2]));
		return absoluteURL + textFile;
	}
	
	protected void sendCSV(ESS0030DSMessage msgUser, HttpServletRequest req, HttpServletResponse res, InputStream in)
			throws java.io.IOException {
		ServletOutputStream out = (ServletOutputStream) res.getOutputStream();

		setResponseHeader(req, res, ".csv");
		PDFTextParser a = new PDFTextParser();
		a.pdfToCSV(in, out);
		out.flush();
	}
	
	private void sendExcelM(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, InputStream in)
			throws ServletException, IOException {

		ServletOutputStream out = (ServletOutputStream) res.getOutputStream();
		URL macroUrl = this.getServletContext().getResource("/reports/Macro.xlsm");
		if (macroUrl != null) {
			setResponseHeader(req, res, ".xlsm");
			
			InputStream macroIS = null;
			try {
				macroIS = macroUrl.openStream();
	
				PDFTextParser parser = new PDFTextParser();
				ByteArrayOutputStream buffer = new ByteArrayOutputStream();
				parser.pdfToTXT(in, buffer);
				
				ExcelUtils.writeData(out, macroIS, new ByteArrayInputStream(buffer.toByteArray()));
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new ServletException(e.getMessage());
			} finally {
				if (macroIS != null)
					macroIS.close();
			}
		}
	}
	
	protected void sendExcel(ESS0030DSMessage msgUser, HttpServletRequest req, HttpServletResponse res, InputStream in)
			throws java.io.IOException {
		ServletOutputStream out = (ServletOutputStream) res.getOutputStream();
		
		URL macroUrl = this.getServletContext().getResource("/reports/Macro.xls");
		if (macroUrl != null) {
			setResponseHeader(req, res, ".xls");
			
			InputStream macroIS = null;
			try {
				macroIS = macroUrl.openStream();
	
				String textFile = msgUser.getH01USR() + ".txt";
				//Creates a TXT file on a temporal directory
				PDFTextParser parser = new PDFTextParser();
				parser.pdfToTXT(in, req.getRealPath("reports")+"/"+textFile);
				
				ExcelUtils.writeData(out, macroUrl.openStream(), 0, 99, 26, 
						getURLToUserTempReport(req, "reports/"+textFile));
				
			} catch (Exception e) {
				e.printStackTrace();
				throw new IOException(e.getMessage());
			} finally {
				if (macroIS != null)
					macroIS.close();
			}
		} else {
			System.out.println("Template file doesn't exist : Macro.xls ");
		}
	}

	protected void sendPDF(ESS0030DSMessage msgUser, HttpServletRequest req, 
			HttpServletResponse response, InputStream in) throws java.io.IOException {
		
		String fileName = req.getParameter("REPNAME");
		if (fileName == null || fileName.equals("")) {
			//If we don't have the name can't know the report format
			throw new IOException("The Report Name must be provided");
		}
		setResponseHeader(response, fileName);

		ServletOutputStream out = (ServletOutputStream) response.getOutputStream();
		int size = 0;
		
		byte[] data = new byte[2048];
		BufferedInputStream bin = new BufferedInputStream(in);
		while ((size = bin.read(data, 0, data.length)) != -1) {
			out.write(data, 0, size);
		}
		response.setContentLength(size);
		out.flush();
	}
	
	private void copyMsgToMsg(MessageRecord source, MessageRecord target) {
		java.util.Enumeration enu = target.fieldEnumeration();
		MessageField field = null;
		String value = null;
		while (enu.hasMoreElements()) {
			field = (MessageField) enu.nextElement();
			try {
				value = source.getFieldString(field.getTag());
				if (value != null) {
					field.setString(value);
				}
			} catch (Exception e) {
			}
		}
	}

	/**
	 * getInputStreamForUserSpool
	 * @return
	 * @throws IOException 
	 */
	private InputStream getInputStreamForUserSpool(HttpServletRequest req) throws IOException {
		HttpSession session = req.getSession(false);

		FAReports reportsFa = new FAReports();
		EWD0900DSMessage msgList = null;
		JBObjList beanList = (JBObjList) session.getAttribute("EWD0900Help");
		try {
			int selectedRow = Integer.parseInt(req.getParameter("ROW"));
			beanList.setCurrentRow(selectedRow - 1);
			
			msgList = (EWD0900DSMessage) beanList.getRecord();
			
			String reportUser = msgList.getSWDSRD().endsWith("SOCKETS") ? msgList.getSWDNAM() : msgList.getSWDSRD();
			SerialBlob blob = reportsFa.getSerialBlob(msgList.getSWDFIL(), reportUser, msgList.getSWDNUM(),msgList.getBigDecimalSWDPLN());
			return blob.getBinaryStream();
		
		} catch (ItemNotFoundException e) {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("EWD0900", req);
				EWD0900DSMessage msgSend = new EWD0900DSMessage();
				copyMsgToMsg(msgList, msgSend);
				msgSend.setRWDTYP("I");
				mp.sendMessage(msgSend);
				
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				
				msgList = (EWD0900DSMessage) mp.receiveMessageRecord("EWD0900DS");
				if (mp.hasError(msgError)){
					throw new Exception("Error Generating Report..");
				}
				
				String reportUser = msgList.getSWDSRD().endsWith("SOCKETS") ? msgList.getSWDNAM() : msgList.getSWDSRD();
				SerialBlob blob = reportsFa.getSerialBlob(msgList.getSWDFIL(), reportUser, msgList.getSWDNUM(),msgList.getBigDecimalSWDPLN());
				return blob.getBinaryStream();
				
			} catch (Exception ex) {
				ex.printStackTrace();
				flexLog("Error: " + ex);
				throw new RuntimeException("Socket Communication Error");
			}finally {
				if (mp != null)	mp.close();
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
		
	}

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {

		session = (HttpSession) req.getSession(false);	
		ESS0030DSMessage msgUser = (ESS0030DSMessage)session.getAttribute("currUser");

		InputStream in = null;
		try {
			in = getInputStream(req, res);

			if ("pdf".equalsIgnoreCase(req.getParameter("FORMAT"))) {
				//This just means is not an Excel conversion, but it could be any format
				sendPDF(msgUser, req, res, in);
			} else {
				sendExcelM(msgUser, req, res, in);
			}
		
		} catch (Exception e) {
			flexLog("Exception ocurred. Exception = " + e);
			forward("MISC_no_result.jsp", req, res);
		} finally {
			if(in != null)
				in.close();
		}
	}

}
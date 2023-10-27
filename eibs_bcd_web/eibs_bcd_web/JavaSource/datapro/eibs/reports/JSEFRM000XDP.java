package datapro.eibs.reports;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.w3c.dom.Element;

import com.datapro.exception.DocumentException;
import com.datapro.output.PDFFormLoader;

import datapro.eibs.beans.EFRM00001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.tools.EIBSFormsParamsLoader;
import datapro.eibs.tools.xml.EibsFormsPdfInput;
import datapro.eibs.tools.xml.EibsFormsPdfOutput;

public class JSEFRM000XDP extends JSEFRM000PDF {
	
	protected static Map formsInputSchemas = new HashMap();
	
	public synchronized EibsFormsPdfInput initInputSchema(String language, String date, String module) throws DocumentException {
		try {
			EibsFormsPdfInput eformsInput = new EibsFormsPdfInput(getServletContext().getResourceAsStream("/tools/eIBSFormsFields.xsd"));
			eformsInput.setDateFormat(date);
			eformsInput.setLanguage(language);
			Map formsLanguages = (Map) formsInputSchemas.get(language);
			if (formsLanguages == null) {
				formsLanguages = new HashMap();
				formsInputSchemas.put(language, formsLanguages);
			}
			Map formsFormats = (Map) formsLanguages.get(language);
			if (formsFormats == null) {
				formsFormats = new HashMap();
				formsLanguages.put(language, formsFormats);
			}
			if (module == null) {
				formsFormats.put("ALL", eformsInput);
			} else{
				formsFormats.put(module, eformsInput);
			}
			return eformsInput;
		} catch (DocumentException e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public EibsFormsPdfInput getInputSchema(String language, String date, String module) throws DocumentException {
		Map formsLanguages = (Map) formsInputSchemas.get(language);
		if (formsLanguages == null) {
			return initInputSchema(language, date, module);
		} else {
			if (formsLanguages.get(date) == null) {
				return initInputSchema(language, date, module);	
			} else {
				Map formsFormats = (Map) formsLanguages.get(module);
				EibsFormsPdfInput eformsInput = ((EibsFormsPdfInput)formsFormats.get(
						module == null ? "ALL" : module));
				if (eformsInput == null) {
					return initInputSchema(language, date, module);
				}
				return eformsInput;				
			}
		}
	}
	
	

	protected void procReqFormList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFRM000", req);
			EFRM00001Message msgHeader = (EFRM00001Message) mp.getMessageRecord("EFRM00001");
			msgHeader.setH01USERID(user.getH01USR());
			msgHeader.setH01PROGRM("EFRM000");
			msgHeader.setH01TIMSYS(getTimeStamp());

			try {
				// nothing - Datapro Forms & B - Bankers Forms & P - Datapro PDF Forms
				msgHeader.setH01FLGWK1(req.getParameter("INTERFACE").trim());
			} catch (Exception ex) {
				msgHeader.setH01FLGWK1("P");
			}
			try {
				// 01 - Opening
				msgHeader.setE01SELFTY(req.getParameter("OPE_CODE").trim());
			} catch (Exception ex) {
			}

			String appCode = req.getParameter("APP_CODE") == null ? "" : req.getParameter("APP_CODE").trim();
			if (appCode.equalsIgnoreCase("XX")) {
				try {
					msgHeader.setH01OPECOD(req.getParameter("ACCOUNT").toUpperCase());
				} catch (Exception e) {
				}
			} else {
				msgHeader.setE01SELACD(appCode);
				try {
					msgHeader.setE01SELACC(req.getParameter("ACCOUNT").toUpperCase());
				} catch (Exception e) {
					if (appCode.equals("00")) {
						msgHeader.setE01SELACC(userPO.getCusNum());
					} else if (appCode.equals("PC")) {
						msgHeader.setE01SELACC(userPO.getIdentifier());
					} else {
						msgHeader.setE01SELACC(userPO.getAccNum());
					}
				}
				try {
					msgHeader.setH01OPECOD(Util.justifyRight(req.getParameter("SEQ"), 4));
				} catch (Exception e) {
				}
			}
			
			mp.sendMessage(msgHeader);
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			if (mp.hasError(newmessage)) {
				ELEERRMessage msgError = (ELEERRMessage) newmessage;
				String err = msgError.getERNU01() + " - " + msgError.getERDS01();
				session.setAttribute("error_msg", err);
				forward("EFRM000_pdf_forms_error.jsp", req, res);
			} else if (newmessage.getFormatName().equals("EFRM00001")) {
				JBObjList pdfList = new JBObjList();
				while (true) {
					msgHeader = (EFRM00001Message) newmessage;
					if (msgHeader.getE01MORFRM().equals("*")) {
						break;
					}else {
						pdfList.addRow(msgHeader);
					}
					newmessage = mp.receiveMessageRecord();
				}
				if (!pdfList.isEmpty()) {
					EibsFormsPdfOutput eformsOutput = new EibsFormsPdfOutput("eIBSPDFDataStructure");
					eformsOutput.setEncoding("ISO-8859-1");
					EIBSFormsParamsLoader formats = new EIBSFormsParamsLoader(getServletContext().getRealPath("/tools/"));
					
					if (!appCode.equalsIgnoreCase("XX")) {

						EibsFormsPdfInput eformsInput =	getInputSchema(userLanguage, user.getE01DTF(), null);
						
						newmessage = mp.receiveMessageRecord();
						Element tableParent = null;
						while (true) {
							String ddsName = newmessage.getFormatName();
							String elementName = null;
							if(ddsName.equals("EFRM40001") || ddsName.equals("EFRM40101")) { //Any CUMAD								
								elementName = getEntityName(newmessage);
							} else {
								elementName = formats.getFormatName(newmessage.getFormatName());
							}
							if (formats.isTableGroup(newmessage.getFormatName())) {
								if (tableParent == null || !tableParent.getTagName().equals(elementName + "Table")) {
									tableParent = eformsOutput.addXMLGroupAndChildElements(elementName + "Table", null);
								}
								eformsOutput.addXMLGroupAndChildElements(tableParent, elementName, eformsInput.getXSDElementList(newmessage));
							} else {
								eformsOutput.addXMLGroupAndChildElements(elementName, eformsInput.getXSDElementList(newmessage));
							}
							if (ddsName.equals("EFRM00001")) { // End
								break;
							}
							newmessage = mp.receiveMessageRecord();
						}
					}
					// Output the document, use standard formatter
					if (formActive) 
						session.setAttribute("pdfData", eformsOutput);
					flexLog("Putting java beans into the session");
					flexLog("XML:" + eformsOutput);
					session.setAttribute("pdfList", pdfList);
					
					userPO.setRedirect(req.getContextPath() + "/servlet/datapro.eibs.reports.JSEFRM000XDP");
					session.setAttribute("userPO", userPO);
					
					forward("EFRM000_forms_pdf_list.jsp", req, res);
				} else {
					flexLog("Putting java beans into the session");
					String err = "No existen Formularios Asociados.";
					session.setAttribute("error_msg", err);
					forward("EFRM000_pdf_forms_error.jsp", req, res);
				}
			}
			
		} catch (DocumentException e) {
			throw new ServletException(e);
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	protected void procReqForm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws ServletException, IOException {

		InputStream templateStream = null;
		ServletOutputStream out = (ServletOutputStream) res.getOutputStream();
		try {
			int row = Util.parseInt(req.getParameter("ROW"));
			
			JBObjList pdfList = (JBObjList) session.getAttribute("pdfList");
			pdfList.initRow();
			pdfList.setCurrentRow(row);
			EFRM00001Message msgHeader = (EFRM00001Message) pdfList.getRecord();
			String path = msgHeader.getE01APFPTH().trim();
			
			setResponseHeader(res, path);
			
			EibsFormsPdfOutput eformsOutput = (EibsFormsPdfOutput) session.getAttribute("pdfData");
			
			if (JSEIBSProp.getFtpFormHost().equals("") 
				|| JSEIBSProp.getFtpFormHost().equals("localhost")) {
				File dir = new File(JSEIBSProp.getFtpPathFormConfig());
				if (dir.exists()) {
					templateStream = new FileInputStream(new File(dir, path));
				} else {
					throw new RuntimeException("No existe la configuración del repositorio de formularios");
				}
			} else {
				URL url = new URL("ftp://" + JSEIBSProp.getFtpFormUserID() + ":" + JSEIBSProp.getFtpFormPassword() + "@"
						+ JSEIBSProp.getFtpFormHost() + ":" + JSEIBSProp.getFtpFormPort() 
						+ "/" + JSEIBSProp.getFtpPathFormConfig() + path + ";type=i");
				
				URLConnection con = null;
				if ("sftp".equals(url.getProtocol()) || "https".equals(url.getProtocol())) {
					//con = DataproConnectionFactory.openSSLDummy(url);
				} else {
					con = url.openConnection();
				}
				templateStream = con.getInputStream();
			}
			new PDFFormLoader().load(
				new ByteArrayInputStream(
					eformsOutput.toString().getBytes()),
				templateStream,
				out,
				PDFFormLoader.OUTPUT_FORMAT_XML);
			out.close();
		
		} catch (Exception e) {
			e.printStackTrace();
			res.setContentType("text/html");
			out.println("<HTML>");
			out.println("<HEAD>");
			out.println("<TITLE>Close</TITLE>");
			out.println("</HEAD>");
			out.println("<BODY>");
			out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
			out.println("		top.close();");
			out.println("</SCRIPT>");
			out.println("<P>Close it!!!</P>");
			out.println("</BODY>");
			out.println("</HTML>");
		} finally {
			try {
				if(templateStream != null) templateStream.close();		
			} catch (Exception e1) {
			}
		}
	}

}

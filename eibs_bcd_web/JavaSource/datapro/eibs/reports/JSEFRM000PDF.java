package datapro.eibs.reports;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adobe.fdf.FDFDoc;

import datapro.eibs.beans.EFRM00001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EOF011501Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0120DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.generic.JODOM;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEFRM000PDF extends JSEFRM000 {

	protected static final int R_FORM_LIST 		= 1;
	protected static final int R_OFFICIAL_CHECK = 2;
	protected static final int R_FORM 			= 3;
	protected static final int R_APPLICATION 	= 5;
	
	protected static JODOM dstXML = null;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		initDataStructure();
	}

	public synchronized void initDataStructure() {
		if (dstXML == null || dstXML.isEmpty()) {
			dstXML = (JODOM) new JODOM(getServletContext().getResourceAsStream("/tools/eIBSForms_DST.xml"));
		}
	}
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		LangPath = getLangPath(user);
		userLanguage = user.getE01LAN().equals("s") ? "es" : "en";
		ftmEibs = user.getE01DTF();   
		
		switch (screen) {
			case R_FORM_LIST :
				procReqFormList(user, req, res, session);
				break;
			case R_OFFICIAL_CHECK :
				procReqOfficialCheck(user, req, res, session);
				break;
			case R_FORM :
				procReqForm(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	public void addDataNode(
			Object obj,
			String name,
			String dataItem) {

			String xmlCode = null;
			try {
				FDFDoc outputFDF = (FDFDoc) obj;
				if (!(dataItem.trim().equals("")
					|| dataItem.trim().equalsIgnoreCase("&nbsp;"))) {
					boolean isOK = true;
					java.math.BigDecimal dataNum;
					try {
						dataNum = new java.math.BigDecimal(dataItem);
						if (dataNum.compareTo(new java.math.BigDecimal("0")) == 0)
							isOK = false;
						else
							isOK = true;
					} catch (Exception ex) {
						isOK = true;
					}
					if (isOK && dstXML != null) {
						xmlCode = dstXML.getElementCode(name);
						outputFDF.SetValue(xmlCode, dataItem);
					}
				}
			} catch (Exception e) {
				flexLog("JSEFRM000PDF.addDataNode " + e.getMessage()
						+" name: " + name + ", field: " + xmlCode + ", value: " + dataItem);
			}

		}
	
	protected void procReqForm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws ServletException, IOException {
		
		String urlPDF = datapro.eibs.master.JSEIBSProp.getFORMPDFURL() + req.getParameter("pdfName");

		FDFDoc outputFDF = (FDFDoc) session.getAttribute("pdfData");
		
		sendPdf(
			req, 
			res, 
			urlPDF, 
			outputFDF, 
			req.getParameter("action"),
			req.getParameter("copies"),
			req.getParameter("printerName"));
	}

	protected void procReqOfficialCheck(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgHeader = (EOF011501Message) mp.getMessageRecord("EOF011501", user.getH01USR(), "0002"); 
			msgHeader.setH01FLGWK1("P");
			
			String check = req.getParameter("E01OFMCKN") == null ? "0" : req.getParameter("E01OFMCKN");
			msgHeader.setE01OFMCKN(check);
			
			String currency = req.getParameter("E01OFMCCY") == null ? "0" : req.getParameter("E01OFMCCY");
			msgHeader.setE01OFMCCY(currency);
			
			mp.sendMessage(msgHeader);
			
		 	JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
		 	
		 	ELEERRMessage msgError = null;
		 	
		 	if (mp.hasError(list)) {
		 		msgError = (ELEERRMessage) mp.getError(list);
				String error = msgError.getERNU01() + " - " + msgError.getERDS01();
				session.setAttribute("error_msg", error);
				forward("EFRM000_pdf_forms_error.jsp", req, res);
		 	} else {
		 		FDFDoc data = new FDFDoc();
				initDataStructure();
				// Add General Information like User ID....
				getFormData(data, (String)formatNames.get("ESS0030DS") + ".", user);
				
				list.getNextRow();
				msgHeader = (EOF011501Message) list.getRecord(); 
				//Header
				addDataNode(data, "OfficialCheck.CheckNumber", msgHeader.getE01OFMCKN());
				addDataNode(data, "OfficialCheck.Date", Util.formatDateFull(user.getE01DTF(),user.getE01LAN(),msgHeader.getE01OFMEMM(),msgHeader.getE01OFMEMD(),msgHeader.getE01OFMEMY()));
				addDataNode(data, "OfficialCheck.Amount", Util.addLeftChar('*',15,Util.fcolorCCY(msgHeader.getE01OFMAMT())));
				addDataNode(data, "OfficialCheck.Beneficiary1", msgHeader.getE01OFMBNF());
				addDataNode(data, "OfficialCheck.Beneficiary2", msgHeader.getE01OFMBN1());
				addDataNode(data, "OfficialCheck.AmountText", msgHeader.getE01LETAMT());
				addDataNode(data, "OfficialCheck.Concept1", msgHeader.getE01OFMCO1());
				addDataNode(data, "OfficialCheck.Concept2", msgHeader.getE01OFMCO2());
				addDataNode(data, "OfficialCheck.Concept3", msgHeader.getE01OFMCO3());
				addDataNode(data, "OfficialCheck.Applicant1", msgHeader.getE01OFMAPL());
				addDataNode(data, "OfficialCheck.Applicant2", msgHeader.getE01OFMAP1());
				addDataNode(data, "OfficialCheck.Address1", msgHeader.getE01OFMAD1());
				addDataNode(data, "OfficialCheck.Address2", msgHeader.getE01OFMAD2());
				addDataNode(data, "OfficialCheck.Address1", msgHeader.getE01OFMAD3());
				
				int pos = 0;
				while (list.getNextRow()) {
					MessageRecord msg = (MessageRecord) list.getRecord();
					String ddsName = msg.getFormatName();
					if (ddsName.equals("EWD0120DS")) { // Official Check Transactions
						EWD0120DSMessage msgTr = (EWD0120DSMessage)msg;
						getTRDataForDataproForms(data, msgTr, ++pos);
					}
				}
				String urlPDF = datapro.eibs.master.JSEIBSProp.getFORMPDFURL() + msgHeader.getE01OFMPTH().trim();
				sendPdf(req, res, urlPDF, data, "1", "1", "");
		 	}
		} finally {
			if (mp != null)	mp.close();
		}
	}
		 	
	protected void procReqFormList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		
		String appCode = req.getParameter("APP_CODE") == null ? "" : req.getParameter("APP_CODE");
		userPO.setOption(req.getParameter("APP_CODE")) ;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFRM000", req);
			EFRM00001Message msgHeader = (EFRM00001Message) mp.getMessageRecord("EFRM00001");
			msgHeader.setH01USERID(user.getH01USR());
			msgHeader.setH01PROGRM("EFRM000");
			msgHeader.setH01TIMSYS(getTimeStamp());
			msgHeader.setH01FLGWK1(req.getParameter("INTERFACE") == null ? "P" : req.getParameter("INTERFACE"));
			msgHeader.setE01SELFTY(req.getParameter("OPE_CODE") == null ? "" : req.getParameter("OPE_CODE"));
			
			if (appCode.equalsIgnoreCase("XX")) {
				msgHeader.setH01OPECOD(req.getParameter("ACCOUNT") == null ? "" : req.getParameter("ACCOUNT").toUpperCase());
			} else {
				msgHeader.setE01SELACD(appCode);
				try {
					msgHeader.setE01SELACC(req.getParameter("ACCOUNT"));
				} catch (Exception e) {
					if (appCode.equals("00")) {
						msgHeader.setE01SELACC(userPO.getCusNum());
					} else {
						if (appCode.equals("PC")) {
							msgHeader.setE01SELACC(userPO.getIdentifier());
						} else {
							msgHeader.setE01SELACC(userPO.getAccNum());
						}
					}
				}
				msgHeader.setH01OPECOD(req.getParameter("SEQ") == null ? "" : Util.justifyRight(req.getParameter("SEQ"), 4));
			}
			
			mp.sendMessage(msgHeader);
			
			JBObjList list = mp.receiveMessageRecordList("E01MORFRM");
			
		 	ELEERRMessage msgError = null;
		 	
		 	if (mp.hasError(list)) {
		 		msgError = (ELEERRMessage) mp.getError(list);
				String error = msgError.getERNU01() + " - " + msgError.getERDS01();
				session.setAttribute("error_msg", error);
				forward("EFRM000_pdf_forms_error.jsp", req, res);
		 	} else {
				if (!list.isEmpty()) {
					FDFDoc outputFDF = new FDFDoc();
					if (session.getAttribute("pdfData") != null) {
						session.removeAttribute("pdfData");
					}
					if (dstXML == null || dstXML.isEmpty()) {
						initDataStructure();			
						flexLog("XML file was reloaded.");
					}
					
					// Add General Information like User ID....
					getFormData(outputFDF, (String)formatNames.get("ESS0030DS") + ".", user);
					if (!appCode.equalsIgnoreCase("XX")) {
						MessageRecord newmessage = mp.receiveMessageRecord();
                        int index = 0;
                        String prefix = "";
                        String ddsName = newmessage.getFormatName();
						while (true) {
							if (!ddsName.equals(newmessage.getFormatName())
								|| !prefix.equals(getPrefix(newmessage))) {
								index = (hasIndex(newmessage.getFormatName())) ? 1 : 0;
							}
							prefix = getPrefix(newmessage);
	                    	ddsName = newmessage.getFormatName();
	                        if(ddsName.equals("EFRM00001"))
	                            break;
	                        else                             	
	                    		buildFormList(outputFDF, newmessage, "." + prefix, index++);
	                        newmessage = mp.receiveMessageRecord();
						}
					}
					if (list.getLastRec() == 0) {
						msgHeader = (EFRM00001Message) list.get(0);
						String urlPDF = datapro.eibs.master.JSEIBSProp.getFORMPDFURL() + msgHeader.getE01APFPTH();
						sendPdf(
							req, 
							res, 
							urlPDF, 
							outputFDF, 
							msgHeader.getE01APFOPE(), 
							msgHeader.getE01APFCPI(), 
							msgHeader.getE01APFDDS());
					} else {
						flexLog("Putting java beans into the session");
						session.setAttribute("pdfData", outputFDF);							
						session.setAttribute("pdfList", list);
						
						userPO.setRedirect(req.getContextPath() + "/servlet/datapro.eibs.reports.JSEFRM000PDF");
						session.setAttribute("userPO", userPO);
						
						res.setContentType("text/html");
						PrintWriter out = res.getWriter();
						String href = req.getContextPath() + "/pages/s/MISC_search_wait.jsp?URL='" + req.getContextPath() + LangPath + "EFRM000_pdf_list.jsp'";
						out.println("<HTML>");
						out.println("<HEAD>");
						out.println("<TITLE>PDF</TITLE>");
						out.println("</HEAD>");
						out.println("<BODY>");
						out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
						out.println("		top.opener.location.href = \""+ href + "\";");
						out.println("		top.close();");
						out.println("</SCRIPT>");
						out.println("<P>PDF</P>");
						out.println("</BODY>");
						out.println("</HTML>");
					}
				} else {
					session.setAttribute("error_msg", "");
					forward("EFRM000_pdf_forms_error.jsp", req, res);
				}
		 	}
		 	
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void sendPdf(
			HttpServletRequest req,
			HttpServletResponse res,
			String urlPDF,
			Object pdfData,
			String operation,
			String copies,
			String printerName) 
			throws ServletException, IOException {

			try {
				//FDFDoc outputFDF = (FDFDoc) pdfData;
				FDFDoc outputFDF = new FDFDoc(((FDFDoc)pdfData).Save());
					
				outputFDF.SetFile(urlPDF+"?time="+getTimeStamp());
				
				int action = 0;
				try {
					action = Integer.parseInt(operation);
				} catch (Exception e) {
				}
				String recallPage = 
					req.getRequestURL().substring(0, req.getRequestURL().toString()
						.indexOf(req.getServletPath())) + "/pages/close.html";
				switch (action) {
					case 3: 
						//Prepare
						break;
					case 2:
						//Print
						outputFDF.AddDocJavaScript(
							"onLoadPrint", 
							"function onLoadPrint(){" +
							"	var pp = this.getPrintParams();" +
							"	pp.NumCopies = " + copies + ";" +
							"	pp.interactive = pp.constants.interactionLevel.silent;" +
							(printerName == null ? "" : "	pp.printerName = \"" + printerName + "\";") +
							"	this.print(pp);" +
							//"	this.print({bUI: false, bSilent: true});" +
							"	this.resetForm();" +
							"	this.getURL(\"" + recallPage + "\");" +
							//"	this.setAction(\"DidPrint\", this.getURL(\"" + recallPage + "\"));" +
							"}");
						outputFDF.SetOnImportJavaScript("this.onLoadPrint();", false);
						break;
					case 1:
					default:
						//Preview
						//outputFDF.SetOnImportJavaScript("this.setAction(\"DidPrint\", this.getURL(\""  + recallPage + "\"));", false);
				}
				
				// outputFDF.SetTargetFrame("pdf");
				/*
					Next we'll do three things:

					1)  Set everything up to emit the correct HTTP header for the MIME type. In
						the case with FDF, the MIME needs to be set to "application/vnd.fdf".
					2)	Obtain the OutputStream to which FDF data will be written
					3)	Write the FDF data to the OutputStream
				*/

				// 1
				res.setContentType("application/vnd.fdf");
				// 2
				OutputStream out = res.getOutputStream();
				// 3
				outputFDF.Save(out);
				out.close();

			} catch(Exception e) {
				flexLog("Exception: " + e.getClass().getName() +  " --> Cause: " + e.getMessage());
				throw new RuntimeException("Socket Communication Error");
			}
		}
		
	
}

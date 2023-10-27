package datapro.eibs.reports;

/**
 * Insert the type's description here.
 * Creation date: (8/28/2000 4:02:17 PM)
 * @author: Orestes Garcia
**/

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.w3c.dom.Element;

import datapro.eibs.beans.EFRM00001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.tools.EIBSFormsParamsLoader;
import datapro.eibs.tools.xml.EibsFormsPdfInput;
import datapro.eibs.tools.xml.EibsFormsPdfOutput;

public class JSEFRM000XSN extends JSEIBSServlet {

	static final int R_FORM_LIST = 1;
	static final int R_FORM = 3;
	static final int R_APPLICATION = 5;
	
	private String LangPath = "S";
	private String userLanguage;

	/**
	 * JSReportManager constructor comment.
	 */
	public JSEFRM000XSN() {
		super();
	}
	
	/**
	 * service method comment.
	 */
	public void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse response, HttpSession session, int screen) throws javax.servlet.ServletException, java.io.IOException{
		switch (screen) {
			case R_FORM_LIST :
				procReqFormList(user, req, response, session);
				break;
			case R_FORM :
				procReqForm(req, response, session);
				break;
			default :
				response.sendRedirect(super.srctx + LangPath + super.devPage);
				break;
		}
	}
	
	/**
	 * Insert the method's description here.
	 * Creation date: (9/25/2000 11:17:32 AM)
	 */
	private void procReqFormList(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EFRM00001Message msgHeader = null;
		ELEERRMessage msgError = null;
		String appCode = null;
		
		UserPos userPO = (UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EFRM000", req);
			msgHeader = (EFRM00001Message) mp.getMessageRecord("EFRM00001");
			msgHeader.setH01USERID(user.getH01USR());
			msgHeader.setH01PROGRM("EFRM000");
			msgHeader.setH01TIMSYS(getTimeStamp());

			try {
				// nothing - Datapro Forms & B - Bankers Forms & P - Datapro PDF Forms
				msgHeader.setH01FLGWK1(req.getParameter("INTERFACE"));
			} catch (Exception ex) {
				//msgHeader.setH01FLGWK1("");
				msgHeader.setH01FLGWK1("P");
			}
			try {
				// 01 - Opening
				msgHeader.setE01SELFTY(req.getParameter("OPE_CODE"));
			} catch (Exception ex) {
			}

			try {
				appCode = req.getParameter("APP_CODE");
				if (appCode == null)
					appCode = "";
			} catch (Exception e) {
				appCode = "";
			}

			if (appCode.equalsIgnoreCase("XX")) {
				try {
					msgHeader.setH01OPECOD(req.getParameter("ACCOUNT").toUpperCase());
				} catch (Exception e) {
				}
			} else {
				msgHeader.setE01SELACD(appCode);
				try {
					msgHeader.setE01SELACC(req.getParameter("ACCOUNT"));
				} catch (Exception e) {
					if (appCode.equals("00")) {
						msgHeader.setE01SELACC(userPO.getCusNum());
					} else {
						msgHeader.setE01SELACC(userPO.getIdentifier());
					}
				}
				try {
					msgHeader.setH01OPECOD(Util.justifyRight(req.getParameter("SEQ"), 4));
				} catch (Exception e) {
				}
			}

			mp.sendMessage(msgHeader);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {

			newmessage = mp.receiveMessageRecord();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;

				flexLog("Putting java beans into the session");
				String err = msgError.getERNU01() + " - " + msgError.getERDS01();
				ses.setAttribute("error_msg", err);

				try {
					flexLog("About to call Page: " + LangPath + "EFRM000_forms_req_error.jsp");
					forward("EFRM000_forms_req_error.jsp", req, res);

				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else if (newmessage.getFormatName().equals("EFRM00001")) {
				boolean nothing = true;
				JBObjList pdfList = new JBObjList();

				while (true) {
					msgHeader = (EFRM00001Message) newmessage;
					if (msgHeader.getE01MORFRM().equals("*"))
						break;
					else {
						if (nothing) nothing = false;
						pdfList.addRow(msgHeader);
					}
					newmessage = mp.receiveMessageRecord();
				}

				if (!nothing) {
					EibsFormsPdfOutput eformsOutput =
						new EibsFormsPdfOutput("eIBSPDFDataStructure");
					EIBSFormsParamsLoader formats = new EIBSFormsParamsLoader();

					if (!appCode.equalsIgnoreCase("XX")) {
						EibsFormsPdfInput eformsInput =
							new EibsFormsPdfInput(
									new URL(JSEIBSProp.getFORMPDFURL()+"eIBSFormsFields.xsd")
										.openStream());
						eformsInput.setDateFormat(user.getE01DTF());
						eformsInput.setLanguage(userLanguage);

						// Receive Data
						newmessage = mp.receiveMessageRecord();
						Element tableParent = null;
						while (true) {
							String ddsName = newmessage.getFormatName();
							String formatsDesc =  formats.getFormatName(newmessage.getFormatName());
							if (ddsName.equals("EFRM00001")) { // End
								break;
							/*} else if(ddsName.equals("EFRM00073")){
								EFRM00073Message msg = (EFRM00073Message) newmessage;
								String elementName = "";
								switch (Integer.parseInt(msg.getE04RTP())) {
									case 2 : 
										elementName = "StockHolder";
										break;
									case 3 : 
										elementName = "Board";
										break;
									case 4 : 
										elementName = "Beneficiary";
										break;
									case 5 : 
										elementName = "LegalRep";
										break;
									case 6 : 
										elementName = "BankRef";
										break;
									case 7 :
										elementName = "CommercialRef";
										break;
									case 8 : 
										elementName = "PersonalRef";
										break;
									default: 
										elementName = "";
								}
								eformsOutput.addXMLGroupAndChildElements(formats.getFormatName(newmessage.getFormatName()),
										eformsInput.getElementList(newmessage, elementName));*/
							} else {
								if (formats.isTableGroup(newmessage.getFormatName())){
									if (tableParent == null || !tableParent.getTagName().equals(formatsDesc+"Table")){
										tableParent = eformsOutput.addXMLGroupAndChildElements(formatsDesc+"Table", null);
									}
									eformsOutput.addXMLGroupAndChildElements(tableParent, formatsDesc, eformsInput.getXSDElementList(newmessage));
								} else {
									eformsOutput.addXMLGroupAndChildElements(formatsDesc, eformsInput.getXSDElementList(newmessage));
								}
							}
							newmessage = mp.receiveMessageRecord();

						}
					}
					
					// Output the document, use standard formatter
					try {
						if (super.formActive) 
							ses.setAttribute("infoPathData", eformsOutput);
						flexLog("Putting java beans into the session");
						ses.setAttribute("pdfList", pdfList);

						try {
							flexLog("About to call Page: " + LangPath + "EFRM000_forms_infopath_list.jsp");
							forward("EFRM000_forms_infopath_list.jsp", req, res);

						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}

					} catch (Exception e) {
						flexLog("Error: " + e);
					}
				} else {
					flexLog("Putting java beans into the session");
					String err = "";
					ses.setAttribute("error_msg", err);
					try {
						flexLog("About to call Page: " + LangPath + "EFRM000_forms_req_error.jsp");
						forward("EFRM000_forms_req_error.jsp", req, res);

					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
					// }
				}

			} else {
				flexLog("Message " + newmessage.getFormatName() + " received.");
			}

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}


	private void procReqForm(
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses) 
		throws ServletException, IOException {

		ServletOutputStream out =
			(ServletOutputStream) res.getOutputStream();

		// Output the document
		try {
			String urlInfoPath = datapro.eibs.master.JSEIBSProp.getFORMPDFURL() + req.getParameter("pdfName");
			
			EibsFormsPdfOutput eformsOutput = (EibsFormsPdfOutput)ses.getAttribute("infoPathData");
			
			eformsOutput.addProcessingInstructions("mso-infoPathSolution", "solutionVersion=\"1.0.0.6\" " +
					"productVersion=\"12.0.0\" PIVersion=\"1.0.0.0\" " +
					"href=\""+urlInfoPath+"\" " +
					"name=\"urn:schemas-microsoft-com:office:infopath:firstTemplate:\" " );
			eformsOutput.addProcessingInstructions("mso-application", "progid=\"InfoPath.Document\" versionProgid=\"InfoPath.Document.2\" ");

			res.setContentType("application/pdf");
			InputStream fis = new ByteArrayInputStream(eformsOutput.toString().getBytes());
			sendResponse(res, fis, eformsOutput.toString().getBytes().length, "data.infopathXml");			
		
		} catch (Exception e) {
			flexLog("Error: " + e);
			
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
			if (out != null)	
				out.close();
		}
	}

}
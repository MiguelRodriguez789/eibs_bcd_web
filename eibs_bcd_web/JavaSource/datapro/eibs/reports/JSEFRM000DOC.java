package datapro.eibs.reports;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdom.Comment;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.XMLOutputter;

import datapro.eibs.beans.EFRM00001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEFRM000DOC extends JSEFRM000 {
	
	protected void procReqForm(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFRM000", req);
			EFRM00001Message msgHeader = (EFRM00001Message) mp.getMessageRecord("EFRM00001");
			msgHeader.setH01USERID(user.getH01USR());
			msgHeader.setH01PROGRM("EFRM000");
			msgHeader.setH01TIMSYS(getTimeStamp());
			msgHeader.setH01SCRCOD("01");
			String interf = req.getParameter("INTERFACE") == null ? "" : req.getParameter("INTERFACE");
		 	msgHeader.setH01FLGWK1(interf);
		 	String opeCode = req.getParameter("OPE_CODE") == null ? "" : req.getParameter("OPE_CODE");
		 	msgHeader.setE01SELFTY(opeCode);
		 	String appCode = req.getParameter("APP_CODE") == null ? "" : req.getParameter("APP_CODE");
		 	if (appCode.equalsIgnoreCase("XX")) {
		 		msgHeader.setH01OPECOD(req.getParameter("ACCOUNT").toUpperCase());
		 	} else {
		 		msgHeader.setE01SELACD(appCode);
		 		String account = req.getParameter("ACCOUNT") == null ? "" : req.getParameter("ACCOUNT").toUpperCase();  
		 		if (account.equals("")) {
				 	if (appCode.equals("00")) {
				 		msgHeader.setE01SELACC(userPO.getCusNum());
				 	} else {
				 		msgHeader.setE01SELACC(userPO.getIdentifier());
				 	}
		 		} else {
		 			msgHeader.setE01SELACC(account);
		 		}
		 		if (req.getParameter("SEQ") != null) {
			 		msgHeader.setH01OPECOD(Util.justifyRight(req.getParameter("SEQ"), 4));		 		
		 		}
		 	}
		 	
		 	String flag = req.getParameter("H01FLGWK3") == null ? "" : req.getParameter("H01FLGWK3");
		 	msgHeader.setH01FLGWK3(flag);
		 	
		 	String dataScheme = JSEIBSProp.getDefaultDataScheme() == null ||  JSEIBSProp.getDefaultDataScheme().equals("") ? "512" : JSEIBSProp.getDefaultDataScheme();
		 	String minTextSize = JSEIBSProp.getMinimumTextSize() == null || JSEIBSProp.getMinimumTextSize().equals("") ? "8" : JSEIBSProp.getMinimumTextSize();
		 	
		 	mp.sendMessage(msgHeader);
		 	
		 	//Attached Document List
		 	JBObjList list = mp.receiveMessageRecordList("E01MORFRM");
		 	
		 	ELEERRMessage msgError = null;
		 	if (mp.hasError(list)) {
		 		msgError = (ELEERRMessage) mp.getError(list);
				String error = msgError.getERNU01() + " - " + msgError.getERDS01();
				session.setAttribute("error_msg", error);
				forward("EFRM000_forms_req_error.jsp", req, res);
		 	} else {
			 	list.initRow();
				// Create the root element
				Element root = new Element("IRDocumentList");
				root.setAttribute("id", "");
				root.setAttribute("MinimumTextSize", minTextSize);
				root.setAttribute("DefaultDataScheme", dataScheme);
				root.setAttribute("CheckBoxMark", "XX");
		 		
				Document doc = new Document(root);
				
				Element ftp = new Element("eIBSFTP");
				ftp.setAttribute("Language", user.getE01LAN().toLowerCase());
				ftp.setAttribute("Host", JSEIBSProp.getFtpFormHost());
				ftp.setAttribute("Port", JSEIBSProp.getFtpFormPort());
				ftp.setAttribute("UserID", JSEIBSProp.getFtpFormUserID());
				ftp.setAttribute("Password", JSEIBSProp.getFtpFormPassword());
				if (!JSEIBSProp.getFtpPathFormData().equals(""))
					ftp.setAttribute("DataPath", JSEIBSProp.getFtpPathFormData());
				if (!JSEIBSProp.getFtpPathFormConfig().equals(""))
					ftp.setAttribute("ConfigPath", JSEIBSProp.getFtpPathFormConfig());
				if (!JSEIBSProp.getFtpFormFirewallType().equals(""))
					ftp.setAttribute("FirewallType", JSEIBSProp.getFtpFormFirewallType());
				if (!JSEIBSProp.getFtpFormFWAuthenticate().equals(""))
					ftp.setAttribute("FWAuthenticate", JSEIBSProp.getFtpFormFWAuthenticate());
				if (!JSEIBSProp.getFtpFormFWUserID().equals(""))
					ftp.setAttribute("FWUserID", JSEIBSProp.getFtpFormFWUserID());
				if (!JSEIBSProp.getFtpFormFWPassword().equals(""))
					ftp.setAttribute("FWPassword", JSEIBSProp.getFtpFormFWPassword());
				if (!JSEIBSProp.getBankerPDFURL().equals(""))
					ftp.setAttribute("BankerPDFURL", JSEIBSProp.getBankerPDFURL());
				if (!JSEIBSProp.getBankerPDFURL1().equals(""))
					ftp.setAttribute("BankerPDFURL1", JSEIBSProp.getBankerPDFURL1());
				
				root.addContent(ftp);
				
				String operation = null;
				String docType = ""; 
					
				while (list.getNextRow()) {
					msgHeader = (EFRM00001Message) list.getRecord();
					// IRDocument Childs
					Element form = new Element("IRDocument");
					docType = (msgHeader.getE01APFIFS().equals("B")) ? "BFO" : "eIBSForm";
					form.setAttribute("type", docType);
					form.setAttribute("BFOName", msgHeader.getE01APFPTH().trim());	// Name of the BFO Form file
					form.setAttribute("Copies", msgHeader.getE01APFCPI().trim());
					form.setAttribute("FileName", "");
					form.setAttribute("MinimumTextSize", "10");
					form.setAttribute("DefaultDataScheme", "0");
					
					int apfope = 0;
					try {
						apfope = Integer.parseInt(msgHeader.getE01APFOPE()); 
					} catch (Exception e) {
						apfope = 0;
					}
					switch (apfope) {
						case 1: 
							operation = "Preview";
							break;
						case 2: 
							operation = "Print";
							break;
						case 3: 
							operation = "Prepare";
							break;
						default: 
							operation = "Preview";
							break;
					}
					form.setAttribute("Action", operation);
					form.addContent(new Element("BFODoc")
							.setAttribute("DocumentName", msgHeader.getE01APFPTH().trim()) // Name of the BFO Form
							.setAttribute("DocumentDuplex", "-3")
					);
					form.addContent(new Element("IRInstance")
							.setAttribute("InstanceID", "")
							.addContent(new Element("IRDataRequirement")
								.addContent(new Comment("Created: " + getTimeStamp()))
							)
							.addContent(new Element("IRFields")
								.addContent(new Comment("Added Fields"))
							)
							.addContent(new Element("IRLogos")
								.addContent(new Comment("Added Logos"))
							)
					);
					root.addContent(form);
				}
				
				if (!list.isEmpty()) {
					Element data = new Element("IRDataRequirement");
					data.addContent(new Comment("Created: " + getTimeStamp()));
					if (!appCode.equalsIgnoreCase("XX")) {
					 	//Attached Forms List
                        //int index = 1;
                        String prefix = "";
						while (true) {
							MessageRecord msg = mp.receiveMessageRecord();
							String ddsName = msg.getFormatName();
							prefix = getPrefix(msg);
	                        if(ddsName.equals("EFRM00001")) {
	                            break;
	                        } else {                             	
	                    		buildFormList((Object)data, msg, "." + prefix, 0);
	                        }	
						}
					}
				  	root.addContent(data);
					if (formActive) {
						if (docType.equalsIgnoreCase("BFO")) {
							// set MINE type for BFO Interface
							res.setContentType("eibs/bfo");  	
						} else {
							// set MINE type for eIBS Forms Interface
							res.setContentType("eibs/form");	
						}
					} else {
						// set MIME type for html
						res.setContentType("text/html");
					}
					
					ServletOutputStream out = (ServletOutputStream) res.getOutputStream();
					ByteArrayOutputStream outTmp = new ByteArrayOutputStream();
					XMLOutputter fmt = new XMLOutputter();	
					fmt.setEncoding("ISO-8859-1"); //Latin 1
					fmt.output(doc, outTmp);					
					String sXMLReplaced = replace(outTmp.toString(), BR, FinalBR);
					sXMLReplaced = replace(sXMLReplaced, "&amp;#39;", "'");
					out.print(sXMLReplaced);							
					out.close();					
				} else {
					// There is no form attached to this action
					flexLog("Putting java beans into the session");
					String err = "There is no form attached to this action";
					session.setAttribute("error_msg", err);
					forward("EFRM000_forms_req_error.jsp", req, res);
				}
		 	}
		 	
		} finally {
			if (mp != null)	mp.close();
		}
	}
	

}

package datapro.eibs.reports;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdom.Comment;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.XMLOutputter;

import com.datapro.constants.Entities;

import datapro.eibs.beans.EFRM00001Message;
import datapro.eibs.beans.EFRM00010Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EOF011501Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0120DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.DecimalField;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSEFRM000 extends JSEIBSServlet {

	public final static String FinalBR = "<BR />";
	public final static String BR = "*13*";	
	private String eIBSFormsNL = "$#NL#$";
	
	protected static final int R_FORM 				= 1;
	protected static final int R_OFFICIAL_CHECK		= 3;
	protected  static final int R_APPLICATION		= 5;
	// entering options
	protected static final int R_ENTER 				= 100;
	protected static final int A_ENTER	 			= 200;
	
	protected String LangPath = "S";
	protected String userLanguage;
	protected String ftmEibs;
	
    protected String descNumbers[] = {
            "Cero", "Una", "Dos", "Tres", "Cuatro", "Cinco", "Seis", "Siete", "Ocho", "Nueve", 
            "Diez", "Once", "Doce", "Trece", "Catorce", "Quince"
	};
	protected Map formatNames = new HashMap();
	
    public JSEFRM000(){
		super();
        initFormatNames();
    }
    
    private void initFormatNames(){
        formatNames.put("ESS0030DS", "GeneralInformation");
        formatNames.put("EFRM00005", "RetailAccount");
        formatNames.put("EFRM00006", "StopPayments");
        formatNames.put("EFRM00007", "AccountEntities");
        formatNames.put("EFRM00008", "MoneyLaundering");
        formatNames.put("EFRM00010", "CertificateOfDeposit.Basic");
        formatNames.put("EFRM00040", "LetterOfCredit");
        formatNames.put("EFRM00041", "RemittanceLetter");
        formatNames.put("EFRM00042", "ProceedsAssignment");
        formatNames.put("EFRM00043", "GuaranteeTickets");//Boletas de Garantia
        formatNames.put("EFRM00050", "Collections");
        formatNames.put("EFRM00070", "OfficialCheck");
        formatNames.put("EFRM00071", "DetailOfGuarantee");
        formatNames.put("EFRM00072", "SpecialCodes");
        formatNames.put("EFRM00073", "Entities");
        formatNames.put("EFRM00074", "SpecialInstructions");
        formatNames.put("EFRM00075", "AccountHolders");
        formatNames.put("EFRM00076", "PaymentSchedule");
        formatNames.put("EFRM00080", "Loans");
        formatNames.put("EFRM00095", "Unknown");
        formatNames.put("EFRM00098", "Customer");
        formatNames.put("EFRM00401", "CreditProposal");
        formatNames.put("EFRM00402", "CreditProposalProducts");
        formatNames.put("EFRM00403", "CreditProposalDocuments");
        formatNames.put("EFRM00404", "CreditProposalCollaterals");
        formatNames.put("EFRM00405", "CollateralEstate");
        formatNames.put("EFRM00406", "CollateralVehicle");
        formatNames.put("EFRM00407", "CollateralPledge");
        formatNames.put("EFRM00408", "CollateralGuarantees");
        formatNames.put("EFRM00409", "CollateralTermDeposit");
        formatNames.put("EFRM00410", "CollateralTransfer");
        formatNames.put("EFRM00411", "CollateralTrust");
        formatNames.put("EFRM00412", "CollateralPawn");
        formatNames.put("EFRM00413", "CollateralOtherTitles");
        formatNames.put("EFRM00420", "CollateralConstituent");
        formatNames.put("EFRM00421", "CollateralFinancialEstat");
        formatNames.put("EFRM00060", "PlatformSale.BasicInformation");
        formatNames.put("EFRM00061", "PlatformSale.Refinancing");
        formatNames.put("EFRM00062", "PlatformSale.ThirdParties");
        formatNames.put("EFRM00063", "PlatformSale.CardAlliance");
        formatNames.put("EFRM00064", "PlatformSale.VirtualShop");
        formatNames.put("EFRM00065", "PlatformSale.Insurance");
    }
	
	protected boolean hasIndex(String name) {
		
		return ("EFRM00073".equals(name)
				|| "EFRM00061".equals(name)
				|| "EFRM00062".equals(name)
				|| "EFRM00063".equals(name)
				|| "EFRM00064".equals(name)
				|| "EFRM00065".equals(name));
	}
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		userLanguage = user.getE01LAN().equals("s") ? "es" : "en";
		ftmEibs = user.getE01DTF();   
		
		switch (screen) {
			case R_FORM :
				procReqForm(user, req, res, session);
				break;
			case R_OFFICIAL_CHECK :
				procReqOfficialCheck(user, req, res, session);
				break;
			case R_ENTER :
				procReqEnter(user, req, res, session);
				break;
			case R_APPLICATION :
				procReqApplication(user, req, res, session);
				break;
			default :
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}

	protected void procReqApplication(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos	userPO = new UserPos();
		userPO.setOption("FORMS");
		userPO.setPurpose("APPLICATIONS");
		ELEERRMessage msgError = new ELEERRMessage(); 
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		forward("EFRM000_forms_applications.jsp", req, res);	
	}

	protected void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos	userPO = new UserPos();
		userPO.setOption("FORMS");
		userPO.setPurpose("");
		ELEERRMessage msgError = new ELEERRMessage(); 
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		forward("EFRM000_forms_enter.jsp", req, res);	
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
				forward("EFRM000_forms_req_error.jsp", req, res);
		 	} else {
			 	list.initRow();
				// Create the root element
				Element root = new Element("IRDocumentList");
				root.setAttribute("id", "");
				root.setAttribute("MinimumTextSize", "10");
				root.setAttribute("DefaultDataScheme", "0");
				root.setAttribute("CheckBoxMark", "XX");
				root.addContent(new Comment("Created: " + getTimeStamp()));
				
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
				ftp.addContent(new Comment("FTP and Firewall Configuration"));
				root.addContent(ftp);
				
				list.getNextRow();
				msgHeader = (EOF011501Message) list.getRecord(); 
		  		// IRDocument Childs
				Element form = new Element("IRDocument");
				form.setAttribute("type", "eIBSForm");
				form.setAttribute("BFOName", msgHeader.getE01OFMPTH().trim());	// Name of the Template Form file
				form.setAttribute("Copies", "1");
				form.setAttribute("FileName", "");
				form.setAttribute("MinimumTextSize", "10");
				form.setAttribute("DefaultDataScheme", "0");
				
				String operation = "Preview";
				form.setAttribute("Action", operation);
				form.addContent(new Element("BFODoc")
						.setAttribute("DocumentName", msgHeader.getE01OFMPTH().trim()) // Name of the BFO Form
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
				
				Element data = new Element("IRDataRequirement");
				data.addContent(new Comment("Created: " + getTimeStamp()));
				//Header
				addDataNode(data, "OfficialCheck.CheckNumber", msgHeader.getE01OFMCKN());
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
				root.addContent(data);
				// Output the document, use standard formatter
				if (formActive) {
					// set MINE type for eIBS Forms Interface
					res.setContentType("eibs/form");	
				} else {
					// set MIME type for html
					res.setContentType("text/html");
				}
				ServletOutputStream out = (ServletOutputStream) res.getOutputStream();
				ByteArrayOutputStream outTmp = new ByteArrayOutputStream();
				XMLOutputter fmt = new XMLOutputter();					
				fmt.output(doc, outTmp);					
				String sXMLReplaced = replace(outTmp.toString(), BR, FinalBR);
				sXMLReplaced = replace(sXMLReplaced, "&amp;#39;", "'");
				out.print(sXMLReplaced);							
				out.close();					
		 	}
		
		} finally {
			if (mp != null)	mp.close();
		}
	}

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
					// Add General Information like User ID....
					getFormData(data, (String)formatNames.get("ESS0030DS") + ".", user);

					if (!appCode.equalsIgnoreCase("XX")) {
						int index = 0;
                        String prefix = "";
						MessageRecord newmessage = mp.receiveMessageRecord();
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
	                    		buildFormList(data, newmessage, "." + prefix, index++);
	                        newmessage = mp.receiveMessageRecord();
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
					session.removeAttribute("error_msg");
					forward("EFRM000_forms_req_error.jsp", req, res);
				}
		 	}
		 	
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void getTRDataForDataproForms(Object data, EWD0120DSMessage msg, int pos) {
		String prefix = "OfficialCheck.";
		String sufix = "";
		String strDebit = "";
		String strCredit = "";
		BigDecimal debit = new BigDecimal("0");
		BigDecimal credit = new BigDecimal("0");

		switch (pos) {
			case 1 : 
				sufix = ".One";
				break;
			case 2 : 
				sufix = ".Two";
				break;
			case 3 : 
				sufix = ".Three";
				break;
			case 4 : 
				sufix = ".Four";
				break;
			case 5 : 
				sufix = ".Five";
				break;
			case 6 : 
				sufix = ".Six";
				break;
			case 7 : 
				sufix = ".Seven";
				break;
			case 8 : 
				sufix = ".Eight";
				break;
			case 9 : 
				sufix = ".Nine";
				break;
			case 10 : 
				sufix = ".Ten";
				break;
			case 11 : 
				sufix = ".Eleven";
				break;
			default: 
				prefix = "";
				break;
		}

		if(msg.getE01WRKDCC().equals("D")){
			debit = debit.add(msg.getBigDecimalE01WRKAMT());
			strDebit = Util.fcolorCCY(msg.getE01WRKAMT());
			strCredit = "&nbsp;";
		} else if(msg.getE01WRKDCC().equals("C")){
			credit = credit.add(msg.getBigDecimalE01WRKAMT());
			strDebit = "&nbsp;";
			strCredit = Util.fcolorCCY(msg.getE01WRKAMT());
		}

		addDataNode(data, prefix + "Bank" + sufix, msg.getE01WRKBNK());
		addDataNode(data, prefix + "Branch" + sufix, msg.getE01WRKBRN());
		addDataNode(data, prefix + "Currency" + sufix, msg.getE01WRKCCY());
		addDataNode(data, prefix + "Ledger" + sufix, msg.getE01WRKGLN());
		addDataNode(data, prefix + "Reference" + sufix, msg.getE01WRKACC());
		addDataNode(data, prefix + "CCost" + sufix, msg.getE01WRKCCN());
		addDataNode(data, prefix + "TrCode" + sufix, msg.getE01WRKCDE());
		addDataNode(data, prefix + "Debit" + sufix, strDebit);
		addDataNode(data, prefix + "Credit" + sufix, strCredit);
		addDataNode(data, prefix + "Description" + sufix, msg.getE01WRKTDS());
	}
	
    protected String toCifras(BigDecimal dividendo)
    {
        int numCounter = 1;
        BigDecimal divisor = new BigDecimal(10D);
        String descNum = "";
        for(; dividendo.compareTo(divisor) == 1; dividendo = dividendo.divide(divisor, 6))
            numCounter++;

        if(numCounter > 0 && numCounter < 16)
            descNum = descNumbers[numCounter];
        if(dividendo.intValue() > 6)
            return descNum + " (" + numCounter + ") cifras altas";
        if(dividendo.intValue() > 3)
            return descNum + " (" + numCounter + ") cifras medias";
        else
            return descNum + " (" + numCounter + ") cifras bajas";
    }
	
	public static String replace(String Text, String Old, String New){
		if (Old.length() == 0) return Text;
		StringBuffer buf = new StringBuffer();
		int i=0, j=0;
		while((i = Text.indexOf(Old, j)) > -1){
			buf.append(Text.substring(j,i) + New);
			j = i + Old.length();
		}
		if (j < Text.length())
			buf.append(Text.substring(j));
		return buf.toString();
	}
	
	protected void addDataNode(Object data, String name, String dataItem) {
		if (!(dataItem.trim().equals("") || dataItem.trim().equalsIgnoreCase("&nbsp;"))) {
			boolean isOK = true;
			BigDecimal dataNum;
			try {
				dataNum = new BigDecimal(dataItem);
				isOK = dataNum.compareTo(new BigDecimal("0")) != 0; 
			} catch (Exception ex) {
				isOK  = true;
			}
			if (isOK) {
				((Element) data).addContent(new Element("IRDataItem")
					.setText(dataItem)
					.setAttribute("DataType", "String") 
					.setAttribute("Protected", "False")
					.setAttribute("PublicName", name)
				);
			}
		}
	}
	
	public void addDataNode(Object data, String name, MessageField field){
		if (field.getTag().toLowerCase().indexOf("time") > -1){
			addDataNode(data, name + field.getTag(), Util.formatTime(field.getString()));
		} else if (field.getDecimals() > 0){
			addDataNode(data, name + field.getTag(), Util.formatCCY(field.getString()));
		} else {
			addDataNode(data, name + field.getTag(), field.getString());
		}
	}

	protected void addDateDataNode(Object data, String name, 
			MessageField field, String year, String month, String day){
		if (Integer.parseInt(month) == 0 && Integer.parseInt(day) == 0) {
			return;
		}
		if (field.getTag().indexOf("Long") > 0
				|| field.getTag().indexOf("LL") > 0) {
			addDataNode(data, name, Util.formatCustomDate(
					"DMY", (!day.equals("") ? "dd 'de' " : "")
							+ (!month.equals("") ? "MMM " : "")
							+ (!year.equals("") ? "'del' yyyy" : ""), "es",
					day, month, year));
		} else {
			addDataNode(data, name, Util.formatCustomDate(
					"DMY", (!day.equals("") ? "dd" : "")
							+ (!month.equals("") ? "/MM" : "")
							+ (!year.equals("") ? "/yyyy" : ""), "es",
					day, month, year));
		}
	}
	
	protected void addCommonDataNode(Object data, String name, 
		MessageRecord message, MessageField field, int index){
		addDataNode(data, name + getFieldName(field.getTag(), index), field);
		if (field.getTag().indexOf("RolloverCode") > -1){
			addDataNode(data, name + getFieldName("", index) + "RolloverDescription", 
				getRolloverInstructions(message));
		} else if (field.getDecimals() > 1) {
			DecimalField dField = (DecimalField) field; 
			addDataNode(data, name + getFieldName(field.getTag(), index) + field.getTag()
				+ "Cifras", toCifras(dField.getBigDecimal()));
		}
	}
	
	protected String getFieldName(String name, int index){
		int dotPos = name.indexOf(".");
		return (index == 0 || dotPos == 1 || dotPos == 2 
			? "" : index + ".");
	}
    
	protected void getFormData(Object data, String name, MessageRecord message){
		getFormData(data, name, 0, message);
	}
	
    protected void getFormData(Object data, String name, int index, MessageRecord message)
    {    	
		// all the fields here
		java.util.Enumeration enu = message.fieldEnumeration();
		MessageField field = null;
		while (enu.hasMoreElements()) {
			field = (MessageField) enu.nextElement();
			try {
				if (field.getTag().indexOf("Year") > 0
						|| field.getTag().indexOf("Month") > 0
						|| field.getTag().indexOf("Day") > 0){
					String dateName = "";
					String year = "";
					String month = "";
					String day = "";
					MessageField field1 = field;
					if (field1.getTag().indexOf("Year") > 0){
						year = field1.getString();
					} else if (field1.getTag().indexOf("Month") > 0){
						month = field1.getString();
						dateName = field1.getTag().substring(
								0, field1.getTag().indexOf("Month"));
					} else if (field1.getTag().indexOf("Day") > 0){
						day = field1.getString();
					}
					addDataNode(data, name + getFieldName(field1.getTag(), index), field1);
					
					MessageField field2 = (MessageField) enu.nextElement();
					if (field2.getTag().indexOf("Year") > 0){
						year = field2.getString();
					} else if (field2.getTag().indexOf("Month") > 0){
						month = field2.getString();
						dateName = field2.getTag().substring(
								0, field2.getTag().indexOf("Month"));
					} else if (field2.getTag().indexOf("Day") > 0){
						day = field2.getString();
					} else {
						addCommonDataNode(data, name, message, field2, index);
						continue;
					}					
					addDataNode(data, name + getFieldName(field2.getTag(), index), field2);
					
					MessageField field3 = (MessageField) enu.nextElement();
					if (field3.getTag().indexOf("Year") > 0){
						year = field3.getString();
					} else if (field3.getTag().indexOf("Month") > 0){
						month = field3.getString();
						dateName = field3.getTag().substring(
								0, field3.getTag().indexOf("Month"));
					} else if (field3.getTag().indexOf("Day") > 0){
						day = field3.getString();
					} else {
						addCommonDataNode(data, name, message, field2, index);
						continue;
					}
					addDataNode(data, name + getFieldName(field3.getTag(), index), field3);
					
					addDateDataNode(data, name + getFieldName(dateName, index) + dateName, 
						field, year, month, day);
				} else if (field.getTag().indexOf("MMDDYY") > 0
							|| field.getTag().indexOf("DDMMYY") > 0
							|| field.getTag().indexOf("YYMMDD") > 0){
					try {
						int size = field.getLength() > 6 ? 8 : 6;
						int yearPos = field.getTag().indexOf("YY");
						int monthPos = field.getTag().indexOf("MM");
						int dayPos = field.getTag().indexOf("DD");
						String date = Util.addLeftChar('0', size, field.getString());
						int pos = date.length() - (size - 
								((yearPos/monthPos*2) + (yearPos/monthPos*2)));
						String year = date.substring(pos, pos + (size > 6 ? 4 : 2));
						pos = date.length() - (size - ((monthPos/yearPos*2) + (monthPos/dayPos*2)));
						String month = date.substring(pos, pos + 2);
						pos = date.length() - (size - ((dayPos/yearPos*2) + (dayPos/monthPos*2)));
						String day = date.substring(pos, pos + 2);
						addDateDataNode(data, name + getFieldName(field.getTag(), index) + field.getTag(), 
							field, year, month, day);
					} catch (Exception e) {
						flexLog("FORM Date Format Error on : " + name + field.getTag());
					}
				} else if (field.getTag().indexOf("Date") > 0
					|| field.getTag().indexOf("date") == 0){
					//Default Date format is MMDDYY
					int size = field.getLength() > 6 ? 8 : 6;
					String date = Util.addLeftChar('0', size, field.getString());
					String month = date.substring(0, 2);
					String day = date.substring(2, 4);
					String year = date.substring(4, 4 + (size > 6 ? 4 : 2));
					year = (size > 6 ? "" : (Integer.parseInt(year) > 50 ? "19" : "20")) + year;
					addDateDataNode(data, name + getFieldName(field.getTag(), index) + field.getTag(), 
						field, year, month, day);
				} else {
					addCommonDataNode(data, name, message, field, index);
				}
			} catch (Exception e) {
			}
		}
    }
    
    protected void buildFormList(Object data, MessageRecord newmessage, String prefix, int index) 
		throws ServletException, IOException {
		String ddsName = newmessage.getFormatName();
		getFormData(data, (String) formatNames.get(ddsName) + prefix, index, newmessage);
	}
    
    protected String getEntityName(String type){
        String prefix = "";
        if (Entities.ENTITY_TYPE_MAILING_ADDRESS.equals(type)) {
        	prefix = "MailingAddress";
		} else if (Entities.ENTITY_TYPE_STOCK_HOLDER.equals(type)) {
			prefix = "StockHolders";
		} else if (Entities.ENTITY_TYPE_BOARD_OF_DIRECTORS.equals(type)) {
			prefix = "BoardOfDirectors";
		} else if (Entities.ENTITY_TYPE_CUSTOMER_BENEFICIARIES.equals(type)) {
			prefix = "CustomerBeneficiaries";
		} else if (Entities.ENTITY_TYPE_CUSTOMER_LEGAL_REPRESENTATIVES.equals(type)) {
			prefix = "LegalRepresentatives";
		} else if (Entities.ENTITY_TYPE_BANK_REFERENCES.equals(type)) {
			prefix = "BankReferences";
		} else if (Entities.ENTITY_TYPE_COMMERCIAL_REFERENCES.equals(type)) {
        	prefix = "CommercialReferences";
		} else if (Entities.ENTITY_TYPE_ACCEPTANCES.equals(type)) {
			prefix = "Aceptances";
		} else if (Entities.ENTITY_TYPE_CUSTOMER_ASSETS.equals(type)) {
			prefix = "CustomerAssets";
		} else if (Entities.ENTITY_TYPE_CUSTOMER_LIABILITIES.equals(type)) {
			prefix = "CustomerLiabilities";
		} else if (Entities.ENTITY_TYPE_VALUE_OF_ASSETS.equals(type)) {
			prefix = "ValueOfAssets";
		} else if (Entities.ENTITY_TYPE_DEPENDENTS.equals(type)) {
			prefix = "Dependents";
		} else if (Entities.ENTITY_TYPE_DISC_ECONOMIC_ACTIVITY.equals(type)) {
			prefix = "EconomicActivity";
		} else if (Entities.ENTITY_TYPE_COLLATERAL_ADDRESS.equals(type)) {
			prefix = "CollateralAddress";
		} else if (Entities.ENTITY_TYPE_FAMILY_REFERENCES.equals(type)) {
			prefix = "FamilyReferences";
		} else if (Entities.ENTITY_TYPE_CONTACT.equals(type)) {
			prefix = "ContactInfo";
		} else if (Entities.ENTITY_TYPE_PERSONAL_REFERENCE.equals(type)) {
			prefix = "PersonalReferences";
		} else if (Entities.ENTITY_TYPE_CREDIT_LINE_AVALS.equals(type)) {
			prefix = "CreditLinesAvals";
		} else if (Entities.ENTITY_TYPE_INSURANCE_BENEFICIARIES.equals(type)) {
			prefix = "InsuranceBeneficiaries";
		} else if (Entities.ENTITY_TYPE_MANAGERS_WITH_CREDIT.equals(type)) {
			prefix = "ManagersWithCredit";
		} else if (Entities.ENTITY_TYPE_PEP.equals(type)) {
			prefix = "Peps";
		} else if (Entities.ENTITY_TYPE_ACCOUNT_HOLDERS.equals(type)) {
			prefix = "AccountHolders";
		} else if (Entities.ENTITY_TYPE_ACCOUNT_LEGAL_REPRESENTATIVES.equals(type)) {
			prefix = "AccountLegalRepresentatives";
		} else if (Entities.ENTITY_TYPE_ACCOUNT_BENEFICIARIES.equals(type)) {
			prefix = "AccountBeneficiaries";
		} else if (Entities.ENTITY_TYPE_COLLATERAL_HOLDERS.equals(type)) {
			prefix = "AccountCollateralHolders";
		} else if (Entities.ENTITY_TYPE_ACCOUNT_SIGNER.equals(type)) {
			prefix = "AccountSigners";
		}
		
        return prefix;
    }

    protected String getEntityName(MessageRecord msg) {
    	MessageField field = null;
    	try {
    		field = msg.getField("recordType");
		} catch (Exception e) {
			System.out.println("ERROR retrieving the record type: " + msg.getFormatName());
		}
		if (field != null) {
			String type = field.getString();
	        try {
	        	return getEntityName(type);
			} catch (Exception exception) {
				System.out.println("ERROR finding the prefix: " + msg.getFormatName() + "Prefix: " + type);
			}			
		}
		return "";
	}
    

    protected String getPrefix(MessageRecord msg) {
    	MessageField field = null;
    	try {
    		field = msg.getField("recordType");
		} catch (Exception e) {
			System.out.println("ERROR retrieving the record type: " + msg.getFormatName());
		}
		if (field != null) {
			String type = field.getString();
	        try {
	        	return getPrefix(type);
			} catch (Exception exception) {
				System.out.println("ERROR finding the prefix: " + msg.getFormatName() + "Prefix: " + type);
			}			
		}
		return "";
	}
    
    protected String getPrefix(String type) {
    	return getEntityName(type)+".";
    }

    protected String getMaritalStatusDesc(String s){
    	int code;
    	String desc="";
    	try{
    		code=Integer.parseInt(s);
    	}
    	catch(Exception e){
    		code=0;
    	}
    	
    	switch(code)
    	{
    		case 0:
    			break;
    		case 1:
    			desc="Soltero(a)";
    			break;
    		case 2:
    			desc="Casado(a)";
    			break;
    		case 3:
    			desc="Divorciado(a)";
    			break;
    		case 4:
    			desc="Viudo(a)";
    			break;
    		case 5:
    			desc="Otros";
    			break;
    		default:
    			break;
    	}
    	return desc;
    }
	
    protected String getRolloverInstructions(MessageRecord message){
		EFRM00010Message msg = (EFRM00010Message) message;
		String RenovationInst = "";
		if(msg.getE10DEAROC().equals("A"))
			RenovationInst = "Principal mas intereses seran renovados por el mismo periodo";
		else if(msg.getE10DEAROC().equals("B"))
			RenovationInst = "Interes sera acreditado a la cuenta " + msg.getE10DEARAC() + ". El principal sera renovado por el mismo periodo.";
		else if(msg.getE10DEAROC().equals("C"))
			RenovationInst = "Interes sera acreditado a la cuenta contable " + msg.getE10DEARAC() + ",generando un cheque de gerencia o por transferencia de fondos." + " El principal sera renovado por el mismo periodo de tiempo. ";
		else if(msg.getE10DEAROC().equals("D"))
			RenovationInst = " Al vencimiento cancelar el Deposito mas los intereses acreditando a la cuenta contable " + msg.getE10DEARAC() + ", emitiendo un cheque de gerencia o por transferencia de fondos.";
		else if(msg.getE10DEAROC().equals("E"))
			RenovationInst = "Al vencimiento cancelar Deposito mas los intereses  acreditandolos a la cuenta numero " + msg.getE10DEARAC();
		else if(msg.getE10DEAROC().equals("F"))
			RenovationInst = "Al vencimiento renovar el Deposito y los intereses incrementando/disminuyendo los intereses  contra la cuenta numero " + msg.getE10DEARAC();
		else if(msg.getE10DEAROC().equals("G"))
			RenovationInst = "Al vencimiento renovar el Deposito y los intereses incrementando/disminuyendo los intereses  contra la cuenta numero " + msg.getE10DEARAC();
		else if(msg.getE10DEAROC().equals("H"))
			RenovationInst = "Interes sera pagado periodicamente a la cuenta " + msg.getE10DEARAC() + ". El principal sera renovado por el mismo periodo.";
		else if(msg.getE10DEAROC().equals("I"))
			RenovationInst = "Interes sera pagado periodicamente a la cuenta contable numero " + msg.getE10DEARAC() + " , emitiendo un cheque de gerencia o por transferencia de fondos" + ". El principal sera renovado por el mismo periodo.";
		else if(msg.getE10DEAROC().equals("J"))
			RenovationInst = "El interes y el principal seran pagados al  certificado numero " + msg.getE10DEARAC() + " . No hay renovacion en esta opcion.";
		else if(msg.getE10DEAROC().equals("K"))
			RenovationInst = "Interes sera pagado periodicamente a la cuenta  numero " + msg.getE10DEARAC();
		else if(msg.getE10DEAROC().equals("P"))
			RenovationInst = "El deposito no tiene instruccion de renovacion, sera renovado  automaticamente despues de un periodo de espera.";
		else if(msg.getE10DEAROC().equals("S"))
			RenovationInst = "Interes y principal seran pagados basados en un plan de pagos definido previamente";
		else RenovationInst = "Sin instruccion de renovacion";
		return RenovationInst;
    }    
    
    
}

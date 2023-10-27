package datapro.eibs.timedeposits; 
/**
 * Printer Time Deposits 
 * Creation date: (07/04/12)
 * @author: Martha Riaño
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Show fields in order to validate
 *	// SCREEN =    2    Send PDF 
 */

import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.PageSize;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfReader;
import com.lowagie.text.pdf.PdfStamper;
import com.lowagie.text.pdf.PdfWriter;

import datapro.eibs.beans.EDL013003Message;
import datapro.eibs.beans.EDL016001Message;
import datapro.eibs.beans.EDL016002Message;
import datapro.eibs.beans.EDL205001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD400001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL2050 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			case 1 : // Request Search Parameters to Print
			case 3 : // Request Search Parameters to Additional print
			case 5 : // Request Search Parameters to Annul print	
				procReqPrm(user, req, res, session, screen);
				break;
			case 2 : // Send Screen for CDT details
				procReqDetail(user, req, res, session, screen);
				break;
			case 4 : // Send Additional print
				procActionAdditionalPrint(user, req, res, session, screen);
				break;
//			case 5 : // Request Search Parameters to Additional print	
//				procReqAnu(user, req, res, session, screen);
//				break;	
			case 6 : // Send Screen for CDT details
				procReqDetailAnu(user, req, res, session, screen);
				break;	
			case 960:
				procReqEnterAcc(user, req, res, session, screen);
				break;
			case 1060 :
				procActionEnterAcc(user, req, res, session);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}
	
	protected void procReqEnterAcc(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			ELEERRMessage msgError = null;
			UserPos userPO = null;

			try {

				msgError = new ELEERRMessage();
				userPO = new UserPos();
				String ope = req.getParameter("OPE");
				if (ope.equals("R"))
					userPO.setPurpose("REPRINT");
				else
					userPO.setPurpose("ANNUL");
				if (req.getParameter("appcode") == null){
					userPO.setApplicationCode("11");
				}else{
					userPO.setApplicationCode(req.getParameter("appcode"));
				}
				
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}
			
			ses.setAttribute("userPO", userPO);
			forwardOnSuccess("EDL2050_cd_enter_acc.jsp", req, res);

			}

	protected void procActionEnterAcc(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			EDL205001Message msgCD = null;
			ELEERRMessage msgError = null;
			UserPos userPO = null;
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			// Send Initial data
			try {
				//msgCD = (EDL013003Message)ses.getAttribute("cdTransac");
				mp = getMessageProcessor("EDL2050", req);
				msgCD = (EDL205001Message) mp.getMessageRecord("EDL205001");
				msgCD.setH01USERID(user.getH01USR());
				msgCD.setH01PROGRM("EDL2050");
				msgCD.setH01TIMSYS(getTimeStamp());
				msgCD.setH01SCRCOD("01");
				if(userPO.getPurpose().equals("REPRINT"))
					msgCD.setH01SCRCOD("02");
				else if(userPO.getPurpose().equals("ANNUL"))
					msgCD.setH01SCRCOD("03");
				
				msgCD.setH01OPECOD("0003");
				try {
					msgCD.setR01ACC(req.getParameter("R01ACC"));
				} catch (Exception e) {
					msgCD.setR01ACC("0");
				}
				try {
					userPO.setIdentifier(req.getParameter("R01ACC"));
				} catch (Exception e) {
					userPO.setIdentifier("0");
				}
				try {
					msgCD.setE01STS(req.getParameter("E01STS"));
				} catch (Exception e) {
					msgCD.setE01STS("");
				}
				
				msgCD.send();
				msgCD.destroy();
				flexLog("EDL2050 Message Sent");
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}

			// Receive Message
			newmessage = mp.receiveMessageRecord();

			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				ses.setAttribute("userPO", userPO);
				forward("EDL2050_cd_enter_acc.jsp", req, res);
			} else {
				newmessage = mp.receiveMessageRecord();
				msgCD = new EDL205001Message();
				msgCD = (EDL205001Message) newmessage;
				userPO.setAccNum(msgCD.getR01ACC());
				userPO.setSeqNum(msgCD.getE01ACC());
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("msgCD", msgCD);
				
				int screen = 0;
				if(userPO.getPurpose().equals("REPRINT"))
					screen = 3;
				else	
					screen = 5;

				procReqPrm(user, req, res, ses, screen);
			}
			

		}

	
	
	protected EDL016002Message procReqInqBasic(String acc,
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	EDL016002Message msgCD = null;
	ELEERRMessage msgError = null;
	UserPos	userPO = null;	
	boolean IsNotError = false;

	try {
		msgError = new datapro.eibs.beans.ELEERRMessage();
	  	} 
	catch (Exception ex) {
		flexLog("Error: " + ex); 
  	}

	userPO = getUserPos(req);

	String opCode = null;
	  opCode = "0004";
	
	// Send Initial data
	try
	{
		msgCD = (EDL016002Message)mc.getMessageRecord("EDL016002");
	 	msgCD.setH02USERID(user.getH01USR());
	 	msgCD.setH02PROGRM("EDL0160");
	 	msgCD.setH02TIMSYS(getTimeStamp());
	 	msgCD.setH02SCRCOD("01");
	 	msgCD.setH02OPECOD(opCode);
	 	msgCD.setE02DEAACC(acc);
	 	msgCD.setE02DEAACD("11");
	 	msgCD.setH02FLGWK1("P");
		
		msgCD.send();	
	 	msgCD.destroy();
	}		
	catch (Exception e)
	{
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}
		
	//Receive Error Message
	try
	{
	  	newmessage = mc.receiveMessage();
	  
	  	if (newmessage.getFormatName().equals("ELEERR")) {
			return null;
	  	}else if (newmessage.getFormatName().equals("EDL016002")) {
			try {
				msgCD = new datapro.eibs.beans.EDL016002Message();
		  	} catch (Exception ex) {
		  		return null; 
		  	}

			msgCD = (EDL016002Message)newmessage;
			
			return msgCD;
		}
		else{
			flexLog("Message " + newmessage.getFormatName() + " received.");
		}
	}
	catch (Exception e)
	{
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}	
	
	return null;
}

	protected EDL016001Message procActionEnterInquiry(String acc,
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	EDL016001Message msgCD = null;
	ELEERRMessage msgError = null;
	UserPos	userPO = null;	

	boolean IsNotError = false;

	try {
		msgError = new datapro.eibs.beans.ELEERRMessage();
	  	} 
	catch (Exception ex) {
		flexLog("Error: " + ex);
		return null;
  	}

	userPO = getUserPos(req);

	// Send Initial data
	try
	{   
		msgCD = (EDL016001Message)mc.getMessageRecord("EDL016001");
	 	msgCD.setH01USERID(user.getH01USR());
	 	msgCD.setH01PROGRM("EDL0160");
		flexLog("header 4 timestamp = " + getTimeStamp());
	 	msgCD.setH01TIMSYS(getTimeStamp());
	 	msgCD.setH01SCRCOD("01");
	 	msgCD.setH01OPECOD("0002");
	 	msgCD.setE01DEAACD("11");
		msgCD.setE01DEAACC(acc);
		msgCD.setH01FLGWK1("P");
		
	}catch (Exception e)	{
	 	  msgCD.setE01DEAACC("0");
		  flexLog(" error " + e);
		  flexLog("Certificate Error Sent");
		  return null;
	}
		flexLog("Send command");
		msgCD.send();	
		flexLog("Destroy command");
	 	msgCD.destroy();
	//Receive Error Message
	try
	{
	  	newmessage = mc.receiveMessage();
	  
	  	if (newmessage.getFormatName().equals("ELEERR")) {
			return null; 
		  }

		else if (newmessage.getFormatName().equals("EDL016001")) {
			try {
				msgCD = new datapro.eibs.beans.EDL016001Message();
		  	} catch (Exception ex) {
				flexLog("Error: " + ex);
				return null;
		  	}

			msgCD = (EDL016001Message)newmessage;
			return msgCD;
			
		}
		else
			flexLog("Message " + newmessage.getFormatName() + " received.");

	  	return null;
	}
	catch (Exception e)
	{
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}	

}

	
	
	public void addContentToPDF1(EDL205001Message msgToSend, EDL016001Message msgbal, EDL016002Message msgbas, JBObjList listTitulares, HttpServletRequest req, HttpServletResponse res
			) throws IOException, DocumentException{
		
		String rutaPlantilla = req.getServletContext().getRealPath("reports/PapelValorCDT.pdf");
		PdfReader reader = new PdfReader(rutaPlantilla); // input PDF
		
		ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
		
        PdfStamper stamper = new PdfStamper(reader,baosPDF); // output PDF
        BaseFont bh = BaseFont.createFont(
                BaseFont.HELVETICA_BOLD, BaseFont.CP1252, BaseFont.NOT_EMBEDDED); // set font
        BaseFont bf = BaseFont.createFont(
                BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED); // set font

        for (int i=1; i<=reader.getNumberOfPages(); i++){

            PdfContentByte over = stamper.getOverContent(i);
            
//            over.beginText();
//            over.setFontAndSize(bh, 12);    // set font and size
//            over.setTextMatrix(272, 340);   // set x,y position (0,0 is at the bottom left)
//            over.showText(msgToSend.getE01REF());  // set text
//            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(270, 705);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgToSend.getE01ACC());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(35, 680);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01BRNDSC());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 8);    // set font and size
            over.setTextMatrix(170, 670);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEAODD()+"          "+msgbal.getE01DEAODM()+"         "+msgbal.getE01DEAODY()+"  " 
            +"        "+msgbal.getE01DEAMDD()+"           "+msgbal.getE01DEAMDM()+"         "+msgbal.getE01DEAMDY());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 8);    // set font and size
            over.setTextMatrix(385, 670);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEAOAM()+"***");  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 8);    // set font and size
            over.setTextMatrix(490, 670);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgToSend.getE01REF());  // set text
            over.endText();

//            over.beginText();
//            over.setFontAndSize(bf, 8);    // set font and size
//            over.setTextMatrix(122, 420);   // set x,y position (0,0 is at the bottom left)
//            over.showText("PROTECTOR ..");  // set text
//            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 8);    // set font and size
            over.setTextMatrix(35, 590);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01LETAMT());  // set text
            over.endText();
            
            // - Begin - Beneficiario(s)
            if(listTitulares == null || listTitulares.isEmpty()){
            	over.beginText();
            	over.setFontAndSize(bf, 8);    // set font and size
            	over.setTextMatrix(36, 555);   // set x,y position (0,0 is at the bottom left)
            	over.showText(msgbal.getE01CUSNA1());  // set text
            	over.endText();
            
            	over.beginText();
            	over.setFontAndSize(bf, 8);    // set font and size
            	over.setTextMatrix(430, 555);   // set x,y position (0,0 is at the bottom left)
            	over.showText(msgbal.getE01CUSIDN());  // set text
            	over.endText();
            }else{
            	int pk = 555;
            	ESD400001Message msgList = null; 
            	Iterator iterator = listTitulares.listIterator();
            	while (iterator.hasNext()) {
					msgList = (ESD400001Message) iterator.next();
					over.beginText();
	            	over.setFontAndSize(bf, 6);    // set font and size
	            	over.setTextMatrix(36, pk);   // set x,y position (0,0 is at the bottom left)
	            	over.showText(msgList.getD01NA1());  // set text
	            	over.endText();
	            
	            	over.beginText();
	            	over.setFontAndSize(bf, 6);    // set font and size
	            	over.setTextMatrix(430, pk);   // set x,y position (0,0 is at the bottom left)
	            	over.showText(msgList.getE01IDN());  // set text
	            	over.endText();
	            	
	            	pk-=10;
            	}
            }	
            // - end Beneficiario(s)
            over.beginText();
            over.setFontAndSize(bf, 8);    // set font and size
            over.setTextMatrix(36, 480);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEAFRT());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 8);    // set font and size
            over.setTextMatrix(120, 480);   // set x,y position (0,0 is at the bottom left)
            if(msgbas.getE02DEAFTB().equals(null) || msgbas.getE02DEAFTB().equals(""))
            	over.showText(msgbas.getE02DEARTE());  // set text
            else{
            	if(msgbas.getE02FLGFLT().equals("2")){
            		over.showText(msgbas.getE02DEARTX());
            	}else{
            		over.showText(msgbas.getE02DEARTE());
            	}
            }
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 8);    // set font and size
            over.setTextMatrix(205, 480);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEASPR());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 8);    // set font and size
            over.setTextMatrix(280, 480);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01NOWRTE());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 8);    // set font and size
            over.setTextMatrix(350, 480);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEATRM()+"***");  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 8);    // set font and size
            over.setTextMatrix(420, 480);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbas.getE02TYPTBL());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 8);    // set font and size
            over.setTextMatrix(495, 480);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbas.getE02DEAREF());  // set text
            over.endText();
            
        }
        
        stamper.close();
        
		StringBuffer sbFilename = new StringBuffer();
		String fn = com.datapro.generic.tool.Util.getTimestamp().toString();
		fn = Util.replace(fn,":", "-");
		fn = Util.replace(fn,".", "-");
		sbFilename.append(fn);
		sbFilename.append(".pdf");
		
		res.setHeader("Cache-Control", "max-age=30");
		res.setContentType("application/pdf");

		StringBuffer sbContentDispValue = new StringBuffer();
		sbContentDispValue.append("inline");
		sbContentDispValue.append("; filename=");
		sbContentDispValue.append(sbFilename);
		
		res.setHeader("Content-disposition", sbContentDispValue.toString());
		res.setContentLength(baosPDF.size());
		
		ServletOutputStream sos = res.getOutputStream();
		baosPDF.writeTo(sos);
		sos.flush();
		sos.close();
        
	}

public void addContentToPDF2(EDL205001Message msgToSend, EDL016001Message msgbal, EDL016002Message msgbas, HttpServletRequest req, HttpServletResponse res) throws IOException, DocumentException{
		
		String rutaPlantilla = req.getServletContext().getRealPath("reports/CondicionesCDT.pdf");
		PdfReader reader = new PdfReader(rutaPlantilla); // input PDF
		ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
		PdfStamper stamper = new PdfStamper(reader,baosPDF); // output PDF
        BaseFont bf = BaseFont.createFont(
                BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED); // set font

        for (int i=1; i<=reader.getNumberOfPages(); i++){

            PdfContentByte over = stamper.getOverContent(i);
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(215, 658);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01CUSNA1());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(440, 658);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01CUSIDN());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(130, 640);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEAACC());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(300, 640);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEAODD()+"/"+msgbal.getE01DEAODM()+"/"+msgbal.getE01DEAODY());
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(470, 640);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEAMDD()+"/"+msgbal.getE01DEAMDM()+"/"+msgbal.getE01DEAMDY());
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(135, 625);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEAOAM()+"***");  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(245, 625);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEABAS()+"/"+msgbal.getE01DEABAS());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(368, 625);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEASPR());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(440, 625);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEATRM()+"***");  // set text
            over.endText();
            
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(154, 608);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbas.getE02TYPTBL());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(80, 555);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEAMDD()+"/"+msgbal.getE01DEAMDM()+"/"+msgbal.getE01DEAMDY());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(150, 555);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01NOWRTE());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(210, 555);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01MATINT()+"***");  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(285, 555);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01TOTRET());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(345, 555);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01TOTTAX());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(415, 555);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01DEASPR());  // set text
            over.endText();
            
            over.beginText();
            over.setFontAndSize(bf, 7);    // set font and size
            over.setTextMatrix(475, 555);   // set x,y position (0,0 is at the bottom left)
            over.showText(msgbal.getE01FUTNET()+"***");  // set text
            over.endText();
               
        }
        stamper.close();
        
        StringBuffer sbFilename = new StringBuffer();
		String fn = com.datapro.generic.tool.Util.getTimestamp().toString();
		fn = Util.replace(fn,":", "-");
		fn = Util.replace(fn,".", "-");
		sbFilename.append(fn);
		sbFilename.append(".pdf");
		
		res.setHeader("Cache-Control", "max-age=30");
		res.setContentType("application/pdf");

		StringBuffer sbContentDispValue = new StringBuffer();
		sbContentDispValue.append("inline");
		sbContentDispValue.append("; filename=");
		sbContentDispValue.append(sbFilename);
		
		res.setHeader("Content-disposition", sbContentDispValue.toString());
		res.setContentLength(baosPDF.size());
		
		ServletOutputStream sos = res.getOutputStream();
		baosPDF.writeTo(sos);
		sos.flush();
		sos.close();
        
	}

	
	// SCREEN = 1, 3 
	// Send Screen 
	//
	protected void procReqPrm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		if (req.getParameter("appcode") == null){
			userPO.setApplicationCode("11");
		}else{
			userPO.setApplicationCode(req.getParameter("appcode"));
		}
		String page = "";
		if (screen == 1) {
			page = "EDL2050_print_time_deposit.jsp";
			userPO.setPurpose("PRINT");
		} else if(screen ==3) {
			page = "EDL2050_print_time_deposit_additional.jsp";
			userPO.setPurpose("REPRINT");
		} else{
			userPO.setPurpose("ANNUL");
			page = "EDL2050_print_time_deposit_annulment.jsp";
		}
		
		ses.setAttribute("userPO", userPO);
		forwardOnSuccess(page, req, res);
		
	}


	// SCREEN = 2,4 
	// Send Detail Screen to Send Info  
	//
	protected void procReqDetail(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		String ope = "";
		 
		try {
			mp = new MessageProcessor("EDL2050");
			EDL205001Message msg = (EDL205001Message) mp.getMessageRecord("EDL205001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL2050");
			msg.setH01TIMSYS(getTimeStamp());  
			msg.setE01NUMREC("0");
			try {
				ope = req.getParameter("TIP").trim();
			} catch (Exception e) {
				// TODO: handle exception
			}
			// Get all fields in page
			try {
				super.setMessageRecord(req, msg);
			} catch (Exception e) {				
			}
			msg.setH01OPECOD("0002");
			msg.setH01SCRCOD("01");
			if(!ope.equals("C")) 
				msg.setH01FLGWK1("P");
			userPO.setHeader1(msg.getR01ACC());
			userPO.setAccNum(msg.getR01ACC());
			if(ope.equals("C")){
				msg.setH01SCRCOD("04");
			}
			// Send Message	
			mp.sendMessage(msg);
			// Receive Message
			newmessage = mp.receiveMessageRecord();

			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				userPO.setPurpose("ENTER");
				ses.setAttribute("userPO", userPO);
				forward("error_viewer.jsp", req, res);
			} else {
				
				newmessage = mp.receiveMessageRecord();
				
				EDL205001Message msgToSend = new EDL205001Message();
				msgToSend = (EDL205001Message) newmessage;
				if(!msgToSend.getH01FLGWK3().equals("N")){
				
					EDL016002Message msgbas = null;
					EDL016001Message msgbal = null;
					JBObjList listTitulares = null;
					MessageContext mc = null;
					try {
						mc = new MessageContext(super.getMessageHandler("EDL0160", req));
					
						msgbas = procReqInqBasic(msgToSend.getR01ACC(), mc, user, req, res, ses);
						msgbal = procActionEnterInquiry(msgToSend.getR01ACC(), mc, user, req, res, ses);
						listTitulares = procReqInquiryList(user, req, res, ses);
											
						if (msgbas!=null && msgbal!=null){
						
							if(ope.equals("V")){
								addContentToPDF1(msgToSend, msgbal, msgbas, listTitulares, req, res);
							}else{
								addContentToPDF2(msgToSend, msgbal, msgbas, req, res);
							
							}
						}
					
					} catch (Exception e) {
						e.printStackTrace();
						flexLog("Error: " + e);
						throw new RuntimeException("Socket Communication Error");
					
					} finally {
						if(mc != null) mc.close();
					}
				}	
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procActionAdditionalPrint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			UserPos userPO = null;
			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			 
			try {
				mp = new MessageProcessor("EDL2050");
				EDL205001Message msg = (EDL205001Message) mp.getMessageRecord("EDL205001");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				// Send Initial data
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EDL2050");
				msg.setH01TIMSYS(getTimeStamp());  
				msg.setE01NUMREC("0"); 
				msg.setH01SCRCOD("02");
				msg.setH01OPECOD("0002");
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
				msg.setR01ACC(req.getParameter("R01ACC"));
				msg.setR01UC1(req.getParameter("R01UC1"));
				userPO.setHeader1(msg.getR01ACC());
				
				// Send Message	
				mp.sendMessage(msg);
				// Receive Message
				newmessage = mp.receiveMessageRecord();

				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					userPO.setPurpose("ENTER");
					ses.setAttribute("userPO", userPO);
					forward("EDL2050_print_time_deposit_additional.jsp", req, res);
				} else {
					
					newmessage = mp.receiveMessageRecord();
					
					EDL205001Message msgToSend = new EDL205001Message();
					msgToSend = (EDL205001Message) newmessage;
					if(msgToSend.getE01STS().equals("A")){
					
						EDL016002Message msgbas = null;
						EDL016001Message msgbal = null;
						JBObjList listTitulares = null;
						MessageContext mc = null;
						try {
							mc = new MessageContext(super.getMessageHandler("EDL0160", req));
						
							msgbas = procReqInqBasic(msgToSend.getR01ACC(), mc, user, req, res, ses);
							msgbal = procActionEnterInquiry(msgToSend.getR01ACC(), mc, user, req, res, ses);
							listTitulares = procReqInquiryList(user, req, res, ses);
							
							if (msgbas!=null && msgbal!=null)
								addContentToPDF1(msgToSend, msgbal, msgbas,listTitulares, req, res);
							
						} catch (Exception e) {
							e.printStackTrace();
							flexLog("Error: " + e);
							throw new RuntimeException("Socket Communication Error");
						
						} finally {
							if(mc != null) mc.close();
						}
					}else{
						msgToSend.setSWDFIL("Pendiente de Aprobacion");
						ses.setAttribute("msgCD", msgToSend);
						forward("EDL2050_print_time_deposit_additional.jsp", req, res);
					}
				}
			} finally {
				if (mp != null)
					mp.close();
			}
		}

	
	// SCREEN = 5 
	// Send Screen 
	//
	protected void procReqAnu(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		ses.setAttribute("userPO", userPO);
		forwardOnSuccess("EDL2050_print_time_deposit_annulment.jsp", req, res);
		
	}
	
	// SCREEN = 6 
	// Send Detail Screen to Send Info  
	//
	protected void procReqDetailAnu(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		
		try {
			mp = new MessageProcessor("EDL2050");
			EDL205001Message msg = (EDL205001Message) mp.getMessageRecord("EDL205001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL2050");
			msg.setH01TIMSYS(getTimeStamp());  
			msg.setE01NUMREC("0"); 
			// Get all fields in page
			try {
				super.setMessageRecord(req, msg);
			} catch (Exception e) {				
			}
			msg.setH01OPECOD("0002");
			msg.setH01SCRCOD("03");
			msg.setR01ACC(req.getParameter("R01ACC"));
			msg.setR01REF(req.getParameter("R01REF"));
			msg.setR01UC1(req.getParameter("R01UC1"));
			
			// Send Message	
			mp.sendMessage(msg);
			// Receive Message
			newmessage = mp.receiveMessageRecord();

			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				userPO.setPurpose("ENTER");
				ses.setAttribute("userPO", userPO);
				forward("EDL2050_print_time_deposit_annulment.jsp", req, res);
			} else {
				
				newmessage = mp.receiveMessageRecord();
				EDL205001Message msgToSend = new EDL205001Message();
				msgToSend = (EDL205001Message) newmessage;
				if(msgToSend.getE01STS().equals("A")){
					ses.setAttribute("cdAnula", msgToSend);
					ses.setAttribute("userPO", userPO);
					forwardOnSuccess("EDL2050_print_time_deposit_annulment_confirm.jsp", req, res);
				}else{
					msgToSend.setSWDFIL("Pendiente de Aprobacion");
					ses.setAttribute("msgCD", msgToSend);
					ses.setAttribute("userPO", userPO);
					System.out.println("papel:  /// : "+msgToSend.getR01REF());
					forwardOnSuccess("EDL2050_print_time_deposit_annulment.jsp", req, res);
				}
	  			
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected JBObjList procReqInquiryList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {
			
			String recType = "H";
			UserPos userPO = getUserPos(req);
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ESD4000", req);

				ESD400001Message msgList = (ESD400001Message) mp.getMessageRecord("ESD400001");
				msgList.setH01USR(user.getH01USR());
				msgList.setH01PGM("ESD4000");
				msgList.setH01TIM(getTimeStamp());
				msgList.setH01SCR("01");
				msgList.setH01OPE("0015");
			 	msgList.setE01SELRTP(recType);
			 	msgList.setH01WK1("I"); // inquiry
			 	
				msgList.setE01SELRAC(userPO.getAccNum());
				msgList.setE01SELRCD("A");
					
			 	mp.sendMessage(msgList);
			 	
				JBObjList list = mp.receiveMessageRecordList("H01MAS");
				if (mp.hasError(list)) {
					list = null;
				}
				
				return list;

			} finally {
				if (mp != null)	mp.close();
			}
		}


}
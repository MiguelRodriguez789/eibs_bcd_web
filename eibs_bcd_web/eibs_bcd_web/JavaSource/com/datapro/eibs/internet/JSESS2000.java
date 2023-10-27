package com.datapro.eibs.internet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.internet.beans.JBCards;
import com.datapro.eibs.internet.databeans.DC_CARDS;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS200001Message;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 * Comercial Letter Of Credit Maintenance
 */
public class JSESS2000 extends JSEIBSServlet {

    protected static final int R_ENTER_NEW_COR 		= 100;
    protected static final int R_ENTER_NEW_PER 		= 200;
    protected static final int R_ENTER_NEW_COR_N 	= 102;
    protected static final int R_ENTER_NEW_PER_N 	= 202;
    protected static final int R_ENTER_MAINT_COR 	= 110;
    protected static final int R_ENTER_MAINT_PER 	= 210;
    protected static final int R_ENTER_MAINT_COR_N 	= 112;
    protected static final int R_ENTER_MAINT_PER_N 	= 212;
    protected static final int R_STATUS 			= 300;
    protected static final int R_PASSWORD 			= 400;
    protected static final int R_PASSWORD_N 		= 402;
    protected static final int R_PASSWORD_GEN 		= 425;
    protected static final int A_SUBMIT_COR 		= 101;
    protected static final int A_SUBMIT_PER 		= 201;
    protected static final int A_STATUS 			= 301;
    protected static final int A_PASSWORD 			= 401;
    protected static final int R_USER_INQ 			= 409;
	
    protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch (screen) {
	        case R_ENTER_NEW_COR: // 'd'
	            procReqCorNew(user, req, res, session);
	            break;
	
	        case R_ENTER_NEW_PER: 
	            procReqPerNew(user, req, res, session);
	            break;
	
	        case R_ENTER_NEW_COR_N: // 'f'
	            procReqCorNewData(user, req, res, session);
	            break;
	
	        case R_ENTER_NEW_PER_N: 
	            procReqPerNewData(user, req, res, session);
	            break;
	
	        case R_ENTER_MAINT_COR: // 'n'
	            procReqCorMaint(user, req, res, session);
	            break;
	
	        case R_ENTER_MAINT_PER: 
	            procReqPerMaint(user, req, res, session);
	            break;
	
	        case R_ENTER_MAINT_COR_N: // 'p'
	            procReqCorMaintData(user, req, res, session);
	            break;
	
	        case R_ENTER_MAINT_PER_N: 
	            procReqPerMaintData(user, req, res, session);
	            break;
	
	        case R_PASSWORD: 
	            procReqPass(user, req, res, session);
	            break;
	
	        case R_PASSWORD_N: 
	            procReqPassData(user, req, res, session);
	            break;
	
	        case R_STATUS : 
	            procReqStatus(user, req, res, session);
	            break;
	
	        case R_PASSWORD_GEN: 
	            procReqPasswordGenerator(user, req, res, session);
	            break;
	
	        case A_SUBMIT_COR: // 'e'
	        case A_SUBMIT_PER: 
	            procAction(user, req, res, session);
	            break;
	
	        case R_USER_INQ: 
	            reqUserInquiry(user, req, res, session);
	            break;
	
	        default:
				forward(devPage, req, res);
	            break;
        }
	}

	private void reqUserInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("INQ");
		String pageName = "";
		String CUSID = req.getParameter("CUSID") == null ? "" : req.getParameter("CUSID").toUpperCase();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2000", req);
			ESS200001Message msgClient = (ESS200001Message) mp.getMessageRecord("ESS200001");
            msgClient.setH01USERID(user.getH01USR());
            msgClient.setH01PROGRM("ESS2000");
            msgClient.setH01TIMSYS(getTimeStamp());
            msgClient.setH01FLGWK1("I");
            msgClient.setH01OPECOD("0002");
            msgClient.setE01EUSUSR(CUSID);
			
			mp.sendMessage(msgClient);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClient = (ESS200001Message) mp.receiveMessageRecord("ESS200001");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				msgClient.setE01EUSUSR(CUSID);
				pageName = "ESS2000_User_Inquiry.jsp";
			}
	        session.setAttribute("cusdata", msgClient);
	        session.setAttribute("error", msgError);
	        session.setAttribute("userPO", userPO);
			
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procAction(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		
		ESS200001Message msgClient_old = (ESS200001Message) session.getAttribute("cusdata");
		// Verifica si el serial esta disponible
		String NewUser = req.getParameter("NEWUSER") == null ? "" : req.getParameter("NEWUSER").trim();
		String ReqCard = req.getParameter("E01EUSOPR") == null ? "" : req.getParameter("E01EUSOPR").trim();
		String CardSerial = req.getParameter("E01EUSOPP") == null ? "" : req.getParameter("E01EUSOPP").trim();
		
		String USRFLG = "";
		if ("1".equals(req.getParameter("E01EUSCTY"))) {
			USRFLG = "C";
		} else if ("2".equals(req.getParameter("E01EUSCTY"))) {
			USRFLG = "U";
		} else {
			throw new ServletException("Undefined client type.");
		}
		
		JBCards cardbean = new JBCards();
		String pageName = "";
		ELEERRMessage msgError = new ELEERRMessage();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2000", req);
			ESS200001Message msgClient = (ESS200001Message) mp.getMessageRecord("ESS200001");
			msgClient.setH01USERID(user.getH01USR());
			msgClient.setH01PROGRM("ESD200001");
			msgClient.setH01TIMSYS(getTimeStamp());
			msgClient.setH01FLGWK1(USRFLG);
			msgClient.setH01OPECOD("0005");
			
            setMessageRecord(req, msgClient);
            
            // Verifica si se esta asignando tarjeta de vectores
            boolean assCard = ("Y".equals(NewUser) && "1".equals(ReqCard)) 
            	|| ("1".equals(ReqCard) && !msgClient.getE01EUSOPP().trim().equals(msgClient_old.getE01EUSOPP().trim())); 
            
            if (assCard) {
            	String RMsg = "";
            	if ("".equals(CardSerial)) {
            		RMsg = "Tarjeta de Vectores debe de ser ingresada";
            	} else {
            		DC_CARDS Card = cardbean.getCardSerial(CardSerial.trim());
            		
            		if (Card.getSTS() == null || !Card.getSERIAL().trim().equals(CardSerial.trim())) {
            			RMsg = "Tarjeta de Vectores : " + CardSerial.trim() + " no existe en archivo";
            		} else if (!"P".equals(Card.getSTS())) {
            			if (!"".equals(Card.getENTITYID())) {
            				RMsg = "Tarjeta de Vectores " + Card.getSERIAL().trim() + ", ya Asignada a otro usuario ( " + Card.getENTITYID() + ")"; 
            			} else {
            				RMsg = "Estatus (" + Card.getSTS() + ") Tarjeta de Vectores no permite ser asignada";
            			}	
            		}
            	}
            	if (!"".equals(RMsg)) {
					msgError.setERDS01(RMsg);	
		    		msgError.setERNU01("9001");
		    		msgError.setERRNUM("1");		    		
		    		msgError.setERDF01("E01EUSOPP");	
	                session.setAttribute("error", msgError);
		    		
		    		pageName = "C".equals(USRFLG) ? "ESS2000_client_corporate_new_data.jsp" : "ESS2000_client_personal_new_data.jsp";
            	}
            }
            
            if ("".equals(pageName)) {
            	
            	mp.sendMessage(msgClient);
    			msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
    			msgClient = (ESS200001Message) mp.receiveMessageRecord("ESS200001");
            	
                session.setAttribute("error", msgError);
                session.setAttribute("cusdata", msgClient);
                session.setAttribute("userPO", userPO);
                
    			if (mp.hasError(msgError)) {
    				pageName = "C".equals(USRFLG) ? "ESS2000_client_corporate_new_data.jsp" : "ESS2000_client_personal_new_data.jsp";
                	forward(pageName, req, res);
    			} else {
    				String screen = "";
    				if (assCard) {
    					DC_CARDS Card = cardbean.getCardSerial(CardSerial);
        			   	Card.setSTS("A");
        			   	Card.setENTITYID(msgClient.getE01EUSUSR());
        			   	Card.setUSERID(msgClient.getE01EUSENT());
        			   	Card.setMASTER(msgClient.getE01EUSENT());
        			   	Card.setUTYPE("C".equals(USRFLG) ? "1" : "2");
        			   	cardbean.setUpdateCard(Card);
    				}
    				if ("".equals(userPO.getPurpose())) {
    					screen = "C".equals(USRFLG) ? "100" : "200";
    				} else {
    					screen = "C".equals(USRFLG) ? "110" : "210";
    				}
    				if ("N".equals(msgClient.getH01FLGWK3())) {
    	            	forward("ESS2000_personal_password_new.jsp", req, res);
    				} else {
    					res.sendRedirect(srctx + "/servlet/com.datapro.eibs.internet.JSESS2000?SCREEN=" + screen);
    				}
    			}
            } else {
            	forward(pageName, req, res);
            }
            
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqPasswordGenerator(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2000", req);
			ESS200001Message msgClient = (ESS200001Message) mp.getMessageRecord("ESS200001");
			msgClient.setH01USERID(user.getH01USR());
			msgClient.setH01PROGRM("ESS200001");
			msgClient.setH01TIMSYS(getTimeStamp());
			msgClient.setH01OPECOD("0099");
			
            setMessageRecord(req, msgClient);
            
			mp.sendMessage(msgClient);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClient = (ESS200001Message) mp.receiveMessageRecord("ESS200001");
			
            session.setAttribute("error", msgError);
            
			if (mp.hasError(msgError)) {
				forward("ESS2000_personal_password_generated.jsp", req, res);
			} else {
				ByteArrayOutputStream baosPDF = null;
				try {
					baosPDF = generatePDFDocumentBytes(session, req, res,
							msgClient.getE01EUSUSR(), msgClient.getE01EUSPAS(),
							msgClient.getE01EUSACP());
					
		            res.setContentType("application/pdf");
		            res.setHeader("Cache-Control", "no-cache");
		            ServletOutputStream sos = res.getOutputStream();
		            baosPDF.writeTo(sos);
		            sos.flush();
		        
				} catch (DocumentException dex) {    
		            res.setContentType("text/html");
		            PrintWriter writer = res.getWriter();
		            writer.println(getClass().getName() + " caught an exception: " + dex.getClass().getName() + "<br>");
		            writer.println("<pre>");
		            dex.printStackTrace(writer);
		            writer.println("</pre>");
				} finally {
					if (baosPDF != null) baosPDF.reset();
				}
			}
		} finally {
			if (mp != null) mp.close();
		}
	}

	private ByteArrayOutputStream generatePDFDocumentBytes(HttpSession session, HttpServletRequest req, HttpServletResponse res, String user, String name, String password) throws DocumentException {
		
		ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
		Document doc = new Document(PageSize.LETTER, 36F, 36F, 36F, 36F);
		PdfWriter docWriter = null;
		try {
			docWriter = PdfWriter.getInstance(doc, baosPDF);
			
			Font normalFont = FontFactory.getFont("Arial", 12F, 0);
            Font normalFont11 = FontFactory.getFont("Arial", 14F, 0);
			
            Paragraph NOMBRE = new Paragraph( "   " + name, normalFont);
            Paragraph CLAVE = new Paragraph(password + "      .", normalFont11);
            
            doc.open();
            
            docWriter.addJavaScript("var pp=this.getPrintParams();", false);
            docWriter.addJavaScript("this.print(pp);", false);
            
            Table table = new Table(1, 1);
            Cell cell = new Cell("");
            Cell cellB = new Cell("");
            table.setBorderWidth(0.0F);
            table.setCellsFitPage(true);
            table.setPadding(0.0F);
            table.setSpacing(0.0F);
            table.setAlignment(6);
            table.setWidth(80F);
            cellB = new Cell("");
            cellB.setHorizontalAlignment(0);
            cellB.setVerticalAlignment(6);
            cellB.setBorder(0);
            table.addCell(cellB);
            table.addCell(cellB);              
            cell = new Cell(CLAVE);
            cell.setHorizontalAlignment(2);
            cell.setVerticalAlignment(6);
            cell.setBorder(0);
            table.addCell(cell);            
            table.addCell(cellB);
            table.addCell(cellB);
            table.addCell(cellB);
            table.addCell(cellB);
            cell = new Cell(NOMBRE);
            cell.setHorizontalAlignment(0);
            cell.setVerticalAlignment(4);
            cell.setBorder(0);
            table.addCell(cell);
            
            doc.add(table);
            
			return baosPDF;
		} catch (DocumentException e) {
            baosPDF.reset();
            throw e;
		} finally {
            if (doc != null) doc.close();
            if (docWriter != null) docWriter.close();
            if (baosPDF.size() < 1) throw new DocumentException("document has " + baosPDF.size() + " bytes");
		}
	}

	private void procReqStatus(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ESS2000_client_corporate_new.jsp", req, res);
	}

	private void procReqPassData(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String CUSID = req.getParameter("CUSID") == null ? "" : req.getParameter("CUSID").toUpperCase();
		ESS200001Message cusdata = new ESS200001Message();
		cusdata.setE01EUSUSR(CUSID);
		session.setAttribute("cusdata", cusdata);
		forward("ESS2000_client_change_password_data.jsp", req, res);
	}

	private void procReqPass(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ESS2000_client_change_password.jsp", req, res);
	}

	private void procReqPerMaintData(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("MAINT");
		String pageName = "";
		String CUSID = req.getParameter("CUSID") == null ? "" : req.getParameter("CUSID").toUpperCase();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2000", req);
			ESS200001Message msgClient = (ESS200001Message) mp.getMessageRecord("ESS200001");
            msgClient.setH01USERID(user.getH01USR());
            msgClient.setH01PROGRM("ESS2000");
            msgClient.setH01TIMSYS(getTimeStamp());
            msgClient.setH01FLGWK1("U");
            msgClient.setH01OPECOD("0002");
            msgClient.setE01EUSUSR(CUSID);
			
			mp.sendMessage(msgClient);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClient = (ESS200001Message) mp.receiveMessageRecord("ESS200001");
			
			if (mp.hasError(msgError)) {
				pageName = "ESS2000_client_personal_maint.jsp";
			} else {
				msgClient.setE01EUSUSR(CUSID);
				pageName = "ESS2000_client_personal_new_data.jsp";
			}
	        session.setAttribute("cusdata", msgClient);
	        session.setAttribute("error", msgError);
	        session.setAttribute("userPO", userPO);
			
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqCorMaintData(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("MAINT");
		String pageName = "";
		String CUSID = req.getParameter("CUSID") == null ? "" : req.getParameter("CUSID").toUpperCase();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2000", req);
			ESS200001Message msgClient = (ESS200001Message) mp.getMessageRecord("ESS200001");
            msgClient.setH01USERID(user.getH01USR());
            msgClient.setH01PROGRM("ESS2000");
            msgClient.setH01TIMSYS(getTimeStamp());
            msgClient.setH01FLGWK1("C");
            msgClient.setH01OPECOD("0002");
            msgClient.setE01EUSUSR(CUSID);
			
			mp.sendMessage(msgClient);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClient = (ESS200001Message) mp.receiveMessageRecord("ESS200001");
			
			if (mp.hasError(msgError)) {
				pageName = "ESS2000_client_corporate_maint.jsp";
			} else {
				msgClient.setE01EUSUSR(CUSID);
				pageName = "ESS2000_client_corporate_new_data.jsp";
			}
	        session.setAttribute("cusdata", msgClient);
	        session.setAttribute("error", msgError);
	        session.setAttribute("userPO", userPO);
			
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqPerMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ESS2000_client_personal_maint.jsp", req, res);
	}

	private void procReqCorMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ESS2000_client_corporate_maint.jsp", req, res);
	}

	private void procReqPerNewData(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("");
		String pageName = "";
		String CUSID = req.getParameter("CUSID") == null ? "" : req.getParameter("CUSID").toUpperCase();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2000", req);
			ESS200001Message msgClient = (ESS200001Message) mp.getMessageRecord("ESS200001");
            msgClient.setH01USERID(user.getH01USR());
            msgClient.setH01PROGRM("ESS2000");
            msgClient.setH01TIMSYS(getTimeStamp());
            msgClient.setH01FLGWK1("U");
            msgClient.setH01OPECOD("0003");
            msgClient.setE01EUSUSR(CUSID);
			
			mp.sendMessage(msgClient);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClient = (ESS200001Message) mp.receiveMessageRecord("ESS200001");
			
			if (mp.hasError(msgError)) {
				pageName = "ESS2000_client_personal_new.jsp";
			} else {
				msgClient.setE01EUSUSR(CUSID);
				pageName = "ESS2000_client_personal_new_data.jsp";
			}
	        session.setAttribute("cusdata", msgClient);
	        session.setAttribute("error", msgError);
	        session.setAttribute("userPO", userPO);
			
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqCorNewData(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("");
		String pageName = "";
		String CUSID = req.getParameter("CUSID") == null ? "" : req.getParameter("CUSID").toUpperCase();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2000", req);
			ESS200001Message msgClient = (ESS200001Message) mp.getMessageRecord("ESS200001");
            msgClient.setH01USERID(user.getH01USR());
            msgClient.setH01PROGRM("ESS2000");
            msgClient.setH01TIMSYS(getTimeStamp());
            msgClient.setH01FLGWK1("C");
            msgClient.setH01OPECOD("0003");
            msgClient.setE01EUSUSR(CUSID);
			
			mp.sendMessage(msgClient);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClient = (ESS200001Message) mp.receiveMessageRecord("ESS200001");
			
			if (mp.hasError(msgError)) {
				pageName = "ESS2000_client_corporate_new.jsp";
			} else {
				msgClient.setE01EUSUSR(CUSID);
				pageName = "ESS2000_client_corporate_new_data.jsp";
			}
	        session.setAttribute("cusdata", msgClient);
	        session.setAttribute("error", msgError);
	        session.setAttribute("userPO", userPO);
			
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqPerNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("cusdata", new ESS200001Message());
		forward("ESS2000_client_personal_new.jsp", req, res);
	}

	private void procReqCorNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ESS2000_client_corporate_new.jsp", req, res);
	}

}

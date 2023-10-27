package datapro.eibs.products;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.PdfWriter;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EOF011501Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ETL051001Message;
import datapro.eibs.beans.EWD0120DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.tools.pdf.XMLPDFDocument;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEOF0115P extends JSEIBSServlet {

	// certificate of deposit
	protected static final int R_BASIC = 1;
	protected static final int A_BASIC = 2;
	protected static final int R_LIST_HELP = 3;
	protected static final int R_LIST_LEDGER = 5;
	protected static final int R_LIST_PRINT = 7;
	protected static final int R_CHANGE_NUMBER = 9;
	protected static final int A_CHANGE_NUMBER = 10;
	// entering options
	protected static final int R_LIST_PENDING = 100;
	protected static final int R_LIST_PENDING_SEL = 110;
	protected static final int R_LIST_PENDING_MULT_SEL = 120;
	protected static final int R_ENTER_PRINT = 300;
	protected static final int A_LIST_PENDING = 200;
	protected static final int A_ENTER_PRINT = 400;
	protected static final int R_MULTIPLE_PRINT = 500;
	protected static final int A_MULTIPLE_PRINT = 600;
	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_LIST_HELP:
				procReqListHelp(user, req, res, session);
				break;
			case R_LIST_LEDGER:
				procReqListLedger(user, req, res, session);
				break;
			case R_LIST_PRINT:
				procActionPrint(user, req, res, session);
				break;
			case A_BASIC:
				procActionBasic(user, req, res, session);
				break;
			case R_LIST_PENDING:
				procReqListPending(user, req, res, session);
				break;
			case R_LIST_PENDING_SEL:
			case R_LIST_PENDING_MULT_SEL:	
				procReqOFEnterSearch(user, req, res, session, screen);
				break;
			case R_ENTER_PRINT:
				procReqEnterPrint(user, req, res, session);
				break;
			case A_ENTER_PRINT:
				procActionEnterPrint(user, req, res, session);
				break;
			case A_LIST_PENDING:
				procActionPending(user, req, res, session);
				break;
			case R_MULTIPLE_PRINT:
				procReqMultiplePrint(user, req, res, session);
				break;
			case A_MULTIPLE_PRINT:
				procActionMultiPrint(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionMultiPrint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		String[] checksToPrint = req.getParameterValues("ACCNUM");
		String[] params = new String[2];
		XMLPDFDocument xmlPdf = null;
		ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
		EOF011501Message msgOffChk = null;
		MessageProcessor mp = null;
		boolean err = false;
		try {
			mp = getMessageProcessor("EOF0115", req);
			boolean firstTime = true;
			for (int k = 0; k < 1; k++) {
				msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501", user.getH01USR(), "0002");
				msgOffChk.setH01SCRCOD("01");
				msgOffChk.setH01FLGWK1("P");
				msgOffChk.setH01FLGWK2("S");
				if (userPO.getHeader1().equals("300")) {
	            	msgOffChk.setH01FLGWK2("R");
	            	msgOffChk.setE01OFMCKN(userPO.getIdentifier());
					msgOffChk.setE01OFMCCY(userPO.getCurrency());
	            }else{
	            	params = checksToPrint[k].split("_");
	            	msgOffChk.setE01OFMCKN(params[0]);
	            	msgOffChk.setE01OFMCCY(params[1]);
	            }
				
				mp.sendMessage(msgOffChk);
				
				JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
				if (mp.hasError(list)) {
					ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
					if (userPO.getHeader1().equals("300"))
						flexLog("Error on check: "+userPO.getIdentifier()+"-"+userPO.getCurrency()+"="+ msgError.getERDF01()+" "+msgError.getERDR01()+" "+ msgError.getERNU01()+" "+msgError.getERDS01());
					else
						flexLog("Error on check: "+params[0]+"-"+params[1]+"="+ msgError.getERDF01()+" "+msgError.getERDR01()+" "+ msgError.getERNU01()+" "+msgError.getERDS01());
					try {
						session.setAttribute("error", mp.getError(list));
						forward("EOF0115_of_chk_print_list.jsp", req, res);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					err = true;
					break;
				} else {
					list.initRow();
					JBObjList beanList = new JBObjList();
					while (list.getNextRow()) {
						MessageRecord newmessage = (MessageRecord) list.getRecord();
						if (newmessage.getFormatName().equals("EOF011501")) {
							msgOffChk = (EOF011501Message) newmessage;
						} else {
							EWD0120DSMessage msgList = (EWD0120DSMessage) newmessage;
							beanList.addRow(msgList);
						}
					}	
					beanList.setShowNext(list.getShowNext());
					if (firstTime) {
						firstTime = false;
						xmlPdf = openDocument(req, user, msgOffChk, beanList, baosPDF, false);
						System.out.println("after opening baosPDF length: " + baosPDF.size());
					} else {
						addPDFPage(req, user, msgOffChk, beanList, xmlPdf);
						System.out.println("after new page, baosPDF length: " + baosPDF.size());
					}
					
				}
			}
			if (!err){
				if (xmlPdf != null && xmlPdf.getPDFDoc().isOpen()) 
					xmlPdf.getPDFDoc().close(); 
				System.out.println(" baosPDF length: " + baosPDF.size());
			
				StringBuffer sbFilename = new StringBuffer();
				sbFilename.append(msgOffChk.getE01OFMCKN());
				sbFilename.append(System.currentTimeMillis());
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
			}		
		} catch (DocumentException e) {
			e.printStackTrace();
			throw new RuntimeException("Socket Communication Error");
		} finally {
			if (xmlPdf != null) {
				xmlPdf.close();
			}
			if (mp != null)	mp.close();
		}
	}

	protected void addPDFPage(HttpServletRequest req, ESS0030DSMessage user,
			EOF011501Message msgOffChk, JBObjList beanList,
			XMLPDFDocument xmlPdf) {
		
		try {
			msgOffChk.setE01OFMCKN(Util.addLeftChar('0', 9, msgOffChk.getE01OFMCKN()));

			xmlPdf.getPDFDoc().newPage();
			if (msgOffChk.getE01SELTIP().equals("3")) {
				// GIROS
				xmlPdf.readXMLDoc(getGiroTemplate());
			} else {
				// CHEQUES OFICIALES
				xmlPdf.readXMLDoc(getCheckTemplate());
			}

			xmlPdf.setPDFcb(xmlPdf.getPdfWriter(), beanList, user,	msgOffChk);
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
			flexLog("Exception PDF " + ex);
		}
	}
	
	protected String getGiroTemplate() {
		flexLog("JSEOF0115P --> print giro");
		return "printformat.giro.xml";
	}

	protected String getCheckTemplate() {
		flexLog("JSEOF0115P --> print official check");
		return "printformat.check.xml";
	}

	protected XMLPDFDocument openDocument(HttpServletRequest req,
			ESS0030DSMessage user, EOF011501Message msgOffChk,
			JBObjList beanList, ByteArrayOutputStream baosPDF, boolean b) throws DocumentException {
		
		XMLPDFDocument XMLPDFdoc = null;
		try {
			msgOffChk.setE01OFMCKN(Util.addLeftChar('0', 9, msgOffChk.getE01OFMCKN()));
			msgOffChk.setE01OFMBD2(msgOffChk.getE01OFMAMT());
			
			XMLPDFdoc = new XMLPDFDocument();
			if (msgOffChk.getE01SELTIP().equals("3")) {
				// GIROS
				XMLPDFdoc.readXMLDoc(getGiroTemplate());
			} else {
				// CHEQUES OFICIALES
				XMLPDFdoc.readXMLDoc(getCheckTemplate());
			}

			XMLPDFdoc.setPDFDocumentPage();
			XMLPDFdoc.setPDFDocumentHeader();
			com.lowagie.text.Document doc = XMLPDFdoc.getPDFDoc();
			System.out.println("Page size: " + doc.getPageSize().getWidth() + ", "	+ doc.getPageSize().getHeight());
			doc.addCreator(msgOffChk.getE01OFMCKN());
			PdfWriter docWriter = null;
			docWriter = PdfWriter.getInstance(doc, baosPDF);
			doc.open();
			XMLPDFdoc.setPdfWriter(docWriter);
            System.out.println("Translist size: "+ beanList.size() );
			XMLPDFdoc.setPDFcb(docWriter, beanList, user, msgOffChk);
		} catch (IOException ex) {
			System.err.println(ex.getMessage());
		} catch (DocumentException dex) {
			baosPDF.reset();
			throw dex;
		}

		return XMLPDFdoc;
	}

	private void procReqMultiplePrint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("EOF0115_multi_chk_print.jsp", req, res);
	}
	
	private void procActionPending(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501", user.getH01USR(), "0002");
			msgOffChk.setH01SCRCOD("01");
			msgOffChk.setH01FLGWK1("I");
			msgOffChk.setE01OFMCKN(req.getParameter("E01OFMCKN") == null ? "0" : req.getParameter("E01OFMCKN"));
			msgOffChk.setE01OFMCCY(req.getParameter("E01OFMCCY") == null ? "" : req.getParameter("E01OFMCCY").toUpperCase());
			
			mp.sendMessage(msgOffChk);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
			ELEERRMessage msgError = new ELEERRMessage();
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "EOF0115_chk_off_print_inq_sel.jsp";
			} else {
				list.initRow();
				boolean firstTime = true;
				StringBuffer myRow = null;
				JBList beanList = new JBList();
				String strDebit = "";
				String strCredit = "";
				BigDecimal debit = new BigDecimal("0");
				BigDecimal credit = new BigDecimal("0");
				while (list.getNextRow()) {
					MessageRecord newmessage = (MessageRecord) list.getRecord();
					if (newmessage.getFormatName().equals("EOF011501")) {
						msgOffChk = (EOF011501Message) newmessage;
						userPO.setIdentifier(msgOffChk.getE01OFMCKN());
						userPO.setCurrency(msgOffChk.getE01OFMCCY());
						userPO.setHeader5(msgOffChk.getE01OFMEMM());
						userPO.setHeader6(msgOffChk.getE01OFMEMD());
						userPO.setHeader7(msgOffChk.getE01OFMEMY());
						userPO.setHeader8(msgOffChk.getE01OFMAMT());
						userPO.setHeader9(msgOffChk.getE01OFMBNF());
						userPO.setHeader10(msgOffChk.getE01OFMBN1());
						userPO.setHeader15(msgOffChk.getE01OFMBN2());
						userPO.setHeader11(msgOffChk.getE01LETAMT());
						userPO.setHeader12(msgOffChk.getE01OFMCO1());
						userPO.setHeader13(msgOffChk.getE01OFMCO2());
						userPO.setHeader14(msgOffChk.getE01OFMCO3());
						userPO.setHeader19(msgOffChk.getE01OFMAPV());
						userPO.setHeader20(msgOffChk.getE01OFMBTH());
						userPO.setHeader21(user.getE01DTF());
						userPO.setHeader22(user.getE01LAN());
					} else {
						EWD0120DSMessage msgList = (EWD0120DSMessage) newmessage;;
						if (firstTime) {
							firstTime = false;
							beanList.setFirstRec(Integer.parseInt(msgList.getE01NUMREC()));
						}
						if (msgList.getE01WRKDCC().equals("D")) {
							debit = debit.add(msgList
									.getBigDecimalE01WRKAMT());
							strDebit = Util.fcolorCCY(msgList
									.getE01WRKAMT());
							strCredit = "&nbsp;";
						} else if (msgList.getE01WRKDCC().equals("C")) {
							credit = credit.add(msgList
									.getBigDecimalE01WRKAMT());
							strDebit = "&nbsp;";
							strCredit = Util.fcolorCCY(msgList
									.getE01WRKAMT());
						}
						
						if(msgList.getE01WRKDCC().equals("T")){
                            strDebit = Util.fcolorCCY(msgList.getE01WRKTDB());
                            strCredit = Util.fcolorCCY(msgList.getE01WRKTDC());
                        }
						if (!msgList.getE01WRKDCC().equals("T")) {
							myRow = new StringBuffer("<TR>");
							myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKBNK())
								+ "</TD>");
							myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKBRN())
								+ "</TD>");
							myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKCCY())
								+ "</TD>");
							myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKGLN())
								+ "</TD>");
							myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKACC())
								+ "</TD>");
							myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKCCN())
								+ "</TD>");
							myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKCDE())
								+ "</TD>");
							myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKTDS())
								+ "</TD>");
							myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strDebit
								+ "</TD>");
							myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strCredit
								+ "</TD>");
							myRow.append("</TR>");
						}else{
                            myRow = new StringBuffer("<TR>");
                            myRow.append("<TH NOWRAP ALIGN=center>"
									+ "" + "</TH>");
							myRow.append("<TH NOWRAP ALIGN=center>"
									+ "" + "</TH>");
							myRow.append("<TH NOWRAP ALIGN=center>"
									+ "" + "</TH>");
							myRow.append("<TH NOWRAP ALIGN=left>"
									+ "" + "</TH>");
							myRow.append("<TH NOWRAP ALIGN=RIGHT>"
									+ "" + "</TH>");
							myRow.append("<TH NOWRAP ALIGN=RIGHT>"
									+ "" + "</TH>");
							myRow.append("<TH NOWRAP ALIGN=center>"
									+ "" + "</TH>");
							myRow.append("<TH NOWRAP ALIGN=left>"
									+ Util.formatCell(msgList
											.getE01WRKTDS()) + "</TH>");
							myRow.append("<TH NOWRAP ALIGN=RIGHT>"
									+ strDebit + "</TH>");
							myRow.append("<TH NOWRAP ALIGN=RIGHT>"
									+ strCredit + "</TH>");										
                            myRow.append("</TR>");
                        }
						beanList.addRow("", myRow.toString());
					}	
				}
				beanList.setShowNext(list.getShowNext());
				session.setAttribute("ledList", beanList);
				pageName = "EOF0115_of_chk_print.jsp";
			}	
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);

			forward(pageName, req, res);	
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionEnterPrint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501", user.getH01USR(), "0002");
			msgOffChk.setH01SCRCOD("01");
			msgOffChk.setH01FLGWK1("P");
			msgOffChk.setH01FLGWK2("R");
			msgOffChk.setE01OFMCKN(req.getParameter("E01OFMCKN") == null ? "0" : req.getParameter("E01OFMCKN"));
			msgOffChk.setE01OFMCCY(req.getParameter("E01OFMCCY") == null ? "" : req.getParameter("E01OFMCCY").toUpperCase());
			
			mp.sendMessage(msgOffChk);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
			ELEERRMessage msgError = new ELEERRMessage();
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "EOF0115_of_chk_enter_print.jsp";
			} else {
				list.initRow();
				boolean firstTime = true;
				StringBuffer myRow = null;
				JBList beanList = new JBList();
				String strDebit = "";
				String strCredit = "";
				BigDecimal debit = new BigDecimal("0");
				BigDecimal credit = new BigDecimal("0");
				while (list.getNextRow()) {
					MessageRecord newmessage = (MessageRecord) list.getRecord();
					if (newmessage.getFormatName().equals("EOF011501")) {
						msgOffChk = (EOF011501Message) newmessage;
						msgOffChk.setE01OFMCKN(datapro.eibs.master.Util.addLeftChar('0', 9, msgOffChk.getE01OFMCKN()));
						userPO.setIdentifier(msgOffChk.getE01OFMCKN());
						userPO.setCurrency(msgOffChk.getE01OFMCCY());
						userPO.setHeader5(msgOffChk.getE01OFMEMM());
						userPO.setHeader6(msgOffChk.getE01OFMEMD());
						userPO.setHeader7(msgOffChk.getE01OFMEMY());
						userPO.setHeader8(msgOffChk.getE01OFMAMT());
						userPO.setHeader9(msgOffChk.getE01OFMBNF());
						userPO.setHeader10(msgOffChk.getE01OFMBN1());
						userPO.setHeader15(msgOffChk.getE01OFMBN2());
						userPO.setHeader11(msgOffChk.getE01LETAMT());
						userPO.setHeader12(msgOffChk.getE01OFMCO1());
						userPO.setHeader13(msgOffChk.getE01OFMCO2());
						userPO.setHeader14(msgOffChk.getE01OFMCO3());
						userPO.setHeader19(msgOffChk.getE01OFMAPV());
						userPO.setHeader20(msgOffChk.getE01OFMBTH());
						userPO.setHeader21(user.getE01DTF());
						userPO.setHeader22(user.getE01LAN());
						userPO.setHeader16(msgOffChk.getE01OFMAPL());
						userPO.setHeader17(msgOffChk.getE01OFMCOM());
						userPO.setHeader18(msgOffChk.getE01OFMIVA());
						userPO.setHeader23(msgOffChk.getE01OFMCO7());
					} else {
						EWD0120DSMessage msgList = (EWD0120DSMessage) newmessage;;
						if (firstTime) {
							firstTime = false;
							beanList.setFirstRec(Integer.parseInt(msgList.getE01NUMREC()));
						}
						if (msgList.getE01WRKDCC().equals("D")) {
							debit = debit.add(msgList
									.getBigDecimalE01WRKAMT());
							strDebit = Util.fcolorCCY(msgList
									.getE01WRKAMT());
							strCredit = "&nbsp;";
						} else if (msgList.getE01WRKDCC().equals("C")) {
							credit = credit.add(msgList
									.getBigDecimalE01WRKAMT());
							strDebit = "&nbsp;";
							strCredit = Util.fcolorCCY(msgList
									.getE01WRKAMT());
						}
						
						if(msgList.getE01WRKDCC().equals("T")){
	                            strDebit = Util.fcolorCCY(msgList.getE01WRKTDB());
	                            strCredit = Util.fcolorCCY(msgList.getE01WRKTDC());
	                    }

                        if (!msgList.getE01WRKDCC().equals("T")) {
                        	myRow = new StringBuffer("<TR>");
                        	myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKBNK())
								+ "</TD>");
                        	myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKBRN())
								+ "</TD>");
                        	myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKCCY())
								+ "</TD>");
                        	myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKGLN())
								+ "</TD>");
                        	myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKACC())
								+ "</TD>");
                        	myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKCCN())
								+ "</TD>");
                        	myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKCDE())
								+ "</TD>");
                        	myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKTDS())
								+ "</TD>");
                        	myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strDebit
								+ "</TD>");
                        	myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strCredit
								+ "</TD>");
                        	myRow.append("</TR>");
						} else {
							myRow = new StringBuffer("<TR>");
							myRow.append("<TH NOWRAP ALIGN=center>" + ""
									+ "</TH>");
							myRow.append("<TH NOWRAP ALIGN=center>" + ""
									+ "</TH>");
							myRow.append("<TH NOWRAP ALIGN=center>" + ""
									+ "</TH>");
							myRow.append("<TH NOWRAP ALIGN=left>" + ""
									+ "</TH>");
							myRow.append("<TH NOWRAP ALIGN=RIGHT>" + ""
									+ "</TH>");
							myRow.append("<TH NOWRAP ALIGN=RIGHT>" + ""
									+ "</TH>");
							myRow.append("<TH NOWRAP ALIGN=center>" + ""
									+ "</TH>");
							myRow.append("<TH NOWRAP ALIGN=left>"
									+ Util.formatCell(msgList.getE01WRKTDS())
									+ "</TH>");
							myRow.append("<TH NOWRAP ALIGN=RIGHT>" + strDebit
									+ "</TH>");
							myRow.append("<TH NOWRAP ALIGN=RIGHT>" + strCredit
									+ "</TH>");
							myRow.append("</TR>");
						}
	
						beanList.addRow("", myRow.toString());
					}	
				}
				beanList.setShowNext(list.getShowNext());
				session.setAttribute("ledList", beanList);
				pageName = "EOF0115_of_chk_print.jsp";
			}	
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);

			forward(pageName, req, res);	
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqEnterPrint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		ELEERRMessage msgError = (ELEERRMessage) (session.getAttribute("error") == null ? new ELEERRMessage() : session.getAttribute("error"));
		UserPos userPO = getUserPos(req);
		userPO.setOption("OCK");
		userPO.setPurpose("PRINTER");
		userPO.setHeader1("300");
		
		
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		
		forward("EOF0115_of_chk_enter_print.jsp", req, res);	
	}

	private void procReqOFEnterSearch(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		ELEERRMessage msgError = (ELEERRMessage) (session.getAttribute("error") == null ? new ELEERRMessage() : session.getAttribute("error"));
		UserPos userPO = getUserPos(req);
		userPO.setOption("OF");
		userPO.setPurpose("INQUIRY");
		userPO.setHeader1("110");
		String redirect = (screen == R_LIST_PENDING_MULT_SEL ? "/servlet/datapro.eibs.products.JSEOF0115M" : "/servlet/datapro.eibs.products.JSEOF0115P");
		userPO.setRedirect(req.getContextPath() + redirect);
		
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		
		forward("EOF0115_chk_off_print_inq_sel.jsp", req, res);	
	}

	private void procReqListPending(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		ETL051001Message msgHeader = new ETL051001Message();
		String pageName = "";
		String pos = req.getParameter("Pos") == null ? "0" : req.getParameter("Pos");
		try {
			Integer.parseInt(pos); //Validate Integer
		} catch (Exception e) {
			pos = "0";
		}
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ETL0510", req);
			ETL051001Message msgSearch = (ETL051001Message) mp.getMessageRecord("ETL051001", user.getH01USR(), "0004");
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01FLGWK1("P");
			msgSearch.setE01NUMREC(pos);
			msgSearch.setE01SELDTY("1");
			msgSearch.setE01SELSCH("A");
			
			setMessageRecord(req, msgSearch);
			
			mp.sendMessage(msgSearch);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
			ELEERRMessage msgError = new ELEERRMessage();
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "EOF0115_of_chk_enter_print.jsp";
			} else {
				list.initRow();
				boolean firstTime = true;
				StringBuffer myRow = null;
				JBList beanList = new JBList();
				while (list.getNextRow()) {
					ETL051001Message msgList = (ETL051001Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						beanList.setFirstRec(Integer.parseInt(msgList.getE01NUMREC()));
					}
					String showRef = "enter('" + msgList.getE01OFMNCH()	+ "', '" + msgList.getE01OFMCCY() + "')";
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP><input type=\"radio\" name=\"ACCNUM\" value=\""
									+ msgList.getE01OFMNCH()
									+ "_"
									+ msgList.getE01OFMCCY()
									+ "\" "
									+ "></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\">"
							+ Util.formatCell(msgList.getE01OFMNCH())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\">"
							+ Util.formatCell(msgList.getE01OFMCCY())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\">"
							+ Util.formatCell(msgList.getE01OFMBRN())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\">"
							+ Util.formatCell(msgList.getE01OFMMCH())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\">"
							+ Util.formatCell(msgList.getE01OFMSTS())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\">"
							+ Util.formatCell(msgList.getE01OFMFTY())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef
							+ "\">"
							+ Util.formatCustomDate(user.getE01DTF(), msgList.getE01OFMIDM(),
									msgList.getE01OFMIDD(), msgList
											.getE01OFMIDY()) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\">"
							+ Util.formatCell(msgList.getE01OFMBNF())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\"><b>"
							+ Util.formatCell(msgList.getE01OFMREM().replaceFirst("^0*", ""))
							+ "</b></A>" +
								"<img src=\""+req.getContextPath()+"/images/Check.gif\"" +
								" title=\"Papel valor\" align=\"bottom\" border=\"0\">" +
								"</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}	
				beanList.setShowNext(list.getShowNext());
				session.setAttribute("msgHeader", msgHeader);
				session.setAttribute("dvList", beanList);
				pageName = "EOF0115_of_chk_print_list.jsp";
			}
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);

			forward(pageName, req, res);	
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionBasic(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		procReqListLedger(user, req, res, session);
	}

	private void procActionPrint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501", user.getH01USR(), "0002");
			msgOffChk.setH01SCRCOD("01");
			msgOffChk.setH01FLGWK1("P");
			msgOffChk.setH01FLGWK2("S");
			if (userPO.getHeader1().equals("300")) {
            	msgOffChk.setH01FLGWK2("R");
            }
			msgOffChk.setE01OFMCKN(userPO.getIdentifier());
			msgOffChk.setE01OFMCCY(userPO.getCurrency());
			
			mp.sendMessage(msgOffChk);
			
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
			ELEERRMessage msgError = new ELEERRMessage();
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "EOF0115_chk_off_print_inq_sel.jsp";
			} else {
				list.initRow();
				JBObjList beanList = new JBObjList();
				while (list.getNextRow()) {
					MessageRecord newmessage = (MessageRecord) list.getRecord();
					if (newmessage.getFormatName().equals("EOF011501")) {
						msgOffChk = (EOF011501Message) newmessage;
						session.setAttribute("offBasic", msgOffChk);
					} else {
						EWD0120DSMessage msgList = (EWD0120DSMessage) newmessage;
						beanList.addRow(msgList);
					}	
				}
				beanList.setShowNext(list.getShowNext());
				ByteArrayOutputStream baosPDF = generatePDFDocumentBytes(req, user, msgOffChk, beanList, false);

				StringBuffer sbFilename = new StringBuffer();
				sbFilename.append(msgOffChk.getE01OFMCKN());
				sbFilename.append(System.currentTimeMillis());
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
			}
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);

			forward(pageName, req, res);	
			
		} catch (DocumentException e) {
			e.printStackTrace();
			throw new RuntimeException("Socket Communication Error");
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private ByteArrayOutputStream generatePDFDocumentBytes(
			HttpServletRequest req, ESS0030DSMessage user,
			EOF011501Message msgOffChk, JBObjList beanList, boolean b) throws DocumentException, IOException {
		
		XMLPDFDocument XMLPDFdoc = null;
		com.lowagie.text.Document doc = null; 
		PdfWriter docWriter = null;
		ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
		try {
			msgOffChk.setE01OFMCKN(Util.addLeftChar('0', 9, msgOffChk.getE01OFMCKN()));
			XMLPDFdoc = new XMLPDFDocument(); 
			if (msgOffChk.getE01SELTIP().equals("3")) {
				// GIROS
				XMLPDFdoc.readXMLDoc(getGiroTemplate());
			} else{
				// CHEQUES OFICIALES
				XMLPDFdoc.readXMLDoc(getCheckTemplate());
			}

			XMLPDFdoc.setPDFDocumentHeader();
			doc = XMLPDFdoc.getPDFDoc(); 
			System.out.println("Page size: " + doc.getPageSize().getWidth()+ ", " + doc.getPageSize().getHeight());
			doc.addCreator(msgOffChk.getE01OFMCKN());
		
			docWriter =  PdfWriter.getInstance(doc, baosPDF);
			doc.open();
			
			if (req.getParameter("SCREEN").toString().equals("600")) { // Multiple Checks Printing option
				docWriter.addJavaScript("this.print(false);", false);
			}
			System.out.println("GeneratePDFDocuments...Translist size :" + beanList.size());
			XMLPDFdoc.setPDFcb(docWriter, beanList, user, msgOffChk);
			XMLPDFdoc.close();
		} catch (DocumentException dex) {
			baosPDF.reset();
			throw dex;
		} finally {
			if (doc != null) doc.close();
			if (docWriter != null) docWriter.close();
		}
		
		if (baosPDF.size() < 1) {
			throw new DocumentException("document has " + baosPDF.size() + " bytes");
		}
        System.out.println("baosPDF length: " + baosPDF.size());
		return baosPDF;
	}

	private void procReqListLedger(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) session.getAttribute("offBasic");
			msgOffChk.setH01USERID(user.getH01USR());
			msgOffChk.setH01PROGRM("EOF0115");
			msgOffChk.setH01TIMSYS(getTimeStamp());
			msgOffChk.setH01SCRCOD("01");
			msgOffChk.setH01OPECOD("0005");
			
			setMessageRecord(req, msgOffChk);
			
			mp.sendMessage(msgOffChk);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
			ELEERRMessage msgError = new ELEERRMessage();
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "EOF0115_of_chk_basic.jsp";
			} else {
				list.initRow();
				boolean firstTime = true;
				StringBuffer myRow = null;
				JBList beanList = new JBList();
				String strDebit = "";
				String strCredit = "";
				BigDecimal debit = new BigDecimal("0");
				BigDecimal credit = new BigDecimal("0");
				while (list.getNextRow()) {
					MessageRecord newmessage = (MessageRecord) list.getRecord();
					if (newmessage.getFormatName().equals("EOF011501")) {
						msgOffChk = (EOF011501Message) newmessage;
						userPO.setIdentifier(msgOffChk.getE01OFMCKN());
						userPO.setCurrency(msgOffChk.getE01OFMCCY());
						userPO.setHeader5(msgOffChk.getE01OFMEMM());
						userPO.setHeader6(msgOffChk.getE01OFMEMD());
						userPO.setHeader7(msgOffChk.getE01OFMEMY());
						userPO.setHeader8(msgOffChk.getE01OFMAMT());
						userPO.setHeader9(msgOffChk.getE01OFMBNF());
						userPO.setHeader10(msgOffChk.getE01OFMBN1());
						userPO.setHeader15(msgOffChk.getE01OFMBN2());
						userPO.setHeader11(msgOffChk.getE01LETAMT());
						userPO.setHeader12(msgOffChk.getE01OFMCO1());
						userPO.setHeader13(msgOffChk.getE01OFMCO2());
						userPO.setHeader14(msgOffChk.getE01OFMCO3());
						userPO.setHeader19(msgOffChk.getE01OFMAPV());
						userPO.setHeader20(msgOffChk.getE01OFMBTH());
						userPO.setHeader21(user.getE01DTF());
						userPO.setHeader22(user.getE01LAN());
					} else {
						EWD0120DSMessage msgList = (EWD0120DSMessage) newmessage;;
						if (firstTime) {
							firstTime = false;
							beanList.setFirstRec(Integer.parseInt(msgList.getE01NUMREC()));
						}
						if (msgList.getE01WRKDCC().equals("D")) {
							debit = debit.add(msgList
									.getBigDecimalE01WRKAMT());
							strDebit = Util.fcolorCCY(msgList
									.getE01WRKAMT());
							strCredit = "&nbsp;";
						} else if (msgList.getE01WRKDCC().equals("C")) {
							credit = credit.add(msgList
									.getBigDecimalE01WRKAMT());
							strDebit = "&nbsp;";
							strCredit = Util.fcolorCCY(msgList
									.getE01WRKAMT());
						}
						myRow = new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKBNK())
								+ "</TD>");
						myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKBRN())
								+ "</TD>");
						myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKCCY())
								+ "</TD>");
						myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKGLN())
								+ "</TD>");
						myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKACC())
								+ "</TD>");
						myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKCCN())
								+ "</TD>");
						myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKCDE())
								+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strDebit
								+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strCredit
								+ "</TD>");
						myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01WRKTDS())
								+ "</TD>");
						myRow.append("</TR>");
						beanList.addRow("", myRow.toString());
					}	
				}
				beanList.setShowNext(list.getShowNext());
				session.setAttribute("ledList", beanList);
				pageName = "EOF0115_of_chk_cont.jsp";
			}	
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);

			forward(pageName, req, res);	
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqListHelp(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		String pos = req.getParameter("Pos") == null ? "0" : req.getParameter("Pos");
		try {
			Integer.parseInt(pos); //Validate Integer
		} catch (Exception e) {
			pos = "0";
		}
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ETL0510", req);
			ETL051001Message msgSearch = (ETL051001Message) mp.getMessageRecord("ETL051001", user.getH01USR(), "0004");
			msgSearch.setH01FLGWK1("P");
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01FLGWK1("P");
			msgSearch.setE01NUMREC(pos);
			msgSearch.setE01SELDTY("1");
			msgSearch.setE01SELSCH("D");
			
			mp.sendMessage(msgSearch);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
			ELEERRMessage msgError = new ELEERRMessage();
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "EOF0115_of_chk_enter_print.jsp";
			} else {
				list.initRow();
				boolean firstTime = true;
				StringBuffer myRow = null;
				JBList beanList = new JBList();
				while (list.getNextRow()) {
					ETL051001Message msgList = (ETL051001Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						beanList.setFirstRec(Integer.parseInt(msgList.getE01NUMREC()));
					}
					String showRef = "enter('" + msgList.getE01OFMNCH()
					+ "')";
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\">"
							+ Util.formatCell(msgList.getE01OFMNCH())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\">"
							+ Util.formatCell(msgList.getE01OFMCCY())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\">"
							+ Util.formatCell(msgList.getE01OFMBRN())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\">"
							+ Util.formatCell(msgList.getE01OFMMCH())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\">"
							+ Util.formatCell(msgList.getE01OFMSTS())
							+ "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef
							+ "\">"
							+ Util.formatCustomDate( user.getE01DTF(), msgList.getE01OFMIDM(),
									msgList.getE01OFMIDD(), msgList
											.getE01OFMIDY()) + "</A></TD>");
					myRow.append("<TD NOWRAP><A HREF=\"javascript:"
							+ showRef + "\">"
							+ Util.formatCell(msgList.getE01OFMBNF())
							+ "</A></TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setShowNext(list.getShowNext());
				session.setAttribute("dvList", beanList);
				pageName = "EOF0115_of_chk_help.jsp";
			}
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);

			forward(pageName, req, res);	
		} finally {
			if (mp != null)	mp.close();
		}
	}

}

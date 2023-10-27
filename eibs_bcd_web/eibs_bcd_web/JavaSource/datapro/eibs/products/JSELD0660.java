package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (7/6/04 6:08:55 PM)
 * @author: Manuel Justo
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;

import datapro.eibs.beans.*;

import datapro.eibs.master.Util;
import datapro.eibs.tools.*;//addry

import datapro.eibs.sockets.*;
import datapro.eibs.tools.pdf.GenericXMLPDFDocument;
import datapro.eibs.tools.pdf.XMLPDFDocument;
import com.lowagie.text.DocumentException;


public class JSELD0660  extends datapro.eibs.master.SuperServlet {

	// Action 

	protected static final int R_ENTER_INQ		= 10; //para busquedas y consultas
	protected static final int A_ENTER_INQ		= 20; //para busquedas y consultas

	protected static final int A_REDIRECT_INQ		= 30; //REDIRECCIONA CONSULTA
	protected static final int A_INQUIRY 		= 500;//consultas  
	protected static final int A_PRINT_PDF 		= 600;// Imprime formulario de Habitualidad  

	protected String LangPath = "S";

	/**
	 * JSEIE00000 constructor comment.
	 */
	public JSELD0660() {
		super();
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSESS0240");

	}
	/**
	 * This method was created by David Mavilla.
	 * 
	 */

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}





	protected void procReqEnterInq(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos userPO = null;
		
		try {

			msgError = new ELEERRMessage();
			userPO = new UserPos();

			userPO.setHeader1("");
			userPO.setHeader2("");

			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		try {
			flexLog(
				"About to call Page: " + LangPath + "ELD0660_uaf_inq_enter_search.jsp");
			callPage(LangPath + "ELD0660_uaf_inq_enter_search.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}

	protected void procActionEnterInq(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELD066001Message msgList = null;
		JBList beanList = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		String params = "";
		String posi = "";
		String selfre = "";
		String selrfn = "";
		String selusr = "";
		String selacc= "";
		String selbrn= "";
		String seltyp= "";
		String selofc= "";
		String selcun= "";
		String seleid= "";
		String selfr1= "";
		String selfr2= "";
		String selfr3= "";
		String selto1= "";
		String selto2= "";
		String selto3= "";
		String lastrecord= " ";

		try {
			msgError =
				(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
					getClass().getClassLoader(),
					"datapro.eibs.beans.ELEERRMessage");
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			msgList = (ELD066001Message) mc.getMessageRecord("ELD066001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ELD0660");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
 			msgList.setH01OPECOD("0001");
 				
			try {
				msgList.setE01SELFRE(req.getParameter("E01SELFRE"));
			} catch (Exception e){
				msgList.setE01SELFRE("");
			}
			flexLog("E01SELFRE=" + req.getParameter("E01SELFRE"));
			try {
				msgList.setE01SELRFN(req.getParameter("E01SELRFN"));
			} catch (Exception e){
				msgList.setE01SELRFN("");
			}
			flexLog("E01SELRFN=" + req.getParameter("E01SELRFN"));		
			try {
				msgList.setE01SELUSR(req.getParameter("E01SELUSR"));
			} catch (Exception e){
				msgList.setE01SELUSR("");
			}
			flexLog("E01SELUSR=" + req.getParameter("E01SELUSR"));		
			try {
				msgList.setE01SELACC(req.getParameter("E01SELACC"));
			} catch (Exception e){
				msgList.setE01SELACC("");
			}
			flexLog("E01SELACC=" + req.getParameter("E01SELACC"));		
 			try {
				msgList.setE01SELBRN(req.getParameter("E01SELBRN"));
			} catch (Exception e){
				msgList.setE01SELBRN("");
			}
			flexLog("E01SELBRN=" + req.getParameter("E01SELBRN"));		
			try {
				msgList.setE01SELTYP(req.getParameter("E01SELTYP"));
			} catch (Exception e){
				msgList.setE01SELTYP("");
			}
			flexLog("E01SELTYP=" + req.getParameter("E01SELTYP"));		
			try {
				msgList.setE01SELOFC(req.getParameter("E01SELOFC"));
			} catch (Exception e){
				msgList.setE01SELOFC("");
			}
			flexLog("E01SELOFC=" + req.getParameter("E01SELOFC"));		
 			try {
				msgList.setE01SELCUN(req.getParameter("E01SELCUN"));
			} catch (Exception e){
				msgList.setE01SELCUN("");
			}
			flexLog("E01SELCUN=" + req.getParameter("E01SELCUN"));		
			try {
				msgList.setE01SELEID(req.getParameter("E01SELEID"));
			} catch (Exception e){
				msgList.setE01SELEID("");
			}
			flexLog("E01SELEID=" + req.getParameter("E01SELEID"));		
			try {
				msgList.setE01UAFFR1(req.getParameter("E01UAFFR1"));
			} catch (Exception e){
				msgList.setE01UAFFR1("");
			}
			flexLog("E01UAFFR1=" + req.getParameter("E01UAFFR1"));		
			try {
				msgList.setE01UAFFR2(req.getParameter("E01UAFFR2"));
			} catch (Exception e){
				msgList.setE01UAFFR2("");
			}
			flexLog("E01UAFFR2=" + req.getParameter("E01UAFFR2"));		
			try {
				msgList.setE01UAFFR3(req.getParameter("E01UAFFR3"));
			} catch (Exception e){
				msgList.setE01UAFFR3("");
			}
			flexLog("E01UAFFR3=" + req.getParameter("E01UAFFR3"));		
			try {
				msgList.setE01UAFTO1(req.getParameter("E01UAFTO1"));
			} catch (Exception e){
				msgList.setE01UAFTO1("");
			}
			flexLog("E01UAFTO1=" + req.getParameter("E01UAFTO1"));		
			try {
				msgList.setE01UAFTO2(req.getParameter("E01UAFTO2"));
			} catch (Exception e){
				msgList.setE01UAFTO2("");
			}
			flexLog("E01UAFTO2=" + req.getParameter("E01UAFTO2"));		
			try {
				msgList.setE01UAFTO3(req.getParameter("E01UAFTO3"));
			} catch (Exception e){
				msgList.setE01UAFTO3("");
			}
			flexLog("E01UAFTO3=" + req.getParameter("E01UAFTO3"));		

			try {
				posi = req.getParameter("Pos");
				} catch (Exception e) {
				posi = "0";
				flexLog("posi");
			}

			selfre= msgList.getE01SELFRE();
			selrfn= msgList.getE01SELRFN();
			selusr= msgList.getE01SELUSR();
			selacc= msgList.getE01SELACC();
			selbrn= msgList.getE01SELBRN();
			seltyp= msgList.getE01SELTYP();
			selofc= msgList.getE01SELOFC();
			selcun= msgList.getE01SELCUN();
			seleid= msgList.getE01SELEID();
			selfr1= msgList.getE01UAFFR1();
			selfr2= msgList.getE01UAFFR2();
			selfr3= msgList.getE01UAFFR3();
			selto1= msgList.getE01UAFTO1();
			selto2= msgList.getE01UAFTO2();
			selto3= msgList.getE01UAFTO3();

			msgList.send();
			msgList.destroy();
			flexLog("ELD066001 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Message
		try
		{
			newmessage = mc.receiveMessage();
	  
			if (newmessage.getFormatName().equals("ELEERR")) {

				msgError = (ELEERRMessage)newmessage;
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);

				try {
					 flexLog("About to call Page: " + LangPath + "error_viewer.jsp");
					 callPage(LangPath + "error_viewer.jsp", req, res);
				}
				catch (Exception e) {
					flexLog("Exception calling page " + e);
				}


			}
			else if (newmessage.getFormatName().equals("ELD066001")) {

				try {
					beanList = new datapro.eibs.beans.JBList();
				} 
				catch (Exception ex) {
					flexLog("Error: " + ex); 
				}

				boolean firstTime;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				String chk = "";
				String accNum = req.getParameter("ACCNUM");
				//mod emat 10/04/2001
				String chkOfac = "";
				String chkWarn = "";
			
				if (accNum == null) 
					firstTime = true;
				else				
					firstTime = false;
				int indexRow = 0;
				while (true) {

					msgList = (ELD066001Message)newmessage;

					marker = msgList.getH01FLGMAS();
					lastrecord = msgList.getH01FLGWK2();

					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					}
					else {
						if (firstTime) {
							firstTime = false;
							beanList.setFirstRec(
								Integer.parseInt(msgList.getE01NUMREC()));
							chk = "checked";
						}
						else {
								chk = "";
						}
					
						myRow = new StringBuffer("<TR>");
						// mod EMAT 10/01/2001
						// add ofac status : H01FLGWK3 = '3'
						// mod EMAT 10/25/2001
						// add Warning status : H01FLGWK2 = 'A'
					
					
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showInquiryUAF('500', '" + msgList.getE01UAFACC() + "', '" + msgList.getE01UAFTYP() + "', '" + msgList.getE01UAFFRE() + "', '" + msgList.getE01UAFRFN() + "', '" + msgList.getE01UAFOD1() + "', '" + msgList.getE01UAFOD2() + "', '" + msgList.getE01UAFOD3() + "', '" + msgList.getE01UAFUSR() + "')\">" + Util.formatCell(msgList.getE01UAFBRN()) + "</A>"+   "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showInquiryUAF('500', '" + msgList.getE01UAFACC() + "', '" + msgList.getE01UAFTYP() + "', '" + msgList.getE01UAFFRE() + "', '" + msgList.getE01UAFRFN() + "', '" + msgList.getE01UAFOD1() + "', '" + msgList.getE01UAFOD2() + "', '" + msgList.getE01UAFOD3() + "', '" + msgList.getE01UAFUSR() + "')\">" + Util.formatCell(msgList.getE01UAFACC()) + "</A>"+   "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showInquiryUAF('500', '" + msgList.getE01UAFACC() + "', '" + msgList.getE01UAFTYP() + "', '" + msgList.getE01UAFFRE() + "', '" + msgList.getE01UAFRFN() + "', '" + msgList.getE01UAFOD1() + "', '" + msgList.getE01UAFOD2() + "', '" + msgList.getE01UAFOD3() + "', '" + msgList.getE01UAFUSR() + "')\">" + Util.formatCell(msgList.getE01UAFTYP()) + "</A>"+   "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showInquiryUAF('500', '" + msgList.getE01UAFACC() + "', '" + msgList.getE01UAFTYP() + "', '" + msgList.getE01UAFFRE() + "', '" + msgList.getE01UAFRFN() + "', '" + msgList.getE01UAFOD1() + "', '" + msgList.getE01UAFOD2() + "', '" + msgList.getE01UAFOD3() + "', '" + msgList.getE01UAFUSR() + "')\">" + Util.formatCell(msgList.getE01UAFTYP()) + "</A>"+   "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showInquiryUAF('500', '" + msgList.getE01UAFACC() + "', '" + msgList.getE01UAFTYP() + "', '" + msgList.getE01UAFFRE() + "', '" + msgList.getE01UAFRFN() + "', '" + msgList.getE01UAFOD1() + "', '" + msgList.getE01UAFOD2() + "', '" + msgList.getE01UAFOD3() + "', '" + msgList.getE01UAFUSR() + "')\">" + Util.formatCell(msgList.getE01UAFFRE()) + "</A>"+   "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showInquiryUAF('500', '" + msgList.getE01UAFACC() + "', '" + msgList.getE01UAFTYP() + "', '" + msgList.getE01UAFFRE() + "', '" + msgList.getE01UAFRFN() + "', '" + msgList.getE01UAFOD1() + "', '" + msgList.getE01UAFOD2() + "', '" + msgList.getE01UAFOD3() + "', '" + msgList.getE01UAFUSR() + "')\">" + Util.formatCell(msgList.getE01UAFRFN()) + "</A>"+   "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:showInquiryUAF('500', '" + msgList.getE01UAFACC() + "', '" + msgList.getE01UAFTYP() + "', '" + msgList.getE01UAFFRE() + "', '" + msgList.getE01UAFRFN() + "', '" + msgList.getE01UAFOD1() + "', '" + msgList.getE01UAFOD2() + "', '" + msgList.getE01UAFOD3()  + "', '" + msgList.getE01UAFUSR() + "')\">" +  UDecimalFormat.formatCCY(msgList.getBigDecimalE01UAFAMT(), 2) + "</A>"+   "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showInquiryUAF('500', '" + msgList.getE01UAFACC() + "', '" + msgList.getE01UAFTYP() + "', '" + msgList.getE01UAFFRE() + "', '" + msgList.getE01UAFRFN() + "', '" + msgList.getE01UAFOD1() + "', '" + msgList.getE01UAFOD2() + "', '" + msgList.getE01UAFOD3() + "', '" + msgList.getE01UAFUSR() + "')\">" + Util.formatDate(msgList.getE01UAFOD1(),msgList.getE01UAFOD2(), msgList.getE01UAFOD3()) + "</A>"+   "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showInquiryUAF('500', '" + msgList.getE01UAFACC() + "', '" + msgList.getE01UAFTYP() + "', '" + msgList.getE01UAFFRE() + "', '" + msgList.getE01UAFRFN() + "', '" + msgList.getE01UAFOD1() + "', '" + msgList.getE01UAFOD2() + "', '" + msgList.getE01UAFOD3() + "', '" + msgList.getE01UAFUSR() + "')\">" + Util.formatCell(msgList.getE01UAFNA1()) + "</A>"+   "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showInquiryUAF('500', '" + msgList.getE01UAFACC() + "', '" + msgList.getE01UAFTYP() + "', '" + msgList.getE01UAFFRE() + "', '" + msgList.getE01UAFRFN() + "', '" + msgList.getE01UAFOD1() + "', '" + msgList.getE01UAFOD2() + "', '" + msgList.getE01UAFOD3() + "', '" + msgList.getE01UAFUSR() + "')\">" + Util.formatCell(msgList.getE01UAFIDN()) + "</A>"+   "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showInquiryUAF('500', '" + msgList.getE01UAFACC() + "', '" + msgList.getE01UAFTYP() + "', '" + msgList.getE01UAFFRE() + "', '" + msgList.getE01UAFRFN() + "', '" + msgList.getE01UAFOD1() + "', '" + msgList.getE01UAFOD2() + "', '" + msgList.getE01UAFOD3() + "', '" + msgList.getE01UAFUSR() + "')\">" + Util.formatCell(msgList.getE01UAFOFC()) + "</A>"+   "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:showInquiryUAF('500', '" + msgList.getE01UAFACC() + "', '" + msgList.getE01UAFTYP() + "', '" + msgList.getE01UAFFRE() + "', '" + msgList.getE01UAFRFN() + "', '" + msgList.getE01UAFOD1() + "', '" + msgList.getE01UAFOD2() + "', '" + msgList.getE01UAFOD3() + "', '" + msgList.getE01UAFUSR() + "')\">" + Util.formatCell(msgList.getE01UAFUSR()) + "</A>"+   "</TD>");
 						myRow.append("</TR>");
						beanList.addRow(myFlag, myRow.toString());
						indexRow ++;				
						if (marker.equals("+")) {
							beanList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}
					
				userPO = new datapro.eibs.beans.UserPos();
 			
				flexLog("Putting java beans into the session");
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("cifList", beanList);
				ses.setAttribute("error", msgError);

				if (beanList.getNoResult()){
					try {
						flexLog("About to call Page: " + LangPath + "MISC_no_result.jsp");
						res.sendRedirect(super.srctx + LangPath + "MISC_no_result.jsp");
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}    
				else {
					try {
						params +=  "&E01SELFRE=" + selfre;
						params +=  "&E01SELRFN=" + selrfn;
						params +=  "&E01SELACC=" + selacc;
						params +=  "&E01SELBRN=" + selbrn;
						params +=  "&E01SELTYP=" + seltyp;
						params +=  "&E01SELOFC=" + selofc;
						params +=  "&E01SELCUN=" + selcun;
						params +=  "&E01SELEID=" + seleid;
						params +=  "&E01UAFFR1=" + selfr1;
						params +=  "&E01UAFFR2=" + selfr2;
						params +=  "&E01UAFFR3=" + selfr3;
						params +=  "&E01UAFTO1=" + selto1;
						params +=  "&E01UAFTO2=" + selto2;
						params +=  "&E01UAFTO3=" + selto3;
						params +=  "&E01UAFUSR=" + selusr;
						userPO.setHeader7(params);	
						userPO.setHeader8(lastrecord);	
						ses.setAttribute("userPO", userPO);
						 flexLog("About to call Page: " + LangPath + "ELD0660_uaf_inq_enter_list.jsp");
						 callPage(LangPath + "ELD0660_uaf_inq_enter_list.jsp?SCREEN=20&Pos=" + posi + params, req, res);
					}
					catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
				
			}
		}
		catch (Exception e)	{
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}	

	}
	
	protected void procActionInquiry(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELD066001Message msgUsr = null;
		UPDLDUAFDSMessage msgDet = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError =
				(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
					getClass().getClassLoader(),
					"datapro.eibs.beans.ELEERRMessage");
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			msgUsr = (ELD066001Message) mc.getMessageRecord("ELD066001");
			msgUsr.setH01USERID(user.getH01USR());
			msgUsr.setH01PROGRM("ELD0660");
			msgUsr.setH01TIMSYS(getTimeStamp());
			msgUsr.setH01SCRCOD("01");
			msgUsr.setH01OPECOD("0002");
 			
			try {
				msgUsr.setE01UAFACC(req.getParameter("E01UAFACC"));
			} catch (Exception e){
				msgUsr.setE01UAFACC("");
			}
			flexLog("e01UAFacc=" + req.getParameter("E01UAFACC"));
			try {
				msgUsr.setE01UAFTYP(req.getParameter("E01UAFTYP"));
			} catch (Exception e){
				msgUsr.setE01UAFTYP("");
			}
			flexLog("e01UAFtyp=" + req.getParameter("E01UAFTYP"));		
			try {
				msgUsr.setE01UAFFRE(req.getParameter("E01UAFFRE"));
			} catch (Exception e){
				msgUsr.setE01UAFFRE("");
			}
			flexLog("e01UAFFRE=" + req.getParameter("E01UAFFRE"));
			try {
				msgUsr.setE01UAFRFN(req.getParameter("E01UAFRFN"));
			} catch (Exception e){
				msgUsr.setE01UAFRFN("");
			}
			flexLog("e01UAFRFN=" + req.getParameter("E01UAFRFN"));		
			try {
				msgUsr.setE01UAFUSR(req.getParameter("E01UAFUSR"));
			} catch (Exception e){
				msgUsr.setE01UAFUSR("");
			}
			flexLog("E01UAFUSR=" + req.getParameter("E01UAFUSR"));		
			try {
				msgUsr.setE01UAFOD1(req.getParameter("E01UAFOD1"));
			} catch (Exception e){
				msgUsr.setE01UAFOD1("");
			}
			flexLog("e01UAFOD1=" + req.getParameter("E01UAFOD1"));		
			try {
				msgUsr.setE01UAFOD2(req.getParameter("E01UAFOD2"));
			} catch (Exception e){
				msgUsr.setE01UAFOD2("");
			}
			flexLog("e01UAFOD2=" + req.getParameter("E01UAFOD2"));		
			try {
				msgUsr.setE01UAFOD3(req.getParameter("E01UAFOD3"));
			} catch (Exception e){
				msgUsr.setE01UAFOD3("");
			}
			flexLog("e01UAFOD3=" + req.getParameter("E01UAFOD3"));		
		
			msgUsr.send();
			msgUsr.destroy();
			flexLog("ELD066001 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {

				try {
					msgError =
						(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
							getClass().getClassLoader(),
							"datapro.eibs.beans.ELEERRMessage");
					flexLog("IsNotError = " + IsNotError);
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				showERROR(msgError);
				//beanList.setNoResult(true);

				flexLog("Putting X java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e + newmessage);
			throw new RuntimeException("Socket Communication Error Receiving");
		}

		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("UPDLDUAFDS")) {
				try {
					msgDet = new UPDLDUAFDSMessage();
					flexLog("UPDLDUAFDS Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgDet = (UPDLDUAFDSMessage) newmessage;

				flexLog("Putting java beans into the session");
	//			if(msgUsr.getH01FLGWK1().equals("M"))
	//				userPO.setOption("Mantenimiento");
	//			else
	//				userPO.setOption("Consulta");
				 msgDet.setE12SOFDS1(UDecimalFormat.formatCCY(msgDet.getBigDecimalE12TOTAMT(), 2));
				 flexLog("ERRRRp=" + UDecimalFormat.formatCCY(msgDet.getBigDecimalE12TOTAMT(), 2));
				 flexLog("E12SOFDS1=" + msgDet.getE12SOFDS1());
				userPO.setHeader1(msgDet.getE12UBIACC());
				userPO.setHeader2(msgDet.getE12HABTYP());
				ses.setAttribute("cdNew", msgDet);
				ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "ELD0660_uaf_inquiry.jsp");
						callPage(
							LangPath + "ELD0660_uaf_inquiry.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}  
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Data Receiving");
		}

	}

	//addry:ini 
	  protected synchronized void procActionPrintPDF( 
				MessageContext mc,
				ESS0030DSMessage user,
				HttpServletRequest req,
				HttpServletResponse res,
				HttpSession ses)
				throws ServletException, IOException, DocumentException {
				 
				  UPDLDUAFDSMessage msg = (UPDLDUAFDSMessage) ses.getAttribute("cdNew");
				  
		 		  flexLog("e12apffcd = " + msg.getE12APFFCD());
				 flexLog("e12brnnum = " + msg.getE12BRNNUM());
				flexLog("e12brnNME = " + msg.getE12BRNNME());
				flexLog("e12OPEDTE = " + Util.formatDate(msg.getE12OPEDT1(), msg.getE12OPEDT2(), msg.getE12OPEDT3()));
				flexLog("E12HABTYP = " + msg.getE12HABTYP());
				flexLog("E12TIPRUB = " + msg.getE12TIPRUB());
				flexLog("E12DSCRUB = " + msg.getE12DSCRUB());
				flexLog("E12UBIACC = " + msg.getE12UBIACC());
				flexLog("E12TOTAMT = " + Util.formatCCY(msg.getE12TOTAMT()));
				flexLog("E12EJENME = " + msg.getE12EJENME());
				flexLog("E12EJEIDN = " + msg.getE12EJEIDN());
				flexLog("E12EJECTR = " + msg.getE12EJECTR());
				flexLog("E12DSCCRT = " + msg.getE12DSCCTR());
				flexLog("E12CUSPID = " + msg.getE12CUSPID());
				flexLog("E12DSCPID = " + msg.getE12DSCPID());
				flexLog("E12OPEGLN = " + msg.getE12OPEGLN());
				flexLog("E12SOFCOD = " + msg.getE12SOFCOD());
				flexLog("E12SOFDSC = " + msg.getE12SOFDSC());
				flexLog("E12OFCCOD = " + msg.getE12OFCCOD());
				flexLog("E12OFCNME = " + msg.getE12OFCNME());
				flexLog("E12CARGO = " + msg.getE12DSCCAR());
				flexLog("E12UAFFRE = " + msg.getE12UAFFRE());
				flexLog("E12DSCAEC = " + msg.getE12DSCAEC());
				flexLog("E12UAFUSR = " + msg.getE12UAFUSR());

				msg.setE12DSCRUB( Util.formatCCY(msg.getE12TOTAMT()));//monto a string formatted
				try{
				
				String xmlFilename = "";
				GenericXMLPDFDocument XMLPDFdoc = new GenericXMLPDFDocument();
					if (msg.getE12UAFFRE().trim().equals("H")) {
					try {
							xmlFilename =("printformat.uaf.hab.xml"); 
							if(Integer.parseInt(msg.getE12OPEDT3())<60)
								msg.setE12ACMNME("20"+msg.getE12OPEDT3()); 
							else	
								msg.setE12ACMNME("19"+msg.getE12OPEDT3());
					} catch ( Exception iex){
						System.err.println(iex.getMessage());
					}
					}
					else {
						try {
								xmlFilename =("printformat.uaf.xml"); 
								if(Integer.parseInt(msg.getE12OPEDT3())<60)
									msg.setE12ACMNME("20"+msg.getE12OPEDT3()); 
								else	
									msg.setE12ACMNME("19"+msg.getE12OPEDT3());

								if(!( msg.getE12UAFFRE().equals("S")|| msg.getE12UBIACC().equals("000000000000")))
									msg.setE12OPEGLN(msg.getE12UBIACC());

						} catch ( Exception iex){
							System.err.println(iex.getMessage());
						}				
					}
					flexLog("por aqui va ....");
				XMLPDFdoc.generate(
						 req,
						 res,
						 user,
						 msg,
						xmlFilename, 
						msg.getE12UBIACC());

				 		}
				catch (DocumentException dex) {
					res.setContentType("text/html");
					PrintWriter writer = res.getWriter();
					writer.println(this.getClass().getName() + " caught an exception: " + dex.getClass().getName() + "<br>");
					writer.println("<pre>");
					dex.printStackTrace(writer);
					writer.println("</pre>");
				}
				finally {
//					if (baosPDF != null) {
//						baosPDF.reset();
//					}
				}
				

				
				
			  }

	  
	  
	  
	
	protected void procReqDirectInq(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
				throws ServletException, IOException {

		UserPos	userPO = null;	

		try {
			userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");

			int appCode = 500;
			String accNum = req.getParameter("ACCNUM");
			String typeCode = req.getParameter("typeCode");
		
			datapro.eibs.products.JSELD0620Redirect red = new datapro.eibs.products.JSELD0620Redirect(typeCode,ACC_APPROVAL_INQ, appCode, accNum, LangPath, ses);
			res.sendRedirect(super.srctx + red.action());
		}
		catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	
	}	
		
	public void service(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {

		MessageContext mc = null;

		ESS0030DSMessage msgUser = null;
		HttpSession session = null;

		session = (HttpSession) req.getSession(false);

		if (session == null) {
			try {
				res.setContentType("text/html");
				printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {

			int screen = R_ENTER_INQ;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("ELD0660", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {

						case R_ENTER_INQ :
							 procReqEnterInq(msgUser, req, res, session);							
							 break;
						case A_ENTER_INQ :
							procActionEnterInq(mc, msgUser, req, res, session);

						case A_REDIRECT_INQ :
							procReqDirectInq(mc, msgUser, req, res, session);
						
						case A_INQUIRY:
							procActionInquiry(mc, msgUser, req, res, session);

						case A_PRINT_PDF: //ADDRY
							procActionPrintPDF(mc, msgUser, req, res, session); //ADDRY
							
							// END Entering
						default :
							res.sendRedirect(
								super.srctx + LangPath + super.devPage);
							break;
					}

				} catch (Exception e) {
					e.printStackTrace();
					int sck = getInitSocket(req) + 1;
					flexLog("Socket not Open(Port " + sck + "). Error: " + e);
					res.sendRedirect(
						super.srctx + LangPath + super.sckNotOpenPage);
					//return;
				} finally {
					mc.close();
				}
			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(
					super.srctx + LangPath + super.sckNotRespondPage);
			}

		}

	}
	protected void showERROR(ELEERRMessage m) {
		if (logType != NONE) {

			flexLog("ERROR received.");

			flexLog("ERROR number:" + m.getERRNUM());
			flexLog("ERR001 = " + m.getERNU01() + " desc: " + m.getERDS01());
			flexLog("ERR002 = " + m.getERNU02() + " desc: " + m.getERDS02());
			flexLog("ERR003 = " + m.getERNU03() + " desc: " + m.getERDS03());
			flexLog("ERR004 = " + m.getERNU04() + " desc: " + m.getERDS04());
			flexLog("ERR005 = " + m.getERNU05() + " desc: " + m.getERDS05());
			flexLog("ERR006 = " + m.getERNU06() + " desc: " + m.getERDS06());
			flexLog("ERR007 = " + m.getERNU07() + " desc: " + m.getERDS07());
			flexLog("ERR008 = " + m.getERNU08() + " desc: " + m.getERDS08());
			flexLog("ERR009 = " + m.getERNU09() + " desc: " + m.getERDS09());
			flexLog("ERR010 = " + m.getERNU10() + " desc: " + m.getERDS10());

		}
	}


}

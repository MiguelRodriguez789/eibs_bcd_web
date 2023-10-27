package datapro.eibs.products;

/*********************************************************************************************************************************/
/**  Modificado por          :  Patricia Cataldo L.                 DATAPRO                                                     **/
/**  Identificacion          :  PCL01                                                                                           **/
/**  Fecha                   :  28/12/2011                                                                                      **/
/**  Objetivo                :  Servicio para ingreso/Mantenimiento de Solicitudes de todo tipo                                 **/
/**                                                                                                                             **/
/*********************************************************************************************************************************/

import java.beans.Beans;
import datapro.eibs.beans.*;

import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.Util;
 
import datapro.eibs.sockets.*;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.Socket;
import java.text.DecimalFormat;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lowagie.text.BadElementException;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

public class JSEDD1500 extends datapro.eibs.master.SuperServlet {


	protected static final int R_LIST            = 1;
	protected static final int A_LIST            = 2;
	protected static final int A_MAINT           = 4;
	protected static final int A_NEW             = 5;
	protected static final int A_NEW_2           = 15;
	protected static final int A_APROB           = 25;
	protected static final int R_LIST_VIEW       = 6;
	protected static final int R_LIST_APROB      = 500;
	protected static final int A_VIEW            = 7;
	protected static final int R_ENTER_NEW       = 100;
	protected static final int R_NEW             = 10;
	protected static final int R_MAINT           = 20;
	protected static final int R_NEW_TYPE        = 30;
	protected static final int R_ENTER_MAINT 	 = 200;
	protected static final int R_ENTER_VIEW  	 = 600;
	protected static final int R_PASSWORD		 = 400;
	
	private String LangPath = "S";

/**
 * JSECLI001 constructor comment.
 */
public JSEDD1500() {
	super();
}
/**
 * 
 */
public void destroy() {

	flexLog("free resources used by JSEDD1500");
	
}
/**
 * 
 */
public void init(ServletConfig config) throws ServletException {
	super.init(config);
}

protected void procReqList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDD150001Message msgList = null;
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
			msgList = (EDD150001Message) mc.getMessageRecord("EDD150001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDD1500");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			try {
			if (msgList.getE01REQCUN().equals("0") || msgList.getE01REQCUN().equals(" "))
			{
				if (userPO.getHeader1().equals("") || userPO.getHeader1().equals("0"))
				{
					msgList.setE01REQCUN(req.getParameter("E01CUN"));
				} 
				else 
				{
					msgList.setE01REQCUN(userPO.getHeader1());
			    }
			}
			} catch (Exception e) {

			}
			flexLog("cliente ..." + msgList.getE01REQCUN());
			flexLog("Cliente para crear = " + req.getParameter("E01CUN"));
			flexLog("userPO = " + userPO.getHeader1());
			msgList.send();
			msgList.destroy();
			flexLog("EDD150001 Message Sent");
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
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else {
				flexLog("Message " + newmessage.getFormatName() + " received.");				
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e + newmessage);
			throw new RuntimeException("Socket Communication Error Receiving");
		}

		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDD150001")) {

				JBObjList beanList = new JBObjList();

				boolean firstTime = true;
				String marker = "";
				String chk = "";
					while (true) {

					msgList = (EDD150001Message) newmessage;

					marker = msgList.getH01FLGMAS();
					flexLog("registro recibido   " + msgList);
					if (firstTime) {
						userPO.setHeader1(msgList.getE01REQCUN());
						userPO.setHeader2(msgList.getE01REQNAM());
						firstTime = false;
						chk = "checked";

					} else {
						chk = "";
					}

					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {
						beanList.addRow(msgList);

						if (marker.equals("+")) {
							beanList.setShowNext(true);

							break;
						}
					}
					newmessage = mc.receiveMessage();
				}

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("EDD1500Help", beanList);
				ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDD1500_sol_request_list.jsp");
						callPage(
							LangPath + "EDD1500_sol_request_list.jsp",
							req,
							res);					
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				
				} else {
					try {
						flexLog("About to call Page: " + LangPath + "ESD0080_client_both_enter.jsp");
						callPage(LangPath + "ESD0080_client_both_enter.jsp", req, res);
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
protected void procReqListView(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDD150001Message msgList = null;
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
		flexLog("E01CUN = " + req.getParameter("E01CUN"));
		flexLog("Header1 = " + userPO.getHeader1());
		// Send Initial data
		try {
			msgList = (EDD150001Message) mc.getMessageRecord("EDD150001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDD1500");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0016");

			try {
				if (userPO.getHeader1().equals(""))
				{
					msgList.setE01REQCUN(req.getParameter("E01CUN"));
					flexLog("E01CUN = " + req.getParameter("E01CUN"));
				}
				else
				{
					msgList.setE01REQCUN(userPO.getHeader1());
					flexLog("Header1 = " + userPO.getHeader1());
				}
			} catch (Exception e) {

			}
			msgList.send();
			msgList.destroy();
			flexLog("EDD150001 Message Sent");
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
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else {
				flexLog("Message " + newmessage.getFormatName() + " received.");				
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e + newmessage);
			throw new RuntimeException("Socket Communication Error Receiving");
		}

		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDD150001")) {

				JBObjList beanList = new JBObjList();
				boolean firstTime = true;
				String marker = "";
				String chk = "";

				while (true) {

					msgList = (EDD150001Message) newmessage;

					marker = msgList.getH01FLGMAS();
					if (firstTime) {
						firstTime = false;
						userPO.setHeader1(msgList.getE01REQCUN());
						userPO.setHeader2(msgList.getE01REQNAM());
						chk = "checked";

					} else {
						chk = "";
					}

					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {
						beanList.addRow(msgList);

						if (marker.equals("+")) {
							beanList.setShowNext(true);

							break;
						}
					}
					newmessage = mc.receiveMessage();
				}

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("EDD1500Help", beanList);
				ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDD1500_sol_request_list_view.jsp");
						callPage(
							LangPath + "EDD1500_sol_request_list_view.jsp",
							req,
							res);					
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				
				} else {
					try {
						flexLog("About to call Page: " + LangPath + "ESD0080_client_both_enter.jsp");
						callPage(LangPath + "ESD0080_client_both_enter.jsp", req, res);
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
protected void procReqListAprob(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDD150001Message msgList = null;
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
			msgList = (EDD150001Message) mc.getMessageRecord("EDD150001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDD1500");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0017");
			msgList.send();
			msgList.destroy();
			flexLog("EDD150001 Message Sent");
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
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else {
				flexLog("Message " + newmessage.getFormatName() + " received.");				
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e + newmessage);
			throw new RuntimeException("Socket Communication Error Receiving");
		}

		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDD150001")) {

				JBObjList beanList = new JBObjList();

				boolean firstTime = true;
				String marker = "";
				String chk = "";

				while (true) {

					msgList = (EDD150001Message) newmessage;

					marker = msgList.getH01FLGMAS();
					if (firstTime) {
						firstTime = false;
						chk = "checked";

					} else {
						chk = "";
					}

					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {
						beanList.addRow(msgList);

						if (marker.equals("+")) {
							beanList.setShowNext(true);

							break;
						}
					}
					newmessage = mc.receiveMessage();
				}

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("EDD1500Help", beanList);
				ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDD1500_sol_request_list_aprob.jsp");
						callPage(
							LangPath + "EDD1500_sol_request_list_aprob.jsp",
							req,
							res);					
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				
				} else {
					try {
						flexLog("About to call Page: " + LangPath + "ESD0080_client_both_enter.jsp");
						callPage(LangPath + "ESD0080_client_both_enter.jsp", req, res);
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


protected void procActionPos(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		flexLog(".....  = " + userPO.getOption()); 
		int inptOPT = 0;

		inptOPT = Integer.parseInt(req.getParameter("opt"));
        flexLog("Opcion = " + inptOPT);
		switch (inptOPT) {
			case 1 : //New
				procReqType(mc, user, req, res, ses);
				break;
			case 2 : //Maintenance
				procReqMaint(mc, user, req, res, ses);
				break;
			case 3 : //Consulta
				procReqView(mc, user, req, res, ses);
				break;
			case 5 : //Aprobar
				procReqAprob(mc, user, req, res, ses);
				break;
			case 6 : //Rechazar
				procReqAprob(mc, user, req, res, ses);
				break;
			case 7 : //Anular
				procReqAprob(mc, user, req, res, ses);
				break;
			case 8 : //Eliminar
				procReqAprob(mc, user, req, res, ses);
				break;
			case 9 : //Imprimir Carta
				procReqPDF(mc, user, req, res, ses);   //Comprobante
				break;		
			default :
				res.sendRedirect(
					super.srctx
						+ "/servlet/datapro.eibs.products.JSEDD1500?SCREEN=5");
				break;
		}
	}
protected void procReqType(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		EDD150001Message msgRT = null;
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose(" ");
		flexLog("Header1 = " + userPO.getHeader1());
		flexLog("nombre = " + userPO.getHeader2());
		msgRT = new datapro.eibs.beans.EDD150001Message();
		ses.setAttribute("userPO", userPO);
		ses.setAttribute("solBasic", msgRT);
		try {
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDD1500_sol_request_new_type.jsp");
			callPage(LangPath + "EDD1500_sol_request_new_type.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}
protected void procReqNew(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		EDD150001Message msgRT = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		msgRT = (EDD150001Message) ses.getAttribute("solBasic");
		userPO.setPurpose("NEW");
		flexLog("E01CUN = " + req.getParameter("E01CUN"));
		flexLog("Header1 = " + userPO.getHeader1());
		flexLog("nombre = " + userPO.getHeader2());
		flexLog("tipo = " + userPO.getCusType().trim());
		ses.setAttribute("userPO", userPO);
		ses.setAttribute("solBasic", msgRT);
		try {
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDD1500_sol_request_new.jsp");
			callPage(LangPath + "EDD1500_sol_request_new.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}

protected void procReqEnterNew(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		try {
			flexLog("About to call Page: " + LangPath + "ESD0080_client_both_enter.jsp");
			callPage(LangPath + "ESD0080_client_both_enter.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}


protected void procReqMaint(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		EDD150001Message msgDoc = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("MAINTENANCE");

		// Receive Data
		try {
			JBObjList bl = (JBObjList) ses.getAttribute("EDD1500Help");
			int idx = Integer.parseInt(req.getParameter("CURRCODE"));
			bl.setCurrentRow(idx);

			msgDoc = (EDD150001Message) bl.getRecord();

			flexLog("Putting java beans into the session");
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("solBasic", msgDoc);

			try {
				flexLog(
					"About to call Page: "
						+ LangPath
						+ "EDD1500_sol_request_maint.jsp");
				callPage(
					LangPath + "EDD1500_sol_request_maint.jsp",
					req,
					res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
protected void procActionMaint(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDD150001Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgRT = (EDD150001Message) ses.getAttribute("solBasic");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD150001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");

			// all the fields here
			java.util.Enumeration enu = msgRT.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}

			mc.sendMessage(msgRT);
			msgRT.destroy();
			flexLog("EDD150001 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDD150001")) {
				try {
					msgRT = new datapro.eibs.beans.EDD150001Message();
					flexLog("EDD150001 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgRT = (EDD150001Message) newmessage;

				userPO.setHeader1(msgRT.getE01REQCUN());
				userPO.setHeader2(msgRT.getE01REQNAM());
				ses.setAttribute("error", msgError);
				ses.setAttribute("solBasic", msgRT);
				ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors
					res.sendRedirect(
									super.srctx
									+ "/servlet/datapro.eibs.products.JSEDD1500?SCREEN=1");
				} else { // There are errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDD1500_sol_request_maint.jsp");
						callPage(
							LangPath + "EDD1500_sol_request_maint.jsp",
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
			throw new RuntimeException("Socket Communication Error");
		}

	}
protected void procActionAprob(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDD150001Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		flexLog(".....  = " + userPO.getOption()); 
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgRT = (EDD150001Message) ses.getAttribute("solBasic");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD150001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD(userPO.getOption());
			msgRT.setH01OPECOD("0020");
			flexLog("cliente = " + msgRT.getE01REQCUN());
			flexLog("numero = " + msgRT.getE01REQNUM());

			// all the fields here
			java.util.Enumeration enu = msgRT.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}

			mc.sendMessage(msgRT);
			msgRT.destroy();
			flexLog("EDD150001 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDD150001")) {
				try {
					msgRT = new datapro.eibs.beans.EDD150001Message();
					flexLog("EDD150001 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgRT = (EDD150001Message) newmessage;

				userPO.setHeader1(msgRT.getE01REQCUN());
				userPO.setHeader2(msgRT.getE01REQNAM());
				ses.setAttribute("error", msgError);
				ses.setAttribute("solBasic", msgRT);
				ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.products.JSEDD1500?SCREEN=400");
					flexLog(super.srctx + "/servlet/datapro.eibs.products.JSEDD1500?SCREEN=400");
				} else { // There are errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDD1500_sol_request_maint.jsp");
						callPage(
							LangPath + "EDD1500_sol_request_maint.jsp",
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
			throw new RuntimeException("Socket Communication Error");
		}

	}

protected void procActionNew(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		MessageRecord newmessage = null;
		EDD150001Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			flexLog("Sending header");
			msgRT = (EDD150001Message) mc.getMessageRecord("EDD150001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD1500");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0001");
			msgRT.setE01REQCUN(userPO.getHeader1());
			msgRT.setE01REQTYP(req.getParameter("E01REQTYP"));
			
			flexLog("Cliente para crear = " + msgRT.getE01REQCUN());
			flexLog("tipo = " + req.getParameter("E01REQTYP"));
			msgRT.send();
			msgRT.destroy();
			flexLog("EDD150001 Message Sent");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ELEERR")) 
			{
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else {
				flexLog("Message " + newmessage.getFormatName() + " received.");
			}
		} catch (Exception e) 
			{
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
			}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("EDD150001")) 
			{
				try	{
					msgRT = new datapro.eibs.beans.EDD150001Message();
					flexLog("EDD000001 Message Sent");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}
				msgRT = (EDD150001Message) newmessage;
				userPO.setHeader1(msgRT.getE01REQCUN());
				userPO.setHeader2(msgRT.getE01REQNAM());
				userPO.setHeader4("N");
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("solBasic", msgRT);
				if (IsNotError) 
				{ // There are no errors
					try {
						flexLog("About to call Page: " + LangPath + "EDD1500_sol_request_new.jsp");
						callPage(LangPath + "EDD1500_sol_request_new.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					} 
				} else {
					try {
						flexLog("About to call Page: " + LangPath + "EDD1500_sol_request_new_type.jsp");
						callPage(LangPath + "EDD1500_sol_request_new_type.jsp", req, res);				
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}		
			} else 
				flexLog("Message " + newmessage.getFormatName() + " received.");

	}catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	}
protected void procActionNew2(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDD150001Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgRT = (EDD150001Message) ses.getAttribute("solBasic");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD150001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0004");

			// all the fields here
			java.util.Enumeration enu = msgRT.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}

			mc.sendMessage(msgRT);
			msgRT.destroy();
			flexLog("EDD150001 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDD150001")) {
				try {
					msgRT = new datapro.eibs.beans.EDD150001Message();
					flexLog("EDD150001 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgRT = (EDD150001Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("solBasic", msgRT);
				ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors
					res.sendRedirect(
										super.srctx
											+ "/servlet/datapro.eibs.products.JSEDD1500?SCREEN=1");
				} else { // There are errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDD1500_sol_request_new.jsp");
						callPage(
							LangPath + "EDD1500_sol_request_new.jsp",
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
			throw new RuntimeException("Socket Communication Error");
		}

	}
protected void procReqView(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		EDD150001Message msgDoc = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("VIEW");

		// Receive Data
		try {
			JBObjList bl = (JBObjList) ses.getAttribute("EDD1500Help");
			int idx = Integer.parseInt(req.getParameter("CURRCODE"));
			bl.setCurrentRow(idx);

			msgDoc = (EDD150001Message) bl.getRecord();

			flexLog("Putting java beans into the session");
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("solBasic", msgDoc);

			try {
				flexLog(
					"About to call Page: "
						+ LangPath
						+ "EDD1500_sol_request_view.jsp");
				callPage(
					LangPath + "EDD1500_sol_request_view.jsp",
					req,
					res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
protected void procReqAprob(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		EDD150001Message msgDoc = null;
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		flexLog(".....  = " + userPO.getOption()); 
		int inptOPT = 0;
		inptOPT = Integer.parseInt(req.getParameter("opt"));
		switch (inptOPT) {
		case 5 : //Aprobar
			userPO.setOption("AP");
			break;
		case 6 : //Rechazar
			userPO.setOption("RE");
			break;
		case 7 : //Anular
			userPO.setOption("AN");
			break;
		case 8 : //ELiminar
			userPO.setOption("EL");
			break;
		default :
			userPO.setOption("ER");
			break;
		// Receive Data
		}
		try {
			JBObjList bl = (JBObjList) ses.getAttribute("EDD1500Help");
			int idx = Integer.parseInt(req.getParameter("CURRCODE"));
			bl.setCurrentRow(idx);

			msgDoc = (EDD150001Message) bl.getRecord();
			userPO.setHeader1(msgDoc.getE01REQCUN());
			userPO.setHeader2(msgDoc.getE01REQNAM());
			flexLog("Putting java beans into the session");
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("solBasic", msgDoc);

			try {
				flexLog(
					"About to call Page: "
						+ LangPath
						+ "EDD1500_sol_request_aprob.jsp");
				callPage(
					LangPath + "EDD1500_sol_request_aprob.jsp",
					req,
					res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
/**
 * This method was created in VisualAge.
 */
protected void procReqEnterMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	ESD008001Message msgClient = null;
	ELEERRMessage msgError = null;
	UserPos	userPO = null;	

	try {

		msgClient = new datapro.eibs.beans.ESD008001Message(); 
		msgError = new datapro.eibs.beans.ELEERRMessage();
		userPO = new datapro.eibs.beans.UserPos(); 
		userPO.setOption("CLIENT");
		userPO.setPurpose("SOL");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEDD1500?SCREEN=1");
		ses.setAttribute("client", msgClient);
		ses.setAttribute("error", msgError);
		ses.setAttribute("userPO", userPO);

  	} catch (Exception ex) {
		flexLog("Error: " + ex); 
  	}

	try {
		flexLog("About to call Page: " + LangPath + "ESD0080_client_both_enter.jsp");
		callPage(LangPath + "ESD0080_client_both_enter.jsp", req, res);
	}
	catch (Exception e) {
		e.printStackTrace();
		flexLog("Exception calling page " + e);
	}

}

/**
 * This method was created in VisualAge.
 */
protected void procReqEnterView(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	ESD008001Message msgClient = null;
	ELEERRMessage msgError = null;
	UserPos	userPO = null;	

	try {

		msgClient = new datapro.eibs.beans.ESD008001Message(); 
		msgError = new datapro.eibs.beans.ELEERRMessage();
		userPO = new datapro.eibs.beans.UserPos(); 
		userPO.setOption("CLIENT");
		userPO.setPurpose("SOL");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEDD1500?SCREEN=6");
		ses.setAttribute("client", msgClient);
		ses.setAttribute("error", msgError);
		ses.setAttribute("userPO", userPO);

  	} catch (Exception ex) {
		flexLog("Error: " + ex); 
  	}

	try {
		flexLog("About to call Page: " + LangPath + "ESD0080_client_both_enter.jsp");
		callPage(LangPath + "ESD0080_client_both_enter.jsp", req, res);
	}
	catch (Exception e) {
		e.printStackTrace();
		flexLog("Exception calling page " + e);
	}

}
protected void procReqPDF(MessageContext mc, 
		ESS0030DSMessage user, 
		HttpServletRequest req, 
		HttpServletResponse res, 
		HttpSession ses)
		throws ServletException, IOException {
	
	    ELEERRMessage msgError = null;
	    EDD150001Message msgDoc = null;
	    EDD150002Message msgSearch = null;
	    EDD150002Message msgLetter = null;
		MessageRecord newmessage = null;
		JBObjList bl = (JBObjList) ses.getAttribute("EDD1500Help");
		int idx = Integer.parseInt(req.getParameter("CURRCODE"));
		bl.setCurrentRow(idx);
		boolean IsNotError = false;
		msgDoc = (EDD150001Message) bl.getRecord();
	    flexLog("Mensaje rescatado de la lista " + "index  " + idx + " " + msgDoc);
		try {
		     msgSearch = (EDD150002Message) mc.getMessageRecord("EDD150002");
		     msgSearch.setH02USERID(user.getH01USR());
		     msgSearch.setH02PROGRM("EDD1500");
		     msgSearch.setH02TIMSYS(getTimeStamp());
		     msgSearch.setH02SCRCOD("01");
		     msgSearch.setH02OPECOD("0004");

		    try {
			    msgSearch.setE02SELCUN(msgDoc.getE01REQCUN());
		    } catch (Exception e) {
			    flexLog("E02REQCUN");
		    }

		    try {
			    msgSearch.setE02SELNUM(msgDoc.getE01REQNUM());
		    } catch (Exception e) {
			    flexLog("E02REQNUM");
		    }
		    flexLog("Mensaje EDD150002 enviado " + msgSearch);
		    msgSearch.send();
		    msgSearch.destroy();

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
		// Receive Message
		try {
			newmessage = mc.receiveMessage();
			flexLog("Message " + newmessage.getFormatName() + " received.");
		    if (newmessage.getFormatName().equals("EDD150002")) {
				try {
					msgLetter = new datapro.eibs.beans.EDD150002Message();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgLetter = (EDD150002Message) newmessage;
			    flexLog("Mensaje EDD150002 recibido " + msgLetter);
				ses.setAttribute("msgLetter", msgLetter);

				}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		DocumentException ex = null;
		ByteArrayOutputStream baosPDF = null;

		boolean ACT = false;
		try {
			baosPDF =
				generatePDFDocumentBytes(
					req,
					this.getServletContext(),
					ses,
					ACT);

				StringBuffer sbFilename = new StringBuffer();
				String fn = com.datapro.generic.tool.Util.getTimestamp().toString();
				fn = Util.replace(fn,":","-");
				fn = Util.replace(fn,".","-");
				sbFilename.append(fn);
				sbFilename.append(".pdf");

				res.setHeader("Cache-Control", "max-age=30");

				res.setContentType("application/pdf");

				StringBuffer sbContentDispValue = new StringBuffer();
				sbContentDispValue.append("inline");
				sbContentDispValue.append("; filename=");
				sbContentDispValue.append(sbFilename);

				res.setHeader(
					"Content-disposition",
					sbContentDispValue.toString());

				res.setContentLength(baosPDF.size());

				ServletOutputStream sos;

				sos = res.getOutputStream();

				baosPDF.writeTo(sos);

				sos.flush();

		} catch (DocumentException dex) {
			res.setContentType("text/html");
			PrintWriter writer = res.getWriter();
			writer.println(
				this.getClass().getName()
					+ " caught an exception: "
					+ dex.getClass().getName()
					+ "<br>");
			writer.println("<pre>");
			dex.printStackTrace(writer);
			writer.println("</pre>");
		} finally {
			if (baosPDF != null) {
				baosPDF.reset();
			}
		}

		return;

	}

protected ByteArrayOutputStream generatePDFDocumentBytes(
		final HttpServletRequest req,
		final ServletContext ctx,
		HttpSession session,
		boolean FLG)
		throws DocumentException {

		ESS0030DSMessage msgUser = null;
		msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
		String LNG = msgUser.getE01LAN();

		EDD150002Message msgLetter = null;
		msgLetter = (EDD150002Message) session.getAttribute("msgLetter");
			
		String header01 = "Comprobante de Recepcion de Documentos por Fallecimiento";
		String detail02 = "Impresion      :  ";
		String detail03 = "Usuario        :  ";
		String detail04 = "Centro Costo   :  ";
		String detail05 = "Rotulo         :  ";
		String detail06 = "Pagina         :  1 de 1";
		String header02 = "Datos Personales";
		String detail08 = "R.u.t                            :  ";
		String detail09 = "Nombre                           :  ";
		String detail10 = "Fecha de Ingreso Fallecimiento   :  ";
		String detail11 = "Fecha de Defuncion               :  ";
		String detail12 = "Oficina Ingreso                  :  ";
		String detail13 = "Oficina Pertenencia              :  ";
		String detail14 = "R.u.t. Representante Legal       :  ";
		String detail15 = "Nombre Representante Legal       :  ";
		String header03 = "Documentos Entregados               ";
		String detail17 = "                                              CERTIFICADO DEFUNCION";
		String detail18 = " ______________________________________                ";
		String detail19 = "                                                                   ";

		String dd1 = msgLetter.getE02REQCDD();
		while (dd1.length() < 2) {
			dd1 = "0" + dd1;
		}
		String dd2 = msgLetter.getE02REQCMM();
		while (dd2.length() < 2) {
			dd2 = "0" + dd2;
		}
		String dd3 = msgLetter.getE02REQCYY();
		while (dd3.length() < 2) {
			dd3 = "0" + dd3;
		}
		String curdat = dd1 + "/" + dd2 + "/" + dd3;                    // fecha de Impresion
		String codusu = Util.unformatHTML(msgLetter.getE02REQCUS());    // Codigo de usuario de impresion
		String cencos = Util.unformatHTML(msgLetter.getE02REQCCO());    //Centro de Costo
		String rotulo = Util.unformatHTML(msgLetter.getE02REQROT());    //Rotulo
		String rut = Util.unformatHTML(msgLetter.getE02REQIDN());       //Rut del Cliente
        String mantisa= "";
        String digito="";
        String formattedRUT="";
		if (rut.length() > 0)
			{ 
	        mantisa=rut.substring(0,rut.length()-1);
	        digito=rut.substring(rut.length()-1);
	        DecimalFormat nf = new DecimalFormat("##,###,###"); 
	        formattedRUT=nf.format(Integer.valueOf(mantisa))+"-"+digito;
			}
		String nombre = Util.unformatHTML(msgLetter.getE02REQNAM());    //Nombre del Cliente
		dd1 = msgLetter.getE02REQSDD();
		while (dd1.length() < 2) {
			dd1 = "0" + dd1;
		}
		dd2 = msgLetter.getE02REQSMM();
		while (dd2.length() < 2) {
			dd2 = "0" + dd2;
		}
		dd3 = msgLetter.getE02REQSYY();
		while (dd3.length() < 2) {
			dd3 = "0" + dd3;
		}
		String ingdat = dd1 + "/" + dd2 + "/" + dd3; 
		dd1 = msgLetter.getE02REQFDD();
		while (dd1.length() < 2) {
			dd1 = "0" + dd1;
		}
		dd2 = msgLetter.getE02REQFMM();
		while (dd2.length() < 2) {
			dd2 = "0" + dd2;
		}
		dd3 = msgLetter.getE02REQFYY();
		while (dd3.length() < 2) {
			dd3 = "0" + dd3;
		}
		String defdat = dd1 + "/" + dd2 + "/" + dd3; 
		String oficinaing = Util.unformatHTML(msgLetter.getE02REQOFI());    //Oficina de Ingreso
		String oficinaper = Util.unformatHTML(msgLetter.getE02REQOFP());    //Oficina de pertenencia
		String rutrep = Util.unformatHTML(msgLetter.getE02REQIDR());        //Rut del Representante
        String formattedRUTREP="";
		if (rutrep.length() > 0)
			{ 
	        mantisa=rutrep.substring(0,rutrep.length()-1);
	        digito=rutrep.substring(rutrep.length()-1);
	        DecimalFormat nf = new DecimalFormat("##,###,###"); 
	        formattedRUTREP=nf.format(Integer.valueOf(mantisa))+"-"+digito;
			}
		String nombrerep = Util.unformatHTML(msgLetter.getE02REQNAR());     //Nombre del Representante
		String reqcun = Util.unformatHTML(msgLetter.getE02SELCUN());       //Numero del cliente
		String reqnum = Util.unformatHTML(msgLetter.getE02SELNUM());        //Numero de SOlicitud
		String nomeje= Util.unformatHTML(msgLetter.getE02REQUS3());        //Nombre del ejecutivo

		Document doc = new Document(PageSize.A4, 36, 36, 36, 36);           //setaer tamano de hoja

		ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
		PdfWriter docWriter = null;

		try {
			docWriter = PdfWriter.getInstance(doc, baosPDF);

			if (FLG) {
				docWriter.setEncryption(
					PdfWriter.STRENGTH128BITS,
					reqcun,
					reqnum,
					PdfWriter.AllowCopy | PdfWriter.AllowPrinting);
			}

			doc.addAuthor("eIBS");
			doc.addCreationDate();
			doc.addProducer();
			doc.addCreator(msgLetter.getE02SELCUN());
			doc.addKeywords("pdf, itext, Java, open source, http");

			Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.NORMAL);
			Font normalBoldFont = FontFactory.getFont(FontFactory.COURIER, 8, Font.BOLD);
			Font normalBoldUnderFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD | Font.UNDERLINE);
			Font headerFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.NORMAL);
			Font headerBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD);
			Font headerBoldUnderFont = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD | Font.UNDERLINE);

			Paragraph RAYA =
				    new Paragraph("_________________________________________________________________________________________________",
					normalBoldFont);
			Paragraph BLANK = new Paragraph(" ", headerBoldFont);
			Paragraph HEADER01 = new Paragraph(header01, headerBoldFont);
			Paragraph HEADER02 = new Paragraph(header02, headerBoldFont);
			Paragraph HEADER03 = new Paragraph(header03, headerBoldFont);
			Paragraph DETAIL02 = new Paragraph(detail02 + curdat, normalBoldFont);
			Paragraph DETAIL03 = new Paragraph(detail03 + codusu, normalBoldFont);
			Paragraph DETAIL04 = new Paragraph(detail04 + cencos, normalBoldFont);
			Paragraph DETAIL05 = new Paragraph(detail05 + rotulo, normalBoldFont);
			Paragraph DETAIL06 = new Paragraph(detail06, normalBoldFont);
			Paragraph DETAIL08 = new Paragraph(detail08 + formattedRUT, normalBoldFont);
			Paragraph DETAIL09 = new Paragraph(detail09 + nombre, normalBoldFont);
			Paragraph DETAIL10 = new Paragraph(detail10 + ingdat, normalBoldFont);
			Paragraph DETAIL11 = new Paragraph(detail11 + defdat, normalBoldFont);
			Paragraph DETAIL12 = new Paragraph(detail12 + oficinaing, normalBoldFont);
			Paragraph DETAIL13 = new Paragraph(detail13 + oficinaper, normalBoldFont);
			Paragraph DETAIL14 = new Paragraph(detail14 + formattedRUTREP, normalBoldFont);
			Paragraph DETAIL15 = new Paragraph(detail15 + nombrerep, normalBoldFont);
			Paragraph DETAIL17 = new Paragraph(detail17,normalBoldFont);
			Paragraph DETAIL18 = new Paragraph(detail18, normalBoldFont);
			Paragraph DETAIL19 = new Paragraph(detail19 + nomeje, normalBoldFont);


			doc.open();

			Table table = new Table(2, 9);
			table.setBorderWidth(0);
			table.setCellsFitPage(true);
			table.setPadding(1);
			table.setSpacing(1);
			table.setWidth(100);
			
			Cell cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);

			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);

			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);

			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(HEADER01);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			//cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);

			cell = new Cell(DETAIL02);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(DETAIL03);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);

			cell = new Cell(DETAIL04);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(DETAIL05);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			
			cell = new Cell(DETAIL06);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			doc.add(table);
			
			table = new Table(1, 4);
			table.setBorderWidth(0);
			table.setCellsFitPage(true);
			table.setPadding(1);
			table.setSpacing(1);
			table.setWidth(100);
			
			cell = new Cell(RAYA);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(HEADER02);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			
			cell = new Cell(RAYA);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);		
			
			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
							
			cell = new Cell(DETAIL08);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
					
			cell = new Cell(DETAIL09);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
						
			cell = new Cell(DETAIL10);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
					
			cell = new Cell(DETAIL11);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
		
			cell = new Cell(DETAIL12);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
					
			cell = new Cell(DETAIL13);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(DETAIL14);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(DETAIL15);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			
			cell = new Cell(RAYA);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(HEADER03);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(RAYA);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);

			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);

			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(DETAIL17);
			cell.setHorizontalAlignment(Element.ALIGN_MIDDLE);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(BLANK);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(DETAIL18);
			cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);
			
			cell = new Cell(DETAIL19);
			cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(cell);	
		
			doc.add(table);
			
		} catch (DocumentException dex) {
			baosPDF.reset();
			throw dex;
		} finally {
			if (doc != null) {
				doc.close();
			}
			if (docWriter != null) {
				docWriter.close();
			}
		}

		if (baosPDF.size() < 1) {
			throw new DocumentException(
				"document has " + baosPDF.size() + " bytes");
		}

		return baosPDF;
	}
/**
 * This method was created in VisualAge.
 */

public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
   
	Socket s = null;
	MessageContext mc = null;

	ESS0030DSMessage msgUser = null;
  	HttpSession session = null;

	session = (HttpSession)req.getSession(false); 
	
	if (session == null) {
		try {
			res.setContentType("text/html");
			printLogInAgain(res.getWriter());
		}
		catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception ocurred. Exception = " + e);
		}
	}
	else {

		int screen = R_ENTER_MAINT;
		
		try {
		
			msgUser = (datapro.eibs.beans.ESS0030DSMessage)session.getAttribute("currUser");

			// Here we should get the path from the user profile
			LangPath = super.rootPath + msgUser.getE01LAN() + "/";

			try
			{
				flexLog("Opennig Socket Connection");
				mc = new MessageContext(super.getMessageHandler("EDD1500", req));
			
			try {
				screen = Integer.parseInt(req.getParameter("SCREEN"));
			}
			catch (Exception e) {
				flexLog("Screen set to default value");
			}
		    flexLog("Entre con Screen = " + screen);
			switch (screen) {
	
			    case R_ENTER_MAINT : 
				procReqEnterMaint(msgUser, req, res, session);
				break;
			    case R_ENTER_VIEW : 
					procReqEnterView(msgUser, req, res, session);
					break;
				case R_LIST :
					procReqList(mc, msgUser, req, res, session);
					break;
				case R_LIST_VIEW :
					procReqListView(mc, msgUser, req, res, session);
					break;
				case R_LIST_APROB :
					procReqListAprob(mc, msgUser, req, res, session);
					break;
				case A_LIST :
					procActionPos(mc, msgUser, req, res, session);
					break;	
				case A_NEW :
					procActionNew(mc, msgUser, req, res, session);
					break;
				case A_NEW_2 :
					procActionNew2(mc, msgUser, req, res, session);
					break;
				case R_NEW_TYPE :
					procReqType(mc, msgUser, req, res, session);
				case R_NEW :
					procReqNew(mc, msgUser, req, res, session);
					break;
				case R_ENTER_NEW :
					procReqEnterNew(mc, msgUser, req, res, session);
					break;
				case R_MAINT :
					procReqMaint(mc, msgUser, req, res, session);
					break;
				case A_MAINT :
					procActionMaint(mc, msgUser, req, res, session);
					break;
				case A_APROB :
					procActionAprob(mc, msgUser, req, res, session);
					break;
				case R_PASSWORD :
					procReqPassword(req, res, session);
					break;					
				default :
					res.sendRedirect(super.srctx +LangPath + super.devPage);
					break;
			}
			}
			catch (Exception e) {
				e.printStackTrace();
				int sck = getInitSocket(req) + 1;
				flexLog("Socket not Open(Port " + sck + "). Error: " + e);
				res.sendRedirect(super.srctx +LangPath + super.sckNotOpenPage);
			//	return;
			}
			finally {
				mc.close();
			}
			

		}
		catch (Exception e) {
			flexLog("Error: " + e);
			res.sendRedirect(super.srctx +LangPath + super.sckNotRespondPage);
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
/**
 * This method was created in VisualAge.
 */
protected void procReqPassword(HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {
    flexLog ("Entre en procReqPassword ");
	UserPos	userPO = null;

	try {
		
		userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEDD1500?SCREEN=" + R_LIST_APROB);
		ses.setAttribute("userPO", userPO);
		res.sendRedirect(super.srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
		
	}
	catch (Exception e)	{
		e.printStackTrace();
		flexLog("Error: " + e);
	  	throw new RuntimeException("Socket Communication Error");
	}	
	
}
}
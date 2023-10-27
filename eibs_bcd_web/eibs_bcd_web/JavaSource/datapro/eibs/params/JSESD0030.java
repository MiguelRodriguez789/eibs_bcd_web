package datapro.eibs.params;

/*********************************************************************************************************************************/
/**  Modificado por          :  Patricia Cataldo L.                 DATAPRO                                                     **/
/**  Identificacion          :  PCL01                                                                                           **/
/**  Fecha                   :  08/10/2012                                                                                      **/
/**  Objetivo                :  Se modifica incorporando seleccion previa por codigo o descripcion                              **/
/**                                                                                                                             **/
/*********************************************************************************************************************************/

import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

import datapro.eibs.master.Util;

import datapro.eibs.sockets.*;

public class JSESD0030 extends datapro.eibs.master.SuperServlet {

	// Action 

	protected static final int A_POSITION = 800;

	protected static final int R_ENTER_SEARCH = 100;
	protected static final int R_REFERENCE_LIST = 150;
	protected static final int R_CODES_LIST = 400;

	protected static final int R_ENTER = 1;
	protected static final int R_NEW = 300;
	protected static final int R_MAINTENANCE = 500;
	protected static final int A_MAINTENANCE = 600;

	protected String LangPath = "S";

	/**
	 * JSEIE00000 constructor comment.
	 */
	public JSESD0030() {
		super();
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSEIE00000");

	}
	/**
	 * This method was created by David Mavilla.
	 * 
	 */

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	protected void procActionPos(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		int inptOPT = 0;

		inptOPT = Integer.parseInt(req.getParameter("opt"));

		String fld = req.getParameter("E01CNOFLD")!=null?req.getParameter("E01CNOFLD"):"4";
		
		try{
			userPO.setHeader7(req.getParameter("TBLDESC"));
		} catch (Exception e) {
			userPO.setHeader7(" ");
		}
		ses.setAttribute("userPO", userPO);

		switch (inptOPT) {
			case 1 : //New
				res.sendRedirect(
					super.srctx
						+ "/servlet/datapro.eibs.params.JSESD0030?SCREEN=300&E01CNOFLD=" + fld);
				break;
			case 2 : //Maintenance
				procReqMaintenance(mc, user, req, res, ses);
				break;

			case 3 : //Deletion
				procActionDelete(mc, user, req, res, ses);
				break;

			default :
				res.sendRedirect(
					super.srctx
						+ "/servlet/datapro.eibs.params.JSESD0030?SCREEN=500");
				break;
		}
	}
	protected void procReqEnterSearch(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			ESD003001Message msgCnof = null;
			ELEERRMessage msgError = null;
			UserPos	userPO = null;	

		try {

			msgCnof = new datapro.eibs.beans.ESD003001Message(); 
			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = new datapro.eibs.beans.UserPos(); 
			userPO.setOption("CLIENT");
			userPO.setPurpose("INQUIRY");
			ses.setAttribute("cnof", msgCnof);
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

	  	} catch (Exception ex) {
			flexLog("Error: " + ex); 
	  	}

		try {
			flexLog("About to call Page: " + LangPath + "ESD0030_cnof_enter_search.jsp");
			callPage(LangPath + "ESD0030_cnof_enter_search.jsp", req, res);	
		}
		catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}

	protected void procReqReferenceList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ESD003001Message msgList = null;
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
			msgList = (ESD003001Message) mc.getMessageRecord("ESD003001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD003001");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			try{
				msgList.setE01CNOTCN(req.getParameter("E01CNOTCN"));
			} catch (Exception e) {
				msgList.setE01CNOTCN("   ");
			}
			try{
				msgList.setE01CNODCN(req.getParameter("E01CNODCN"));
			} catch (Exception e) {
				msgList.setE01CNODCN("    ");
			}
            if (!msgList.getE01CNOTCN().equals(""))
            {
            	msgList.setH01OPECOD("0016");
            } 
            else if (!msgList.getE01CNODCN().equals(""))
            {
            	msgList.setH01OPECOD("0017");
            }
			flexLog("ESD003001 Message Sent" + msgList);
			msgList.send();
			msgList.destroy();
			flexLog("ESD003001 Message Sent");
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

				// showERROR(msgError);
				//beanList.setNoResult(true);

				flexLog("Putting java beans into the session");
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

			if (newmessage.getFormatName().equals("ESD003001")) {

				JBObjList beanList = new JBObjList();

				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				String chk = "";
				String TableTyp = "";
				//var for ofac status
				//var for Warning status
				String chkOfac = "";
				String chkWarn = "";
				int compar = 0;
				int indexRow = 0;
				while (true) {

					msgList = (ESD003001Message) newmessage;

					marker = msgList.getE01CNOOPE();

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
				ses.setAttribute("ESD003001Help", beanList);
				ses.setAttribute("userPO", userPO);

				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "ESD0030_cnof_enter_list.jsp");
					callPage(
						LangPath + "ESD0030_cnof_enter_list.jsp",
						req,
						res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}

			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Data Receiving");
		}

	}

	protected void procReqCodesList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ESD003001Message msgtable = null;
		ESD003002Message msgList = null;
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
			msgList = (ESD003002Message) mc.getMessageRecord("ESD003002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("ESD0030");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02SCRCOD("01");
			msgList.setH02OPECOD("0015");
			
			try{
				msgList.setE02CNOCFL(req.getParameter("TABLECODE"));
			} catch (Exception e) {
				msgList.setE02CNOCFL(userPO.getHeader6());
			}
			try{
				msgList.setE02CNODSC(req.getParameter("TABLEDESC"));
			} catch (Exception e) {
				msgList.setE02CNODSC(" ");
			}
			
			
			msgList.send();
			msgList.destroy();
			flexLog("ESD003002 Message Sent");
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

				flexLog("Putting java beans into the session");
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

			if (newmessage.getFormatName().equals("ESD003001")) {

				msgtable = (ESD003001Message) newmessage;


				flexLog("Putting java beans into the session");
				ses.setAttribute("msgtable", msgtable);

			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e + newmessage);
			throw new RuntimeException("Socket Communication Error Receiving");
		}

		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ESD003002")) {

				JBObjList beanList = new JBObjList();

				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				String chk = "";
				String TableTyp = "";
				int compar = 0;
				int indexRow = 0;
				while (true) {

					msgList = (ESD003002Message) newmessage;

					marker = msgList.getE02CNOOPE();

					if (firstTime) {
						firstTime = false;
						chk = "checked";
						userPO.setHeader10(msgList.getE02CNOCFL());
						userPO.setHeader5(msgList.getE02CNOSCR());
						userPO.setHeader6(msgList.getE02CNOCFL());
						
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
				ses.setAttribute("ESD003002Help", beanList);
				ses.setAttribute("userPO", userPO);

				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "ESD0030_cnof_reference_list.jsp");
					callPage(
						LangPath + "ESD0030_cnof_reference_list.jsp",
						req,
						res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}

			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Data Receiving");
		}

	}

	protected void procActionMaintenance(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ESD003002Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		int acctype = 0;

		try {   
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgRT = (ESD003002Message) ses.getAttribute("refCodes");
			msgRT.setH02USERID(user.getH01USR());
			msgRT.setH02PROGRM("ESD0030");
			msgRT.setH02TIMSYS(getTimeStamp());
			msgRT.setH02OPECOD("0005");
			
			if (req.getParameter("E02CNORCD")!= null) {
				msgRT.setE02SETRCD(req.getParameter("E02CNORCD"));
			} else  if (req.getParameter("E02CNOMID")!= null) {
		       msgRT.setE02CNOMID(req.getParameter("E02CNOMID"));
			   msgRT.setE02SETRCD(req.getParameter("E02CNOMID"));
		    }
			
			setMessageRecord(req, msgRT);
			setMessageField(msgRT, "E02SETRUT", req.getParameter("E02CNORUT"));
			try {
				((CharacterField) msgRT.getField("E02CNOEML")).setStringUD(req.getParameter("E02CNOEML"));
  			} catch (Exception e) {
			}
  			
			mc.sendMessage(msgRT);
			flexLog("ESD003002 Message Sent");
			msgRT.destroy();
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

			if (newmessage.getFormatName().equals("ESD003002")) {
				msgRT = (ESD003002Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("refCodes", msgRT);
				ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors
					res.sendRedirect(
						super.srctx
							+ "/servlet/datapro.eibs.params.JSESD0030?SCREEN=400");
				} else { // There are errors
					int screencode = Integer.parseInt(userPO.getHeader5());
					String tablecode = userPO.getHeader6();
					String country = user.getE01INT();

					callPage(getRedirectPage(screencode, tablecode, country, req.getParameter("E01CNOFLD")), req, res);

				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	protected void procActionDelete(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ESD003002Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		int acctype = 0;
	
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
	
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		try {
					JBObjList bl = (JBObjList) ses.getAttribute("ESD003002Help");
					int idx = Integer.parseInt(req.getParameter("CURRCODE").trim());
					bl.setCurrentRow(idx);
	
			msgRT = (ESD003002Message) bl.getRecord();
			
				
	
				} catch (Exception e) {
					e.printStackTrace();
					flexLog("Error: " + e);
					throw new RuntimeException("Socket Communication Error");
				}		
	
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgRT.setH02USERID(user.getH01USR());
			msgRT.setH02PROGRM("ECH011001");
			msgRT.setH02TIMSYS(getTimeStamp());
			msgRT.setH02OPECOD("0009");
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
			//msgRT.destroy();
			flexLog("ESD003002 Message Sent");
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
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

			if (IsNotError) { // There are no errors
				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSESD0030?SCREEN=400");
			}
			else { // There are errors
				flexLog("About to call Page: " + LangPath + "ESD0030_cnof_reference_list.jsp");
				callPage(LangPath + "ESD0030_cnof_reference_list.jsp", req, res);
			}
	
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	
	
	}

	protected void procReqNew(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ESD003002Message msgRT = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("NEW");
		msgRT = new ESD003002Message();
		msgRT.setE02CNOCFL(userPO.getHeader10());
		msgRT.setH02TIMSYS(getTimeStamp());
		ses.setAttribute("refCodes", msgRT);
		ses.setAttribute("userPO", userPO);

		int screencode = Integer.parseInt(userPO.getHeader5());
		String tablecode = userPO.getHeader6();
		String country = user.getE01INT();

		callPage(getRedirectPage(screencode, tablecode, country, req.getParameter("E01CNOFLD")), req, res);

	}


	protected void procReqMaintenance(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		ESD003002Message msgDoc = null;
		UserPos userPO = null;
		
		String Seq1 = "";
		String Seq2 = "";
		String Pag1 = "";
		String Pag2 = "";
		String SeqPag1 = "";
		String SeqPag2 = "";
		String Freq1 = "";
		String Freq2 = "";
		String Day1 = "";
		String Day2 = "";

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Receive Data
		try {
			JBObjList bl = (JBObjList) ses.getAttribute("ESD003002Help");
			int idx = Integer.parseInt(req.getParameter("CURRCODE").trim());
			bl.setCurrentRow(idx);

			msgDoc = (ESD003002Message) bl.getRecord();
			
			userPO.setHeader8("");
			userPO.setHeader9("");
			userPO.setHeader10("");
			userPO.setHeader11("");			
			userPO.setHeader15("");
			userPO.setHeader16("");
			userPO.setHeader17("");
			userPO.setHeader18("");
			userPO.setHeader19("");
			userPO.setHeader20("");
			
			
			//Setting Values for Country Codes
			try{
				Seq1 = msgDoc.getE02CNOCPC().substring(0,2);
			} catch (Exception e) {
			}
			try{
				Seq2 = msgDoc.getE02CNOCPC().substring(2,4);
			} catch (Exception e) {
			}
			try{			
				Pag1 = msgDoc.getE02CNODCC().substring(0,1);
			} catch (Exception e) {
			}
			try{
				SeqPag1 = msgDoc.getE02CNODCC().substring(1,2);
			} catch (Exception e) {
			}
			try{
				Pag2 = msgDoc.getE02CNOSCY().substring(1,2);
			} catch (Exception e) {
			}
			try{
				SeqPag2 = msgDoc.getE02CNOSCY().substring(2,3);
			} catch (Exception e) {
			}
			//Setting Process Type
			try{
				Freq1 = msgDoc.getE02CNODCC().substring(0,1);
			} catch (Exception e) {
			}
			try{
				Freq2 = msgDoc.getE02CNODCC().substring(1,2);
			} catch (Exception e) {
			}
			try{
				Day1 = msgDoc.getE02CNOCPC().substring(0,2);
			} catch (Exception e) {
			}
			try{
				Day2 = msgDoc.getE02CNOCPC().substring(2,4);
			} catch (Exception e) {
			}
						
			

			userPO.setHeader8(Freq1);
			userPO.setHeader9(Day1);
			userPO.setHeader10(Freq2);
			userPO.setHeader11(Day2);
			
			userPO.setHeader15(Seq1);
			userPO.setHeader16(Pag1);
			userPO.setHeader17(SeqPag1);

			userPO.setHeader18(Seq2);
			userPO.setHeader19(Pag2);
			userPO.setHeader20(SeqPag2);
			userPO.setPurpose("UPD");

			flexLog("Putting java beans into the session");
			
			ses.setAttribute("refCodes", msgDoc);
			ses.setAttribute("userPO", userPO);
			
			int screencode = Integer.parseInt(userPO.getHeader5().trim());
			String tablecode = userPO.getHeader6();
			String country = user.getE01INT();

			callPage(getRedirectPage(screencode, tablecode, country, req.getParameter("E01CNOFLD")), req, res);


		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	private String getRedirectPage(int screencode, String tablecode, String country, String fld) {
		//Screen Code Selection
		String ret = "";
		switch (screencode) {
			case 1 : //Process Type
				ret = "ESD0030_cnof_process_type_details.jsp";
				break;
			case 2 : //Transaction Codes
				ret = "ESD0030_cnof_transactions_codes_details.jsp";
				break;
			case 3 : //Country Codes
				ret = "ESD0030_cnof_country_codes_details.jsp";
				break;
			case 4 : //Generic
				if (tablecode.equals("05")) { //Collateral types
					ret = "ESD0030_cnof_collat_types_codes_details.jsp";
				} else if (tablecode.equals("37")) { //Proposal Status
					ret = "ESD0030_cnof_proposal_status_details.jsp";
				} else if (tablecode.equals("34")) { //Type of IDS
					ret = "ESD0030_cnof_id_type_details.jsp";
				} else if (tablecode.equals("O")) { //Officer
					ret = "ESD0030_cnof_officer_details.jsp";
				} else if (tablecode.equals("48")) { //Proposal Routes
					ret = "ESD0030_cnof_proposal_routes_details.jsp";
				} else if(tablecode.equals("80") && country.equals("18")){// Comunas de Chile  
					ret = "ESD0030_cnof_chile_comunas.jsp";
				} else if(tablecode.equals("84") && country.equals("18")){// Ciudades de Chile  
					ret = "ESD0030_cnof_chile_ciudades.jsp";
				} else if(tablecode.equals("88") && country.equals("18")){// Provincias de Chile  
					ret = "ESD0030_cnof_chile_provincias.jsp";
				} else if(tablecode.equals("SO") && country.equals("18")){// Provincias de Chile  
					ret = "ESD0030_cnof_chile_tipo_solicitud.jsp";
				} else if ( tablecode.equals("80") && (country.equals("03") ||country.equals("05"))) {
					//PARROQUIA VENEZUELA & COLOMBIA
					ret = "ESD0030_cnof_parroquia_details.jsp";
				} else if ( tablecode.equals("84") && (country.equals("03") ||country.equals("05"))) {
					//CIUDAD VENEZUELA & COLOMBIA
					ret = "ESD0030_cnof_ciudad_details.jsp";
				} else if ( tablecode.equals("85") && (country.equals("03") ||country.equals("05"))) {
					//MUNICIPIOS BANCO-TESORO VENEZUELA & COLOMBIA
					ret = "ESD0030_cnof_municipio_details.jsp";
				} else if ( tablecode.equals("PE") && country.equals("07")) { //Corregimientos Panama
					ret = "ESD0030_cnof_corregimiento_details.jsp";
				} else if ( tablecode.equals("PI") && country.equals("07")) { //Distritos Panama
					ret = "ESD0030_cnof_distrito_details.jsp";
				} else if ( tablecode.equals("59" ) && country.equals("07")) { //Cod Postal Panama
					ret = "ESD0030_cnof_codigoPostal_Panama_details.jsp";
				} else if(tablecode.equals("YJ")){// Tipos de Papel Valor
					ret = "ESD0030_cnof_papel_valor_type_detail.jsp";
				} else if(tablecode.equals("YI")){// SubTipos de Papel Valor
					ret = "ESD0030_cnof_papel_valor_subtype_detail.jsp";
				} else if(tablecode.equals("MC")){  // CODIGOS COMERCIOS TARJETAS
					ret = "ESD0030_cnof_dcard_codes_details.jsp";
				} else if(tablecode.equals("15") || tablecode.equals("CA")){  // EJECUTIVOS DE CUENTAS O VENTAS
					ret = "ESD0030_cnof_ejecutivos_15.jsp";
				} else if(tablecode.equals("2D")){  // BANESCO COMPANIA DE COBRO
					ret = "ESD0030_cnof_company_2d_details.jsp";
				} else if(tablecode.equals("12")){  // ACTIVIDAD ECONOMICA
					ret = "ESD0030_cnof_actividad_economica_12.jsp"; 
				} else if ( tablecode.equals("P2") ) { //CODIGO DE ACTIVIDADES - PROPUESTA DE CREDITO
					ret = "ESD0030_cnof_proposal_P2_details.jsp";
				} else if ( tablecode.equals("P5") ) { //VARIABLES FINANCIERAS - PROPUESTA DE CREDITO
					ret = "ESD0030_cnof_proposal_P5_details.jsp";
				} else if ( tablecode.equals("P7") ) { //SUBTIPOS DE OPERACION - PROPUESTA DE CREDITO
					ret = "ESD0030_cnof_subtipo_operacion_details.jsp";
				} else if ( tablecode.equals("YQ") ) { //ABOGADOS - GARANTIAS
					ret = "ESD0030_cnof_collaterals_YQ_details.jsp";
				} else if ( tablecode.equals("P0") ) { //Codigos Posicion Tesoreria
					ret = "ESD0030_cnof_codigo_posicion_tesoreria.jsp";
				} else if ( tablecode.equals("AP") ) { //Codigos Numeracion automatica
					ret = "ESD0030_cnof_automatic_numeration.jsp";
				} else if ( tablecode.equals("SQ") ) { //Codigos Numeracion automatica Secuenciales
					ret = "ESD0030_cnof_sequencial_codes.jsp";
				} else if(tablecode.equals("IN")){  // Relaciones
				   	ret = "ESD0030_cnof_relationship_details.jsp"; 
				} else if(tablecode.equals("DO")){  // TIPOS DE TELEFONO
					ret = "ESD0030_cnof_phone_details.jsp";
				} else if(tablecode.equals("SS")){  // Generic Segmentation SARLAFT
					ret = "ESD0030_cnof_generic_segmentation_sarlaft.jsp";
				} else if(tablecode.equals("S5")){  // Generic Segmentation Client
					ret = "ESD0030_cnof_generic_segmentation_client.jsp";
				} else if(tablecode.equals("5S")){  // Generic Perfil Crediticio Client
					ret = "ESD0030_cnof_generic_perfil_crediticio_client.jsp";
				} else if(tablecode.equals("ES")){  // Generic Reserve Account
					ret = "ESD0030_cnof_generic_reserve_account.jsp";
				} else if(tablecode.equals("QM")){  // Quantity Message
					ret = "ESD0030_cnof_qty_messages.jsp";
				} else if(tablecode.equals("TU")){  // Cuenta de Utilidad o perdida
					ret = "ESD0030_cnof_details_TU.jsp";
				} else if(tablecode.equals("AX")){  // Causales AXON
					ret = "ESD0030_cnof_details_AX.jsp";
				} else if(tablecode.equals("NG")){  // Nota de Gerencia
					ret = "ESD0030_cnof_generic_management_note_account.jsp";
				} else if(tablecode.equals("EP")){  // Estados de Pagare
					ret = "ESD0030_cnof_estado_pagare.jsp";
				} else if(tablecode.equals("BT")){  // Proveedores
					ret = "ESD0030_cnof_vendors.jsp";
				} else if(tablecode.equals("S3")){  // SubActividad Economica
					ret = "ESD0030_cnof_subactividad_economica.jsp";	
				} else if(tablecode.equals("G0")){  // Estado transaccional garantias
					ret = "ESD0030_cnof_details_G0.jsp";	
				} else if(tablecode.equals("GO")){  // Destino bien inmueble garantias
					ret = "ESD0030_cnof_details_GO.jsp";
				} else if(tablecode.equals("92")){  // Codigos de compensacion
					ret = "ESD0030_cnof_code_exchange.jsp";
				} else if(tablecode.equals("GN")){  // Estrato bien inmueble garantias
					ret = "ESD0030_cnof_details_GN.jsp";	
				} else if(tablecode.equals("FJ")){  // Estrato bien inmueble garantias
					ret = "ESD0030_cnof_details_FJ.jsp";	
				} else if(tablecode.equals("CH")){  // Estrato bien inmueble garantias
					ret = "ESD0030_cnof_checkbooks_types.jsp";
				} else if(tablecode.equals("YA")){  // Productos FNG
					ret = "ESD0030_cnof_details_YA.jsp";
				} else { //Generic 4 digits to 6 Digits
					int flds = 4; 
					if (fld != null)
						try {
							flds = Integer.parseInt(fld);
						} catch (Exception e) {
							flds = 4;
						}
						
					if(flds == 1) {
						ret = "ESD0030_cnof_generic_single_digit_codes_details.jsp";
					} else if(flds > 4) {
						ret = "ESD0030_cnof_generic_long_codes_details.jsp";
					} else {
						ret = "ESD0030_cnof_generic_short_codes_details.jsp";
					}
				}
				break;
			case 5 : //Insurance Company
				ret = "ESD0030_cnof_insurance_company_codes_details.jsp";
				break;
			case 6 : //Account Cancellation
				ret = "ESD0030_cnof_cancellation_accounts.jsp";
				break;
			case 7 : //Credit Card Type Codes
				ret = "ESD0030_cnof_ccard_typ_codes_details.jsp";
				break;
			case 8 : //Credit Card Issuers
				ret = "ESD0030_cnof_ccard_iss_codes_details.jsp";
				break;
			case 9 : //Credit Card 
				ret = "ESD0030_cnof_ccard_typ_codes_details.jsp";
				break;
			case 10 : //Credit Card Billing Cycle
				ret = "ESD0030_cnof_ccard_billing_cycle_details.jsp";
				break;
			case 11 : //Single Digit Simple table
				ret = "ESD0030_cnof_generic_single_digit_codes_details.jsp";
				break;
			case 21 : // ID type
				if (tablecode.equals("34")){  
					ret = "ESD0030_cnof_id_type_details.jsp";
				}
				break;
			case 24 : // Generic With Variable Fields
				ret = "ESD0030_cnof_generic_variable_fields.jsp";
				break;
			case 25 : //Source-Destiny of Funds
				ret = "ESD0030_cnof_funds.jsp";
				break;
			case 51 : // Automatic Overdrafts
				if (tablecode.equals("BA")) { // Clasificación Clientes Sobregiro
					ret = "ESD0030_cnof_overdraft_clasif_details.jsp";
				}
				break;
				
			default :
				ret = "ESD0030_cnof_generic_short_codes_details.jsp";

		}
		return LangPath + ret;
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

			int screen = A_POSITION;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("ESD0030", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}
					flexLog("entre con screen = " + screen);
					switch (screen) {

					case R_ENTER_SEARCH :
						procReqEnterSearch(mc, msgUser, req, res, session);
						break;
						case R_REFERENCE_LIST :
							procReqReferenceList(mc, msgUser, req, res, session);
							break;
							
						case R_CODES_LIST :
							procReqCodesList(mc, msgUser, req, res, session);
							break;
							
						case R_NEW :
							procReqNew(mc, msgUser, req, res, session);
							break;
							
						case R_MAINTENANCE :
							procReqMaintenance(mc, msgUser, req, res, session);
							break;

						case A_POSITION :
							procActionPos(mc, msgUser, req, res, session);
							break;

						case A_MAINTENANCE :
							procActionMaintenance(mc, msgUser, req, res, session);
							break;

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

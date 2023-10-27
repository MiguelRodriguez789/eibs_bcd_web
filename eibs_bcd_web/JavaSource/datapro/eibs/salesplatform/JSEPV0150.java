package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECO004001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV015001Message;
import datapro.eibs.beans.EPV015002Message;
import datapro.eibs.beans.EPV015003Message;
import datapro.eibs.beans.EPV015030Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import net.sf.json.JSONObject;

public class JSEPV0150 extends JSEIBSServlet {

	protected static final int R_PLATFORM_LIST = 100;
	protected static final int A_PLATFORM_LIST = 101;
	protected static final int R_PROD_DETAILS = 200;
	protected static final int R_NEW_LOAN = 300;
	protected static final int A_NEW_DETAILS = 301;
	protected static final int CONVENIO_COMISSION_CALCULATION = 311;
	protected static final int NEW_COMISSION_CALCULATION = 312;
	protected static final int R_MAINT_LOAN = 400;
	protected static final int R_ENTER_MAINT = 401;
	protected static final int R_DIS_LOAN = 500;
	protected static final int A_DIS_LOAN = 600;
	protected static final int R_ASIGN_CONVENIO = 700;
	protected static final int A_ASIGN_CONVENIO = 701;
	protected static final int R_ASIGN_ACC = 710;
	protected static final int A_ASIGN_ACC = 711;
	
	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		switch (screen) {
			case R_PLATFORM_LIST:
				procReqPlatformList(user, req, res, session);
				break;
			case A_PLATFORM_LIST:
				procActionPlatformList(user, req, res, session);
				break;
			case R_PROD_DETAILS:
				procReqProductDetails(user, req, res, session);
				break;
			case R_NEW_LOAN:
				procReqNewLoan(user, req, res, session);
				break;
			case A_NEW_DETAILS:
				procActionProductDetails(user, req, res, session);
				break;
			case R_MAINT_LOAN:
				procReqMaintLoan(user, req, res, session);
				break;
			case R_ENTER_MAINT:
				procReqEnterMaint(user, req, res, session);
				break;
			case R_DIS_LOAN:
				procReqDisbursementLoan(user, req, res, session);
				break;
			case A_DIS_LOAN:
				procActionDisbursementLoan(user, req, res, session);
				break;
			case R_ASIGN_CONVENIO:
				procReqAsignConveio(user, req, res, session);
				break;
			case A_ASIGN_CONVENIO:
				procActionAsignConvenio(user, req, res, session);
				break;
			case R_ASIGN_ACC:
				procReqAsignAcc(user, req, res, session);
				break;
			case A_ASIGN_ACC:
				procActAsignAcc(user, req, res, session);
				break;
			case CONVENIO_COMISSION_CALCULATION:				
			case NEW_COMISSION_CALCULATION:
				calculateComissionCharges(user, req, res, session, screen);
				break;				
			default:
				forward(devPage, req, res);
				break;
		}
	}


	private void calculateComissionCharges(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
			throws ServletException, IOException {
		MessageProcessor mp = null;
		String opecode = "0000";
		//Find H01OPECOD Value. Determines AS400 SubRoutine
		switch (screen) {
		case CONVENIO_COMISSION_CALCULATION:
			opecode = "0011";
			break;
		case NEW_COMISSION_CALCULATION:		
			opecode = "0012";
			break;
		}		
		
		try {
		
			mp = getMessageProcessor("EPV0150", req);
			EPV015001Message msg = (EPV015001Message) session.getAttribute("lnBasic");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV0150");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD(opecode);
			setMessageRecord(req, msg);
			mp.sendMessage(msg);
						
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JSONObject json = new JSONObject();
			json.put("type", msgError.getERRNUM().equals("0") ? "NO_ERROR": "ERROR");
			sendJSONResponse(res, json);
		}finally{
			if (mp != null)
				mp.close();			
		}
	}


	private void procReqPlatformList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setRedirect("/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=101");
		userPO.setHeader1("Ingreso Informacion de Creditos");
		userPO.setHeader4(req.getParameter("editControl") == null ? "" : req.getParameter("editControl").trim());
		session.setAttribute("userPO", userPO);
		forward("EPV0150_client_help_container.jsp", req, res);

	}

	private void procActionPlatformList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		
		try {
			mp = getMessageProcessor("EPV0150", req);
			EPV015002Message msgHeader = (EPV015002Message) mp.getMessageRecord("EPV015002");
			msgHeader.setH02USERID(user.getH01USR());
			msgHeader.setH02PROGRM("EPV0150");
			msgHeader.setH02TIMSYS(getTimeStamp());
			msgHeader.setH02SCRCOD("01");
			msgHeader.setH02OPECOD("0015");
			
			if(!(req.getParameter("E01CUN") == null)){
				msgHeader.setE02CUSCUN(req.getParameter("E01CUN"));
			} else if(!(userPO.getCusNum() == null)){
				msgHeader.setE02CUSCUN(userPO.getCusNum());
			}

			userPO.setCusNum(msgHeader.getE02CUSCUN());
			userPO.setPurpose("");
			userPO.setRedirect("1");
			
			mp.sendMessage(msgHeader);
			
			ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(error)) {
				session.setAttribute("error", error);
				session.setAttribute("userPO", userPO);
				userPO.setRedirect("/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=101");
				userPO.setHeader1("Ingreso Informacion de Creditos");
				forward("EPV0150_client_help_container.jsp", req, res);
			} else {
				msgHeader = (EPV015002Message) mp.receiveMessageRecord();

				JBObjList list = mp.receiveMessageRecordList("H03FLGMAS");

				if (list.isEmpty()) {
					procReqProductDetails(user, req, res, session); //If Empty Go Directly to Product Page 
				} else {
					session.setAttribute("msgList", list);
					session.setAttribute("msgHeader", msgHeader);
					session.setAttribute("userPO", userPO);
					forward("EPV0150_salesplatform_list.jsp", req, res);				
				}
			
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqProductDetails(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException {

		UserPos userPO = getUserPos(req);
		userPO.setHeader9("PV");
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSESD0711?TYPE=10&CUSNUM=" +  userPO.getCusNum());
		 
	}

	private void procReqNewLoan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV0150", req);
			EPV015001Message msgLoan = (EPV015001Message) mp.getMessageRecord("EPV015001");
			msgLoan.setH01USERID(user.getH01USR());
			msgLoan.setH01PROGRM("EPV0150");
			msgLoan.setH01TIMSYS(getTimeStamp());
			msgLoan.setH01SCRCOD("01");
			msgLoan.setH01OPECOD("0001");
			
		 	if (req.getParameter("E01DEAPRO")== null){
		 		msgLoan.setE01DEAPRO(userPO.getProdCode());
		 	} else {
		 		msgLoan.setE01DEAPRO(req.getParameter("E01DEAPRO"));
			 	userPO.setProdCode(req.getParameter("E01DEAPRO"));
		 	}
		 	
			msgLoan.setE01DEACUN(userPO.getCusNum());
		 	msgLoan.setE01DEAOAM(req.getParameter("E01DEAOAM") == null ? "0" : req.getParameter("E01DEAOAM").trim());
		 	msgLoan.setE01DEACNV(req.getParameter("E01DEACNV") == null ? ""  : req.getParameter("E01DEACNV").trim());

			mp.sendMessage(msgLoan);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLoan = (EPV015001Message) mp.receiveMessageRecord("EPV015001");

			if (mp.hasError(msgError)) {
				userPO.setHeader9("PV"); //Platform Venta
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSESD0711?TYPE=10&CUSNUM=" +  userPO.getCusNum());
			//	res.sendRedirect(srctx + "/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=101&E01CUN=" +  userPO.getCusNum());
			//	procReqPlatformList(user, req, res, session);				
			} else {
				userPO.setIdentifier(msgLoan.getE01DEAACC());
				userPO.setAccNum(msgLoan.getE01DEAACC());
				userPO.setApplicationCode(msgLoan.getE01DEAACD());
				userPO.setBank(msgLoan.getE01DEABNK());
				userPO.setHeader1(msgLoan.getE01DEAPRO());
				userPO.setProdCode(msgLoan.getE01DEAPRO());
				userPO.setHeader2(msgLoan.getE01DEACUN());
				userPO.setCusNum(msgLoan.getE01DEACUN());
				userPO.setHeader3(msgLoan.getE01CUSNA1());
				userPO.setCusName(msgLoan.getE01CUSNA1());
				userPO.setCurrency(msgLoan.getE01DEACCY());
				userPO.setOfficer(msgLoan.getE01DEAOFC() + " - " + msgLoan.getE01DSCOFC());
				userPO.setType(msgLoan.getE01DEATYP());

				userPO.setHeader23(msgLoan.getE01DEACLF());
				userPO.setHeader22(msgLoan.getE01DEATLN());
				userPO.setHeader21(msgLoan.getE01DEATYP());

				session.setAttribute("userPO", userPO);
				session.setAttribute("lnBasic", msgLoan);
			//Needed For Plan de Pagos, JSPAYMENT PLAN used in ln-paymentplan.jsp	
				session.setAttribute("messageName","lnBasic");				
				forward("EPV0150_loans_basic_information.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionProductDetails(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			Boolean recalcFlag = Util.getReqParameter("E01FLGRCL", req).equals("X") || Util.getReqParameter("E01FLGFVE", req).equals("Y") ;
			
			mp = getMessageProcessor("EPV0150", req);
			//EPV015001Message msg = (EPV015001Message) mp.getMessageRecord("EPV015001");
			EPV015001Message msg = (EPV015001Message) session.getAttribute("lnBasic");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV0150");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
						
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV015001Message) mp.receiveMessageRecord("EPV015001");

			//Needed For Plan de Pagos, JSPAYMENT PLAN used in ln-paymentplan.jsp	
			session.setAttribute("messageName","lnBasic");		
			
			if (mp.hasError(msgError) || msg.getH01FLGWK1().equals("Y") || recalcFlag) {
				if(recalcFlag && !mp.hasError(msgError)){
					msg.setE01FLGRCL(""); msg.setE01FLGFVE("");//Reset Flags 
				}
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("lnBasic",	msg);
				forward("EPV0150_loans_basic_information.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnBasic",	msg);
				if(userPO.getRedirect().equals("1")){
					procActionPlatformList(user, req, res, session);
				}else{
					if (userPO.getOption().equals("AV")) {
						// Viene del EPV1400
						procReqAvalados(user, req, res, session);
					} else {
						res.sendRedirect(srctx + "/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=401");
						//procReqEnterMaint(user, req, res, session);
					}
				}
			}

		} finally {
			if (mp != null)
				mp.close();
		}

	}

	private void procReqMaintLoan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV015003Message listMessage = null;
		String accNum = "";
		
		try {
			//Needed For Plan de Pagos, JSPAYMENT PLAN used in ln-paymentplan.jsp	
			session.setAttribute("messageName","lnBasic");					
			
			mp = getMessageProcessor("EPV0150", req);
			
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("msgList");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EPV015003Message)list.get(index);
			}

			userPO.setPurpose("MAINTENANCE");
			userPO.setOption("PV");
			
			EPV015001Message msgLoan = (EPV015001Message) mp.getMessageRecord("EPV015001");
			msgLoan.setH01USERID(user.getH01USR());
			msgLoan.setH01PROGRM("EPV0150");
			msgLoan.setH01TIMSYS(getTimeStamp());
			msgLoan.setH01SCRCOD("01");
			msgLoan.setH01OPECOD("0002");

			if (listMessage == null) {
				accNum = req.getParameter("E01DEAACC") == null ? "0" : req.getParameter("E01DEAACC").trim();
				if (!accNum.equals("0")) {
					userPO.setAccNum(accNum.trim());
				}
				msgLoan.setE01DEAACC(userPO.getAccNum());
			} else {
				msgLoan.setE01DEAACC(listMessage.getE03DEAACC());
			}
				
			mp.sendMessage(msgLoan);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgLoan = (EPV015001Message) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				if (listMessage == null) {
					procReqEnterMaint(user, req, res, session);
				} else {
					procActionPlatformList(user, req, res, session);
				}
			} else {
				userPO.setIdentifier(msgLoan.getE01DEAACC());
				userPO.setAccNum(msgLoan.getE01DEAACC());
				userPO.setApplicationCode(msgLoan.getE01DEAACD());
				userPO.setBank(msgLoan.getE01DEABNK());
				userPO.setHeader1(msgLoan.getE01DEAPRO());
				userPO.setProdCode(msgLoan.getE01DEAPRO());
				userPO.setHeader2(msgLoan.getE01DEACUN());
				userPO.setCusNum(msgLoan.getE01DEACUN());
				userPO.setHeader3(msgLoan.getE01CUSNA1());
				userPO.setCusName(msgLoan.getE01CUSNA1());
				userPO.setCurrency(msgLoan.getE01DEACCY());
				userPO.setOfficer(msgLoan.getE01DEAOFC() + " - " + msgLoan.getE01DSCOFC());
				userPO.setType(msgLoan.getE01DEATYP());

				userPO.setHeader23(msgLoan.getE01DEACLF());
				userPO.setHeader22(msgLoan.getE01DEATLN());
				userPO.setHeader21(msgLoan.getE01DEATYP());

				session.setAttribute("userPO", userPO);
				session.setAttribute("lnBasic", msgLoan);
				forward("EPV0150_loans_basic_information.jsp", req, res);
			}
						
		} finally {
			if(mp !=null)
				mp.close();
		}
	}

	private void procReqEnterMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("LN");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("2");
		userPO.setRedirect("/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=400");
		userPO.setProdCode("10");
		//Others Parameters
		userPO.setHeader1("E01DEAACC");
		userPO.setHeader2("H01FLGWK2");
		
		session.setAttribute("userPO", userPO);
		
		forward("GENERIC_account_enter.jsp", req, res);
		
	}

	private void procReqDisbursementLoan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV0150", req);
			
			EPV015030Message msgLoan = (EPV015030Message) mp.getMessageRecord("EPV015030");
			msgLoan.setH30USERID(user.getH01USR());
			msgLoan.setH30PROGRM("EPV0150");
			msgLoan.setH30TIMSYS(getTimeStamp());
			msgLoan.setH30SCRCOD("01");
			msgLoan.setH30OPECOD("0002");
			msgLoan.setE30DEAACC(userPO.getAccNum());
			
			mp.sendMessage(msgLoan);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgLoan = (EPV015030Message) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV0150_loans_basic_information.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnTrans", msgLoan);
				forward("EPV0150_loans_disbursement.jsp", req, res);
			}
						
		} finally {
			if(mp !=null)
				mp.close();
		}
	}

	private void procActionDisbursementLoan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			//Needed For Plan de Pagos, JSPAYMENT PLAN used in ln-paymentplan.jsp	
			session.setAttribute("messageName","lnBasic");		
			
			mp = getMessageProcessor("EPV0150", req);
			EPV015030Message msgLoan = (EPV015030Message) mp.getMessageRecord("EPV015030");
			msgLoan.setH30USERID(user.getH01USR());
			msgLoan.setH30PROGRM("EPV0150");
			msgLoan.setH30TIMSYS(getTimeStamp());
			msgLoan.setH30SCRCOD("01");
			msgLoan.setH30OPECOD("0005");
			msgLoan.setE30DEAACC(userPO.getAccNum());
			
			setMessageRecord(req, msgLoan);
			
			mp.sendMessage(msgLoan);
						
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLoan = (EPV015030Message) mp.receiveMessageRecord("EPV015030");

			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("lnTrans",	msgLoan);
				forward("EPV0150_loans_disbursement.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnBasic",	msgLoan);
//				forward("EPV0150_salesplatform_list.jsp", req, res);
				procActionPlatformList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	private void procReqAsignConveio(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		forward("EPV0150_asign_convenio.jsp", req, res);
		
	}

	private void procActionAsignConvenio(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ECO0040", req);
			
			ECO004001Message msgConv = (ECO004001Message) mp.getMessageRecord("ECO004001");
			msgConv.setH01USERID(user.getH01USR());
			msgConv.setH01TIMSYS(getTimeStamp());
			msgConv.setH01SCRCOD("01");
			msgConv.setH01OPECOD("0001");	
			msgConv.setE01CCNCOD(req.getParameter("E01CCNCOD").trim());
			msgConv.setE01CCNCUN(Util.getReqParameter("CusNum", req ,userPO.getCusNum()));
			
			mp.sendMessage(msgConv);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				printClose(res.getWriter());
				//forward("EPV0150_loans_basic_information.jsp", req, res);
			} else {
				session.setAttribute("error", msgError);
				forward("EPV0150_asign_convenio.jsp", req, res);
			}
		} finally {
			if (mp != null)	mp.close();
		}

	}

	private void procReqAsignAcc(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EPV0150", req);
			
			EPV015001Message msgAcc = (EPV015001Message) mp.getMessageRecord("EPV015001");
			msgAcc.setH01USERID(user.getH01USR());
			msgAcc.setH01TIMSYS(getTimeStamp());
			msgAcc.setH01SCRCOD("01");
			msgAcc.setH01OPECOD("0013");	
			msgAcc.setH01FLGWK1(Util.getReqParameter("FLG", req, ""));
			msgAcc.setE01DEACUN(Util.getReqParameter("CUN", req, userPO.getCusNum()));
			msgAcc.setE01NEWACC(Util.getReqParameter("ACC", req, ""));
			msgAcc.setE01PRODUC(Util.getReqParameter("PRO", req, ""));
			
			mp.sendMessage(msgAcc);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgAcc = (EPV015001Message) mp.receiveMessageRecord("EPV015001");

			session.setAttribute("userPO", userPO);
			JSONObject json = new JSONObject();
			json.put("type", "data");
			json.put("NEWACC", msgAcc.getE01NEWACC());
			json.put("PRODUC", msgAcc.getE01PRODUC());
			json.put("DEAPVI", msgAcc.getE01DEAPVI());
			json.put("PAGOPE", msgAcc.getE01PAGOPE());
			json.put("PAGGLN", msgAcc.getE01PAGGLN());
			json.put("PAGCON", msgAcc.getE01PAGCON());
			json.put("PAGACC", msgAcc.getE01PAGACC());
			sendJSONResponse(res, json);
			
		} finally {
			if (mp != null)	mp.close();
		}

	}

	private void procActAsignAcc(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

	}
	
	private void procReqAvalados(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException {
	
		UserPos userPO = getUserPos(req);
	
		res.sendRedirect(srctx + "/servlet/datapro.eibs.salesplatform.JSEPV1400?SCREEN=1&appCode=10&typCode=S&stsCode=H");
		 
	}
	
}

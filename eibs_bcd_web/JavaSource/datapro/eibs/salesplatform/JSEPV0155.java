package datapro.eibs.salesplatform;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;

import datapro.eibs.beans.EPV015001Message;
import datapro.eibs.beans.EPV015501Message;
import datapro.eibs.beans.EPV015503Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelResultSet;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.services.ExcelXLSXResultSet;
import datapro.eibs.sockets.DecimalField;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.tools.BufferedHttpResponseWrapper;

@SuppressWarnings("serial")
public class JSEPV0155 extends JSEIBSServlet {

	private ServletConfig config = null;
	
	// 
	protected static final int R_ENTER_ACCOUNT = 1;
	protected static final int A_ENTER_ACCOUNT = 2;
	protected static final int R_LIST          = 100;
	protected static final int R_MAINT         = 200;
	protected static final int A_MAINT_TO_SCK  = 502;
	protected static final int A_MAINT_FILE    = 507;
	protected static final int A_MAINT_PMNT    = 508;
	protected static final int AJAX_FORM_UPDATE = 1000;
	
	protected static final int colNum = 10;
	
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen){
			case R_ENTER_ACCOUNT: 
				procReqEnterAccount(user, req, res, session);
            	break;
			case A_ENTER_ACCOUNT: 
				procActionEnterAccount(user, req, res, session);
            	break;
			case R_LIST :
				procReqList(user, req, res, session);
				break;											
			case R_MAINT :
				procReqMaint(user, req, res, session);
				break;
			case A_MAINT_TO_SCK :
				procActionMaintBeansToSck(user, req, res, session, screen);
				break;
			case A_MAINT_FILE :
				procActionMaintFil(user, req, res, session);
				break;
			case AJAX_FORM_UPDATE:
			case A_MAINT_PMNT :
				procActionMaintPay(user, req, res, session,screen);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	protected void procReqEnterAccount(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		ELEERRMessage msgError = null;
		
		try {
			
			msgError = new ELEERRMessage();
			userPO.setOption("LN");
			userPO.setPurpose("MAINTENANCE");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.removeAttribute("list");
	      
			forward("EPV0155_ln_enter_account.jsp", req, res);
			
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

	}
	
	protected void procActionEnterAccount(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		String pageName = "";
		String empPP = "";
		MessageProcessor mp = null;
		JBListRec msgList = new JBListRec();
		
		try {

			empPP = (String) session.getAttribute("EMPPP");
			empPP = (empPP == null) ? "" : empPP;
			
			mp = getMessageProcessor("EPV0155", req);
			EPV015501Message msg = (EPV015501Message) mp.getMessageRecord("EPV015501");
		
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV0155");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			msg.setH01FLGMAS("");
			
			msg.setE01DEAACC(getParam(req.getParameter("E01DEAACC"), "D"));
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV015501Message) mp.receiveMessageRecord("EPV015501");
		
			if (mp.hasError(msgError) && empPP.equals("")) {
				pageName = "EPV0155_ln_enter_account.jsp";
				session.setAttribute("error", msgError);
			} else {
				pageName = "EPV0155_ln_pay_pln.jsp";
				msgList  = getList(user, req);
				//procReqList(user, req, res, session);
			}
		
			session.setAttribute("header", msg);
			session.setAttribute("list", msgList);
			session.setAttribute("userPO", userPO);
		
			forward(pageName, req, res);
		
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private static JBListRec getList(ESS0030DSMessage user, HttpServletRequest req) 
        throws ServletException, IOException {
    	
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
    	JBListRec result = new JBListRec();

    	result.init(colNum);
    	
		try {
			String myRow[] = new String[colNum];
			for (int i=0; i<colNum; i++) {
				myRow[i] = "";
			}
			String marker = "";
				
			mp = new MessageProcessor("EPV0155");
			EPV015503Message msg = (EPV015503Message) mp.getMessageRecord("EPV015503");

			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("EPV0155");
			msg.setH03TIMSYS(getTimeStamp());
			msg.setH03SCRCOD("01");
			msg.setH03OPECOD("0001");
			msg.setH03FLGMAS("");
				
			msg.setE03DEAACC(getParam(req.getParameter("E01DEAACC"), "D"));

			mp.sendMessage(msg);				

			while (true) {
				newmessage = mp.receiveMessageRecord();
				EPV015503Message msgPmnt = (EPV015503Message) newmessage;
				marker = msgPmnt.getH03FLGMAS();
				if ("*".equals(marker)) break;
				myRow[0] =  Util.trim(msgPmnt.getE03DLPPNU());	// Quote Number
				myRow[1] =  Util.trim(msgPmnt.getE03DLPPDM());	// Date
				myRow[2] =  Util.trim(msgPmnt.getE03DLPPDD());	// Date
				myRow[3] =  Util.trim(msgPmnt.getE03DLPPDY());	// Date
				myRow[4] =  Util.trim(msgPmnt.getE03AMOUNT());	// Total Payment
				myRow[5] =  Util.trim(msgPmnt.getE03DLPIIP());	// Distribution
				myRow[6] =  Util.trim(msgPmnt.getE03DLPPRI());	// Principal
				myRow[7] =  Util.trim(msgPmnt.getE03DLPINT());	// Interest 
				myRow[8] =  Util.trim(msgPmnt.getE03SALPRI());	// Balance/Saldo
				myRow[9] =  Util.trim(msgPmnt.getE03FLGPRO());	// Paid Flag
				result.addRow("", myRow);
			}

		} finally {
			if (mp != null) mp.close();
		}

        return result;
    }
    
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		JBListRec pmntList = new JBListRec();
		
		pmntList.init(colNum);

		try {
			String myRow[] = new String[colNum];
			for (int i=0; i<colNum; i++) {
				myRow[i] = "";
			}
			String marker = "";
				
			mp = new MessageProcessor("EPV0155");
			EPV015503Message msg = (EPV015503Message) mp.getMessageRecord("EPV015503");

			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("EPV0155");
			msg.setH03TIMSYS(getTimeStamp());
			msg.setH03SCRCOD("01");
			msg.setH03OPECOD("0001");
			msg.setH03FLGMAS("");
				
			msg.setE03DEABNK(getParam(req.getParameter("E01DEABNK"), "C"));
			msg.setE03DEABRN(getParam(req.getParameter("E01DEABRN"), "D"));
			msg.setE03DEACCY(getParam(req.getParameter("E01DEACCY"), "C"));
			msg.setE03DEAACC(getParam(req.getParameter("E01DEAACC"), "D"));
			msg.setE03DEARTE(getParam(req.getParameter("E01DEARTE"), "D"));
			msg.setE03DEAFRT(getParam(req.getParameter("E01DEAFRT"), "D"));
			msg.setE03DEAOAM(getParam(req.getParameter("E01DEAOAM"), "D"));
			msg.setE03DEAODM(getParam(req.getParameter("E01DEAODM"), "D"));
			msg.setE03DEAODD(getParam(req.getParameter("E01DEAODD"), "D"));
			msg.setE03DEAODY(getParam(req.getParameter("E01DEAODY"), "D"));
			msg.setE03DEACUN(getParam(req.getParameter("E01DEACUN"), "D"));
			msg.setE03DEABAS(getParam(req.getParameter("E01DEABAS"), "D"));
			msg.setE03DEAICT(getParam(req.getParameter("E01DEAICT"), "C"));
			msg.setE03DEATYP(getParam(req.getParameter("E01DEATYP"), "C"));
			msg.setE03DEASPR(getParam(req.getParameter("E01DEASPR"), "C"));
			msg.setE03DEA2TC(getParam(req.getParameter("E01DEA2TC"), "C"));
			
			mp.sendMessage(msg);				

			while (true) {
				newmessage = mp.receiveMessageRecord();
				EPV015503Message msgPmnt = (EPV015503Message) newmessage;
				marker = msgPmnt.getH03FLGMAS();
				if ("*".equals(marker)) break;
				myRow[0] =  Util.trim(msgPmnt.getE03DLPPNU());	// Quote Number
				myRow[1] =  Util.trim(msgPmnt.getE03DLPPDM());	// Date
				myRow[2] =  Util.trim(msgPmnt.getE03DLPPDD());	// Date
				myRow[3] =  Util.trim(msgPmnt.getE03DLPPDY());	// Date
				myRow[4] =  Util.trim(msgPmnt.getE03AMOUNT());	// Total Payment
				myRow[5] =  Util.trim(msgPmnt.getE03DLPIIP());	// Distribution
				myRow[6] =  Util.trim(msgPmnt.getE03DLPPRI());	// Principal
				myRow[7] =  Util.trim(msgPmnt.getE03DLPINT());	// Interest 
				myRow[8] =  Util.trim(msgPmnt.getE03SALPRI());	// Balance/Saldo
				myRow[9] =  Util.trim(msgPmnt.getE03FLGPRO());	// Flag Paid
				
				pmntList.addRow("", myRow);
			}

			session.setAttribute("list", pmntList);
			session.setAttribute("userPO", userPO);	
		} finally {
			if (mp != null)
				mp.close();
		}
	
	}

	protected void procReqMaint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		String pageName = "";
		String empPP = "";
		JBListRec msgList = new JBListRec();

		try {

			empPP = (String) session.getAttribute("EMPPP");
			empPP = (empPP == null) ? "" : empPP;
			
			mp = new MessageProcessor("EPV0155");
			EPV015503Message msg = (EPV015503Message) mp.getMessageRecord("EPV015503");

			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("EPV0155");
			msg.setH03TIMSYS(getTimeStamp());
			msg.setH03SCRCOD("01");
			msg.setH03OPECOD("0002");
			msg.setH03FLGMAS("");
			
			if (session.getAttribute("header") != null ) {
				EPV015501Message header = (EPV015501Message) session.getAttribute("header");
				if (session.getAttribute("lnBasic") != null ) {
					EPV015001Message lnBasic = (EPV015001Message) session.getAttribute("lnBasic");
					setHeader(lnBasic, header);
					header.setE01DEAFRT(getParam(lnBasic.getE01FLTRTE(), "D"));
				}
				if (header.getE01DEAACC().equals("999999999999")) {
					header.setE01DEAACC("0");
				}
				setMessage(header, msg);
				session.setAttribute("header", header);
			}

			mp.sendMessage(msg);				

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV015503Message) mp.receiveMessageRecord("EPV015503");

			if (mp.hasError(msgError) && empPP.equals("")) {
				session.setAttribute("error", msgError);
				pageName = "EPV0155_ln_pay_pln.jsp";
			} else {
				pageName = "EPV0155_ln_pay_pln_det.jsp";
				msgList  = getList(user, req);
				//procReqList(user, req, res, session);
			}
			
			if (mp.hasError(msgError) && empPP.equals("S")) {
				session.setAttribute("error", msgError);
				req.setAttribute("ERR","N");
			} 
			
			session.setAttribute("list", msgList);
			session.setAttribute("userPO", userPO);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	@SuppressWarnings("unused")
	private void procActionMaintBeansToSck(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
			throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mpPmnt = null;
		MessageRecord newmessage = null;
		EPV015503Message msgPmnt = null;
		Boolean ajaxRequest = screen == AJAX_FORM_UPDATE;
		Boolean firstPageLoad = Util.getReqParameter("firstTime", req).equalsIgnoreCase("true");
		Boolean hasError = false;
		
		try {
			
			if(!firstPageLoad){
				mpPmnt = getMessageProcessor("EPV0155", req);
				msgPmnt = (EPV015503Message) mpPmnt.getMessageRecord("EPV015503");
	
				JBListRec pmntList = (JBListRec) session.getAttribute("pmnt");
				if (pmntList != null) {
					pmntList.initRow();
	
					while (pmntList.getNextRow()) {
	
						msgPmnt.setH03USERID(user.getH01USR());
						msgPmnt.setH03PROGRM("EPV0155");
						msgPmnt.setH03TIMSYS(getTimeStamp());
						msgPmnt.setH03SCRCOD("01");
						msgPmnt.setH03OPECOD(ajaxRequest ? "0006" : "0004");
						msgPmnt.setH03FLGMAS("");
	
						msgPmnt.setE03DLPPNU(pmntList.getRecord(0) == null ? "" : pmntList.getRecord(0).trim());
						msgPmnt.setE03DLPPDM(pmntList.getRecord(1) == null ? "" : pmntList.getRecord(1).trim());
						msgPmnt.setE03DLPPDD(pmntList.getRecord(2) == null ? "" : pmntList.getRecord(2).trim());
						msgPmnt.setE03DLPPDY(pmntList.getRecord(3) == null ? "" : pmntList.getRecord(3).trim());
						msgPmnt.setE03AMOUNT(pmntList.getRecord(4) == null ? "" : pmntList.getRecord(4).trim());
						msgPmnt.setE03DLPIIP(pmntList.getRecord(5) == null ? "" : pmntList.getRecord(5).trim());
						msgPmnt.setE03DLPPRI(pmntList.getRecord(6) == null ? "" : pmntList.getRecord(6).trim());
						msgPmnt.setE03DLPINT(pmntList.getRecord(7) == null ? "" : pmntList.getRecord(7).trim());
						msgPmnt.setE03SALPRI(pmntList.getRecord(8) == null ? "" : pmntList.getRecord(8).trim());
						msgPmnt.setE03FLGPRO(pmntList.getRecord(9) == null ? "" : pmntList.getRecord(9).trim());
						
						mpPmnt.sendMessage(msgPmnt);
	
					}
						
					msgPmnt.setH03USERID(user.getH01USR());
					msgPmnt.setH03PROGRM("EPV0155");
					msgPmnt.setH03TIMSYS(getTimeStamp());
					msgPmnt.setH03SCRCOD("01");
					msgPmnt.setH03OPECOD(ajaxRequest ? "0006" : "0004");
					msgPmnt.setH03FLGMAS("*");
	
					msgPmnt.setE03DEABNK(getParam(req.getParameter("E01DEABNK"), "C"));
					msgPmnt.setE03DEABRN(getParam(req.getParameter("E01DEABRN"), "D"));
					msgPmnt.setE03DEACCY(getParam(req.getParameter("E01DEACCY"), "C"));
					msgPmnt.setE03DEAACC(getParam(req.getParameter("E01DEAACC"), "D"));
					msgPmnt.setE03DEARTE(getParam(req.getParameter("E01DEARTE"), "D"));
					msgPmnt.setE03DEAFRT(getParam(req.getParameter("E01DEAFRT"), "D"));
					msgPmnt.setE03DEAOAM(getParam(req.getParameter("E01DEAOAM"), "D"));
					msgPmnt.setE03DEAODM(getParam(req.getParameter("E01DEAODM"), "D"));
					msgPmnt.setE03DEAODD(getParam(req.getParameter("E01DEAODD"), "D"));
					msgPmnt.setE03DEAODY(getParam(req.getParameter("E01DEAODY"), "D"));
					msgPmnt.setE03DEACUN(getParam(req.getParameter("E01DEACUN"), "D"));
					msgPmnt.setE03DEABAS(getParam(req.getParameter("E01DEABAS"), "D"));
					msgPmnt.setE03DEAICT(getParam(req.getParameter("E01DEAICT"), "C"));
					msgPmnt.setE03DEATYP(getParam(req.getParameter("E01DEATYP"), "C"));
					msgPmnt.setE03DEASPR(getParam(req.getParameter("E01DEASPR"), "C"));
					msgPmnt.setE03DEA2TC(getParam(req.getParameter("E01DEA2TC"), "C"));				
	
					mpPmnt.sendMessage(msgPmnt);
	
				}
			
				session.setAttribute("userPO", userPO);
				
				if(ajaxRequest){
					as400ResponseList(mpPmnt, session);
					sendAJAX(res,req,user);
					
				}else{ //Form Validate
					ELEERRMessage msgError = (ELEERRMessage) mpPmnt.receiveMessageRecord("ELEERR");
					hasError = Integer.parseInt(msgError.getERRNUM()) > 0;
					newmessage = mpPmnt.receiveMessageRecord();				
					as400ResponseList(mpPmnt, session);
					
					if (hasError) {
						pageName = "EPV0155_ln_pay_pln_det.jsp";
						session.setAttribute("error", msgError);
						req.setAttribute("ERR","S");
						forward(pageName, req, res);
					} else {
						pageName = "EPV0155_ln_pay_pln_det.jsp";
						session.setAttribute("list", pmntList);
						req.setAttribute("ACT","S");
						procReqList(user, req, res, session);
						forward(pageName, req, res);
					}
				}
				
			}else{//firstPageLoad
				sendAJAX(res,req,user);
				
			}
			
		}catch (Exception e){
			if(ajaxRequest){
				res.sendError(HttpServletResponse.SC_EXPECTATION_FAILED);
			}

		} finally {
          if (mpPmnt != null) mpPmnt.close();
        }
        
	}

	private void sendAJAX(HttpServletResponse res, HttpServletRequest req, ESS0030DSMessage user) 
			throws IOException, ServletException {
		
		BufferedHttpResponseWrapper wrapper =new BufferedHttpResponseWrapper(res);		
		
		ServletContext context = req.getSession().getServletContext();
		String templatePage = "EPV0155_payment_table.jsp";
		String url = res.encodeRedirectURL(getLangPath(user) + templatePage);
		RequestDispatcher dispatcher = context.getRequestDispatcher(url.toString());

		// must use include. With forward the reqDispatcher seems to hold an internal state
		dispatcher.include(req, wrapper);

		StringBuffer buffer = new StringBuffer(); 
		buffer.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\" ?>");
		buffer.append(wrapper.getOutput());
		
		sendXMLResponse(res, buffer.toString());		
	}		

	private void as400ResponseList(MessageProcessor mpPmnt, HttpSession session) 
				throws IOException {

		JBListRec result = new JBListRec();

    	result.init(colNum);
    	
		try {
			String myRow[] = new String[colNum];
			for (int i=0; i < colNum; i++) {
				myRow[i] = "";
			}
			String marker = "";		
		
		
		
		while (true) {
			MessageRecord newmessage = mpPmnt.receiveMessageRecord();
			EPV015503Message msgPmnt = (EPV015503Message) newmessage;
			marker = msgPmnt.getH03FLGMAS();
			if ("*".equals(marker)) break;
			myRow[0] =  Util.trim(msgPmnt.getE03DLPPNU());	// Quote Number
			myRow[1] =  Util.trim(msgPmnt.getE03DLPPDM());	// Date
			myRow[2] =  Util.trim(msgPmnt.getE03DLPPDD());	// Date
			myRow[3] =  Util.trim(msgPmnt.getE03DLPPDY());	// Date
			myRow[4] =  Util.trim(msgPmnt.getE03AMOUNT());	// Total Payment
			myRow[5] =  Util.trim(msgPmnt.getE03DLPIIP());	// Distribution
			myRow[6] =  Util.trim(msgPmnt.getE03DLPPRI());	// Principal
			myRow[7] =  Util.trim(msgPmnt.getE03DLPINT());	// Interest 
			myRow[8] =  Util.trim(msgPmnt.getE03SALPRI());	// Balance/Saldo
			myRow[9] =  Util.trim(msgPmnt.getE03FLGPRO());	// Paid Flag
			
			result.addRow("", myRow);
		}
		
		session.setAttribute("list", result);	
		
		}finally {
	       //Do Nothing
		}
				
	}

	private void procActionMaintFil(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		ResultSet rs = null;
		JBListRec pmntList = new JBListRec();
		pmntList.init(colNum);
		
		try {
			
			String myRow[] = new String[colNum];
			for (int i = 0; i < colNum; i++) {
				myRow[i] = "";
			}			
			
			SmartUpload mySmartUpload = new SmartUpload();
			mySmartUpload.initialize(config, req, res);
			mySmartUpload.upload();
			com.jspsmart.upload.File file =  mySmartUpload.getFiles().getFile(0);
			
			InputStream xls = Util.getStreamFromFile(file);													
		
			if (ExcelUtils.isXLSXVersion(file.getFilePathName())) {
				rs = new ExcelXLSXResultSet(xls, 0);
				((ExcelXLSXResultSet)rs).init();
			} else {
				rs = new ExcelResultSet(xls, 0);
				((ExcelResultSet)rs).init();
			}
			
			while (rs.next()) {
				
				myRow[0] = rs.getString(0);
				myRow[1] = rs.getString(2);
				myRow[2] = rs.getString(1);
				myRow[3] = rs.getString(3);
				myRow[4] = rs.getString(4);
				myRow[5] = rs.getString(5);
				myRow[6] = rs.getString(6);
				myRow[7] = rs.getString(7);
				myRow[8] = rs.getString(8);
				myRow[9] = rs.getString(9);

				pmntList.addRow("", myRow);

			}
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			session.setAttribute("list", pmntList);
			forward("EPV0155_ln_pay_pln_det.jsp", req, res);
		}

	}

	private void procActionMaintPay(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen)
			throws IOException, ServletException {
		
		int totalRows = Util.parseInt(req.getParameter("ROW"));
		
		JBListRec pmntList = new JBListRec();
		
		if(Util.getReqParameter("firstTime", req).equalsIgnoreCase("true")){
			pmntList = (JBListRec) session.getAttribute("list");
			session.setAttribute("list", pmntList);
			
		} else {
			pmntList.init(colNum);
			String myRow[] = new String[colNum];
			for (int i = 0; i < colNum; i++) {
				myRow[i] = "";
			}
			
			for (int row = 1; row <= totalRows; row++) {
				try {
					String sel = req.getParameter("DLPPNU_" + row).toUpperCase();
					if ("".equals(sel)) break;
				} catch (Exception e) {
					break;
				}
				myRow[0] = req.getParameter("DLPPNU_" + row);
				myRow[1] = req.getParameter("DLPPD1_" + row);
				myRow[2] = req.getParameter("DLPPD2_" + row);
				myRow[3] = req.getParameter("DLPPD3_" + row);
				myRow[4] = Util.formatCCY(req.getParameter("DLPAMT_" + row));
				myRow[5] = Util.formatCell(req.getParameter("DLPIIP_" + row));
				myRow[6] = Util.formatCCY(req.getParameter("DLPPRI_" + row));
				myRow[7] = Util.formatCCY(req.getParameter("DLPINT_" + row));
				myRow[8] = Util.formatCCY(req.getParameter("DLPSAL_" + row));
				myRow[9] = req.getParameter("FLGPRO_" + row);

				pmntList.addRow("", myRow);
			}
		}

		session.setAttribute("pmnt", pmntList);
		procActionMaintBeansToSck(user, req, res, session, screen);
		
	}

	private static String getParam( String param, String type ){
        String result = "";
        if (param != null) {
        	result = Util.trim(param);
        	if (type == "D") {
        		try {
        			Double.parseDouble(result);
        		} catch (NumberFormatException e1) {
        			try {
        				DecimalField.parseDouble(result);
        			} catch (NumberFormatException e2) {
        				result = "0";
        			}
        		}
        	}
        }
        return result;
    }

	private void setHeader(EPV015001Message message, EPV015501Message head) {
		java.util.Enumeration enu = head.fieldEnumeration();
		MessageField field = null;
		String value = null;
		while (enu.hasMoreElements()) {
			field = (MessageField) enu.nextElement();
			try {
				value = message.getFieldString(field.getTag());
				if (value != null) {
					field.setString(value);
				}
			} catch (Exception e) {
			}
		}
	}

	private void setMessage(EPV015501Message head, EPV015503Message message) {
		java.util.Enumeration enu = message.fieldEnumeration();
		MessageField field = null;
		String fieldName = "";
		String value = null;
		while (enu.hasMoreElements()) {
			field = (MessageField) enu.nextElement();
			if (field.getTag().substring(0,3).equals("E03")) {
				fieldName = "E01" + field.getTag().substring(3);
				try {
					value = head.getFieldString(fieldName);
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}
		}
	}

}

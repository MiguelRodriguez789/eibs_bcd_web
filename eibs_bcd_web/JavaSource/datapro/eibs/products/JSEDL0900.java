package datapro.eibs.products;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.tools.BufferedHttpResponseWrapper;

@SuppressWarnings("serial")
public class JSEDL0900 extends JSEIBSServlet {

	protected static final int R_ENTER = 100;
	protected static final int R_ENTER_ROT = 200;
	protected static final int R_PRINT = 300;
	protected static final int R_DETAIL_MORA = 400;
	protected static final int R_GRAPH = 1000;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen) {
			case R_ENTER :
				 procReqEnter(user, req, res, session);							
				 break;
			case R_ENTER_ROT :
				 procReqEnterRot(user, req, res, session);							
				 break;
			case R_PRINT :
				procReqPrintList(user, req, res, session);
				break;
			case R_DETAIL_MORA :
				procReqDetailMora(user, req, res, session);
				break;
			case R_GRAPH :
				requestGraph(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	@SuppressWarnings("unchecked")
	private void requestGraph(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,HttpSession session) 
			throws ServletException, IOException {
		BufferedHttpResponseWrapper wrapper = new BufferedHttpResponseWrapper(res);		
		String year = Util.getReqParameter("YEAR", req); 
		JBObjList graphList = new JBObjList();
		JBObjList masertList = (JBObjList) session.getAttribute("list");
		
		if("TODO".equals(year)){
			if(masertList.size() > 60){
				for (int i = masertList.size() - 60; i < masertList.size(); i++) {
					if (masertList.get(i)  instanceof EDL090002Message) {
						EDL090002Message msg = (EDL090002Message) masertList.get(i);
						graphList.add(msg);
					}
				}
			} else {
				graphList = masertList;
			}
		} else if(StringUtils.isNumeric(year)){
			for (int i = 0; i < masertList.size(); i++) {
				if (masertList.get(i)  instanceof EDL090002Message) {
					EDL090002Message msg = (EDL090002Message) masertList.get(i);
					if(year.equals(msg.getE02DLPPDY())){
						graphList.add(msg);
					}
				}
			}
		}
		
		session.setAttribute("graphList", graphList);
		String templatePage = "EDL0900_graph_data.jsp";
		ServletContext context = req.getSession().getServletContext();
		String url = res.encodeRedirectURL(getLangPath(user) + templatePage);
		RequestDispatcher dispatcher = context.getRequestDispatcher(url.toString()); 
	
		/* must use include. With forward the reqDispatcher seems to hold an internal state
		which prevents to do a forward after this to return to the webclient */
		dispatcher.include(req, wrapper);
	
		/* ... add other stuff like returning something to the webclient ... */
		StringBuffer buffer = new StringBuffer(); 
		buffer.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\" ?>");
		buffer.append(wrapper.getOutput());
			
		sendXMLResponse(res, buffer.toString());		
	}
	
	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		MessageRecord newmessage = null;

		try {
			mp = getMessageProcessor("EDL0900", req);
			EDL090001Message msgList = (EDL090001Message) mp.getMessageRecord("EDL090001");
		 	msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDL0900");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setE01DEAACC(userPO.getAccNum());
		 	
			String sType = "";
			String typ = req.getParameter("Type");
			String rzn = req.getParameter("Rzn") == null ? "" : req.getParameter("Rzn").trim();
			String uqi = req.getParameter("Uqi") == null ? "" : req.getParameter("Uqi").trim();

			if (typ.equals("M")) {
				sType = "MAINTENANCE";
			} else if (typ.equals("Q")){
				msgList.setH01OPECOD("1500");		// Displays Schedule of payments (Quotation mode)
				sType = "QUOTATION";  
			} else if (typ.equals("A")){
				msgList.setH01OPECOD("9999");		// Displays Schedule of payments (Original mode)
				msgList.setH01FLGWK2(rzn);		
				msgList.setE01DEAGLN(uqi);		
				sType = "INQUIRY";  
			} else if (typ.equals("P")){
				userPO.setOption("PROP");
				if(req.getParameter("CUN")!=null){
					userPO.setHeader2(req.getParameter("CUN"));
				}
				if(req.getParameter("NAM")!=null){
					userPO.setHeader3(req.getParameter("NAM"));
				}
				if(req.getParameter("PROD")!=null){
					userPO.setHeader1(req.getParameter("PROD"));
				}
				sType = "INQUIRY";
			} else if (typ.equals("S")){
				sType = "SIM";
			} else if (typ.equals("I")){
				typ   = "X";
				sType = "CreditLines";
			} else if (typ.equals("X")){
				sType = "AppInquiry";
			} else if (typ.equals("A")){
				sType = "APPROVAL_INQ";						
			} else if (typ.equals("8")){
				sType = "AppInquiryP";	
			} else {
				sType = "INQUIRY";
			}

			msgList.setH01FLGWK3(typ);
			
			mp.sendMessage(msgList);
			userPO.setPurpose(sType);
			userPO.setCusType(typ);			
		  	newmessage = mp.receiveMessageRecord();			
			
			if (newmessage.getFormatName().equals("ELEERR")){
				ELEERRMessage msgError = (ELEERRMessage) newmessage;
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0900_sim_error.jsp", req, res);
			} else{
				msgList = (EDL090001Message) newmessage;
		 		JBObjList list = mp.receiveMessageRecordList("E02ENDFLD");
		 		JBObjList listUF = mp.receiveMessageRecordList("E03ENDFLD");
		 		JBObjList edl090008List = mp.receiveMessageRecordList("E08ENDFLD");
		 		flexLog("EDL090008List:" + edl090008List);

		 		if(typ.equals("S")){
		 			msgList.setE01CUSNA1(userPO.getCusName());
		 		}		 		
				session.setAttribute("userPO", userPO);
				session.setAttribute("header", msgList);
				session.setAttribute("list", list);
				session.setAttribute("listUF", listUF);
				session.setAttribute("edl090008List", edl090008List);
				session.setAttribute("yearSet", createYearSet(list));
				
				forward("EDL0900_ln_plan_de_pago.jsp", req, res);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	private void procReqEnterRot(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {
			
			UserPos userPO = getUserPos(req);
			MessageProcessor mp = null;
			MessageRecord newmessage = null;

			try {
				mp = getMessageProcessor("EDL0900", req);
				EDL090007Message msgList = (EDL090007Message) mp.getMessageRecord("EDL090007");
			 	msgList.setH07USERID(user.getH01USR());
			 	msgList.setH07PROGRM("EDL0900");
			 	msgList.setH07TIMSYS(getTimeStamp());
			 	msgList.setH07SCRCOD("01");
			 	msgList.setH07OPECOD("1400");
			 	msgList.setE07DEAACC(userPO.getIdentifier());
			 					
				mp.sendMessage(msgList);
						
			  	newmessage = mp.receiveMessageRecord();		
			  	
			  	userPO.setHeader20(userPO.getIdentifier());	
			  	userPO.setHeader10("R");	
				session.setAttribute("taller", msgList);
				
				if (newmessage.getFormatName().equals("ELEERR")){
					ELEERRMessage msgError = (ELEERRMessage) newmessage;
					session.setAttribute("userPO", userPO);
					session.setAttribute("error", msgError);
					forward("EDL0900_sim_error.jsp", req, res);
				} else{
					msgList = (EDL090007Message) newmessage;
			 		JBObjList list = mp.receiveMessageRecordList("E06ENDFLD");
			 				 		
					session.setAttribute("userPO", userPO);
					session.setAttribute("header", msgList);
					session.setAttribute("list", list);
					session.setAttribute("yearSet", createYearSet(list));
					
					forward("EDL0900_ln_resumen_cupo_rotativo.jsp", req, res);
				}
				
			} finally {
				if (mp != null) mp.close();
			}
		}
	
	private ArrayList<String> createYearSet(JBObjList list) {
		ArrayList<String> yearList = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i)  instanceof EDL090002Message) {
				EDL090002Message msg = (EDL090002Message) list.get(i);
				if(!(msg.getE02DLPPNU().equals("77777") || 
						msg.getE02DLPPNU().equals("88888") || 
						msg.getE02DLPPNU().equals("88999") || 
						msg.getE02DLPPNU().equals("99999"))){						
					yearList.add(msg.getE02DLPPDY());
				}
			}
		}
		//Get Unique Values of Years
		Set<String> yearSet =  new HashSet<String>(yearList);
		yearList.clear();
		for (String yr : yearSet) {
			yearList.add(yr);
		}
		
		Collections.sort(yearList, new Comparator<String>() {
		    public int compare(String o1, String o2) {
		        Integer i1 = Integer.parseInt(o1);
		        Integer i2 = Integer.parseInt(o2);
		        return (i1 > i2 ? -1 : (i1 == i2 ? 0 : 1));
		    }
		});		
		
        return yearList;
	}
	
	private void procReqPrintList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EDL016001Message edl016001Record = null;  
		
		try {
			
			EDL090001Message header = (EDL090001Message) session.getAttribute("header");
			try {
				String accnum = header.getE01DEAACC();
				edl016001Record = procReqInquiry(user, req, res, session, accnum);
				if (edl016001Record ==null)
					edl016001Record = new EDL016001Message();
			}catch(Exception e) {
				edl016001Record = new EDL016001Message();
			}
			JBObjList list = (JBObjList)session.getAttribute("list");
			JBObjList listUF = (JBObjList)session.getAttribute("listUF");
			JBObjList edl090008List = (JBObjList)session.getAttribute("edl090008List");

			userPO.setSource(req.getParameter("SOURCE") == null ? "" : req.getParameter("SOURCE").trim());
			
			session.setAttribute("header", header);
			session.setAttribute("list", list);
			session.setAttribute("listUF", listUF);
			session.setAttribute("edl090008List", edl090008List);
			session.setAttribute("edl016001Record", edl016001Record);
			session.setAttribute("userPO", userPO);
			
			String tab = null;
			try{
				tab = req.getParameter("TAB") == null ? "1" : req.getParameter("TAB").trim();
			}catch(Exception e){
				tab = "1";
			}
			int key = Integer.parseInt(tab);
			switch (key) {
			case 1:
				forward("EDL0900_ln_plan_de_pago_print.jsp", req, res);
				break;
			case 2:
				forward("EDL0900_ln_plan_de_pago_print_cond.jsp", req, res);
				break;
			case 3:
				forward("EDL0900_ln_plan_de_pago_print_paid.jsp", req, res);
				break;
			case 4:
				forward("EDL0900_ln_plan_de_pago_print_tota.jsp", req, res);
				break;	
			default:
				break;
			}
			
		} finally {
			if (mp != null) mp.close();
		}

	}

	private void procReqDetailMora(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		String UF = "";

		try {
			mp = getMessageProcessor("EDL0900", req);
			EDL090005Message msg = (EDL090005Message) mp.getMessageRecord("EDL090005");
		 	msg.setH05USERID(user.getH01USR());
		 	msg.setH05PROGRM("EDL0900");
		 	msg.setH05TIMSYS(getTimeStamp());
		 	msg.setH05SCRCOD("01");
		 	
		 	msg.setE05PMRACC(Util.getReqParameter("E05PMRACC", req) );
		 	msg.setE05PMRPDM(Util.getReqParameter("E05PMRPDM", req) );
		 	msg.setE05PMRPDD(Util.getReqParameter("E05PMRPDD", req) );
		 	msg.setE05PMRPDY(Util.getReqParameter("E05PMRPDY", req) );
		 	UF =  Util.getReqParameter("UF", req) ;
		 	
			mp.sendMessage(msg);
			
			JBObjList list = mp.receiveMessageRecordList("H05FLGMAS");

			session.setAttribute("userPO", userPO);
			session.setAttribute("EDL090005List", list);
			req.setAttribute("UF", UF);
			forward("EDL0900_ln_plan_de_pago_det_mora.jsp", req, res);
			
		} finally {
			if (mp != null) mp.close();
		}

	}
	
	/**
	 * This method was created for inquiring edl016001.
	 */
	protected EDL016001Message procReqInquiry(
			ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, String accnum)
				throws ServletException, IOException {

		MessageProcessor mx = null;
		MessageRecord newmessage = null;
		EDL016001Message msgCD = null;
		UserPos	userPO = null;	

		userPO = getUserPos(req);

		// Send Initial data
		try
		{
			mx = getMessageProcessor("EDL0160", req);
			msgCD = (EDL016001Message)mx.getMessageRecord("EDL016001");
		 	msgCD.setH01USERID(user.getH01USR());
		 	msgCD.setH01PROGRM("EDL0160");
		 	msgCD.setH01TIMSYS(getTimeStamp());
		 	msgCD.setH01SCRCOD("01");
		 	msgCD.setH01OPECOD("0004");
		 	msgCD.setE01DEAACC(accnum);
		 	msgCD.setE01DEAACD("10");
			msgCD.send();	
		 	msgCD.destroy();

		 	flexLog("EDL016001 Message Sent");
		}		
		catch (Exception e)
		{
			msgCD = null;
		}

		//Receive Error Message
		try
		{
		  	newmessage = mx.receiveMessageRecord();
		  
		  	if (newmessage.getFormatName().equals("ELEERR")) {
		  		msgCD = null;		  	
		  	}else if (newmessage.getFormatName().equals("EDL016001")) {
				try {
					msgCD = new datapro.eibs.beans.EDL016001Message();
					flexLog("EDL016001 Message Received");
			  	} catch (Exception ex) {
					flexLog("Error: " + ex); 
			  	}
				msgCD = (EDL016001Message)newmessage; 
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		}
		catch (Exception e)
		{
			msgCD = null;
		}
		
		return msgCD;

	}	


}

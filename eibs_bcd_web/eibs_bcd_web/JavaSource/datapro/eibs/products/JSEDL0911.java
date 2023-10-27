package datapro.eibs.products;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import datapro.eibs.beans.EDL091101Message;
import datapro.eibs.beans.EDL091102Message;
import datapro.eibs.beans.EDL091103Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

@SuppressWarnings("serial")
public class JSEDL0911 extends JSEIBSServlet {

	protected static final int R_ENTER 		 = 100;
	protected static final int R_ENTERSCHE	 = 150;
	protected static final int R_SELECTDATES = 175;
	protected static final int A_SELECTDATES = 200;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen) {
			case R_ENTER :
				 procReqEnter(user, req, res, session);							
				 break;
			case R_ENTERSCHE :
				procReqEnterPaymentSchedule(user, req, res, session);							
				 break;				 
			case R_SELECTDATES :
				 procDatePicker(user, req, res, session);							
				 break;
			case A_SELECTDATES :
				try {
					procDateChanger(user, req, res, session);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				 break;				 
			default :
				forward(devPage, req, res);
				break;
		}
	}


	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		forward("EDL0911_prorroga_quota_enter.jsp", req, res);
		
	}


	private void procReqEnterPaymentSchedule(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO =getUserPos(req);
		MessageProcessor mp = null;
		MessageRecord newmessage = null;

		try {
			mp = getMessageProcessor("EDL0911", req);
			
			EDL091101Message msgList = (EDL091101Message) mp.getMessageRecord("EDL091101");
		 	msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDL0911");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setE01DEAACC(req.getParameter("E01DEAACC"));

			msgList.setH01FLGWK1(req.getParameter("H01FLGWK1") == null ? "N" : req.getParameter("H01FLGWK1"));
			msgList.setH01FLGWK2(req.getParameter("H01FLGWK2") == null ? "Y" : req.getParameter("H01FLGWK2"));
			msgList.setH01FLGWK3(req.getParameter("H01FLGWK3") == null ? " " : req.getParameter("H01FLGWK3"));
			msgList.setE01DLCIGF(req.getParameter("E01DLCIGF") == null ? " " : req.getParameter("E01DLCIGF"));
			msgList.setE01TIPPRG(req.getParameter("E01TIPPRG") == null ? "1" : req.getParameter("E01TIPPRG"));
			msgList.setE01NUMMES(req.getParameter("E01NUMMES") == null ? "0" : req.getParameter("E01NUMMES"));
			msgList.setE01NEWDDD(req.getParameter("E01NEWDDD") == null ? "0" : req.getParameter("E01NEWDDD"));
			msgList.setE01NEWMMM(req.getParameter("E01NEWMMM") == null ? "0" : req.getParameter("E01NEWMMM"));
			msgList.setE01NEWYYY(req.getParameter("E01NEWYYY") == null ? "0" : req.getParameter("E01NEWYYY"));
			msgList.setE01EXTMES(req.getParameter("E01EXTMES") == null ? "0" : req.getParameter("E01EXTMES"));

			mp.sendMessage(msgList);
			userPO.setPurpose("INQUIRY");
		  	newmessage = mp.receiveMessageRecord();			
			
			if (newmessage.getFormatName().equals("ELEERR")){
				ELEERRMessage msgError = (ELEERRMessage) newmessage;
			  	newmessage = mp.receiveMessageRecord();			
				msgList = (EDL091101Message) newmessage;
				session.setAttribute("data", msgList);
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0911_prorroga_quota_enter.jsp", req, res);
			} else{
				msgList = (EDL091101Message) newmessage;
		 		JBObjList list = mp.receiveMessageRecordList("E02ENDFLD");

				session.setAttribute("userPO", userPO);
				session.setAttribute("header", msgList);
				session.setAttribute("list", list);
				userPO.setHeader17(msgList.getH01FLGWK1());
				userPO.setHeader18(msgList.getE01EXTMES());
				userPO.setHeader19(msgList.getE01DLCIGF());
				userPO.setHeader20(msgList.getH01FLGWK3());
				userPO.setHeader21(msgList.getE01TIPPRG());
				userPO.setHeader22(msgList.getE01NUMMES());
				userPO.setHeader23(msgList.getH01FLGWK2());
				forward("EDL0911_prorroga_desplazar_fecha.jsp", req, res);
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	private void procDatePicker(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		EDL091101Message msgHead = (EDL091101Message) session.getAttribute("header");
		JBObjList list = (JBObjList) session.getAttribute("list");
		
		try {
			
			JBObjList Datelist = (JBObjList) list.clone(); 
			String params = req.getParameter("checkRows");
			String [] chkdRows = params.split(","); //Splitting indexes into Array
			
			for (int i = 0; !Datelist.isEmpty(); i++) {
				Datelist.removeRow(0);
			}		
			
			for (int i = 0; i < chkdRows.length; i++) { //Adding checked Elements
				if(chkdRows.length>0){
					Datelist.addRow(list.get(Integer.parseInt(chkdRows[i])));
				}
			}
			
			msgHead.setE01DLCIGF(req.getParameter("E01DLCIGF") == null ? " " : req.getParameter("E01DLCIGF"));
			msgHead.setE01NUMMES(req.getParameter("E01NUMMES") == null ? "0" : req.getParameter("E01NUMMES"));
			msgHead.setE01EXTMES(req.getParameter("E01EXTMES") == null ? "0" : req.getParameter("E01EXTMES"));
			msgHead.setE01NEWDDD(req.getParameter("E01NEWDDD") == null ? "0" : req.getParameter("E01NEWDDD"));
			msgHead.setE01NEWMMM(req.getParameter("E01NEWMMM") == null ? "0" : req.getParameter("E01NEWMMM"));
			msgHead.setE01NEWYYY(req.getParameter("E01NEWYYY") == null ? "0" : req.getParameter("E01NEWYYY"));
			
			userPO.setHeader17(req.getParameter("H01FLGWK1") == null ? "N" : req.getParameter("H01FLGWK1"));
			userPO.setHeader18(req.getParameter("E01EXTMES") == null ? "0" : req.getParameter("E01EXTMES"));
			userPO.setHeader19(req.getParameter("E01DLCIGF") == null ? " " : req.getParameter("E01DLCIGF"));
			userPO.setHeader22(req.getParameter("E01NUMMES") == null ? "0" : req.getParameter("E01NUMMES"));
			userPO.setHeader23(req.getParameter("H01FLGWK2") == null ? "Y" : req.getParameter("H01FLGWK2"));
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("header", msgHead);
			session.setAttribute("Datelist", Datelist);
			
			forward("EDL0911_prorroga_cambiar_fecha.jsp", req, res);
		}
		finally {
		}
	}

	private void procDateChanger(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException, ParseException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EDL091102Message listMessage = null;
		EDL091101Message msgHead = (EDL091101Message) session.getAttribute("header");
		JBObjList Datelist = (JBObjList) session.getAttribute("Datelist");
		ArrayList<String> NewDate = new ArrayList<String>(Datelist.size());
		String newmmm = "";
		String newddd = "";
		String newyyy = "";
		String mm = "";
		String dd = "";
		String yy = "";
		String sq = "";
		Calendar newdte;
		
		newdte = Calendar.getInstance();
		mp = getMessageProcessor("EDL0911", req);

		try {
			
			for (int i = 0; i < Datelist.size(); i++) {
				
				if (i < 10) sq = "0"+i; else sq = ""+i;
				NewDate.add(req.getParameter("E01NEWD"+sq).trim()+'-'+req.getParameter("E01NEWM"+sq).trim()+'-'+req.getParameter("E01NEWY"+sq).trim());
				SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy");
				
				if (userPO.getHeader21().trim().equals("1")) {
					java.util.Date parsed = fmt.parse(NewDate.get(i));
					newdte.setTime(parsed);
				} else {	
					mm = req.getParameter("E01NEWM"+sq).trim();
					dd = req.getParameter("E01NEWD"+sq).trim();
					yy = req.getParameter("E01NEWY"+sq).trim();
				}			
				
				listMessage = (EDL091102Message) Datelist.get(i);
				
				EDL091103Message msgDteChg = (EDL091103Message) mp.getMessageRecord("EDL091103");
				msgDteChg.setH03USERID(user.getH01USR());
				msgDteChg.setH03PROGRM("EDL0911");
				msgDteChg.setH03OPECOD("0005");
				msgDteChg.setE03DEAACC(listMessage.getE02DLPACC());
				msgDteChg.setE03DLPPNU(listMessage.getE02DLPPNU());
				msgDteChg.setE03OLDPDM(listMessage.getE02DLPPDM());
				msgDteChg.setE03OLDPDD(listMessage.getE02DLPPDD());
				msgDteChg.setE03OLDPDY(listMessage.getE02DLPPDY());
				
				if (userPO.getHeader21().trim().equals("1")) {
					msgDteChg.setE03NEWPDM(Integer.toString((newdte.get(Calendar.MONTH))+1));
					msgDteChg.setE03NEWPDD(String.valueOf(newdte.get(Calendar.DAY_OF_MONTH)));
					msgDteChg.setE03NEWPDY(String.valueOf(newdte.get(Calendar.YEAR)));
				} else {
					msgDteChg.setE03NEWPDM(mm);
					msgDteChg.setE03NEWPDD(dd);
					msgDteChg.setE03NEWPDY(yy);
				}
				
				if (i == 0) {
					newmmm = msgDteChg.getE03NEWPDM().trim();
					newddd = msgDteChg.getE03NEWPDD().trim();
					newyyy = msgDteChg.getE03NEWPDY().trim();
				}
				
				msgDteChg.setH03FLGWK1(userPO.getHeader17().trim());
				msgDteChg.setE03EXTMES(userPO.getHeader18().trim());
				msgDteChg.setE03DLCIGF(userPO.getHeader19().trim());
				msgDteChg.setE03TIPPRG(userPO.getHeader21().trim());
				msgDteChg.setE03NUMMES(userPO.getHeader22().trim());
				msgDteChg.setH03FLGWK2(userPO.getHeader23().trim());
				
				setMessageRecord(req, msgDteChg);
				mp.sendMessage(msgDteChg);
			
			}
			
			EDL091103Message msgEOF = (EDL091103Message) mp.getMessageRecord("EDL091103");
			msgEOF.setH03USERID(user.getH01USR());
			msgEOF.setH03PROGRM("EDL0911");
			msgEOF.setH03OPECOD("0005");
			msgEOF.setE03DEAACC(msgHead.getE01DEAACC());
			msgEOF.setE03DLCIGF(userPO.getHeader19().trim());
			msgEOF.setE03NUMMES(userPO.getHeader22().trim());
			msgEOF.setE03EXTMES(userPO.getHeader18().trim());
			msgEOF.setE03NEWMMM(newmmm);
			msgEOF.setE03NEWDDD(newddd);
			msgEOF.setE03NEWYYY(newyyy);
			msgEOF.setE03TIPPRG(userPO.getHeader21().trim());
			msgEOF.setH03FLGWK1(userPO.getHeader17().trim());
			msgEOF.setH03FLGWK2(userPO.getHeader23().trim());
				
			msgEOF.setH03FLGMAS("*");
			
			setMessageRecord(req, msgEOF);
			mp.sendMessage(msgEOF);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("header",	msgHead);
				session.setAttribute("newDate", NewDate);
				session.setAttribute("Datelist", Datelist);
				forward("EDL0911_prorroga_cambiar_fecha.jsp", req, res);
			} else {
				// printCloseAndRefreshOpener(res.getWriter());
				req.setAttribute("ACT","S");
				userPO.setAccNum(msgHead.getE01DEAACC());
				userPO.setOption("Inquiry");
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("header",	msgHead);
				session.setAttribute("newDate", NewDate);
				session.setAttribute("Datelist", Datelist);
				
				forward("EDL0911_prorroga_cambiar_fecha.jsp", req, res);
				
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}

}

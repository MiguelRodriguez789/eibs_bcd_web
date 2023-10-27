package datapro.eibs.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECO020001Message;
import datapro.eibs.beans.ECO020003Message;
import datapro.eibs.beans.ECO020004Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageRecord;

/**
 * 
 * @author evargas
 *
 */
public class JSECO0200 extends JSEIBSServlet {

	protected static final int COVENANT_PAY_SEARCH = 100;
	protected static final int COVENANT_PAY_SHOW = 200;
	protected static final int COVENANT_PAY_PROCESS = 300;
	protected static final int APPLY_PAY_INQ = 400;
	protected static final int APPLY_PAY_PROCESS = 500;
		

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case COVENANT_PAY_SEARCH:
				procSearchCovenantPay(user, req, res, session);
			break;		

			case COVENANT_PAY_SHOW:
				procCovenantPayshow(user, req, res, session);
				break;	
			case COVENANT_PAY_PROCESS:
				procCovenantProcess(user, req, res, session);
				break;					
			case APPLY_PAY_INQ:
				procApplyPayInq(user, req, res, session);
				break;
			case APPLY_PAY_PROCESS:
				procApplyPayProcess(user, req, res, session);
				break;					
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}
	

	protected void procApplyPayProcess(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
			
		MessageProcessor mp = null;
			
		try {
			//define dds to send
			mp = getMessageProcessor("ECO0200", req);
			ECO020004Message msg = (ECO020004Message) session.getAttribute("apply");				
			msg.setH04USERID(user.getH01USR());			
			msg.setH04OPECOD("0005");				
			msg.setE04PLHCDE(req.getParameter("E04PLHCDE"));
			msg.setE04PLHNUM(req.getParameter("E04PLHNUM"));
			msg.setE04PLHRCY(req.getParameter("E04PLHRCY"));
			msg.setE04PLPVDM(req.getParameter("E04PLPVDM"));
			msg.setE04PLPVDD(req.getParameter("E04PLPVDD"));
			msg.setE04PLPVDY(req.getParameter("E04PLPVDY"));
			msg.setE04PLPBNK(req.getParameter("E04PLPBNK"));
			msg.setE04PLPBRN(req.getParameter("E04PLPBRN"));
			//msg.setE04PLPDBK(req.getParameter("E04PLPDBK"));
			//msg.setE04PLPDBR(req.getParameter("E04PLPDBR"));
			//msg.setE04PLPDCY(req.getParameter("E04PLPDCY"));
			//msg.setE04PLPDGL(req.getParameter("E04PLPDGL"));
			//msg.setE04PLPDAC(req.getParameter("E04PLPDAC"));
			msg.setE04PLPNAR(req.getParameter("E04PLPNAR"));
			int amount = 9;
			String name= "";
			for ( int i=1; i<=amount; i++ ) {
				name = i + "";
				msg.getField("E04OFFOP"+name).setString(req.getParameter("E04OFFOP"+name));
				msg.getField("E04OFFGL"+name).setString(req.getParameter("E04OFFGL"+name));
				msg.getField("E04OFFCO"+name).setString(req.getParameter("E04OFFCO"+name));				  
				msg.getField("E04OFFBK"+name).setString(req.getParameter("E04OFFBK"+name));
				msg.getField("E04OFFBR"+name).setString(req.getParameter("E04OFFBR"+name));
				msg.getField("E04OFFCY"+name).setString(req.getParameter("E04OFFCY"+name));
				msg.getField("E04OFFAC"+name).setString(req.getParameter("E04OFFAC"+name));
				msg.getField("E04OFFAM"+name).setString(req.getParameter("E04OFFAM"+name));
			}												
			
			mp.sendMessage(msg);
			ELEERRMessage resp = (ELEERRMessage)mp.receiveMessageRecord(); //receive messaje.			 				 
			ECO020004Message msgr = (ECO020004Message)mp.receiveMessageRecord(); //receive messaje.			 				 
			if (resp.getERRNUM().equals("0")){
				req.setAttribute("upp","OK");
				session.setAttribute("error", ((ELEERRMessage)resp));
				session.setAttribute("apply", msgr);
				forward("ECO0200_covenant_pay_apply.jsp", req, res);	
			} else {
				req.setAttribute("upp","");
				session.setAttribute("error", ((ELEERRMessage)resp));
				session.setAttribute("apply", msgr);
				forward("ECO0200_covenant_pay_apply.jsp", req, res);	
			} 				
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	protected void procApplyPayInq(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ECO0200", req);

				ECO020004Message msgList = (ECO020004Message) mp.getMessageRecord("ECO020004");
				msgList.setH04USERID (user.getH01USR());
				msgList.setH04OPECOD("0002");
				if (req.getParameter("PLHNUM")!=null && !"".equals(req.getParameter("PLHNUM").trim())){
					msgList.setE04PLHNUM(req.getParameter("PLHNUM"));
				}
				
				if (req.getParameter("PLHRCY")!=null && !"".equals(req.getParameter("PLHRCY").trim())){
					msgList.setE04PLHRCY(req.getParameter("PLHRCY"));
				}
				
				if (req.getParameter("PLHCDE")!=null && !"".equals(req.getParameter("PLHCDE").trim())){
					msgList.setE04PLHCDE(req.getParameter("PLHCDE"));
				}				
				
			 	mp.sendMessage(msgList);			 	
			 	
			 	MessageRecord error = mp.receiveMessageRecord(); //receive first messaje, errors or header.
			 	 
			 	MessageRecord apply = mp.receiveMessageRecord();
			 	session.setAttribute("error", error);
			 	session.setAttribute("apply", apply);
			 	if (mp.hasError(error)) {
			        forward("error_viewer.jsp", req, res);
				} else {
			        forwardOnSuccess("ECO0200_covenant_pay_apply.jsp", req, res);
				}
		        
			} finally {
				if (mp != null)	mp.close();
			}
		}	

	protected void procSearchCovenantPay(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ECO0200_covenant_pay_search.jsp");
			forward("ECO0200_covenant_pay_search.jsp", req, res);			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	
	protected void procCovenantPayshow(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ECO0200", req);

				ECO020001Message msgList = (ECO020001Message) mp.getMessageRecord("ECO020001");
				msgList.setH01USERID(user.getH01USR());
				if (req.getParameter("E01SELNUM")!=null && !"".equals(req.getParameter("E01SELNUM").trim())){
					msgList.setE01SELNUM(req.getParameter("E01SELNUM"));
				}
				if (req.getParameter("E01SELRCY")!=null && !"".equals(req.getParameter("E01SELRCY").trim())){
					msgList.setE01SELRCY(req.getParameter("E01SELRCY"));
				}
				
			 	mp.sendMessage(msgList);			 	
			 	
			 	MessageRecord resp = mp.receiveMessageRecord(); //receive first messaje, errors or header.
			 	 
		        if(resp.getFormatName().equals("ELEERR")){
		        	 session.setAttribute("error", ((ELEERRMessage)resp));
		        	 forward("ECO0200_covenant_pay_search.jsp", req, res);	
		        }else{
		        	JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
		        	session.setAttribute("header", ((ECO020001Message)resp));	//header dds01
		        	session.setAttribute("cnvList", list);						//list   dds02
					forwardOnSuccess("ECO0200_covenant_pay_show.jsp", req, res);
		        	
		        }
			} finally {
				if (mp != null)	mp.close();
			}
		}
	

	protected void procCovenantProcess(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res, 
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			MessageProcessor mp1 = null;
			try {
				
				//read parameters from jsp
				String nroReg = req.getParameter("nro_reg");
				if (nroReg!=null && !"".equals(nroReg) && !"0".equals(nroReg)){
					//define dds to send
					mp = getMessageProcessor("ECO0200", req);
					ECO020003Message msg = (ECO020003Message) mp.getMessageRecord("ECO020003");
					
					int nroTot = Integer.valueOf(nroReg).intValue();
					int i = 0;
					int contEnv=0;
					String amount="";
					String covenant="";
					String acc="";
					while (i < nroTot) {
						i++;
						covenant = req.getParameter("C"+i);						
						//if (covenant!=null && !"".equals(covenant)){//have data, change novedad
							amount = req.getParameter("M"+i);
							acc=req.getParameter("ACC"+i);
							if (contEnv<99){
								contEnv++;//increment env!
								String lett = (contEnv<10)?("0"+String.valueOf(contEnv)):(String.valueOf(contEnv));
								msg.getField("E03PACC"+lett).setString(acc);
								msg.getField("E03PPAG"+lett).setString(amount);
								msg.getField("E03PNOV"+lett).setString(covenant);
							}else{
								//I get 99, to proceeds to send
								msg.setE03PLDCDE(req.getParameter("PLDCDE"));
								msg.setE03PLDNUM(req.getParameter("PLDNUM"));
								msg.setE03PLDRCY(req.getParameter("PLDRCY"));
								msg.setH03USERID(user.getH01USR());
								System.out.println("mandando al /*"+i+"*/");
							 	System.out.println(msg.toString());
							 	mp.sendMessage(msg);
							 	ELEERRMessage resp = (ELEERRMessage)mp.receiveMessageRecord(); //receive messaje.
							 	session.setAttribute("error", ((ELEERRMessage)resp));
							 	if (!resp.getERRNUM().equals("0")){//have errors.. show and exit
							 		forward("ECO0200_covenant_pay_show.jsp", req, res);
							 		return;
							 	} 				 	
							 	
								//create new dds and i assing the values that i lacked
							 	contEnv=1;//restart counter
							 	msg = (ECO020003Message) mp.getMessageRecord("ECO020003");
								String lett = (contEnv<10)?("0"+String.valueOf(contEnv)):(String.valueOf(contEnv));
								msg.getField("E03PACC"+lett).setString(acc);
								msg.getField("E03PPAG"+lett).setString(amount);
								msg.getField("E03PNOV"+lett).setString(covenant);							 	
							}
							
						}//	
					//}
					
					//finish, to proceeds to send
					msg.setE03PLDCDE(req.getParameter("PLDCDE"));
					msg.setE03PLDNUM(req.getParameter("PLDNUM"));
					msg.setE03PLDRCY(req.getParameter("PLDRCY"));
					msg.setH03USERID(user.getH01USR());	
					System.out.println("mandando al /*"+i+"*/");					
				 	System.out.println(msg.toString());
				 	mp.sendMessage(msg);
				 	ELEERRMessage resp = (ELEERRMessage)mp.receiveMessageRecord(); //receive messaje.
				 	session.setAttribute("error", ((ELEERRMessage)resp));
				 	if (resp.getERRNUM().equals("0")) req.setAttribute("upp", "OK");				 	
				 	//forward("ECO0200_covenant_pay_search.jsp", req, res);
				 	procCovenantPayshow(user,req,res,session);					
				}else{
					//no change, recall the page again!
					forward("ECO0200_covenant_pay_show.jsp", req, res);	
				}//EoI
			}catch (Exception e) {
				System.out.println("ERROR ECO0200:"+e.getMessage());
				e.printStackTrace();
				throw new ServletException(e.getMessage());
			} finally {
				if (mp != null)	mp.close();
				if (mp1 != null) mp1.close();
			}
		}		

 }
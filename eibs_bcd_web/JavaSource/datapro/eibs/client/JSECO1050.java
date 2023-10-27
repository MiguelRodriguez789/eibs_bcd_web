package datapro.eibs.client;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import datapro.eibs.beans.ECO105001Message;
import datapro.eibs.beans.ECO105002Message;
import datapro.eibs.beans.ECO105003Message;
import datapro.eibs.beans.ECO105004Message;
import datapro.eibs.beans.ECO105005Message;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.sockets.MessageRecord;

/**
 * Convenios De Recaudos
 * Creation date: (21/11/2014)
 * @author elias vargas
 *
 */
public class JSECO1050 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7613534514958036569L;
	protected static final int R_DEAL_COLLECT_ENTER = 100;
	protected static final int A_DEAL_COLLECT_LIST = 200;
	protected static final int R_DEAL_COLLECT_NEW =300;
	protected static final int R_DEAL_COLLECT_MAINT =400;
	protected static final int R_DEAL_COLLECT_INQUIRY =205;	
	protected static final int A_DEAL_COLLECT_MAINT =450;	
	protected static final int R_DEAL_COLLECT_DELETE = 500;
	//Modalidad Recaudo
	protected static final int A_DEAL_COLLECT_MODALITY_LIST   = 600;
	protected static final int R_DEAL_COLLECT_MODALITY_NEW    = 610;
	protected static final int A_DEAL_COLLECT_MODALITY_MAINT   =615;	
	protected static final int R_DEAL_COLLECT_MODALITY_DELETE = 620;
	//Modalidad Recaudo - Oficinas
	protected static final int A_DEAL_COLLECT_MODALITY_OFIC_LIST   = 630;
	protected static final int A_DEAL_COLLECT_MODALITY_OFIC_MAINT  = 632;	
	protected static final int R_DEAL_COLLECT_MODALITY_OFIC_DELETE = 633;		
	//Definicion de Canales - Referencia
	protected static final int A_DEAL_COLLECT_CANAL_LIST   = 700;
	protected static final int R_DEAL_COLLECT_CANAL_NEW    = 710;
	protected static final int R_DEAL_COLLECT_CANAL_MAINT  = 712;	
	protected static final int A_DEAL_COLLECT_CANAL_MAINT  = 715;	
	protected static final int R_DEAL_COLLECT_CANAL_DELETE = 720;	
	
	//Definicion de Referencia  Codigo Barra
	protected static final int A_DEAL_COLLECT_BAR_CODE_LIST   = 800;
	protected static final int R_DEAL_COLLECT_BAR_CODE_NEW    = 810;
	protected static final int R_DEAL_COLLECT_BAR_CODE_MAINT  = 812;	
	protected static final int A_DEAL_COLLECT_BAR_CODE_MAINT  = 815;	
	protected static final int R_DEAL_COLLECT_BAR_CODE_DELETE = 820;	

	//Definicion de Header Codigo Barra
	protected static final int A_DEAL_COLLECT_BAR_CODE_HEADER_LIST   = 850;
	protected static final int R_DEAL_COLLECT_BAR_CODE_HEADER_NEW    = 860;
	protected static final int R_DEAL_COLLECT_BAR_CODE_HEADER_MAINT  = 862;	
	protected static final int A_DEAL_COLLECT_BAR_CODE_HEADER_MAINT  = 865;	
	protected static final int R_DEAL_COLLECT_BAR_CODE_HEADER_DELETE = 870;	
	
	
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case R_DEAL_COLLECT_ENTER:
				procDealCollectEnter(user, req, res, session);
				break;		
			case A_DEAL_COLLECT_LIST:
				procDealCollectList(user, req, res, session);
				break;	
			case R_DEAL_COLLECT_NEW:
				procReqDealCollect(user, req, res, session, "NEW");
				break;					
			case R_DEAL_COLLECT_MAINT:
				procReqDealCollect(user, req, res, session, "MAINTENANCE");
				break;		
			case R_DEAL_COLLECT_INQUIRY:
				procReqDealCollect(user, req, res, session, "INQUIRY");
				break;				
			case A_DEAL_COLLECT_MAINT:
				procActionDealCollectMaintenance(user, req, res, session);
				break;				
			case  R_DEAL_COLLECT_DELETE:
				procReqDealCollectDelete(user, req, res, session);
				break;
			//Modalidad de recaudo
			case A_DEAL_COLLECT_MODALITY_LIST:
				procDealCollectModalityList(user, req, res, session);
				break;	
			case R_DEAL_COLLECT_MODALITY_NEW:
				procReqDealCollectModality(user, req, res, session, "NEW");
				break;	
			case A_DEAL_COLLECT_MODALITY_MAINT:
				procActionDealCollectModalityMaintenance(user, req, res, session);
				break;									
			case  R_DEAL_COLLECT_MODALITY_DELETE:
				procReqDealCollectModalityDelete(user, req, res, session);
				break;				
			//Modalidad de recaudo Oficinas
			case A_DEAL_COLLECT_MODALITY_OFIC_LIST:
				procDealCollectModalityOficList(user, req, res, session);
				break;				
			case A_DEAL_COLLECT_MODALITY_OFIC_MAINT:
				procActionDealCollectModalityOficMaintenance(user, req, res, session);
				break;
			case  R_DEAL_COLLECT_MODALITY_OFIC_DELETE:
				procReqDealCollectModalityOficDelete(user, req, res, session);
				break;				
			//Definicion de Canales - Referencia
			case A_DEAL_COLLECT_CANAL_LIST:
				procDealCollectCanalList(user, req, res, session);
				break;	
			case R_DEAL_COLLECT_CANAL_NEW:
				procReqDealCollectCanal(user, req, res, session, "NEW");
				break;	
			case R_DEAL_COLLECT_CANAL_MAINT:
				procReqDealCollectCanal(user, req, res, session, "MAINTENANCE");	
				break;					
			case A_DEAL_COLLECT_CANAL_MAINT:
				procActionDealCollectCanalMaintenance(user, req, res, session);
				break;									
			case  R_DEAL_COLLECT_CANAL_DELETE:
				procReqDealCollectCanalDelete(user, req, res, session);
				break;	
				//Definicion de Referencia  Codigo Barra
			case A_DEAL_COLLECT_BAR_CODE_LIST:
				procDealCollectCodBarraList(user, req, res, session);
				break;	
			case R_DEAL_COLLECT_BAR_CODE_NEW:
				procReqDealCollectCodBarra(user, req, res, session, "NEW");
				break;	
			case R_DEAL_COLLECT_BAR_CODE_MAINT:
				procReqDealCollectCodBarra(user, req, res, session, "MAINTENANCE");	
				break;					
			case A_DEAL_COLLECT_BAR_CODE_MAINT:
				procActionDealCollectCodBarraMaintenance(user, req, res, session);
				break;									
			case  R_DEAL_COLLECT_BAR_CODE_DELETE:
				procReqDealCollectCodBarraDelete(user, req, res, session);
				break;	
				
				//Definicion de Referencia  Codigo Barra
			case A_DEAL_COLLECT_BAR_CODE_HEADER_LIST:
				procDealCollectCodBarraHeaderList(user, req, res, session);
				break;					
			case R_DEAL_COLLECT_BAR_CODE_HEADER_NEW:
				procReqDealCollectCodBarraHeader(user, req, res, session, "NEW");
				break;	
			case R_DEAL_COLLECT_BAR_CODE_HEADER_MAINT:
				procReqDealCollectCodBarraHeader(user, req, res, session, "MAINTENANCE");	
				break;					
			case A_DEAL_COLLECT_BAR_CODE_HEADER_MAINT:
				procActionDealCollectCodBarraHeaderMaintenance(user, req, res, session);
				break;									
			case  R_DEAL_COLLECT_BAR_CODE_HEADER_DELETE:
				procReqDealCollectCodBarraHeaderDelete(user, req, res, session);
				break;					
			default :
				forward(devPage, req, res);
				break;
		}		
	}
	
	//*****************************************************************************
	// ****************** PRINCIPAL Recaudos
	//*****************************************************************************
	protected void procDealCollectEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {
		forward("ECO1050_collect_deal_enter.jsp", req, res);			
	}
	
	protected void procDealCollectList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				
				// viene convenio, por ende es cliente y convenio
				if (req.getParameter("E01COMNUM")!=null && !"".equals(req.getParameter("E01COMNUM").trim())
						&& !"0".equals(req.getParameter("E01COMNUM").trim()) && "Y".equals(req.getParameter("ENTER_DEAL"))){
					UserPos userPO = new UserPos();						
					userPO.setCusNum(req.getParameter("E01COMCUN"));
					userPO.setType("D");//Set D -->Direct
					session.setAttribute("userPO", userPO);
					procReqDealCollect(user, req, res, session, "MAINTENANCE");
				}else{
					//solo es cliente
					mp = getMessageProcessor("ECO1050", req);
					ECO105001Message msgList = (ECO105001Message) mp.getMessageRecord("ECO105001", user.getH01USR(), "0015");					
					try {
				 		msgList.setE01COMCUN(req.getParameter("E01COMCUN"));
					 } catch (Exception ex) {
							msgList.setE01COMCUN("0"); 
				  	 } 
					 
					 int record;
					 try {
					 	record = Integer.parseInt(req.getParameter("FromRecord"));
					 } catch (Exception e) {
						record = 0;
					 }
					 System.out.println("E01NUMREC="+record);
					 msgList.setE01NUMREC(String.valueOf(record));
						
					 //JBObjList list = new JBObjList();					 
					 mp.sendMessage(msgList);					 
					 JBObjList list = mp.receiveMessageRecordList("H01FLGMAS","E01NUMREC");
					 
					
					if (mp.hasError(list)) {
						session.setAttribute("error", mp.getError(list));
						forward("ECO1050_collect_deal_enter.jsp", req, res);					
					} else {
						//header
						ECO105001Message header = (ECO105001Message) list.get(0);	
						UserPos userPO = new UserPos();						
						userPO.setCusNum(header.getE01COMCUN());
						userPO.setID(header.getE01COMIDN());
						userPO.setCusName(header.getE01COMDCL());
						session.setAttribute("userPO", userPO);
						list.remove(0);
						
						session.setAttribute("ECO105001List", list);						
						forwardOnSuccess("ECO1050_collect_deal_list.jsp", req, res);
					}					 					 
				}//EoI
				
			} finally {
				if (mp != null)	mp.close();
			}
		}	
	
	/**
	 * procReqCovenant: This Method show a single deal either for 
	 * 					a new registry, a maintenance or an inquiry. 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqDealCollect(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		MessageProcessor mp3 = null;
		MessageProcessor mp4 = null;
		ELEERRMessage msgError = new ELEERRMessage();
		
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ECO1050", req);

			ECO105001Message msg = null;
			ECO105003Message msg3 = null;
		
			//Creates the message with operation code depending on the option
			if (option.equals("NEW")) {
				//New para pantalla principal
				msg = (ECO105001Message) mp.getMessageRecord("ECO105001", user.getH01USR(), "0001");
				msg.setE01OPE("01");//01 nuevo 
									//02 mantenimiento				
			} else if (option.equals("MAINTENANCE")) {
				//Maintenance
				msg = (ECO105001Message) mp.getMessageRecord("ECO105001", user.getH01USR(), "0002");				
			}else if (option.equals("INQUIRY")) {
				//Consulta para pantalla principal
				msg = (ECO105001Message) mp.getMessageRecord("ECO105001", user.getH01USR(), "0002");//TODO: luego cambiar por 0004				
			}
			
			//Sets the customer number
			msg.setE01COMCUN(userPO.getCusNum());
			
			//Sets the deals number
			if (req.getParameter("E01COMNUM") != null) {
				msg.setE01COMNUM(req.getParameter("E01COMNUM"));
				userPO.setAccNum(req.getParameter("E01COMNUM"));
			}
			
			//Send message
			mp.sendMessage(msg);

			//Receive error or data
			MessageRecord generic = mp.receiveMessageRecord();
			
			if (generic.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) generic;
				session.setAttribute("error", msgError);
			}else if (generic.getFormatName().equals("ECO105001")) {
				 msg = (ECO105001Message) generic;
			}		
			
			if (msgError.getERRNUM().equals("0")) {
				//if there are no errors go to maintenance page
				if (option.equals("NEW")) {
					msg.setE01OPE("01");
				} else if (option.equals("MAINTENANCE")) {
					msg.setE01OPE("02");
				}		
				
				//set session object
				userPO.setPurpose(option);//Set Purpose
				session.setAttribute("cdeObj", msg);
				session.setAttribute("userPO", userPO);
				
				
				//*******************************************
				//set key and send data dds03
				//*******************************************
				mp3 = getMessageProcessor("ECO1050", req);
				if (option.equals("NEW")) {
					msg3 = (ECO105003Message) mp3.getMessageRecord("ECO105003", user.getH01USR(), "0001");
				} else if (option.equals("MAINTENANCE")) {
					msg3 = (ECO105003Message) mp3.getMessageRecord("ECO105003", user.getH01USR(), "0002");
				}else if (option.equals("INQUIRY")) {
					msg3 = (ECO105003Message) mp3.getMessageRecord("ECO105003", user.getH01USR(), "0002");//TODO: luego cambiar por 0004										
				}
				msg3.setE03MEIBNK(msg.getE01COMBNK());
				msg3.setE03MEICUN(msg.getE01COMCUN());
				msg3.setE03MEINUM(msg.getE01COMNUM());
				msg3.setE03MEIDCL(msg.getE01COMDCL());
				msg3.setE03MEIIDN(msg.getE01COMIDN());
				mp3.sendMessage(msg3);
				MessageRecord generic3 = mp3.receiveMessageRecord();
				if (generic3.getFormatName().equals("ELEERR")) {
					msgError = (ELEERRMessage) generic3;
					session.setAttribute("error", msgError);
				}else if (generic3.getFormatName().equals("ECO105003")) {
					 msg3 = (ECO105003Message) generic3;
				}
				if (option.equals("NEW")) {
					msg3.setE03OPE("01");
				} else if (option.equals("MAINTENANCE")) {
					msg3.setE03OPE("02");
				}
				session.setAttribute("cdeObj3", msg3);
				
				
				//*******************************************
				//set key and send data dds04
				//*******************************************
/*				
				mp4 = getMessageProcessor("ECO1050", req);
				if (option.equals("NEW")) {
					msg4 = (ECO105004Message) mp4.getMessageRecord("ECO105004", user.getH01USR(), "0001");
				} else if (option.equals("MAINTENANCE")) {
					msg4 = (ECO105004Message) mp4.getMessageRecord("ECO105004", user.getH01USR(), "0002");
				}else if (option.equals("INQUIRY")) {
					msg4 = (ECO105004Message) mp4.getMessageRecord("ECO105004", user.getH01USR(), "0002");//TODO: luego cambiar por 0004									
				}
				msg4.setE04DCBBNK(msg.getE01COMBNK());
				msg4.setE04DCBCUN(msg.getE01COMCUN());
				msg4.setE04DCBNUM(msg.getE01COMNUM());
				msg4.setE04DCBDCL(msg.getE01COMDCL());
				msg4.setE04DCBIDN(msg.getE01COMIDN());
				mp4.sendMessage(msg4);
				MessageRecord generic4 = mp4.receiveMessageRecord();
				if (generic4.getFormatName().equals("ELEERR")) {
					msgError = (ELEERRMessage) generic4;
					session.setAttribute("error", msgError);
				}else if (generic4.getFormatName().equals("ECO105004")) {
					 msg4 = (ECO105004Message) generic4;
				}
				if (option.equals("NEW")) {
					msg4.setE04OPE("01");
				} else if (option.equals("MAINTENANCE")) {
					msg4.setE04OPE("02");
				}
				
				session.setAttribute("cdeObj4", msg4);	
*/				
				//grabamos un flat para saber que es primera vez que va a la pagina.
				req.setAttribute("VEZ", "S");
				flexLog("About to call Page: ECO1050_collect_deal_maintenance.jsp");
				forward("ECO1050_collect_deal_maintenance.jsp", req, res);
				
			} else {	
				if ("D".equals(userPO.getType())){
					forward("ECO1050_collect_deal_enter.jsp", req, res);	
				}else{
					forward("ECO1050_collect_deal_list.jsp", req, res);
				}									
			}
			
		} finally {
			if (mp != null)				
				mp.close();
			if (mp3 != null)
				mp3.close();
			if (mp4 != null)
				mp4.close();
		}
	}

	
	/**
	 * procActionMaintenance
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionDealCollectMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		
		MessageProcessor mp = null;
		MessageProcessor mp3 = null;
		MessageProcessor mp4 = null;
		ELEERRMessage msgError3 = new ELEERRMessage();
		ELEERRMessage msgError = new ELEERRMessage();
		try {
			UserPos userPO = getUserPos(req);
			mp = getMessageProcessor("ECO1050", req);

			ECO105001Message msg = (ECO105001Message) mp.getMessageRecord("ECO105001", user.getH01USR(), "0005");
			
			//Sets message with page fields
			//msg.setH01SCR("01");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			
			//el primero puede ser error o data
			MessageRecord generic = mp.receiveMessageRecord();
			if (generic.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) generic;
			}else if (generic.getFormatName().equals("ECO105001")) {
				 msg = (ECO105001Message) generic;
			}
			
			//luego puede mandar muchos errores, los cuales no me interesan porque solo muestro el primero
			generic = mp.receiveMessageRecord();
			while (generic.getFormatName().equals("ELEERR")){
				generic = mp.receiveMessageRecord();
			}
			
			//al salir verifico ya que el ultimo fue la data que si me interesa
			if (generic.getFormatName().equals("ECO105001")) {
				 msg = (ECO105001Message) generic;
			}		

			//leemos nuevamente el error, ya que este es para las validaciones finales de  todas las pestañas		
			generic = mp.receiveMessageRecord();			
			while (!generic.getFormatName().equals("ELEERR")){
				generic = mp.receiveMessageRecord();
			}	
			
			if (msgError.getERRNUM().equals("0")  ) {
				msgError = (ELEERRMessage) generic;
			}
			
			
			//set covenant number.
			userPO.setAccNum(msg.getE01COMNUM());
			
			//Sets session with required data
			session.setAttribute("error", msgError);
			msg.setH01SCR("0");

//			if ("S".equals(req.getParameter("GRABAR03"))) {//TODO
				mp3 = getMessageProcessor("ECO1050", req);
				ECO105003Message msg3 = (ECO105003Message) mp3.getMessageRecord("ECO105003", user.getH01USR(), "0005");
				//Sets message with page fields
				setMessageRecord(req, msg3);
				//Sending message
				mp3.sendMessage(msg3);
				msgError3 = new ELEERRMessage();
				MessageRecord generic3 = mp3.receiveMessageRecord();
				if (generic3.getFormatName().equals("ELEERR")) {
					msgError3 = (ELEERRMessage) generic3;
				}else if (generic3.getFormatName().equals("ECO105003")) {
					 msg3 = (ECO105003Message) generic3;
				}
				//luego puede mandar muchos errores, los cuales no me interesan porque solo muestro el primero
				generic3 = mp3.receiveMessageRecord();
				while (generic3.getFormatName().equals("ELEERR")){
					generic3 = mp3.receiveMessageRecord();
				}				
				//al salir verifico ya que el ultimo fue la data que si me interesa
				if (generic3.getFormatName().equals("ECO105003")) {
					 msg3 = (ECO105003Message) generic3;
				}
				//Sets session with required data
				if (msgError.getERRNUM().equals("0")  ) {
					session.setAttribute("error", msgError3);					
					msg.setH01SCR("3");
				}
				session.setAttribute("cdeObj3", msg3);
//			}//EoI

/*				
//			if ("S".equals(req.getParameter("GRABAR04"))) {//
				mp4 = getMessageProcessor("ECO1050", req);
				ECO105004Message msg4 = (ECO105004Message) mp4.getMessageRecord("ECO105004", user.getH01USR(), "0005");
				//Sets message with page fields
				setMessageRecord(req, msg4);
				//Sending message
				mp4.sendMessage(msg4);
				ELEERRMessage msgError4 = new ELEERRMessage();
				MessageRecord generic4 = mp4.receiveMessageRecord();
				if (generic4.getFormatName().equals("ELEERR")) {
					msgError4 = (ELEERRMessage) generic4;
				}else if (generic4.getFormatName().equals("ECO105004")) {
					 msg4 = (ECO105004Message) generic4;
				}
				//luego puede mandar muchos errores, los cuales no me interesan porque solo muestro el primero
				generic4 = mp4.receiveMessageRecord();
				while (generic4.getFormatName().equals("ELEERR")){
					generic4 = mp4.receiveMessageRecord();
				}				
				//al salir verifico ya que el ultimo fue la data que si me interesa
				if (generic4.getFormatName().equals("ECO105004")) {
					 msg4 = (ECO105004Message) generic4;
				}
				//Sets session with required data
				if (msgError.getERRNUM().equals("0") &&  msgError3.getERRNUM().equals("0") ) {
					session.setAttribute("error", msgError4);
					msg.setH01SCR("4");
				}
							
				session.setAttribute("cdeObj4", msg4);
//			}//EoI
*/			
			session.setAttribute("cdeObj", msg);
			session.setAttribute("userPO", userPO);
			forward("ECO1050_collect_deal_maintenance.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
			if (mp3 != null)
				mp3.close();
			if (mp4 != null)
				mp4.close();			
		}
	}
	
	/**
	 * procReqDelete
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqDealCollectDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);


		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ECO1050", req);
			
			//Creates message with the 'Delete'operation code
			ECO105001Message msg = (ECO105001Message) mp.getMessageRecord("ECO105001", user.getH01USR(), "0009");
			
			//Sets required values
			//msg.setH01SCR("01");
			msg.setE01COMCUN(userPO.getCusNum());
			msg.setE01COMNUM(req.getParameter("E01COMNUM"));
			
			//Send message
			mp.sendMessage(msg);

			//Receive Error 
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				//If there are no errors request the list again
				redirectToPage("/servlet/datapro.eibs.client.JSECO1050?SCREEN=200&E01COMCUN="	+ userPO.getCusNum(), res);
			} else {
				//if there are errors show the list without updating
				session.setAttribute("error", msgError);
				forward("ECO1050_collect_deal_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	//*****************************************************************************	
	//********************** Modalidad de recaudos
	//*****************************************************************************
	protected void procDealCollectModalityList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				String cuscun="";
				String codnun="";
				if (req.getParameter("E01COMCUN")!=null && !"".equals(req.getParameter("E01COMCUN").trim())
						&& !"0".equals(req.getParameter("E01COMCUN").trim())){
					cuscun=req.getParameter("E01COMCUN");
				}
				if (req.getParameter("E01COMNUM")!=null && !"".equals(req.getParameter("E01COMNUM").trim())
						&& !"0".equals(req.getParameter("E01COMNUM").trim())){
					codnun = req.getParameter("E01COMNUM");
				}				
				
				if (!cuscun.equals("") && !codnun.equals("")){
					//Sacamos de la session el obejto padre
					ECO105001Message msg = (ECO105001Message)session.getAttribute("cdeObj");
					mp = getMessageProcessor("ECO1050", req);
					ECO105002Message msgList = (ECO105002Message) mp.getMessageRecord("ECO105002", user.getH01USR(), "0015");	
					msgList.setE02MRCBNK(msg.getE01COMBNK());
					msgList.setE02MRCCUN(msg.getE01COMCUN());
					msgList.setE02MRCNUM(msg.getE01COMNUM());
					msgList.setE02MRCDCL(msg.getE01COMDCL());
					msgList.setE02MRCIDN(msg.getE01COMIDN());				
					mp.sendMessage(msgList);					 
					JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
					if (mp.hasError(list)) {
						session.setAttribute("error", mp.getError(list));
						forward("ECO1050_collect_deal_modality_list.jsp", req, res);					
					} else {
						
						//remove objects with the empty city						
						for (int i=0; i<list.size();i++) {
							ECO105002Message obj = (ECO105002Message) list.get(i);
							if ("".equals(obj.getE02MRCCRC())){
								list.remove(i);
							}							
						}					
				
						session.setAttribute("ECO105002List", list);						
						forwardOnSuccess("ECO1050_collect_deal_modality_list.jsp", req, res);
					}	
				}else{
					req.setAttribute("Cerrar", "SI");
					forward("ECO1050_collect_deal_modality_list.jsp", req, res);
				}


				
			} finally {
				if (mp != null)	mp.close();
			}
		}
	
	protected void procReqDealCollectModality(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		ELEERRMessage msgError = new ELEERRMessage();
		
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ECO1050", req);

			ECO105002Message msg2 = null;
			
			//Creates the message with operation code depending on the option
			if (option.equals("NEW")) {
				//New
				msg2 = (ECO105002Message) mp.getMessageRecord("ECO105002", user.getH01USR(), "0001");
				msg2.setE02OPE("01");//es nuevo ciudad
			} else if (option.equals("MAINTENANCE")) {
				//Maintenance
				msg2 = (ECO105002Message) mp.getMessageRecord("ECO105002", user.getH01USR(), "0002");
			}
			
			//Sets the customer number
			msg2.setE02MRCCUN(userPO.getCusNum());
			msg2.setE02MRCNUM(userPO.getAccNum());
			
			//Send message
			mp.sendMessage(msg2);

			//Receive error or data
			MessageRecord generic = mp.receiveMessageRecord();
			
			if (generic.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) generic;
				session.setAttribute("error", msgError);
			}else if (generic.getFormatName().equals("ECO105002")) {
				 msg2 = (ECO105002Message) generic;
			}			
			
			//luego puede mandar muchos errores, los cuales no me interesan porque solo muestro el primero
			generic = mp.receiveMessageRecord();
			while (generic.getFormatName().equals("ELEERR")){
				generic = mp.receiveMessageRecord();
			}
			
			//al salir verifico ya que el ultimo fue la data que si me interesa
			if (generic.getFormatName().equals("ECO105002")) {
				msg2 = (ECO105002Message) generic;
			}
			
			if (msgError.getERRNUM().equals("0")) {
				if (option.equals("NEW")) {
					msg2.setE02OPE("01");
				} else if (option.equals("MAINTENANCE")) {
					msg2.setE02OPE("02");
				}				
				session.setAttribute("cdeObj2", msg2);
				//session.setAttribute("userPO", userPO);
				//if there are no errors go to maintenance page
				flexLog("About to call Page: ECO1050_collect_deal_modality_maintenance.jsp");
				forward("ECO1050_collect_deal_modality_maintenance.jsp", req, res);
			} else {				
				forward("ECO1050_collect_deal_modality_maintenance.jsp", req, res);
				
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procActionDealCollectModalityMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		
		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = getMessageProcessor("ECO1050", req);

			ECO105002Message msg = (ECO105002Message) mp.getMessageRecord("ECO105002", user.getH01USR(), "0005");
			
			//Sets message with page fields
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			
			//el primero puede ser error o data
			ELEERRMessage msgError = new ELEERRMessage();
			MessageRecord generic = mp.receiveMessageRecord();
			if (generic.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) generic;
			}else if (generic.getFormatName().equals("ECO105002")) {
				 msg = (ECO105002Message) generic;
			}
			
			//luego puede mandar muchos errores, los cuales no me interesan porque solo muestro el primero
			generic = mp.receiveMessageRecord();
			while (generic.getFormatName().equals("ELEERR")){
				generic = mp.receiveMessageRecord();
			}
			
			//al salir verifico ya que el ultimo fue la data que si me interesa
			if (generic.getFormatName().equals("ECO105002")) { 
				 msg = (ECO105002Message) generic;
			}		
			
			//Sets session with required data
			
			if (msgError.getERRNUM().equals("0")) {
				redirectToPage("/servlet/datapro.eibs.client.JSECO1050?SCREEN=600&E01COMCUN="+ msg.getE02MRCCUN()+"&E01COMNUM="+  msg.getE02MRCNUM(), res);				
			}else{
				session.setAttribute("error", msgError);
				session.setAttribute("cdeObj2", msg);
				forward("ECO1050_collect_deal_modality_maintenance.jsp", req, res);
			}
			


		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procReqDealCollectModalityDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);

		MessageProcessor mp = null;

		
		JBObjList aplist = (JBObjList)session.getAttribute("ECO105002List");		
		int index = req.getParameter("CurrentRow")==null?0:req.getParameter("CurrentRow").equals("")?0:Integer.parseInt(req.getParameter("CurrentRow"));		
		ECO105002Message listMessage = (ECO105002Message)aplist.get(index);
		
		try {
			mp = getMessageProcessor("ECO1050", req);
			
			//Creates message with the 'Delete'operation code
			ECO105002Message msg = (ECO105002Message) mp.getMessageRecord("ECO105002", user.getH01USR(), "0009");
			
			//Sets required values
			msg.setE02MRCCUN(userPO.getCusNum());
			msg.setE02MRCNUM(userPO.getAccNum());
			msg.setE02MRCPRC(listMessage.getE02MRCPRC());
			msg.setE02MRCSRC(listMessage.getE02MRCSRC());
			msg.setE02MRCCRC(listMessage.getE02MRCCRC());
			
			//Send message
			mp.sendMessage(msg);

			ELEERRMessage msgError = new ELEERRMessage();
			MessageRecord generic = mp.receiveMessageRecord();
			if (generic.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) generic;
			}else if (generic.getFormatName().equals("ECO105002")) {
				 msg = (ECO105002Message) generic;
			}			

			if (!mp.hasError(msgError)) {
				//If there are no errors request the list again
				redirectToPage("/servlet/datapro.eibs.client.JSECO1050?SCREEN=600&E01COMCUN="+ msg.getE02MRCCUN() +"&E01COMNUM="+ msg.getE02MRCNUM(), res);
			} else {
				//if there are errors show the list without updating
				session.setAttribute("error", msgError);
				forward("ECO1050_collect_deal_modality_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	
	//*****************************************************************************
	//*******************************  Modalidad de Recaudos Oficinas
	//*****************************************************************************	
	protected void procDealCollectModalityOficList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			
			JBObjList aplist = (JBObjList)session.getAttribute("ECO105002List");		
			int index = req.getParameter("CurrentRow")==null?0:req.getParameter("CurrentRow").equals("")?0:Integer.parseInt(req.getParameter("CurrentRow"));		
			ECO105002Message listMessage = (ECO105002Message)aplist.get(index);
			
			try {			
				
				mp = getMessageProcessor("ECO1050", req);
				ECO105002Message msgList = (ECO105002Message) mp.getMessageRecord("ECO105002", user.getH01USR(), "0016");	
				msgList.setE02MRCCUN(listMessage.getE02MRCCUN());
				msgList.setE02MRCNUM(listMessage.getE02MRCNUM());
				//colocamos los campos que hacen falta para traer las oficinas
				msgList.setE02MRCPRC(listMessage.getE02MRCPRC());
				msgList.setE02MRCDPR(listMessage.getE02MRCDPR()); 
				msgList.setE02MRCSRC(listMessage.getE02MRCSRC()); 
				msgList.setE02MRCDSC(listMessage.getE02MRCDSC());
				msgList.setE02MRCCRC(listMessage.getE02MRCCRC()); 
				msgList.setE02MRCDRC(listMessage.getE02MRCDRC());					
			    mp.sendMessage(msgList);
			    JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");				
				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
					forward("ECO1050_collect_deal_modality_list.jsp", req, res);					
				} else {
					
					//remove objects with the empty city						
					for (int i=0; i<list.size();i++) {
						ECO105002Message obj = (ECO105002Message) list.get(i);
						if ("0".equals(obj.getE02MRCORC())){
							list.remove(i);
						}							
					}			
					
					session.setAttribute("cdeObj2", msgList);//sacamos del vector el primer elemento, nos sirve como encabezado
					session.setAttribute("ECO105002ListOfic", list);
					req.setAttribute("indexVec", index);
					forward("ECO1050_collect_deal_modality_ofic_maintenance.jsp", req, res);
				}				
			} finally {
				if (mp != null)	mp.close();
			}
		}
	
	protected void procActionDealCollectModalityOficMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ECO1050", req);

			ECO105002Message msg = (ECO105002Message) mp.getMessageRecord("ECO105002", user.getH01USR(), "0006");
			
			//Sets message with page fields
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			
			//el primero puede ser error o data
			ELEERRMessage msgError = new ELEERRMessage();
			MessageRecord generic = mp.receiveMessageRecord();
			if (generic.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) generic;
			}else if (generic.getFormatName().equals("ECO105002")) {
				 msg = (ECO105002Message) generic;
			}
			
			//luego puede mandar muchos errores, los cuales no me interesan porque solo muestro el primero
			generic = mp.receiveMessageRecord();
			while (generic.getFormatName().equals("ELEERR")){
				if ("0".equals(msgError.getERRNUM())){
					msgError = (ELEERRMessage) generic;
				}
				generic = mp.receiveMessageRecord();				
			}
			
			//al salir verifico ya que el ultimo fue la data que si me interesa
			if (generic.getFormatName().equals("ECO105002")) {
				 msg = (ECO105002Message) generic;
			}		
			
			//Sets session with required data
			session.setAttribute("error", msgError);
			session.setAttribute("cdeObj2", msg);
			procDealCollectModalityOficList(user, req, res, session);//Recargamos la lista, deberia agregar otro

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procReqDealCollectModalityOficDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);


		MessageProcessor mp = null;

		
		
		try {
			mp = getMessageProcessor("ECO1050", req);
			
			//Creates message with the 'Delete'operation code
			ECO105002Message msg = (ECO105002Message) mp.getMessageRecord("ECO105002", user.getH01USR(), "0010");

			//Sets message with page field, only dds02
			setMessageRecord(req, msg);
			
			//Sets required values, header value 
			msg.setE02MRCCUN(userPO.getCusNum());
			msg.setE02MRCNUM(userPO.getAccNum());

			//Sets message with page fields
			setMessageRecord(req, msg);
			
			//Send message
			mp.sendMessage(msg);

			//Receive msg
			
			ELEERRMessage msgError = new ELEERRMessage();
			MessageRecord generic = mp.receiveMessageRecord();
			if (generic.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) generic;
			}else if (generic.getFormatName().equals("ECO105002")) {
				 msg = (ECO105002Message) generic;
			}
			
			if (!mp.hasError(msgError)) {				
				procDealCollectModalityOficList(user, req, res, session);//Recargamos la lista, deberia eliminar una oficina				
			} else {
				//if there are errors show the list without delete
				session.setAttribute("error", msgError);
				forward("ECO1050_collect_deal_modality_ofic_maintenance.jsp", req, res);
			}
			
						
			
			
			
			

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	//*****************************************************************************
	//****************** Definicion de canal - referencia
	//*****************************************************************************	
	protected void procDealCollectCanalList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				UserPos userPO = getUserPos(req);
				String cuscun="";
				String codnun="";
				if (req.getParameter("E01COMCUN")!=null && !"".equals(req.getParameter("E01COMCUN").trim())
						&& !"0".equals(req.getParameter("E01COMCUN").trim())){
					cuscun=req.getParameter("E01COMCUN");
				}
				if (req.getParameter("E01COMNUM")!=null && !"".equals(req.getParameter("E01COMNUM").trim())
						&& !"0".equals(req.getParameter("E01COMNUM").trim())){
					codnun = req.getParameter("E01COMNUM");
				}				
				
				if (!cuscun.equals("") && !codnun.equals("")){
					mp = getMessageProcessor("ECO1050", req);
					ECO105005Message msgList = (ECO105005Message) mp.getMessageRecord("ECO105005", user.getH01USR(), "0015");	
					msgList.setE05RCRCUN(cuscun);
					msgList.setE05RCRNUM(codnun);
					
					//JBObjList list = new JBObjList();
					mp.sendMessage(msgList);					 
					JBObjList list = mp.receiveMessageRecordList("H05FLGMAS");
					session.setAttribute("userPO", userPO);
					if (mp.hasError(list)) {
						session.setAttribute("error", mp.getError(list));
						forward("ECO1050_collect_deal_canal_list.jsp", req, res);					
					} else {						
						session.setAttribute("ECO105005List", list);						
						forwardOnSuccess("ECO1050_collect_deal_canal_list.jsp", req, res);
					}	
				}else{
					req.setAttribute("Cerrar", "SI");
					forward("ECO1050_collect_deal_canal_list.jsp", req, res);
				}


				
			} finally {
				if (mp != null)	mp.close();
			}
		}
	
	protected void procReqDealCollectCanal(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		ELEERRMessage msgError = new ELEERRMessage();
		
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ECO1050", req);

			ECO105005Message msg5 = null;
			
			//Creates the message with operation code depending on the option
			if (option.equals("NEW")) {
				//New
				msg5 = (ECO105005Message) mp.getMessageRecord("ECO105005", user.getH01USR(), "0001");
				msg5.setE05RCRCUN(userPO.getCusNum());
				msg5.setE05RCRNUM(userPO.getAccNum());
				
			} else if (option.equals("MAINTENANCE")) {
				JBObjList aplist = (JBObjList)session.getAttribute("ECO105005List");		
				int index = req.getParameter("CurrentRow")==null?0:req.getParameter("CurrentRow").equals("")?0:Integer.parseInt(req.getParameter("CurrentRow"));		
				ECO105005Message listMessage = (ECO105005Message)aplist.get(index);
				//Maintenance
				msg5 = (ECO105005Message) mp.getMessageRecord("ECO105005", user.getH01USR(), "0002");
				populate(listMessage, msg5);//mandamos los datos para que devuelva los valores de mantenimiento del convenio.
				msg5.setH05OPECOD("0002");
			}			
			
			//Send message
			mp.sendMessage(msg5);

			//Receive error or data
			MessageRecord generic = mp.receiveMessageRecord();
			if (generic.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) generic;
				session.setAttribute("error", msgError);
			}
			
			//luego puede mandar muchos errores, los cuales no me interesan porque solo muestro el primero
			generic = mp.receiveMessageRecord();
			while (generic.getFormatName().equals("ELEERR")){
				generic = mp.receiveMessageRecord();
			}
			
			//al salir verifico ya que el ultimo fue la data que si me interesa
			if (generic.getFormatName().equals("ECO105005")) {
				msg5 = (ECO105005Message) generic;
			}
			
			if (msgError.getERRNUM().equals("0")) {
				if (option.equals("NEW")) {
					msg5.setE05OPE("01");
					ECO105001Message msg1 = (ECO105001Message)session.getAttribute("cdeObj");
					//inicializamos el valor de las fechas con el del encabezado
					//desde
					msg5.setE05RCRVID(msg1.getE01COMVID());
					msg5.setE05RCRVIM(msg1.getE01COMVIM());
					msg5.setE05RCRVIY(msg1.getE01COMVIY());
					//hasta
					msg5.setE05RCRVFD(msg1.getE01COMVFD());
					msg5.setE05RCRVFM(msg1.getE01COMVFM());	
					msg5.setE05RCRVFY(msg1.getE01COMVFY());
					
				} else if (option.equals("MAINTENANCE")) {
					msg5.setE05OPE("02");
				}				
				session.setAttribute("cdeObj5", msg5);
				session.setAttribute("userPO", userPO);
				//if there are no errors go to maintenance page
				flexLog("About to call Page: ECO1050_collect_deal_canal_maintenance.jsp");
				forwardOnSuccess("ECO1050_collect_deal_canal_maintenance.jsp", req, res);
			} else {				
				forward("ECO1050_collect_deal_canal_maintenance.jsp", req, res);
				
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procActionDealCollectCanalMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		
		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = getMessageProcessor("ECO1050", req);

			ECO105005Message msg = (ECO105005Message) mp.getMessageRecord("ECO105005", user.getH01USR(), "0005");
			
			//Sets message with page fields
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			
			//el primero puede ser error o data
			ELEERRMessage msgError = new ELEERRMessage();
			MessageRecord generic = mp.receiveMessageRecord();
			if (generic.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) generic;
			}else if (generic.getFormatName().equals("ECO105005")) {
				 msg = (ECO105005Message) generic;
			}
			
			//luego puede mandar muchos errores, los cuales no me interesan porque solo muestro el primero
			generic = mp.receiveMessageRecord();
			while (generic.getFormatName().equals("ELEERR")){
				generic = mp.receiveMessageRecord();
			}
			
			//al salir verifico ya que el ultimo fue la data que si me interesa
			if (generic.getFormatName().equals("ECO105005")) {
				 msg = (ECO105005Message) generic;
			}
			
			
			if (msgError.getERRNUM().equals("0")) {
				redirectToPage("/servlet/datapro.eibs.client.JSECO1050?SCREEN=700&E01COMCUN="+ userPO.getCusNum()+"&E01COMNUM="+ userPO.getAccNum(), res);				
			}else{
				session.setAttribute("error", msgError);
				session.setAttribute("cdeObj5", msg);
				forward("ECO1050_collect_deal_canal_maintenance.jsp", req, res);
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procReqDealCollectCanalDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);

		MessageProcessor mp = null;
		ELEERRMessage msgError = new ELEERRMessage();
		
		JBObjList aplist = (JBObjList)session.getAttribute("ECO105005List");		
		int index = req.getParameter("CurrentRow")==null?0:req.getParameter("CurrentRow").equals("")?0:Integer.parseInt(req.getParameter("CurrentRow"));		
		ECO105005Message listMessage = (ECO105005Message)aplist.get(index);
		
		try {
			mp = getMessageProcessor("ECO1050", req);
			
			//Creates message with the 'Delete'operation code
			ECO105005Message msg = (ECO105005Message) mp.getMessageRecord("ECO105005", user.getH01USR(), "0009");
			
			//Sets required values
			populate(listMessage,msg);
			
			//opecod para borrar
			msg.setH05OPECOD("0009");
						
			
			//Send message
			mp.sendMessage(msg);

			//firts
			//Receive Error or data
			MessageRecord generic = mp.receiveMessageRecord();			
			if (generic.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) generic;
			}else if (generic.getFormatName().equals("ECO105001")) {
				 msg = (ECO105005Message) generic;
			}
			System.out.println("UNO="+generic.getFormatName());
			//second
			generic = mp.receiveMessageRecord();			
			if (generic.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) generic;
			}else if (generic.getFormatName().equals("ECO105001")) {
				 msg = (ECO105005Message) generic;
			}			
			System.out.println("DOS="+generic.getFormatName());

			if (!mp.hasError(msgError)) {
				//If there are no errors request the list again
				redirectToPage("/servlet/datapro.eibs.client.JSECO1050?SCREEN=700&E01COMCUN="+ userPO.getCusNum()+"&E01COMNUM="+ userPO.getAccNum(), res);
			} else {
				//if there are errors show the list without updating
				session.setAttribute("error", msgError);
				forward("ECO1050_collect_deal_canal_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}	

	//*****************************************************************************
	//****************** Definicion de Header  Codigo Barra
	//*****************************************************************************	
	
	protected void procDealCollectCodBarraHeaderList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				UserPos userPO = getUserPos(req);
				String cuscun="";
				String codnun="";
				if (req.getParameter("E01COMCUN")!=null && !"".equals(req.getParameter("E01COMCUN").trim())
						&& !"0".equals(req.getParameter("E01COMCUN").trim())){
					cuscun=req.getParameter("E01COMCUN");
				}
				if (req.getParameter("E01COMNUM")!=null && !"".equals(req.getParameter("E01COMNUM").trim())
						&& !"0".equals(req.getParameter("E01COMNUM").trim())){
					codnun = req.getParameter("E01COMNUM");					
				}				
				
				if (!cuscun.equals("") && !codnun.equals("")){
					System.out.println("ENTRO LISTA HEADER");
					mp = getMessageProcessor("ECO1050", req);
					ECO105004Message msgList = (ECO105004Message) mp.getMessageRecord("ECO105004", user.getH01USR(), "0015");	
					msgList.setH04OPECOD("0015");                   
					msgList.setE04DCBCUN(cuscun);
					msgList.setE04DCBNUM(codnun);
					ECO105001Message msg1 = (ECO105001Message)session.getAttribute("cdeObj");
					msgList.setE04DCBBNK(msg1.getE01COMBNK());
                    msgList.setE04DCBDCL(msg1.getE01COMDCL());
                    msgList.setE04DCBIDN(msg1.getE01COMIDN()); 					
									
					//JBObjList list = new JBObjList();
					 mp.sendMessage(msgList);					 
					 JBObjList list = mp.receiveMessageRecordList("H04FLGMAS");
					 session.setAttribute("userPO", userPO);
					 if (mp.hasError(list)) {
						session.setAttribute("error", mp.getError(list));
						forward("ECO1050_collect_deal_cod_barra_header_list.jsp", req, res);					
					} else {						
						session.setAttribute("ECO105004HeaderList", list);						
						forwardOnSuccess("ECO1050_collect_deal_cod_barra_header_list.jsp", req, res);
					}	
				}else{
					req.setAttribute("Cerrar", "SI");
					forward("ECO1050_collect_deal_cod_barra_header_list.jsp", req, res);
				}


				
			} finally {
				if (mp != null)	mp.close();
			}
		}
	
	protected void procReqDealCollectCodBarraHeader(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		ELEERRMessage msgError = new ELEERRMessage();
		
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ECO1050", req);

			ECO105004Message msg4 = null;
			
			//Creates the message with operation code depending on the option
			if (option.equals("NEW")) {
				ECO105001Message msg = (ECO105001Message)session.getAttribute("cdeObj");
				
				msg4 = (ECO105004Message) mp.getMessageRecord("ECO105004", user.getH01USR(), "0001");
				msg4.setE04DCBBNK(msg.getE01COMBNK());
				msg4.setE04DCBCUN(msg.getE01COMCUN());
				msg4.setE04DCBNUM(msg.getE01COMNUM());
				msg4.setE04DCBDCL(msg.getE01COMDCL());
				msg4.setE04DCBIDN(msg.getE01COMIDN());
				mp.sendMessage(msg4);
				
				MessageRecord generic = mp.receiveMessageRecord();
				if (generic.getFormatName().equals("ELEERR")) {
					msgError = (ELEERRMessage) generic;
					session.setAttribute("error", msgError);
				}else if (generic.getFormatName().equals("ECO105004")) {
					 msg4 = (ECO105004Message) generic;
				}
				
				msg4.setE04OPE("01");
				int c = Integer.parseInt(req.getParameter("CONSEC"));
				c++;
				String consec = c+"";
				req.setAttribute("CONSE", consec);
				
			} else if (option.equals("MAINTENANCE")) {
				JBObjList aplist = (JBObjList)session.getAttribute("ECO105004HeaderList");		
				int index = req.getParameter("CurrentRow")==null?0:req.getParameter("CurrentRow").equals("")?0:Integer.parseInt(req.getParameter("CurrentRow"));				
				msg4 = (ECO105004Message)aplist.get(index);	
				msg4.setE04OPE("02");
			}
							
			session.setAttribute("cdeObj4", msg4);
			session.setAttribute("userPO", userPO);
			//if there are no errors go to maintenance page
			flexLog("About to call Page: ECO1050_collect_deal_cod_barra_header_maintenance.jsp");
			forwardOnSuccess("ECO1050_collect_deal_cod_barra_header_maintenance.jsp", req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procActionDealCollectCodBarraHeaderMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ECO1050", req);
			ECO105004Message msg4 = (ECO105004Message) mp.getMessageRecord("ECO105004", user.getH01USR(), "0005");
			//Sets message with page fields
			setMessageRecord(req, msg4);
			//Sending message
			mp.sendMessage(msg4);
			ELEERRMessage msgError = new ELEERRMessage();
			MessageRecord generic = mp.receiveMessageRecord();
			if (generic.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) generic;
			}else if (generic.getFormatName().equals("ECO105004")) {
				 msg4 = (ECO105004Message) generic;
			}
			//luego puede mandar muchos errores, los cuales no me interesan porque solo muestro el primero
			generic = mp.receiveMessageRecord();
			while (generic.getFormatName().equals("ELEERR")){
				generic = mp.receiveMessageRecord();
			}				
			//al salir verifico ya que el ultimo fue la data que si me interesa
			if (generic.getFormatName().equals("ECO105004")) {
				 msg4 = (ECO105004Message) generic;
			}
			//Sets session with required data
			if (msgError.getERRNUM().equals("0")) {
				redirectToPage("/servlet/datapro.eibs.client.JSECO1050?SCREEN=850&E01COMCUN="+ msg4.getE04DCBCUN() +"&E01COMNUM="+ msg4.getE04DCBNUM(), res);
			}else{
				session.setAttribute("cdeObj4", msg4);				
				session.setAttribute("error", msgError);	
				forward("ECO1050_collect_deal_cod_barra_header_maintenance.jsp", req, res);				
			}						
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procReqDealCollectCodBarraHeaderDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {
		UserPos userPO = getUserPos(req);

		MessageProcessor mp = null;

		
		JBObjList aplist = (JBObjList)session.getAttribute("ECO105004HeaderList");		
		int index = req.getParameter("CurrentRow")==null?0:req.getParameter("CurrentRow").equals("")?0:Integer.parseInt(req.getParameter("CurrentRow"));		
		ECO105004Message listMessage = (ECO105004Message)aplist.get(index);
		try {
			mp = getMessageProcessor("ECO1050", req);
			
			//Creates message with the 'Delete'operation code
			ECO105004Message msg = (ECO105004Message) mp.getMessageRecord("ECO105004", user.getH01USR(), "0009");
			
			//Sets required values
			populate(listMessage,msg);		
			msg.setH04OPECOD("0009");
			
			//Send message
			mp.sendMessage(msg);
			//Receive Error 
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {				
				//If there are no errors request the list again
				redirectToPage("/servlet/datapro.eibs.client.JSECO1050?SCREEN=850&E01COMCUN="+ listMessage.getE04DCBCUN()+"&E01COMNUM="+ listMessage.getE04DCBNUM(), res);			
			} else {				
				//if there are errors show the list without updating
				session.setAttribute("error", msgError);
				forward("ECO1050_collect_deal_cod_barra_header_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	//*****************************************************************************
	//****************** Definicion de Referencia  Codigo Barra
	//*****************************************************************************	
	protected void procDealCollectCodBarraList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				UserPos userPO = getUserPos(req);
				String cuscun="";
				String codnun="";
				if (req.getParameter("E01COMCUN")!=null && !"".equals(req.getParameter("E01COMCUN").trim())
						&& !"0".equals(req.getParameter("E01COMCUN").trim())){
					cuscun=req.getParameter("E01COMCUN");
				}
				if (req.getParameter("E01COMNUM")!=null && !"".equals(req.getParameter("E01COMNUM").trim())
						&& !"0".equals(req.getParameter("E01COMNUM").trim())){
					codnun = req.getParameter("E01COMNUM");					
				}				
				
				if (!cuscun.equals("") && !codnun.equals("")){
					ECO105004Message cdeObj4 = (ECO105004Message)session.getAttribute("cdeObj4");
					mp = getMessageProcessor("ECO1050", req);
					ECO105004Message msgList = (ECO105004Message) mp.getMessageRecord("ECO105004", user.getH01USR(), "0016");	
					populate(cdeObj4, msgList);//lleno los campos que me hacen falta.
					msgList.setH04OPECOD("0016");
					msgList.setE04DCBCUN(cuscun);
					msgList.setE04DCBNUM(codnun);
									
					//JBObjList list = new JBObjList();
					 mp.sendMessage(msgList);					 
					 JBObjList list = mp.receiveMessageRecordList("H04FLGMAS");
					 session.setAttribute("userPO", userPO);
					 if (mp.hasError(list)) {
						session.setAttribute("error", mp.getError(list));
						forward("ECO1050_collect_deal_cod_barra_list.jsp", req, res);					
					} else {						
						session.setAttribute("ECO105004List", list);						
						forwardOnSuccess("ECO1050_collect_deal_cod_barra_list.jsp", req, res);
					}	
				}else{
					req.setAttribute("Cerrar", "SI");
					forward("ECO1050_collect_deal_cod_barra_list.jsp", req, res);
				}


				
			} finally {
				if (mp != null)	mp.close();
			}
		}
	
	protected void procReqDealCollectCodBarra(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		ELEERRMessage msgError = new ELEERRMessage();
		
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ECO1050", req);

			ECO105004Message msg4 = null;
			
			//Creates the message with operation code depending on the option
			if (option.equals("NEW")) {
				ECO105004Message cdeObj4 = (ECO105004Message)session.getAttribute("cdeObj4");			
				//New
				msg4 = (ECO105004Message) mp.getMessageRecord("ECO105004", user.getH01USR(), "0011");
				populate(cdeObj4, msg4);//lleno los campos que me hacen falta.
				msg4.setH04OPECOD("0011");
				
			} else if (option.equals("MAINTENANCE")) {
				JBObjList aplist = (JBObjList)session.getAttribute("ECO105004List");		
				int index = req.getParameter("CurrentRow")==null?0:req.getParameter("CurrentRow").equals("")?0:Integer.parseInt(req.getParameter("CurrentRow"));				
				ECO105004Message listMessage = (ECO105004Message)aplist.get(index);				
				//Maintenance				
				msg4 = (ECO105004Message) mp.getMessageRecord("ECO105004", user.getH01USR(), "0012");
				populate(listMessage, msg4);//lleno los campos que me hacen falta.
				msg4.setH04OPECOD("0012");
			}
			
			//Sets the customer number
			//msg4.setE04DCBCUN(userPO.getCusNum());
			//msg4.setE04DCBNUM(userPO.getAccNum());			
			
			//Send message
			mp.sendMessage(msg4);

			//Receive error or data
			MessageRecord generic = mp.receiveMessageRecord();			
			while (generic.getFormatName().equals("ELEERR")){
				msgError = (ELEERRMessage) generic;
				session.setAttribute("error", msgError);
				generic = mp.receiveMessageRecord();
			}
			
			//al salir verifico ya que el ultimo fue la data que si me interesa
			if (generic.getFormatName().equals("ECO105004")) {
				msg4 = (ECO105004Message) generic;
			}						
			
			if (msgError.getERRNUM().equals("0")) {
				if (option.equals("NEW")) {
					msg4.setE04OPE("01");
					ECO105004Message msg = (ECO105004Message)session.getAttribute("cdeObj4");
					//inicializamos el valor de las fechas con el del encabezado
					//desde
					msg4.setE04DRBVID(msg.getE04DCBVID());
					msg4.setE04DRBVIM(msg.getE04DCBVIM());
					msg4.setE04DRBVIY(msg.getE04DCBVIY());
					//hasta
					msg4.setE04DRBVFD(msg.getE04DCBVFD());
					msg4.setE04DRBVFM(msg.getE04DCBVFM());	
					msg4.setE04DRBVFY(msg.getE04DCBVFY());
				} else if (option.equals("MAINTENANCE")) {
					msg4.setE04OPE("02");
				}				
				session.setAttribute("cdeObj4R", msg4);
				session.setAttribute("userPO", userPO);
				//if there are no errors go to maintenance page
				flexLog("About to call Page: ECO1050_collect_deal_cod_barra_maintenance.jsp");
				forwardOnSuccess("ECO1050_collect_deal_cod_barra_maintenance.jsp", req, res);
			} else {				
				forward("ECO1050_collect_deal_cod_barra_maintenance.jsp", req, res);
				
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procActionDealCollectCodBarraMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		
		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = getMessageProcessor("ECO1050", req);

			ECO105004Message msg = (ECO105004Message) mp.getMessageRecord("ECO105004", user.getH01USR(), "0006");
			
			
			//set message  with values header
			ECO105004Message cdeObj4 = (ECO105004Message)session.getAttribute("cdeObj4");		
			populate(cdeObj4,msg);
			msg.setH04OPECOD("0006");
			
			//Sets message with page fields
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			
			//el primero puede ser error o data
			ELEERRMessage msgError = new ELEERRMessage();
			MessageRecord generic = mp.receiveMessageRecord();
			if (generic.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) generic;
			}else if (generic.getFormatName().equals("ECO105004")) {
				 msg = (ECO105004Message) generic;
			}
			
			//luego puede mandar muchos errores, los cuales no me interesan porque solo muestro el primero
			generic = mp.receiveMessageRecord();
			while (generic.getFormatName().equals("ELEERR")){
				generic = mp.receiveMessageRecord();
			}
			
			//al salir verifico ya que el ultimo fue la data que si me interesa
			if (generic.getFormatName().equals("ECO105004")) {
				 msg = (ECO105004Message) generic;
			}
			
			if (msgError.getERRNUM().equals("0")) {
				redirectToPage("/servlet/datapro.eibs.client.JSECO1050?SCREEN=800&E01COMCUN="+ cdeObj4.getE04DCBCUN()+"&E01COMNUM="+ cdeObj4.getE04DCBNUM(), res);				
			}else{
				session.setAttribute("error", msgError);
				session.setAttribute("cdeObj4R", msg);
				forward("ECO1050_collect_deal_cod_barra_maintenance.jsp", req, res);
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procReqDealCollectCodBarraDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);

		MessageProcessor mp = null;

		
		JBObjList aplist = (JBObjList)session.getAttribute("ECO105004List");		
		int index = req.getParameter("CurrentRow")==null?0:req.getParameter("CurrentRow").equals("")?0:Integer.parseInt(req.getParameter("CurrentRow"));		
		ECO105004Message listMessage = (ECO105004Message)aplist.get(index);
		
		try {
			mp = getMessageProcessor("ECO1050", req);
			
			//Creates message with the 'Delete'operation code
			ECO105004Message msg = (ECO105004Message) mp.getMessageRecord("ECO105004", user.getH01USR(), "0019");
			
			//Sets required values
			populate(listMessage,msg);
			
			msg.setH04OPECOD("0019");
			
			//Send message
			mp.sendMessage(msg);

			//Receive Error 
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				//If there are no errors request the list again
				redirectToPage("/servlet/datapro.eibs.client.JSECO1050?SCREEN=800&E01COMCUN="+ listMessage.getE04DCBCUN()+"&E01COMNUM="+ listMessage.getE04DCBNUM(), res);				
			} else {
				//if there are errors show the list without updating
				session.setAttribute("error", msgError);
				forward("ECO1050_collect_deal_cod_barra_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}		
	
 }
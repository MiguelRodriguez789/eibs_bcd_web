package datapro.eibs.client;

/**
 * Apply Payment forms 
 * Creation date: (26/02/13)
 * @author: EV
 */
import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import datapro.eibs.beans.ECO024001Message;

import datapro.eibs.beans.ECO024002Message;
import datapro.eibs.beans.ECO024004Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageRecord;

public class JSECO0240 extends JSEIBSServlet {

	/**
	 * comentario 
	 */
	private static final long serialVersionUID = 5374590957161957090L;

	protected static final int R_PAY_APPLY_FORM_LIST = 100;	
	protected static final int A_PAY_APPLY_FORM_LIST = 101;
	protected static final int A_PAY_APPLY_FORM_SELECTED = 200;	
	protected static final int A_PAY_APPLY_FORM_SELECTED_FILTERED = 300;		
	protected static final int A_PAY_APPLY_FORM_MAINTENANCE = 500;


	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
		case R_PAY_APPLY_FORM_LIST:			
			procReqPayApplyformList(user, req, res, session);
			break;		
		case A_PAY_APPLY_FORM_LIST:
			procActionPayApplyformList(user, req, res, session);
			break;		
		case A_PAY_APPLY_FORM_SELECTED:
			procActionPayApplyformSelected(user, req, res, session);
			break;
		case A_PAY_APPLY_FORM_SELECTED_FILTERED:
			procActionPayApplyformSelectedFiltered(user, req, res, session);
			break;			
		case A_PAY_APPLY_FORM_MAINTENANCE:
			procActionPayApplyformMaintenance(user, req, res, session);
			break;			
		default :
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}
	/**
	 * procReqPayApplyformList: show init page
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqPayApplyformList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			//remove attribute sessions
			ses.removeAttribute("HClient");
			ses.removeAttribute("ECO024002List");
			ses.removeAttribute("ECO024002ListFilter");			
			ses.removeAttribute("apply");
			ses.removeAttribute("ListPosSelected");			
			flexLog("About to call Page: ECO0240_pago_planillas_search.jsp");
			forward("ECO0240_pago_planillas_search.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	
	
	/**
	 * procActionPayApplyformList: find the list of forms
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionPayApplyformList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		MessageProcessor mp = null;

		try {

			mp = getMessageProcessor("ECO0240", req);
			ECO024001Message msgList = (ECO024001Message) mp.getMessageRecord("ECO024001", user.getH01USR(), "0015");
			
			String type= "";
			type = req.getParameter("Type");//only C: customer P: planilla
			type = (type==null)?"":type;			
			
			//msgList.setH01FLGWK2(type);// for rpg programs diference type
			
			if ("P".equals(type)){
				//just form and currency
				if (req.getParameter("E01SELNUM")!=null && !"".equals(req.getParameter("E01SELNUM").trim()) ){
					msgList.setE01SELNUM(req.getParameter("E01SELNUM"));
				}				
				if (req.getParameter("E01SELRCY")!=null && !"".equals(req.getParameter("E01SELRCY").trim()) ){
					msgList.setE01SELRCY(req.getParameter("E01SELRCY"));
				}				
				
			}else{
				//just form of client
				if (req.getParameter("E01SELECU")!=null && !"".equals(req.getParameter("E01SELECU").trim()) ){
					msgList.setE01SELECU(req.getParameter("E01SELECU"));
				}				
			}

			// Sends message
			mp.sendMessage(msgList);
			
			ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();
			if (mp.hasError(error)) {
				// if there are errors go back to firstpage
				session.setAttribute("error", error);
				flexLog("About to call Page: ECO0240_pago_planillas_search.jsp");
				forward("ECO0240_pago_planillas_search.jsp", req, res);
			} else {
				// Receive header
				ECO024001Message header = (ECO024001Message) mp.receiveMessageRecord();			
				
				// and then Receive forms list
				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
				
				//save infs sessions
				session.setAttribute("Type", type);//Tipo de Busqueda
				session.setAttribute("Type", type);//Tipo de Busqueda				
				session.setAttribute("HClient", header);
				session.setAttribute("ECO024002List", list);
				forwardOnSuccess("ECO0240_pago_planillas_lista.jsp", req, res);//always shows list				
			}
		
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	/**
	 * procActionPayApplyformSelected: This Method show next page where selected way to reallocate.
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionPayApplyformSelected(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws ServletException,
			IOException {
		
		JBObjList list = (JBObjList) session.getAttribute("ECO024002List");
		JBObjList listFilter = new JBObjList(); 
		//read list form selected.
		String[] valPosSelected=req.getParameterValues("E02PLHSEL");
		if (valPosSelected==null) {
			valPosSelected=(String[])session.getAttribute("ListPosSelected");
		}
		//read other fields
		if (valPosSelected==null) {//no selected items
			ELEERRMessage msgError = new ELEERRMessage();
			msgError.setERRNUM("1");
			msgError.setERNU01("01");//4
            msgError.setERDS01("Debe seleccionar alguna Planilla para Continuar");//70	
			session.setAttribute("error", msgError);								
			forward("ECO0240_pago_planillas_lista.jsp", req, res);
		} else {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ECO0240", req);
				for (int i = 0; i < valPosSelected.length; i++) {
					ECO024002Message forma = (ECO024002Message) list.get(Integer.parseInt(valPosSelected[i]));				
					ECO024002Message msg = (ECO024002Message) mp.getMessageRecord("ECO024002", user.getH01USR(), "0002");
					obtainValues(forma,msg);
					mp.sendMessage(msg);					
					MessageRecord newmessage = mp.receiveMessageRecord();
					while ("ELEERR".equals(newmessage.getFormatName())){//mientras me envien error leo
						newmessage = mp.receiveMessageRecord();
					}//EoW
					//ya no es Error..
					ECO024002Message formaVer = (ECO024002Message)newmessage;
					listFilter.addRow(formaVer);					
				}//EoF					
			}finally {
				if (mp != null)
					mp.close();
			}
			session.setAttribute("ECO024002ListFilter",listFilter);
			session.setAttribute("ListPosSelected",valPosSelected);					
			forward("ECO0240_pago_planillas_lista_filter.jsp", req, res);					
		}
				
	}	
	
	private void obtainValues(ECO024002Message source, ECO024002Message destination){
		destination.setE02PLHSEL(source.getE02PLHSEL());
		destination.setE02PLHCDE(source.getE02PLHCDE());
        destination.setE02PLHNUM(source.getE02PLHNUM());
        destination.setE02PLHRCY(source.getE02PLHRCY());
        destination.setE02PLHFEM(source.getE02PLHFEM());
        destination.setE02PLHFED(source.getE02PLHFED());
        destination.setE02PLHFEY(source.getE02PLHFEY());
        destination.setE02PLHSTA(source.getE02PLHSTA());
        destination.setE02PLHECU(source.getE02PLHECU());
        destination.setE02PLHEID(source.getE02PLHEID());
        destination.setE02PLHENM(source.getE02PLHENM());
        destination.setE02PLHCCU(source.getE02PLHCCU());
        destination.setE02PLHCID(source.getE02PLHCID());
        destination.setE02PLHCNM(source.getE02PLHCNM());
        destination.setE02PLHMA1(source.getE02PLHMA1());
        destination.setE02PLHMA2(source.getE02PLHMA2());
        destination.setE02PLHMA3(source.getE02PLHMA3());
        destination.setE02PLHMA4(source.getE02PLHMA4());
        destination.setE02PLHCTR(source.getE02PLHCTR());
        destination.setE02PLHCTY(source.getE02PLHCTY());
        destination.setE02PLHSTE(source.getE02PLHSTE());
        destination.setE02PLHZPC(source.getE02PLHZPC());
        destination.setE02PLHPOB(source.getE02PLHPOB());
        destination.setE02PLHIAD(source.getE02PLHIAD());
        destination.setE02PLHWEB(source.getE02PLHWEB());
        destination.setE02PLHBNK(source.getE02PLHBNK());
        destination.setE02PLHBRN(source.getE02PLHBRN());
        destination.setE02PLHOFC(source.getE02PLHOFC());
        destination.setE02PLHACO(source.getE02PLHACO());
        destination.setE02PLHPLA(source.getE02PLHPLA());
        destination.setE02PLHPAC(source.getE02PLHPAC());
        destination.setE02PLHMEV(source.getE02PLHMEV());
        destination.setE02PLHPAH(source.getE02PLHPAH());
        destination.setE02PLHPCC(source.getE02PLHPCC());
        destination.setE02PLHPAV(source.getE02PLHPAV());
        destination.setE02PLHPPR(source.getE02PLHPPR());
        destination.setE02PLHPCP(source.getE02PLHPCP());
        destination.setE02PLHPHI(source.getE02PLHPHI());
        destination.setE02PLHPTC(source.getE02PLHPTC());
        destination.setE02PLHPSG(source.getE02PLHPSG());
        destination.setE02PLHAAH(source.getE02PLHAAH());
        destination.setE02PLHACC(source.getE02PLHACC());
        destination.setE02PLHAAV(source.getE02PLHAAV());
        destination.setE02PLHAPR(source.getE02PLHAPR());
        destination.setE02PLHACP(source.getE02PLHACP());
        destination.setE02PLHAHI(source.getE02PLHAHI());
        destination.setE02PLHATC(source.getE02PLHATC());
        destination.setE02PLHASG(source.getE02PLHASG());
        destination.setE02PLHAAM(source.getE02PLHAAM());
        destination.setE02PLHAFP(source.getE02PLHAFP());
        destination.setE02PLHAAC(source.getE02PLHAAC());
        destination.setE02PLHPAM(source.getE02PLHPAM());
        destination.setE02PLHPPG(source.getE02PLHPPG());
        destination.setE02PLHPRE(source.getE02PLHPRE());
        destination.setE02PLHPAP(source.getE02PLHPAP());
        destination.setE02PLHPPN(source.getE02PLHPPN());
        destination.setE02PLHNRP(source.getE02PLHNRP());
        destination.setE02PLHFVM(source.getE02PLHFVM());
        destination.setE02PLHFVD(source.getE02PLHFVD());
        destination.setE02PLHFVY(source.getE02PLHFVY());
        destination.setE02PLHFRM(source.getE02PLHFRM());
        destination.setE02PLHFRD(source.getE02PLHFRD());
        destination.setE02PLHFRY(source.getE02PLHFRY());
        destination.setE02PLHPBR(source.getE02PLHPBR());
        destination.setE02PLHPUS(source.getE02PLHPUS());
        destination.setE02PLHFPM(source.getE02PLHFPM());
        destination.setE02PLHFPD(source.getE02PLHFPD());
        destination.setE02PLHFPY(source.getE02PLHFPY());
        destination.setE02DSCSTA(source.getE02DSCSTA());
        destination.setE02PLHRAM(source.getE02PLHRAM());
	}
	
	protected void procActionPayApplyformSelectedFiltered(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws ServletException,
			IOException {
		
		JBObjList listFilter = (JBObjList) session.getAttribute("ECO024002ListFilter");
		ECO024004Message msg =  calculateTotal(listFilter);
		session.setAttribute("apply", msg);		
		forward("ECO0240_pago_planillas_aplicar.jsp", req, res);				
	}
	
	protected ECO024004Message calculateTotal(JBObjList list){
		//recorremos el arreglo para sumar los montos
		BigDecimal tPLHPAM = new BigDecimal(0);
		BigDecimal tPLHPPG = new BigDecimal(0);
		BigDecimal tPLHPRE = new BigDecimal(0);
		BigDecimal tPLHPAP = new BigDecimal(0);
		BigDecimal tPLHPPN = new BigDecimal(0);
		BigDecimal tPLHNRP = new BigDecimal(0);	
		String ccy="";
		list.initRow();
		while (list.getNextRow()) {
			ECO024002Message form = (ECO024002Message) list.getRecord();
			tPLHPAM = tPLHPAM.add(form.getBigDecimalE02PLHPAM());
			tPLHPPG = tPLHPPG.add(form.getBigDecimalE02PLHPPG());
			tPLHPRE = tPLHPRE.add(form.getBigDecimalE02PLHPRE());;
			tPLHPAP = tPLHPAP.add(form.getBigDecimalE02PLHPAP());
			tPLHPPN = tPLHPPN.add(form.getBigDecimalE02PLHPPN());
			tPLHNRP = tPLHNRP.add(form.getBigDecimalE02PLHNRP());
			if (list.getCurrentRow()==0) ccy = form.getE02PLHRCY();//just firts time			
		}//EoW		
		ECO024004Message msg = new ECO024004Message();
		msg.setE04PLHPAM(tPLHPAM);
		msg.setE04PLHPPG(tPLHPPG);
		msg.setE04PLHPRE(tPLHPRE);
		msg.setE04PLHPAP(tPLHPAP);
		msg.setE04PLHPPN(tPLHPPN);
		msg.setE04PLHNRP(tPLHNRP);
		msg.setE04PLHRCY(ccy);
		return msg;
	}
	
	
	protected void procActionPayApplyformMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ECO0240", req);
			ECO024004Message msg = (ECO024004Message) mp.getMessageRecord("ECO024004", user.getH01USR(), "0005");
			// Sets message with page fields
			msg.setH04SCRCOD("01");
			setMessageRecord(req, msg);
			//Sending message
			mp.sendMessage(msg);
			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			// Sets session with required data				
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);	
				setMessageRecord(req, msg);			
				session.setAttribute("apply", msg);				
				forward("ECO0240_pago_planillas_aplicar.jsp", req, res);	
			} else {
				//send information to each of the selected payroll
				JBObjList list = (JBObjList) session.getAttribute("ECO024002ListFilter");				
				list.initRow();
				while (list.getNextRow()) {
					ECO024002Message form = (ECO024002Message) list.getRecord();				
					ECO024004Message msg1 = (ECO024004Message) mp.getMessageRecord("ECO024004", user.getH01USR(), "0007");
					msg1.setH04SCRCOD("01");
					setMessageRecord(req, msg1);//fill beans with screen fields data payment 
					//CLAVE DEL REGITRO
					msg1.setE04PLHCDE(form.getE02PLHCDE());
					msg1.setE04PLHNUM(form.getE02PLHNUM());
					msg1.setE04PLHRCY(form.getE02PLHRCY());
                    //TOTALES..
					msg1.setE04PLHPAM(form.getE02PLHPAM());
					msg1.setE04PLHPPG(form.getE02PLHPPG());
					msg1.setE04PLHPRE(form.getE02PLHPRE());
					msg1.setE04PLHPAP(form.getE02PLHPAP());
					msg1.setE04PLHPPN(form.getE02PLHPPN());
					msg1.setE04PLHNRP(form.getE02PLHNRP());							
					//Sending message
					mp.sendMessage(msg1);
					//Receive error and data
					MessageRecord msgError2 = mp.receiveMessageRecord();
					if (mp.hasError(msgError2)) {
						msgError = (ELEERRMessage) msgError2;
						break;
					}
				}//EoW
				// Sets session with required data				
				if (mp.hasError(msgError))   {
					session.setAttribute("error", msgError);
					setMessageRecord(req, msg);			
					session.setAttribute("apply", msg);							
					forward("ECO0240_pago_planillas_aplicar.jsp", req, res);	
				} else {
					forwardOnSuccess("ECO0240_pago_planillas_aplicar_process.jsp", req, res);
				}
			}
		} finally {
			if (mp != null) mp.close();
		}
	}

}	




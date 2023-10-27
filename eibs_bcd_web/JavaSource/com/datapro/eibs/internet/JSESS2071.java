package com.datapro.eibs.internet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.internet.beans.JBCards;
import com.datapro.eibs.internet.databeans.DC_CARDS;
import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS200001Message;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 * Comercial Letter Of Credit Maintenance
 */
public class JSESS2071 extends JSEIBSServlet {

	protected static final int R_ASG_CARDS = 100;
	protected static final int A_ASG_CARDS = 200;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_ASG_CARDS :
				Read_Entities(user, req, res, session);
				break;
			case A_ASG_CARDS :
				procAssign_Cards(user, req, res, session);
				break;							
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procAssign_Cards(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		ELEERRMessage msgError = new ELEERRMessage();
		
		String CardI = req.getParameter("CARDI") == null ? "" : req.getParameter("CARDI");
		String CardF = req.getParameter("CARDF") == null ? "" : req.getParameter("CARDF");
		String Entity = req.getParameter("ENTITYID") == null ? "" : req.getParameter("ENTITYID");
		int CardIn = 0;
		int CardFn = 0;
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS2000", req);
			try {
				CardIn = Integer.valueOf(CardI).intValue();
				CardFn = Integer.valueOf(CardF).intValue();
			} catch (Exception e) {
				msgError.setERRNUM("1");
				msgError.setERDS01("Tarjeta Inicial o Final invalida");
				msgError.setERNU01("9001");
				msgError.setERDF01("CARDI");
			}
			if (mp.hasError(msgError)) {
				pageName = "ESS2071_cards_assign.jsp";
			} else {
				JBCards cardbean = new JBCards();
				for (int xi=CardIn; xi<=CardFn; xi++) {
					String RMsg = "";
					String CardSerial = String.valueOf(xi);
					DC_CARDS Card = cardbean.getCardSerial(CardSerial);
            		if (Card.getSTS() == null || !Card.getSERIAL().trim().equals(CardSerial.trim())) {
            			RMsg = "Tarjeta de Vectores : " + CardSerial.trim() + " no existe en archivo";
            		} else if (!"P".equals(Card.getSTS())) {
            			if (!"".equals(Card.getENTITYID())) {
            				RMsg = "Tarjeta de Vectores " + Card.getSERIAL().trim() + ", ya Asignada a otro usuario ( " + Card.getENTITYID() + ")"; 
            			} else {
            				RMsg = "Estatus (" + Card.getSTS() + ") Tarjeta de Vectores no permite ser asignada";
            			}	
            		}
                	if (!"".equals(RMsg)) {
    					msgError.setERDS01(RMsg);	
    		    		msgError.setERNU01("9001");
    		    		msgError.setERRNUM("1");		    		
    		    		msgError.setERDF01("E01EUSOPP");	
    		    		pageName = "ESS2071_cards_assign.jsp";
    		    		break;
                	}
				}
				if (!mp.hasError(msgError)) {
					ESS200001Message msgClient = (ESS200001Message) mp.getMessageRecord("ESS200001");
		            msgClient.setH01USERID(user.getH01USR());
		            msgClient.setH01PROGRM("ESS2000");
		            msgClient.setH01TIMSYS(getTimeStamp());
		            msgClient.setH01FLGWK1("I");
		            msgClient.setH01OPECOD("0002");
		            msgClient.setE01EUSUSR(Entity);
		            
		            mp.sendMessage(msgClient);
		            
					msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
					msgClient = (ESS200001Message) mp.receiveMessageRecord("ESS200001");
		            
					if (mp.hasError(msgError)) {
						pageName = "ESS2071_cards_assign.jsp";
					} else {
						if (!"1".equals(msgClient.getE01EUSCTY())) {
							msgError.setERRNUM("1");
							msgError.setERDS01("Para asignar tarjetas el usuario debe de ser Empresa");
							msgError.setERNU01("9001");
							pageName = "ESS2071_cards_assign.jsp";
						} else {
							for (int xi=CardIn; xi<=CardFn; xi++) {
								DC_CARDS Card = cardbean.getCardSerial(String.valueOf(xi));
							   	Card.setSTS("E");
							   	Card.setENTITYID(Entity);
							   	Card.setUTYPE("1");
							   	cardbean.setUpdateCard(Card);
							}
							pageName = "ESS2071_cards_assign_conf.jsp";
						}
					}
				}
			}
			
            session.setAttribute("error", msgError);
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void Read_Entities(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("lsCards", new BeanList());
		
		forward("ESS2071_cards_assign.jsp", req, res);
	}

}

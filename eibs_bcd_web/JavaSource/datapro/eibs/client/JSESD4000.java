package datapro.eibs.client;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.constants.General;
import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.facade.FAImage;
import com.datapro.eibs.images.vo.SCNIMGViewSignatureRules;
import com.datapro.eibs.images.vo.SCNSIGRULESView;
import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD400001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ETL051002Message;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSESD4000 extends JSEIBSServlet {

	// Action 

	protected static final int R_ENTITY_LIST = 100;
	protected static final int A_ENTITY_LIST_HELP = 105;	
	protected static final int R_NEW = 300;
	protected static final int R_MAINTENANCE = 500;
	protected static final int R_DELETE = 700;
	protected static final int A_MAINTENANCE = 600;
	protected static final int R_INQUIRY_LIST = 800;
	protected static final int R_APPROVAL_INQUIRY_LIST = 850;
	protected static final int R_INQUIRY = 900;
	protected static final int R_APPROVAL = 200;
	protected static final int R_SEQ_IMG = 920;
	protected static final int R_VALIDATION = 930;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case R_ENTITY_LIST :
			case A_ENTITY_LIST_HELP :
				procReqEntityList(user, req, res, session, screen);
				break;
			case R_MAINTENANCE :
				procReqMaintenance(user, req, res, session);
				break;	
			case A_MAINTENANCE :
				procActionMaintenance(user, req, res, session);
				break;	
			case R_NEW :
				procReqNew(user, req, res, session);
				break;
			case R_DELETE :
				procReqDelete(user, req, res, session);
				break;
			case R_APPROVAL_INQUIRY_LIST :
			case R_INQUIRY_LIST :
				procReqInquiryList(user, req, res, session, screen);
				break;		
			case R_INQUIRY :
				procReqInquiry(user, req, res, session);
				break;
			case R_SEQ_IMG :
				procReqInquirySEQIMG(user, req, res, session);
				break;	
			case R_VALIDATION :
				checkRules(user, req, res, session);
				break;	
			default :
				forward(devPage, req, res);
				break;
		}		
	}

	private void procReqInquirySEQIMG(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
					throws ServletException, IOException{
		// TODO Auto-generated method stub
		String recType = "S";
		UserPos userPO = getUserPos(req);
		ETL051002Message msgchk = null;
		
		userPO.setHeader10(recType);
		userPO.setHeader11("SIGNERS");
		MessageProcessor mp = null;
		boolean chk = false;
		userPO.setHeader15("");
		// fecha emision/impresion cheque getE02OFMDAT
		// numero del cheque getE02OFMNCH
		// monto del cheque getE02OFMMCH
		// Cuenta oficina cheque de Gerencia getE02DEBACC
		// ID Beneficiario cheque de Gerencia getE02OFMBID
		// Nombre Beneficiario cheque de Gerencia getE02OFMBNF
		
		try {
			if (req.getParameter("NUMCHK").trim().length() > 0 
					&& !req.getParameter("NUMCHK").trim().equals("0")) {
				msgchk = procReqChkDet(user, req, res, session);
				chk = true;
				userPO.setHeader15("CHK");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		String identifier = "";
		try {
			identifier = req.getParameter("TBLNUM").trim();
		} catch (Exception e) {
			identifier = "0";
		}
		try {
			mp = getMessageProcessor("ESD4000", req);

			ESD400001Message msgList = (ESD400001Message) mp.getMessageRecord("ESD400001");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD4000");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0017");
		 	msgList.setE01SELRTP(recType);
			if (chk) {
				userPO.setAccNum(msgchk.getE02DEBACC());
				userPO.setPorfNum("0");
				msgList.setE01SELRAC(msgchk.getE02DEBACC());
			} else {
				userPO.setPorfNum(identifier);
				msgList.setE01SELRAC(identifier);
			}
			msgList.setE01SELRCD("A");
				
		 	mp.sendMessage(msgList);
		 	
			JBObjList list = mp.receiveMessageRecordList("H01MAS");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				if (!list.isEmpty()) {
					JBListRec beanImg = new JBListRec();
					int colNum = 26;
					beanImg.init(colNum);
					FAImage facade = new FAImage();
					Iterator iterator = list.listIterator();
					while (iterator.hasNext()) {
						msgList = (ESD400001Message) iterator.next();
						
						String dateFrom = Util.formatDate("yyyyMMdd", msgList.getBigDecimalE01IDM().intValue(), msgList.getBigDecimalE01IDD().intValue(), msgList.getBigDecimalE01IDY().intValue());
						String dateTo = Util.formatDate("yyyyMMdd", msgList.getBigDecimalE01DTM().intValue(), msgList.getBigDecimalE01DTD().intValue(), msgList.getBigDecimalE01DTY().intValue());
						
						if (chk && ((dateFrom.length() > 0 && msgchk.getE02OFMDAT().compareTo(dateFrom) < 0)
								|| (dateTo.length() > 0 && msgchk.getE02OFMDAT().compareTo(dateTo) > 0))) {
							continue;
						} else {
							userPO.setAccNum(msgList.getE01RAC());
							try {
								BeanList listSql = facade.getDocTableInqSCSSQ("A", msgList.getE01RAC(), "SC", msgList.getE01SEQ());
								if (listSql.size() > 0) {
									String myRow[] = new String[colNum];								
									for (int k=0; k < colNum; k++) {
										myRow[k] = "";
									}
									listSql.initRow();
									while (listSql.getNextRow()) {
										SCNIMGViewSignatureRules vo = (SCNIMGViewSignatureRules) listSql.getRecord();
										myRow[0] = vo.getTBLDSC().trim();
										String extTemp = myRow[0].substring(myRow[0].lastIndexOf(".")).toLowerCase();
										myRow[1]  = "FIRMAS";
										myRow[2]  = extTemp.substring(1);
										myRow[3]  = vo.getTBLLMM() + "/" + vo.getTBLLMD() + "/" + vo.getTBLLMY();
										myRow[4]  = vo.getTBLSSQ().toString();
										myRow[5]  = vo.getTBLUID().toString();
										myRow[6]  = msgList.getE01NME();
										myRow[7]  = msgList.getE01UC1();
										myRow[16]  = dateFrom;
										myRow[17]  = dateTo;
										myRow[18]  = msgList.getE01RCN();
										myRow[19]  = msgList.getE01RNU();
										
										beanImg.addRow("", myRow);
									}
								}
								
							} catch (FacadeException e) {
								e.printStackTrace();
								throw new ServletException(e);
							}
						}
					}
					if (beanImg.getNoResult()) {
						forward("MISC_no_result.jsp", req, res);
					} else {
						session.setAttribute("listImg", beanImg);
						session.setAttribute("msgchk", msgchk);
						forward("EDI0010_doc_viewer_container_help.jsp", req, res);
					}
				} else {
					forward("MISC_no_result.jsp", req, res);
				}
			}	
		 
		} finally {
			if (mp != null)
					mp.close();
		}
	}
	
	private void checkRules(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		
		BigDecimal amount = Util.parseBigDecimal(req.getParameter("AMOUNT"));
		String[] values = req.getParameterValues("RULES");
		if (values == null) 
			values = new String[0];
		
		Arrays.sort(values);
		String rule = "";
		for (int i = 0; i < values.length; i++) {
			rule += values[i];
		}
		if (rule.length() > 0) {
			FAImage facade = new FAImage();
			try {
				BeanList listSql = facade.getDocTableInqSCRUL(userPO.getAccNum().trim());
				if (listSql.size() > 0) {
					listSql.initRow();
					while (listSql.getNextRow()) {
						SCNSIGRULESView vo = (SCNSIGRULESView) listSql.getRecord();
						if (vo.getSIGRULE().toString().equalsIgnoreCase(rule)) {
							if (!vo.getSTATUS().toString().equals("1")) { //Inactive
								sendResponse(res, "Estatus de la regla de Firma " + rule + " es Inactiva.!", "txt");
							} else {
								String datefrom = Util.formatDate("yyyyMMdd", vo.getMONTHFROM().intValue(), vo.getDAYFROM().intValue(), vo.getYEARFROM().intValue()); 
								String dateto = Util.formatDate("yyyyMMdd", vo.getMONTHTO().intValue(), vo.getDAYTO().intValue(), vo.getYEARTO().intValue());
								String wrkdate = Util.formatDate("yyyyMMdd", Integer.parseInt(user.getE01RDM()), Integer.parseInt(user.getE01RDD()), Integer.parseInt(user.getE01RDY()));
								
								if (datefrom.length() > 0 && wrkdate.compareTo(datefrom) < 0) {
									sendResponse(res, "Fecha de vigencia de la Regla de Firma " + rule + " no Coincide.!", "txt");
								} else if (dateto.length() > 0 && wrkdate.compareTo(dateto) > 0) {
									sendResponse(res, "Fecha de vigencia de la Regla de Firma " + rule + " no Coincide.!", "txt");
								}
							}
							if (amount.compareTo(General.ZERO) <= 0) {
								sendResponse(res, "Debe ingresar un monto para la validacion de la firma.", "txt");
							} else if (vo.getAMOUNT().compareTo(General.ZERO) > 0 && amount.compareTo(vo.getAMOUNT()) > 0) {
								sendResponse(res, "Monto limite excedido para la Regla de Firma " + rule + ".", "txt");
							}
							sendResponse(res, "Validacion de Regla de Firma " + rule + " ha sido exitosa.!", "txt");
						}
					}	
					sendResponse(res, "La Regla de Firma " + rule + " no esta definida.!", "txt");
				} else {
					sendResponse(res, "No se encontraron Reglas de Firmas Registradas.", "txt");
				}
			} catch (FacadeException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error accediendo a la base de datos, por favor contacte al administrador del Sistema");
			}
		} else {
			sendResponse(res, "Debe seleccionar al menos una secuencia de firmas.", "txt");
		}
	}
	
	private ETL051002Message procReqChkDet(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		ELEERRMessage msgError = new ELEERRMessage();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ETL0510", req);
			ETL051002Message msg = (ETL051002Message) mp.getMessageRecord("ETL051002", user.getH01USR(), "0017");
		
			String bank = (req.getParameter("BNK") == null) ? "01" : req.getParameter("BNK");
			msg.setE02OFMBNK(bank);
			String branch = (req.getParameter("BRN") == null) ? "0" : req.getParameter("BRN");
			msg.setE02OFMBRN(branch);
			String currency = (req.getParameter("CCY") == null) ? "" : req.getParameter("CCY");
			msg.setE02OFMCCY(currency);
			String amount = (req.getParameter("AMT") == null) ? "0.00" : req.getParameter("AMT");
			msg.setE02OFMMCH(amount);
			String check = (req.getParameter("NUMCHK") == null) ? "" : req.getParameter("NUMCHK");
			msg.setE02OFMNCH(check);
			
			mp.sendMessage(msg);
			
			MessageRecord newmsg = mp.receiveMessageRecord();
			
			if (mp.hasError(newmsg)) {
				msgError = (ELEERRMessage) newmsg;
				session.setAttribute("error", msgError);
				res.setContentType("text/html");
				printClose(res.getWriter());
			} else {
				msg = (ETL051002Message) newmsg; 
				userPO.setHeader16(msg.getE02OFMDAT());
				userPO.setHeader17(msg.getE02OFMNCH());
				userPO.setHeader18(msg.getE02OFMMCH());
				userPO.setHeader19(msg.getE02DEBACC());
				return msg;
			}
			return null;
			
		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqEntityList(  ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen)
		throws ServletException, IOException {
		
		String searchType; String refFallBack; String recType;
		UserPos userPO = getUserPos(req);
		
		recType =  Util.getReqParameter("RECTYP", req);
		userPO.setHeader10(recType);
		userPO.setPurpose("MAINTENANCE");

		MessageProcessor mp = null;
		try {
			//Determine Search By Customer or Account.
			//If from help.js, use Req Parameter, otherwise use userPO
			if(screen == A_ENTITY_LIST_HELP){
				searchType = Util.getReqParameter("SRCHTYP", req, "C").toUpperCase();
			} else {
				searchType = userPO.getSearchType().equalsIgnoreCase("account") ? "A" : "C";
			}
			refFallBack = searchType.equals("A") ? userPO.getAccNum() : userPO.getCusNum();
			
			//Begin Sending Message
			mp = getMessageProcessor("ESD4000", req);

			ESD400001Message msgList = (ESD400001Message) mp.getMessageRecord("ESD400001");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD4000");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0015");
		 	msgList.setE01SELRTP(recType);
			msgList.setE01SELRAC(Util.getReqParameter("REFNUM", req , refFallBack));
			msgList.setE01SELRCD(searchType);

		 	mp.sendMessage(msgList);
		 	
			JBObjList list = mp.receiveMessageRecordList("H01MAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("ESD400001List", list);

				String page = "ESD4000_entity_list.jsp"	;
				page = screen == A_ENTITY_LIST_HELP ? "ESD4000_entity_list_help.jsp" : page;
				forwardOnSuccess(page,req, res);
			}	

		} finally {
			if (mp != null)	mp.close();
		}
	}


protected void procReqMaintenance( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		MessageProcessor mp = null;		
		UserPos userPO = getUserPos(req);
	 	JBObjList list = (JBObjList) session.getAttribute("ESD400001List");
	 	ESD400001Message wrkElem = (ESD400001Message) list.get(Util.parseInt(req.getParameter("ROW")));
	 	ESD400001Message msgElement = (ESD400001Message) wrkElem.clone();	
	 	try {
			mp = getMessageProcessor("ESD4000", req);

			msgElement.setH01USR(user.getH01USR());
			msgElement.setH01PGM("ESD4000");
			msgElement.setH01TIM(getTimeStamp());
			msgElement.setH01SCR("01");
			msgElement.setH01OPE("0002");
			msgElement.setH01WK1( "APPROVAL_INQ".equals(userPO.getPurpose()) ? "A" : "");	
		 	setMessageRecord(req, msgElement);
		 	mp.sendMessage(msgElement);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
		 	msgElement = (ESD400001Message) mp.receiveMessageRecord();
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("entity", msgElement);

			if (!mp.hasError(msgError)) {				
				forward("ESD4000_entity_maintenance.jsp", req, res);
			} else {	
				session.setAttribute("ESD400001List", session.getAttribute("ESD400001List"));
				forward("ESD4000_entity_list.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
  }	
  	
protected void procActionMaintenance( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;		
		
		try {			
			mp = getMessageProcessor("ESD4000", req);
			ESD400001Message msgList = (ESD400001Message) session.getAttribute("entity");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD4000");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0005");
			
			if(userPO.getSearchType().equalsIgnoreCase("account")){
				msgList.setE01RAC(userPO.getAccNum());
				msgList.setE01RCD("A");
			} else {
				msgList.setE01RAC(userPO.getCusNum());
				msgList.setE01RCD("C");
			}
			setMessageRecord(req, msgList);
		 	mp.sendMessage(msgList);
		 	
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
		 	msgList = (ESD400001Message) mp.receiveMessageRecord();
            
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("entity", msgList);
			
			if (!mp.hasError(msgError)) {
				redirectToPage("/servlet/datapro.eibs.client.JSESD4000?SCREEN=100&RECTYP=" +userPO.getHeader10(), res);
			} else {	
				forward("ESD4000_entity_maintenance.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
    }

protected void procReqNew( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ESD4000", req);
			ESD400001Message msgList = (ESD400001Message) mp.getMessageRecord("ESD400001");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD4000");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0001");
			msgList.setE01SELRTP(userPO.getHeader10());
			msgList.setE01SELRCN(Util.getReqParameter("TYPE", req));
			msgList.setE01SELRNU(Util.getReqParameter("REFNUM", req, "0"));
			
			if(userPO.getSearchType().equalsIgnoreCase("account")){
				msgList.setE01SELRAC(userPO.getAccNum());
				msgList.setE01SELRCD("A");
			} else {
				msgList.setE01SELRAC(userPO.getCusNum());
				msgList.setE01SELRCD("C");
			}			
		 	mp.sendMessage(msgList);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (ESD400001Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("entity", msgList);
				forward("ESD4000_entity_maintenance.jsp", req, res);
			} else {	
				session.setAttribute("error", msgError);
				forward("ESD4000_entity_list.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
  }	

protected void procReqDelete( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		MessageProcessor mp = null;		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("MAINTENANCE");

	 	JBObjList list = (JBObjList) session.getAttribute("ESD400001List");
	 	ESD400001Message wrkElem = (ESD400001Message) list.get(Util.parseInt(req.getParameter("ROW")));
	 	ESD400001Message msgElement = (ESD400001Message) wrkElem.clone();		
	 	try {			
			mp = getMessageProcessor("ESD4000", req);

			msgElement.setH01USR(user.getH01USR());
			msgElement.setH01PGM("ESD4000");
			msgElement.setH01TIM(getTimeStamp());
			msgElement.setH01SCR("01");
			msgElement.setH01OPE("0009");
		 	mp.sendMessage(msgElement);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			if (!mp.hasError(msgError)) {
				redirectToPage("/servlet/datapro.eibs.client.JSESD4000?SCREEN=100&RECTYP=" +userPO.getHeader10(), res);
			} else {	
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
  }	

protected void procReqInquiryList( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen)
		throws ServletException, IOException {
		
		String recType = Util.getReqParameter("RECTYP", req);
		UserPos userPO = getUserPos(req);
		
		if (userPO.getPurpose() == null) {
			userPO.setPurpose(screen == R_INQUIRY_LIST ? "INQUIRY" : "APPROVAL_INQ");			
		}
		
		userPO.setHeader10(recType);		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD4000", req);

			ESD400001Message msgList = (ESD400001Message) mp.getMessageRecord("ESD400001");
			msgList.setH01USR(user.getH01USR());
			msgList.setH01PGM("ESD4000");
			msgList.setH01TIM(getTimeStamp());
			msgList.setH01SCR("01");
			msgList.setH01OPE("0015");
		 	msgList.setE01SELRTP(recType);
		 	msgList.setH01WK1("I"); // inquiry
		 	if(!userPO.getPurpose().equals("INQUIRY")){
		 		msgList.setH01WK1(""); 
		 	}

			if(userPO.getSearchType().equalsIgnoreCase("account")){
				msgList.setE01SELRAC(userPO.getAccNum());
				msgList.setE01SELRCD("A");
			} else {
				msgList.setE01SELRAC(userPO.getCusNum());
				msgList.setE01SELRCD("C");
			}	
		 	mp.sendMessage(msgList);
		 	
			JBObjList list = mp.receiveMessageRecordList("H01MAS");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("ESD400001List", list);
				forwardOnSuccess("ESD4000_entity_list.jsp", req, res);
			}	

		} finally {
			if (mp != null)	mp.close();
		}
	}

protected void procReqInquiry( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		MessageProcessor mp = null;		
		UserPos userPO = getUserPos(req);
	 	JBObjList list = (JBObjList) session.getAttribute("ESD400001List");
	 	ESD400001Message wrkElem = (ESD400001Message) list.get(Util.parseInt(req.getParameter("ROW")));
	 	ESD400001Message msgElement = (ESD400001Message) wrkElem.clone();
	
		try {			
			mp = getMessageProcessor("ESD4000", req);

			msgElement.setH01USR(user.getH01USR());
			msgElement.setH01PGM("ESD4000");
			msgElement.setH01TIM(getTimeStamp());
			msgElement.setH01SCR("01");
			msgElement.setH01OPE("0004");
			msgElement.setH01WK1("I"); //inquiry
		 	mp.sendMessage(msgElement);
		 
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
		 	msgElement = (ESD400001Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("entity", msgElement);
				forward("ESD4000_entity_maintenance.jsp", req, res);
			} else {	
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			}				

		} finally {
			if (mp != null)	mp.close();
		}
  }	

 }	




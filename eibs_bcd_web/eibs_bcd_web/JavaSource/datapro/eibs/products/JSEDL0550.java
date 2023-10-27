package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generic.beanutil.BeanCopier;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EDL055001Message;
import datapro.eibs.beans.EDL055002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageRecord;

@SuppressWarnings("serial")
public class JSEDL0550 extends JSEIBSServlet {

	protected static final int A_LIST          = 500;
	protected static final int R_NEW           = 200;
	protected static final int R_MAINT         = 300;
	protected static final int R_DELETE        = 400;
	protected static final int A_MAINT         = 600;
	protected static final int A_APPROVAL      = 601;
	protected static final int R_DETAIL_LIST   = 700;

	protected static final int R_DETAIL_ADD    = 701;
	protected static final int A_DETAIL_ADD    = 702;
	protected static final int A_DETAIL_DELETE = 703;
	protected static final int R_DETAIL_SEARCH = 704;

	protected static final int A_CREAR_PAQ     = 1300;
	protected static final int A_RECAL_PAQ     = 1400;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {

			case A_LIST:
				procActionList(user, req, res, session);
				break;
			case R_NEW:
				procReqNew(user, req, res, session,"NEW");
				break;
			case R_MAINT:
				procReqMaint(user, req, res, session,"MAINTENANCE");
				break;
			case R_DELETE:
				procReqDelete(user, req, res, session, "DELETE");
				break;
			case A_MAINT:
				procActionMaintenance(user, req, res, session);
				break;
			case A_APPROVAL:
				procActionApproval(user, req, res, session);
				break;
			case R_DETAIL_LIST:
				procReqDetailList(user, req, res, session);
				break;

			case R_DETAIL_ADD:
				procReqDetailAdd(user, req, res, session);
				break;
			case A_DETAIL_ADD:
				procActionDetailAdd(user, req, res, session);
				break;
			case A_DETAIL_DELETE:
				procActionDetailDelete(user, req, res, session);
				break;
			case R_DETAIL_SEARCH:
				procReqDetailSearch(user, req, res, session);
				break;	

			case A_CREAR_PAQ:
				procActionCrearPaq(user, req, res, session);
				break;
			case A_RECAL_PAQ:
				procActionRecalPaq(user, req, res, session);
				break;
				
			default:
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}
	
	private void procActionList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);

		try {
			mp = getMessageProcessor("EDL0550", req);
			EDL055001Message msg = (EDL055001Message) mp.getMessageRecord("EDL055001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0550");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			session.setAttribute("userpPO", userPO);
			session.setAttribute("EDL055001List", list);
			forward("EDL0550_planes_fomento_activos_list.jsp", req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}	

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, String option) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		userPO.setPurpose(option);
		userPO.setCusName(userPO.getCusName());

		try {
			mp = getMessageProcessor("EDL0550", req);
			EDL055001Message msgNew = (EDL055001Message) mp.getMessageRecord("EDL055001");
			msgNew.setH01USERID(user.getH01USR());
			msgNew.setH01PROGRM("EDL0550");
			msgNew.setH01TIMSYS(getTimeStamp());
			msgNew.setH01SCRCOD("01");
			msgNew.setH01OPECOD("0001");
			
			msgNew.setE01PDSCOD(req.getParameter("E01PDSCOD"));
	
			mp.sendMessage(msgNew);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgNew = (EDL055001Message) mp.receiveMessageRecord("EDL055001");
			msgNew.setE01CUSNA1(userPO.getCusName());
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDL0550_planes_fomento_activos_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("recData", msgNew);
				session.setAttribute("error", msgError);
				forward("EDL0550_plan_fomento_activos_detalles.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, String option) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		userPO.setPurpose(option);
		EDL055001Message listMessage = null;
		userPO.setCusName(userPO.getCusName());

		try {
			mp = getMessageProcessor("EDL0550", req);
			
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EDL055001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EDL055001Message)list.get(index);
			}
			
			EDL055001Message msgMaint = (EDL055001Message) mp.getMessageRecord("EDL055001");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EDL0550");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
			msgMaint.setH01OPECOD("0004");
			if (listMessage == null) {
				msgMaint.setE01PDSCOD(req.getParameter("E01PDSCOD").trim());
			} else {
				msgMaint.setE01PDSCOD(listMessage.getE01PDSCOD());
			}
	
			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (EDL055001Message) mp.receiveMessageRecord("EDL055001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDL0550_planes_fomento_activos_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("recData", msgMaint);
				session.setAttribute("error", msgError);
				forward("EDL0550_plan_fomento_activos_detalles.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, String option) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		userPO.setPurpose(option);
		userPO.setCusName(userPO.getCusName());

		try {
			mp = getMessageProcessor("EDL0550", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL055001List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			EDL055001Message listMessage = (EDL055001Message)list.get(index);
			
			EDL055001Message msgDelete = (EDL055001Message) mp.getMessageRecord("EDL055001");
			msgDelete.setH01USERID(user.getH01USR());
			msgDelete.setH01PROGRM("EDL0550");
			msgDelete.setH01TIMSYS(getTimeStamp());
			msgDelete.setH01SCRCOD("01");
			msgDelete.setH01OPECOD("0009");
			
			msgDelete.setE01PDSCOD(listMessage.getE01PDSCOD());

			mp.sendMessage(msgDelete);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EDL0550_planes_fomento_activos_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0550", req);
			EDL055001Message msg = (EDL055001Message) session.getAttribute("recData");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0550");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			msg.setE01PDSCOD(req.getParameter("E01PDSCOD").trim());
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL055001Message) mp.receiveMessageRecord("EDL055001");

			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("recData",	msg);
				forward("EDL0550_plan_fomento_activos_detalles.jsp", req, res);
			} else {
				procActionList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0550", req);
			EDL055001Message msg = (EDL055001Message) session.getAttribute("recData");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0550");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			msg.setH01FLGWK1("A");
			msg.setE01PDSCOD(req.getParameter("E01PDSCOD").trim());
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL055001Message) mp.receiveMessageRecord("EDL055001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("recData", msg);
				forward("EDL0550_plan_detalle_activos_list.jsp", req, res);
			} else {
				procActionList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqDetailList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EDL055001Message listMessage = null;
		EDL055002Message listDetail = null;
		String pdscod = "";

		try {
			mp = getMessageProcessor("EDL0550", req);
				
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EDL055001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EDL055001Message)list.get(index);
				pdscod = listMessage.getE01PDSCOD();
			}
			
			if (req.getParameter("keyDetail") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EDL055002Loans");
				int index = Integer.parseInt(req.getParameter("keyDetail").trim());
				listDetail = (EDL055002Message)list.get(index);
				pdscod = listDetail.getE02PDTCOD();
			}

			EDL055001Message msg = (EDL055001Message) mp.getMessageRecord("EDL055001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0550");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0007");
								
			if ((listMessage == null) && (listDetail == null)) {
				pdscod = req.getParameter("E01PDSCOD").trim();
			}
			
			msg.setE01PDSCOD(pdscod);

			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL055001Message) mp.receiveMessageRecord("EDL055001");
			
			JBObjList list1 = mp.receiveMessageRecordList("H02FLGMAS");
			session.setAttribute("userpPO", userPO);
			session.setAttribute("EDL055002Loans", list1);
			session.setAttribute("recData", msg);
			forward("EDL0550_plan_detalle_activos_list.jsp", req, res);
		
		} finally {
			if (mp != null) mp.close();
		}
	}	
	
	private void procReqDetailAdd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		EDL055002Message list1 = null;
		
		session.setAttribute("EDL055002Loans", list1);
		forward("EDL0550_plan_buscar_activos_list.jsp", req, res);

	}	

	private void procActionDetailAdd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		EDL055002Message msgCrear = null;
		
		JBObjList loansList = (JBObjList) session.getAttribute("EDL055002Loans");
		String sel = "";
		
		MessageProcessor mp = null;
				
		// Recorre la lista
		for (int i = 0; i < loansList.size(); i++) {
			sel = req.getParameter("E02PDTSEL_" + i) == null ? "N" : req.getParameter("E02PDTSEL_" + i);
			// Graba los registros seleccionados
			if (sel.equals("Y")) {
				if (loansList.get(i)  instanceof EDL055002Message) {
					mp = getMessageProcessor("EDL0550", req);
					msgCrear = (EDL055002Message) loansList.get(i);
					try {
						msgCrear.setH02USERID(user.getH01USR());
						msgCrear.setH02PROGRM("EDL0550");
						msgCrear.setH02TIMSYS(getTimeStamp());
						msgCrear.setH02SCRCOD("01");
						msgCrear.setH02OPECOD("1001");
						mp.sendMessage(msgCrear);
					} finally {
						if (mp != null)	mp.close();
					}
				}
			}	
		}
		
		req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
		procReqDetailAdd(user, req, res, session);
		
	}	
	
	private void procActionDetailDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("EDL0550", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL055002Loans");
			int index = Integer.parseInt(req.getParameter("keyDetail").trim());
			EDL055002Message listMessage = (EDL055002Message)list.get(index);
			
			EDL055002Message msg = (EDL055002Message) mp.getMessageRecord("EDL055002");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0550");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("1009");
			
			msg.setE02PDTCOD(listMessage.getE02PDTCOD());
			msg.setE02PDTSEQ(listMessage.getE02PDTSEQ());
			msg.setE02PDTACC(listMessage.getE02PDTACC());
			msg.setE02DEAUC7(req.getParameter("E02DEAUC7") == null ? "" : req.getParameter("E02DEAUC7").trim());

			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procReqDetailList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EDL0550_plan_detalle_activos_list.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	
	}	

	private void procReqDetailSearch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);

		try {
			mp = getMessageProcessor("EDL0550", req);
			EDL055001Message header = (EDL055001Message) session.getAttribute("recData");
			EDL055001Message msg = (EDL055001Message) mp.getMessageRecord("EDL055001");
				
			BeanCopier.populate(header, msg);
			
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0550");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0016");
			msg.setH01TIMSYS(getTimeStamp());
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
			msg = (EDL055001Message) mp.receiveMessageRecord("EDL055001");
			session.setAttribute("userpPO", userPO);
			session.setAttribute("EDL055002Loans", list);
			session.setAttribute("recData", msg);
			forward("EDL0550_plan_buscar_activos_list.jsp", req, res);
	
		} finally {
			if (mp != null) mp.close();
		}

	}	
	
	private void procActionCrearPaq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		UserPos userPO = getUserPos(req);
		
		JBObjList bl = (JBObjList) session.getAttribute("EDL055002Loans");
		int idx = req.getParameter("E02PDTSEL")==null?0:req.getParameter("E02PDTSEL").equals("")?0:Integer.parseInt(req.getParameter("E02PDTSEL"));								
		bl.setCurrentRow(idx);	
						
		MessageProcessor mp = null;
				
		try {
			mp = getMessageProcessor("EDL0550", req);
										
			EDL055002Message msgCrear = (EDL055002Message)bl.get(idx);
					
			msgCrear.setH02USERID(user.getH01USR());
			msgCrear.setH02PROGRM("EDL0550");
			msgCrear.setH02TIMSYS(getTimeStamp());
			msgCrear.setH02SCRCOD("01");
			msgCrear.setH02OPECOD("1001");
					
			mp.sendMessage(msgCrear);
				
			procActionList(user, req, res, session);
					
		} finally {
			if (mp != null)	mp.close();
		}
		
	}
	
	private void procActionRecalPaq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		forward("EDL0550_plan_buscar_activos_list.jsp", req, res);
				
	}
			
	private void procActionDataBuscar(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);

		try {
			mp = getMessageProcessor("EDL0550", req);
			EDL055001Message header = (EDL055001Message) session.getAttribute("recData");
			EDL055001Message msg = (EDL055001Message) mp.getMessageRecord("EDL055001");
				
			BeanCopier.populate(header, msg);
			
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0550");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0016");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setE01PDSREC(req.getParameter("E01PDSRCS"));
			msg.setE01PDSPLZ(req.getParameter("E01PDSPLZ"));
			msg.setE01PDSCAL(req.getParameter("E01PDSCAL"));
			msg.setE01PDSFFM(req.getParameter("E01PDSFFM"));
			msg.setE01PDSFFD(req.getParameter("E01PDSFFD"));
			msg.setE01PDSFFA(req.getParameter("E01PDSFFA"));
			msg.setE01PDSFTM(req.getParameter("E01PDSFTM"));
			msg.setE01PDSFTD(req.getParameter("E01PDSFTD"));
			msg.setE01PDSFTA(req.getParameter("E01PDSFTA"));
			msg.setE01PDSAMT(req.getParameter("E01PDSAMT"));
			msg.setE01PDSSUC(req.getParameter("E01PDSSUC"));
								
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
			msg = (EDL055001Message) mp.receiveMessageRecord("EDL055001");
			session.setAttribute("userpPO", userPO);
			session.setAttribute("EDL055002Loans", list);
			session.setAttribute("recData", msg);
			forward("EDL0550_plan_buscar_activos_list.jsp", req, res);
	
		} finally {
			if (mp != null) mp.close();
		}

	}	

}	

package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL053501Message;
import datapro.eibs.beans.EDL053502Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0535 extends JSEIBSServlet {

	protected static final int R_ENTER = 100;
	protected static final int R_PRODUCT_LIST = 200;
	protected static final int A_PRODUCT_NEW = 201;
	protected static final int A_PRODUCT_DELETE = 202;
	protected static final int R_TASA_LIST = 300;
	protected static final int R_TASA_NEW = 301;
	protected static final int R_TASA_MAINT = 302;
	protected static final int R_TASA_DELETE = 303;
	protected static final int A_TASA_MAINT = 400;

	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
			case R_ENTER:
				procReqEnter(user, req, res, session);
				break;
			case R_PRODUCT_LIST:
				procReqProductList(user, req, res, session);
				break;
			case A_PRODUCT_NEW:
				procActionProductNew(user, req, res, session);
				break;
			case A_PRODUCT_DELETE:
				procActionProductDelete(user, req, res, session);
				break;
			case R_TASA_LIST:
				procReqTasaList(user, req, res, session);
				break;
			case R_TASA_NEW:
				procReqTasaNew(user, req, res, session);
				break;
			case R_TASA_MAINT:
				procReqTasaMaint(user, req, res, session);
				break;
			case R_TASA_DELETE:
				procReqTasaDelete(user, req, res, session);
				break;
			case A_TASA_MAINT:
				procActionTasaMaint(user, req, res, session);
				break;
			default:
				break;
		}

	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		forward("EDL0535_enter_bank_search.jsp", req, res);
		
	}

	private void procReqProductList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0535", req);
			EDL053501Message prodList = (EDL053501Message) mp.getMessageRecord("EDL053501");
			prodList.setH01USERID(user.getH01USR());
			prodList.setH01PROGRM("EDL0535");
			prodList.setH01TIMSYS(getTimeStamp());
			prodList.setH01SCRCOD("01");
			prodList.setH01OPECOD("0015");
			
			if(req.getParameter("E01MRTBNK") == null){
				prodList.setE01MRTBNK(userPO.getBank());
			} else {
				prodList.setE01MRTBNK(req.getParameter("E01MRTBNK"));
				userPO.setBank(prodList.getE01MRTBNK());
			}
			if(req.getParameter("E01MRTCCY") == null){
				prodList.setE01MRTCCY(userPO.getCurrency());
			} else {
				prodList.setE01MRTCCY(req.getParameter("E01MRTCCY"));
				userPO.setCurrency(prodList.getE01MRTCCY());
			}
			if(userPO.getProdCode().equals("")){
				userPO.setProdCode(prodList.getE01MRTPRD());
			} else {
				prodList.setE01MRTPRD(userPO.getProdCode());
			}
			
			mp.sendMessage(prodList);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				session.setAttribute("userPO", userPO);

				forward("EDL0535_enter_bank_search.jsp", req, res);
			} else {
				session.setAttribute("prodList",list);
				session.setAttribute("userPO", userPO);

				forward("EDL0535_product_list.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionProductNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0535", req);
			EDL053501Message msgData = (EDL053501Message) mp.getMessageRecord("EDL053501");
			msgData.setH01USERID(user.getH01USR());
			msgData.setH01PROGRM("EDL0535");
			msgData.setH01TIMSYS(getTimeStamp());
			msgData.setH01SCRCOD("01");
			msgData.setH01OPECOD("0001");
			msgData.setE01MRTBNK(userPO.getBank());
			msgData.setE01MRTCCY(userPO.getCurrency());
			msgData.setE01MRTPRD(req.getParameter("E01MRTPRD"));
			msgData.setE01MRTDSC(req.getParameter("E01MRTDSC"));

			mp.sendMessage(msgData);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgData = (EDL053501Message) mp.receiveMessageRecord("EDL053501");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);

				forward("EDL0535_product_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				procReqProductList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionProductDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0535", req);
	
			JBObjList listPrevious = (JBObjList)session.getAttribute("prodList");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL053501Message listMessage = (EDL053501Message)listPrevious.get(index);

			EDL053501Message msgData = (EDL053501Message) mp.getMessageRecord("EDL053501");
			msgData.setH01USERID(user.getH01USR());
			msgData.setH01TIMSYS(getTimeStamp());
			msgData.setH01SCRCOD("01");
			msgData.setH01OPECOD("0009");	
			msgData.setE01MRTBNK(userPO.getBank());
			msgData.setE01MRTCCY(userPO.getCurrency());
			msgData.setE01MRTPRD(listMessage.getE01MRTPRD());
			msgData.setE01MRTDSC(listMessage.getE01MRTDSC());
			
			mp.sendMessage(msgData);
			
			ELEERRMessage msgError = (ELEERRMessage) mp .receiveMessageRecord("ELEERR");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);

				forward("EDL0535_product_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				procReqProductList(user, req, res, session);
			}
		} finally {
			if (mp != null)
				mp.close();
		}		
	}

	private void procReqTasaList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0535", req);
			
			try {
				JBObjList listPrevious = (JBObjList)session.getAttribute("prodList");
				int index = Integer.parseInt(req.getParameter("key").trim());
				
				EDL053501Message listMessage = (EDL053501Message)listPrevious.get(index);
				
				EDL053502Message tasaList = (EDL053502Message) mp.getMessageRecord("EDL053502");
				tasaList.setH02USERID(user.getH01USR());
				tasaList.setH02PROGRM("EDL0535");
				tasaList.setH02TIMSYS(getTimeStamp());
				tasaList.setH02SCRCOD("01");
				tasaList.setH02OPECOD("0015");
				tasaList.setE02MRTBNK(listMessage.getE01MRTBNK());
				tasaList.setE02MRTCCY(listMessage.getE01MRTCCY());
				tasaList.setE02MRTPRD(listMessage.getE01MRTPRD());
				userPO.setProdCode(tasaList.getE02MRTPRD());

				mp.sendMessage(tasaList);	
			} catch (Exception e) {
				EDL053502Message tasaList = (EDL053502Message) mp.getMessageRecord("EDL053502");
				tasaList.setH02USERID(user.getH01USR());
				tasaList.setH02PROGRM("EDL0535");
				tasaList.setH02TIMSYS(getTimeStamp());
				tasaList.setH02SCRCOD("01");
				tasaList.setH02OPECOD("0015");
				tasaList.setE02MRTBNK(userPO.getBank());
				tasaList.setE02MRTCCY(userPO.getCurrency());
				tasaList.setE02MRTPRD(userPO.getProdCode());

				mp.sendMessage(tasaList);	
			}

			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				session.setAttribute("userPO", userPO);

				forward("EDL0535_product_list.jsp", req, res);
			} else {
				session.setAttribute("tasaList",list);				
				session.setAttribute("userPO", userPO);

				forward("EDL0535_tasa_list.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqTasaNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);

		EDL053502Message msgData = new EDL053502Message();
		msgData.setE02MRTBNK(userPO.getBank());
		msgData.setE02MRTCCY(userPO.getCurrency());
		msgData.setE02MRTPRD(userPO.getProdCode());
		msgData.setE02MRTPDM(user.getE01RDM());
		msgData.setE02MRTPDD(user.getE01RDD());
		msgData.setE02MRTPDY(user.getE01RDY());
		
		session.setAttribute("data", msgData);
		forward("EDL0535_tasa_maint.jsp", req, res);
	}

	private void procReqTasaMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		
		JBObjList listPrevious = (JBObjList)session.getAttribute("tasaList");
		int index = Integer.parseInt(req.getParameter("index").trim());
		
		EDL053502Message listMessage = (EDL053502Message)listPrevious.get(index);

		EDL053502Message msgData = new EDL053502Message();
		msgData.setE02MRTBNK(userPO.getBank());
		msgData.setE02MRTCCY(userPO.getCurrency());
		msgData.setE02MRTPRD(userPO.getProdCode());
		msgData.setE02MRTPDM(listMessage.getE02MRTPDM());
		msgData.setE02MRTPDD(listMessage.getE02MRTPDD());
		msgData.setE02MRTPDY(listMessage.getE02MRTPDY());
		msgData.setE02MRTTMI(listMessage.getE02MRTTMI());
		msgData.setE02MRTTMM(listMessage.getE02MRTTMM());
		msgData.setE02MRTTTA(listMessage.getE02MRTTTA());
		
		session.setAttribute("data", msgData);

		forward("EDL0535_tasa_maint.jsp", req, res);
	}

	private void procReqTasaDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0535", req);
	
			JBObjList listPrevious = (JBObjList)session.getAttribute("tasaList");
			int index = Integer.parseInt(req.getParameter("index").trim());
			
			EDL053502Message listMessage = (EDL053502Message)listPrevious.get(index);

			EDL053502Message msgData = (EDL053502Message) mp.getMessageRecord("EDL053502");
			msgData.setH02USERID(user.getH01USR());
			msgData.setH02TIMSYS(getTimeStamp());
			msgData.setH02SCRCOD("01");
			msgData.setH02OPECOD("0009");	
			msgData.setE02MRTBNK(userPO.getBank());
			msgData.setE02MRTCCY(userPO.getCurrency());
			msgData.setE02MRTPRD(userPO.getProdCode());
			msgData.setE02MRTPDM(listMessage.getE02MRTPDM());
			msgData.setE02MRTPDD(listMessage.getE02MRTPDD());
			msgData.setE02MRTPDY(listMessage.getE02MRTPDY());
			msgData.setE02MRTTMI(listMessage.getE02MRTTMI());
			msgData.setE02MRTTMM(listMessage.getE02MRTTMM());
			msgData.setE02MRTTTA(listMessage.getE02MRTTTA());
			
			mp.sendMessage(msgData);
			
			ELEERRMessage msgError = (ELEERRMessage) mp .receiveMessageRecord("ELEERR");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);

				forward("EDL0535_tasa_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				procReqTasaList(user, req, res, session);
			}
		} finally {
			if (mp != null)
				mp.close();
		}		
		
	}

	private void procActionTasaMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0535", req);
			EDL053502Message msgData = (EDL053502Message) mp.getMessageRecord("EDL053502");
		 	msgData.setH02USERID(user.getH01USR());
		 	msgData.setH02PROGRM("EDL0535");
		 	msgData.setH02TIMSYS(getTimeStamp());
		 	msgData.setH02SCRCOD("01");
			msgData.setH02OPECOD("0005");
			
		 	setMessageRecord(req,msgData);

			msgData.setH02OPECOD("0005");		 	
			msgData.setE02MRTBNK(userPO.getBank());
			msgData.setE02MRTCCY(userPO.getCurrency());
			msgData.setE02MRTPRD(userPO.getProdCode());
			
			mp.sendMessage(msgData);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgData = (EDL053502Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("data", msgData);
				req.setAttribute("ACT","S");
				forward("EDL0535_tasa_maint.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("data", msgData);
				forward("EDL0535_tasa_maint.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}

		
	}

}

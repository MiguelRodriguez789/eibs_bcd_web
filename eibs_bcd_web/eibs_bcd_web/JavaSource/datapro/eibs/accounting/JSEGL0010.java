package datapro.eibs.accounting;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import datapro.eibs.beans.EGL001001Message;
import datapro.eibs.beans.EGL001002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD036501Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEGL0010 extends JSEIBSServlet {

	protected static final int R_ENTER = 100;
	protected static final int R_TRANSACTION_LIST = 200;
	protected static final int R_TRANSACTION_NEW = 201;
	protected static final int R_TRANSACTION_MAINT = 202;
	protected static final int R_TRANSACTION_DELETE = 204;
	protected static final int A_TRANSACTION_CUADRE = 210;
	protected static final int A_TRANSACTION_REPORT = 218;
	protected static final int R_LIST_FROM_SEQ = 300;
	protected static final int A_TRANSACTION_UPDATE = 400;

	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
			case R_ENTER:
				procReqEnter(user, req, res, session);
				break;
			case R_LIST_FROM_SEQ:	
			case R_TRANSACTION_LIST:
				procReqTransactionList(user, req, res, session, screen);
				break;
			case R_TRANSACTION_NEW:
				procReqTransactionNew(user, req, res, session,screen);
				break;
			case R_TRANSACTION_DELETE:
				procReqTransactionDelete(user, req, res, session);
				break;
			case R_TRANSACTION_MAINT:
				procReqTransactionMaint(user, req, res, session);
				break;
			case A_TRANSACTION_CUADRE:
				procActionTransactionCuadre(user, req, res, session);
				break;
			case A_TRANSACTION_REPORT:
				procActionTransactionReport(user, req, res, session);
				break;
			case A_TRANSACTION_UPDATE:
				procActionTransactionUpdate(user, req, res, session);
				break;
			default:
				break;
		}

	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

	MessageProcessor mp = null;
	UserPos userPO = new UserPos();
	try {
		mp = getMessageProcessor("EGL0010", req);
		EGL001002Message glBatch = (EGL001002Message) mp.getMessageRecord("EGL001002");
		glBatch.setE02SELBTH(user.getE01DIB());
		glBatch.setE02SELOBK(user.getE01UBK());
		glBatch.setE02SELOBR(user.getE01UBR());
		glBatch.setE02SELCCY(user.getE01BCU());
		userPO.setSource(Util.getReqParameter("opt", req));
		
		session.setAttribute("userPO", userPO);
		session.setAttribute("glBatch", glBatch);
		forward("EGL0010_transaction_batch_enter.jsp", req, res);
		
	} finally {
		if (mp != null)
			mp.close();
	}
		
	}

	private void procReqTransactionList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0010", req);
			EGL001002Message batchList = (EGL001002Message) ((null == session.getAttribute("batchTotal")) ? new EGL001002Message() : session.getAttribute("batchTotal"));
			batchList.setH02USERID(user.getH01USR());
			batchList.setH02PROGRM("EGL0010");
			batchList.setH02TIMSYS(getTimeStamp());
			batchList.setH02SCRCOD("01");
			batchList.setH02OPECOD("0015");
			setMessageRecord(req,batchList);
			batchList.setE02SELSEQ(Util.getReqParameter("E01SEQ", req, "0"));
			batchList.setE02NUMREC(Util.getReqParameter("E01NUMREC", req, "0"));
			batchList.setE02SLFILE(userPO.getSource());
			
			EGL001002Message glBatch =  (EGL001002Message) batchList.clone();
			mp.sendMessage(batchList);
			ELEERRMessage msgError =  (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("glBatch", glBatch);
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);

				forward("EGL0010_transaction_batch_enter.jsp", req, res);
			} else {
				glBatch =   (EGL001002Message)mp.receiveMessageRecord();
				userPO.setCurrency(glBatch.getE02SELCCY());
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS","E01NUMREC");
				session.setAttribute("batchTotal",glBatch);
				session.setAttribute("batchList",list);
				session.setAttribute("userPO", userPO);

				forward("EGL0010_transaction_batch_list.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqTransactionNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		boolean reload = screen == R_TRANSACTION_NEW;
		
		try {
			EGL001001Message batchTrans = new EGL001001Message() ;
			EGL001002Message batchHeader = (EGL001002Message) session.getAttribute("batchTotal");
			batchTrans.setE01BTH(batchHeader.getE02SELBTH());
			batchTrans.setE01SEQ("9999999");
			batchTrans.setE01OBK(batchHeader.getE02SELOBK());
			batchTrans.setE01OBR(batchHeader.getE02SELOBR());
			batchTrans.setE01BNK(batchHeader.getE02SELOBK());
			batchTrans.setE01BRN(batchHeader.getE02SELOBR());
			batchTrans.setE01CCY(userPO.getCurrency());
			batchTrans.setE01VDM(batchHeader.getE02SELVDM());
			batchTrans.setE01VDD(batchHeader.getE02SELVDD());
			batchTrans.setE01VDY(batchHeader.getE02SELVDY());
			batchTrans.setE01FLE(userPO.getSource());

			userPO.setOption("NEW");
			session.setAttribute("trans",batchTrans);
			session.setAttribute("userPO", userPO);
			req.setAttribute("reload", reload);
			forward("EGL0010_transaction_batch_maint.jsp", req, res);
			
			
		} finally {
		}
		
	}

	private void procReqTransactionDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EGL001001Message batchTrans = null;
		
		try {
			mp = getMessageProcessor("EGL0010", req);
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("batchList");
				int index = Integer.parseInt(req.getParameter("key").trim());
				batchTrans = (EGL001001Message)list.get(index);
			}

			if(null != batchTrans){
				batchTrans.setH01USERID(user.getH01USR());
				batchTrans.setH01PROGRM("EGL0010");
				batchTrans.setH01TIMSYS(getTimeStamp());
				batchTrans.setH01SCRCOD("01");
				batchTrans.setH01OPECOD("0009");
				batchTrans.setE01FLE(userPO.getSource());
				userPO.setOption("DELETE");

				mp.sendMessage(batchTrans);
				
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				
				if (mp.hasError(msgError)) {
					session.setAttribute("error", msgError);
					forward("EGL0010_close.jsp", req, res);
				} else {
					EGL001002Message glBatch =   (EGL001002Message)mp.receiveMessageRecord();
					
					JBObjList list = mp.receiveMessageRecordList("H01FLGMAS","E01NUMREC");
					session.setAttribute("batchTotal",glBatch);
					session.setAttribute("batchList",list);
					session.setAttribute("userPO", userPO);
					forward("EGL0010_transaction_batch_list.jsp", req, res);
				}
			}
		} finally {
			if(null != mp){
				mp.close();
			}
		}
	}


	private void procReqTransactionMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		EGL001001Message batchTrans = null;

		try {
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("batchList");
				int index = Integer.parseInt(req.getParameter("key").trim());
				batchTrans = (EGL001001Message)list.get(index);
			}

			userPO.setOption("MAINTENANCE");
			session.setAttribute("userPO", userPO);
			session.setAttribute("trans",batchTrans);

			forward("EGL0010_transaction_batch_maint.jsp", req, res);
	
		} finally {
		}
	}

	private void procActionTransactionCuadre(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0010", req);
			EGL001002Message batchList = (EGL001002Message) mp.getMessageRecord("EGL001002");
			batchList.setH02USERID(user.getH01USR());
			batchList.setH02PROGRM("EGL0010");
			batchList.setH02TIMSYS(getTimeStamp());
			batchList.setH02SCRCOD("01");
			batchList.setH02OPECOD("0020");
			batchList.setE02SLFILE(userPO.getSource());

			userPO.setOption("CUADRE");
			setMessageRecord(req,batchList);

			EGL001002Message glBatch =  (EGL001002Message) batchList.clone();
			batchList.setE02SLFILE(userPO.getSource());

			mp.sendMessage(batchList);
			glBatch =   (EGL001002Message)mp.receiveMessageRecord();
			
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS","E01NUMREC");
			session.setAttribute("batchTotal",glBatch);
			session.setAttribute("batchList",list);
			session.setAttribute("userPO", userPO);

			forward("EGL0010_transaction_batch_list.jsp", req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	

	private void procActionTransactionReport(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0010", req);
			EGL001002Message batchList = (EGL001002Message) mp.getMessageRecord("EGL001002");
			batchList.setH02USERID(user.getH01USR());
			batchList.setH02PROGRM("EGL0010");
			batchList.setH02TIMSYS(getTimeStamp());
			batchList.setH02SCRCOD("01");
			batchList.setH02OPECOD("0018");
			batchList.setE02SLFILE(userPO.getSource());
			
			userPO.setOption("REPORT");
			setMessageRecord(req,batchList);
			mp.sendMessage(batchList);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JSONObject json = new JSONObject();
			session.setAttribute("error", msgError);
			json.put("type", msgError.getERRNUM().equals("0") ? "NO ERROR": "ERROR");
			sendJSONResponse(res, json);
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	

	private void procActionTransactionUpdate(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EGL001001Message batchTrans = null;
		
		try {
			mp = getMessageProcessor("EGL0010", req);
			batchTrans = (EGL001001Message) session.getAttribute("trans");
			batchTrans.setH01USERID(user.getH01USR());
			batchTrans.setH01PROGRM("EGL0010");
			batchTrans.setH01TIMSYS(getTimeStamp());
			batchTrans.setH01SCRCOD("01");
			batchTrans.setH01OPECOD("0006");
			batchTrans.setE01FLE(userPO.getSource());
			setMessageRecord(req, batchTrans);
			mp.sendMessage(batchTrans);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				batchTrans =   (EGL001001Message)mp.receiveMessageRecord();

				session.setAttribute("error", msgError);
				session.setAttribute("trans",batchTrans);
				forward("EGL0010_transaction_batch_maint.jsp", req, res);
			} else {
				EGL001002Message glBatch =   (EGL001002Message)mp.receiveMessageRecord();
				
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS","E01NUMREC");
				session.setAttribute("batchTotal",glBatch);
				session.setAttribute("batchList",list);
				session.setAttribute("userPO", userPO);
				if (userPO.getOption().equals("NEW")){
					procReqTransactionNew(user, req, res, session, R_TRANSACTION_NEW);
				} else{
					forward("EGL0010_close.jsp", req, res);
				}
			}
		} finally {
			if(null != mp){
				mp.close();
			}
		}
	}

}


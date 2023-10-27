package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESG050001Message;
import datapro.eibs.beans.ESG050002Message;
import datapro.eibs.beans.ESG050003Message;
import datapro.eibs.beans.ESG050004Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSESG0500 extends JSEIBSServlet {

	private static final long serialVersionUID = 1276481948198220309L;
	protected static final int R_TBL_FACTORES_LIST    = 100;
	protected static final int R_TBL_FACTORES_NEW     = 200;
	protected static final int R_TBL_FACTORES_MAINT   = 201;
	protected static final int R_TBL_FACTORES_DELETE  = 202;	
	protected static final int R_TBL_FACTORES_INQUIRY = 203;
	protected static final int R_FACTORES_MAINT       = 301;
	protected static final int A_TBL_FACTORES_MAINT   = 600;
	protected static final int A_FACTORES_MAINT       = 601;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_TBL_FACTORES_LIST:
				procReqList(user, req, res, session);
				break;
			case R_TBL_FACTORES_NEW:
				procReqNew(user, req, res, session);
				break;
			case R_TBL_FACTORES_MAINT:
				procReqMaint(user, req, res, session);
				break;
			case R_TBL_FACTORES_INQUIRY:
				procReqInquiry(user, req, res, session);
				break;
			case R_TBL_FACTORES_DELETE:
				procReqDelete(user, req, res, session);
				break;
			case R_FACTORES_MAINT:
				procReqFactoresMaint(user, req, res, session);
				break;
			case A_TBL_FACTORES_MAINT:
				procActMaint(user, req, res, session);
				break;
			case A_FACTORES_MAINT:
				procActFactoresMaint(user, req, res, session);
				break;
			default:
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) 
		throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		try {
			mp = getMessageProcessor("ESG0500", req);

			ESG050001Message msg = (ESG050001Message) mp.getMessageRecord("ESG050001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			
			userPO.setType(req.getParameter("TYPE") == null ? "" : req.getParameter("TYPE").trim());
			msg.setE01FTTSFL(userPO.getType());
			
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
 
			ses.setAttribute("userpPO", userPO);
			ses.setAttribute("ESG050001List", list);
			forwardOnSuccess("ESG0500_tbl_factores_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(ses);
		MessageProcessor mp = null;
		
		userPO.setPurpose("NEW");
		
		try {

			mp = getMessageProcessor("ESG0500", req);

			ESG050001Message msgNew = (ESG050001Message) mp.getMessageRecord("ESG050001");
			ESG050002Message msgRow = (ESG050002Message) mp.getMessageRecord("ESG050002");
			ESG050003Message msgCol = (ESG050003Message) mp.getMessageRecord("ESG050003");
			
			msgNew.setH01USERID(user.getH01USR());
			msgNew.setH01PROGRM("ESG0500");
			msgNew.setH01TIMSYS(getTimeStamp());
			msgNew.setH01SCRCOD("01");
			msgNew.setH01OPECOD("0001");

			userPO.setType(req.getParameter("TYPE") == null ? "" : req.getParameter("TYPE").trim());
			msgNew.setE01FTTSFL(userPO.getType());

			mp.sendMessage(msgNew);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgNew = (ESG050001Message) mp.receiveMessageRecord("ESG050001");
			
			if (mp.hasError(msgError)) {
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				forward("ESG0500_tbl_factores_list.jsp", req, res);
			} else {
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("error", msgError);
				ses.setAttribute("datarec", msgNew);
				ses.setAttribute("datarow", msgRow);
				ses.setAttribute("datacol", msgCol);
				forward("ESG0500_tbl_factores_enter.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
	
	}

	private void procReqMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(ses);
		MessageProcessor mp = null;
		ESG050001Message listMessage = null;
		
		userPO.setPurpose("MAINTENANCE");
		
		try {
			
			mp = getMessageProcessor("ESG0500", req);
	
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)ses.getAttribute("ESG050001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (ESG050001Message)list.get(index);
			}
	
			ESG050001Message msgMnt = (ESG050001Message) mp.getMessageRecord("ESG050001");
			ESG050002Message msgRow = (ESG050002Message) mp.getMessageRecord("ESG050002");
			ESG050003Message msgCol = (ESG050003Message) mp.getMessageRecord("ESG050003");
			
			msgMnt.setH01USERID(user.getH01USR());
			msgMnt.setH01PROGRM("ESG0500");
			msgMnt.setH01TIMSYS(getTimeStamp());
			msgMnt.setH01SCRCOD("01");
			msgMnt.setH01OPECOD("0002");
			
			if (listMessage == null) {
				msgMnt.setE01FTTCOD(req.getParameter("E01FTTCOD").trim());
				msgMnt.setE01FTTSFL(req.getParameter("E01FTTSFL").trim());
			} else {
				msgMnt.setE01FTTCOD(listMessage.getE01FTTCOD());
				msgMnt.setE01FTTSFL(listMessage.getE01FTTSFL());
			}
	
			mp.sendMessage(msgMnt);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMnt = (ESG050001Message) mp.receiveMessageRecord("ESG050001");
			
			if (mp.hasError(msgError)) {
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				forward("ESG0500_tbl_factores_list.jsp", req, res);
			} else {
				msgRow = getRows(user, msgMnt);
				msgCol = getCols(user, msgMnt);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("error", msgError);
				ses.setAttribute("datarec", msgMnt);
				ses.setAttribute("datarow", msgRow);
				ses.setAttribute("datacol", msgCol);
				forward("ESG0500_tbl_factores_enter.jsp", req, res);
			}
	
		} finally {
			if (mp != null) mp.close();
		}

	}

	private void procReqInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		ESG050001Message listMessage = null;
		
		userPO.setPurpose("INQUIRY");
		
		try {
			mp = getMessageProcessor("ESG0500", req);
		
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("ESG050001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (ESG050001Message)list.get(index);
			}
			
			ESG050001Message msgMnt = (ESG050001Message) mp.getMessageRecord("ESG050001");
			msgMnt.setH01USERID(user.getH01USR());
			msgMnt.setH01PROGRM("ESG0500");
			msgMnt.setH01TIMSYS(getTimeStamp());
			msgMnt.setH01SCRCOD("01");
			msgMnt.setH01OPECOD("0004");
		
			if (listMessage == null) {
				msgMnt.setE01FTTCOD(req.getParameter("E01FTTCOD").trim());
				msgMnt.setE01FTTSFL(req.getParameter("E01FTTSFL").trim());
			} else {
				msgMnt.setE01FTTCOD(listMessage.getE01FTTCOD());
				msgMnt.setE01FTTSFL(listMessage.getE01FTTSFL());
			}

			mp.sendMessage(msgMnt);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMnt = (ESG050001Message) mp.receiveMessageRecord("ESG050001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("ESG0500_tbl_factores_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMnt);
				session.setAttribute("error", msgError);
				forward("ESG0500_tbl_factores_enter.jsp", req, res);
			}
		
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procReqDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ESG0500", req);
			
			JBObjList list = (JBObjList)ses.getAttribute("ESG050001List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			ESG050001Message listMessage = (ESG050001Message)list.get(index);
			
			ESG050001Message msgDel = (ESG050001Message) mp.getMessageRecord("ESG050001");
			msgDel.setH01USERID(user.getH01USR());
			msgDel.setH01PROGRM("ESG0500");
			msgDel.setH01TIMSYS(getTimeStamp());
			msgDel.setH01SCRCOD("01");
			msgDel.setH01OPECOD("0009");
			msgDel.setH01FLGMAS( req.getParameter("H01FLGMAS") );
			
			msgDel.setE01FTTCOD(listMessage.getE01FTTCOD());
			msgDel.setE01FTTSFL(listMessage.getE01FTTSFL());
			
			mp.sendMessage(msgDel);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procReqList(user, req, res, ses);
			} else {
				ses.setAttribute("error", msgError);
				forward("ESG0500_tbl_factores_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	private void procReqFactoresMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(ses);
		MessageProcessor mp = null;
		ESG050001Message msgRec = null;
		
		try {
			
			mp = getMessageProcessor("ESG0500", req);
	
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)ses.getAttribute("ESG050001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				msgRec = (ESG050001Message)list.get(index);
			}
	
			ESG050002Message msgRow = (ESG050002Message) mp.getMessageRecord("ESG050002");
			ESG050003Message msgCol = (ESG050003Message) mp.getMessageRecord("ESG050003");
			ESG050004Message msgFct = (ESG050004Message) mp.getMessageRecord("ESG050004");
			
			msgFct.setH04USERID(user.getH01USR());
			msgFct.setH04PROGRM("ESG0500");
			msgFct.setH04TIMSYS(getTimeStamp());
			msgFct.setH04SCRCOD("01");
			msgFct.setH04OPECOD("0002");
			
			if (msgRec == null) {
				msgFct.setE04FTTCOD(req.getParameter("E01FTTCOD").trim());
				msgFct.setE04FTTSFL(req.getParameter("E01FTTSFL").trim());
			} else {
				msgFct.setE04FTTCOD(msgRec.getE01FTTCOD());
				msgFct.setE04FTTSFL(msgRec.getE01FTTSFL());
			}
	
			mp.sendMessage(msgFct);
			
			JBObjList list = mp.receiveMessageRecordList("H04FLGMAS");
			
			msgRow = getRows(user, msgRec);
			msgCol = getCols(user, msgRec);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("datarec", msgRec);
			ses.setAttribute("datafct", list);
			ses.setAttribute("datarow", msgRow);
			ses.setAttribute("datacol", msgCol);
			
			forwardOnSuccess("ESG0500_tbl_factores_maint.jsp", req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	
	}

	protected void procActMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(ses);
		MessageProcessor mp = null;
		
		userPO.setPurpose("MAINTENANCE");
		
		try {
			mp = getMessageProcessor("ESG0500", req);
			ESG050001Message msgMnt = (ESG050001Message) mp.getMessageRecord("ESG050001");
			msgMnt.setH01USERID(user.getH01USR());
			msgMnt.setH01PROGRM("ESG0500");
			msgMnt.setH01TIMSYS(getTimeStamp());
			msgMnt.setH01SCRCOD("01");
			msgMnt.setH01OPECOD("0005");
			
			setMessageRecord(req, msgMnt);
	
			mp.sendMessage(msgMnt);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMnt = (ESG050001Message) mp.receiveMessageRecord("ESG050001");
			
			if (mp.hasError(msgError)) {
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("error", msgError);
				ses.setAttribute("datarec",	msgMnt);
				forward("ESG0500_tbl_factores_enter.jsp", req, res);
			} else {
				setRows(user, req, msgMnt);
				setCols(user, req, msgMnt);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("datarec",	msgMnt);
				req.setAttribute("ACT","S");
				forward("ESG0500_tbl_factores_enter.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
	
	}

	protected void procActFactoresMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(ses);
		MessageProcessor mp = null;
		ESG050001Message msgRec = null;
		
		try {
			
			msgRec = (ESG050001Message) ses.getAttribute("datarec");
			
			for (int i=1; i<=msgRec.getBigDecimalE01FTTNRW().intValue(); i++) {

				mp = getMessageProcessor("ESG0500", req);
				ESG050004Message msgMnt = (ESG050004Message) mp.getMessageRecord("ESG050004");
				msgMnt.setH04USERID(user.getH01USR());
				msgMnt.setH04PROGRM("ESG0500");
				msgMnt.setH04TIMSYS(getTimeStamp());
				msgMnt.setH04SCRCOD("01");
				msgMnt.setH04OPECOD("0005");
				
				setMessageRecord(req, msgMnt);
				
				setMessage(req, msgMnt, i);
				
				if (msgRec == null) {
					msgMnt.setE04FTTCOD(req.getParameter("E01FTTCOD").trim());
					msgMnt.setE04FTTSFL(req.getParameter("E01FTTSFL").trim());
				} else {
					msgMnt.setE04FTTCOD(msgRec.getE01FTTCOD());
					msgMnt.setE04FTTSFL(msgRec.getE01FTTSFL());
					msgMnt.setE04FTTROW(Integer.toString(i));
				}
				
				mp.sendMessage(msgMnt);
				
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				
				if (mp.hasError(msgError)) {
					ses.setAttribute("error", msgError);
					return;
				}

			}
			
			// Envia ultimo registro para eliminar las filas que sobran
			mp = getMessageProcessor("ESG0500", req);
			ESG050004Message msgMnt = (ESG050004Message) mp.getMessageRecord("ESG050004");
			msgMnt.setH04USERID(user.getH01USR());
			msgMnt.setH04PROGRM("ESG0500");
			msgMnt.setH04TIMSYS(getTimeStamp());
			msgMnt.setH04SCRCOD("01");
			msgMnt.setH04OPECOD("0009");
	
			setMessageRecord(req, msgMnt);
			mp.sendMessage(msgMnt);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("error", msgError);
				ses.setAttribute("datarec",	msgRec);
				forward("ESG0500_tbl_factores_maint.jsp", req, res);
			} else {
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("datarec",	msgRec);
				req.setAttribute("ACT","S");
				forward("ESG0500_tbl_factores_maint.jsp", req, res);
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
	
	}

	private static ESG050002Message getRows(ESS0030DSMessage user, ESG050001Message msg) 
		throws ServletException, IOException {
	
		MessageProcessor mp = null;
		
		try {
			
			mp = new MessageProcessor("ESG050002");
			ESG050002Message msgRow = (ESG050002Message) mp.getMessageRecord("ESG050002");
	
			msgRow.setH02USERID(user.getH01USR());
			msgRow.setH02PROGRM("ESG0500");
			msgRow.setH02TIMSYS(getTimeStamp());
			msgRow.setH02SCRCOD("01");
			msgRow.setH02OPECOD("0002");
			msgRow.setH02FLGMAS("");
					
			msgRow.setE02FTTCOD(msg.getE01FTTCOD());
			msgRow.setE02FTTSFL(msg.getE01FTTSFL());
		
			mp.sendMessage(msgRow);				
	
			msgRow = (ESG050002Message) mp.receiveMessageRecord("ESG050002");
			
			return msgRow;
			
		} finally {
			if (mp != null) mp.close();
		}
	
	}

	private static ESG050003Message getCols(ESS0030DSMessage user, ESG050001Message msg) 
		throws ServletException, IOException {
	
		MessageProcessor mp = null;
		
		try {
			
			mp = new MessageProcessor("ESG050003");
			ESG050003Message msgCol = (ESG050003Message) mp.getMessageRecord("ESG050003");
	
			msgCol.setH03USERID(user.getH01USR());
			msgCol.setH03PROGRM("ESG0500");
			msgCol.setH03TIMSYS(getTimeStamp());
			msgCol.setH03SCRCOD("01");
			msgCol.setH03OPECOD("0002");
			msgCol.setH03FLGMAS("");
					
			msgCol.setE03FTTCOD(msg.getE01FTTCOD());
			msgCol.setE03FTTSFL(msg.getE01FTTSFL());
		
			mp.sendMessage(msgCol);				
	
			msgCol = (ESG050003Message) mp.receiveMessageRecord("ESG050003");
			
			return msgCol;
			
		} finally {
			if (mp != null) mp.close();
		}
	
	}

	protected void setRows(ESS0030DSMessage user, HttpServletRequest req, ESG050001Message msg) 
		throws ServletException, IOException {
	
		MessageProcessor mp = null;
		
		try {
			
			mp = new MessageProcessor("ESG050002");
			ESG050002Message msgRow = (ESG050002Message) mp.getMessageRecord("ESG050002");
	
			msgRow.setH02USERID(user.getH01USR());
			msgRow.setH02PROGRM("ESG0500");
			msgRow.setH02TIMSYS(getTimeStamp());
			msgRow.setH02SCRCOD("01");
			msgRow.setH02OPECOD("0005");
			msgRow.setH02FLGMAS( msg.getH01FLGMAS() );
					
			setMessageRecord(req, msgRow);
			
			msgRow.setE02FTTCOD(msg.getE01FTTCOD());
			msgRow.setE02FTTSFL(msg.getE01FTTSFL());
	
			mp.sendMessage(msgRow);				
	
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				return;
			}			
			
		} finally {
			if (mp != null) mp.close();
		}
	
	}
	
	protected void setCols(ESS0030DSMessage user, HttpServletRequest req, ESG050001Message msg) 
		throws ServletException, IOException {
	
		MessageProcessor mp = null;
		
		try {
			
			mp = new MessageProcessor("ESG050003");
			ESG050003Message msgCol = (ESG050003Message) mp.getMessageRecord("ESG050003");
	
			msgCol.setH03USERID(user.getH01USR());
			msgCol.setH03PROGRM("ESG0500");
			msgCol.setH03TIMSYS(getTimeStamp());
			msgCol.setH03SCRCOD("01");
			msgCol.setH03OPECOD("0005");
			msgCol.setH03FLGMAS(  msg.getH01FLGMAS() );
					
			setMessageRecord(req, msgCol);
			
			msgCol.setE03FTTCOD(msg.getE01FTTCOD());
			msgCol.setE03FTTSFL(msg.getE01FTTSFL());
	
			mp.sendMessage(msgCol);				
	
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				return;
			}			
	
		} finally {
			if (mp != null) mp.close();
		}
	
	}

	public void setMessage(HttpServletRequest req, MessageRecord msg, int idx) {
		java.util.Enumeration enu = msg.fieldEnumeration();
		MessageField field = null;
		String value = null;
		String index = null;
		while (enu.hasMoreElements()) {
			field = (MessageField) enu.nextElement();
			index = (idx<10) ? "00"+idx: (idx<100) ? "0"+idx: ""+idx;
			try {
				value = req.getParameter(field.getTag()+"_"+index).toUpperCase();
				if (value != null) {
					field.setString(value);
				}
			} catch (Exception e) {
			}
		}
	}

}

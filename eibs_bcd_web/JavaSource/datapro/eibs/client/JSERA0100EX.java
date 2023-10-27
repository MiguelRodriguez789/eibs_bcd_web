package datapro.eibs.client;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Orestes Garcia
 */
import java.io.*;
import java.math.BigDecimal;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;

import com.datapro.exception.ServiceLocatorException;

import datapro.eibs.beans.*;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.*;

public class JSERA0100EX extends JSERA0100  {

	// options
	protected static final int R_EXPIRED_POLICIES = 50;
	protected static final int INQUIRY_EXPIRED_POLICIES = 55;

	private void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,HttpSession session, int screen) 
			throws IOException, ServletException {
		
		switch (screen) {
		case R_EXPIRED_POLICIES:
			procReqExpirePolicies(user, req, res, session);
			break;
		case INQUIRY_EXPIRED_POLICIES:
			procActionIns(user, req, res, session);
			break;
		default:
			res.sendRedirect(rootPath + LangPath.toLowerCase() + "/"+sckNotRespondPage);
			break;
		}
	}
	
	private void procActionIns(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {
		ERA010003Message listMessage = null;
		ELEERRMessage error = null;
		ELEERRMessage msgError = new ELEERRMessage();
		JBObjList list = null;
		UserPos userPO = getUserPos(req);
		int index = 0;
		
		if (null != req.getParameter("key")) {
			list = (JBObjList)session.getAttribute("msglst");
			index = Integer.parseInt(Util.getReqParameter("key", req ,"0"));
			listMessage = (ERA010003Message)list.get(index);
		} else {
			listMessage = new ERA010003Message();
		}
		
		userPO.setPurpose("INQUIRY");
		String pageName = "/ERA0062_ga_detail_insurance.jsp";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0062", req);
			ERA006203Message msgL62 = (ERA006203Message) mp.getMessageRecord("ERA006203");
			msgL62.setH03USERID(user.getH01USR());
			msgL62.setH03PROGRM("ERA0062");
			msgL62.setH03TIMSYS(getTimeStamp());
			msgL62.setH03SCRCOD("05");
			msgL62.setH03OPECOD("0004");
			msgL62.setE03ROCBNK(listMessage.getE03ROCBNK());
			msgL62.setE03ROCREF(listMessage.getE03ROCREF());
			msgL62.setE03ROCCIN(listMessage.getE03ROCCIN());
			
			mp.sendMessage(msgL62);
			error = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			if (mp.hasError(error)) {
				addError(error, msgError);
			}			
			
			msgL62 = (ERA006203Message) mp.receiveMessageRecord("ERA006203");

			error = procReqExtFld(mp, user, req, res, session, msgL62.getE03ROCBNK(), msgL62.getE03ROCREF(), msgL62.getE03ROCTYP(), msgL62.getE03ROCPRD(), msgL62.getE03ROCSQR(), "0004", "05");
			if (mp.hasError(error)) {
				addError(error, msgError);
			}
			session.setAttribute("error", msgError);
			session.setAttribute("gaPoliza", msgL62);

			if (mp.hasError(msgError)) {
				callPage(rootPath + LangPath.toLowerCase() + pageName, req, res);
			} else {
				callPage(rootPath + LangPath.toLowerCase() + pageName, req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private ELEERRMessage procReqExtFld(MessageProcessor mp,
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, 
			String bnk, String referencia, String type, 
			String prod, String sec, String opecode, String inqMnt) throws IOException {

		ERA007201Message msgL72 = (ERA007201Message) mp.getMessageRecord("ERA007201");
		msgL72.setH01USERID(user.getH01USR());
		msgL72.setH01PROGRM("ERA0072");
		msgL72.setH01TIMSYS(getTimeStamp());
		msgL72.setH01SCRCOD(inqMnt);
		msgL72.setH01OPECOD(opecode);
		msgL72.setE01TBLTYP(type);
		msgL72.setE01TBLCDE(prod);
		msgL72.setE01EXTREF(referencia);
		msgL72.setE01EXTSEQ(sec);

		if (opecode.equals("0002")) {
			setMessageRecord(req, msgL72);
		}
		
		mp.sendMessage(msgL72);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		msgL72 = (ERA007201Message) mp.receiveMessageRecord("ERA007201");
		
		session.setAttribute("gaUserFld", msgL72);
		return msgError;
	}	
	
	private void procReqExpirePolicies(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,HttpSession session) 
			throws IOException, ServletException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0100", req);
			ERA010003Message msgMenu = (ERA010003Message) mp.getMessageRecord("ERA010003");
		 	msgMenu.setH03USERID(user.getH01USR());
		 	msgMenu.setH03PROGRM("ERA0100");
		 	msgMenu.setH03TIMSYS(getTimeStamp());
		 	msgMenu.setH03SCRCOD("01");
		 	msgMenu.setH03OPECOD("0005");
			mp.sendMessage(msgMenu);
			
			//Receive menu list
			JBObjList msglst = mp.receiveMessageRecordList("H03FLGMAS");

			session.setAttribute("userPO", userPO);
			session.setAttribute("msglst", msglst);
			callPage(rootPath + LangPath.toLowerCase() + "/ERA0100_expired_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}		
	}
	
	protected void addError(ELEERRMessage source, ELEERRMessage target) {
		int idx1 = target.getBigDecimalERRNUM().intValue();
		if (idx1 < 10) {
			if (!source.getERRNUM().equals("0")) {
				int idx2 = source.getBigDecimalERRNUM().intValue();
				for (int i = 1; i <= idx2; i++) {
					idx1++;
					String tSufix = Util.addLeftChar('0', 2, ""+idx1);
					String sSufix = Util.addLeftChar('0', 2, ""+i);
					if (idx1 < 11) {
						target.getField("ERNU" + tSufix).setString(source.getFieldString("ERNU" + sSufix));
						target.getField("ERDS" + tSufix).setString(source.getFieldString("ERDS" + sSufix));
						target.getField("ERDF" + tSufix).setString(source.getFieldString("ERDF" + sSufix));
						target.getField("ERDR" + tSufix).setString(source.getFieldString("ERDR" + sSufix));
						target.getField("ERWF" + tSufix).setString(source.getFieldString("ERWF" + sSufix));
					} else {
						idx1 = 10;
						break;
					}
				}
			}
			target.setERRNUM(new BigDecimal(String.valueOf(idx1)));
		}
	}	
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ESS0030DSMessage msgUser = null;
		HttpSession session = null;

		session = getSession(req, res);
		if (session != null) {
			msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
			if (msgUser == null) {
				//Session Expiration Control
				try {
					res.setContentType("text/html");
					printLogInAgain(res.getWriter());
				} catch (Exception e) {
					flexLog("Exception ocurred. Exception = " + e);
				}
				return;
			}
			// Here we should get the path from the user profile
			try {
				int screen ;
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
				} catch (Exception e) {
					screen = 1;
				}	
				//Set port if has been provided
				hasPort(req);
				//Set Previous Year if has been provided
				if (isPrevYear(req)) {
					flexLog(this.getServletName() + " in Previous Year Mode...");
				}
				
				switch (screen) {
				case INQUIRY_EXPIRED_POLICIES:
				case R_EXPIRED_POLICIES:
					processRequest(msgUser, req, res, session, screen);
					break;
				default:
					super.service(req, res);
				}
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e, SYSTEM);
				callPage(rootPath + LangPath.toLowerCase() + "/"+ devPage, req, res);
			}
		}		
		
	}
	

	public MessageProcessor getMessageProcessor(String targetProgram, HttpServletRequest request) 
		throws IOException {
		try {
			return new MessageProcessor(getMessageHandler(targetProgram, request));
		} catch (ServiceLocatorException e) {
			throw new IOException(e.getMessage());
		}
	}	
}
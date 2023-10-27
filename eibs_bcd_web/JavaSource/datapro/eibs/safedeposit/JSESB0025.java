package datapro.eibs.safedeposit;
 
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

@SuppressWarnings("serial")
public class JSESB0025 extends JSEIBSServlet {

	protected static final int R_SEARCH 	= 1;
	protected static final int R_LIST 		= 11;
	protected static final int R_INQUIRY 	= 200;

	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen)
			throws ServletException, IOException {
		switch (screen) {
			case R_SEARCH :							
				procReqSearch(user, req, res, session);
				break;					
			case R_LIST :							
				procReqList(user, req, res, session);
				break;	
			case R_INQUIRY :							
				procReqInquiry(user, req, res, session);
				break;			
			default :
				forward(devPage, req, res);
				break;
		}
	}

	
	protected void procReqSearch( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,HttpSession ses)
			throws ServletException, IOException {
		
		forwardOnSuccess("ESB0025_safe_deposit_deleted_search.jsp", req, res);
	}

	protected void procReqList( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {
		
		MessageProcessor mp = null;
		MessageRecord mr = null;
		ESB002501Message msgRecord = null;
		JBObjList beanList = null;
		UserPos userPO = getUserPos(ses);

		try {
			mp = getMessageProcessor("ESB0025", req);
			msgRecord = (ESB002501Message) mp.getMessageRecord("ESB002501");
			msgRecord.setH01USERID(user.getH01USR());
			msgRecord.setH01PROGRM("ESB0025");
			msgRecord.setH01TIMSYS(getTimeStamp());
			msgRecord.setH01SCRCOD("01");
			msgRecord.setH01OPECOD("0015");
			setMessageRecord(req, msgRecord);
			
			mp.sendMessage(msgRecord);
		
			mr = mp.receiveMessageRecord();
			if (mr instanceof ELEERRMessage) {
				ELEERRMessage msgError = (ELEERRMessage) mr;
				ses.setAttribute("error", msgError);
				forward("ESB0025_safe_deposit_deleted_search.jsp", req, res);

			} else if ( mr instanceof ESB002501Message) {
				beanList = new JBObjList();
				String marker = "";

				while (true) {
					msgRecord = (ESB002501Message) mr;
					marker = msgRecord.getH01FLGMAS();

					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {
						beanList.addRow(msgRecord);
						if (marker.equals("+")) {
							beanList.setShowNext(true);
							break;
						}
					}
					mr = mp.receiveMessageRecord();
				}
								
				ses.setAttribute("msgList", beanList);
				ses.setAttribute("userPO", userPO);	
				forwardOnSuccess("ESB0025_safe_deposit_deleted_list.jsp", req, res);
			}
		} finally {
			if(null != mp){
				mp.close();
			}
		}
	}
	
	protected void procReqInquiry( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		ESB002501Message msgPart = null;
		ESB002501Message msgTemp = null;
		ELEERRMessage msgError = null;
		UserPos userPO = getUserPos(ses);
		JBObjList beanList = null;
		
		userPO.setPurpose("INQUIRY");

		try {
			mp = getMessageProcessor("ESB0025", req);
			beanList = (JBObjList) ses.getAttribute("msgList");
			beanList.setCurrentRow(Integer.parseInt(Util.getReqParameter("ROW", req, "0")));
			msgTemp = (ESB002501Message) beanList.getRecord();
			msgPart = (ESB002501Message) mp.getMessageRecord("ESB002501");
			msgPart.setE01SBLLOG(msgTemp.getE01SBLLOG());
			msgPart.setE01SBLCUN(msgTemp.getE01SBLCUN());
			msgPart.setE01SBLDEP(msgTemp.getE01SBLDEP());

			msgPart.setH01USERID(user.getH01USR());
			msgPart.setH01PROGRM("ESB0025");
			msgPart.setH01TIMSYS(getTimeStamp());
			msgPart.setH01SCRCOD("01");
			msgPart.setH01OPECOD("0002");

			mp.sendMessage(msgPart);

			newmessage = mp.receiveMessageRecord();
			
			if(newmessage instanceof ELEERRMessage){
				msgError = (ELEERRMessage) newmessage;
			} 
			
			newmessage = mp.receiveMessageRecord();
			
			if (newmessage instanceof ESB002501Message){
				msgPart = (ESB002501Message) newmessage;
			}
			
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("msgPart", msgPart);
			
			if (!mp.hasError(msgError)) { // There are no errors
				forward("ESB0025_safe_deposit_deleted_inq.jsp", req, res);	
				
			} else { // There are errors
				forward("ESB0025_safe_deposit_deleted_list.jsp", req, res);
			}
		} finally {
			if(null != mp){
				mp.close();
			}
		}
	}

}
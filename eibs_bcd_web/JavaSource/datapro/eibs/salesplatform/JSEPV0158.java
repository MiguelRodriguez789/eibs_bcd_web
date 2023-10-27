package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV015801Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

@SuppressWarnings("serial")
public class JSEPV0158  extends JSEIBSServlet {
	
	protected static final int R_ENTER_LIST  = 100;
	protected static final int A_LIST		 = 200;	

	@Override
	protected void processRequest(ESS0030DSMessage user,HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException,IOException {
		
		switch (screen) {
		case R_ENTER_LIST :
			 procReqEnter(user, req, res, session);							
			 break;
		case A_LIST :
			procRateChanger(user, req, res, session);
			 break;				 
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,HttpServletResponse res, HttpSession session)
    	throws ServletException,IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		int num_extra_rows = 2;
		
		try {
			mp = getMessageProcessor("EPV0158", req);
			
			EPV015801Message msgList = (EPV015801Message) mp.getMessageRecord("EPV015801");
		 	msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EPV0158");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");
		 	msgList.setH01OPECOD("0015");
		 	msgList.setE01FTRACC(req.getParameter("E01FTRACC"));

			mp.sendMessage(msgList);
			
		  	JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
		  	
		  	session.setAttribute("userPO", userPO);
			session.setAttribute("list", list);
			
			if("true".equals(req.getParameter("APPROVAL"))){
				userPO.setPurpose("INQUIRY");
				forwardOnSuccess("EPV0158_future_rates_inq.jsp", req, res);
			}else{
			  	for (int i = 0; i < num_extra_rows; i++) {	
				  	list.addRow(new EPV015801Message()); //Adds Blank Message Objs. For Client to inset new Data.
				}				
				forward("EPV0158_future_rates.jsp", req, res);
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procRateChanger(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException,IOException {
		
		int size = Integer.parseInt(req.getParameter("TABLESIZE"));
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		JBObjList list = (JBObjList) session.getAttribute("list");

		mp = getMessageProcessor("EPV015801", req);
		try {
			for (int i = 1; i <= size; i++) {
			    if(!req.getParameter("E01FTRPRD_"+i).trim().equals("0")&&  !req.getParameter("E01FTRPRM_"+i).trim().equals("0")
		    		&&  !req.getParameter("E01FTRPRY_"+i).trim().equals("0")&&  !req.getParameter("E01FTRRTE"+i).trim().equals("0")){	
					
					EPV015801Message msgChg = (EPV015801Message) mp.getMessageRecord("EPV015801");
					msgChg.setH01USERID(user.getH01USR());
					msgChg.setH01PROGRM("EPV015801");
					msgChg.setH01OPECOD("0005");
					msgChg.setE01FTRACC(userPO.getAccNum());
					msgChg.setE01FTRRTE(req.getParameter("E01FTRRTE"+i).trim());
					msgChg.setE01FTRPRD(req.getParameter("E01FTRPRD_"+i).trim());
					msgChg.setE01FTRPRM(req.getParameter("E01FTRPRM_"+i).trim());
					msgChg.setE01FTRPRY(req.getParameter("E01FTRPRY_"+i).trim());
					msgChg.setE01FTRFLG(req.getParameter("FLAG"+i).trim());
					
					setMessageRecord(req, msgChg);
					
					mp.sendMessage(msgChg);
			    }
			}
			//EOF to Signal the End of Message Sending
			EPV015801Message msgEOF = (EPV015801Message) mp.getMessageRecord("EPV015801");
			msgEOF.setH01USERID(user.getH01USR());
			msgEOF.setH01PROGRM("EPV0158");
			msgEOF.setH01OPECOD("0005");
			msgEOF.setE01FTRACC(userPO.getAccNum());
			msgEOF.setH01FLGMAS("*");
			
			setMessageRecord(req, msgEOF);
			
			mp.sendMessage(msgEOF);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
			  	JBObjList list_wError = mp.receiveMessageRecordList("H01FLGMAS");
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("list", list_wError);
				
				forwardOnSuccess("EPV0158_future_rates.jsp", req, res);
			} else {
				printClose(res.getWriter());
			}
		
		}finally{
			if (mp != null)
				mp.close();

		}
		
	}
	
}


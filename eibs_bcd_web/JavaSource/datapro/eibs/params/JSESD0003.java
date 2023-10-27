/**
 *  Automatic Numbering Maintenance
 *  
 * 	Update CNTRLNUM * 
 * Author: Henry G.
 * Date  : 02/03/2011
 * Source File Name:   JSESD0003.java
 **/
package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000301Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSESD0003 extends JSEIBSServlet {

	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
        switch(screen) {
		case 100: // Show main Screen
			procReqEnter(user, req, res, session);
			break;
		
		case 150: // Show list of Product Types
			procReqList(user, req, res, session);
			break;
			
		case 200: // Show List of products 
			procShowList(user, req, res, session);
			break;
			
        case 300: // Submit Maintenance 
        	procShowNumbering(user, req, res, session);
			break;

		case 400:   // Automatic Numbering
			proAutomaticNumbering(user, req, res, session);
			break;
        default:
            forward(devPage, req, res);
            break;
        }
	}

	private void proAutomaticNumbering(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0003", req);
			ESD000301Message msgAutoNum = (ESD000301Message) mp.getMessageRecord("ESD000301");
			msgAutoNum.setH01USERID(user.getH01USR());
			msgAutoNum.setH01PROGRM("ESD0003");
			msgAutoNum.setH01TIMSYS(SuperServlet.getTimeStamp());
			msgAutoNum.setH01SCRCOD("01");
			msgAutoNum.setH01OPECOD("0003");
            
            setMessageRecord(req, msgAutoNum);

			mp.sendMessage(msgAutoNum);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgAutoNum = (ESD000301Message) mp.receiveMessageRecord("ESD000301");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("autoNum", msgAutoNum);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procShowNumbering(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0003", req);
			ESD000301Message msgAutoNum = (ESD000301Message) mp.getMessageRecord("ESD000301");
            msgAutoNum.setH01USERID(user.getH01USR());
            msgAutoNum.setH01PROGRM("ESD0003");
            msgAutoNum.setH01TIMSYS(SuperServlet.getTimeStamp());
            msgAutoNum.setH01SCRCOD("01");
            msgAutoNum.setH01OPECOD("0002");
            
            setMessageRecord(req, msgAutoNum);

			mp.sendMessage(msgAutoNum);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgAutoNum = (ESD000301Message) mp.receiveMessageRecord("ESD000301");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0003_auto_numbering_seq_consecutive.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("autoNum", msgAutoNum);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procShowList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String scCode = null;
		try {
			scCode = req.getParameter("CFL").trim();
		} catch (Exception e) {
			scCode = "04";
		}
		
		String apCode = null;
		try {
			apCode = req.getParameter("ACD").trim();
		} catch (Exception e) {
			apCode = "01";
		}
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0003", req);
			ESD000301Message msgList = (ESD000301Message) mp.getMessageRecord("ESD000301");
            msgList.setH01USERID(user.getH01USR());
            msgList.setH01PROGRM("ESD0003");
            msgList.setH01TIMSYS(SuperServlet.getTimeStamp());
            msgList.setH01SCRCOD(scCode);
            msgList.setH01OPECOD("0001");
            msgList.setE01NUMACD(apCode);

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "ESD0003_auto_numbering_blank_frame.jsp";
			} else {
				session.setAttribute("dvList", list);
				pageName = "ESD0003_auto_numbering_list_product.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String scCode = null;
		try {
			scCode = req.getParameter("CFL").trim();
		} catch (Exception e) {
			scCode = "AP";
		}
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0003", req);
			ESD000301Message msgList = (ESD000301Message) mp.getMessageRecord("ESD000301");
            msgList.setH01USERID(user.getH01USR());
            msgList.setH01PROGRM("ESD0003");
            msgList.setH01TIMSYS(SuperServlet.getTimeStamp());
            msgList.setH01SCRCOD(scCode);
            msgList.setH01OPECOD("1000");

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "ESD0003_auto_numbering_blank_frame.jsp";
			} else {
				session.setAttribute("dvList", list);
				pageName = "ESD0003_auto_numbering_list_frame.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ESD0003_auto_numbering_main_frame.jsp", req, res);
	}

}

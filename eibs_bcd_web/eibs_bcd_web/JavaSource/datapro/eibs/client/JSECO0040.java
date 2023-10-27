package datapro.eibs.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECO004001Message;
import datapro.eibs.beans.ECO004002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSECO0040 extends JSEIBSServlet {
	
	static final int R_ASIGNAR_ENTER = 100;
	static final int R_ASIGNAR_LIST = 200;
	static final int R_ASIGNAR_DELETE = 300;
	static final int R_ASIGNAR_CONVENIO = 400;

	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
			case R_ASIGNAR_ENTER:
				procAsignarEnter(user, req, res, session);
				break;
			case R_ASIGNAR_LIST:
				procAsignarList(user, req, res, session);
				break;
			case R_ASIGNAR_DELETE:
				procAsignarDelete(user, req, res, session);
				break;
			case R_ASIGNAR_CONVENIO:
				procAsignarConvenio(user, req, res, session);
				break;
			default:
				break;
		}
	}

	private void procAsignarEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		forward("ECO0040_asignar_enter.jsp", req, res);
		
	}

	private void procAsignarList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECO0040", req);
			ECO004001Message msgList = (ECO004001Message) mp.getMessageRecord("ECO004001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ECO0040");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			if (req.getParameter("E01CCNCUN")== null){
				msgList.setE01CCNCUN(userPO.getCusNum());
			} else {
				msgList.setE01CCNCUN(req.getParameter("E01CCNCUN").trim());
				userPO.setCusNum(msgList.getE01CCNCUN());
			}

			mp.sendMessage(msgList);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("ECO0040_asignar_enter.jsp", req, res);
			} else {
				ECO004002Message header = (ECO004002Message) mp.receiveMessageRecord();
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("list", list);
				session.setAttribute("header", header);
				forward("ECO0040_asignar_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procAsignarDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ECO0040", req);
			
			JBObjList list = (JBObjList)session.getAttribute("list");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			ECO004001Message listMessage = (ECO004001Message)list.get(index);
			
			ECO004001Message msgConv = (ECO004001Message) mp.getMessageRecord("ECO004001");
			msgConv.setH01USERID(user.getH01USR());
			msgConv.setH01TIMSYS(getTimeStamp());
			msgConv.setH01SCRCOD("01");
			msgConv.setH01OPECOD("0009");	
			msgConv.setE01CCNCOD(listMessage.getE01CCNCOD());
			msgConv.setE01CCNCUN(userPO.getCusNum());
			
			mp.sendMessage(msgConv);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				procAsignarList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("ECO0040_asignar_list.jsp", req, res);
			}
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procAsignarConvenio(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ECO0040", req);
			
			ECO004001Message msgConv = (ECO004001Message) mp.getMessageRecord("ECO004001");
			msgConv.setH01USERID(user.getH01USR());
			msgConv.setH01TIMSYS(getTimeStamp());
			msgConv.setH01SCRCOD("01");
			msgConv.setH01OPECOD("0001");	
			msgConv.setE01CCNCOD(req.getParameter("E01CCNCOD").trim());
			msgConv.setE01CCNCUN(userPO.getCusNum());
			
			mp.sendMessage(msgConv);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				procAsignarList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("ECO0040_asignar_list.jsp", req, res);
			}
		} finally {
			if (mp != null)	mp.close();
		}
	}

}

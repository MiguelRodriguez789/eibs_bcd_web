package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESD095201Message;
import datapro.eibs.beans.ESD095202Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSESD0952 extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen)	{
			case 1 : // ENTER FROM MENU (Floating Rates Inquiry)
				proReqInquiryRates(user, req, res, session);
				break;
			case 2 : // Search from first page and get result list
				proReqList(user, req, res, session);
				break;
			case 3 : // Inquiry (click on item from search result list)
				proActInquiryRates(user, req, res, session);
				break;
			case 7 :
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void proActInquiryRates(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0952", req);
			ESD095202Message msg02 = (ESD095202Message) mp.getMessageRecord("ESD095202");
			msg02.setH02USERID(user.getH01USR());
			msg02.setH02PROGRM("ESD0952");
			msg02.setH02TIMSYS(getTimeStamp());
			msg02.setH02OPECOD("0002");
			
			setMessageRecord(req, msg02);
			
			mp.sendMessage(msg02);
			msg02 = (ESD095202Message) mp.receiveMessageRecord("ESD095202");
			
			session.setAttribute("msg02", msg02);
			
			forward("ESD0952_fx_rate_inq_info.jsp", req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void proReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0952", req);
			ESD095201Message msg01 = (ESD095201Message) mp.getMessageRecord("ESD095201");
			msg01.setH01USERID(user.getH01USR());
			msg01.setH01PROGRM("ESD0952");
			msg01.setH01TIMSYS(getTimeStamp());
			msg01.setH01OPECOD("0015");
			
			setMessageRecord(req, msg01);
			
			mp.sendMessage(msg01);
			JBObjList list = mp.receiveMessageRecordList("E01RTROPE");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("jbList", list);
				pageName = "ESD0952_fx_rates_inq_list.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void proReqInquiryRates(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ESD0952_fx_rates_inq_container.jsp", req, res);
	}

}

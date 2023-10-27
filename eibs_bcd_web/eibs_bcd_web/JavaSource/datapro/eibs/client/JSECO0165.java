package datapro.eibs.client;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generic.tool.Util;

import datapro.eibs.beans.ECO016500Message;
import datapro.eibs.beans.ECO016501Message;
import datapro.eibs.beans.ECO016503Message;
import datapro.eibs.beans.ECO016504Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ExcelColStyle;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.sockets.MessageField;

public class JSECO0165 extends JSEIBSServlet {

	protected static final int R_COVENANT_LIST 	= 1;
	protected static final int A_COVENANT_LIST 	= 2;
	protected static final int A_EXCEL_FILE 	= 3;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_COVENANT_LIST:
				procReqCovenantList(user, req, res, session);
				break;
			case A_COVENANT_LIST:
				procActionCovenantList(user, req, res, session);
				break;
			case A_EXCEL_FILE :
				generateExcelDocument(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void generateExcelDocument(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		
		JBObjList list = (JBObjList) session.getAttribute("list");
		JBObjList plnList = new JBObjList();
		
		String[] parameter = req.getParameterValues("ROW");

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECO0165", req);
			
			for (int i = 0; i < parameter.length; i++) {
				int index = Util.parseInt(parameter[i]);
				ECO016501Message msgList = (ECO016501Message) list.get(index);
				ECO016504Message msg = (ECO016504Message) mp.getMessageRecord("ECO016504");
				msg.setUSUARIO(user.getH01USR());
				msg.setCONVENIO(msgList.getE01PLHCDE());
				msg.setPLANILLA(msgList.getE01PLHNUM());
				msg.setMONEDA(msgList.getE01PLHRCY());
				
				mp.sendMessage(msg);
				plnList.addAll(mp.receiveMessageRecordList("FLAGMAS"));
			}
			
			
			if (!plnList.isEmpty()) {
				ECO016504Message msg = (ECO016504Message) plnList.get(0);
				String fileName = userPO.getID() + "_" + getTimeStamp() + ".xls";
				String excelName = "attachment; filename=\"" + fileName + "\"";
				res.setContentType("application/vnd.ms-excel");			
				res.setHeader("Content-disposition", excelName);
				
				Vector fields = new Vector();
				Enumeration enu = msg.fieldEnumeration();
				while (enu.hasMoreElements()) {
					MessageField field = (MessageField) enu.nextElement();
					String name = field.getTag();
					if ("USUARIO".equals(name) || "FLAGMAS".equals(name)) continue;
					ExcelColStyle style = new ExcelColStyle();
					style.setName(name);
					style.setHidden(false);
					style.setLocked(false);
					fields.add(style);
				}
				OutputStream out = ExcelUtils.getWorkBook(res.getOutputStream(), fields, plnList, false);
				out.flush();
			}	
				
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionCovenantList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String number = req.getParameter("customer_number") == null ? "0" : req.getParameter("customer_number");
		userPO.setCusNum(number);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECO0165", req);
			ECO016501Message msgList = (ECO016501Message) mp.getMessageRecord("ECO016501", user.getH01USR(), "0015");
			msgList.setE01SELECU(userPO.getCusNum());
			
			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("ECO0165_client_employer_search.jsp", req, res);
			} else {
				ECO016500Message header = (ECO016500Message) list.get(0);
				userPO.setCusNum(header.getE00PLHECU());
				userPO.setID(header.getE00PLHEID());
				userPO.setCusName(header.getE00PLHENM());
				session.setAttribute("userPO", userPO);
				
				list.remove(0);
				session.setAttribute("list", list);
				forward("ECO0165_covenant_list.jsp", req, res);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqCovenantList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		forward("ECO0165_client_employer_search.jsp", req, res);
	}

}

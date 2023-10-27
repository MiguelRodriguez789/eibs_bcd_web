package datapro.eibs.products;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.facade.FAReports;
import com.datapro.eibs.reports.vo.IFSFILES;

import datapro.eibs.beans.EGL810001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEGL8100 extends JSEIBSServlet {

	protected static final int R_REQ_FILE = 100;
	protected static final int A_PROCESS_FILE = 200;
	protected static final int A_VIEW_FILE = 300;

	private ServletConfig config = null;
	
	protected static final int cellDate = 6;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}
	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		case R_REQ_FILE :
			procReqFile(user, req, res, session);
			break;
		case A_PROCESS_FILE :
			procFile(user, req, res, session);
			break;
		case A_VIEW_FILE :
			viewFile(user, req, res, session);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private boolean isReportReady(ESS0030DSMessage user, EGL810001Message msg, HttpServletResponse res) throws ServletException, IOException {
		
		boolean result = false;
		System.out.println("Connecting to IBS via jdbc.cnx.driver.eibs-server...");
		BufferedOutputStream output = null;
		FAReports facade = null;
		try {
			facade = new FAReports();
			IFSFILES vo = facade.getIFSFiles(msg.getH01PROGRM(), msg.getH01USERID(), msg.getE01JOBNUM(), msg.getBigDecimalE01SEQ());
			
			if (vo.getBINFILE() != null && vo.getFEXT() != null) {
				byte buf[] = vo.getBINFILE();				
				String type = vo.getFEXT().trim().toLowerCase();
				String name = user.getE01BI2() + msg.getE01YEAR() + Util.addLeftChar('0', 2, msg.getE01MONTH()) + msg.getH01SCRCOD() + "." + type;
				sendResponse(res, buf, name);
				result = true;
			}
				
		} catch (ItemNotFoundException e) {
			result = false;
		} catch (FacadeException e) {
			e.printStackTrace();
			flexLog("FacadeException ocurred. Exception = " + e.getMessage());
			throw new ServletException(e);
		} finally {
			if (output != null) output.close();
		}
		return result;
	}
	
	protected void setResponseHeader(HttpServletResponse response, String name) throws IOException {
		StringBuffer sbContentDispValue = new StringBuffer();
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);
		response.addHeader("Cache-Control", "max-age=0");
		response.addHeader("Cache-Control", "s-maxage=0");

	    response.setContentType("text/xml");
	    sbContentDispValue.append("inline; filename=");
	    sbContentDispValue.append(name);
	    response.setHeader("Content-disposition", sbContentDispValue.toString());
	}
	
	
	private void viewFile(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		EGL810001Message repInfo = (EGL810001Message) session.getAttribute("repInfo");
		
		if (!isReportReady(user, repInfo, res)) {
			ELEERRMessage msgError = new ELEERRMessage();
			msgError.setERWRNG("Y");
			msgError.setERRNUM("1");
			msgError.setERNU01("9999");
			msgError.setERDS01("Esperar!!");
			session.setAttribute("error", msgError);
			forward("error_viewer.jsp", req, res);
		}
		
	}
	
	private void procReqFile(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String option = "";
		try {
			option = req.getParameter("OPTION").trim();
		} catch (Exception e) {
			option = "XX";
		}
		userPO.setOption(option);
		
		EGL810001Message repInfo = new EGL810001Message();
		repInfo.setH01USERID(user.getH01USR());
		repInfo.setH01PROGRM("EGL8100");
		repInfo.setH01TIMSYS(getTimeStamp());
		repInfo.setH01SCRCOD("01");
		repInfo.setE01MONTH(user.getE01RDM());
		repInfo.setE01YEAR(user.getE01RDY());
		
		session.setAttribute("repInfo", repInfo);
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EGL8100_request_file.jsp", req, res);
	}



	private void procFile(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;

    	try {
    		mp = getMessageProcessor("EGL8100", req);
    		EGL810001Message repInfo = (EGL810001Message) mp.getMessageRecord("EGL810001");
    		repInfo.setE01DATA("");
    		repInfo.setH01USERID(user.getH01USR());
    		repInfo.setH01PROGRM("EGL8100");
    		repInfo.setH01TIMSYS(getTimeStamp());
    		repInfo.setH01SCRCOD("01");
    		repInfo.setH01OPECOD("0001");
    		try {
    			repInfo.setE01MONTH(req.getParameter("E01MONTH").trim());
    		} catch (Exception e) {
    			repInfo.setE01MONTH(user.getE01RDM());
    		}
    		try {
    			repInfo.setE01YEAR(req.getParameter("E01YEAR").trim());
    		} catch (Exception e) {
    			repInfo.setE01YEAR("00");
    		}
    		try {
    			repInfo.setE01PRCTYP(req.getParameter("E01PRCTYP").trim());
    		} catch (Exception e) {
    			repInfo.setE01PRCTYP("N");
    		}
    		if (userPO.getOption().equals("CC")) {
    			repInfo.setE01FILE1("Y");
    		} else if (userPO.getOption().equals("BA")) {
    			repInfo.setE01FILE2("Y");
    		} else if (userPO.getOption().equals("PO")) {
    			repInfo.setE01FILE3("Y");
    		} else if (userPO.getOption().equals("FO")) {
    			repInfo.setE01FILE4("Y");
    		} else if (userPO.getOption().equals("AC")) {
    			repInfo.setE01FILE5("Y");
    		}
			
    		mp.sendMessage(repInfo);
    		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
    		repInfo = (EGL810001Message) mp.receiveMessageRecord("EGL810001");
    		
    		if (mp.hasError(msgError)) {
    			pageName = "EGL8100_request_file.jsp";
    		} else {
    			pageName = "EGL8100_confirmation_file.jsp";
    		}

			session.setAttribute("error", msgError);
			session.setAttribute("repInfo", repInfo);
			forward(pageName, req, res);

    	} finally {
    		if (mp != null) mp.close();
    	}
	}
}

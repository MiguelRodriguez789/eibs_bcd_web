package datapro.eibs.products;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import datapro.eibs.beans.EIFS10001Message;
import datapro.eibs.beans.EDL080001Message;
import datapro.eibs.beans.EDL080004Message;
import datapro.eibs.beans.EDL080030Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.sockets.DecimalField;

public class JSEIFS100 extends JSEIBSServlet {

	protected static final int R_REQ_IMPORT = 100;
	protected static final int A_PROCESS_FILE = 200;

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
		SmartUpload mySmartUpload = new SmartUpload();
		mySmartUpload.initialize(config, req, res);

		if (screen != 100) {
			try {
				mySmartUpload.upload();
				screen = Integer.parseInt(mySmartUpload.getRequest().getParameter("SCREEN"));
			} catch (Exception e) {

			}
		}
		if (screen == 1) screen = A_PROCESS_FILE;
			
		switch (screen) {
		case R_REQ_IMPORT :
			procReqImport(user, req, res, session);
			break;
		case A_PROCESS_FILE :
			procReadFile(user, req, res, session, mySmartUpload);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procReqImport(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		MessageProcessor mp = null;
		
		UserPos userPO = getUserPos(req);
		ELEERRMessage msgError = null;
		EIFS10001Message fileInfo = null;

		session.setAttribute("error", msgError);
		session.setAttribute("fileInfo", fileInfo);
		session.setAttribute("userPO", userPO);
		
		forward("EIFS100_upload_file.jsp", req, res);
	}



	private void procReadFile(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, SmartUpload mySmartUpload) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		EIFS10001Message fileInfo = null;
		com.jspsmart.upload.File file =  mySmartUpload.getFiles().getFile(0);
		InputStream inputStream = Util.getStreamFromFile(file);
		byte[] data = new byte[4096];
	    int count = inputStream.read(data);
	    int recCount = 0;
	    mp = getMessageProcessor("EIFS100", req);
	    while(count != -1)
	    {
	    	try {
				fileInfo = (EIFS10001Message) mp.getMessageRecord("EIFS10001");
				fileInfo.setE01DATA("");
				fileInfo.setH01USERID(user.getH01USR());
				fileInfo.setH01PROGRM("EIFS100");
				fileInfo.setH01TIMSYS(getTimeStamp());
				fileInfo.setH01SCRCOD("01");
				fileInfo.setH01OPECOD("0001");
				fileInfo.setE01FILE(file.getFileName());
				fileInfo.setE01LENG(String.valueOf(file.getSize()));
				fileInfo.setE01SEQ(String.valueOf(recCount));
				fileInfo.setE01DATA(new String(data,"UTF-8"));
				
				mp.sendMessage(fileInfo);
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
	    	} catch (Exception e) {
	    		
	    	}
	    	data = new byte[4096];
	        count = inputStream.read(data);
	    }
		fileInfo = (EIFS10001Message) mp.getMessageRecord("EIFS10001");
		fileInfo.setE01DATA("");
		fileInfo.setH01USERID(user.getH01USR());
		fileInfo.setH01PROGRM("EIFS100");
		fileInfo.setH01TIMSYS(getTimeStamp());
		fileInfo.setH01SCRCOD("01");
		fileInfo.setH01OPECOD("0001");
		fileInfo.setE01FILE(file.getFilePathName());
		fileInfo.setE01FILE(file.getFileName());
		fileInfo.setE01DATA("");
		fileInfo.setH01FLGMAS("*");
		
		mp.sendMessage(fileInfo);
	    ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
	    EIFS10001Message fileData = (EIFS10001Message) mp.receiveMessageRecord("EIFS10001");
	    session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		session.setAttribute("fileInfo", fileInfo);
		forward("EIFS100_upload_file.jsp", req, res);
	}

}

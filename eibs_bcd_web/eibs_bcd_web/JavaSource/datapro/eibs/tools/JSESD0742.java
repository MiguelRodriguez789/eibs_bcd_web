package datapro.eibs.tools;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD074201Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.services.FTPStdWrapper;
import datapro.eibs.services.FTPWrapper;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESD0742 extends JSEIBSServlet {

	protected static final int R_FORM_DIR_SEARCH	= 100;
	protected static final int R_FORM_DIR_LIST		= 200;
	protected static final int A_FORM_DIR_LIST		= 300;
	protected static final int A_FORM_DIR_MAINT		= 400;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
			case R_FORM_DIR_SEARCH :
				procReqSearchList(user, req, res, session);
				break;
			case R_FORM_DIR_LIST :
				procReqFrmDocList(user, req, res, session);
				break;
			case A_FORM_DIR_LIST :
				procActFrmDocList(user, req, res, session);
				break;
			case A_FORM_DIR_MAINT :
				procActFrmDocMaint(user, req, res, session);
				break;
			default :
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}

	private void procActFrmDocMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0742", req);
			ESD074201Message msg = (ESD074201Message) mp.getMessageRecord("ESD074201");
			msg.setH01USERID(user.getH01USR());
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ESD074201Message) mp.receiveMessageRecord("ESD074201");
			
			if (mp.hasError(msgError)) {
				flexLog("Putting java beans into the session");
				session.setAttribute("msg", msg);
				session.setAttribute("error", msgError);
				forward("ESD0742_form_dir_maintenance.jsp", req, res);
			} else {
				String params = "?SCREEN=" + R_FORM_DIR_LIST;
				params += "&E01APFPRO=" + msg.getE01APFPRO();
				params += "&E01APFFTY=" + msg.getE01APFFTY();
				redirect("datapro.eibs.tools.JSESD0742" + params, res);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActFrmDocList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String option = req.getParameter("opt") == null ? "0005" : req.getParameter("opt");
		int row;
		try {
			row = Integer.parseInt(req.getParameter("ROW"));
		} catch (Exception e) {
			throw new ServletException("No row selected at this time.");
		}
		
		ESD074201Message msg = null;
		if ("0001".equals(option)) {
			msg = new ESD074201Message();
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0742");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD(option);
			msg.setE01APFPRO(req.getParameter("PRODUCT") == null ? "" : req.getParameter("PRODUCT"));
			msg.setE01APFFTY(req.getParameter("TYPE") == null ? "" : req.getParameter("TYPE"));
			
			session.setAttribute("msg", msg);
			procReqFormMaint(user, req, res, session);
		} else if ("0005".equals(option)) {
			JBObjList list = (JBObjList) session.getAttribute("ESD074201Help");
			msg = (ESD074201Message) list.get(row);
			msg.setH01OPECOD(option);
			
			flexLog("Putting java beans into the session");
			session.setAttribute("msg", msg);
			procReqFormMaint(user, req, res, session);
		} else if ("0009".equals(option)) {
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ESD0742", req);
				JBObjList list = (JBObjList) session.getAttribute("ESD074201Help");
				msg = (ESD074201Message) list.get(row);
				msg.setH01OPECOD(option);
				
				mp.sendMessage(msg);
				
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				
				if (mp.hasError(msgError)) {
					session.setAttribute("error", msgError);
					String params = req.getParameter("PRODUCT") == null ? "" : "&PRODUCT=" + req.getParameter("PRODUCT");
					params += req.getParameter("TYPE") == null ? "" : "&TYPE=" + req.getParameter("TYPE");
					String pageName = "ESD0742_form_doc_list.jsp" + params;
					forward(pageName, req, res);
				} else {
					String params = "?SCREEN=" + R_FORM_DIR_LIST;
					params += req.getParameter("PRODUCT") == null ? "" : "&E01APFPRO=" + req.getParameter("PRODUCT");
					params += req.getParameter("TYPE") == null ? "" : "&E01APFFTY=" + req.getParameter("TYPE");
					
					redirect("datapro.eibs.tools.JSESD0742" + params, res);
				}
			
			} finally {
				if (mp != null)	mp.close();
			}
		}
		
	}

	private void procReqFormMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		BeanList dir = new BeanList();
		
		/*
		if (JSEIBSProp.getFtpFormHost().equals("") 
			|| JSEIBSProp.getFtpFormHost().equals("localhost")) {
			File localDir = new File(JSEIBSProp.getFtpPathFormConfig());
			if (localDir.exists()) {
				String[] files = localDir.list(new FilenameFilter(){
					public boolean accept(File dir, String name) {
						return name.toLowerCase().endsWith(".pdf")
							|| name.toLowerCase().endsWith(".doc")
							|| name.toLowerCase().endsWith(".docm")
							|| name.toLowerCase().endsWith(".docx");
					}
				});
				for (int i = 0; i < files.length; i++) {
					dir.addRow(files[i]);						
				}
			} else {
				dir.addRow("No existe configuración de repositorio remoto");
			}
		} else {
			FTPWrapper ftp = null;
			try {
				try {
					ftp = (FTPWrapper) Class.forName(JSEIBSProp.getFtpFormClientClass()).newInstance();
				} catch (Throwable e) {
					ftp = new FTPStdWrapper();
				}
				ftp.setServerName(JSEIBSProp.getFtpFormHost());
				ftp.setUserName(JSEIBSProp.getFtpFormUserID());
				ftp.setPassword(JSEIBSProp.getFtpFormPassword());
				ftp.setLocalPath(JSEIBSProp.getImgTempPath());
				if (ftp.open()) {
					if (ftp.cdRemotePath(JSEIBSProp.getFtpPathFormConfig())) {
						dir = ftp.getWorkDir(".pdf|.doc|.docx|.docm");
					} else {
						dir.addRow("Error ejecutando comando en el servidor remoto");
					}
				} else {
					dir.addRow("Error en connección al respositorio remoto");
				}
			} finally {
				if (ftp != null) ftp.close();
			}
		}
		*/
		session.setAttribute("dir", dir);
		forward("ESD0742_form_dir_maintenance.jsp", req, res);
	}
	
	private void procReqFrmDocList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0742", req);
			ESD074201Message msg = (ESD074201Message) mp.getMessageRecord("ESD074201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			String product = req.getParameter("E01APFPRO") == null ? "" : req.getParameter("E01APFPRO");
			msg.setE01APFPRO(product);
			String type = req.getParameter("E01APFFTY") == null ? "" : req.getParameter("E01APFFTY");
			msg.setE01APFFTY(type);
			
			mp.sendMessage(msg);
			
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			ELEERRMessage msgError = new ELEERRMessage(); 
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0742_form_doc_list.jsp?PRODUCT=" + product + "&TYPE=" + type;
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("ESD074201Help", list);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqSearchList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ESD0742_form_dir_search.jsp", req, res);
	}

}

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
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.services.FTPStdWrapper;
import datapro.eibs.services.FTPWrapper;

public class JSEIBSFormsChecker extends JSEIBSServlet { 
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		
		checkFile(user, req, res, session);
	}

	protected void checkFile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		ELEERRMessage msgError = new ELEERRMessage();
		try {
			if (JSEIBSProp.getFtpFormHost().equals("") 
				|| JSEIBSProp.getFtpFormHost().equals("localhost")) {
				File dir = new File(JSEIBSProp.getFtpPathFormConfig());
				if (dir.exists()) {
					String[] files = dir.list(new FilenameFilter(){
						public boolean accept(File dir, String name) {
							return name.toLowerCase().endsWith(".pdf")
								|| name.toLowerCase().endsWith(".doc")
								|| name.toLowerCase().endsWith(".docm")
								|| name.toLowerCase().endsWith(".docx");
						}
					});
					BeanList list = new BeanList();
					for (int i = 0; i < files.length; i++) {
						list.addRow(files[i]);						
					}
					ses.setAttribute("dir", list);
					forwardOnSuccess("EForms_upload_check.jsp", req, res);
				} else {
					addError(msgError, "", "0001", "NO EXISTE CONFIGURACION DE REPOSITORIO DE FORMULARIOS. Por Favor verifique");
					ses.setAttribute("error", msgError);
					forward("EForms_upload_file.jsp", req, res);
				}
				return;
			}
			
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
				
				if (ftp.open()) {
					if (ftp.cdRemotePath(JSEIBSProp.getFtpPathFormConfig())) {
						BeanList dir = ftp.getWorkDir(".pdf|.doc|.docm|.docx");
						ses.setAttribute("dir", dir);
					}
					forwardOnSuccess("EForms_upload_check.jsp", req, res);
				} else {
					addError(msgError, "", "0001", "NO EXISTE CONEXION AL SERVIDOR DE FORMULARIOS. Por Favor verifique");
					ses.setAttribute("error", msgError);
					forward("EForms_upload_file.jsp", req, res);
				}				
			} finally {
				ftp.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("File Upload Error");
		}
	}

}
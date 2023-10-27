package datapro.eibs.tools;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.datapro.generic.beanutil.BeanList;
import com.jspsmart.upload.SmartUpload;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.Util;
import datapro.eibs.services.FTPStdWrapper;
import datapro.eibs.services.FTPWrapper;

public class JSEIBSFormsUploader extends JSEIBSServlet { 
	
	protected void getScreen(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		forwardOnSuccess("EForms_upload_file.jsp", req, res);
			
	}
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		
		switch (screen) {
			case 2 : 
				uploadBySmart(user, req, res, session, screen);
				break;
			default :
				uploadByApache(user, req, res, session, screen);
				break;
		}
	}

	protected void uploadByApache(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		try {
			if (!ServletFileUpload.isMultipartContent(req)){
				forwardOnSuccess("EForms_upload_file.jsp", req, res);
				return;
			}	
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = upload.parseRequest(req);
			Iterator iter = items.iterator();
			while (iter.hasNext()) {
			    FileItem item = (FileItem) iter.next();
			    if (!item.isFormField()) {
			    	//saveFile(user, req, res, ses, new ByteArrayInputStream(item.get()), item.getName());
			    	saveFile(user, req, res, ses, item.getInputStream(), item.getName());
			    }				
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("File Upload Error");
		}
	}
	
	protected void uploadBySmart(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

		try {
			if (!ServletFileUpload.isMultipartContent(req)){
				forwardOnSuccess("EForms_upload_file.jsp", req, res);
				return;
			}
			SmartUpload mySmartUpload = new SmartUpload();
			mySmartUpload.initialize(getServletConfig(), req, res);
			mySmartUpload.upload();
			
			if ("1".equals(mySmartUpload.getRequest().getParameter("SCREEN"))) {
	    		forwardOnSuccess("EForms_upload_file.jsp", req, res);
	    		return;
			}
			
			com.jspsmart.upload.File file =  mySmartUpload.getFiles().getFile(0);			
			if (file.getSize() > 0) {
				byte[] buffer = new byte[file.getSize()];
				for (int index = 0; index < file.getSize(); index++) {
					buffer[index] = file.getBinaryData(index);
				}
				saveFile(user, req, res, ses, 
					new ByteArrayInputStream(buffer), file.getFileName());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("File Upload Error");
		}
	}
	
	protected void saveFile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, InputStream input, String fileName)
			throws ServletException, IOException {

		ELEERRMessage msgError = new ELEERRMessage();
		try {
			fileName = fileName.indexOf('\\') > 0 ? fileName.substring(
					fileName.lastIndexOf('\\')+1) : 
						(fileName.indexOf('/') > 0 ? fileName.substring(
								fileName.lastIndexOf('/')+1) : fileName);
			fileName = Util.replace(fileName, " ", "_").toUpperCase();
			
			if (JSEIBSProp.getFtpFormHost().equals("") 
				|| JSEIBSProp.getFtpFormHost().equals("localhost")) {
				File dir = new File(JSEIBSProp.getFtpPathFormConfig());
				if (dir.exists()) {
					FileOutputStream out = null;
					try {
						out = new FileOutputStream(new File(dir, fileName));
						copy(input, out);
						out.flush();
					} finally {
						out.close();
					}
					
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
					forwardOnSuccess("EForms_upload_confirm.jsp", req, res);
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
						ftp.setFileType(FTPWrapper.BINARY);
						ftp.upload(input, fileName);
						
						BeanList dir = ftp.getWorkDir(".pdf|.doc|.docm|.docx");
						ses.setAttribute("dir", dir);
					} else {
						addError(msgError, "", "0002", "NO SE ENCONTRO LA RUTA ESPECIFICADA EN EL SERVIDOR REMOTO.");
					}
				} else {
					addError(msgError, "", "0001", "NO EXISTE CONEXION AL SERVIDOR DE FORMULARIOS. Por Favor verifique");
				}
				if (msgError.getBigDecimalERRNUM().intValue() > 0) {
					ses.setAttribute("error", msgError);
					forward("EForms_upload_file.jsp", req, res);
				} else {
					forwardOnSuccess("EForms_upload_confirm.jsp", req, res);				
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
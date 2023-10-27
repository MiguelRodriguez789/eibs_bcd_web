package datapro.eibs.client;

/**
 * Curse
 * Creation date: (03/07/12)
 * @author: JMBE
 */
import java.io.ByteArrayInputStream;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;


import datapro.eibs.beans.ECO021001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.ServiceLocator;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import datapro.eibs.services.FTPStdWrapper;
import datapro.eibs.services.FTPWrapper;

public class JSECO0210 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5374590957161957090L;

	protected static final int R_FILE_ENTER = 100;	
	protected static final int A_FILE_ENTER = 200;
	
	private ServletConfig config = null;	

	/**
	 * Inicializamos e servlet
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		screen =  screen == 1 ? A_FILE_ENTER : screen;
		switch (screen) {
			case R_FILE_ENTER:
				procReqFileEnter(user, req, res, session);
				break;
			case A_FILE_ENTER:
				procActionFileEnter(user, req, res, session);
				break;		
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}
	/**
	 * procReqFileEnter
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqFileEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		forward("ECO0210_cuadratura_enter.jsp", req, res);
	}
	
	
	/**
	 * procActionFileEnter: upload file to as400, then call to CL
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionFileEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {
		MessageProcessor mp = null;
		ELEERRMessage msgError = new ELEERRMessage();
		boolean ok = false;
		SmartUpload mySmartUpload = new SmartUpload();
		com.jspsmart.upload.File myFile = null;
		try {
			mySmartUpload.initialize(config, req, res);
			mySmartUpload.upload();
			myFile = mySmartUpload.getFiles().getFile(0);
			
			if (myFile.getSize() > 0) {
				String fileName=  "CAT" + user.getH01USR().substring(3);//Prefijo del nombre del archivo	
				String library = user.getH01USR().substring(0, 3)+"HIFILES";
				InputStream  input = Util.getStreamFromFile(myFile); 													
				String userid = JSEIBSProp.getFtpImgUserID();
				String password = JSEIBSProp.getFtpImgPassword();												
				FTPWrapper ftp = new FTPStdWrapper(JSEIBSProp.getHostIP(), userid, password, "");
				if (ftp.open()) {
					//Mandamos todos los archivos de IMAGENES
					if (ftp.cdRemotePath(library)) {
						ftp.setFileType(FTPWrapper.ASCII);
						ftp.upload(input,fileName); 
						
						//call to CL				
						try {
							mp = getMessageProcessor("ECO0210", req);					
							ECO021001Message msg = (ECO021001Message) mp.getMessageRecord("ECO021001");
							//seteamos las propiedades
							msg.setH01USERID(user.getH01USR());
							msg.setH01OPECOD("");
							msg.setH01TIMSYS(getTimeStamp());					
							msg.setH01SCRCOD("01");					
							msg.setE01FILENM(fileName);						
							//Sending message
							mp.sendMessage(msg);
							
							msgError = (ELEERRMessage) mp.receiveMessageRecord();
							ok = !mp.hasError(msgError);
						
						} finally {
							if (mp != null)	mp.close();
						}
					}
				} else {
					addError(msgError, "", "0001", "NO EXISTE CONEXION AL SERVIDOR AS400 por FTP. Por Favor verifique");
				}							
				
			} else {
				//mandamos error en session 
				addError(msgError, "", "0002", "Archivo Vacio...");
			}
			
		} catch (Exception e) {
			e.printStackTrace();			
			addError(msgError, "", "0003", e.getClass().getName() + ": " + e.getMessage());
		} 	
		
		if (ok) {									
			forward("ECO0210_cuadratura_process.jsp", req, res);
		} else {
			session.setAttribute("error", msgError);				
			forward("ECO0210_cuadratura_enter.jsp", req, res);
		}
	}
	
 }	




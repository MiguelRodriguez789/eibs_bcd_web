package datapro.eibs.products;

/**
 * Curse
 * Creation date: (03/07/12)
 * @author: JMBE
 */
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.PropertyResourceBundle;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;


import datapro.eibs.beans.ERC100001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.ServiceLocator;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.services.FTPStdWrapper;
import datapro.eibs.services.FTPWrapper;

public class JSERC1000 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5374590957161957090L;

	protected static final int R_BANK_ENTER = 100;	
	protected static final int A_BANK_ENTER = 200;
	
	protected static final int R_BANK_PROCESS_ENTER = 300;	
	protected static final int A_BANK_PROCESS_ENTER = 400;
	
	private ServletConfig config = null;	

	/**
	 * Inicializamos e servlet
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		screen =  A_BANK_ENTER;
		try {
			screen = Integer.parseInt(req.getParameter("SCREEN"));
		} catch (Exception e) {	
			//si da error viene del multipart/form-data
		}		
		switch (screen) {
		case R_BANK_ENTER:
			procReqBankReconciliationEnter(user, req, res, session);
			break;
		case A_BANK_ENTER:
			procActionBankReconciliationEnter(user, req, res, session);
			break;
		case R_BANK_PROCESS_ENTER:
			procReqBankProcessReconciliationEnter(user, req, res, session);
			break;
		case A_BANK_PROCESS_ENTER:
			procActionBankProcessReconciliationEnter(user, req, res, session);
			break;			
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}
	/**
	 * procReqBankReconciliationEnter
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqBankReconciliationEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ERC1000_bank_reconciliation_enter.jsp");
			forward("ERC1000_bank_reconciliation_enter.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	
	protected void procReqBankProcessReconciliationEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ERC1000_bank_reconciliation_enter.jsp");
			forward("ERC1000_bank_process_reconciliation_enter.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	
	/**
	 * procActionBankReconciliationEnter: find the list of forms depending on status, the program will epvl1005
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionBankReconciliationEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		ELEERRMessage msgError = null;
		boolean ok = false;
		try {
			SmartUpload mySmartUpload = new SmartUpload();
			com.jspsmart.upload.File myFile = null;
			try {
				mySmartUpload.initialize(config, req, res);
				mySmartUpload.upload();
				myFile = mySmartUpload.getFiles().getFile(0);
				if (myFile.getSize() > 0) {
					//El archivo tiene datos buscamos el nombre para subir el archivo.					
					mp = getMessageProcessor("ERC1000", req);					
					ERC100001Message msg = (ERC100001Message) mp.getMessageRecord("ERC100001");
					//seteamos las propiedades
					msg.setH01USERID(user.getH01USR());
					msg.setH01OPECOD("0002");
					msg.setH01TIMSYS(getTimeStamp());					
					msg.setH01SCRCOD("01");	
					String E01BRMEID = mySmartUpload.getRequest().getParameter("E01BRMEID");
					String E01BRMCTA = mySmartUpload.getRequest().getParameter("E01BRMCTA");					
					msg.setE01BRMEID(E01BRMEID);//banco
					msg.setE01BRMCTA(E01BRMCTA);//cuenta
					
					//Sending message
					mp.sendMessage(msg);
		
					//Receive error and data
					msgError = (ELEERRMessage) mp.receiveMessageRecord();
					msg = (ERC100001Message) mp.receiveMessageRecord();		
					
					session.setAttribute("bank", msg);
					
					//havent errors i get the field
					if (!mp.hasError(msgError)) {
						String fileName=  msg.getE01BRMFNM();//nombre del archivo					
						byte[] bd = new byte[myFile.getSize()];
						for (int i = 0; i < myFile.getSize(); i++) {
							bd[i] = myFile.getBinaryData(i);
						}
						InputStream  input = new ByteArrayInputStream(bd);	
						String userid = " ";
						String password = " ";
//						userid = ServiceLocator.getSlInfo().getString("jdbc.cnx.userid.eibs-server");
//						password = ServiceLocator.getSlInfo().getString("jdbc.cnx.password.eibs-server");												
 						FTPWrapper ftp = new FTPStdWrapper(JSEIBSProp.getHostIP(), userid, password, "");
						if (ftp.open()) {
								//Mandamos todos los archivos de IMAGENES
								if (ftp.cdRemotePath(user.getH01USR().substring(0, 3)+"HIFILES")) {
									ftp.setFileType(FTPWrapper.ASCII);
									ftp.upload(input,fileName); 
									ok=true;//Aqui nos seguramos que todo esta Bien..
								}
						} else {
							msgError = new ELEERRMessage();
							msgError.setERRNUM("1");
							msgError.setERNU01("01");		                
							msgError.setERDS01("NO EXISTE CONEXION AL SERVIDOR AS400 por FTP. Por Favor verifique");	
						}
					}
					
				}else{
					//mandamos error en session 
					msgError = new ELEERRMessage();
					msgError.setERRNUM(new BigDecimal(1));
					msgError.setERDS01("Archivo Vacio...");							
				}
				
			}catch (Exception e) {
				String className = e.getClass().getName();
				String description = e.getMessage() == null ? "Exception General" : e.getMessage();	
				msgError = new ELEERRMessage();			
				msgError.setERRNUM("3");
	            msgError.setERNU01("01");
	            msgError.setERDS01(className);
	            msgError.setERNU02("02");
	            msgError.setERDS02(description.length() > 70 ? description.substring(0, 70) : description);
	            msgError.setERNU03("03");
	            msgError.setERDS03("Para mas informacion revizar los archivos de log.");
				e.printStackTrace();			
			} 	
			
			if (ok){									
				forward("ERC1000_bank_reconciliation_process.jsp", req, res);
			}else{
				session.setAttribute("error", msgError);				
				forward("ERC1000_bank_reconciliation_enter.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procActionBankProcessReconciliationEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {				
			mp = getMessageProcessor("ERC1000", req);

			ERC100001Message msg = (ERC100001Message) mp.getMessageRecord("ERC100001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0005");
			msg.setH01TIMSYS(getTimeStamp());
			
			//Sets message with page fields
			msg.setH01SCRCOD("01");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERC100001Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("bank", msg);

			if (!mp.hasError(msgError)) {
				forward("ERC1000_bank_process_reconciliation_process.jsp", req, res);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("ERC1000_bank_process_reconciliation_enter.jsp", req, res);
			}


		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
 }	




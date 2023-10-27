package datapro.eibs.products;

/**
 * Registros  de Tarjetas Alianza 
 * Archivo de Tarjetas Alianza para plataforma de venta
 * @author evargas  
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EDL114801Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSEDL1148 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5013250952357918505L;
	protected static final int R_CUPONERA_ENTER = 100;
	protected static final int R_CUPONERA_MAINT = 200;
	protected static final int A_CUPONERA_MAINT = 600;
	
	/**
	 * 
	 */
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		case R_CUPONERA_ENTER:
			procReqCuponeraList(user, req, res, session);
			break;
		case R_CUPONERA_MAINT:
			procReqCuponera(user, req, res, session, "MAINTENANCE");
			break;
		case A_CUPONERA_MAINT:
			procActionMaintenance(user, req, res, session);
			break;
		default:
			forward(SuperServlet.devPage, req, res);
			break;
		}
	}


	/**
	 * procReqTablaSEGUROSList
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqCuponeraList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: EDL1148_cuponera_enter_search.jsp");
			forward("EDL1148_cuponera_enter_search.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	


	/**
	 * procReqTablaseguros: This Method show a single  Tabla Tarjetas Alianza either for 
	 * 					a new register, a maintenance or an inquiry. 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqCuponera(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("EDL1148", req);
			userPO.setPurpose(option);
			
			//Creates the message with operation code depending on the option
			EDL114801Message msg = (EDL114801Message) mp.getMessageRecord("EDL114801");
			msg.setH01USERID(user.getH01USR());
			msg.setH01TIMSYS(getTimeStamp());
			if (option.equals("NEW")) {
				msg.setH01OPECOD("0001");
			} else if (option.equals("MAINTENANCE")) {
				msg.setH01OPECOD("0002");
			} else {
				msg.setH01OPECOD("0004");
			}
			
			
			//Sets the number for maintenance and inquiry options
			msg.setE01DEAACC(req.getParameter("E01DEAACC").trim());

			//Send message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (EDL114801Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("datarec", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go to maintenance page
				flexLog("About to call Page: EDL1148_cuponera_maintenance.jsp");
				if (option.equals("INQUIRY")) {
					// if the request is an inquiry sets the readOlnly attribute 'true'
					forward("EDL1148_cuponera_maintenance.jsp?readOnly=true", req, res);
				} else {
					forward("EDL1148_cuponera_maintenance.jsp", req, res);
				}
			} else {
				//if there are errors go back to list page
				session.setAttribute("error", msgError);
				forward("EDL1148_cuponera_enter_search.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/**
	 * procActionMaintenance
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("EDL1148", req);

			EDL114801Message msg = (EDL114801Message) mp.getMessageRecord("EDL114801");
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
			msg = (EDL114801Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("datarec", msg);
			
			if (!mp.hasError(msgError)) {
				forward("EDL1148_cuponera_enter_search.jsp", req, res);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("EDL1148_cuponera_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}


}



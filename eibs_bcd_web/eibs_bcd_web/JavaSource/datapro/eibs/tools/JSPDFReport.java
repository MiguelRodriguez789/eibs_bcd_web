/*
 * Created on Jul 23, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.tools;

import java.io.BufferedOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.facade.FAReports;
import com.datapro.eibs.reports.vo.IFSFILES;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0900DSMessage;
import datapro.eibs.master.JSEIBSServlet;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSPDFReport extends JSEIBSServlet {

	protected static final int R_IMAGE = 1;
	protected static final int A_IMAGE = 2;
	
	/* (non-Javadoc)
	 * @see datapro.eibs.master.JSEIBSServlet#processRequest(datapro.eibs.beans.ESS0030DSMessage, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpSession, int)
	 */
	protected void processRequest(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session,
		int screen)
		throws ServletException, IOException  {

			switch (screen) {
				case R_IMAGE :
					forward("image_viewer_blank.jsp", req, res);
				case A_IMAGE :
					procGetImageJDBC(user, req, res, session);
					break;					
				default :
					forward(devPage, req, res);
					break;
			}

	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procGetImageJDBC(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		EWD0900DSMessage msgList = (EWD0900DSMessage) session.getAttribute("REPORT");
		if (msgList == null) {
			ELEERRMessage msgError = new ELEERRMessage(); 
			msgError.setERRNUM("1");
			msgError.setERNU01("9999");
			msgError.setERDS01("Report Name missing...");
		} else {
			BufferedOutputStream output = null;
			FAReports facade = null;
			try {
				facade = new FAReports();
				String reportUser = msgList.getSWDSRD().endsWith("SOCKETS") ? msgList.getSWDNAM() : msgList.getSWDSRD();
				IFSFILES vo = facade.getIFSFiles(msgList.getSWDFIL(), reportUser, msgList.getSWDNUM(), msgList.getBigDecimalSWDPLN());
				
				if (vo.getBINFILE() != null && vo.getFEXT() != null) {
					byte buf[] = vo.getBINFILE();
					String type = vo.getFEXT().trim().toLowerCase();
					String name = msgList.getSWDFIL() + "." + type;
					sendResponse(res, buf, name);
				} else {
					forward("MISC_no_result.jsp", req, res);
				}
				
			} catch (FacadeException e) {
				e.printStackTrace();
				flexLog("FacadeException ocurred. Exception = " + e.getMessage());
				throw new ServletException(e);
			} catch (ItemNotFoundException e) {
				forward("MISC_no_result.jsp", req, res);
			} finally {
				if (output != null) output.close();
			}
		}
	}

}

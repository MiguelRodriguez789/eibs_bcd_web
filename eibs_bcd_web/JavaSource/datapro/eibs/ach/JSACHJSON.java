package datapro.eibs.ach;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0005DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSACHJSON extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0005", req);
			EWD0005DSMessage msgHelp = (EWD0005DSMessage) mp.getMessageRecord("EWD0005DS");
	        msgHelp.setEWDUSR(user.getH01USR());
	        msgHelp.setEWDSHR("");
	        msgHelp.setEWDSBK("Y".equals(user.getE01SEC()) ? user.getE01UBK() : "");
	        msgHelp.setEWDSCA("RT");
	        msgHelp.setEWDTYP("A");
	        msgHelp.setEWDSEL("");
	        try {
		        msgHelp.setEWDREC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
		        msgHelp.setEWDREC("0");
			}
	        //search by Account
	        try {
	            msgHelp.setEWDACC(req.getParameter("shrAcc").trim());
	        } catch (Exception e) {
	            msgHelp.setEWDACC("0");
	        }
	        
	        mp.sendMessage(msgHelp);
	        JBObjList list =  mp.receiveMessageRecordList("EWDOPE", "EWDREC");
	        
	        if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
	        } else {
	        	sendJsonData(list, req, res);
	        }
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void sendJsonData(JBObjList list, HttpServletRequest req,
			HttpServletResponse res) throws IOException {
		StringBuffer bf = new StringBuffer();
		int counter = 0;
		if (list.isEmpty()) {
			bf.append("{\"errmsg\":\"No hay resultados para su busqueda.\"}");
		} else {
			list.initRow();
			while (list.getNextRow()) {
				MessageRecord msg = (MessageRecord) list.getRecord();
				if ("R".equals(msg.getField("EWDUTY").getString())) {
					Enumeration enu = msg.fieldEnumeration();
					bf.append("{");
					boolean first = true;
					while (enu.hasMoreElements()) {
						MessageField field = (MessageField) enu.nextElement();
						bf.append((first ? "\"" : ",\"") + field.getTag() + "\":\"" + Util.escapeJson(field.getString()) + "\"");
						first = false;
					}
					bf.append("}");
					counter++;
				}
			}
			if (counter == 0) {
				bf.append("{\"errmsg\":\"No existe titular definido en esta cuenta.\"}");
			}	
		}
		if (counter > 1) {
			bf = new StringBuffer();
			bf.append("{\"errmsg\":\"Existe mas de un titular definido en esta cuenta.\"}");
		}
		sendJSONResponse(res, bf.toString());
	}

}
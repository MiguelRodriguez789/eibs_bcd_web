package datapro.eibs.helps;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: fhernandez
 */
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0002DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSCNOFCodes extends JSEIBSServlet {
	
	protected void processRequest(ESS0030DSMessage user,
		HttpServletRequest request, HttpServletResponse response,
		HttpSession session, int screen) throws ServletException,
		IOException {
		
		StringBuffer xmlResponse = new StringBuffer();
		//xmlResponse.append("<CNOFC>");
		String table = request.getParameter("table");
		String nameId = request.getParameter("nameId");
		if (table != null && !table.equals("")
			&& nameId != null && !nameId.equals("")) {
			try {
				MessageProcessor mp = new MessageProcessor("EWD0002");
				EWD0002DSMessage message = (EWD0002DSMessage) mp.getMessageRecord("EWD0002DS");
				
				try {
					message.setEWDTBL(table.toUpperCase());
				} catch (Exception e){
				}
				try {
					message.setEWDMID(request.getParameter("filter1").toUpperCase());
				} catch (Exception e){
				}
				try {
					message.setEWDMIC(request.getParameter("filter2").toUpperCase());
				} catch (Exception e){
				}
				mp.sendMessage(message);
				JBObjList list = mp.receiveMessageRecordList("EWDOPE");
				
				//Map select = new HashMap();
	        	xmlResponse.append("<select id=\"" + nameId + "\" name=\"" + nameId + "\">");
				if (!mp.hasError(list)) {
					boolean isGroup = false;					
					//Iterator it = Util.sortByField(list, "EWDDSC").listIterator();
					Iterator it = list.listIterator();
					while (it.hasNext()) {
						EWD0002DSMessage newmessage = (EWD0002DSMessage) it.next();
						String code = newmessage.getEWDCOD().trim();
						String desc = newmessage.getEWDDSC().trim();
						//select.put(code, desc);
						
						if (!isGroup && code.equals("")) {
							isGroup = true;
				        	xmlResponse.append("<optgroup label=\"" + desc + " ("+table.toUpperCase()+")"+ "\">");
		                    //xmlResponse.append("<option value=\"" + code + "\">" + "</option>");
						} else {
							xmlResponse.append("<option value=\"" + code + "\">" + desc + "</option>");
						}
					}
                    xmlResponse.append("<option value=\"\">" + "</option>");
					if (isGroup) {
						isGroup = false;
						xmlResponse.append("</optgroup>");
					}
				}
				xmlResponse.append("</select>");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//xmlResponse.append("</CNOFC>");
		//sendXMLResponse(response, Util.escapeString(xmlResponse.toString(), false, true));
		sendXMLResponse(response, xmlResponse.toString());
	}

}
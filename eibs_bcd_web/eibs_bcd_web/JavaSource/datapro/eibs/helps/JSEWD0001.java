package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0001RMessage;
import datapro.eibs.beans.EWD0001SMessage;
import datapro.eibs.beans.IdentificationData;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0001 extends JSEIBSServlet {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0001", req);
			EWD0001RMessage msgHelp = (EWD0001RMessage) mp.getMessageRecord("EWD0001R");
			msgHelp.setRWDUSR(user.getH01USR());
			
			setMessageField(msgHelp, "RWDTYP", req.getParameter("Type"));
			setMessageField(msgHelp, "RWDFRC", req.getParameter("FromRecord"));
			setMessageField(msgHelp, "RWDSEL", req.getParameter("CusType"));
			if (msgHelp.getRWDTYP().equals("I")) {
				IdentificationData idData = new IdentificationData(
					req.getParameter("NameSearch"), 
					req.getParameter("country") == null ? user.getE01CTR() : req.getParameter("country"), 
					req.getParameter("legalType") == null ? "" : req.getParameter("legalType"));
				setMessageField(msgHelp, "RWDSHR", idData.getIdentification());
			} else {
				setMessageField(msgHelp, "RWDSHR", req.getParameter("NameSearch"));
			}
			
			req.setAttribute("NameSearch", msgHelp.getRWDSHR());
			req.setAttribute("Type", msgHelp.getRWDTYP());
			req.setAttribute("CusType", msgHelp.getRWDSEL());
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					EWD0001SMessage msgHelpS = (EWD0001SMessage) list.getRecord();
					
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelpS.getSWDCUN()
							+ "','"
							+ Util.formatJavascript(msgHelpS.getField("SWDNA1"))
							+ "','"
							+ msgHelpS.getSWDIDN()
							+ "','"
							+ msgHelpS.getSWDTID()							
							+ "')\">"
							+ msgHelpS.getSWDCUN()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelpS.getSWDCUN()
							+ "','"
							+ Util.formatJavascript(msgHelpS.getField("SWDNA1"))
							+ "','"
							+ msgHelpS.getSWDIDN()
							+ "','"
							+ msgHelpS.getSWDTID()							
							+ "')\">"
							+ msgHelpS.getSWDNA1()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelpS.getSWDCUN()
							+ "','"
							+ Util.formatJavascript(msgHelpS.getField("SWDNA1"))
							+ "','"
							+ msgHelpS.getSWDIDN()
							+ "','"
							+ msgHelpS.getSWDTID()							
							+ "')\">"
							+ msgHelpS.getSWDIDN()
							+ "</a></td>");
					myRow.append(
						"<td nowrap><a href=\"javascript:enter('"
							+ msgHelpS.getSWDCUN()
							+ "','"
							+ Util.formatJavascript(msgHelpS.getField("SWDNA1"))
							+ "','"
							+ msgHelpS.getSWDIDN()
							+ "','"
							+ msgHelpS.getSWDTID()							
							+ "')\">"
							+ msgHelpS.getSWDLGT()
							+ "</a></td>");
					myRow.append(
							"<td nowrap><a href=\"javascript:enter('"
								+ msgHelpS.getSWDCUN()
								+ "','"
								+ Util.formatJavascript(msgHelpS.getField("SWDNA1"))
								+ "','"
								+ msgHelpS.getSWDIDN()
								+ "','"
								+ msgHelpS.getSWDTID()							
								+ "')\">"
								+ (msgHelpS.getSWDSTS().equals("1") ? "Inactivo" : 
									(msgHelpS.getSWDSTS().equals("2") ? "Activo" : 
									(msgHelpS.getSWDSTS().equals("3") ? "Bloqueado" :
									(msgHelpS.getSWDSTS().equals("4") ? "Fallecido" :	
									(msgHelpS.getSWDSTS().equals("0") ? "Prospecto" :
									(msgHelpS.getSWDSTS().equals("E") ? "Entidad" :
									(msgHelpS.getSWDSTS().equals("P") ? "Por Aprobar" : ""))))))).toUpperCase()
								+ "</a></td>");

					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("ewd0001Help", beanList);
				pageName = "EWD0001_client_desc_id_help_helpmessage.jsp";
			}	
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}

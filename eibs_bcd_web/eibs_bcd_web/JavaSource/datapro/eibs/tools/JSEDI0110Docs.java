package datapro.eibs.tools;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: fhernandez
 */
import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDI011002Message;
import datapro.eibs.beans.EDL080002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBImageDetail;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.Util;

public class JSEDI0110Docs extends JSEDI0110 {
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session, int screen) throws ServletException,
			IOException {
		if ("true".equals(request.getParameter("XML"))) {
			getXmlResponse(user, request, response, session, screen);
		} else {
			forwardToPage(user, request, response, session, screen);
		}
	}
	
	protected void getXmlResponse(ESS0030DSMessage user,
		HttpServletRequest request, HttpServletResponse response,
		HttpSession session, int screen) throws IOException {
		
		String row = request.getParameter("ROW");
		
		JBObjList lstDocuments =  (JBObjList) session.getAttribute("lstDocuments");
		EDL080002Message doc = (EDL080002Message) lstDocuments.get(Util.parseInt(row));
		session.setAttribute("dftDoc", doc);
		if (row != null && !row.equals("")) {
			getXmlResponse(user, request, response, session, doc.getE02DLDNLN(), doc.getE02DLDNDR());
		} else {
			//sendXMLResponse(response, "");
		}
	}
	
	
	protected JBObjList getList(ESS0030DSMessage user,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session, String row) throws IOException {
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		JBObjList lstDocuments =  (JBObjList) session.getAttribute("lstDocuments");
		EDL080002Message doc = (EDL080002Message) lstDocuments.get(Util.parseInt(row));
		session.setAttribute("dftDoc", doc);
		if (userPO.getProdCode() == null || userPO.getProdCode().equals("")) {
			userPO.setProdCode(userPO.getHeader1());
		}
		if (userPO.getCusNum() == null || userPO.getCusNum().equals("")) {
			userPO.setCusNum(userPO.getHeader2());
		}
		if (userPO.getCusName() == null || userPO.getCusName().equals("")) {
			userPO.setCusName(userPO.getHeader3());
		}		
		if (row != null && !row.equals("")) {
			return getList(user, request, response, session, doc.getE02DLDNLN(), doc.getE02DLDNDR());
		}
		return new JBObjList();
	}
	
	protected void forwardToPage(ESS0030DSMessage user,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session, int screen) throws IOException, ServletException {
		getList(user, request, response, session, request.getParameter("ROW"));
		//addDoc(user, new EDI011002Message(), request, response, session);
		forward("EDI0110_doc_list.jsp", request, response);
	}	


}
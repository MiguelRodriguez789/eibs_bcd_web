/*
 * Created on Jan 23, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.tools;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.facade.FAImage;
import com.datapro.eibs.images.key.SCNDOCTBLKEYViewLastSequence;
import com.datapro.eibs.images.vo.SCNIMGView;
import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.BeanDynaTable;
import datapro.eibs.beans.EDI011002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBImageData;
import datapro.eibs.beans.JBImageDetail;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author fhernandez
 *
 */
public class JSEDI0110 extends JSEIBSServlet {

	// Options
	protected static final int R_DOCUMENT 		= 1;
	protected static final int R_DOCUMENTS_LIST = 2;
	protected static final int A_DOCUMENTS_LIST = 3;
	protected static final int R_DOCUMENT_ADD 	= 4;
	protected static final int A_DOCUMENT_ADD 	= 5;
	protected static final int R_DOCUMENTS = 6;
	protected static final int A_DOCUMENTS = 7;
	
	protected static final int R_DOC_DELETE = 8;
	protected static final int A_VIEW_IMG = 9;
	
	protected static final int A_IMAGE_SCAN = 10;
	protected static final int A_IMAGE_VIEW = 11;
	protected static final int A_IMAGE_DELETE = 12;
	
	/* (non-Javadoc)
	 * @see datapro.eibs.master.JSEIBSServlet#processRequest(datapro.eibs.beans.ESS0030DSMessage, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpSession, int)
	 */
	protected void processRequest(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session,
		int screen)
		throws ServletException, IOException {

			switch (screen) {
				case R_DOCUMENT :
					reqDocFromList(user, req, res, session);
					break;
				case R_DOCUMENTS_LIST :
					reqDocList(user, req, res, session);
					break;
				case A_DOCUMENTS_LIST :
					actionDocList(user, req, res, session);
					break;
				case R_DOCUMENT_ADD:
					reqDocAdd(user, req, res, session);
					break;
				case A_DOCUMENT_ADD:
					actDoc(user, req, res, session);
					break;
				case R_DOCUMENTS :
					reqImagesList(user, req, res, session);
					break;
				case A_IMAGE_SCAN :
					actScan(user, req, res, session);
					break;
				case A_IMAGE_VIEW :
					actView(user, req, res, session);
					break;
				case R_DOC_DELETE :
					reqDocDelete(req.getParameter("CODE"), res);
					break;	
				default :
					forward("MISC_not_available.jsp", req, res);
					break;
			}
	}
	
	protected void getXmlResponse(ESS0030DSMessage user,
		HttpServletRequest request, HttpServletResponse response,
		HttpSession session, String account, String reference) throws IOException {
			
		StringBuffer xmlResponse = new StringBuffer();
		String group = request.getParameter("GROUP");
		String nameId = group;
			
		JBObjList list = getList(user, request, response, session, account, reference);

       	xmlResponse.append("<table style=\"background-color: #FFFFFF;\" width=\"50%\" " +
       			"id=\"idTb" + nameId + "\" name=\"idTb" + nameId + "\">");
		if (!list.isEmpty()) {
			list.initRow();
			while (list.getNextRow()) {
				EDI011002Message newmessage = (EDI011002Message) list.getRecord();
				String jScript = "javascript:showRow('/servlet/datapro.eibs.tools.JSEDI0110?REFERENCE="+ reference + "', 1, " + list.getCurrentRow() + ")";
				xmlResponse.append("<tr>");
				xmlResponse.append("<td width=\"5%\"><a href=\"" + jScript + "\">" + newmessage.getE02DIDDRQ() + "</a></td>");
				xmlResponse.append("<td width=\"20%\"><a href=\"" + jScript + "\">" 
						+ newmessage.getE02DIDIS1() + "/" + newmessage.getE02DIDIS2() + "/" + newmessage.getE02DIDIS3() + "</a></td>");
				xmlResponse.append("<td><a href=\"" + jScript + "\">" + newmessage.getE02DIDDES() + "</a></td>");
				xmlResponse.append("</tr>");
			}
		} else {
			xmlResponse.append("<tr>");
			xmlResponse.append("<td>No existe Informacion Relacionada</td>");
			xmlResponse.append("</tr>");
		}
		xmlResponse.append("</table>");
		sendXMLResponse(response, xmlResponse.toString());
	}
	
	protected JBObjList getList(ESS0030DSMessage user,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session, String account, String reference) throws IOException {
		JBImageDetail imageHeader = new JBImageDetail();
		session.setAttribute("imageHeader", imageHeader);
		imageHeader.setNUMBER(account);
		imageHeader.setREFERENCE(reference);
		
		JBImageDetail imageElement = (JBImageDetail) session.getAttribute("imageElement"+reference);
		if (imageElement == null) {
			imageElement = new JBImageDetail();
		}
		session.setAttribute("imageElement"+reference, imageElement);
		imageElement.setRECORDTYPE("F");
		imageElement.setTABLE("01");
		imageElement.setSEQUENCE(new BigDecimal("1"));
		imageElement.setNUMBER(account);
		imageElement.setREFERENCE(reference);
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EDI0110");
			EDI011002Message message = (EDI011002Message) mp.getMessageRecord("EDI011002");
			message.setH02USERID(user.getH01USR());
			message.setH02PROGRM("EDI0110");
			message.setH02TIMSYS(getTimeStamp());
			message.setH02OPECOD("0015");
			
			try {
				message.setE02SELACC(account);
			} catch (Exception e){
			}
			try {
				message.setE02SELNDR(reference);
			} catch (Exception e){
			}

			mp.sendMessage(message);
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				list.remove(0);
			} else {
				session.setAttribute("lstScanDocuments"+reference, list);
				session.setAttribute("lstScanDocuments", list);
			}
			return list;
		
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (mp != null) mp.close();
		}
	}	
	
	protected void reqDocsAdd(ESS0030DSMessage user,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException, ServletException {
		
	}	
	
	protected void reqDocList(ESS0030DSMessage user,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException, ServletException {
		getList(user, request, response, session, request.getParameter("ACCOUNT"), request.getParameter("REFERENCE"));
		forward("EDI0110_doc_list.jsp", request, response);
	}	
	
	protected EDI011002Message addDoc(ESS0030DSMessage user, EDI011002Message scanDoc, 
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {
			JBImageDetail imageHeader = (JBImageDetail) session.getAttribute("imageHeader");
			
			scanDoc.setE02DIDACC(imageHeader.getNUMBER());
			scanDoc.setE02DIDNDR(imageHeader.getREFERENCE());
			//scanDoc.setE02DIDACT(imageHeader.getRECORDTYPE());
			//scanDoc.setE02DIDTNU(imageHeader.getTABLE());
			//scanDoc.setE02DIDSEQ(imageHeader.getSEQUENCE());
			scanDoc.setE02DIDIS1(user.getBigDecimalE01RDD());
			scanDoc.setE02DIDIS2(user.getBigDecimalE01RDM());
			scanDoc.setE02DIDIS3(user.getBigDecimalE01RDY());
			scanDoc.setE02DIDADD(imageHeader.getRECORDTYPE() + "_"
				+ imageHeader.getNUMBER() + "_" 
				+ imageHeader.getTABLE() + "_"
				+ imageHeader.getREFERENCE());
			
			//scanDoc.setE02DIDDSQ(scanDoc.getBigDecimalE02DIDDSQ().add(new BigDecimal("1")));
			//scanDoc.setE02DIDPAG(scanDoc.getBigDecimalE02DIDPAG().add(new BigDecimal("1")));
			
			return scanDoc;
		}
	
	private void actionDocList(ESS0030DSMessage user,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException, ServletException {
		MessageProcessor mp = null;
		try {
			BeanDynaTable formList = new BeanDynaTable();
			formList.retrieveDyntableFields(request, "scanDoc_", EDI011002Message.class);
	
			mp = new MessageProcessor(getMessageHandler("EDI0010"));
			formList.initRow();
			while (formList.getNextRow()) {
				EDI011002Message scanDoc = (EDI011002Message) formList.getRecord();
				scanDoc.setH02OPECOD("0005");
				scanDoc.setH02USERID(user.getH01USR());
				scanDoc.setH02TIMSYS(getTimeStamp());
				scanDoc.setE02DIDDRQ(new BigDecimal(formList.getCurrentRow()));
				addDoc(user, scanDoc, request, response, session);
				mp.sendMessage(scanDoc);
				MessageRecord newmessage = mp.receiveMessageRecord();
				
				if (mp.hasError(newmessage)) {
					session.setAttribute("error", newmessage);
					forward("EDI0110_doc_list.jsp", request, response);
					return;
				}
			}
			printClose(response.getWriter());
		
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	private void reqDocAdd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String reference = req.getParameter("REFERENCE");
		String row = req.getParameter("ROW");
		JBObjList lstScanDocuments =  (JBObjList) session.getAttribute("lstScanDocuments"+reference);
		EDI011002Message scanDoc = null;
		if (row != null && lstScanDocuments.size() != 0) {
			scanDoc = (EDI011002Message) lstScanDocuments.get(Util.parseInt(row));
		} else {
			scanDoc = new EDI011002Message();
		}
		session.setAttribute("scanDoc", 
			addDoc(user, scanDoc, req, res, session));
		forward("EDI0110_doc_add.jsp", req, res);
	}
	
	private void actDoc(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		ELEERRMessage msgError = new ELEERRMessage();
		session.setAttribute("error", msgError);
		
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EWD0002");
			EDI011002Message scanDoc = (EDI011002Message) session.getAttribute("scanDoc");
			setMessageRecord(req, scanDoc);

			scanDoc.setH02OPECOD("0005");
			scanDoc.setH02USERID(user.getH01USR());
			scanDoc.setE02DIDIS1(user.getBigDecimalE01RDD());
			scanDoc.setE02DIDIS2(user.getBigDecimalE01RDM());
			scanDoc.setE02DIDIS3(user.getBigDecimalE01RDY());
			mp.sendMessage(scanDoc);
			
			MessageRecord newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				session.setAttribute("error", newmessage);
				forward("EDI0110_doc_add.jsp?ADD=true", req, res);
			} else {
				JBObjList lstScanDocuments =  (JBObjList) session.getAttribute("lstScanDocuments"+scanDoc.getE02DIDNDR());
				lstScanDocuments.add(scanDoc);
				forward("EDI0110_doc_list.jsp", req, res);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	private BeanList getImagesList(ESS0030DSMessage user, HttpServletRequest request, HttpServletResponse response, HttpSession session) 
		throws ServletException {
		try {
			String reference = request.getParameter("REFERENCE");
			JBImageDetail imageElement = (JBImageDetail) session.getAttribute("imageElement"+reference);
			FAImage facade = new FAImage();
			BeanList list = facade.getDocTableList(
				imageElement.getRECORDTYPE(), imageElement.getNUMBER(), imageElement.getTABLE(), imageElement.getREFERENCE());
			session.setAttribute("imagesList"+imageElement.getREFERENCE(), list);
			return list;
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
	
	protected void reqImagesList(ESS0030DSMessage user,
		HttpServletRequest request, HttpServletResponse response,
		HttpSession session) throws IOException, ServletException {
				
		BeanList list = getImagesList(user, request, response, session);		
		if ("true".equals(request.getParameter("XML"))) {
			StringBuffer xmlResponse = new StringBuffer();
			String group = request.getParameter("GROUP");
			String nameId = group;
			
	      	xmlResponse.append("<table style=\"background-color: #FFFFFF;\" width=\"100%\" " +
	      			"id=\"idTb" + nameId + "\" name=\"idTb" + nameId + "\">");
			if (!list.isEmpty()) {
				list.initRow();
				while (list.getNextRow()) {
					SCNIMGView vo = (SCNIMGView) list.getRecord();				
					String extTemp = vo.getTBLDSC().substring(vo.getTBLDSC().lastIndexOf(".")).toLowerCase();
					String jScript = "CenterWindow('" +request.getContextPath()+ "/pages/s/ViewerActiveForm.jsp?TYPE=" + extTemp + "&PAGE_NAME=" + vo.getTBLUID() + "&IMG_SIZE=" + vo.getIMGLEN()
						+ "','800','600',2)";
					xmlResponse.append("<tr>");
					xmlResponse.append("<td><a href=\"" + jScript + "\">" + vo.getTBLDSC().trim() + "</a></td>");
					xmlResponse.append("<td><a href=\"" + jScript + "\">" + vo.getTBLLMM() + "/" + vo.getTBLLMD() + "/" + vo.getTBLLMY() + "</a></td>");
					xmlResponse.append("<td><a href=\"" + jScript + "\">" + vo.getTBLSSQ() + "</a></td>");
					xmlResponse.append("</tr>");
				}
			} else {
				xmlResponse.append("<tr>");
				xmlResponse.append("<td>No existen imágenes relacionadas </td>");
				xmlResponse.append("</tr>");
			}
			xmlResponse.append("</table>");
			sendXMLResponse(response, xmlResponse.toString());
		} else {
			actScan(user, request, response, session);
		}
	}
	
	private void reqDocFromList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		String reference = req.getParameter("REFERENCE");
		String row = req.getParameter("ROW");
		JBObjList lstScanDocuments =  (JBObjList) session.getAttribute("lstScanDocuments"+reference);
		EDI011002Message scanDoc = (EDI011002Message) lstScanDocuments.get(Util.parseInt(row));
		session.setAttribute("scanDoc", scanDoc);

		SCNIMGView vo = new SCNIMGView();
		String extTemp = "";
		BeanList list = getImagesList(user, req, res, session);
		if (!list.isEmpty()) {
			list.setCurrentRow(0);
			vo = (SCNIMGView) list.getRecord();
			extTemp = vo.getTBLDSC().substring(vo.getTBLDSC().lastIndexOf(".")+1).toLowerCase();
		}
		forward("EDI0110_doc_basic.jsp?TYPE=" + extTemp 
				+ "&PAGE_NAME=" + vo.getTBLDSC().trim() + "&IMG_SIZE=" + vo.getIMGLEN(), req, res);
	}
	
	private void actView(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		String reference = req.getParameter("REFERENCE");
		String row = req.getParameter("ROW");
		BeanList list = (BeanList) session.getAttribute("imagesList"+reference);
		list.setCurrentRow(Util.parseInt(row));
		SCNIMGView vo = (SCNIMGView) list.getRecord();
		
		String extTemp = vo.getTBLDSC().substring(vo.getTBLDSC().lastIndexOf(".")).toLowerCase();
		forward("ViewerActiveForm.jsp?TYPE=" + extTemp + "&PAGE_NAME=" + vo.getTBLUID() + "&IMG_SIZE=" + vo.getIMGLEN(), req, res);
	}

	private void actScan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		ELEERRMessage msgError = new ELEERRMessage();
		session.setAttribute("error", msgError);
		
		JBImageData param = new JBImageData();
		try {
			JBImageDetail imageElement = (JBImageDetail) session.getAttribute("imageElement"+req.getParameter("REFERENCE"));
			
			BigDecimal number = new BigDecimal("0");
			try {
				number = new BigDecimal(imageElement.getNUMBER());
			} catch (Exception e) {
			}
			
			String url = null;
			if (JSEIBSProp.getImageRemote()) {
				url = JSEIBSProp.getScanURL();
			} else {
				url = getServerRoot(req) + super.webAppPath + "/servlet/datapro.eibs.tools.JSScanDocDone";
			}
			if (url.indexOf("http://") != 0)
				url = "http://" + url.substring(6);
			param.setUrl(url 
					+ "?USERID="
					+ user.getH01USR()
					+ "&NUMBER="
					+ imageElement.getNUMBER()
					+ "&TYPE="
					+ imageElement.getRECORDTYPE()
					+ "&ADD="
					+ imageElement.getRECORDTYPE() + "_" + imageElement.getNUMBER() + "_" + imageElement.getTABLE() + "_" + imageElement.getREFERENCE()
					+ "&TNU="
					+ imageElement.getTABLE()
					+ "&SEQ="
					+ imageElement.getREFERENCE()
					+ "&DES="
					+ "Como".replace(' ', '^')
					+ "&TYP="
					+ "");
			flexLog("URL -> " + param.getUrl());			
			FAImage facade = new FAImage();
			param.setScreen(2);
			param.setDocument(req.getParameter("Name"));
			
			SCNDOCTBLKEYViewLastSequence key = new SCNDOCTBLKEYViewLastSequence();
			key.setTBLTYP(imageElement.getRECORDTYPE());
			key.setTBLNUM(number);
			key.setTBLTBN(imageElement.getTABLE());
			key.setTBLSEQ(new BigDecimal(imageElement.getREFERENCE()));
			param.setSequence(facade.getDocLastSequence(key).getTBLSSQ().intValue());
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
		session.setAttribute("parameters", param);		
		forward("ScanActiveFormProj1.jsp", req, res);
	}
	
	/**
	 * @param string
	 * @param res
	 */
	private void reqDocDelete(String infoFileName, HttpServletResponse res) throws ServletException {
		if (!JSEIBSProp.getImgToIFS()) {
			FAImage facade = new FAImage();
			String params[] = com.datapro.generic.tool.Util.split(infoFileName, "_");
			try {
				facade.deleteImage(params[0].substring(params[0].length()-1), params[1], params[2], params[3]);
			} catch (FacadeException e) {
				e.printStackTrace();
				flexLog("FacadeException ocurred. Exception = " + e);
				throw new ServletException(e);
			}
		}
	}
}

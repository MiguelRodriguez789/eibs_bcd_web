/*
 * Created on Jan 6, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.tools;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import com.datapro.eibs.facade.FAImage;
import com.datapro.eibs.images.vo.SCNDOCIMG;
import com.datapro.eibs.images.vo.SCNDOCTBL;
import com.datapro.exception.ServiceLocatorException;
import com.datapro.generic.beanutil.DynamicForm;
import com.datapro.generic.tool.Util;

import datapro.eibs.beans.EDI001001Message;
import datapro.eibs.beans.EDI011002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.JBImage;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSScanDocDone extends SuperServlet {

	/* (non-Javadoc)
	 * @see datapro.eibs.master.JSEIBSServlet#processRequest(datapro.eibs.beans.ESS0030DSMessage, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpSession, int)
	 */
	private String LangPath = "s";

	public void service(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {

		try {
			int screen ;
			try {
				screen = Integer.parseInt(req.getParameter("SCREEN"));
			} catch (Exception e) {
				screen = 1;
			}					
			processRequest(req, res, screen);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e, SYSTEM);
			forward(sckNotOpenPage, req, res);
		}
	}

	protected String getLangPath(HttpServletRequest req) {
		return SuperServlet.rootPath + LangPath + "/";
	}

	private MessageContext getMessageContext(int port)
		throws IOException, ServiceLocatorException {
		
		return new MessageContext(super.getMessageHandler("EDI0010"));
	}

	
	protected void forward(String pageName,
		HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {
		callPage(getLangPath(req) + pageName, req, res);
	}
	
	protected void processRequest(
		HttpServletRequest req,
		HttpServletResponse res,
		int screen) throws ServletException, IOException {

			final int A_SCAN_AS400 = 1;
			final int A_SCAN_IMAGE = 2;
			final int A_SCAN_DIMST = 3;
			final int A_SCAN_DIDTL = 4;
			screen = "F".equals(req.getParameter("TYP")) ? A_SCAN_DIDTL : screen;

			switch (screen) {
				case A_SCAN_AS400 :
					procInsertAS400(req, res);
					break;
				case A_SCAN_IMAGE :
					procInsertImage(req, res);
					break;
				case A_SCAN_DIMST :
					procInsertDIMST(req, res);
					break;
				case A_SCAN_DIDTL :
					procInsertDIDTL(req, res);
					break;
				default :
					forward(devPage, req, res);
					break;
			}
	}

	/**
	 * @param req
	 * @param res
	 */
	private void procInsertDIMST(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		MessageProcessor mp = null;
		try {
			JBImage bImage = new JBImage();
			DynamicForm form = new DynamicForm();
			form.setBeanFromPage(req, bImage);
	
			mp = new MessageProcessor(getMessageContext(1));
			EDI001001Message msg = (EDI001001Message) mp.getMessageRecord("EDI001001", bImage.getUSERID(), "");
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("1");
			msg.setH01FLGWK2(bImage.getTYPE());
			msg.setH01FLGWK3("U");
			msg.setE01DCIADD(bImage.getADD());
			msg.setE01DCIACC(bImage.getNUMBER());
			msg.setE01DCITNU(bImage.getTNU());
			msg.setE01DCISEQ(bImage.getSEQ());
			msg.setE01DCITYP(bImage.getTYP());
			msg.setE01DCIDES(bImage.getDES().replace('^', ' '));
			msg.setE01DCIFRE(bImage.getFRE());
			msg.setE01DCIPAG(bImage.getPAGES());
			msg.setE01DCIDSQ(bImage.getSEQNUM());
			msg.setE01DCISTA("CO");
			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			if (mp.hasError(msgError)) {
				throw new ServletException(msgError.getERNU01() + ": " +  msgError.getERDS01());
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		} finally {
			if (mp != null)	mp.close();
		}
		
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procInsertAS400(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		MessageProcessor mp = null;

		try {
			JBImage bImage = new JBImage();
			DynamicForm form = new DynamicForm();
			form.setBeanFromPage(req, bImage);
	
			mp = new MessageProcessor(getMessageContext(1));
			EDI001001Message msg = (EDI001001Message) mp.getMessageRecord("EDI001001", bImage.getUSERID(), "");
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("1");
			msg.setH01FLGWK2(bImage.getTYPE());
			msg.setE01DCIADD(bImage.getADD());
			msg.setE01DCIACC(bImage.getNUMBER());
			msg.setE01DCITNU(bImage.getTNU());
			msg.setE01DCISEQ(bImage.getSEQ());
			msg.setE01DCITYP(bImage.getTYP());
			msg.setE01DCIDES(bImage.getDES().replace('^', ' '));
			msg.setE01DCIFRE(bImage.getFRE());
			msg.setE01DCIPAG(bImage.getPAGES());
			msg.setE01DCISTA("CO");
			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			if (mp.hasError(msgError)) {
				throw new ServletException(msgError.getERNU01() + ": " +  msgError.getERDS01());
			} else {
				if (JSEIBSProp.getImageRemote()) {
					procInsertImageRemote(req, res);
				}
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		} finally {
			if (mp != null)	mp.close();
		}
		
	}
	
	protected long copy(InputStream in, OutputStream out) throws IOException {
		byte[] buf = new byte[4 * 1024]; // 4K buffer
		int bytesRead;
		long size = 0;
		while ((bytesRead = in.read(buf)) != -1) {
			out.write(buf, 0, bytesRead);
			size = size + bytesRead;
		}
		return size;
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procInsertImage(HttpServletRequest req, HttpServletResponse res) throws ServletException {

		try {
			JBImage bImage = new JBImage();
			DynamicForm form = new DynamicForm();
			form.setBeanFromPage(req, bImage);
			
			if (!bImage.getADD().toLowerCase().endsWith(".xml")) {
				if (JSEIBSProp.getImgToIFS()) {
					FileOutputStream oImage = null;
					try {
						File fImage = new File(JSEIBSProp.getImgTempPath(), bImage.getFILENAME());
						oImage = new FileOutputStream(fImage);
						copy(req.getInputStream(), oImage);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						oImage.close();
					}
				} else {
					SCNDOCTBL tbl = new SCNDOCTBL();
					SCNDOCIMG img = new SCNDOCIMG();
					
					tbl.setTBLTYP(bImage.getTYPE());
					tbl.setTBLNUM(bImage.getNUMBER());
					tbl.setTBLTBN(bImage.getTNU());
					tbl.setTBLSEQ(bImage.getSEQ());
					tbl.setTBLSSQ(bImage.getSEQNUM());
					tbl.setTBLPAG(bImage.getPAGE());
					tbl.setTBLDTY(bImage.getTYP());
					tbl.setTBLDSC(bImage.getFILENAME());
					tbl.setTBLCND(bImage.getDES());
					// UID
					BigDecimal uid = null;
					try {
						uid = new BigDecimal(Util.getNewReference().substring(0, 15));
					} catch (Exception e) {
						uid = new BigDecimal("0");
					}
					tbl.setTBLUID(uid);
					img.setIMGUID(uid);
					ByteArrayOutputStream out = new ByteArrayOutputStream();
					img.setIMGLEN((int)copy(req.getInputStream(), out));
					img.setIMGBIN(out.toByteArray());
					FAImage facade = new FAImage();
					facade.insertImage(tbl, img);
				}				
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
	
	private void procInsertImageFTP(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		FAImage facade = new FAImage();
		
		// Description
		String imgFileName = "";
		try {
			imgFileName = req.getParameter("ADD");
			if (imgFileName == null) imgFileName = "";
		} catch (Exception e) {
			imgFileName = "";
		} 
		String xmlFile = JSEIBSProp.getScanDataURL() + imgFileName + ".xml";
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder parser = builderFactory.newDocumentBuilder();
			
			org.w3c.dom.Document doc = parser.parse(new File(xmlFile));
			org.w3c.dom.Node docPages = doc.getFirstChild();
			org.w3c.dom.NodeList list = docPages.getChildNodes();
			for (int i = 0; i < list.getLength(); i++) {
				org.w3c.dom.Node node = list.item(i);
				if (node.getNodeName().equals("Page")) {
					org.w3c.dom.NamedNodeMap map = node.getAttributes();
					
					SCNDOCTBL tbl = new SCNDOCTBL();
					SCNDOCIMG img = new SCNDOCIMG();

					JBImage bImage = new JBImage();
					DynamicForm form = new DynamicForm();
					form.setBeanFromPage(req, bImage);

					// Type
					tbl.setTBLTYP(bImage.getTYPE());
					// Number
					tbl.setTBLNUM(bImage.getNUMBER());
					// Table Number
					tbl.setTBLTBN(bImage.getTNU());
					// Table sequence
					tbl.setTBLSEQ(bImage.getSEQ());
					// Sequence
					BigDecimal ssq = null;
					try {
						ssq = new BigDecimal(map.getNamedItem("Seq").getNodeValue());
					} catch (Exception e) {
						ssq = new BigDecimal("0");
					}
					tbl.setTBLSSQ(ssq);
					// Page Number
					BigDecimal pag = new BigDecimal(i + 1);
					tbl.setTBLPAG(pag);
					// Doc Type
					tbl.setTBLDTY(bImage.getTYP());
					//	Description
					try {
						imgFileName = map.getNamedItem("Name").getNodeValue();
						if (imgFileName == null) imgFileName = "";
					} catch (Exception e) {
						imgFileName = "";
					} 
					tbl.setTBLDSC(imgFileName);
					// UID
					BigDecimal uid = null;
					try {
						uid = new BigDecimal(Util.getNewReference().substring(0, 15));
					} catch (Exception e) {
						uid = new BigDecimal("0");
					}
					tbl.setTBLUID(uid);
					img.setIMGUID(uid);
					// Image File Name
					FileInputStream inImage = null;
					File fImage = new File(JSEIBSProp.getImgTempPath() + imgFileName);
					inImage = new FileInputStream(fImage);
					int lenImage = (int) fImage.length();
					byte[] isImage = new byte[lenImage];
					inImage.read(isImage);
					img.setIMGBIN(isImage);
					// Image Lenght
					img.setIMGLEN(lenImage);
					
					facade.insertImage(tbl, img);
					fImage.delete();
				}
			}
			File fXML = new File(xmlFile);
			fXML.delete();
					
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}

	}
	
	private void procInsertImageRemote(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {
			JBImage bImage = new JBImage();
			DynamicForm form = new DynamicForm();
			form.setBeanFromPage(req, bImage);

			StringBuffer data = new StringBuffer();
			data.append(	  "USERID" + "=" + bImage.getUSERID());
			data.append("&" + "NUMBER" + "=" + bImage.getNUMBER());
			data.append("&" + "TYPE"   + "=" + bImage.getTYPE());
			data.append("&" + "TNU"    + "=" + bImage.getTNU());
			data.append("&" + "SEQ"    + "=" + bImage.getSEQ());
			data.append("&" + "TYP"    + "=" + bImage.getTYP());
			data.append("&" + "ADD"    + "=" + bImage.getADD());
			
			// Send data
			URL url = new URL(JSEIBSProp.getScanURL());
			URLConnection conn = url.openConnection();
			conn.setDoOutput(true);
			OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
			wr.write(data.toString());
			wr.flush();
		    
			// Get the response
			BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line;
			StringBuffer response = new StringBuffer();
			while ((line = rd.readLine()) != null) {
				response.append(line);
			}
			wr.close();
			rd.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("HTTP Communication Error");
		}
	}
	
	
	private void procInsertDIDTL(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		MessageProcessor mp = null;
		try {
			JBImage bImage = new JBImage();
			DynamicForm form = new DynamicForm();
			form.setBeanFromPage(req, bImage);

			mp = new MessageProcessor(getMessageContext(1));
			
			EDI011002Message msg = (EDI011002Message) mp.getMessageRecord("EDI011002");
			msg.setH02USERID(bImage.getUSERID());
			msg.setH02SCRCOD("01");
			msg.setH02FLGWK1("1");
			//msg.setE02DIDACD(bImage.getTYPE()); 
			msg.setE02DIDADD(bImage.getADD()); 
			msg.setE02DIDACC(bImage.getNUMBER());
			//msg.setE02DIDTNU(bImage.getTNU());
			msg.setE02DIDSEQ(bImage.getSEQ());
			msg.setE02DIDTYP(bImage.getTYP());
			msg.setE02DIDDES(bImage.getDES().replace('^', ' '));
			msg.setE02DIDFRE(bImage.getFRE());
			msg.setE02DIDPAG(bImage.getPAGES());
			msg.setE02DIDDSQ(bImage.getSEQNUM());
			//msg.setE02DIDSTA("CO");
			
			/*
			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			if (mp.hasError(msgError)) {
				throw new ServletException(msgError.getERNU01() + ": " +  msgError.getERDS01());
			}
			*/
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		} finally {
			if (mp != null)	mp.close();
		}
	}

	
}

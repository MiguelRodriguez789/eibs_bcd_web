/*
 * Created on Jan 23, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.tools;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.jdom.Attribute;
import org.jdom.Comment;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.XMLOutputter;

import com.datapro.eibs.facade.FAImage;
import com.datapro.eibs.images.vo.SCNDOCTBL;
import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.JBImageData;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.SuperServlet;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSScan extends SuperServlet {

	private String LangPath = "s";
	/**
	 * JSReportManager constructor comment.
	 */
	public JSScan() {
		super();
	}
	/**
	 * JSReportManager constructor comment.
	 * @param logType int
	 */
	public JSScan(int logType) {
		super(logType);
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	protected String getLangPath(HttpServletRequest req) {
		return SuperServlet.rootPath + LangPath + "/";
	}

	protected void forward(String pageName,
		HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {
		callPage(getLangPath(req) + pageName, req, res);
	}
	
	/**
	 * service method comment.
	 */
	public void service(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {

		HttpSession session = (HttpSession) req.getSession(false);

		if (session == null) {
			try {
				res.setContentType("text/html");
				printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {
			try {
				if ("true".equalsIgnoreCase(JSEIBSProp.getActiveX())) {
					scanner(req, res, session);
				} else {
					res.setContentType("eibs/scan");
					OutputStream out = (OutputStream) res.getOutputStream();
					saveXMLOutput(out, req);
					out.close();	
				}

			} catch (Exception e) {
				flexLog("Exception ocurred. Exception = " + e);
			}
		}
	}
	
	/**
	 * Insert the method's description here.
	 * Creation date: (4/12/2001 11:53:48 AM)
	 * @param page org.jdom.Element
	 * @exception java.io.IOException The exception description.
	 */
	private void getPageInfoXML(
		Element data,
		String infoFileName) {

		try {

			DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder parser = builderFactory.newDocumentBuilder();

			File file = new File(JSEIBSProp.getScanDataURL(), infoFileName + ".xml");
			flexLog("Getting Info from XML " + file.getCanonicalPath());
			org.w3c.dom.Document doc = parser.parse(file);

			org.jdom.Element pages = new org.jdom.Element("eIBSDocPages");
			pages.addContent(new Comment("Document Pages Specification"));

			org.w3c.dom.Node docPages = doc.getFirstChild();
			org.w3c.dom.NodeList list = docPages.getChildNodes();
			for (int i = 0; i < list.getLength(); i++) {
				org.w3c.dom.Node n = list.item(i);
				if (n.getNodeName().equals("Page")) {
					Element e = new Element("Page");

					org.w3c.dom.NamedNodeMap m = n.getAttributes();
					org.w3c.dom.Node c = m.getNamedItem("Name");
					e.setAttribute("Name", c.getNodeValue());
					c = m.getNamedItem("Date");
					if (c != null)
						e.setAttribute("Date", c.getNodeValue());
					c = m.getNamedItem("Seq");
					if (c != null)
						e.setAttribute("Seq", c.getNodeValue());
					else
						e.setAttribute("Seq", "1");

					pages.addContent(e);
				}
			}

			data.addContent(pages);

		} catch (Exception e) {
			flexLog("Exception ocurred reading XML. Exception = " + e);
		} catch (VerifyError e) {
			System.out.println("VerifyError : " + e);
			flexLog("VerifyError ocurred. Exception = " + e);
		}

	}

	/**
	 * Insert the method's description here.
	 * Creation date: (4/12/2001 11:53:48 AM)
	 * @param page org.jdom.Element
	 * @exception java.io.IOException The exception description.
	 */
	private void getPageInfoJDBC(Element data, String infoFileName) throws ServletException {
		
		flexLog("Getting Info from Database");
		
		int i = 0; 
		String[] element = new String[4];
		for (StringTokenizer st = new StringTokenizer(infoFileName, "_"); st.hasMoreElements();) {
			element[i++] = (String) st.nextElement();
		}
		try {
			FAImage facade = new FAImage();
			BeanList list = facade.getDocTable(element[0], element[1], element[2], element[3]);
			list.initRow();
	
			Element pages = new Element("eIBSDocPages");
			pages.addContent(new Comment("Document Pages Specification"));
			while (list.getNextRow()) {
				SCNDOCTBL vo = (SCNDOCTBL) list.getRecord();
				Element e = new Element("Page");
				ArrayList al = new ArrayList();
				Attribute an = new Attribute("Name", vo.getTBLDSC().trim());
				al.add(an);
				Attribute ad = new Attribute("Date", vo.getTBLLMM() + "/" + vo.getTBLLMD() + "/" + vo.getTBLLMY());
				al.add(ad);
				Attribute as = new Attribute("Seq", vo.getTBLSSQ().toString());
				al.add(as);
				e.setAttributes(al);
				pages.addContent(e);
			}
			data.addContent(pages);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception getting Info from Database. Exception = " + e);
			throw new ServletException(e);
		}
	}

	public void scanner(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException {
		 
		String infoFileName = req.getParameter("Name");
		
		JBImageData param = new JBImageData();
		int i = 0; 
		String[] element = new String[4];
		for (StringTokenizer st = new StringTokenizer(infoFileName, "_"); st.hasMoreElements();) {
			element[i++] = (String) st.nextElement();
		}
		try {
			BeanList list = null;
			if (JSEIBSProp.getImgToIFS()){
				File file = new File(JSEIBSProp.getScanDataURL(), infoFileName + ".xml");
				flexLog("Getting Info from XML " + file.getCanonicalPath());
				
				DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder parser = builderFactory.newDocumentBuilder();
				org.w3c.dom.Document doc = parser.parse(file);
				
				list = new BeanList();

				org.w3c.dom.Node docPages = doc.getFirstChild();
				org.w3c.dom.NodeList nlist = docPages.getChildNodes();
				for (int x = 0; x < nlist.getLength(); x++) {
					org.w3c.dom.Node n = nlist.item(x);
					if (n.getNodeName().equals("Page")) {
						SCNDOCTBL imageBean = new SCNDOCTBL();
						
						org.w3c.dom.NamedNodeMap m = n.getAttributes();
						org.w3c.dom.Node c = m.getNamedItem("Name");
						imageBean.setTBLDSC(c.getNodeValue());

						c = m.getNamedItem("Seq");
						if (c != null)
							imageBean.setTBLSSQ(new BigDecimal(c.getNodeValue()));
						else
							imageBean.setTBLSSQ(new BigDecimal("1"));
						
						list.addRow(imageBean);
					}
				}
			} else {
				flexLog("Getting Info from Database");
				FAImage facade = new FAImage();
				list = facade.getDocTable(element[0], element[1], element[2], element[3]);
				list.initRow();				
			}
	
			BigDecimal LastSeq = null;
			try {
				LastSeq = new BigDecimal(req.getParameter("DSQ"));
			} catch (Exception e) {
				LastSeq = new BigDecimal("0");
			}
			
			while (list.getNextRow()) {
				SCNDOCTBL vo = (SCNDOCTBL) list.getRecord();
				LastSeq = vo.getTBLSSQ().compareTo(LastSeq) > 0 ? vo.getTBLSSQ() : LastSeq;
			}
			param.setSequence(LastSeq.intValue());
			
			String url = req.getParameter("URL").replace('@', '&');
			if (url.indexOf("http://") != 0 && url.indexOf("https://") != 0)
				url = "http://" + url.substring(6);
			flexLog("URL -> " + url);
			param.setUrl(url);
			
			param.setScreen(2);
			param.setDocument(infoFileName);
		
			session.setAttribute("parameters", param);
		
			forward("ScanActiveFormProj1.jsp", req, res);	
			
			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception getting Info. Exception = " + e);
			throw new ServletException(e);
		}
	}

	public void saveXMLOutput(
		OutputStream out,
		HttpServletRequest req)
		throws IOException, ServletException {
			
			// Create the root element
			Element root = new Element("eIBSScanParams");
			root.addContent(new Comment("Documents and FTP Config for eIBSScan Tool"));
			Document doc = new Document(root);
			
			Element ftp = new Element("eIBSFTP");
			ftp.setAttribute("Host", JSEIBSProp.getFtpImgHost());
			ftp.setAttribute("Port", JSEIBSProp.getFtpImgPort());
			ftp.setAttribute("UserID", JSEIBSProp.getFtpImgUserID());
			ftp.setAttribute("Password", JSEIBSProp.getFtpImgPassword());
			ftp.setAttribute("Passive", JSEIBSProp.getFtpImgPassive());
			if (!JSEIBSProp.getFtpPathScanData().equals(""))
				ftp.setAttribute("Path", JSEIBSProp.getFtpPathScanData());
			if (!JSEIBSProp.getFtpImgFirewallType().equals(""))
				ftp.setAttribute("FirewallType", JSEIBSProp.getFtpImgFirewallType());
			if (!JSEIBSProp.getFtpImgFWAuthenticate().equals(""))
				ftp.setAttribute("FWAuthenticate", JSEIBSProp.getFtpImgFWAuthenticate());
			if (!JSEIBSProp.getFtpImgFWUserID().equals(""))
				ftp.setAttribute("FWUserID", JSEIBSProp.getFtpImgFWUserID());
			if (!JSEIBSProp.getFtpImgFWPassword().equals(""))
				ftp.setAttribute("FWPassword", JSEIBSProp.getFtpImgFWPassword());
			if (JSEIBSProp.getImgToIFS())
				ftp.setAttribute("imgToIFS", "TRUE");
			else
				ftp.setAttribute("imgToIFS", "FALSE");
			ftp.addContent(new Comment("FTP and Firewall Configuration"));
			root.addContent(ftp);
			
			Element data = new Element("eIBSDoc");
			data.addContent(new Comment("Document Specifications"));
			data.setAttribute("Name", req.getParameter("Name"));
			data.setAttribute("Description", req.getParameter("Desc"));
			if (!JSEIBSProp.getImgExt().equals(""))
				data.setAttribute("Extension", JSEIBSProp.getImgExt());
			String url = req.getParameter("URL").replace('@', '&');
			if (url.indexOf("http://") != 0 && url.indexOf("https://") != 0)
				url = "http://" + url.substring(6);
			flexLog("URL -> " + url);
			data.setAttribute("URL", url); 
			if (JSEIBSProp.getImgToIFS())
				getPageInfoXML(data, req.getParameter("Name"));
			else
				getPageInfoJDBC(data, req.getParameter("Name"));
			root.addContent(data);
			
			// Output the document, use standard formatter
			try {
				XMLOutputter fmt = new XMLOutputter();
				fmt.setEncoding("ISO-8859-1");
				fmt.output(doc, out);
			} catch (Exception e) {
				flexLog("Exception ocurred sending xml. Exception = " + e);
			}
	}		
}

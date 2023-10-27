package datapro.eibs.tools;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.org.jdom.Comment;
import datapro.org.jdom.Document;
import datapro.org.jdom.Element;
import datapro.org.jdom.output.XMLOutputter;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEditTemplate extends JSEIBSServlet {
	
	protected String PURPOSE = "Edit";


	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException,
			IOException {

			main(user, req, res, session);
	}

	/**
	 * Insert the method's description here.
	 * Creation date: (9/5/2000 3:47:48 PM)
	 * @param out java.io.OutputStream
	 * @exception java.io.IOException The exception description.
	 */
	public synchronized void saveXMLOutput(ESS0030DSMessage user, OutputStream out, HttpServletRequest req, HttpSession session, String purpose) throws java.io.IOException {
		
		// Create the root element
		Element root = new Element("eIBSFormDesign");

		root.addContent(new Comment("Documents and FTP Config for eIBSForm Tool"));
		
		Document doc = new Document(root);

		Element ftp = new Element("eIBSFTP");
		ftp.addAttribute("Purpose", purpose);
		ftp.addAttribute("Language", user.getE01LAN().toLowerCase());
		ftp.addAttribute("Host", JSEIBSProp.getFtpFormHost());
		ftp.addAttribute("Port", JSEIBSProp.getFtpFormPort());
		ftp.addAttribute("UserID", JSEIBSProp.getFtpFormUserID());
		ftp.addAttribute("Password", JSEIBSProp.getFtpFormPassword());
		if (!JSEIBSProp.getFtpPathFormData().equals(""))
			ftp.addAttribute("DataPath", JSEIBSProp.getFtpPathFormData());
		if (!JSEIBSProp.getFtpPathFormConfig().equals(""))
			ftp.addAttribute("ConfigPath", JSEIBSProp.getFtpPathFormConfig());
		if (!JSEIBSProp.getFtpFormFirewallType().equals(""))
			ftp.addAttribute("FirewallType", JSEIBSProp.getFtpFormFirewallType());
		if (!JSEIBSProp.getFtpFormFWAuthenticate().equals(""))
			ftp.addAttribute("FWAuthenticate", JSEIBSProp.getFtpFormFWAuthenticate());
		if (!JSEIBSProp.getFtpFormFWUserID().equals(""))
			ftp.addAttribute("FWUserID", JSEIBSProp.getFtpFormFWUserID());
		if (!JSEIBSProp.getFtpFormFWPassword().equals(""))
			ftp.addAttribute("FWPassword", JSEIBSProp.getFtpFormFWPassword());
		ftp.addContent(new Comment("FTP and Firewall Configuration"));
		
		root.addContent(ftp);

		// Output the document, use standard formatter
		XMLOutputter fmt = new XMLOutputter();
		fmt.output(doc, out);
	}
	
	protected void main(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		res.setContentType("eibs/ftp");

		OutputStream out = (OutputStream) res.getOutputStream();
		saveXMLOutput(user, out, req, session, PURPOSE);
		out.close();
	}

}

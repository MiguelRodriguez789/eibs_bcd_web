package datapro.eibs.tools;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Insert the type's description here. Creation date: (8/3/2001 12:28:32 PM)
 * 
 * @author: Enrique M. Almonte
 */
public class JSEODPDFSend extends datapro.eibs.master.SuperServlet {

	protected void sendPDF(String fileName, OutputStream out, HttpServletResponse response)
			throws java.io.IOException {

		// Output the document, use standard formatter
		try {
			setResponseHeader(response, fileName);
			//flexLog("about to send file " + fileName);

			URL url = new URL(fileName);
			InputStream in = url.openStream();

			File sendFile = new File(fileName);
			int size = 0;

			byte[] data = new byte[2048];
			BufferedInputStream bin = new BufferedInputStream(in);
			while ((size = bin.read(data, 0, data.length)) != -1) {
				out.write(data, 0, size);
			}
			bin.close();
			response.setContentLength(size);
			out.flush();

		} catch (Exception e) {
			flexLog("Exception ocurred. Exception = " + e);
		}
	}

	/**
	 * service method comment.
	 */
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws javax.servlet.ServletException, java.io.IOException {

		HttpSession session = null;

		session = (HttpSession) req.getSession(false);

		try {

			String fileName = req.getParameter("REPNAME");
			if(fileName == null){
				fileName = (String)req.getAttribute("REPNAME");
			}
			OutputStream out = (OutputStream) res.getOutputStream();
			sendPDF(fileName, out, res);
			out.close();

		} catch (Exception e) {
			flexLog("Exception ocurred. Exception = " + e);
		}

	}

	protected void setResponseHeader(HttpServletResponse response, String name)
			throws IOException {
		StringBuffer sbContentDispValue = new StringBuffer();
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);
		//response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Cache-Control", "max-age=0");
		response.addHeader("Cache-Control", "s-maxage=0");
		int firstIndex = name.lastIndexOf("/");
		int lastIndex = name.length();
		
		String ext = name.substring(name.length() - 3).toLowerCase();
		if (ext.equals("pdf")) {
			response.setContentType("application/pdf");
			//sbContentDispValue.append("inline; filename=");
			//sbContentDispValue.append(name);
			String reportName = "attachment; filename=\""+name.substring( firstIndex+1, lastIndex - 4 )+".pdf\"";
			//response.setHeader("Content-disposition", reportName);
		} else if (ext.equals("xml")) {
			response.setContentType("text/xml");
		} else if (ext.equals("xls")) {
			String reportName = "attachment; filename=\""+name.substring( firstIndex+1, lastIndex - 4 )+".xls\"";
			response.setContentType("application/vnd.ms-excel");			
			response.setHeader("Content-disposition", reportName);
		} else if (ext.equals("jpg") || ext.equals("jpeg")) {
			response.setContentType("image/jpeg");
		} else if (ext.equals("tif") || ext.equals("tiff")) {
			response.setContentType("image/tiff");
		} else {
			response.setContentType("image/" + ext);
		}
	}
}
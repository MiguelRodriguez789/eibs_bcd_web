package datapro.eibs.tools;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Orestes Garcia
 */
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.facade.FAImage;
import com.datapro.eibs.images.vo.SCNIMGView;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;

public class JSScanDocViewer extends JSEIBSServlet {

	private static final long serialVersionUID = 2474492304739523462L;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse response,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		String uid = req.getParameter("DOC_UID");
		String name = (req.getParameter("DOC_NAME") == null) ? "" : req.getParameter("DOC_NAME").trim();
		if (uid == null) {
			uid = name.substring(0, name.indexOf("_"));
		}
		try {
			flexLog("Image to View: " + uid);
			
			InputStream in = null;
			if (JSEIBSProp.getImgToIFS()) {
				InputStream inImage = null;
				try {
					File file = new File(JSEIBSProp.getImgTempPath(), name);
					inImage = new FileInputStream(file);
					in = inImage;
				} finally {
					if (inImage != null) 
						inImage.close();
				}
			} else {
				FAImage facade = new FAImage();
				SCNIMGView vo = facade.getImage(uid);				
				in = new ByteArrayInputStream(vo.getIMGBIN());
			}
			
			sendResponse(response, in, 0, name);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}

}
package datapro.eibs.tools;

/**
 * Reads the Params XML needed to generate the FIELDS for the EIBS Forms.
 * Creation date: (12/16/13 1:18 PM)
 * @author: Catalina Sepulveda
 */

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;

public class JSEIBSFormsFieldGenerator extends JSEIBSServlet {

	private static final long serialVersionUID = 688773219764155898L;

	public void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		FileInputStream schemaFile = null;
		try {
			String schemaName = req.getParameter("schema");
			schemaFile = new FileInputStream(
					new EIBSFormsFieldGenerator().generateXML(schemaName == null ? "EIBSR07M02" : schemaName));
			resp.setHeader("Content-disposition", "attachment; filename=eIBSFormsFields.xsd");
			sendResponse(resp, schemaFile, "eIBSFormsFields.xsd");
		} finally {
			try {
				schemaFile.close();
			} catch (Exception e) {
			}
		} 
		
	}

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		// Do nothing
		
	}
	
	
}
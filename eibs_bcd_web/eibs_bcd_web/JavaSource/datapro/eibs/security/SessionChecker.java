package datapro.eibs.security;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Constructor;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.XMLOutputter;

import com.datapro.security.HistUserAccessEntry;
import com.datapro.security.UserEntryNotFoundException;
import com.datapro.security.UserRegistryFacade;

import datapro.eibs.master.ServiceLocator;

/**
 * @version 1.0
 * @author fhernandez
 */
public class SessionChecker extends HttpServlet {
	
	private static final String REGISTRY_KEY = ServiceLocator.getInstance()
		.getDataSourceJndiName(UserRegistryFacade.DB_REGISTRY);
	private String realm;
	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
		realm = config.getServletContext().getInitParameter("realm");
	}
	
	private UserRegistryFacade getUserRegistryFacade(HttpServletRequest req){

		UserRegistryFacade userRegistryFacade = null;
		try {
			Class[] argsClass = new Class[] { String.class };
			Object[] args = new Object[] { realm };

			Class trxClass = Class.forName("com.datapro.security.UserRegistryEibsImpl");
			Constructor argsConstructor = trxClass.getConstructor(argsClass);

			userRegistryFacade = (UserRegistryFacade) argsConstructor.newInstance(args);
			userRegistryFacade.initialize(REGISTRY_KEY, req.getLocale());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userRegistryFacade;
	}

	protected void setResponseHeader(HttpServletResponse response)
			throws IOException {
		StringBuffer sbContentDispValue = new StringBuffer();
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);
		// response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Cache-Control", "max-age=0");
		response.addHeader("Cache-Control", "s-maxage=0");
		response.setContentType("text/xml");
	}

	protected void sendXMLResponse(HttpServletResponse response,
			Object xmlResponse) throws IOException {
		ServletOutputStream out = (ServletOutputStream) response
				.getOutputStream();
		try {
			setResponseHeader(response);
			out.print(xmlResponse.toString());
		} catch (IOException e) {
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null)
				out.close();
		}
	}

	/**
	 * @see javax.servlet.http.HttpServlet#void
	 *      (javax.servlet.http.HttpServletRequest,
	 *      javax.servlet.http.HttpServletResponse)
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String j_password = req.getParameter("password");
		
		if (j_password == null) {
			doPost(req, resp);
		} else {
			processRequest(req, resp);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		
	    out.println("<?xml version=\"1.0\"?>");
	    out.println("<SESSION>");
		
	    String user = req.getParameter("username") == null ? 
	    		req.getParameter("user") : req.getParameter("username");
	    if (user != null) {
			try {
				UserRegistryFacade userRegistryFacade = getUserRegistryFacade(req);
				HistUserAccessEntry accessEntry = userRegistryFacade.getUserLastAccess(
						user, true);
				
			    out.println("<USER>");
			    out.println(accessEntry.getUid());
			    out.println("</USER>");
			    if (accessEntry.getPwdHistory().compareTo(HistUserAccessEntry.ZERO) == 0) {
				    out.println("<JSESSIONID>");
				    out.println(accessEntry.getUserSessionId());
				    out.println("</JSESSIONID>");
				}
			    
			} catch (UserEntryNotFoundException e) {
				//Do nothing, sending blank response
				out.println(e.getClass().getName() + " for user =  " + user);
			} catch (Exception e) {
				e.printStackTrace();
			}				
		}
	    
	    out.println("</SESSION>");
	}

	protected void processRequest(
			HttpServletRequest req,
			HttpServletResponse res)  {
			
			String j_username = req.getParameter("username") == null ? 
		    		req.getParameter("user") : req.getParameter("username");
			String j_password = req.getParameter("password");
			
			Element root = new Element("RESULT");
			root.setAttribute("User", j_username);
			
			if (j_username != null && !j_username.equals("")) {
				try {
					UserRegistryFacade userRegistryFacade = getUserRegistryFacade(req);
					userRegistryFacade.checkCredentials(j_username, j_password);
					root.setAttribute("Value", "TRUE");
				} catch (Exception e) {
					root.setAttribute("Value", "FALSE");
					root.setAttribute("Exception", e.getClass().getName());
					root.setAttribute("Error", e.getMessage());
				}
			} else {
				root.setAttribute("Value", "FALSE");
				root.setAttribute("Error", "Invalid User Name");
			}
			Document doc = new Document(root);
			// Output the document, use standard formatter
			try {
				OutputStream out = (OutputStream) res.getOutputStream();
				res.reset();
				setResponseHeader(res);
				XMLOutputter fmt = new XMLOutputter();
				fmt.setEncoding("ISO-8859-1");
				fmt.output(doc, out);
			} catch (Exception e) {
				System.out.println(e.getClass().getName() + " Exception ocurred sending xml. Error =  " + e);
			}
		}
}

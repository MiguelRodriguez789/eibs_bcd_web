package datapro.eibs.products;

/**
 * This type was created by Orestes Garcia.
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.master.SuperServlet;

public class JSOfferParams extends SuperServlet {

	/**
	 * Insert the method's description here. Creation date: (1/14/00 12:29:44
	 * PM)
	 */
	public JSOfferParams() {
		super(SYSTEM);
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);

	}

	/**
	 * This method was created by Orestes Garcia.
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 */
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String outParams = "";
		HttpSession session;
		res.setContentType("text/html");
		res.setHeader("Pragma", "No-cache");
		res.setDateHeader("Expires", 0);
		res.setHeader("Cache-Control", "no-cache");

		PrintWriter out = res.getWriter();

		session = (HttpSession) req.getSession(false);

		if (session != null) {

			outParams = (String) session.getAttribute("offerParams");
			out.println(outParams);

		}

		out.close();

	}
}
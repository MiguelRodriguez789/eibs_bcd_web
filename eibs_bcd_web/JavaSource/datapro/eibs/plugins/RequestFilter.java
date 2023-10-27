package datapro.eibs.plugins;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generic.tool.Util;

/**
 * @author fhernandez
 * 
 */
public class RequestFilter implements Filter {

	private final static Logger log = Logger.getLogger(RequestFilter.class.getName());

	private FilterConfig config = null;
	private boolean wrapRequest;
	private boolean wrapResponse;

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
		config = filterConfig;
		wrapRequest = Boolean.valueOf(config.getInitParameter("request")).booleanValue();
		wrapResponse = Boolean.valueOf(config.getInitParameter("response")).booleanValue();
		AuthorizationManager.init(config);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest,
	 *      javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		if ((request instanceof HttpServletRequest)
				&& (response instanceof HttpServletResponse)) {
			
			String resourcePath = null;
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			HttpServletResponse httpResponse = (HttpServletResponse) response;
			
			if ("/".equals(httpRequest.getRequestURI()) ||
					httpRequest.getRequestURI().equals(httpRequest.getContextPath() + "/")){
				filterChain.doFilter(httpRequest, httpResponse);
				return;
			}
			//If File URI is Hashed, forward request to unhashed resource.
			if(!AuthorizationManager.isFiltered(httpRequest.getRequestURI()) && AuthorizationManager.isHashedResource((HttpServletRequest) request, httpRequest.getRequestURI())){
				if(null == AccessVersion.getJSMap(httpRequest.getRequestURI())){
					filterChain.doFilter(httpRequest, response);
					return;
				} else {
					resourcePath = AccessVersion.getJSMap(httpRequest.getRequestURI());
					request.getRequestDispatcher(resourcePath).forward(request, response);
					return;
				}
			}
			
			
			if (wrapRequest) {
				RequestWrapper requestWrapper = new RequestWrapper(httpRequest);
				request = requestWrapper;				
				resourcePath = AuthorizationManager.getResourcePath(requestWrapper);
				
				if (wrapResponse && AuthorizationManager.isFiltered(resourcePath)){
					ResponseWrapper responseWrapper = new ResponseWrapper(requestWrapper, httpResponse);
					response = responseWrapper;
					
					if (AuthorizationManager.isUnmapped(resourcePath)){
						if (verifySession(requestWrapper, httpResponse)) {
							httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
						}
						return;
					}
					if (isSessionControlRequiredForThisResource(requestWrapper)){
						if (!verifySession(requestWrapper, httpResponse)){
							return;
						}
						if (!AuthorizationManager.isAuthorizer(resourcePath, config.getServletContext())) {
							if (!requestWrapper.isValid()){
								httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
								return;
							}
							if (!requestWrapper.isMapped()){
								//if (!verifyRequest(requestWrapper, httpResponse, resourcePath))
									httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN);
								return;
							}
						}
					}
					
					filterChain.doFilter(request, response);
			        if (!responseWrapper.isCommitted()) {
			        	responseWrapper.flush();
			        }
					return;
				}
			} else {
				if (isSessionControlRequiredForThisResource(httpRequest)) {
					if (!verifySession(httpRequest, httpResponse)) {
						return;
					} 
				}
			}
		} 
		filterChain.doFilter(request, response);
	}

	private boolean isSessionControlRequiredForThisResource(HttpServletRequest httpRequest) {
		if (config != null){
			return AuthorizationManager.isControlledResource(httpRequest);
		}
		return false;
	}
	
	public boolean verifySession(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) 
		throws IOException {
		
		// is session invalid?
		if (!AuthorizationManager.isValidSession(httpServletRequest)) {
			log.info("session is invalid!" );
			String noSessionPage = config.getServletContext().getInitParameter("page_no_session");
			if (noSessionPage != null && !noSessionPage.equals("")) {
				httpServletResponse.sendRedirect(
						httpServletRequest.getContextPath() + "/" + noSessionPage);
				log.info("Redirecting to no session page : " + noSessionPage);
			} else {
				printLogInAgain(httpServletRequest, httpServletResponse);
			}
			return false;
		}
		return true;
	}
	
	private boolean verifyRequest(RequestWrapper request, HttpServletResponse response, 
		String resourcePath) throws IOException {
		HttpSession session = request.getSession(false);
		if (session != null){
			//when session is null then verifySession should deliver
			if (request.getRequestId() != null) {
				String[] options = Util.split(request.getRequestId(), "_");
				if (options.length > 2) {
					AccessSecurity menuSecurity = (AccessSecurity) session.getAttribute("AccessSecurity");
					if (menuSecurity.checkRequestValidity(options[0], options[1], options[2])) {
						return true;
					}
				}
				log.info("No existen privilegios para invocar esta opción: " +
			 			request.getRequestURI());
			} else {
				log.info("No existe identificador del request para el recurso: " +
						request.getRequestURI());
			}
		}
		return false;
	}
	
	/**
	 * This method prints the error information.
	 * @param printStream PrintStream
	 * @param e Throwable
	 */
	public void printLogInAgain(ServletRequest request, ServletResponse response) throws IOException {

		int port = request.getLocalPort();
		String server = request.getServerName();
		String root = request.getServletContext().getContextPath().toString();
		response.setContentType("text/html");		
		PrintWriter out = response.getWriter();
		out.println("http://" + server + ":" + port + root);
		out.close();
		return;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub

	}


}
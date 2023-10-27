package datapro.eibs.plugins;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

/**
 * @author fhernandez
 * 
 */
public class ResponseWrapper extends HttpServletResponseWrapper {
	
	private AccessSecurity accessSecurity;
	private RequestWrapper request;
	private HttpServletResponse response;
	private Writer writer;
	private ServletOutputStreamWrapper outputStream;
	private AuthorizationMapper mapper;
	private boolean wrappable;
	private boolean authorizer;
	private boolean committed;
	
	public ResponseWrapper(RequestWrapper request, HttpServletResponse response) throws IOException {
		super(response);
		this.request = request;
		this.response = response;
		addSecurityCookies();
		mapper = new AuthorizationMapper(request, this);
		wrappable = AuthorizationManager.isModifiable(null);
		authorizer = AuthorizationManager.isAuthorizer(request.getServletPath());
	}
	
	public AuthorizationMapper getAuthorizationMapper() {
		return mapper;
	}

	private void addSecurityCookies(){
		HttpSession session = request.getSession(false);
		if (session != null) {
			accessSecurity = (AccessSecurity) session.getAttribute("AccessSecurity");
			if (accessSecurity != null) {
				if (accessSecurity.getRequestId() != null) {
					addCookie(accessSecurity, "eibsRequestId", accessSecurity.getRequestId());
				}
			}
		}
		if (request.getApplicationId() != null) {
			Cookie cookie = new Cookie("eibsSessionId", request.getApplicationId());
			addCookie(cookie);
		}
	}
	
	public void addCookie(AccessSecurity accessSecurity, String name, String value){
		addCookie(AuthorizationManager.newCookie(accessSecurity, name, value));
	}
	
	public void addCookie(Cookie cookie) {
		HttpSession session = request.getSession(false);
		String id = request.getApplicationId();
		String domain = request.getRequestURL().toString();
		domain = domain.substring(0, domain.indexOf(request.getContextPath()));
		//cookie.setDomain(request.getServerName());
		cookie.setPath(request.getContextPath()+"/"+
			(id == null ? "" : id + "/"));
		cookie.setMaxAge(session.getMaxInactiveInterval());
		if (AuthorizationManager.secure != null) {
			cookie.setSecure(AuthorizationManager.secure.booleanValue());
		}
		super.addCookie(cookie);
	}
	
    public void setHeader(String name, String value) {
    	super.setHeader(name, value);
    }
	
	public void setContentType(String type) {
		super.setContentType(type);
		wrappable = AuthorizationManager.isModifiable(type);
	}
	
	public boolean isChacheable() {
		return wrappable && !authorizer;
	}

	public boolean isCommitted() {
		return super.isCommitted() || committed;
	}

	public void sendRedirect(String location) throws IOException {
		super.sendRedirect(mapper.mapURI(location, false));
	}

	public ServletOutputStream getHttpOutputStream() throws IOException {
		return response.getOutputStream();
	}

	public ServletOutputStream getOutputStream() throws IOException {
		if (outputStream != null && outputStream.isClosed()) {
			throw new IllegalStateException("IBS:SRVE0199E: OutputStream already obtained");
		}
		if (outputStream == null) {
			outputStream = new ServletOutputStreamWrapper(super.getOutputStream(),
					request, this);
		}
		return outputStream;
	}
	
	public PrintWriter getWriter() throws IOException {
		if (writer == null) {
			outputStream = new ServletOutputStreamWrapper(new ByteArrayOutputStream(),
					request, this);
			writer = new PrintWriter(outputStream);
		}
	    return (PrintWriter) writer;
	}
	
	public void flushBuffer() throws IOException {
		if (writer != null) {
			writer.flush();			
		}
	}
	
	public void flush() throws IOException {
		flushBuffer();
		if (outputStream != null) {
			outputStream.close();
			outputStream.writeTo(response.getOutputStream());
			committed = true;
		}
	}
	
	public String encodeURL(String url) {
		return mapper.mapURI(url, true);
	}

}
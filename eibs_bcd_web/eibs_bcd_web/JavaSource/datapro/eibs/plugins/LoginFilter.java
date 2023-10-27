package datapro.eibs.plugins;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.datapro.security.HistUserAccessEntry;
import com.datapro.security.UserEntryNotFoundException;
import com.datapro.security.UserMustChangePasswordException;
import com.datapro.security.UserNotAuthorizedException;
import com.datapro.security.UserNotAuthorizedFromHostException;
import com.datapro.security.UserPasswordException;
import com.datapro.security.UserRealmCredentialsEntry;
import com.datapro.security.UserRegistryFacade;

import datapro.eibs.master.ServiceLocator;

/**
 * @author fhernandez
 * 
 */
public class LoginFilter implements Filter {

	private static final String REGISTRY_KEY = ServiceLocator.getInstance()
		.getDataSourceJndiName(UserRegistryFacade.DB_REGISTRY);
	private static final Logger log = Logger.getLogger(LoginFilter.class.getName());

	protected FilterConfig config = null;
	private String realm;
	private String usersImpl;

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
		config = filterConfig;
		realm = config.getServletContext().getInitParameter("realm");
		usersImpl = config.getServletContext().getInitParameter("users");
		if (usersImpl == null) 
			usersImpl = "com.datapro.security.UserRegistryEibsImpl";
	}
	
	public String getCookieValue(Cookie[] cookies, String cookieName) {
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookieName.equals(cookie.getName()))
					return (cookie.getValue());
			}			
		}
		return null;
	}
	
	public String getJavaSessionId(Cookie[] cookies) {
		return getCookieValue(cookies, "JSESSIONID");
	}
	
	private UserRegistryFacade getUserRegistryFacade(HttpServletRequest request){

		UserRegistryFacade userRegistryFacade = null;
		try {
			userRegistryFacade = (UserRegistryFacade) Class.forName(usersImpl)
				.getConstructor(new Class[] { String.class }).newInstance(new Object[] { realm });
			userRegistryFacade.initialize(REGISTRY_KEY, request.getLocale());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userRegistryFacade;
	}


	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest,
	 *      javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;

		String j_username = httpRequest.getParameter("j_username");
		String j_password = httpRequest.getParameter("j_password");
		String userPassword = httpRequest.getParameter("userPassword");
		Locale locale = null;
		if (httpRequest.getParameter("locale") != null) {
			locale = new Locale(httpRequest.getParameter("locale"));
		} else {
			locale = httpRequest.getLocale();
		}
		
		if (j_username != null && !j_username.equals("")) {
			Map errors = null;
			UserRealmCredentialsEntry passwordEntry = null;
			try {
				UserRegistryFacade userRegistryFacade = getUserRegistryFacade(httpRequest);
				passwordEntry = userRegistryFacade.getUserRealmCredentials(j_username);

				HistUserAccessEntry accessEntry = new HistUserAccessEntry();
				accessEntry.setUid(passwordEntry.getUid());
				accessEntry.setPwdHistory(HistUserAccessEntry.ONE);
				accessEntry.setIpHostName(httpRequest.getRemoteHost());
				accessEntry.setIpHostNumber(httpRequest.getRemoteAddr());
				accessEntry.setWhenAccessed(new Timestamp(System.currentTimeMillis()));
				try {
					if (passwordEntry.getIpHostName() == null) 
						passwordEntry.setIpHostName("");
					//pre login action
					if(passwordEntry.getIpHostName().trim().length() == 1) {
						try {
							HistUserAccessEntry lastAccess = userRegistryFacade.getUserLastAccess(
									passwordEntry.getUid(), true);
							if(lastAccess.getPwdHistory().compareTo(HistUserAccessEntry.ZERO) == 0
								&& !(lastAccess.getIpHostName().equals(accessEntry.getIpHostName())
									|| lastAccess.getIpHostName().equals(accessEntry.getIpHostNumber())
									|| lastAccess.getIpHostNumber().equals(accessEntry.getIpHostNumber())
									|| lastAccess.getIpHostNumber().equals(accessEntry.getIpHostName()))){
								throw new UserNotAuthorizedFromHostException();
							}
						} catch (UserEntryNotFoundException e) {
							//Do nothing user has not access before
						}
					} else if((!passwordEntry.getIpHostName().equals("")
							|| !passwordEntry.getIpHostNumber().equals(""))
						&& !(passwordEntry.getIpHostName().equals(accessEntry.getIpHostName())
							|| passwordEntry.getIpHostName().equals(accessEntry.getIpHostNumber())
							|| passwordEntry.getIpHostNumber().equals(accessEntry.getIpHostNumber())
							|| passwordEntry.getIpHostNumber().equals(accessEntry.getIpHostName()))){
						throw new UserNotAuthorizedFromHostException();
					}
					
					if (userRegistryFacade.mustChangePassword(passwordEntry) && userPassword == null){
						userRegistryFacade.checkCredentials(passwordEntry, j_password);
						throw new UserMustChangePasswordException();
					} else if (userRegistryFacade.mustChangePassword(passwordEntry)){
						userRegistryFacade.checkPassword(j_username, userPassword, passwordEntry.getUserPassword());
						if (passwordEntry.getPwdAllowUserChange() != null
							&& passwordEntry.getPwdAllowUserChange().compareTo(UserRealmCredentialsEntry.TRUE) == 0) {
							errors = userRegistryFacade.validatePassword(passwordEntry, j_password);
							if (errors.isEmpty()) {
								passwordEntry = userRegistryFacade.updatePassword(
									j_username, j_password);
							}
						}
						if (userRegistryFacade.mustChangePassword(passwordEntry)) {
							//If condition remains throw exception
							throw new UserMustChangePasswordException();
						}
					} else {
						userRegistryFacade.checkCredentials(passwordEntry, j_password);
					}
					
					filterChain.doFilter(request, response);
					
					//post login action
					accessEntry.setUserSessionId(getJavaSessionId(httpRequest.getCookies()));
					accessEntry.setPwdHistory(HistUserAccessEntry.ZERO);
					if (!httpRequest.isUserInRole("roleEibsUser")) {
						//Should not happen because the password has been validated
						//Refreshing information because security implementation updated the registry
						passwordEntry = userRegistryFacade.getUserRealmCredentials(j_username);
						passwordEntry.setPwdFailureTime(accessEntry.getWhenAccessed());
						throw new UserNotAuthorizedException();
					}

				} finally {
					userRegistryFacade.insertAccessHistory(accessEntry);
				}

			} catch (UserMustChangePasswordException e) {
				if (errors != null && !errors.isEmpty()) 
					request.setAttribute("errors", errors);
				sendError(httpResponse, HttpServletResponse.SC_EXPECTATION_FAILED);
			} catch (UserPasswordException e) {
				if (passwordEntry.getPwdLockout().compareTo(UserRealmCredentialsEntry.TRUE) == 0) {
					request.setAttribute("errors", e.getMessage());
				}
				sendError(httpResponse, HttpServletResponse.SC_UNAUTHORIZED);
			} catch (UserEntryNotFoundException e) {
				log.info("User Not Found: " + j_username);
				sendError(httpResponse, HttpServletResponse.SC_UNAUTHORIZED);
			} catch (UserNotAuthorizedException e) {
				log.info("User Not Authorized: " + j_username);
				sendError(httpResponse, HttpServletResponse.SC_UNAUTHORIZED);
			} catch (UserNotAuthorizedFromHostException e) {
				log.info("User Not Authorized: " + j_username + " - From Host "+ httpRequest.getRemoteAddr());
				sendError(httpResponse, HttpServletResponse.SC_PRECONDITION_FAILED);
			} catch (Exception e) {
				throw new ServletException(e);
			}
		} else {
			filterChain.doFilter(request, response);
		}
	}	
	
	private void sendError(HttpServletResponse httpResponse, int error) throws IOException {
		if (!httpResponse.isCommitted()) {
			httpResponse.sendError(error);
		}
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
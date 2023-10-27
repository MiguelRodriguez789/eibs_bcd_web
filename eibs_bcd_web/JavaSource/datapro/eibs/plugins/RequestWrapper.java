package datapro.eibs.plugins;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import datapro.eibs.master.JSEIBSProp;

/**
 * @author fhernandez
 * 
 */
public class RequestWrapper extends HttpServletRequestWrapper {
	
	public final static String SESSION_PREFIX = "UIDS";
	public final static String SESSION_URL_PATH = "/" + SESSION_PREFIX;
	private static Boolean encryption;
	private String sessionId;
	private AuthorizationMapper mapper;
	private boolean valid = true;
	private Map parameterMap;
	private Map queryParameters;
	private String mappedResource;
	private String queryString;
	private String servletPath;
	private static RequestEncoder encoder;

	public RequestWrapper(HttpServletRequest request) {
		super(request);
		mapper = new AuthorizationMapper(request);
		if (encryption == null) {
			HttpSession session = getSession(false);
			if (session != null) {
				encryption = Boolean.valueOf(session.getServletContext().getInitParameter("cookieEncryption"));
			}
		}
	}

	public HttpSession getSession(boolean create) {
		HttpSession session = ((HttpServletRequest) getRequest()).getSession(false);
		if (!JSEIBSProp.getSessionPluginClass().equals("")) {
			String sessionId = getApplicationId();
			if (session != null && sessionId != null) {
				SessionWrapper wrapper = (SessionWrapper) session.getAttribute(sessionId);
				if (wrapper == null && create) {
					wrapper = new SessionWrapper();
					HashMap map = new HashMap();
					map.put("eibsSessionId", sessionId);
					wrapper.init(session, map);
					session = wrapper;
				}
			}			
		}
		if (session == null && create) {
			session = ((HttpServletRequest) getRequest()).getSession(true);
		}
		return session;
	}
	
	public HttpSession getSession() {
		return getSession(true);
	}
	
	public boolean isNewSessionRequest(){
		return getApplicationId() != null 
			&& getHeader("eibsSessionId") == null;
	}
	
	String getCookieValue(Cookie cookie){
		if ("eibsRequestId".equalsIgnoreCase(cookie.getName())) {
			if (encryption.booleanValue()) {
				HttpSession session = getSession(false);
				if (session != null) {
					AccessSecurity accessSecurity = (AccessSecurity) session.getAttribute("AccessSecurity");
					if (accessSecurity != null) {
						try {
							return accessSecurity.getDecryptedValue(cookie.getValue());
						} catch (Exception e) {
							System.out.println("ERROR On: "+getRequestURI()+": "+getServletPath());
							e.printStackTrace();
						}
					}
				}
			}
		}
		return null;
	}
	
	public String getApplicationId(){
		String id = null;
		String url = getRequestURL().toString();
		int idx = url.indexOf(SESSION_URL_PATH);
		if (idx >= 0) {
			int idy = url.indexOf("/", idx+SESSION_URL_PATH.length());
			if (idy < 0) {
				idy = url.length();
			}
		    id = url.substring(idx+SESSION_URL_PATH.length(), idy);
		}
		if (id == null){
			id = getParameter("eibsSessionId");
		}			
		if (id == null) 
			id = getHeader("eibsSessionId");
		return id;
	}
	
	public String getRequestId(){
		String id = getHeader("eibsRequestId");
		if (id == null){
			if (getCookies() != null) {
				for (int i = 0; i < getCookies().length; i++) {
					Cookie cookie = getCookies()[i];
					if ("eibsRequestId".equalsIgnoreCase(cookie.getName())) {
						id = getCookieValue(cookie);
					}
				}
			}
		}
		return id;
	}
	
	public boolean isValid() {
		if (parameterMap == null) {
	        parseParameters();
		}
		return valid;
	}	
	
	public boolean isMapped() {
        return super.getRequestURI().indexOf(AuthorizationManager.AUTHORIZATION_SERVLET) != -1;
	}
	
	protected String getMappedResource() {
		if (mappedResource != null) {
			return mappedResource;
		}
		mappedResource = super.getServletPath();
		if (mappedResource.indexOf(AuthorizationManager.AUTHORIZATION_SERVLET) != -1) {
			String resource = super.getParameter("resource");
			if (resource != null) {
				if (resource.indexOf(AuthorizationManager.AUTHORIZATION_ID) == 0) {
					mappedResource = getParameter("resource");
				} else {
					mappedResource = AuthorizationManager.AUTHORIZATION_ID;
				}
			} 
		}
		return mappedResource;
	}

	private String filterRequestParameters(String value){
		if(encoder == null){
			encoder = AuthorizationManager.newEncoder();
		}
		return encoder.filterRequestParameters(value);
	}

	public String getRequestURI() {
		return super.getRequestURI();
	}
	
	private boolean containsValue(String[] array, String object){
        if (object != null) {
            for (int i = 0; i < array.length; i++) {
                if (object.trim().equalsIgnoreCase(array[i].trim())) {
                    return true;
                }
            }
        } else {
        	for (int i = 0; i < array.length; i++) {
                if (array[i] == null) {
                    return true;
                }
            }
        }
        return false;
	}
	
	private void parseQueryString(){
		queryString = super.getQueryString();
		if (queryString != null) {
			queryParameters = parseParameters(new HashMap(), queryString.split("&"));
		}
		String queryMapped = getMappedResource();
		if (queryMapped != null) {
			Map mappedParameters = null;
			int pos = queryMapped.indexOf("?");
			if (pos != -1) {
				queryMapped = queryMapped.substring(pos+1);
				mappedParameters = parseParameters(new HashMap(), queryMapped.split("&"));
			}
			if (mappedParameters != null) {
				if (queryParameters == null) {
					queryParameters = new HashMap();
				}
				Iterator keys = mappedParameters.keySet().iterator();
				while (keys.hasNext()) {
					String key = (String) keys.next();
					Object mappedValues = (String) mappedParameters.get(key);
					Object queryValues = (String) queryParameters.get(key);
					if (queryValues != null){
						if (queryValues instanceof String[]){
				            for (int i = 0; i < ((String[]) queryValues).length; i++) {
								String queryValue = ((String[]) queryValues)[i];
								if (!AuthorizationManager.isMapped(this, queryValue)){
					                if (!containsValue(((String[]) mappedValues), queryValue)) {
					                	//Then the request has been modified
										valid = false;	
									}
								}
				            }
						} else {
							String queryValue = queryValues.toString();
							if (!AuthorizationManager.isMapped(this, queryValue)){
								if (!queryValue.trim().equalsIgnoreCase(mappedValues.toString().trim())){
									//Then the request has been modified
									valid = false;
								}
							}
						}
					}
					
					//We are always keeping the mapped value as protection
			  		queryParameters.put(key, mappedValues);
				}
			}
		}
		if (queryParameters != null) {
			StringBuffer queryBuffer = new StringBuffer();
			boolean firstTime = true;
			Iterator keys = queryParameters.keySet().iterator();
			while (keys.hasNext()) {
				String key = (String) keys.next();
				Object value = queryParameters.get(key);
		  		if (firstTime) {
		  			firstTime = false;
				  	queryBuffer.append(key+"="+value);
				} else {
				  	queryBuffer.append("&"+key+"="+value);
				}
			}
			queryString = queryBuffer.toString();
		}
	}
	
	public String getQueryString() {
		if (queryString == null) {
			parseQueryString();
		}
		return queryString;
	}
	
	public String getParameter(String name) {
		String requestURI = super.getRequestURI();
		if (requestURI.indexOf(AuthorizationManager.AUTHORIZATION_SERVLET) != -1 
			&& "resource".equals(name)) {
			return mapper.unmapURI((String) getParameterMap().get(name));
		} else {
			Object value = getParameterMap().get(name);
			if (value != null) {
				if (value instanceof String[]) {
					value = ((String[]) value)[0];
				}
				return filterRequestParameters(value.toString());
			}
		}
		return null;
	}

	public String[] getParameterValues(String name) {
		String paramValues[] = null;
		Object value = getParameterMap().get(name);
		if (value != null) {
			if (value instanceof String[]) {
				paramValues =((String[]) value);
			} else {
				paramValues = new String[1];
				paramValues[0] = value.toString();
			}
			for (int i = 0; i < paramValues.length; i++) {
				paramValues[i] = filterRequestParameters(paramValues[i]);
			}
		}
		return paramValues;
	}
	
	private Map parseParameters(Map parameterMap, String[] values){
		for (int i = 0; i < values.length; i++) {
			String name = null;
			int pos = values[i].indexOf("=");
			if (pos != -1) {
				name = values[i].substring(0, pos);
			}
			if (parameterMap.get(name) == null) {
				if (values[i].length() > pos) {
					String value = null;
					try {
						value = URLDecoder.decode(values[i].substring(pos+1), "UTF-8");
					} catch (Exception e) {
					}
					Object mappedValue = parameterMap.get(name);
					if (mappedValue == null) {
						parameterMap.put(name, value);						
					} else {
						parameterMap.put(name, 
								mapper.mergeValues(mappedValue, value));
					}
				} else {
					parameterMap.put(name, null);
				}
			} else { //is a list
				List list = new ArrayList();
				Object val = parameterMap.get(name);
				if (val instanceof String) {
					list.add(val);
				} else {
					String[] strArray = (String[]) val; 
					for (int j = 0; j < strArray.length; j++) {
						list.add(strArray[j]);
					}
				}
				if (values[i].length() > pos) {
					String value = null;
					try {
						value = URLDecoder.decode(values[i].substring(pos+1), "UTF-8");
					} catch (Exception e) {
					}
					list.add(value);
				}
				parameterMap.put(name, Arrays.copyOf(list.toArray(), list.toArray().length, String[].class));
			}
		}
		return parameterMap;
	}
	
	private void parseParameters() {
		parameterMap = new HashMap();
		if (queryString == null) {
			parseQueryString();
		}
        for(Enumeration names = super.getParameterNames();names.hasMoreElements();){
            String name = (String)names.nextElement();
        	if (name.equals("resource")) {
            	String resource = super.getParameter(name);
				if (resource != null) {
					int pos = resource.indexOf("@");
					if (pos != -1) {
						parseParameters(parameterMap, resource.substring(pos+1).split("@"));
						resource = resource.substring(0, pos);
					}
					pos = resource.indexOf("?");
					if (pos != -1) {
						parseParameters(parameterMap, resource.substring(pos+1).split("\\?"));
						resource = resource.substring(0, pos);
					}
					parameterMap.put("resource", resource);
				}
			} else {
				parameterMap.put(name, super.getParameterValues(name));
	        	if (queryParameters != null && queryParameters.containsKey(name)) {
	            	parameterMap.put(name, queryParameters.get(name));
				}
			}
        }
    }
    
	public Map getParameterMap() {
		if (parameterMap == null) {
	        parseParameters();
		}
		return parameterMap;
	}
	
	/**
	 * Returns any extra path information associated with the URL the client sent when it made this request. 
	 * The extra path information follows the servlet path but precedes the query string and will start with a "/" character.
	 * This method returns null if there was no extra path information.
	 * 
	 * @return a String, decoded by the web container, specifying extra path information that comes 
	 * after the servlet path but before the query string in the request URL; 
	 * or null if the URL does not have any extra path information
	 */
    public String getPathInfo() {
		String result = super.getPathInfo();
		if (result != null) {
			if (!AuthorizationManager.isFiltered(result)) {
				return result;
			}
			if (sessionId != null) {
				int length = result.length();
				if (result.startsWith(sessionId)) {
					result = (length == sessionId.length()) ? null : result
							.substring(sessionId.length());
				} else {
					String sessionPath = SESSION_URL_PATH+sessionId;
					if (result.startsWith(sessionPath)) {
						result = (length == sessionPath.length()) ? SESSION_URL_PATH + "/" : SESSION_URL_PATH
								+ result.substring(sessionPath.length());
					}
				}
			}
		}
		return result;
	}

	public String getServletPath() {
		if (servletPath != null) {
			return servletPath;
		} 
		String result = getMappedResource().replaceFirst("@", "?");
		int pos = result.indexOf("?");
		if (pos != -1) {
			result = result.substring(0, pos);
		}
		if (sessionId != null) {
			if (result.length() == 0) {
				result = sessionId;
			} else {
				result += sessionId;
			}
		}
		servletPath = result;
		return result;
	}
	
	public RequestDispatcher getRequestDispatcher(String uri) {
		final HttpServletRequest httpRequest = (HttpServletRequest) super.getRequest();
		final RequestDispatcher rd = httpRequest.getRequestDispatcher(uri);
		return new RequestDispatcher() {
			public void forward(ServletRequest servletRequest,
					ServletResponse servletResponse) throws ServletException,
					IOException {
				rd.forward(httpRequest, servletResponse);
				if (!servletResponse.isCommitted()
					&& servletResponse instanceof ResponseWrapper) {
					((ResponseWrapper) servletResponse).flush();
				}
			}

			public void include(ServletRequest servletRequest,
					ServletResponse servletResponse) throws ServletException,
					IOException {
				rd.include(httpRequest, servletResponse);
			}
		};
	}
	
}
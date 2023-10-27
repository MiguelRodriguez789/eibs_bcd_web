package datapro.eibs.plugins;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.PropertyResourceBundle;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.datapro.generic.XORShiftRandom;
import com.datapro.generic.tool.Util;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.WildcardMatcher;

/**
 * @author fhernandez
 * 
 */
public class AuthorizationManager {

	public static final String AUTHORIZATION_SERVLET = "/eIBSResource";
	public static final String AUTHORIZATION_ID = "eibsId";
	
	private static final Logger logger = Logger.getLogger(AuthorizationManager.class.getName());
	private static PropertyResourceBundle properties;
	private static String mapClass = "java.util.HashMap";
	private static String nonceClass = "java.security.SecureRandom";
	private static String encoderClass = "datapro.eibs.plugins.RequestEncoder";

	protected static int thresholdSize = 1000;
	protected static int thresholdPeriod = 300;
	protected static Boolean active;
	protected static Boolean secure;
	protected static Boolean encryption;
	protected static String checkSum_digest;
	protected static String[] authorizers;
	protected static String[] unfiltered_dirs;
	protected static String[] unfiltered_resources;
	protected static String[] application_dirs = {"pages"};
	protected static String[] content_types_no = {"image*", "application*", "video*", "audio*"};
	protected static String[] content_types_on = {"*javascript", "*json"};
	protected static String[] resource_types_no = {"css", "js", "gif", "jpg", "png", "ogg", "mp3", "au", "swf", "zip", "exe"};
	
	static {
		try {
			properties = (PropertyResourceBundle) PropertyResourceBundle.getBundle(
					System.getProperty("Authorization.properties", "Authorization"));
			ArrayList content_types_NO = new ArrayList();
			ArrayList content_types = new ArrayList();
			ArrayList resource_types_NO = new ArrayList();
			ArrayList application_paths = new ArrayList();
			ArrayList unfiltered_paths = new ArrayList();
			
			for (Enumeration keys = properties.getKeys();
					keys.hasMoreElements();
					) {
				String key = (String) keys.nextElement();
				String value = properties.getString(key);
	 			if (key.indexOf("content.type.no") == 0) {
	 				content_types_NO.add(value);
				} else if (key.indexOf("content.type") == 0) {
					content_types.add(value);
				} else if (key.indexOf("resource.type.no") == 0) {
					resource_types_NO.add(value);
				} else if (key.indexOf("resource.path.no") == 0) {
					unfiltered_paths.add(value);
				} else if (key.indexOf("resource.path") == 0) {
					application_paths.add(value);
				} else if (key.indexOf("map.class") == 0) {
					mapClass = value;
				} else if (key.indexOf("nonce.class") == 0) {
					nonceClass = value;
				} else if (key.indexOf("encoder.class") == 0) {
					encoderClass = value;
				} else if (key.indexOf("threshold.size") == 0) {
					thresholdSize = Integer.parseInt(value);
				} else if (key.indexOf("threshold.period") == 0) {
					thresholdPeriod = Integer.parseInt(value);
				} else if (key.indexOf("resource.hash") == 0) {
					checkSum_digest = value;
				}	 			
			}
			
			if (!content_types_NO.isEmpty()) {
				content_types_no = (String[]) content_types_NO.toArray(new String[content_types_NO.size()]);
			}
			if (!content_types.isEmpty()) {
				content_types_on = (String[]) content_types.toArray(new String[content_types.size()]);
			}
			if (!resource_types_NO.isEmpty()) {
				resource_types_no = (String[]) resource_types_NO.toArray(new String[resource_types_NO.size()]);
			}
			if (!application_paths.isEmpty()) {
				application_dirs = (String[]) application_paths.toArray(new String[application_paths.size()]);
			}
			if (!unfiltered_paths.isEmpty()) {
				unfiltered_dirs = (String[]) unfiltered_paths.toArray(new String[unfiltered_paths.size()]);
			}
			
		} catch (Exception e) {
			logger.warning(e.getMessage());
		}
	}
	
	public static boolean isActive(ServletContext context) {
		if (active == null) {
			init(context);
		}
		if (active != null) {
			return active.booleanValue();
		}
		return false;
	}
	
	public static void init(FilterConfig config) {
		if (config != null){
			if (config.getInitParameter("response") != null) {
				active = new Boolean(config.getInitParameter("response"));
			}
			if (config.getInitParameter("unfiltered_resources") != null) {
				//Unfiltered resources configured on web.xml
				unfiltered_resources = Util.split(config.getInitParameter("unfiltered_resources"), ",");
				logger.log(Level.CONFIG, Arrays.toString(unfiltered_resources));

			}
			if (config.getInitParameter("unfiltered_dirs") != null) {
				unfiltered_dirs = Util.split(config.getInitParameter("unfiltered_dirs"), ",");
			}
			if (config.getInitParameter("authorizers") != null) {
				AuthorizationManager.authorizers(config);
			}
		}
		init(config.getServletContext());
	}
	
	public static void init(ServletContext context) {
		if (secure == null) {
			secure = Boolean.valueOf(context.getInitParameter("cookieSecure"));
		}
		if (encryption == null) {
			encryption = Boolean.valueOf(context.getInitParameter("cookieEncryption"));
		}
		if (context.getInitParameter("authorizers") != null) {
			AuthorizationManager.authorizers(context);
		}
		if (context.getInitParameter("response") != null) {
			active = new Boolean(context.getInitParameter("response"));
		}
	}
	
	private static String[] authorizers(String parameter) {
		if (parameter != null) {
			logger.finest("Authorizers found: " + parameter);
			//authorizers resources configured on web.xml
			authorizers = parameter.split(",");
			if (authorizers != null && authorizers.length > 0) {
				for (int i = 0; i < authorizers.length; i++) {
					authorizers[i] = authorizers[i].trim();
				}
				return authorizers;
			}
		}
		return authorizers;
	}

	public static String[] authorizers(ServletContext context) {
		if (authorizers == null) {
			if (context != null){
				authorizers(context.getInitParameter("authorizers"));
			}
		}
		if (authorizers == null) {
			logger.info("No authorizers found, please verify the configuration");			
		}
		return authorizers;
	}
	
	public static String[] authorizers(FilterConfig config) {
		if (authorizers == null) {
			if (config != null){
				authorizers(config.getInitParameter("authorizers"));
			}
		}
		if (authorizers == null) {
			logger.info("No authorizers found, please verify the configuration");			
		}
		return authorizers;
	}
	
	public static boolean isAuthorizer(String resource, String[] authorizers) {
		if (resource.equals("/")) {
			return true;
		}
		for (int i = 0; i < authorizers.length; i++) {
			if (authorizers[i] != null) {
				logger.finest("Matching with authorizer: " + authorizers[i]);
				if (resource.indexOf(authorizers[i]) != -1) {
					logger.finest(resource + ", is an authorizer");
					return true;
				}
			}
		}
		logger.finest(resource + ", is not an authorizer");
		return false;
	}
	
	public static boolean isAuthorizer(String resource, ServletContext context) {
		return isAuthorizer(resource, authorizers(context));
	}
	
	public static boolean isAuthorizer(String resource) {
		return isAuthorizer(resource, authorizers);
	}
	
	public static boolean isValidSession(HttpServletRequest httpServletRequest){
		HttpSession session = httpServletRequest.getSession(false);
		if (session != null) {
			ESS0030DSMessage msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
			if (msgUser != null) {
				return true;
			}
		}
		return false;
	}

	public static boolean isControlledResource(HttpServletRequest httpRequest, String[] dir, String[] unfiltered) {
		//TODO Overload this method so the controlled resources are read from a configuration file
		String resource = AuthorizationManager.getResourcePath(httpRequest);
		if (!isFiltered(resource)) {
			return false;
		}
		if (dir != null) {
			for (int i = 0; i < dir.length; i++) {
				if (dir[i] != null) {
					String entry = dir[i].trim();
					if (resource.indexOf(entry) == 1
						&& resource.length() > (entry.length()+1)
						&& resource.charAt(1+entry.length()) == '/') {
						return false;
					}
				}
			}
		}
		for (int i = 0; i < application_dirs.length; i++) {
			if (application_dirs[i] != null) {
				if (resource.indexOf(application_dirs[i]) == 1) {
					resource = resource.substring(application_dirs[i].length()+1);
				}
			}
		}
		if (unfiltered != null) {
			for (int i = 0; i < unfiltered.length; i++) {
				if (unfiltered[i] != null) {
					String entry = unfiltered[i].trim();
					if (resource.indexOf(entry) > 0) {
					//if (resource.indexOf(entry) >= 0) {
						return false;
					}
				}
			}
		}
		if (resource.indexOf('/', 1) > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public static boolean isControlledResource(HttpServletRequest httpRequest) {
		return isControlledResource(httpRequest, unfiltered_dirs, unfiltered_resources);
	}

	private static boolean matches(String text, String pattern){
		/* 
		//There is no need of complex patterns
		if (pattern.endsWith("*")) {
			return text.endsWith(pattern);
		} else if (pattern.startsWith("*")) {
			return text.startsWith(pattern);
		} else {
			return text.equals(pattern);
		}
		*/
		return new WildcardMatcher(pattern).matches(text);
	}
	
	public static boolean isModifiable(String type){
		if (type == null) {
			return true;
		}
		if (type.indexOf(";") > 0) {
			type = type.substring(0, type.indexOf(";"));
		}
		type = type.trim().toLowerCase();
		if (type.startsWith("text")
			|| type.equals("application/x-javascript")
			|| type.equals("application/javascript")
			|| type.equals("application/json")) {
			//The most used content types that must be protected to avoid wasting time
			return true;
		}
		if (type.startsWith("image")
			|| type.startsWith("video")
			|| type.startsWith("audio")) {
			//The most used content types that shouldn't be protected to avoid wasting time
			return false;
		}
		
		boolean modify = true;
		if (content_types_no != null) {
			for (int i = 0; i < content_types_no.length && modify; i++) {
				if (content_types_no[i] != null) {
					modify = !matches(type, content_types_no[i].trim());
				}
			}
		}
		if (!modify && content_types_on != null) {
			for (int i = 0; i < content_types_on.length && !modify; i++) {
				if (content_types_on[i] != null) {
					modify = matches(type, content_types_on[i].trim());
				}
			}
		}
		return modify;
	}
	
	public static boolean isFiltered(String resourcePath) {
		String type = resourcePath.toLowerCase();
		if (type.endsWith("/")) {
			return false;
		}
		if (type.endsWith(".js")
			|| type.endsWith(".gif")
			|| type.endsWith(".jpg")
			|| type.endsWith(".png")){
			//The most used unfiltered types to avoid wasting time
			return false;
		}
		boolean filtered = true;
		if (resource_types_no != null) {
			for (int i = 0; i < resource_types_no.length && filtered; i++) {
				if (resource_types_no[i] != null) {
					String entry = resource_types_no[i].trim();
					filtered = !type.endsWith("."+entry);
				}
			}
		}
		return filtered;
	}
	
	public static boolean isHashedResource(HttpServletRequest req, String href) {
	    if (null != AccessVersion.getJSMap(href.substring(href.indexOf(req.getContextPath())))) {
	        return true;
	    } else {
	        return false;
	    }
	}
	
	public static boolean needsHashing(HttpServletRequest req, String href) {
	    if (null != AccessVersion.getHashMap(href.substring(href.indexOf(req.getContextPath())))) {
	        return true;
	    } else {
	        return false;
	    }
	}	
	
	/**
	 * Says if the resource path is a mapped reference.
	 * @param resourcePath
	 * @return <code>true</code> if the resource is a mapped reference, 
	 * <code>false</code> otherwise
	 */
	public static boolean isMapped(HttpServletRequest request, String resourcePath) {
		if (resourcePath.startsWith(request.getContextPath())) {
			resourcePath = resourcePath.substring(request.getContextPath().length());
		}
        if (resourcePath.indexOf(AuthorizationManager.AUTHORIZATION_SERVLET +"?resource=" +
        		AuthorizationManager.AUTHORIZATION_ID) == 0){
            return true;
        }
        return false;
	}

	/**
	 * Says if the resource path is an unmapped reference.
	 * @param resourcePath
	 * @return <code>true</code> if the real resource wasn't found through the mapped reference, 
	 * <code>false</code> otherwise
	 */
	public static boolean isUnmapped(String resourcePath) {
        if (resourcePath.indexOf(AuthorizationManager.AUTHORIZATION_SERVLET) == -1
    		&& resourcePath.indexOf(AuthorizationManager.AUTHORIZATION_ID) == 0) {
        	return true;
        }
        return false;
	}
	
	public static String getResourcePath(HttpServletRequest request) {
		String resourcePath = request.getServletPath();
		if (resourcePath == null || resourcePath.equals("")) {
			resourcePath = request.getRequestURI().substring(request.getContextPath().length());
		} else if (resourcePath.indexOf(AuthorizationManager.AUTHORIZATION_SERVLET) == -1
			&& resourcePath.indexOf(AuthorizationManager.AUTHORIZATION_ID) != -1) {
			if (resourcePath.endsWith("ESS0030_LogIn.jsp")){
				String path = resourcePath.substring(resourcePath.indexOf("/", 1));
				resourcePath = JSEIBSProp.getRootPath() + 
					(path.startsWith("/") ?  path.substring(1) : path);
			} else {
				logger.info("Resource not found for id: " + resourcePath);
			}
		}
		return resourcePath;
	}
	
	public static String removeRequestURI(String value) {
		String SEQUENCE = AuthorizationManager.AUTHORIZATION_SERVLET +"?resource=";
		int pos = value.indexOf(SEQUENCE);
		String result = pos != -1 ?  value.substring(pos + SEQUENCE.length(), value.length() - 1) : value;
		return result;
	}
	
	public static Random newRandom(){
		try {
			if (nonceClass.equals("java.security.SecureRandom")) {
				return SecureRandom.getInstance("SHA1PRNG");
			} else {
				return (Random) Class.forName(nonceClass).newInstance();
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
			logger.info("Returning Simple Random implementation: " + XORShiftRandom.class.getName());
			return new XORShiftRandom();
		}
	}
	
	public static long sessionTime(HttpSession session) {
		long newTime = System.nanoTime();
		AccessSecurity accessSecurity = (AccessSecurity) session.getAttribute("AccessSecurity");
		if (accessSecurity != null) {
			if (accessSecurity.getAccessTime() >= newTime) {
				newTime = accessSecurity.getAccessTime() + 1;
			}
			accessSecurity.setAccessTime(newTime);
		}
		return newTime;
	}
	
	public static Map newMap(){
		try {
			return (Map) Class.forName(mapClass).newInstance();
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
			return new HashMap();
		}
	}
	
	public static RequestEncoder newEncoder(){
		try {
			return (RequestEncoder) Class.forName(encoderClass).newInstance();
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
			return RequestEncoder.getInstance();
		}
	}
	
	public static Map getSecureContext(HttpSession session){
		Map secureRequestMap = null;
		AccessSecurity menuSecurity = (AccessSecurity) session.getAttribute("AccessSecurity");
		if (menuSecurity != null) {
			secureRequestMap = menuSecurity.getSecureRequestMap();
		}
		if (secureRequestMap == null) {
			secureRequestMap = (Map) session.getAttribute("secureRequestMap");
		}
		if (secureRequestMap == null) {
			secureRequestMap =  newMap();
		}
		if (menuSecurity == null) {
			session.setAttribute("secureRequestMap", secureRequestMap);
		} else {
			menuSecurity.setSecureRequestMap(secureRequestMap);
			session.removeAttribute("secureRequestMap");
		}
		return secureRequestMap;
	}
	
	public static Map getSecureContext(HttpServletRequest httpRequest){
		return getSecureContext(httpRequest.getSession(false));
	}
	
	public static Cookie newCookie(AccessSecurity accessSecurity, String name, String value){
		Cookie cookie = null;
		if (encryption != null) {
			if (encryption.booleanValue()) {
				try {
					if (accessSecurity != null) {
						cookie = new Cookie(name, accessSecurity.getEncryptedValue(value));
					}
				} catch (Exception e) {
					logger.finest(e.getMessage());
				}
			}
		}
		if (cookie == null) {
			cookie = new Cookie(name, value);
		}
		return cookie;
	}
	
	public static Cookie newCookie(HttpSession session, String name, String value){
		Cookie cookie = null;
		if (encryption != null) {
			if (encryption.booleanValue()) {
				try {
					AccessSecurity accessSecurity = (AccessSecurity) session.getAttribute("AccessSecurity");
					if (accessSecurity != null) {
						cookie = new Cookie(name, accessSecurity.getEncryptedValue(value));
					}
				} catch (Exception e) {
					logger.finest(e.getMessage());
				}
			}
		}
		if (cookie == null) {
			cookie = new Cookie(name, value);
		}
		return cookie;
	}
	
	public static Cookie newCookie(HttpServletRequest httpRequest, String name, String value){
		return newCookie(httpRequest.getSession(false), name, value);
	}
	
	public static String getDigestType(){
		return checkSum_digest;
	}	
			
}
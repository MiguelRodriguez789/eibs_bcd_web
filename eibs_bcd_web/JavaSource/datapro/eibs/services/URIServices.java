package datapro.eibs.services;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.ConsoleHandler;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import com.datapro.eibs.facade.FAJSUrl;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.SuperServlet;

/**  
 * @author jlbuitrago  
 *   
 * @version 2.00 8th june 2017.  
 */  
public class URIServices {
	private static String propertyFileName = "HelpURI.properties";
	
	private static Properties helpUriProp; 
	private static Logger logger = Logger.getLogger(URIServices.class.getName());
	private static ConsoleHandler handler = new ConsoleHandler();
	private static Map<String,String> URImap;
	
	static{
		//Change logger Type to output accordingly
		logger.setUseParentHandlers(false);
		logger.setLevel(JSEIBSProp.getLog() == SuperServlet.LOG ? Level.INFO : Level.FINE);
		handler.setLevel(JSEIBSProp.getLog() == SuperServlet.LOG ? Level.INFO : Level.FINE);
		logger.addHandler(handler);

		//Load Help Properties
		helpUriProp = new Properties();
		try {
			InputStream is = URIServices.class.getClassLoader().getResourceAsStream(propertyFileName);
			try {
				helpUriProp.load(is);
			} finally {
				if(null!=is){
					is.close();
				}
			}
		} catch (IOException ex) {
			helpUriProp = null;
		}	
	
	}
	
	public static ESS0030DSMessage getSessionUser(HttpServletRequest request){
		return (ESS0030DSMessage) request.getSession(false).getAttribute("currUser");
	}
	
	public static String getHelpURI(HttpServletRequest request, String key) {
		String resourcePath = null;
		
		if(null != helpUriProp ){
			resourcePath = getPathFromPropertyFile(key);
		} else {
			resourcePath = getPathFromDatabseFile(request,key);
		}
		return resourcePath;
	}

	private static String getPathFromDatabseFile(HttpServletRequest request,String key) {
		String resourcePath = null;

		if(null != URImap){//Check if in Map
			resourcePath = URImap.get(key);
			logger.log(Level.FINE, "HelpURI :" + resourcePath);
		}
		if(null == resourcePath) { //Not in Map, Open Connection
			try {
				FAJSUrl service = new FAJSUrl();
				service.setSessionUser(getSessionUser(request));
				resourcePath = service.getURL(key);
				if(null == URImap){
					URImap = new ConcurrentHashMap<String,String>();
				}
				URImap.put(key, resourcePath);
			} catch (Exception e) {
				logger.log(Level.INFO, "\tURL not found :\t" + key);
			} finally {
				logger.log(Level.FINE, "HelpURI :" + resourcePath);
			}
		}
		return resourcePath;
	}

	private static String getPathFromPropertyFile( String key) {
		return null != helpUriProp ? helpUriProp.getProperty(key) : "";
	}
}  

package datapro.eibs.plugins;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;

import datapro.eibs.master.JSEIBSProp;

public class AccessVersion  {
	
	public static final Logger logger = Logger.getLogger(AccessVersion.class.getName());
	private static Map<String, String> resourceMap = AuthorizationManager.newMap();
	private static Map<String, String> filteredMap = AuthorizationManager.newMap();
	private static String DIGEST_TYPE = AuthorizationManager.getDigestType();
	private static final int STREAM_BUFFER_LENGTH = 1024;

	public AccessVersion() {
		super();
	}
	
	public static void mapResource(URI uri, ServletContext sc) 
			throws IOException{
		InputStream is = null;
		String hashString = null; String uristr = null; String resourcePath = null;
		
		if(null != uri){ 
			uristr = uri.getPath();
			try{//Digest From Authorization Property Files
				//To Avoid Errors with relative path, hashed values will use "rootPath" as base directory
				MessageDigest md = MessageDigest.getInstance(DIGEST_TYPE);
				is = sc.getResourceAsStream (uristr);
				hashString = sc.getContextPath() + JSEIBSProp.getRootPath() + getDigest(is, md, STREAM_BUFFER_LENGTH) +  uristr.substring(uristr.lastIndexOf("."));
				resourcePath = sc.getContextPath() + uristr;
			}catch(Exception e){ 
                logger.log(Level.INFO, String.format("URI STRING was not mapped :  %s ", uristr));
				resourcePath = null;
			} finally {
				if(null != is) is.close();
			}
			
			//Not Already Mapped
			if(null == resourceMap.get(hashString) && null != resourcePath){
				resourceMap.put(hashString , uristr.substring(uristr.lastIndexOf(JSEIBSProp.getRootPath()) + JSEIBSProp.getRootPath().length()) );
				filteredMap.put(resourcePath ,hashString);
			}
		}
	}
	
	//ResourceMap -> getUnhashed filename
	public static String getJSMap(String key){
		String val = null;
		if(null != resourceMap){
			val = (String) resourceMap.get(key);
		}
		return val;
	}

	//filteredMAp -> getHashed filename
	public static String getHashMap(String key){
		String val = null;
		if(null != filteredMap){
			val = (String) filteredMap.get(key);
		}
		return val;
	}
	
	public static String getDigest(InputStream is, MessageDigest md, int byteArraySize)
			throws NoSuchAlgorithmException, IOException {
		String result = null;
		md.reset();
		byte[] bytes = new byte[byteArraySize];
		int numBytes;
		while ((numBytes = is.read(bytes)) != -1) {
			md.update(bytes, 0, numBytes);
		}
		byte[] digest = md.digest();
	    //convert the byte to hex format
	    StringBuffer sb = new StringBuffer("");
	    for (int i = 0; i < digest.length; i++) {
	    	sb.append(Integer.toString((digest[i] & 0xff) + 0x100, 16).substring(1));
	    }
	    
	    result = sb.toString(); 
		return result;
	}	
	
}

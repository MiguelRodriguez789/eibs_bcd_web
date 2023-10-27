package datapro.eibs.plugins;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;

import org.apache.commons.lang.StringUtils;
import org.owasp.esapi.ESAPI;
import org.owasp.esapi.Encoder;

public class RequestEncoderESAPI extends RequestEncoder {

	private static Encoder enc = ESAPI.encoder();
	
	public static RequestEncoder getInstance() {
		return new RequestEncoderESAPI();
	}
	
	private static boolean classExists(String className)	{
	    try{
	        Class.forName(className);
	        return true;
	    } catch(ClassNotFoundException ex) {
	        return false;
	    }
	}	
	
	protected boolean isValidJson(String json) {
		if (JSONUtils.mayBeJSON(json)) {
			try {
				JSONObject.fromObject(json);
				return true;
			} catch (JSONException ex) {
				try {
					JSONArray.fromObject(json);
					return true;
				} catch (Exception e) {
					return false;
				}
			}
		} else {
			return false;
		}
	}
	
	@Override
	public String canonicalize(String value) {
		String clssNm = null;
		int servletindex;
		if(value.contains("/servlet/")){
			servletindex = StringUtils.ordinalIndexOf(value, "/", 2) + 1;
			 if(value.indexOf("?") > -1){
				 clssNm = value.substring(servletindex ,  value.indexOf("?"));
			 } else {
				 clssNm = value.substring(servletindex);
					 
			 }
			 if(classExists(clssNm)){
				 return value;
			 }
		}
		if (!isValidJson(value)) {
			return enc.canonicalize(value);
		}
		return value;
	}

}

package datapro.eibs.plugins;

import java.util.regex.Pattern;


public class RequestEncoder {
	
	public static RequestEncoder getInstance() {
		return new RequestEncoder();
	}
	
	private static Pattern[] patterns = new Pattern[]{
        // Script fragments
        Pattern.compile("<script>(.*?)</script>", Pattern.CASE_INSENSITIVE),
        // src='...'
        Pattern.compile("src[\r\n]*=[\r\n]*\\\'(.*?)\\\'", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        Pattern.compile("src[\r\n]*=[\r\n]*\\\"(.*?)\\\"", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // lonely script tags
        Pattern.compile("</script>", Pattern.CASE_INSENSITIVE),
        Pattern.compile("<script(.*?)>", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // eval(...)
        Pattern.compile("eval\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // expression(...)
        Pattern.compile("expression\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // javascript:...
        Pattern.compile("javascript:", Pattern.CASE_INSENSITIVE),
        // vbscript:...
        Pattern.compile("vbscript:", Pattern.CASE_INSENSITIVE),
        // onload(...)=...
        Pattern.compile("onload(.*?)=", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL)
    };
	
	/**
	 * Canonicalize the request parameter.
	 * Although the parameters are decoded by the container 
	 * it's recommended to implement specialized methods for canonicalization to avoid encoded attacks.
	 * One such recommended implementations is the ESAPI library.
	 * 
	 * @param value
	 * @return the string parameter to canonicalize
	 */
	public String canonicalize(String value) {
		//A basic implementation is given. subclasses should implement specialized methods of canonicalization.
		return value;
	}
	
	public String filterRequestParameters(String value){
		if (value == null || value.length() == 0) {
			return value;
		}
		value = canonicalize(value);
		
        // Remove all sections that match a pattern
		for (int i = 0; i < patterns.length; i++) {
			Pattern scriptPattern = patterns[i];
			value = scriptPattern.matcher(value).replaceAll("");
		}            
        // Avoid null characters
		value = value.replaceAll("\0", "");
		
        return value;
	}

}

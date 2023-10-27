package datapro.eibs.plugins;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.datapro.generic.tool.Util;
import com.datapro.security.SecurePasswordEncryptor;

/**
 * @author fhernandez
 * 
 */
public class AuthorizationMapper {
	
	public static final Logger logger = Logger.getLogger(AuthorizationMapper.class.getName());

	private HttpServletRequest httpRequest;
	private ResponseWrapper httpResponse;
	private HttpSession session;
	private AccessSecurity accessSecurity;
	private AuthorizationKey authorizationKey;
	private String secureId;
	private int sequence;
	private ArrayList list;
	
	public AuthorizationMapper(HttpServletRequest httpRequest, ResponseWrapper httpResponse) {
		super();
		this.httpRequest = httpRequest;
		this.httpResponse = httpResponse;
		this.session = httpRequest.getSession(false);
	}
	
	public AuthorizationMapper(HttpServletRequest httpRequest) {
		this(httpRequest, null);
	}
	
	private AccessSecurity getAccessSecurity() {
		if (accessSecurity == null) {
			accessSecurity = (AccessSecurity) session.getAttribute("AccessSecurity");
		}
		return accessSecurity;
	}
	
	private void generateKeys(){
		if (authorizationKey == null) {
			list = new ArrayList();
			sequence = 0;
			if (getAccessSecurity() != null) {
				try {
					authorizationKey = new AuthorizationKey(AuthorizationManager.sessionTime(session), 
							getAccessSecurity().getNonce().intValue());
					secureId = getAccessSecurity().getEncryptedValue(
							""+authorizationKey.getNonce(), SecurePasswordEncryptor.STRING_OUTPUT_TYPE_HEXADECIMAL);
				} catch (Exception e) {
					logger.finest(e.getMessage());
				}
			}
			if (authorizationKey == null) {
				authorizationKey = new AuthorizationKey(AuthorizationManager.sessionTime(session));
				secureId = ""+authorizationKey.getNonce();
			}
		}
	}
	
	/**
	 * Merge the two sets of parameter values into a single String array.
	 *
	 * @param values1 First set of values
	 * @param values2 Second set of values
	 */
	public String[] mergeValues(Object values1, Object values2) {
		ArrayList results = new ArrayList();
		if (values1 == null)
			;
		else if (values1 instanceof String)
			results.add(values1);
		else if (values1 instanceof String[]) {
			String values[] = (String[]) values1;
			for (int i = 0; i < values.length; i++)
				results.add(values[i]);
		} else
	  		results.add(values1.toString());

		if (values2 == null)
			;
		else if (values2 instanceof String)
			results.add(values2);
		else if (values2 instanceof String[]) {
			String values[] = (String[]) values2;
			for (int i = 0; i < values.length; i++)
				results.add(values[i]);
			} else
				results.add(values2.toString());
		
		String values[] = new String[results.size()];
		return ((String[]) results.toArray(values));
	}
	
	private Object getResource(AuthorizationKey resourceKey){
		if (getAccessSecurity() != null) {
			return getAccessSecurity().getResource(resourceKey);
		} else {
			return AuthorizationManager.getSecureContext(httpRequest).get(resourceKey);
		}
	}
	
	private String getResource(AuthorizationKey resourceKey, int sequence){
		List list = (List)getResource(resourceKey);
		if (list != null && list.size() >= sequence) {
			return (String) list.get(sequence-1);
		}
		return null;
	}
	
	private void mapResource(AuthorizationKey resourceKey, boolean cache){
		if (list != null) {
			list.trimToSize();
			if (getAccessSecurity() != null) {
				accessSecurity.mapResource(resourceKey, list, cache);
			} else {
				AuthorizationManager.getSecureContext(httpRequest).put(resourceKey, list);
			}
		}
	}
	
	private void addUrl(String url){
		if (url.length() > 10000) {
			logger.info("Mapping big URL:" + url);
		}
		sequence++;
		list.add(url);
	}
	
	private String mapUrl(StringBuffer result, String href){
		int length = httpRequest.getContextPath().length();
		if (href.equals("")) {
			//Do nothing
		} else if (AuthorizationManager.isMapped(httpRequest, href.substring(length))) {
			result.append(href);
		} else if (AuthorizationManager.needsHashing(httpRequest, href) && !AuthorizationManager.isFiltered(href)) {
			result.append( AccessVersion.getHashMap(href));			
		} else if (!AuthorizationManager.isFiltered(href)) {
			result.append(href);
		} else if (AuthorizationManager.isAuthorizer(href)) {
			result.append(href);
		} else {
			addUrl(href.substring(length));
			href = httpRequest.getContextPath()
					+ AuthorizationManager.AUTHORIZATION_SERVLET + "?resource="
					+ AuthorizationManager.AUTHORIZATION_ID + "_" + sequence
					+ "_" + authorizationKey.getTime() + "_" + secureId;
			result.append(href);
		}
		return href;
	}

	public String unmapURI(String responseString) {
		if (session != null) {
			int ini = 0;
			int end = 0;
			int length = responseString.length();
			if (responseString.startsWith("/")) {
				ini = 1;
			}
			end = responseString.indexOf('/', ini);
			if (end < ini) {
				end = responseString.length();
			} else {
				if (responseString.endsWith("/")) {
					length = responseString.length()-1;
				} else {
					length = responseString.length();
				}
			}
			String resource = null;
			String[] keys = Util.split(responseString.substring(ini, end), "_");
			if (keys.length > 3) {
				try {
					String secureId = keys[3];
					if (getAccessSecurity() != null) {
						secureId = getAccessSecurity().getDecryptedValue(secureId, SecurePasswordEncryptor.STRING_OUTPUT_TYPE_HEXADECIMAL);
					}
					resource = getResource(new AuthorizationKey(keys[2], secureId), Integer.parseInt(keys[1]));
				} catch (Exception e) {
					logger.finest(e.getMessage());
				}
			}
			if (resource != null) {
				if (end < length) {
					responseString = resource + responseString.substring(end, length);
				} else {
					responseString = resource;
				}
			}
		}
		return responseString;
	}
	
	private int indexOfAll(String subString, int start){
		int posx = 0;
		int posQuote = subString.indexOf('\'', start);
		int posDouble = subString.indexOf('"', start);
		int posQuestion = subString.indexOf('?', start);
		if (posQuote == -1 && posDouble == -1 && posQuestion == -1)
			posx = subString.length();
		else if (posQuote != -1 && posDouble == -1 && posQuestion == -1)
			posx = posQuote;
		else if (posDouble != -1 && posQuote == -1 && posQuestion == -1)
			posx = posDouble;
		else if (posQuestion != -1 && posDouble == -1 && posQuote == -1)
			posx = posQuestion;
		else if ((posDouble == -1 && posQuote < posQuestion)
			|| (posQuestion == -1 && posQuote < posDouble))
			posx = posQuote;
		else if ((posQuote == -1 && posDouble < posQuestion)
			|| (posQuestion == -1 && posDouble < posQuote))
			posx = posDouble;
		else if ((posQuote == -1 && posQuestion < posDouble)
			|| (posDouble == -1 && posQuestion < posQuote))
			posx = posQuestion;
		else if (posQuote < posDouble && posQuote < posQuestion)
			posx = posQuote;
		else if (posDouble < posQuote && posDouble < posQuestion)
			posx = posDouble;
		else if (posQuestion < posQuote && posQuestion < posDouble)
			posx = posQuestion;
		return posx;
	}
	
	private int indexOfSeparator(String subString, int start){
		int posx = 0;
		int posQuestion = subString.indexOf('?', start);
		if (posQuestion == -1)
			posx = subString.length();
		else if (posQuestion != -1)
			posx = posQuestion;
		return posx;
	}
	
	private int indexOfQuote(String subString, int start){
		int posx = 0;
		int posQuote = subString.indexOf('\'', start);
		int posDouble = subString.indexOf('"', start);
		if (posQuote == -1 && posDouble == -1)
			posx = subString.length();
		else if (posQuote != -1 && posDouble == -1)
			posx = posQuote;
		else if (posDouble != -1 && posQuote == -1)
			posx = posDouble;
		else if (posDouble == -1 || posQuote < posDouble)
			posx = posQuote;
		else if (posQuote == -1 || posDouble < posQuote)
			posx = posDouble;
		else if (posQuote < posDouble)
			posx = posQuote;
		else if (posDouble < posQuote)
			posx = posDouble;
		return posx;
	}
	
	private boolean isQuote(String responseString, int offset){
		return offset > 1
				&& offset < responseString.length()
				&& (responseString.charAt(offset) == '\''
					|| responseString.charAt(offset) == '\"');
	}
	
	private boolean onQuote(String responseString, int offset){
		return isQuote(responseString, offset - 1)
			&& isQuote(responseString, offset - 2);
	}
	
	private int getNextString(String responseString, StringBuffer nextString, int end, boolean encode){
		int offset = end;
		if (offset < responseString.length()){
			int start = offset;
			end = indexOfQuote(responseString, start+1);
			String string = responseString.substring(start, end);
			int posc = string.indexOf(httpRequest.getContextPath());
			if (posc == 0){
				mapUrl(nextString, string);
			} else if (posc != -1){
				start = start+posc;
				nextString.append(responseString.substring(offset, start));
				end = indexOfAll(responseString, start);
				mapUrl(nextString, 
					responseString.substring(start, end));
			} else {
				nextString.append(string);
			}
			if (end < responseString.length() 
				&& responseString.charAt(end) == '?') {
				int posAt = responseString.indexOf('@', end);
				if (posAt != -1) {
					//If @ has been used as a means to encode the query string
					int posAmpersand = responseString.indexOf('&', end);
					if (posAt < posAmpersand || posAmpersand == -1) {
						end = getNextString(responseString, 
								nextString.append("@"), ++end, encode);
					}
				} else {
					end = getNextString(responseString,
							nextString.append(encode ? "&amp;" : "&"), ++end, encode);
				}
			}
		}
		if (offset > end) {
			nextString.append(responseString.substring(end, offset));
			return offset;
		}
		return end;
	}
	
	public String mapURI(String uri){
		return mapURI(uri, false);
	}
	
	public String mapURI(String responseString, boolean cache){
		if (session != null) {
			int length = httpRequest.getContextPath().length();
			int offset = responseString.indexOf(httpRequest.getContextPath());
			if (offset > -1) {
				generateKeys();
				boolean isXML = false;
				if (httpResponse != null && httpResponse.getContentType() != null) {
					isXML = httpResponse.getContentType().toLowerCase().endsWith("xml");
				}
				StringBuffer result = new StringBuffer();
				int posx = 0;
				while (offset > -1) {
					if (onQuote(responseString, offset)){
						result.append(responseString.substring(posx, offset-1));
						posx = getNextString(responseString, result, offset-1, isXML);
					} else {
						result.append(responseString.substring(posx, offset));
						posx = indexOfQuote(responseString, offset);
						String href = responseString.substring(offset, posx);
						int end = 0;
						if (AuthorizationManager.isMapped(httpRequest, href.substring(length))){
							end = offset + indexOfQuote(href, 0);
						} else {
							end = offset + indexOfAll(href, 0);
						}
						if (href.endsWith("=")) {
							href = responseString.substring(offset, end);
						}
						href = mapUrl(result, href);
						if (end < responseString.length() 
							&& responseString.charAt(end) == '?'){
							end = getNextString(responseString, 
									result.append(isXML ? "&amp;" : "&"), ++end, isXML);
						}
						if(isQuote(responseString, posx)){
							posx = getNextString(responseString, 
									result, posx, isXML);
						}
					}
					offset = responseString.indexOf(httpRequest.getContextPath(), posx);
				}
				mapResource(authorizationKey, cache);
				result.append(responseString.substring(posx));
				return result.toString();
			} 
		}
		return responseString;
	}
		
	public String mapURI(byte[] response) {
		return mapURI(new String(response));
	}
	
}
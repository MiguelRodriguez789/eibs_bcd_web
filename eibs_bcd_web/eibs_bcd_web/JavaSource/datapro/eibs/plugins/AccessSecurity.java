/*
 * Created on Nov 17, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.plugins;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.Collator;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Logger;

import com.datapro.generic.tool.Util;
import com.datapro.security.SecurePasswordEncryptor;

import datapro.eibs.master.JSEIBSProp;

/**
 * @author fhernandez
 */
public class AccessSecurity  {
	
	public static final Logger logger = Logger.getLogger(AccessSecurity.class.getName());
	private static final int DEFAULT_REFRESH_PERIOD = 300;

	private final SessionNonceProvider nonceProvider = new SessionNonceProvider();
	private String menuOption;
	private String menuSequence;
	private long accessTime;
	private Number nonce;
	private String securityId;
	private Map mainMenu;
	private Map subMenu;
	private Map secureRequestMap;
	private Map secureAccessMap = AuthorizationManager.newMap();
	private int refreshPeriod = DEFAULT_REFRESH_PERIOD;
	
	public AccessSecurity() {
		super();
		int refreshMessages = Util.parseInt(JSEIBSProp.getChkMsgPeriod())/1000;
		if (refreshMessages >= refreshPeriod) {
			refreshPeriod = refreshMessages + 60;
		}
	}
	public String getMenuOption() {
		return menuOption;
	}
	public void setMenuOption(String menuOption) {
		this.menuOption = menuOption;
	}
	public String getMenuSequence() {
		return menuSequence;
	}
	public void setMenuSequence(String menuSequence) {
		this.menuSequence = menuSequence;
	}
	
	public long getAccessTime() {
		return accessTime;
	}
	
	public void setAccessTime(long accessTime) {
		this.accessTime = accessTime;
	}
	
	/**
	 * @deprecated
	 */
	public void setAccesssTime(String accesssTime) {
		this.accessTime = Long.parseLong(accesssTime);
	}
	
	public Number getNonce() {
		return nonce;
	}
	public String getSecurityId() {
		return securityId;
	}
	
	public void setSecurityId(String securityId) {
		this.securityId = securityId;
	}
	
	public String getEncryptedValue(String value, String outputType) throws GeneralSecurityException {
		return new SecurePasswordEncryptor("PBE", outputType).encrypt(value, getSecurityId());
	}
	
	public String getEncryptedValue(String value) throws GeneralSecurityException {
		return getEncryptedValue(value, null);
	}
	
	public String getDecryptedValue(String value, String outputType) throws GeneralSecurityException {
		return new SecurePasswordEncryptor("PBE", outputType).decrypt(value, getSecurityId());
	}
	
	public String getDecryptedValue(String value) throws GeneralSecurityException {
		return getDecryptedValue(value, null);
	}
	
	public Map getMainMenu() {
		return mainMenu;
	}
	
	public void setMainMenu(Map mainMenu) {
		this.mainMenu = mainMenu;
	}
	
	public Map getSubMenu() {
		return subMenu;
	}
	
	public void setSubMenu(Map subMenu) {
		this.subMenu = subMenu;
	}
	
	public Map getSecureRequestMap() {
		return secureRequestMap;
	}
	
	public void setSecureRequestMap(Map secureRequestMap) {
		this.secureRequestMap = secureRequestMap;
	}
	
	public Map getSecureAccessMap() {
		return secureAccessMap;
	}
	
	public void setSecureAccessMap(Map secureAccessMap) {
		this.secureAccessMap = secureAccessMap;
	}
	
	public Object getResource(Object resourceId){
		Object value = null;
		if (secureRequestMap != null) {
			value = secureRequestMap.get(resourceId);
		}
		if (value == null) {
			value = secureAccessMap.get(resourceId);
		}
		return value;
	}
	
	public void mapResource(Object resourceId, Object url, boolean cache){
		if (cache && secureRequestMap != null) {
			if (secureRequestMap.size() > AuthorizationManager.thresholdSize) {
				logger.info("Cached Map has exceeded threshold, size is: "+secureRequestMap.size());
				remove(secureRequestMap, AuthorizationManager.thresholdPeriod);
			}
			secureRequestMap.put(resourceId, url);
		} else {
			if (secureAccessMap.size() > AuthorizationManager.thresholdSize) {
				logger.info("Secure Map has exceeded threshold, size is: "+secureAccessMap.size());
				logger.info("Current Menu is: Option="+menuOption + " : Sequence="+menuSequence);
				remove(secureAccessMap, AuthorizationManager.thresholdPeriod);
			}
			secureAccessMap.put(resourceId, url);
		}
	}
	
	private void remove(Map map, int period){
		if (map != null) {
			Iterator it = map.keySet().iterator();
			while (it.hasNext()) {
				AuthorizationKey key = (AuthorizationKey) it.next();
				if ((nonceProvider.isExpired(new Date(
						key.getTime()), period))) {
					it.remove();
				}
			}
		}
	}
	
	public void refresh(){
		secureAccessMap.clear();
		
		remove(secureRequestMap, refreshPeriod);
	}
	
	public String getRequestId(){
		return (getNonce() == null || getAccessTime() == 0 || getSecurityId() == null) ? 
				null : getNonce() + "_" + getAccessTime() + "_" + getSecurityId();
	}
	
	public boolean checkRequestValidity(String nonce, String time, String securityId){
		if (!nonceProvider.getNonceValidity(nonce)) {
			return false;
		}
		if (!(""+this.accessTime).equals(time)) {
			return false;
		}
		if (!this.securityId.equals(securityId)) {
			return false;
		}
		return true;
	}
	
	public boolean hasAccess(String menu, String sMenu, String resourcePath){
		if (mainMenu.get(menu) == null) {
			return false;
		}
	 	Iterator itSubMenu = ((List)subMenu.get(menu)).listIterator();
	 	while (itSubMenu.hasNext()) {
	 		com.datapro.eibs.security.vo.WEBMMViewByUser optSubMenu = (com.datapro.eibs.security.vo.WEBMMViewByUser) itSubMenu.next();
	 		//datapro.eibs.beans.ESS0040DSMessage optSubMenu = (datapro.eibs.beans.ESS0040DSMessage) itSubMenu.next();
	 		if (optSubMenu.getESSIDE().equals(sMenu)
	 			&& optSubMenu.getESSTAD().equals(resourcePath)) {
	 			return true;
			}
	 	}
	 	return false;
	}
	
	public void generateNonce() {
		nonce = nonceProvider.createNonce();
	}

	private static String getClassName(Class c){
		if (c.isArray()) {
			return c.getComponentType().getName() + "[]";
		} else {
			return c.getName();
		}
	}
	
	private static String convertToString(Object obj, String type) {
		String value = null;
		if (type.equals("java.sql.Timestamp")) {
			String str = obj.toString();
			int ls = str.length() - 1;
			int pt = str.indexOf(".");
			int fl = 3 - (ls - pt);
			for (int i = 0; i < fl; i++) {
				str += "0";
			} 
			value = str;
		} else {
			value = obj.toString();
		}
		return value;
	}
	
	private static Object convertToObject(Object obj, String type) {
		Object robj = null;
		if (obj != null) {
			String oType = getClassName(obj.getClass());
			if (!oType.equals(type)) {
				if (type.equals("byte[]")) {
					if (obj instanceof String) {
						String str = (String) obj;
						robj = str.getBytes();
					}
				} else if (oType.equals("byte[]")) {
					if (type.equals("java.lang.String")) {
						robj = new String((byte[])obj);
					} 
				} else {
					String str = convertToString(obj, oType);
					if (type.equals("java.lang.String")) {
						robj = str;
					} else if (type.equals("java.math.BigInteger")) {
						robj = new BigInteger(str);
					} else if (type.equals("java.math.BigDecimal")) {
						robj = new BigDecimal(str);
					} else if (type.equals("boolean")) {
						robj = new Boolean(str);
					} else if (type.equals("byte")) {
						robj = new Byte(str);
					} else if (type.equals("short")) {
						robj = new Short(str);
					} else if (type.equals("int") 
						|| type.equals("java.lang.Integer")) {
						robj = new Integer(str);
					} else if (type.equals("long")
						|| type.equals("java.lang.Long")) {
						robj = new Long(str);
					} else if (type.equals("float")) {
						robj = new Float(str);
					} else if (type.equals("double")) {
						robj = new Double(str);
					} else if (type.equals("java.sql.Date")) {
						// robj = Date.valueOf(str);
						robj = Timestamp.valueOf(str);
					} else if (type.equals("java.sql.Time")) {
						robj = Time.valueOf(str);
					} else if (type.equals("java.sql.Timestamp")) {
						robj = Timestamp.valueOf(str);
					}
				}			
			} else {
				return obj;
			}			
		}
		return robj;
	}	
	
	private static boolean isInstance(Object o, String oName) {
		Class superclass = o.getClass().getSuperclass();
		while (superclass != null) {
			if (superclass.getName().endsWith(oName))
				return true;
			superclass = superclass.getSuperclass();
		}
		return false;	
	}
	
	private static boolean areTypesCompatible(Class[] types, Class[] params){
		if( types.length == params.length ){
			for (int i = 0; i < params.length; i++) {
				if(types[i].isAssignableFrom(params[i])){
					continue;
				} else if(types[i].isPrimitive()){
					String type = types[i].getName();
					if (type.equals("char")
						&& params[i].getName().equals("java.lang.String")){
							continue;
					} else if (type.equals("boolean")
						&& params[i].getName().equals("java.lang.Boolean")){
							continue;
					} else if (type.equals("byte")
						&& params[i].getName().equals("java.lang.Byte")){
							continue;
					} else if (type.equals("short")
						&& params[i].getName().equals("java.lang.Short")){
							continue;
					} else if (type.equals("int")
						&& params[i].getName().equals("java.lang.Integer")){
							continue;
					} else if (type.equals("long")
						&& params[i].getName().equals("java.lang.Long")){
							continue;
					} else if (type.equals("float")
						&& params[i].getName().equals("java.lang.Float")){
							continue;
					} else if (type.equals("double")
						&& params[i].getName().equals("java.lang.Double")){
							continue;
					} else {
						return false;
					}
				} else {
					return false;
				}
			}
			return true;
		}
		return false;
	}
	
	private static Object invokeMethod(Object bean, String name, Object[] params){
		try {
			Method method = null;
			if (params != null) {
				Class[] paramsClass = new Class[params.length];
				for (int i = 0; i < params.length; i++) {
					paramsClass[i] = params[i].getClass();
				}
				Method[] methods = bean.getClass().getMethods();
				for( int i = 0; i < methods.length; i++ ){
					if( !methods[i].getName().equals(name)) 
						continue;
					Class[] types = methods[i].getParameterTypes();
					if( areTypesCompatible(types, paramsClass)){
						method = methods[i];
						break;
					}
				}
			} else {
				params = new Object[]{};
				method = bean.getClass().getMethod(name,  new Class[]{});
			}
			return method.invoke(bean, params);
		} catch (Exception e) {
		}
		return null;
	}
	
	private static Object getProperty(Object bean, String property){
		try {
			if (isInstance(bean, "MessageRecord")) {
				Object field = invokeMethod(bean, "getField", new String[]{property});
				Integer type = (Integer) getProperty(field, "type");
				Object value = null;
				if (type.intValue() == 2){
					value = getProperty(field, "bigDecimal");
				} else {
					value = getProperty(field, "string");
				}
				return value;	
			} else {
				return invokeMethod(bean, "get" + property.substring(0, 1).toUpperCase()
						+ property.substring(1), null);				
			}
		} catch (Exception e) {
		}
		return null;
	}

	private static void setProperty(Object bean, String property, Object value){
		try {
			if (isInstance(bean, "MessageRecord")) {
				Object field = invokeMethod(bean, "getField", new String[]{property});
				setProperty(field, "string", convertToString(value, value.getClass().getName()));
			} else {
				invokeMethod(bean, "set" + property.substring(0, 1).toUpperCase()
							+ property.substring(1), new Object[]{value});
			}
		} catch (Exception e) {
		}
	}

	private static void set(Object bean, PropertyDescriptor pd, Object value) 
		throws IllegalArgumentException, IllegalAccessException, InvocationTargetException {
		if (pd == null)
			return;
		Method setter = pd.getWriteMethod();
		if (setter == null) 
			return;
		Object obj = convertToObject(value, getClassName(pd.getPropertyType()));
		setter.invoke(bean, new Object[] { obj });
	}
	
	private static PropertyDescriptor[] getPropertyDescriptors(Object bean) throws IntrospectionException {
		PropertyDescriptor[] pds = Introspector.getBeanInfo(bean.getClass())
			.getPropertyDescriptors();
		return pds;
	}

    public static List sortMenu(Collection oList, final String field){
        List list = new LinkedList(oList);
        Collections.sort( list, new Comparator(){
        	Collator esCollator = Collator.getInstance(new Locale("es","SP"));
            public int compare( Object o1, Object o2 ){
				try {
					Comparable value1 = (Comparable) getProperty(o1, field);
					Comparable value2 = (Comparable) getProperty(o2, field);
					//esCollator.compare(value1, value2);
					if (value1 != null && value2 != null) {
		            	return value1.compareTo( value2 );
					} else if (value1 != null) {
						return 1;
					} else if (value2 != null) {
						return -1;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return -1;
            }
        });
        return list;
    }	

}

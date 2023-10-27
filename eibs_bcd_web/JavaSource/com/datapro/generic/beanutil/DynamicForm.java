/*
 * Created on Jun 17, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.generic.beanutil;

import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class DynamicForm {

	private Map parameters;

	/**
	 * 
	 */
	
	public void clear() {
		parameters.clear();
	}
	
	private String getClassName(Class c){
		if (c.isArray()) {
			return c.getComponentType().getName() + "[]";
		} else {
			return c.getName();
		}
	}
	
	private String convertToString(Object obj, String type) {
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
	
	private Object convertToObject(Object obj, String type) {
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
						try {
							robj = new BigInteger(str);
						} catch (Exception e) {
							robj = new BigInteger("0");
						}
					} else if (type.equals("java.math.BigDecimal")) {
						try {
							robj = new BigDecimal(str);
						} catch (Exception e) {
							robj = new BigDecimal("0");
						}
					} else if (type.equals("boolean")) {
						try {
							robj = new Boolean(str);
						} catch (Exception e) {
							robj = Boolean.FALSE;
						}
					} else if (type.equals("byte")) {
						robj = new Byte(str);
					} else if (type.equals("short")) {
						try {
							robj = new Short(str);
						} catch (Exception e) {
							robj = new Short("0");
						}
					} else if (type.equals("int") 
						|| type.equals("java.lang.Integer")) {
						try {
							robj = new Integer(str);
						} catch (Exception e) {
							robj = new Integer("0");
						}
					} else if (type.equals("long")
						|| type.equals("java.lang.Long")) {
						try {
							robj = new Long(str);
						} catch (Exception e) {
							robj = new Long("0");
						}
					} else if (type.equals("float")) {
						try {
							robj = new Float(str);
						} catch (Exception e) {
							robj = new Float("0.00");
						}
					} else if (type.equals("double")) {
						try {
							robj = new Double(str);						
						} catch (Exception e) {
							robj = new Double("0.00");
						}
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

	protected void set(Object bean, PropertyDescriptor pd, Object value) 
		throws IllegalArgumentException, IllegalAccessException, InvocationTargetException {
		if (pd == null)
			return;
		Method setter = pd.getWriteMethod();
		if (setter == null) 
			return;
		Object obj = convertToObject(value, getClassName(pd.getPropertyType()));
		setter.invoke(bean, new Object[] { obj });
	}	
	
	public boolean load(HttpServletRequest req) {
		boolean ok = true;
		String parameter = "";
		String values = "";
		Iterator iterator = req.getParameterMap().keySet().iterator();
		try {
			parameters = new HashMap();
			while (iterator.hasNext()) {
				parameter = iterator.next().toString();
				values = req.getParameter(parameter);
				parameters.put(parameter, values);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			ok = false;
		}
		return ok;
	}
	
	
	public boolean unload(Object targetBean) {
			boolean ok = true;
			try {
				PropertyDescriptor[] pds = Introspector.getBeanInfo(targetBean.getClass())
					.getPropertyDescriptors();
				for (int i = 0; i < pds.length; i++) {
					String name = pds[i].getName();
					if (name.equals("class"))
						continue;
					Object value = parameters.get(name);
					set(targetBean, pds[i], value);
				}
			} catch (Exception e) {
				e.printStackTrace();
				ok = false;
			}
			
			return ok;
		}
			
	public void setBeanFromPage(HttpServletRequest request, Object targetBean, boolean toUppercase) throws Exception {
		String name = "";
		String value = null;
		try {
			PropertyDescriptor[] pds = Introspector.getBeanInfo(targetBean.getClass())
				.getPropertyDescriptors();
			for (int i = 0; i < pds.length; i++) {
				name = pds[i].getName();
				if (name.equals("class"))
					continue;
				try {
					value = request.getParameter(name);
				} catch (Exception e) {
					value = null;
				}
				if (value != null) {
					set(targetBean, pds[i], (toUppercase ? value.toUpperCase() : value));
				}
			}
		} catch (Exception e) {
			throw new Exception("Exception get value from "  + name + " " + e.toString() + e.getMessage());
		}
		
	}
	
	public void setBeanFromPage(HttpServletRequest request, Object targetBean) throws Exception {
		setBeanFromPage(request, targetBean, false);
	}
	
	public boolean unload(MessageRecord message) {
		boolean ok = true;
		java.util.Enumeration enu = message.fieldEnumeration();
		MessageField field = null;
		String name = "";
		while (enu.hasMoreElements()) {
			try {
				field = (MessageField) enu.nextElement();
				name = field.getTag();
				String value = (String) parameters.get(name);
				if (value != null) {
					field.setString(value.toUpperCase());
				}
			} catch (Exception e) {
				e.printStackTrace();
				ok = false;
			}
		}	
		return ok;
	}	
	
	public void setMessageFromPage(HttpServletRequest request, MessageRecord message) throws Exception {
		// all the fields here
		java.util.Enumeration enu = message.fieldEnumeration();
		MessageField field = null;
		String value = "";
		String name = "";
		while (enu.hasMoreElements()) {
			try {
				field = (MessageField) enu.nextElement();
				name = field.getTag();
				try {
					value = request.getParameter(name).toUpperCase();
				} catch (Exception e) {
					value = null;
				}
				if (value != null) {
					field.setString(value);
				}
			} catch (Exception e) {
				throw new Exception("Exception get value from "  + name + " " + e.toString() + e.getMessage());
			}
		}
	}

	
}

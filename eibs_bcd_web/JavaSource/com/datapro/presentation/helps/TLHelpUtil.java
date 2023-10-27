package com.datapro.presentation.helps;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;

import org.apache.commons.beanutils.BeanUtils;

import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author ogarcia
 *
 */

public class TLHelpUtil {
	
	public static String getContextPath(PageContext pageContext){
		return ((HttpServletRequest)pageContext.getRequest()).getContextPath();
	}
	
	public static int getScope(String scopeName) throws JspException {
		if (scopeName == null)
			throw new JspException("Scope should be provided");
		else if (scopeName.equals("page")) {
			return 1;
		} else if (scopeName.equals("request")) {
			return 2;
		} else if (scopeName.equals("session")) {
			return 3;
		} else if (scopeName.equals("application")) {
			return 4;
		} else {
			throw new JspException(" Scope  " + scopeName + " not found");
		}
	}
	
	public static Object getProperty(Object bean, String property) throws JspException {
		try {
			if (bean instanceof MessageRecord) {
				MessageRecord message = (MessageRecord) bean;
				MessageField field = (MessageField) message.getField(property);
				return field.getString();
			} else
				return BeanUtils.getProperty(bean, property);
		} catch (Exception e) {
			throw new JspException("On Bean " + bean.getClass().getName()
					+ " : On property " + property + ": " + e.getMessage());
		}
	}

	public static Object lookup(PageContext pageContext, String name,
			String scopeName) throws JspException {
		if (scopeName == null)
			return pageContext.findAttribute(name);
		try {
			return pageContext.getAttribute(name, getScope(scopeName));
		} catch (JspException e) {
			throw e;
		}
	}

	public static Object lookup(PageContext pageContext, String name,
		String property, String scope) throws JspException {
		Object bean = lookup(pageContext, name, scope);
		if (bean == null) {
			throw new JspException(name
					+ " : Bean not found in scope specified " + scope);
		}
		if (property == null)
			return bean;
		try {
			return getProperty(bean, property);
		} catch (Exception e) {
			throw new JspException("On Bean " + bean.getClass().getName()
					+ " : On property " + property + ": " + e.getMessage());
		}
	}

	/**
	 * @param url
	 * @param id
	 * @return
	 * @throws IOException
	 * @throws JspException
	 */
	public static String getHtmlTag(PageContext pageContext, String function, String id)
		throws JspException {
		StringBuffer sb = new StringBuffer();
		if (function != null) {
			if (id != null)
				sb.append(
					"<a id=\""
						+ id
						+ "\" href=\"javascript:"
						+ function
						+ "\">");
			else
				sb.append(
					"<a id=\"linkHelp\" href=\"javascript:" + function + "\">");
			String contextPath =
				getContextPath(pageContext);
			sb.append(
				"<img src=\""
					+ contextPath
					+ "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\">");
			sb.append("</a>");
		}
		return sb.toString();
	}

}
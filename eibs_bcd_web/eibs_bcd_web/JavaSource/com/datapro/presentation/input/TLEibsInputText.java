package com.datapro.presentation.input;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import datapro.eibs.master.SuperServlet;

/**
 * @author fhernandez
 *
 */
public class TLEibsInputText extends EibsInputFields {

	private static final long serialVersionUID = -5783323624729985483L;
	
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			String contextPath = SuperServlet.webAppPath;
			
			StringBuffer str = new StringBuffer();			
	    	if (isRequired())
	    		str.append(
	    			getMandatoryIcon(
						contextPath,
						""));	

			out.print(str);
			
		} catch (Exception ex) {
		}
		return (super.doEndTag());
	}
	/**
	 * @param mandatory The mandatory to set.
	 */
	public void setRequired(String required) {
		setRequired(Boolean.valueOf(required).booleanValue());
	}
	
	public String getRequired() {
		return super.isRequired()+"";
	}

}

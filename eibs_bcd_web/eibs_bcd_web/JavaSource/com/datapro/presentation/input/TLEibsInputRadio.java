package com.datapro.presentation.input;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import com.datapro.presentation.taglib.RadioTag;

/**
 * @author fhernandez
 *
 */
public class TLEibsInputRadio extends RadioTag {

	private boolean required;
	private String modified;
	
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			StringBuffer str = new StringBuffer();			
	    	if (isRequired())
	    		str.append("<img src=\""
	    				+ pageContext.getServletContext().getContextPath()
	    				+ "/images/Check.gif"
	    				+ "\" align=\"bottom\" border=\"0\"/>");

			out.print(str);
			
		} catch (Exception ex) {
		}
		return (super.doEndTag());
	}
	public String getModified() {
		return modified;
	}
	public void setModified(String modified) {
		this.modified = modified;
	}
	public void setRequired(boolean required) {
		this.required = required;
	}
	public boolean isRequired() {
		return required;
	}
	/**
	 * @param mandatory The mandatory to set.
	 */
	public void setRequired(String required) {
		setRequired(Boolean.valueOf(required).booleanValue());
	}
	
	public String getRequired() {
		return isRequired()+"";
	}

}

package com.datapro.presentation.tables;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author ramaro
 *
 */

public class TLTbOptionCol  extends TagSupport {
    
    private String href = null;
	private String value = null;
	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		TLTbOption parentTagObject = (TLTbOption)findAncestorWithClass(this,TLTbOption.class);		
		if(parentTagObject==null)
			throw new JspTagException("Improper use of <table:tboptioncol> tag.");
		else {
			try{
				JspWriter out = pageContext.getOut();
				out.println("<TD class=\"TDBKG\">");
				if (id !=null) {
					out.println("<a href=\"javascript:" + href + "\" id=\""+ id + "\">" + value +"</a>");
				} else {
					out.println("<a href=\"javascript:" + href + "\">" + value +"</a>");
				}
				out.println("</TD>");
			}
			catch (Exception ex) {			
			}	
		}	
		return (SKIP_BODY);
	}

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doEndTag()
	 */
	public int doEndTag() throws JspException {
		return (EVAL_PAGE);
	}

// getters and setters for parent's scroll properties

/**
 * Returns the value.
 * @return String
 */
public String getValue() {
	return (value);
}
/**
 * Sets the value.
 * @param value The value to set
 */
public void setValue(String desc) {
	value = desc;
}
/**
 * Returns the href.
 * @return String
 */
public String getHref() {
	return (href);
}

/**
 * Sets the href.
 * @param href The href to set
 */
public void setHref(String newHref) {
	href = newHref;
}


}
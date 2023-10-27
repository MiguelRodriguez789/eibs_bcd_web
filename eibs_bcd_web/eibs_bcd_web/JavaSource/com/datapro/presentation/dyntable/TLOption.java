package com.datapro.presentation.dyntable;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * @author fhernandez
 * 
 */

public class TLOption extends BodyTagSupport {

	private String caption = null;
	private String value;

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		TLSelect parentTagObject = (TLSelect) findAncestorWithClass(this,
				TLSelect.class);
		if (parentTagObject == null)
			throw new JspTagException("Improper use of <option> tag.");
		else {
			try {

			} catch (Exception ex) {
			}
		}
		return (EVAL_BODY_BUFFERED);
	}

	public int doAfterBody() throws JspException {
		if (bodyContent != null) {
			setCaption(bodyContent.getString().trim());
			bodyContent.clearBody();
		}
		return (SKIP_BODY);
	}

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doEndTag()
	 */
	public int doEndTag() throws JspException {

		TLElement parentTagObject = (TLElement) findAncestorWithClass(this,
				TLElement.class);
		if (parentTagObject == null)
			throw new JspTagException("Improper use of <option> tag.");
		else {
			try {				
				parentTagObject.addOption(getValue(), getCaption());
				
			} catch (Exception ex) {
				
			}
		}
		return (EVAL_BODY_INCLUDE);
	}
	
	/**
	 * Returns the caption.
	 * @return String
	 */
	public String getCaption() {
		return caption;
	}

	/**
	 * Sets the caption.
	 * @param caption The caption to set
	 */
	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}


}

package com.datapro.presentation.dyntable;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * @author ogarcia
 *
 */

public class TLElementColumnCaption extends BodyTagSupport {

	
	private String caption = null;
	private String align = "center";

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		TLElement parentTagObject =
			(TLElement) findAncestorWithClass(this, TLElement.class);
		if (parentTagObject == null)
			throw new JspTagException("Improper use of <table:table-option-column-confirm> tag.");
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
		
			
			TLElement parentTagObject =
						(TLElement) findAncestorWithClass(this, TLElement.class);
			if (parentTagObject == null)
				throw new JspTagException("Improper use of <table:table-option-column-confirm> tag.");
			else {
				try {
					
					if (caption.length() > 0){
						parentTagObject.setColCaption(caption);
					}
					parentTagObject.setColAlign(align);
					
				} catch (Exception ex) {
					
				}
			}
		return (EVAL_BODY_INCLUDE);
	}

	// getters and setters for parent's scroll properties

	

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


	/**
	 * @return
	 */
	public String getAlign() {
		return align;
	}

	/**
	 * @param string
	 */
	public void setAlign(String string) {
		align = string;
	}

}

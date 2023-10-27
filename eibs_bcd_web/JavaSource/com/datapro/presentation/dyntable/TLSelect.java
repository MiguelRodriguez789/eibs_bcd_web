package com.datapro.presentation.dyntable;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * @author fhernandez
 * 
 */

public class TLSelect extends BodyTagSupport {

	private String disabled;
	private String style;
	private String onblur;
	private String onchange;
	private String onfocus;
	private String onclick;
	private String ondblclick;
	private String onkeydown;
	private String onkeypress;
	private String onkeyup;
	private String onmousedown;
	private String onmouseup;

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		TLElement parentTagObject = (TLElement) findAncestorWithClass(this,
				TLElement.class);
		if (parentTagObject == null)
			throw new JspTagException("Improper use of <select> tag.");
		else {
			try {

			} catch (Exception ex) {
			}
		}
		return (EVAL_BODY_BUFFERED);
	}

	public int doAfterBody() throws JspException {
		if (bodyContent != null) {
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
			throw new JspTagException("Improper use of <select> tag.");
		else {
			try {
				if (getStyle() != null) {
					parentTagObject.addAttribute("style", getStyle());
				}
				if (getOnblur() != null) {
					parentTagObject.addAttribute("onblur", getOnblur());
				}
				if (getOnchange() != null) {
					parentTagObject.addAttribute("onchange", getOnchange());
				}
				if (getOnfocus() != null) {
					parentTagObject.addAttribute("onfocus", getOnfocus());
				}
				if (getOnclick() != null) {
					parentTagObject.addAttribute("onclick", getOnclick());
				}
				if (getOndblclick() != null) {
					parentTagObject.addAttribute("ondblclick", getOndblclick());
				}
				if (getOnkeydown() != null) {
					parentTagObject.addAttribute("onkeydown", getOnkeydown());
				}
				if (getOnkeypress() != null) {
					parentTagObject.addAttribute("onkeypress", getOnkeypress());
				}
				if (getOnkeyup() != null) {
					parentTagObject.addAttribute("onkeyup", getOnkeyup());
				}
				if (getOnmousedown() != null) {
					parentTagObject.addAttribute("onmousedown", getOnmousedown());
				}
				if (getOnmouseup() != null) {
					parentTagObject.addAttribute("onmouseup", getOnmouseup());
				}
				
			} catch (Exception ex) {
				
			}
		}
		return (EVAL_BODY_INCLUDE);
	}

	// getters and setters for parent's scroll properties

	public String getOnclick() {
		return onclick;
	}

	public String getOnblur() {
		return onblur;
	}

	public void setOnblur(String onblur) {
		this.onblur = onblur;
	}

	public String getOnchange() {
		return onchange;
	}

	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}

	public String getOnfocus() {
		return onfocus;
	}

	public void setOnfocus(String onfocus) {
		this.onfocus = onfocus;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}

	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}

	public String getOndblclick() {
		return ondblclick;
	}

	public void setOndblclick(String ondblclick) {
		this.ondblclick = ondblclick;
	}

	public String getOnmousedown() {
		return onmousedown;
	}

	public void setOnmousedown(String onmousedown) {
		this.onmousedown = onmousedown;
	}

	public String getOnmouseup() {
		return onmouseup;
	}

	public void setOnmouseup(String onmouseup) {
		this.onmouseup = onmouseup;
	}

	public String getOnkeydown() {
		return onkeydown;
	}

	public void setOnkeydown(String onkeydown) {
		this.onkeydown = onkeydown;
	}

	public String getOnkeypress() {
		return onkeypress;
	}

	public void setOnkeypress(String onkeypress) {
		this.onkeypress = onkeypress;
	}

	public String getOnkeyup() {
		return onkeyup;
	}

	public void setOnkeyup(String onkeyup) {
		this.onkeyup = onkeyup;
	}

}

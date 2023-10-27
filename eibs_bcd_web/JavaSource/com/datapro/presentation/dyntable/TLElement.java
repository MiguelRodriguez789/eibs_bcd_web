package com.datapro.presentation.dyntable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author ogarcia
 *
 */

public class TLElement extends BodyTagSupport {

	private String fn_name = "";
	private String fn_label = "";
	private String fn_value = "";
	private String fn_type = "";
	private String fn_nameD = "";
	private String fn_nameM = "";
	private String fn_nameY = "";
	private String fn_nameD_value = "";
	private String fn_nameM_value = "";
	private String fn_nameY_value = "";
	private String colCaption = "";
	private String colAlign = "";
	private String align;
	private String maxlength;
	private String style;
	private String readonly;
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
	private Map attributes;
	private Map options;
	
	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		return (EVAL_BODY_INCLUDE);
	}

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doEndTag()
	 */
	public int doEndTag() throws JspException {
		TLDynTable parentTagObject =
			(TLDynTable) findAncestorWithClass(this, TLDynTable.class);
		if (parentTagObject == null) {
			throw new JspTagException("Improper use of <element> tag.");
		} else {
			try {
				List list = parentTagObject.getListElement();
				JBMetaData md = new JBMetaData();
				
				md.setCaption(fn_label);
				md.setFieldName(fn_name);
				md.setColCaption(colCaption);
				md.setColAlign(colAlign);
				md.setType(fn_type);
				md.setFieldNameD(fn_nameD);	
				md.setFieldNameM(fn_nameM);	
				md.setFieldNameY(fn_nameY);	
				md.setDefaultValue(fn_value);
				md.setDefaultMValue(fn_nameM_value);
				md.setDefaultDValue(fn_nameD_value);
				md.setDefaultYValue(fn_nameY_value);
				md.setAlign((align != null) ? align : colAlign);
				if (getMaxlength() != null) {
					md.setMaxlength(maxlength);	
				}
				if (getStyle() != null) {
					md.setStyle(style);	
				}
				if (getReadonly() != null) {
					addAttribute("readonly", getReadonly());
				}
				if (getOnblur() != null) {
					addAttribute("onblur", getOnblur());
				}
				if (getOnchange() != null) {
					addAttribute("onchange", getOnchange());
				}
				if (getOnfocus() != null) {
					addAttribute("onfocus", getOnfocus());
				}				
				if (getOnclick() != null) {
					addAttribute("onclick", getOnclick());
				}				
				if (getOndblclick() != null) {
					addAttribute("ondblclick", getOndblclick());
				}				
				if (getOnkeydown() != null) {
					addAttribute("onkeydown", getOnkeydown());
				}				
				if (getOnkeyup() != null) {
					addAttribute("onkeyup", getOnkeyup());
				}				
				if (getOnkeypress() != null) {
					addAttribute("onkeypress", getOnkeypress());
				}				
				if (getOnmousedown() != null) {
					addAttribute("onmousedown", getOnmousedown());
				}				
				if (getOnmouseup() != null) {
					addAttribute("onmouseup", getOnmouseup());
				}				
				md.setAttributes(attributes);
				md.setOptions(options);
				list.add(md);
				
			} catch (Exception e) {
				System.out.println("Error element-tag process.");
			}
		}
		return (EVAL_PAGE);
	}

	// getters and setters
	

	/**
	 * @return
	 */
	public String getColCaption() {
		return colCaption;
	}

	/**
	 * @return
	 */
	public String getFn_label() {
		return fn_label;
	}

	/**
	 * @return
	 */
	public String getFn_name() {
		return fn_name;
	}

	/**
	 * @return
	 */
	public String getFn_value() {
		return fn_value;
	}

	/**
	 * @param string
	 */
	public void setColCaption(String string) {
		colCaption = string;
	}

	/**
	 * @param string
	 */
	public void setFn_label(String string) {
		fn_label = string;
	}

	/**
	 * @param string
	 */
	public void setFn_name(String string) {
		fn_name = string;
	}

	/**
	 * @param string
	 */
	public void setFn_value(String string) {
		fn_value = string;
	}

	/**
	 * @return
	 */
	public String getFn_nameD() {
		return fn_nameD;
	}

	/**
	 * @return
	 */
	public String getFn_nameM() {
		return fn_nameM;
	}

	/**
	 * @return
	 */
	public String getFn_nameY() {
		return fn_nameY;
	}

	/**
	 * @return
	 */
	public String getFn_type() {
		return fn_type;
	}

	public String getReadonly() {
		return readonly;
	}
	
	/**
	 * @param string
	 */
	public void setFn_nameD(String string) {
		fn_nameD = string;
	}

	/**
	 * @param string
	 */
	public void setFn_nameM(String string) {
		fn_nameM = string;
	}

	/**
	 * @param string
	 */
	public void setFn_nameY(String string) {
		fn_nameY = string;
	}

	/**
	 * @param string
	 */
	public void setFn_type(String string) {
		fn_type = string;
	}

	/**
	 * @return
	 */
	public String getAlign() {
		return align;
	}

	/**
	 * @return
	 */
	public String getColAlign() {
		return colAlign;
	}

	/**
	 * @param string
	 */
	public void setAlign(String string) {
		align = string;
	}

	/**
	 * @param string
	 */
	public void setColAlign(String string) {
		colAlign = string;
	}
	
	
	/**
	 * @return
	 */
	public String getFn_nameD_value() {
		return fn_nameD_value;
	}

	/**
	 * @return
	 */
	public String getFn_nameM_value() {
		return fn_nameM_value;
	}

	/**
	 * @return
	 */
	public String getFn_nameY_value() {
		return fn_nameY_value;
	}

	/**
	 * @param string
	 */
	public void setFn_nameD_value(String string) {
		fn_nameD_value = string;
	}

	/**
	 * @param string
	 */
	public void setFn_nameM_value(String string) {
		fn_nameM_value = string;
	}

	/**
	 * @param string
	 */
	public void setFn_nameY_value(String string) {
		fn_nameY_value = string;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}
	
	public void setReadonly(String string) {
		this.readonly = string;
	}

	public String getMaxlength() {
		return maxlength;
	}

	public void setMaxlength(String maxlength) {
		this.maxlength = maxlength;
	}
	
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
	
	public void addAttribute(String name, String value) {
		if (attributes == null) {
			attributes = new HashMap();
		}
		if (name != null && value != null) {
			attributes.put(name, value);			
		}
	}

	public void addOption(String value, String caption) {
		if (options == null) {
			options = new HashMap();
		}
		if (value != null) {
			options.put(value, caption == null ? "" : caption);			
		}
	}

}
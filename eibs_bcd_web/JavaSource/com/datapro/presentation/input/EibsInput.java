package com.datapro.presentation.input;

import javax.servlet.jsp.JspException;

import com.datapro.eibs.constants.StyleID;
import com.datapro.generic.tool.UDecimalFormat;
import com.datapro.generic.tool.Util;
import com.datapro.presentation.taglib.TextTag;


/**
 * @author fhernandez
 *
 */

public class EibsInput extends TextTag implements EibsInputConstants, StyleID {
	
	private static final long serialVersionUID = 9131298943157246497L;
	int type = INPUT_TYPE_TEXT;
	private int decimals = 0;
    
	/**
	 * 
	 */
	public EibsInput(int type) {
		super();
		this.type = type;
	}
	/**
	 * 
	 */
	public EibsInput() {
		super();
	}
	public int getDecimals() {
		return decimals;
	}
	public void setDecimals(int decimals) {
		this.decimals = decimals;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public void setType(String type) {
		this.type = Util.parseInt(type);
	}	
	public String getOnkeypress() {
		String rt = null;
		if (!getReadonly() && super.getOnkeypress() == null) {
			switch (getType()) {
				case INPUT_TYPE_INTEGER:
					rt = " enterInteger(event)";
					break;
				case INPUT_TYPE_CURRENCY:
				case INPUT_TYPE_DECIMAL:
					rt = 
						" enterDecimal(event, "
						+ decimals
						+ ") ";
					break;
				case INPUT_TYPE_SIGN_DECIMAL:
					rt = 
						" enterSignDecimal(event, "
						+ decimals
						+ ") ";
					break;
				default:
					break;
			}			
		} else {
			rt = super.getOnkeypress();
		}

		return rt;
	}
	
	public String getOnblur() {
		String rt = null;
		if (!getReadonly()) {
			String onblurAttrib = super.getOnblur();
			switch (getType()) {
				case INPUT_TYPE_CURRENCY:
					rt = 
						" this.value = formatCCY(this.value);";
					rt +=  (onblurAttrib == null) ? "" : onblurAttrib;
					break;
				default:
					break;
			}			
		} else {
			rt = super.getOnblur();
		}

		return rt;
	}	
	

	public String getOnkeyup() {
		String rt = null;
		if (super.getOnkeyup() == null) {
			switch (getType()) {
				//case INPUT_TYPE_CURRENCY:
				case INPUT_TYPE_DECIMAL:
					rt = " checkDecimal(event, "
							+ decimals
							+ ") ";
					break;
				case INPUT_TYPE_SIGN_DECIMAL:
					break;
				default:
					break;
			}
		} else {
			rt = super.getOnkeyup();
		}
		return rt;
	}

	public String getOnclick() {
		String rt = null;
		if (!getReadonly() && super.getOnclick() == null) {
			switch (getType()) {
				//case INPUT_TYPE_CURRENCY:
				case INPUT_TYPE_DECIMAL:
					rt = "this.select();";
					break;
				default:
					break;
			}
		} else {
			rt = super.getOnclick();
		}
		return rt;
	}

	protected String getKeyEvents() {
		
		StringBuffer sb = new StringBuffer();
		prepareKeyEvents(sb);
		return sb.toString();
	}
	
    protected String prepareStyles() throws JspException {
        StringBuffer styles = new StringBuffer();
        prepareAttribute(styles, "style", getStyle());
        prepareAttribute(styles, "class", getStyleClass());
        return styles.toString();
    }
    
    protected void prepareOtherAttributes(StringBuffer attributes) {
    	try {
            prepareAttribute(attributes, "title", message(getTitle(), getTitleKey()));
            prepareAttribute(attributes, "alt", message(getAlt(), getAltKey()));
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
	
	protected String getStyles() {
		
		StringBuffer sb = new StringBuffer();
		try {
			sb.append(prepareStyles());
		} catch (Exception e) {
		}
		return sb.toString();
	}
	
    protected String formatValue(Object value) {
		
        if(value == null)
            value = "";
       	String valueToFormat = value.toString();
		switch (getType()) {
			case INPUT_TYPE_INTEGER:
				if (valueToFormat.trim().equals(""))
					value = "0";
				break;
			case INPUT_TYPE_CURRENCY:
			case INPUT_TYPE_DECIMAL:
			case INPUT_TYPE_SIGN_DECIMAL:
				if (valueToFormat.trim().equals(""))
					valueToFormat = "0." + Util.addLeftChar('0', decimals, valueToFormat);
				if (decimals == UDecimalFormat.DEFAULT_DECIMAL_PART_LENGTH) {
					value = UDecimalFormat.formatCCY(valueToFormat);
				} else if (decimals > 0) {
					value = UDecimalFormat.formatCCY(valueToFormat, decimals);
				}
				break;
			default:
				break;
		}
		
		return value.toString().trim();
	}
	
	public String getInputText(String options) {

		StringBuffer sb = new StringBuffer();
		String id = "";
		String name = "";
		try {
			name = prepareName();
		} catch (Exception e) {
			name = getName();
		}
		if(getId()!= null && !getId().equals("")){
			id = "id=\""+ getId()+ "\"";
		} else {
			id = "id=\""+ name + "\"";
		}
		sb.append(
				"<input type=\"text\" "
					+ id
					+ " name=\""
					+ name
					+ "\" size=\""
					+ getSize()
					+ "\" maxlength=\""
					+ getMaxlength()
					+ "\" value=\""
					+ formatValue(getValue())
					+ "\" ");
		sb.append(getStyles());
		sb.append(prepareEventHandlers());
		prepareOtherAttributes(sb);
		sb.append(" " + options + " />");
		
		return sb.toString();
	}
	
	public String getInputText(
			int type,
			String fldName,
			String fldValue,
			String fldSize,
			String fldLength,
			int decimals,
			String options) {
		
		this.type = type;
		this.name = fldName; 
		this.value = fldValue;
		this.decimals = decimals;
		setSize(fldSize);
		setMaxlength(fldLength);
		
		return getInputText(options);
	}
	
	public String getInputText(
			int type,
			String fldName,
			String fldValue,
			String fldSize,
			String fldLength,
			String decimals,
			String options) {
		
		this.type = type;
		this.name = fldName; 
		this.value = fldValue; 

		setSize(fldSize);
		setMaxlength(fldLength);
		try {
			this.decimals = Integer.parseInt(decimals);
		} catch (Exception e) {}
		
		return getInputText(options);
	}	
	
	public String getInputText(
			int type,
			String fldName,
			String fldValue,
			int fldSize,
			int fldLength,
			int decimals,
			String options) {
		
		this.type = type;
		this.name = fldName; 
		this.value = fldValue; 
		setSize("" + fldSize);
		setMaxlength("" + fldLength);
		this.decimals = decimals;
		
		return getInputText(options);
	}
	
	public String getInputText(
			int type,
			String fldName,
			String fldValue,
			int fldSize,
			int fldLength,
			String options) {
		
		return getInputText(type, fldName, fldValue, "" + fldSize, "" + fldLength, 0, options);
	}
	
	public String getInputText(
			int type,
			String fldName,
			String fldValue,
			int fldSize,
			int fldLength) {
		
		return getInputText(type, fldName, fldValue, "" + fldSize, "" + fldLength, 0, "");
	}	

	public int doEndTag() throws JspException {
		int end = super.doEndTag();
		release();
		return end;
	}
	
	public void release() {
		super.release();
		type = INPUT_TYPE_TEXT;
		decimals = 0;
	}		
	
	

}
package com.datapro.presentation.dyntable;

import java.util.Map;

/**
 * @author ogarcia
 *
 */
public class JBMetaData {

	private String caption = "";
	private String colCaption = "";
	private String colAlign = "";
	private String type = "";
	private String fieldNameD = null;
	private String fieldNameY = null;
	private String fieldNameM = null;
	private String fieldName = null;
	private String align = "";
	private String defaultValue = "";
	private String defaultDValue = "";
	private String defaultMValue = "";
	private String defaultYValue = "";
	private String status = "";
	private String maxlength = "";
	private String style;
	private Map attributes;
	private Map options;
	private String readonly;
	private String onblur;
	private String onchange;
	/**
	 * Returns the caption.
	 * @return String
	 */
	public String getCaption() {
		return caption;
	}

	/**
	 * Returns the fieldName.
	 * @return String
	 */
	public String getFieldName() {
		return fieldName;
	}
	
	/**
	 * @return
	 */
	public String getColCaption() {
		return colCaption;
	}

	/**
	 * @return
	 */
	public String getFieldNameD() {
		return fieldNameD;
	}

	/**
	 * @return
	 */
	public String getFieldNameM() {
		return fieldNameM;
	}

	/**
	 * @return
	 */
	public String getFieldNameY() {
		return fieldNameY;
	}

	/**
	 * @return
	 */
	public String getType() {
		return type;
	}
	
	public String getReadonly() {
		return readonly;
	}

	/**
	 * @param string
	 */
	public void setCaption(String string) {
		caption = string;
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
	public void setFieldName(String string) {
		fieldName = string;
	}

	/**
	 * @param string
	 */
	public void setFieldNameD(String string) {
		fieldNameD = string;
	}

	/**
	 * @param string
	 */
	public void setFieldNameM(String string) {
		fieldNameM = string;
	}

	/**
	 * @param string
	 */
	public void setFieldNameY(String string) {
		fieldNameY = string;
	}

	/**
	 * @param string
	 */
	public void setType(String string) {
		type = string;
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
	public String getDefaultValue() {
		return defaultValue;
	}

	/**
	 * @param string
	 */
	public void setDefaultValue(String string) {
		defaultValue = string;
	}

	/**
	 * @return
	 */
	public String getDefaultDValue() {
		return defaultDValue;
	}

	/**
	 * @return
	 */
	public String getDefaultMValue() {
		return defaultMValue;
	}

	/**
	 * @return
	 */
	public String getDefaultYValue() {
		return defaultYValue;
	}

	/**
	 * @param string
	 */
	public void setDefaultDValue(String string) {
		defaultDValue = string;
	}

	/**
	 * @param string
	 */
	public void setDefaultMValue(String string) {
		defaultMValue = string;
	}

	/**
	 * @param string
	 */
	public void setDefaultYValue(String string) {
		defaultYValue = string;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getMaxlength() {
		return maxlength;
	}

	public void setMaxlength(String maxlength) {
		this.maxlength = maxlength;
	}

	public Map getAttributes() {
		return attributes;
	}

	public void setAttributes(Map attributes) {
		this.attributes = attributes;
	}

	public Map getOptions() {
		return options;
	}

	public void setOptions(Map options) {
		this.options = options;
	}

	public void setReadonly(String string) {
		this.readonly = string;

		
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

}
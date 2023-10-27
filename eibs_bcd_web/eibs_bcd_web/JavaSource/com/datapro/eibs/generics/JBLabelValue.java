package com.datapro.eibs.generics;

/**
 * @author dmavilla
 *
 */
public class JBLabelValue {

	private String label;
	private String value;
	
	/**
	 * Constructor for JBLabelValue.
	 */
	public JBLabelValue() {
		super();
	}

	/**
	 * Method JBLabelValue.
	 * @param label
	 * @param value
	 */
	public JBLabelValue(String label, String value) {
		super();
		set(label, value);
	}

	/**
	 * Returns the label.
	 * @return String
	 */
	public String getLabel() {
		return label;
	}

	/**
	 * Returns the value.
	 * @return String
	 */
	public String getValue() {
		return value;
	}

	/**
	 * Sets the label.
	 * @param label The label to set
	 */
	public void setLabel(String label) {
		this.label = label;
	}

	/**
	 * Sets the value.
	 * @param value The value to set
	 */
	public void setValue(String value) {
		this.value = value;
	}
	
	public void set(String label, String value) {
		this.label = label;
		this.value = value;
		
	}

}

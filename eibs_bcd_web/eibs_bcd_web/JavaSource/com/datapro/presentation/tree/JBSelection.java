package com.datapro.presentation.tree;

import com.datapro.generic.beanutil.BeanList;

/**
 * @author bthorne
 *
 */

public class JBSelection{

	private String hiddenFieldName = "";
	private String hiddenFieldValue = "";
	private String fn_hiddenFieldValue = "";
	private String v_hiddenFieldValue = "";
	private String tree_hiddenFieldValue = "";
	private boolean createHiddenField = true;

	/**
	 * Returns the createHiddenField.
	 * @return boolean
	 */
	public boolean isCreateHiddenField() {
		return createHiddenField;
	}

	/**
	 * Returns the fn_hiddenFieldValue.
	 * @return String
	 */
	public String getFn_hiddenFieldValue() {
		return fn_hiddenFieldValue;
	}

	/**
	 * Returns the hiddenFieldName.
	 * @return String
	 */
	public String getHiddenFieldName() {
		return hiddenFieldName;
	}

	/**
	 * Returns the hiddenFieldValue.
	 * @return String
	 */
	public String getHiddenFieldValue() {
		return hiddenFieldValue;
	}

	/**
	 * Returns the tree_hiddenFieldValue.
	 * @return String
	 */
	public String getTree_hiddenFieldValue() {
		return tree_hiddenFieldValue;
	}

	/**
	 * Returns the v_hiddenFieldValue.
	 * @return String
	 */
	public String getV_hiddenFieldValue() {
		return v_hiddenFieldValue;
	}

	/**
	 * Sets the createHiddenField.
	 * @param createHiddenField The createHiddenField to set
	 */
	public void setCreateHiddenField(boolean createHiddenField) {
		this.createHiddenField = createHiddenField;
	}

	/**
	 * Sets the fn_hiddenFieldValue.
	 * @param fn_hiddenFieldValue The fn_hiddenFieldValue to set
	 */
	public void setFn_hiddenFieldValue(String fn_hiddenFieldValue) {
		this.fn_hiddenFieldValue = fn_hiddenFieldValue;
	}

	/**
	 * Sets the hiddenFieldName.
	 * @param hiddenFieldName The hiddenFieldName to set
	 */
	public void setHiddenFieldName(String hiddenFieldName) {
		this.hiddenFieldName = hiddenFieldName;
	}

	/**
	 * Sets the hiddenFieldValue.
	 * @param hiddenFieldValue The hiddenFieldValue to set
	 */
	public void setHiddenFieldValue(String hiddenFieldValue) {
		this.hiddenFieldValue = hiddenFieldValue;
	}

	/**
	 * Sets the tree_hiddenFieldValue.
	 * @param tree_hiddenFieldValue The tree_hiddenFieldValue to set
	 */
	public void setTree_hiddenFieldValue(String tree_hiddenFieldValue) {
		this.tree_hiddenFieldValue = tree_hiddenFieldValue;
	}

	/**
	 * Sets the v_hiddenFieldValue.
	 * @param v_hiddenFieldValue The v_hiddenFieldValue to set
	 */
	public void setV_hiddenFieldValue(String v_hiddenFieldValue) {
		this.v_hiddenFieldValue = v_hiddenFieldValue;
	}

}

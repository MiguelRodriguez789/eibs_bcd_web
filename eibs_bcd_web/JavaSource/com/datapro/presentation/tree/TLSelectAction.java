package com.datapro.presentation.tree;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

import com.datapro.generic.beanutil.BeanList;

/**
 * @author bthorne
 *
 */

public class TLSelectAction  extends TagSupport {

	private String hiddenFieldName = "";
	private String fn_hiddenFieldValue = "";
	private String v_hiddenFieldValue = "";
	private int tree_hiddenFieldValueElementReference = 0;
	private int tree_hiddenFieldValueElementProperty = 0;
	private int tree_hiddenFieldValueElementIconReference = 0;
	private int tree_hiddenFieldValueElementIconProperty = 0;
	private boolean createHiddenField = true;
	
	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		TLSelect parentSelect;
		TLTree parentTree = (TLTree)findAncestorWithClass(parentSelect=(TLSelect)findAncestorWithClass(this,TLSelect.class),TLTree.class);
		if(parentTree==null||parentSelect==null)
			throw new JspTagException("Improper use of <tree:select_action> tag.");
		return (EVAL_BODY_INCLUDE);
	}

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doEndTag()
	 */
	public int doEndTag() throws JspException {
		TLSelect parentSelect;
		TLTree parentTree = (TLTree)findAncestorWithClass(parentSelect=(TLSelect)findAncestorWithClass(this,TLSelect.class),TLTree.class);
		BeanList selectionObjects = parentTree.getSelectionObjects();
		JBSelection sel = new JBSelection();
			sel.setHiddenFieldName(hiddenFieldName);
			sel.setFn_hiddenFieldValue(fn_hiddenFieldValue);
			sel.setV_hiddenFieldValue(v_hiddenFieldValue);
			sel.setTree_hiddenFieldValue(
					  tree_hiddenFieldValueElementReference
					+ tree_hiddenFieldValueElementProperty
					+ tree_hiddenFieldValueElementIconReference
					+ tree_hiddenFieldValueElementIconProperty
					+ "");
			sel.setCreateHiddenField(createHiddenField);
		selectionObjects.addRow(sel);
		return (EVAL_PAGE);
	}


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
	 * Returns the tree_hiddenFieldValueElementIconProperty.
	 * @return int
	 */
	public int getTree_hiddenFieldValueElementIconProperty() {
		return tree_hiddenFieldValueElementIconProperty;
	}

	/**
	 * Returns the tree_hiddenFieldValueElementIconReference.
	 * @return int
	 */
	public int getTree_hiddenFieldValueElementIconReference() {
		return tree_hiddenFieldValueElementIconReference;
	}

	/**
	 * Returns the tree_hiddenFieldValueElementProperty.
	 * @return int
	 */
	public int getTree_hiddenFieldValueElementProperty() {
		return tree_hiddenFieldValueElementProperty;
	}

	/**
	 * Returns the tree_hiddenFieldValueElementReference.
	 * @return int
	 */
	public int getTree_hiddenFieldValueElementReference() {
		return tree_hiddenFieldValueElementReference;
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
	 * Sets the tree_hiddenFieldValueElementIconProperty.
	 * @param tree_hiddenFieldValueElementIconProperty The tree_hiddenFieldValueElementIconProperty to set
	 */
	public void setTree_hiddenFieldValueElementIconProperty(int tree_hiddenFieldValueElementIconProperty) {
		this.tree_hiddenFieldValueElementIconProperty =
			tree_hiddenFieldValueElementIconProperty;
	}

	/**
	 * Sets the tree_hiddenFieldValueElementIconReference.
	 * @param tree_hiddenFieldValueElementIconReference The tree_hiddenFieldValueElementIconReference to set
	 */
	public void setTree_hiddenFieldValueElementIconReference(int tree_hiddenFieldValueElementIconReference) {
		this.tree_hiddenFieldValueElementIconReference =
			tree_hiddenFieldValueElementIconReference;
	}

	/**
	 * Sets the tree_hiddenFieldValueElementProperty.
	 * @param tree_hiddenFieldValueElementProperty The tree_hiddenFieldValueElementProperty to set
	 */
	public void setTree_hiddenFieldValueElementProperty(int tree_hiddenFieldValueElementProperty) {
		this.tree_hiddenFieldValueElementProperty =
			tree_hiddenFieldValueElementProperty;
	}

	/**
	 * Sets the tree_hiddenFieldValueElementReference.
	 * @param tree_hiddenFieldValueElementReference The tree_hiddenFieldValueElementReference to set
	 */
	public void setTree_hiddenFieldValueElementReference(int tree_hiddenFieldValueElementReference) {
		this.tree_hiddenFieldValueElementReference =
			tree_hiddenFieldValueElementReference;
	}

	/**
	 * Sets the v_hiddenFieldValue.
	 * @param v_hiddenFieldValue The v_hiddenFieldValue to set
	 */
	public void setV_hiddenFieldValue(String v_hiddenFieldValue) {
		this.v_hiddenFieldValue = v_hiddenFieldValue;
	}

}
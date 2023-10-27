package com.datapro.presentation.tree;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author ogarcia
 *
 */

public class TLScroll  extends TagSupport {


	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		TLTree parentTagObject = (TLTree)findAncestorWithClass(this,TLTree.class);		
		if(parentTagObject==null)
			throw new JspTagException("Improper use of <tree:scroll> tag.");
		else
			parentTagObject.setTableHasScroll(true);
		return (EVAL_BODY_INCLUDE);
	}

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doEndTag()
	 */
	public int doEndTag() throws JspException {
		return (EVAL_PAGE);
	}

// getters and setters for parent's scroll properties

/**
 * Returns the height.
 * @return String
 */
public String getHeight() {
	return ((TLTree)findAncestorWithClass(this,TLTree.class)).getScroll_height();
}

/**
 * Returns the overFlowX.
 * @return String
 */
public String getOverFlowX() {
	return ((TLTree)findAncestorWithClass(this,TLTree.class)).getScroll_overFlowX();
}

/**
 * Returns the overFlowY.
 * @return String
 */
public String getOverFlowY() {
	return ((TLTree)findAncestorWithClass(this,TLTree.class)).getScroll_overFlowY();
}

/**
 * Returns the width.
 * @return String
 */
public String getWidth() {
	return ((TLTree)findAncestorWithClass(this,TLTree.class)).getScroll_width();
}

/**
 * Sets the height.
 * @param height The height to set
 */
public void setHeight(String height) {
	((TLTree)findAncestorWithClass(this,TLTree.class)).setScroll_height(height);
}

/**
 * Sets the overFlowX.
 * @param overFlowX The overFlowX to set
 */
public void setOverFlowX(String overFlowX) {
	((TLTree)findAncestorWithClass(this,TLTree.class)).setScroll_overFlowX(overFlowX);
}

/**
 * Sets the overFlowY.
 * @param overFlowY The overFlowY to set
 */
public void setOverFlowY(String overFlowY) {
	((TLTree)findAncestorWithClass(this,TLTree.class)).setScroll_overFlowY(overFlowY);
}

/**
 * Sets the width.
 * @param width The width to set
 */
public void setWidth(String width) {
	((TLTree)findAncestorWithClass(this,TLTree.class)).setScroll_width(width);
}

}
package com.datapro.presentation.tree;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author ogarcia
 *
 */

public class TLSelect  extends TagSupport {

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		TLTree parentTagObject = (TLTree)findAncestorWithClass(this,TLTree.class);		
		if(parentTagObject==null)
			throw new JspTagException("Improper use of <tree:scroll> tag.");
		else
			parentTagObject.setTableEnableSelection(true);
		return (EVAL_BODY_INCLUDE);
	}

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doEndTag()
	 */
	public int doEndTag() throws JspException {
		return (EVAL_PAGE);
	}
}
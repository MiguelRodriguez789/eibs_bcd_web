package com.datapro.presentation.dyntable;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * @author ramaro
 * @author ogarcia
 *
 */
public class TLURLParameters extends BodyTagSupport {

	private String name = "";
	private String value = "";

	/**
	 * @see javax.servlet.jsp.tagext.IterationTag#doAfterBody()
	 */
	public int doAfterBody() throws JspException {
		if (bodyContent != null) {
			value = bodyContent.getString().trim();
			bodyContent.clearBody();
		}
		return (SKIP_BODY);
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
				String url = parentTagObject.getUrlDetail();
				String separator = (url.indexOf("?") < 0) ? "?" : "&";
				url = url + separator + name + "=" + value;
				parentTagObject.setUrlDetail(url);
			} catch (Exception e) {
				System.out.println("Error element-tag process.");
			}
		}
		return (EVAL_PAGE);
	}

	/**
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return
	 */
	public String getValue() {
		return value;
	}

	/**
	 * @param string
	 */
	public void setName(String string) {
		name = string;
	}

	/**
	 * @param string
	 */
	public void setValue(String string) {
		value = string;
	}

}
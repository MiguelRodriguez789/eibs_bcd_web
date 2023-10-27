package com.datapro.presentation.dyntable;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.datapro.presentation.helps.TLHelpUtil;

/**
 * @author fhernandez
 *
 */

public class TLDynRelButton extends BodyTagSupport {

	private static final long serialVersionUID = -630021488998153692L;
	private String name = null;
	private String caption = null;
	private String styleClass = null;
	
	/**
	 * Constructor for TLDynRelButton.
	 */
	public TLDynRelButton() {
		super();
	}

	public void setName(String value) {
		name = value;
	}

	public String getName() {
		return (name);
	}
	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		return (EVAL_BODY_BUFFERED);
	}

	public int doAfterBody() throws JspTagException {
		String strCaption = "";
		try {
			BodyContent bc = getBodyContent();
			// get the bc as string
			if (bc != null) {
				strCaption = bc.getString().trim();
				// clean up
				bc.clearBody();
			}
			if (caption != null) {
				strCaption = caption;
			} else
				setCaption(strCaption);
		} catch (Exception ex) {
			throw new JspTagException("<dyntable:button>: " + ex.getMessage());
		}
		return SKIP_BODY;
	}
	/**
	 * @see javax.servlet.jsp.tagext.Tag#doEndTag()
	 */
	public int doEndTag() {
		try {
			JspWriter out = pageContext.getOut();
			String contextPath = TLHelpUtil.getContextPath(pageContext);
			String strClass = "";
			String group = pageContext.getRequest().getParameter("GROUP");
			String row = pageContext.getRequest().getParameter("ROW");
			
			if (styleClass != null) strClass = " class=" + styleClass;
			out.println("<SCRIPT language=\"Javascript\" src=\"" + contextPath + "/pages/s/javascripts/dynTable.js\"></SCRIPT>");			
			out.println("<p align=center>");
			out.println(
					"<input type =button "
						+ strClass
						+ " value="
						+ caption
						+ " onclick=\"clickRelBtn('"
						+ group
						+ "','" + row + "')\">"); 
			out.println("</p>");			

		} catch (Exception ex) {
		}
		return (EVAL_PAGE);
	}

	/**
	 * Returns the caption.
	 * @return boolean
	 */
	public String getCaption() {
		return caption;
	}

	/**
	 * Sets the caption.
	 * @param caption The caption to set
	 */
	public void setCaption(String caption) {
		this.caption = caption;
	}

	/**
	 * Returns the styleClass.
	 * @return String
	 */
	public String getStyleClass() {
		return styleClass;
	}

	/**
	 * Sets the styleClass.
	 * @param styleClass The styleClass to set
	 */
	public void setStyleClass(String styleClass) {
		this.styleClass = styleClass;
	}

}
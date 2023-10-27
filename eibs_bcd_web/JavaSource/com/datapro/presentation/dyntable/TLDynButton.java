package com.datapro.presentation.dyntable;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.datapro.generic.beanutil.BeanParser;
import com.datapro.generic.tool.TLUtil;
import com.datapro.presentation.helps.TLHelpUtil;

/**
 * @author ogarcia
 *
 */

public class TLDynButton extends BodyTagSupport {

	private String name = null;
	private String caption = null;
	private String styleClass = null;
	private String onValidate = "true";
	private String beanToValidate = null;
	
	private final static String STATUS_DEFAULT = "DEFAULT";
	private final static String STATUS_VALIDATE = "";
	private final static String STATUS_ERROR = "ERROR";
	private final static String STATUS_OK = "OK";
	/**
	 * Constructor for TLTableSuper.
	 */
	public TLDynButton() {
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
			String status = STATUS_DEFAULT; 
			String group = pageContext.getRequest().getParameter("GROUP");
			String row = pageContext.getRequest().getParameter("ROW");
			
			if (beanToValidate != null) {
				Object bean = null;
				bean = (Object) TLUtil.lookup(pageContext,beanToValidate,"request");
				if (bean != null) {
					BeanParser bp = new BeanParser();
					bp.setBean(bean);
					try {
						status= bp.getString("STATUS");
						group = bp.getString("GROUP");
						row = bp.getString("ROW");
					}catch(Exception e) {
						status= "";
						group = name;
						row = "";
					}					
				}
			}
			if (styleClass != null) strClass = " class=" + styleClass;
			out.println("<SCRIPT language=\"Javascript\" src=\"" + contextPath + "/pages/s/javascripts/dynTable.js\"></SCRIPT>");			
			out.println("<p align=center>");
			if (status.equals(STATUS_DEFAULT)) {			
				out.println(
					"<input type =button "
						+ strClass
						+ " value="
						+ caption
						+ " onclick=\"clickBtn('"
						+ group
						+ "','" + row + "')\">");
			
			} else {
				out.println(
				"<input type =submit "
					+ strClass
					+ " value="
					+ caption + ">");
			}
			out.println("</p>");
			
			out.println("<SCRIPT language=\"javascript\">");
			out.println(" 	function clickBtn(nme,row) {");
			out.println(" 		if (" + onValidate + " == true) {");
			out.println(" 			updateFields(nme,row);");
			if("true".equals(pageContext.getRequest().getParameter("ADD"))){
				out.println(" 		document.forms[0].submit();");	
			}
			out.println(" 		}");
			out.println("	}");
			if (status.equals(STATUS_DEFAULT) || status.equals(STATUS_VALIDATE)) {
				out.println(" 	getFieldsValue('" + group + "','"+row+"');");				
			} else if(status.equals(STATUS_OK)){
				out.println(" 	updateFields('"+group+"','"+row+"')");
			}			
			out.println("</SCRIPT>");
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

	/**
	 * Returns the onValidate.
	 * @return String
	 */
	public String getOnValidate() {
		return onValidate;
	}

	/**
	 * Sets the onValidate.
	 * @param onValidate The onValidate to set
	 */
	public void setOnValidate(String onValidate) {
		this.onValidate = onValidate;
	}
	

	/**
	 * @return
	 */
	public String getBeanToValidate() {
		return beanToValidate;
	}

	/**
	 * @param string
	 */
	public void setBeanToValidate(String string) {
		beanToValidate = string;
	}

}
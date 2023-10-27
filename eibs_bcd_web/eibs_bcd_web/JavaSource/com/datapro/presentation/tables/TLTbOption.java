package com.datapro.presentation.tables;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.*;


/**
 * @author ramaro
 *
 */

public class TLTbOption  extends BodyTagSupport {

    private String name=null;
    private int cols = 0;
    
    public void setName(String value){
    	name = value;
    }
    
    public String getName(){
    	return(name);
    }
    
    public TLTbOption() {
		super();
	}
	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		try{
			JspWriter out = pageContext.getOut();
			if (name !=null) {
				out.println("<TABLE name=\"" + name + "\" class=\"tbenter\">");
			} else {
				out.println("<TABLE class=\"tbenter\">");
			}
			out.println("<TR>");
		}
		catch (Exception ex) {			
		}	
		return (EVAL_BODY_INCLUDE);
	}
	/**
	 * @see javax.servlet.jsp.tagext.BodyTag#doInitBody()
	 */
	public void doInitBody() throws JspException {
		BodyContent body = null;
			
	}
	/**
	 * @see javax.servlet.jsp.tagext.BodyTag#doAfterBody()
	 */
	public int doAfterBody() throws JspException {
				
		try{			
			BodyContent body = getBodyContent();
			String str = body.getString();
			
			if (str!= null) {
				while (str.indexOf("<TD") > -1) {
					cols++;
					str = str.substring(str.indexOf("<TD") + 3,str.length());
				} 
			}						
		}
		catch (Exception ex) {			
		}
		return (SKIP_BODY);	
	}
	/**
	 * @see javax.servlet.jsp.tagext.Tag#doEndTag()
	 */
	public int doEndTag() throws JspException {
		 
		try{
			
			String str = pageContext.pushBody().getString();
			
			if (str!= null) {
				while (str.indexOf("<TD") > -1) {
					cols++;
					str = str.substring(str.indexOf("<TD") + 3,str.length());
				} 
			}	
			JspWriter out = pageContext.getOut();
			out.println("</TR>");
			
			if (cols > 0) {
				int width = (100 / cols);
				out.println("<COLGROUP SPAN=" + cols + " WIDTH="+width+"%>");
				out.println("</COLGROUP>");
			}
			
			out.println("</TABLE>");			
		}
		catch (Exception ex) {			
		}
		return (EVAL_PAGE);	
	}
	
	


}
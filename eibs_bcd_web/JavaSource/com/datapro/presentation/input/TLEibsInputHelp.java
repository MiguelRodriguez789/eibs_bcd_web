package com.datapro.presentation.input;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import com.datapro.presentation.helps.EibsInputHelp;

import datapro.eibs.master.SuperServlet;

/**
 * @author fhernandez
 *
 */
public class TLEibsInputHelp extends EibsInputHelp {

	private static final long serialVersionUID = -4965948789097030056L;

	private String fn_param_one = null;
	private String fn_param_two = null;
	private String fn_param_three = null;
	private String fn_param_four = null;
	private String fn_param_five = null;
	private String fn_param_six = null;
	private String fn_param_seven = null;


	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			String contextPath = SuperServlet.webAppPath;
			
			StringBuffer str = new StringBuffer();
			
	    	if (!getReadonly())
	    		str.append(
	    			getHelpLink(
						contextPath,
						"",
						fn_param_one,
						fn_param_two,
						fn_param_three,
						fn_param_four,
						fn_param_five,
						fn_param_six,
						fn_param_seven));
	    	if (isRequired())
	    		str.append(
	    			getMandatoryIcon(
						contextPath,
						""));	
			
			str.append("</a>");

			out.print(str);
			
		} catch (Exception ex) {
		}
		return (super.doEndTag());
	}
	
	public String getFn_param_five() {
		return fn_param_five;
	}
	public void setFn_param_five(String fn_param_five) {
		this.fn_param_five = fn_param_five;
	}
	public String getFn_param_four() {
		return fn_param_four;
	}
	public void setFn_param_four(String fn_param_four) {
		this.fn_param_four = fn_param_four;
	}
	public String getFn_param_one() {
		return fn_param_one;
	}
	public void setFn_param_one(String fn_param_one) {
		this.fn_param_one = fn_param_one;
	}
	public String getFn_param_seven() {
		return fn_param_seven;
	}
	public void setFn_param_seven(String fn_param_seven) {
		this.fn_param_seven = fn_param_seven;
	}
	public String getFn_param_six() {
		return fn_param_six;
	}
	public void setFn_param_six(String fn_param_six) {
		this.fn_param_six = fn_param_six;
	}
	public String getFn_param_three() {
		return fn_param_three;
	}
	public void setFn_param_three(String fn_param_three) {
		this.fn_param_three = fn_param_three;
	}
	public String getFn_param_two() {
		return fn_param_two;
	}
	public void setFn_param_two(String fn_param_two) {
		this.fn_param_two = fn_param_two;
	}
	
	public void release() {
		super.release();
		fn_param_one = null;
		fn_param_two = null;
		fn_param_three = null;
		fn_param_four = null;
		fn_param_five = null;
		fn_param_six = null;
		fn_param_seven = null;
	}	
}

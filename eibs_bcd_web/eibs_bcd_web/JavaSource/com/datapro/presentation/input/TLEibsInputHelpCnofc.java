package com.datapro.presentation.input;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import com.datapro.eibs.constants.HelpTypes;
import com.datapro.presentation.helps.EibsInputHelpCnofc;

import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;

/**
 * @author fhernandez
 *
 */
public class TLEibsInputHelpCnofc extends EibsInputHelpCnofc {

	private static final long serialVersionUID = -1656601899949805644L;

	private String flag = null;
	private String appCode = null;
	private String fn_code = null;
	private String fn_description = null;
	private String fn_param_one = null;
	private String filter = null;
	
	public int doStartTag() throws JspException {
		if (getProperty() == null || getProperty().equals("")) {
			setProperty(getFn_code());
		}
		if (getFn_code() == null || getFn_code().equals("")) {
			setFn_code(getProperty());
		}
		if (getHelp() == HelpTypes.CNOF_CODE_FILTERED) {
			if(Util.parseInt(getMaxlength()) < 30){
				setMaxlength("6");				
			}
			if(Util.parseInt(getSize()) < 30){
				setSize("7");				
			}
		} else {
			if(Util.parseInt(getMaxlength()) < 30){
				setMaxlength("4");				
			}
			if(Util.parseInt(getSize()) < 30){
				setSize("5");				
			}
		}
		prepareStyle(STYLEID_TXTRIGHT);
		
		return super.doStartTag();
	}
	
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
						flag,
						fn_code,
						fn_description,
						filter,
						appCode,
						fn_param_one));
			
			str.append("</a>");
			
	    	if (isRequired())
	    		str.append(
	    			getMandatoryIcon(
						contextPath,
						""));	

			out.print(str);
			
		} catch (Exception ex) {
		}
		return (super.doEndTag());
	}
	
	public String getAppCode() {
		return appCode;
	}
	public void setAppCode(String appCode) {
		this.appCode = appCode;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getFn_code() {
		return fn_code;
	}
	public void setFn_code(String fn_code) {
		this.fn_code = fn_code;
	}
	public String getFn_description() {
		return fn_description;
	}
	public void setFn_description(String fn_description) {
		this.fn_description = fn_description;
	}
	public String getFn_param_one() {
		return fn_param_one;
	}
	public void setFn_param_one(String fn_param_one) {
		this.fn_param_one = fn_param_one;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}
	
	public void release() {
		super.release();
		flag = null;
		appCode = null;
		fn_code = null;
		fn_description = null;
		fn_param_one = null;
		filter = null;
	}	
	
}

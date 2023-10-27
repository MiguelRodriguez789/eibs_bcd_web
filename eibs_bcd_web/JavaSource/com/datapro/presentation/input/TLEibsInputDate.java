package com.datapro.presentation.input;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import com.datapro.generic.tool.Util;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.SuperServlet;

/**
 * @author fhernandez
 *
 */
public class TLEibsInputDate extends EibsInputDate {

	private static final long serialVersionUID = -4657478425528295659L;
	private String fn_date = null;
	private String fn_month = null;
	private String fn_day = null;
	private String fn_year = null;
	private String fni_month = null;
	private String fni_day = null;
	private String fni_year = null;
	private boolean defaultRunDate;

	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			String contextPath = SuperServlet.webAppPath;
			StringBuffer str = new StringBuffer();
			
	    	if (!getReadonly())
	    		if (fn_date == null) {
		    		str.append(
			    		getDateHelpLink(
							contextPath,
							"",
							fn_year,
							fn_month,
							fn_day));
				} 
			
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
	
    protected String renderInputElement() throws JspException {
    	ESS0030DSMessage currUser = (ESS0030DSMessage) pageContext.getSession().getAttribute("currUser");
		setFormat(currUser.getE01DTF());
		
        StringBuffer results = new StringBuffer();
        
        if (fn_date == null) {
        	String year = lookupProperty(getName(), getFn_year());
        	String month = lookupProperty(getName(), getFn_month());
        	String day = lookupProperty(getName(), getFn_day());
        	if (isDefaultRunDate()) {
				if (Util.parseInt(year) == 0) {
					year = currUser.getE01RDY();
				}
				if (Util.parseInt(month) == 0) {
					month = currUser.getE01RDM();
				}
				if (Util.parseInt(day) == 0) {
					day = currUser.getE01RDD();
				}
			}
            results.append(
            	getDateInput(
                	getFni_year(),
        			getFni_month(),
        			getFni_day(),
    				year,
    				month,
    				day,
					getReadonly() ? "readonly" : ""));
		} else {
	        results.append(
	        	getDateInput(
	        		getFn_date(), 
					lookupProperty(getName(), getFn_date()),
					getReadonly() ? "readonly" : ""));
		}

        return results.toString();
    }
    
	public String getFni_month() {
		return fni_month == null ? getFn_month() : fni_month;
	}

	public void setFni_month(String fni_month) {
		this.fni_month = fni_month;
	}

	public String getFni_day() {
		return fni_day == null ? getFn_day() : fni_day;
	}

	public void setFni_day(String fni_day) {
		this.fni_day = fni_day;
	}

	public String getFni_year() {
		return fni_year == null ? getFn_year() : fni_year;
	}

	public void setFni_year(String fni_year) {
		this.fni_year = fni_year;
	}

	public String getFn_day() {
		return fn_day;
	}
	public void setFn_day(String fn_day) {
		this.fn_day = fn_day;
	}
	public String getFn_month() {
		return fn_month;
	}
	public void setFn_month(String fn_month) {
		this.fn_month = fn_month;
	}
	public String getFn_year() {
		return fn_year;
	}
	public void setFn_year(String fn_year) {
		this.fn_year = fn_year;
	}
	public String getFn_date() {
		return fn_date;
	}
	public void setFn_date(String fn_date) {
		this.fn_date = fn_date;
	}
 	
	public boolean isDefaultRunDate() {
		return defaultRunDate;
	}

	public void setDefaultRunDate(boolean defaultRunDate) {
		this.defaultRunDate = defaultRunDate;
	}

	public void release() {
		super.release();
		fn_date = null;
		fn_month = null;
		fn_day = null;
		fn_year = null;
		fni_month = null;
		fni_day = null;
		fni_year = null;
	}
}

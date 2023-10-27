package com.datapro.presentation.input;


import java.text.ParseException;
import java.util.Arrays;

import javax.servlet.jsp.JspException;

import com.datapro.constants.EibsDate;
import com.datapro.generic.tool.UDateFormat;

/**
 * @author fhernandez
 *
 */

public class EibsInputDate extends EibsInputFields implements EibsDate {

	private static final long serialVersionUID = 2679387849717165817L;
	private String format = FORMAT_DATE_DMY;
	private String modified;
	private String modMonth;
	private String modDay;
	private String modYear;

	public EibsInputDate() {
		super();
	}
	
	public EibsInputDate(String format) {
		super();
		this.format = format;
	}
	
	public String getFormat() {
		return format;
	}
	
	public void setFormat(String format) {
		this.format = format;
	}
	
	/**
	 * prepareModFlags:
	 * Separates the Flags fields into private string fields to be sent later as the modified field.
	 */	
	
    public static String isDateModified(String flag1, String flag2, String flag3){
    	return Boolean.toString(flag1.trim().equals("Y") || flag2.trim().equals("Y") || flag3.trim().equals("Y"));
    }	
	
	private void prepareModFlags(String fldYear, String fldMonth, String fldDay) throws JspException{
		String[] modDummy = null;
		modified = getModified();
		
		if (null != modified){
			
			modified = modified.replace(String.valueOf((char) 32), "").trim();
			
			if (modified.contains(";") || modified.contains(",") ){ //Indicates multiple modified flags. 
				if(modified.contains(";")){
					modDummy = modified.split(";");
				}else{
					modDummy = modified.split(",");
				}
				if(Arrays.asList(modDummy).contains("F"+fldYear.substring(1))){
					modYear = modDummy[Arrays.asList(modDummy).indexOf("F"+fldYear.substring(1))].trim();
				}
					
				if(Arrays.asList(modDummy).contains("F"+fldMonth.substring(1))){
					modMonth = modDummy[Arrays.asList(modDummy).indexOf("F"+fldMonth.substring(1))].trim();
				}
					
				if(Arrays.asList(modDummy).contains("F"+fldDay.substring(1))){
					modDay = modDummy[Arrays.asList(modDummy).indexOf("F"+fldDay.substring(1))].trim();
				}				
			}else{
				modYear = modified; modMonth = modified; modDay = modified;
			}
			
			ifModifiedSetAll(true); //If one flag is "Y", set all flags to "Y". Place false if you want individual flags only or comment out.
		}		
		
	}
	
	private void ifModifiedSetAll(boolean flag) throws JspException{
		
		if (true != flag){
			return;
		}else{
			if(modified != modYear || modified != modMonth || modified != modDay){
				if("Y".equals(getModifiedValue(modYear))){
					modMonth = modYear;
					modDay = modYear;
					return;
				}else if("Y".equals(getModifiedValue(modMonth))){
					modYear = modMonth;
					modDay = modMonth; 
					return;
				}else if("Y".equals(getModifiedValue(modDay))){
					modYear = modDay;
					modMonth = modDay;
					return;
				}
			}
		}
	}	
	
	public String getDateInput(
			String fldDateName,
			String fldDateValue,
			String options) {
		
        try {
            String formatedDate = UDateFormat.format(
				UDateFormat.parse(
					fldDateValue,
					PATTERN_SQL_DATE),
				format,
				MEDIUM);
            
            return getInputText(
    				EIBS_FIELD_TYPE_DATE, 
    				fldDateName, 
    				formatedDate, 
    				options);
        } catch (ParseException e) {
            return "Invalid Date Format.";
        }

	}
	
	public String getDateInput(
			String fldYearName,
			String fldMonthName,
			String fldDayName,
			String fldYearValue,
			String fldMonthValue,
			String fldDayValue,
			String options) throws JspException {
		
		StringBuffer sb = new StringBuffer();
		
		String prefix_id = "";
		if(getStyleId()!= null){				
			prefix_id = getStyleId()+"_";
		}else{
			setId("");
		}
		
		prepareModFlags(fldYearName, fldMonthName, fldDayName);
		
		if (format.equals(FORMAT_DATE_DMY)) {
			if(getStyleId()!= null){				
				setId(prefix_id + fldDayName);
			}
			if( null != modified ) {
				setModified(modDay);
			}
			sb.append(
					getInputText(EIBS_FIELD_TYPE_DAY, fldDayName, fldDayValue, options));
			if(getStyleId()!= null){				
				setId(prefix_id + fldMonthName);
			}
			if( null != modified ) {
				setModified(modMonth);
			}			
			sb.append(
					getInputText(EIBS_FIELD_TYPE_MONTH, fldMonthName, fldMonthValue, options));
			if(getStyleId()!= null){				
				setId(prefix_id + fldYearName);
			}
			if( null != modified ) {
				setModified(modYear);
			}				
			sb.append(
					getInputText(EIBS_FIELD_TYPE_YEAR, fldYearName, fldYearValue, options));
			
		} else if (format.equals(FORMAT_DATE_MDY)) {
			if(getStyleId()!= null){				
				setId(prefix_id + fldMonthName);
			}
			if( null != modified ) {
				setModified(modMonth);
			}			
			sb.append(
					getInputText(EIBS_FIELD_TYPE_MONTH, fldMonthName, fldMonthValue, options));
			
			if(getStyleId()!= null){				
				setId(prefix_id + fldDayName);
			}
			if( null != modified ) {
				setModified(modDay);
			}			
			sb.append(
					getInputText(EIBS_FIELD_TYPE_DAY, fldDayName, fldDayValue, options));
			
			if(getStyleId()!= null){				
				setId(prefix_id + fldYearName);
			}
			if( null != modified ) {
				setModified(modYear);
			}		
			sb.append(
					getInputText(EIBS_FIELD_TYPE_YEAR, fldYearName, fldYearValue, options));
			
		} else if (format.equals(FORMAT_DATE_YMD)) {
			if(getStyleId()!= null){				
				setId(prefix_id + fldYearName);
			}
			if( null != modified ) {
				setModified(modYear);
			}				
			sb.append(
					getInputText(EIBS_FIELD_TYPE_YEAR, fldYearName, fldYearValue, options));
			
			if(getStyleId()!= null){				
				setId(prefix_id + fldMonthName);
			}
			if( null != modified ) {
				setModified(modMonth);
			}				
			sb.append(
					getInputText(EIBS_FIELD_TYPE_MONTH, fldMonthName, fldMonthValue, options));
			
			if(getStyleId()!= null){				
				setId(prefix_id + fldDayName);
			}
			if( null != modified ) {
				setModified(modDay);
			}			
			sb.append(
					getInputText(EIBS_FIELD_TYPE_DAY, fldDayName, fldDayValue, options));
			
		} else {
			sb.append("Invalid Date Format.");
		}
	
		return sb.toString();
	}
	
	public String getHelpLink(
			String contextPath,
			String skin,
			String function,
			String id) {
		
		StringBuffer sb = new StringBuffer();
		if (function != null) {
			if (id != null)
				sb.append(
					"<a id=\""
						+ id
						+ "\" href=\"javascript:"
						+ function
						+ "\">");
			else
				sb.append(
					"<a id=\"linkHelp\" href=\"javascript:" + function + "\">");
			
			sb.append(
				"<img src=\""
					+ contextPath
					+ "/images/calendar.gif\" title=\""+ (getAlt() != null ? " title=\""+ getAlt().trim() + "\"" : "") 
					+ "\" style=\"vertical-align: bottom;\" border=\"0\"/>");
			
			sb.append("</a>");
		}
		return sb.toString();
	}
	
	public String getDateFunction(
			String fldYearName,
			String fldMonthName,
			String fldDayName) {

		if (fldYearName != null && fldMonthName != null && fldDayName != null) {
			if (format.equals(FORMAT_DATE_DMY)) {
				return "DatePicker(" 
				+ "document.forms[0]." + fldDayName + ","
				+ "document.forms[0]." + fldMonthName + ","
				+ "document.forms[0]." + fldYearName + ")";
				
			} else if (format.equals(FORMAT_DATE_MDY)) {
				return "DatePicker(" 
				+ "document.forms[0]." + fldMonthName + ","
				+ "document.forms[0]." + fldDayName + ","
				+ "document.forms[0]." + fldYearName + ")";
				
			} else if (format.equals(FORMAT_DATE_YMD)) {
				return "DatePicker(" 
				+ "document.forms[0]." + fldYearName + ","
				+ "document.forms[0]." + fldMonthName + ","
				+ "document.forms[0]." + fldDayName + ")";
			}
		}
		return "";
	}
	
	public String getDateHelpLink(
			String contextPath,
			String skin,
			String fldYearName,
			String fldMonthName,
			String fldDayName) {

		return getHelpLink(
				contextPath, 
				skin, super.getCapslock() ?  getDateFunction(fldYearName.toUpperCase(), fldMonthName.toUpperCase(), fldDayName.toUpperCase()) :
				getDateFunction(fldYearName, fldMonthName, fldDayName), null);
	}

	public void release() {
		super.release();
		format 	 = FORMAT_DATE_DMY;		
		modified = null;
		modMonth = null;
		modDay   = null;
		modYear  = null;
	}	
	
}
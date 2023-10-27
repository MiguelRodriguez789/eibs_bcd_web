package com.datapro.presentation.helps;

import com.datapro.eibs.constants.HelpTypes;
import com.datapro.presentation.input.EibsInputFields;

/**
 * @author ogarcia
 *
 */

public class EibsInputHelpCnofc extends EibsInputFields {

	private static final long serialVersionUID = 4542942112465309030L;
	private int help = -1;
	
	public EibsInputHelpCnofc() {
		super();
		setEibsType(EIBS_FIELD_TYPE_CNOFC);
	}
	
	/**
	 * 
	 */
	public EibsInputHelpCnofc(int help) {
		super();
		this.help = help;
		setEibsType(EIBS_FIELD_TYPE_CNOFC);
	}
	
	public int getHelp() {
		return help;
	}
	
	public void setHelp(int help) {
		this.help = help;
	}
	
    public String getHelpLink(
			String contextPath,
			String skin,
			String flag,
			String fieldName,
			String fieldDesc,
			String filter,
			String appCode,
			String fieldAux2) {
    	
    	return getHelpLink(
				contextPath, 
				skin, 
				getFunction(flag, fieldName, fieldDesc, filter, appCode, fieldAux2),
				null);
    }
	
	public String getFunction(
			String flag,
			String fn_code,
			String fn_description,
			String filter,
			String appCode,
			String fn_param_one) {
		
		String strFunction = "";
		if (flag != null) {
			String strAppCode = ", ''";
			if (appCode != null) {
				if(appCode.indexOf("document.") == -1){
					strAppCode = ", '" + appCode + "'";	
				} else {
					strAppCode = ", " + appCode;
				}
			}
			
			String strCode = ", ''";
			if (fn_code != null) {
				strCode = "'" + fn_code + "'";
			}
			String strDesc = ", ''";
			if (fn_description != null) {
				strDesc = ", '" + fn_description + "'";
			}
			String strFilter = ", ''";
			if (filter != null) {
				if(filter.indexOf("document.") == -1){
					strFilter = ", '" + filter + "'";	
				} else {
					strFilter = ", " + filter;
				}
			}
			switch (help) {
				case HelpTypes.CNOF_CODE_APPCODE :
					String strParamOne = ", ''";
					if (fn_param_one != null) {
						if(fn_param_one.indexOf("document.") == -1){
							strParamOne = ", '" + fn_param_one + "'";	
						} else {
							strParamOne = ", " + fn_param_one;
						}
					}
					strFunction = "helpCNOFCAppCode('" 
						+ flag
						+ "'"
						+ strCode
						+ strDesc
						+ strAppCode
						+ strParamOne
						+ ")";
					break;
				case HelpTypes.CNOF_CODE_FILTERED :
					strFunction = 
						"GetCNOFCFilteredCodes(" +
							strCode + 
							strDesc + 
							strFilter +  
							",'" +flag + "')";
					break;
				case HelpTypes.CNOF_CODE :
				default :
					strFunction = 
						"GetCodeDescCNOFC(" +
							strCode + 
							strDesc + 
							",'" + flag + "')";
			}

		}
		return (strFunction);
	}

	public void release() {
		super.release();
		help = -1;
	}	
	

}
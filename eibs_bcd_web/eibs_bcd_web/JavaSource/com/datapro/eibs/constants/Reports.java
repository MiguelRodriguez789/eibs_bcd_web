package com.datapro.eibs.constants;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.ResourceBundle;

/**
 * @author fhernandez
 *
 * Constants declaration for reports module.
 * 
 */
public interface Reports {
	
	public static final String  REPORT_PERIOD_DAILY 		= EOD.END_OF_DAY_PROCESS;
	public static final String  REPORT_PERIOD_MONTHLY 		= EOD.END_OF_MONTH_PROCESS;
	public static final String  REPORT_PERIOD_YEARLY 		= EOD.END_OF_YEAR_PROCESS;
	public static final String  REPORT_PERIOD_ONDEMAND 		= "B";
	public static final String  REPORT_PERIOD_ANY		 	= "C";
	public static final String  REPORT_PERIOD_OTHER 		= "O";
	
	public static final String  REPORT_TYPE_DEFAULT		= "A";
	public static final String  REPORT_TYPE_EDITABLE	= "E";
	public static final String  REPORT_TYPE_DISABLED	= "D";	

	public static final String  REPORT_SPOOL_STATUS_REQUESTED 	= "Q";
	public static final String  REPORT_SPOOL_STATUS_READY	 	= "R";
	public static final String  REPORT_SPOOL_STATUS_ERROR	 	= "E";
	
	public class ReportsModules extends HashMap {
		private static final long serialVersionUID = -7950894663636638371L;
		public ReportsModules() {
			super();			
			ResourceBundle resources = ResourceBundle.getBundle("Reports");
			Enumeration codes = resources.getKeys();
			while (codes.hasMoreElements()) {
				String key = (String) codes.nextElement();
				String value = resources.getString(key);
				String code = key.substring(key.lastIndexOf('.') + 1, key
						.length());
				this.put(code, value);
			}
		}
	}
	public static final ReportsModules REPORTS_MODULES = new ReportsModules();

}

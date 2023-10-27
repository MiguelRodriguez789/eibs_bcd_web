package com.datapro.eibs.reporter.master;

import java.util.MissingResourceException;
import java.util.PropertyResourceBundle;

import datapro.eibs.master.JSEIBSProp;

public class JSEIBSPropLRG extends JSEIBSProp {

	// Parameters for Report Generator
	protected static String fieldRepGenURL;
	protected static String fieldRepGenID;	
	protected static String propertyFileName = "eIBS";
	
	public JSEIBSPropLRG() {
		super();
	}	
	
	public static String getRepGenURL() {
		if (fieldRepGenURL == null) initProperties();
		return fieldRepGenURL;
	}

	public static String getRepGenID() {
		if (fieldRepGenID == null) initProperties();
		return fieldRepGenID;
	}

	public static void initProperties() throws MissingResourceException {
		PropertyResourceBundle eIBSProperties = null;
		try {
			eIBSProperties = (PropertyResourceBundle)PropertyResourceBundle.getBundle(propertyFileName);

			// Report Generator
			try {
				fieldRepGenURL = eIBSProperties.getString("eIBS.RepGen.URL");
			}
			catch (Exception e) {
				fieldRepGenURL = "";
			}		
			try {
				fieldRepGenID = eIBSProperties.getString("eIBS.RepGen.ID");
			}
			catch (Exception e) {
				fieldRepGenID = "";
			}	
			
		}
		catch (MissingResourceException e) {
			System.out.println("Failed to load Properties file.   Be sure " + propertyFileName +
				" is located correctly.");
			throw e;
		}
	}	
	
}

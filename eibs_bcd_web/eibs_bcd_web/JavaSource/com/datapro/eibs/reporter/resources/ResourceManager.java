/**
 * @author Luis M Crosby
 * @date 08MAR2008
 */

package com.datapro.eibs.reporter.resources;

import java.util.ResourceBundle;

public class ResourceManager {

    private static ResourceBundle bundle = ResourceBundle.getBundle("com.datapro.eibs.reporter.resources.live-reporter");

    public static String getString(String key)
    {
    	return bundle.getString(key);
    }
}

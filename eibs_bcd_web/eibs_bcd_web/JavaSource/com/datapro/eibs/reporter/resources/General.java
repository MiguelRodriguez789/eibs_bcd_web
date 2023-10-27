package com.datapro.eibs.reporter.resources;

/**
 * Luis M Crosby 
 * Abril 2004
 */

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class General {
    /**
         * Writes a line of message to a specific output, including the date of
         * the occurrence. The format of the date can be configured manually.
         * 
         * @param message
         *                A String argument containing the message to be
         *                written.
         * @author Luis M Crosby
         * @date 08MAR2008
         */
    public synchronized static void logEvent(String message, String fileName,
	    boolean append) {
	if (General.isBlankOrNull(fileName)) {
	    logEvent(message);
	} else {
	    try {
		BufferedWriter out = new BufferedWriter(new FileWriter(
			fileName, append));
		String DATE_FORMAT = "yyyyMMddhhmmss";

		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		Calendar c1 = Calendar.getInstance(); // today

		out.write(sdf.format(c1.getTime()) + ": " + message);
		out.newLine();
		out.close();

	    } catch (Exception e) {
		System.out.println("." + e.toString() + ".");
	    }
	}
    }

    /**
         * Writes a line of message to a specific output, including the date of
         * the occurrence. The format of the date can be configured manually.
         * 
         * @param message
         *                A String argument containing the message to be
         *                written.
         * @author Luis M Crosby
         * @date 08MAR2008
         */
    public synchronized static void logEvent(String message) {
	try {
	    String DATE_FORMAT = "yyyyMMddhhmmss";

	    SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
	    Calendar c1 = Calendar.getInstance(); // today

	    System.out.println(sdf.format(c1.getTime()) + ": " + message);

	} catch (Exception e) {
	    System.out.println("." + e.toString() + ".");
	}

    }

    /**
         * Finds if a string is either null or blank.
         * 
         * @param string
         *                The string to be evaluated.
         * @return boolean
         * @author Luis M Crosby
         * @date 08MAR2008
         */
    public static boolean isBlankOrNull(String string) {
	boolean isTrue = true;
	if (string != null) {
	    isTrue = false;
	    if (string.trim().length() == 0) {
		isTrue = true;
	    }
	}
	return isTrue;
    }

    public static String removeBlanks(String string) {
	String newString = "";
	if (string != null)
	    newString = string.trim();
	return newString;
    }

}

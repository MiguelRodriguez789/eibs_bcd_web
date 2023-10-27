// SAX parser factory.
// No warranty; no copyright -- use this as you will.
// $Id: ParserFactory.java,v 1.2 2017/05/26 22:13:23 ccastillo Exp $

package datapro.org.xml.sax.helpers;

import java.lang.ClassNotFoundException;
import java.lang.IllegalAccessException;
import java.lang.InstantiationException;
import java.lang.SecurityException;
import java.lang.ClassCastException;

import datapro.org.xml.sax.Parser;


/**
 * Java-specific class for dynamically loading SAX parsers.
 *
 * <blockquote>
 * <em>This module, both source code and documentation, is in the
 * Public Domain, and comes with <strong>NO WARRANTY</strong>.</em>
 * </blockquote>
 *
 * <p><strong>Note:</strong> This class is designed to work with the now-deprecated
 * SAX1 {@link datapro.org.xml.sax.Parser Parser} class.  SAX2 applications should use
 * {@link datapro.org.xml.sax.helpers.XMLReaderFactory XMLReaderFactory} instead.</p>
 *
 * <p>ParserFactory is not part of the platform-independent definition
 * of SAX; it is an additional convenience class designed
 * specifically for Java XML application writers.  SAX applications
 * can use the static methods in this class to allocate a SAX parser
 * dynamically at run-time based either on the value of the
 * `datapro.org.xml.sax.parser' system property or on a string containing the class
 * name.</p>
 *
 * <p>Note that the application still requires an XML parser that
 * implements SAX1.</p>
 *
 * @deprecated This class works with the deprecated
 *             {@link datapro.org.xml.sax.Parser Parser}
 *             interface.
 * @since SAX 1.0
 * @author David Megginson, 
 *         <a href="mailto:sax@megginson.com">sax@megginson.com</a>
 * @version 2.0r2pre
 * @see datapro.org.xml.sax.Parser
 * @see java.lang.Class
 */
public class ParserFactory {
	
	
	/**
	 * Private null constructor.
	 */
	private ParserFactory ()
	{
	}
    
    
	/**
	 * Create a new SAX parser using the `datapro.org.xml.sax.parser' system property.
	 *
	 * <p>The named class must exist and must implement the
	 * {@link datapro.org.xml.sax.Parser Parser} interface.</p>
	 *
	 * @exception java.lang.NullPointerException There is no value
	 *            for the `datapro.org.xml.sax.parser' system property.
	 * @exception java.lang.ClassNotFoundException The SAX parser
	 *            class was not found (check your CLASSPATH).
	 * @exception IllegalAccessException The SAX parser class was
	 *            found, but you do not have permission to load
	 *            it.
	 * @exception InstantiationException The SAX parser class was
	 *            found but could not be instantiated.
	 * @exception java.lang.ClassCastException The SAX parser class
	 *            was found and instantiated, but does not implement
	 *            datapro.org.xml.sax.Parser.
	 * @see #makeParser(java.lang.String)
	 * @see datapro.org.xml.sax.Parser
	 */
	public static Parser makeParser ()
	throws ClassNotFoundException,
	IllegalAccessException, 
	InstantiationException,
	NullPointerException,
	ClassCastException
	{
	String className = System.getProperty("datapro.org.xml.sax.parser");
	if (className == null) {
	    throw new NullPointerException("No value for sax.parser property");
	} else {
	    return makeParser(className);
	}
	}
    
    
	/**
	 * Create a new SAX parser object using the class name provided.
	 *
	 * <p>The named class must exist and must implement the
	 * {@link datapro.org.xml.sax.Parser Parser} interface.</p>
	 *
	 * @param className A string containing the name of the
	 *                  SAX parser class.
	 * @exception java.lang.ClassNotFoundException The SAX parser
	 *            class was not found (check your CLASSPATH).
	 * @exception IllegalAccessException The SAX parser class was
	 *            found, but you do not have permission to load
	 *            it.
	 * @exception InstantiationException The SAX parser class was
	 *            found but could not be instantiated.
	 * @exception java.lang.ClassCastException The SAX parser class
	 *            was found and instantiated, but does not implement
	 *            datapro.org.xml.sax.Parser.
	 * @see #makeParser()
	 * @see datapro.org.xml.sax.Parser
	 */
	public static Parser makeParser (String className)
	throws ClassNotFoundException,
	IllegalAccessException, 
	InstantiationException,
	ClassCastException
	{
	return (Parser)(Class.forName(className).newInstance());
	}
    
}
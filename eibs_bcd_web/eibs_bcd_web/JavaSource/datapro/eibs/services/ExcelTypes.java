package datapro.eibs.services;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public interface ExcelTypes {

	public final static String BOOLEAN = "boolean"; //Binary-valued logic legal literals {true, false, 1, 0}
	public final static String STRING = "string"; //Character strings 
	public final static String NUMERIC = "numeric"; //Numeric
	public final static String BLANK = "blank"; //Field in Blank
	public final static String FORMULA = "formula"; //Field is a Formula
	public final static String ERROR = "error"; //Field has Error
	public final static String DATE = "date"; //Calendar date. Example, May the 31st, 1999 is: 1999-05-31.
	
	public final static int TEXT_FORMAT = 49; //Text Format.
}

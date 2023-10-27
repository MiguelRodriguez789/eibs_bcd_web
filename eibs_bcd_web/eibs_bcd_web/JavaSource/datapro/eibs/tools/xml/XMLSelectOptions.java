package datapro.eibs.tools.xml;

import org.w3c.dom.Element;

import com.datapro.exception.DocumentException;
import com.datapro.xml.DOMWrapper;

/**
 * @version 	1.0
 * @author
 */
public class XMLSelectOptions extends DOMWrapper {
	
	Element select;
	/**
	 * @param rootElement
	 * @throws DocumentException
	 */
	public XMLSelectOptions(String fieldName)
			throws DocumentException {
		super("selects");
		select = addElement("select", getDocument().getDocumentElement());
		select.setAttribute("name", fieldName);
	}
	
	/**
	 * @param rootElement
	 * @throws DocumentException
	 */
	public XMLSelectOptions()
			throws DocumentException {
		super("selects");
	}
	
	/**
	 * XMLSelectOptions
	 * @param fieldName
	 * @param onChange: When you need to add a Javascript function in this select in the onclick event
	 * @throws DocumentException
	 */
	public XMLSelectOptions(String fieldName, String onChange)
		throws DocumentException {
		super("selects");
		select = addElement("select", getDocument().getDocumentElement());
		select.setAttribute("name", fieldName);
		select.setAttribute("onchange", onChange);
	}
	
	public Element addOption(String value, String description) {
		
		Element option = addElement("option", select, description);
		option.setAttribute("value", value);
		return option;
	}
	
	public Element addOption(String value, String description, boolean selected) {
		
		Element option = addElement("option", select, description);
		option.setAttribute("value", value);
		option.setAttribute("selected", String.valueOf(selected));
		return option;
	}
	
	public Element addSelect(String fieldName) {
		select = addElement("select", getDocument().getDocumentElement());		
		select.setAttribute("name", fieldName);
		return select;
	}

	public Element addSelectAttribute(Element select, String event, String eventValue) {
		select.setAttribute(event, eventValue);
		return select;
	}
	
	public Element addOption(Element select, String value, String description) {		
		Element option = addElement("option", select, description);
		option.setAttribute("value", value);
		return option;
	}
	
	public Element addOption(Element select, String value, String description, boolean selected) {		
		Element option = addElement("option", select, description);
		option.setAttribute("value", value);
		option.setAttribute("selected", String.valueOf(selected));
		return option;
	}
	
	
	
	
	
}

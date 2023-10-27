package datapro.eibs.tools.xml;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.datapro.exception.DocumentException;
import com.datapro.generic.beanutil.BeanList;
import com.datapro.xml.DOMWrapper;
import com.datapro.xml.beanwrappers.elements.XMLElement;

/**
 * Class to hold an XML Document to map MessageRecords fields to XMLElement fields.
 */
	public class EibsFormsPdfOutput extends DOMWrapper {
	
	/**
	 * @param rootElementQualifiedName
	 * @throws DocumentException
	 */
	public EibsFormsPdfOutput(String rootElementQualifiedName)
		throws DocumentException {
		super(rootElementQualifiedName);
	}

	public void addXMLElement(XMLElement xmlElement){
		addTextNode(
			xmlElement.getName(), 
			xmlElement.getText(), 
			getDocument().getDocumentElement());
	}
	
	public void addGroupElement(String name){
		addElement(name,
			getDocument().getDocumentElement());
	}
	
	public void addXMLElements(BeanList bl){
		bl.initRow();
		while (bl.getNextRow()) {
			XMLElement xmlElement = (XMLElement) bl.getRecord();
			addTextNode(
				xmlElement.getName(), 
				xmlElement.getText(), 
				getDocument().getDocumentElement());
		}
	}
	
	public void addXMLElements(Element parent, BeanList bl){
		bl.initRow();
		while (bl.getNextRow()) {
			XMLElement xmlElement = (XMLElement) bl.getRecord();
			addTextNode(
				xmlElement.getName(), 
				xmlElement.getText(),
				parent);
		}
	}
	
	public Element addXMLGroupAndChildElements(Element parent, String groupName, BeanList bl){
		Element group = null;
		if (groupName != null){
			group = getDocument().createElement(groupName);
			parent.appendChild(group);
			if (bl != null){
				bl.initRow();
				while (bl.getNextRow()) {
					XMLElement xmlElement = (XMLElement) bl.getRecord();
					addTextNode(
						xmlElement.getName(), 
						xmlElement.getText(),
						group);
				}
			}
		}
		return group;
	}
	
	public Element addXMLGroupAndChildElements(String groupName, BeanList bl){
		return addXMLGroupAndChildElements(getDocument().getDocumentElement(), groupName, bl);
	}
	
	public Element getElements(XMLElement parent){
		Element parentDOM = getElementNode(parent.getName());
		return parentDOM;
	}
	
	public Element getElementNode(String elementId) {
		Element targetElement = null;

		NodeList elementCellsList = getDocument().getDocumentElement()
				.getChildNodes();
		for (int i = 0; i < elementCellsList.getLength(); i++) {
			Node childNode = elementCellsList.item(i);
			if (childNode.getNodeType() == Node.ELEMENT_NODE) {
				Element childElement = (Element) childNode;
				if (childElement.getAttribute("id").equals(elementId)) {
					targetElement = childElement;
					break;
				}
			}
		}
		return targetElement;
	}
		
}
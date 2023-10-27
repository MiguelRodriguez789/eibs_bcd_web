package datapro.eibs.generic;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

//  A Simple DOM Application
public class JODOM {
	
	private static final Map mappedFields = new HashMap();

	// Constructor
	public JODOM(String xmlFile) {
		//  Parse the Document		
		//  and traverse the DOM
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder parser = builderFactory.newDocumentBuilder();
			traverse (parser.parse(xmlFile));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public JODOM(File xmlFile) {
		//  Parse the Document		
		//  and traverse the DOM
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder parser = builderFactory.newDocumentBuilder();
			traverse (parser.parse(xmlFile));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public JODOM(InputStream xmlFile) {
		//  Parse the Document		
		//  and traverse the DOM
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder parser = builderFactory.newDocumentBuilder();
			traverse (parser.parse(xmlFile));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				xmlFile.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}


	public String getElementCode(String name) {
		return (String) mappedFields.get(name);
	}

	//  Traverse DOM Tree.  Print out Element Names
	private void traverse(Node node) {
		NodeList children = node.getChildNodes();
		if (children != null) {
			for (int i = 0; i < children.getLength(); i++){
				String pName = getAttributeValue(children.item(i), "PublicName");
				String code = getElementDataField(node, children.item(i));
				if (pName != null && !pName.equals("")) {
					mappedFields.put(pName, code);
				}
				traverse(children.item(i));
			}
		}
	}	
	
	private String getElementDataField(Node parent, Node node){
		if (node.getNodeName().equals("eIBSDataField")) {
			return getElementCode(
				getAttributeValue(parent, "eIBSCode"), node);
		}
		return null;
	}
	
	private String getElementCode(String prefix, Node node){
		if (prefix != null) {
			return prefix + "_" + getAttributeValue(node, "eIBSCode");			
		} else {
			return getAttributeValue(node, "eIBSCode");
		}
	}
	
	private String getAttributeValue(Node node, String name){
		String value = null;
		if (node != null 
			&& node.getAttributes() != null 
			&& node.getAttributes().getNamedItem(name) != null) {
			value = node.getAttributes().getNamedItem(name).getNodeValue();
		}
		return value == null ? "" : value;
	}
	
	public boolean isEmpty(){
		return mappedFields == null || mappedFields.isEmpty();
	}

}
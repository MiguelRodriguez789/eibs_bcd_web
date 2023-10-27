package datapro.eibs.tools.xml;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.datapro.exception.DocumentException;
import com.datapro.generic.beanutil.BeanList;
import com.datapro.generic.beanutil.BeanUtils;
import com.datapro.xml.DOMUtil;
import com.datapro.xml.beanwrappers.DataBeanWrapper;
import com.datapro.xml.beanwrappers.elements.XMLElement;
import com.datapro.xml.beanwrappers.fields.FieldAmount;
import com.datapro.xml.beanwrappers.fields.FieldDate;
import com.datapro.xml.beanwrappers.fields.FieldText;
import com.datapro.xml.beanwrappers.fields.IXMLField;

import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.tools.EIBSFormsParamsLoader;

/**
 * Class to hold an XML Document to map MessageRecords fields to XMLElement
 * fields.
 */
public class EibsFormsPdfInput extends DataBeanWrapper {

	private static final Logger log = Logger
			.getLogger(EibsFormsPdfInput.class.getName());
	EIBSFormsParamsLoader formats = new EIBSFormsParamsLoader();

	/**
	 * @param stream
	 * @throws DocumentException
	 */
	public EibsFormsPdfInput(InputStream stream) throws DocumentException {
		super(stream);
	}

	/**
	 * @param source
	 * @throws DocumentException
	 */
	public EibsFormsPdfInput(InputSource source) throws DocumentException {
		super(source);		
	}

	/**
	 * @param fFile
	 * @throws FileNotFoundException
	 * @throws DocumentException
	 */
	public EibsFormsPdfInput(File fFile) throws FileNotFoundException,
			DocumentException {
		super(fFile);
	}

	protected Object getFieldValue(Object obj, String fieldName){

		Object value = null;
		try {
			value = BeanUtils.getProperty(obj, fieldName);
		} catch (Exception e) {
		}
		return value == null ? "" : value;
	}
	
	protected Object getObjectFieldValue(Object obj, String fieldName)
			throws Exception {
		
		return  getFieldValue(obj, fieldName).toString();
	}

	protected XMLElement getElement(Node textNode, Object obj) {

		Element childElement = null;
		XMLElement xmlElement = null;
		String elementField = "";

		try {
			if (textNode.getNodeType() == Node.ELEMENT_NODE) {
				Element textElement = (Element) textNode;
				NodeList textElementChildList = textElement.getChildNodes();

				String type = textElement.getAttribute("type");
				
				//When the type comes from the XSD has a xsd:type format
				int index = 0;
				boolean isXSD = textElement.getTagName().endsWith("element");
				
				if (isXSD){
					index = type.indexOf(":");
					type = type.substring(index+1, type.length());
				}

				xmlElement = new XMLElement();
				xmlElement.setName(textElement.getTagName());
				xmlElement.setLanguage(getLanguage());
				
				if (type.equalsIgnoreCase("dateString")) {
					FieldDate fieldDate = new FieldDate();
					for (int i = 0; i < textElementChildList.getLength(); i++) {
						Node childNode = textElementChildList.item(i);
						String temp = "";
						if (childNode.getNodeType() == Node.ELEMENT_NODE) {
							childElement = (Element) childNode;
							if (childElement.getTagName().equals("alias")) {
								String alias = getTextNode(DOMUtil
										.getNodeChildElement(childElement,
												getLanguage(), 0));
								if (!alias.equals("")) xmlElement.setName(alias);
							} else if (childElement.getTagName().equals("if")) {
								if (opElementProcess(childNode, obj).equals("false")) {
									do {
										i++;
										try {
											childNode = textElementChildList.item(i);
											if (childNode.getNodeType() == Node.ELEMENT_NODE)
												childElement = (Element) childNode;
										} catch (Exception e) {
										}
									} while (!childElement.getTagName().equals("endif"));
								}
							} else if (childElement.getTagName().equals("format")) {
								fieldDate.setMask(getTextNode(childElement));
							} else if (childElement.getTagName().equals("field")) {
								StringTokenizer indexesString = 
									new StringTokenizer(textElement.getAttribute("indexes"), ",");
								int[] indexes = new int[3];
								for (int j = 0; j < indexes.length; j++) {
									String element = (String) indexesString.nextElement();
									indexes[j] = Integer.parseInt(element);
								}
								try {
									elementField = getTextNode(childElement);
									temp = getObjectFieldValue(obj, elementField).toString();
									fieldDate.setDate(
											temp.substring(0,indexes[0]), 
											temp.substring(indexes[0],indexes[1]), 
											temp.substring(indexes[1],indexes[2]),
											textElement.getAttribute("dateFormat"));
								} catch (Exception e) {
									log.finer("Error getting field : "
											+ elementField);
								}
							}
						}
					}
					xmlElement.addValue(fieldDate);
					
				} else if (type.equalsIgnoreCase("date")) {
					if (isXSD){
						FieldDate fieldDate = new FieldDate();
						String elementName = textElement.getAttribute("name");
						try {
							fieldDate = getDateFieldFromBean(obj,elementName, getFormatFromSchema(textElementChildList));
							if (fieldDate == null || fieldDate.getDate() == null){
								xmlElement.addValue("");
							} else {
								xmlElement.addValue(fieldDate);
							}
						} catch (Exception e) {
							log.finer("Error getting field : " + elementName);
							xmlElement.addValue("");
						}
					} else {
						FieldDate fieldDate = new FieldDate();
						String d1 = "";
						String d2 = "";
						String d3 = "";
						for (int i = 0; i < textElementChildList.getLength(); i++) {
							Node childNode = textElementChildList.item(i);
							String temp = "";
							if (childNode.getNodeType() == Node.ELEMENT_NODE) {
								childElement = (Element) childNode;
								if (childElement.getTagName().equals("alias")) {
									String alias = getTextNode(DOMUtil
											.getNodeChildElement(childElement,
													getLanguage(), 0));
									if (!alias.equals(""))
										xmlElement.setName(alias);
								} else if (childElement.getTagName().equals("if")) {
									if (opElementProcess(childNode, obj).equals("false")) {
										do {
											i++;
											try {
												childNode = textElementChildList.item(i);
												if (childNode.getNodeType() == Node.ELEMENT_NODE)
													childElement = (Element) childNode;
											} catch (Exception e) {
											}
										} while (!childElement.getTagName().equals(
												"endif"));
									}
								} else if (childElement.getTagName().equals("format")) {
									fieldDate.setMask(getTextNode(childElement));
								} else if (childElement.getTagName().equals("field")) {
									try {
										elementField = getTextNode(childElement);
										temp = getObjectFieldValue(obj,
												elementField).toString();
									} catch (Exception e) {
										log.finer("Error getting field : "
												+ elementField);
									}
								}
								if (!d1.equals("") && !d2.equals("")
										&& d3.equals(""))
									d3 = temp;
								if (!d1.equals("") && d2.equals(""))
									d2 = temp;
								if (d1.equals(""))
									d1 = temp;
							}
						}
						fieldDate.setDate(d1, d2, d3);
						xmlElement.addValue(fieldDate);
					}
				} else if (type.equalsIgnoreCase("dateTime")) {
					if (isXSD){
						FieldText fieldText = new FieldText();
						try {
							String elementName = textElement.getAttribute("name");
							elementField = getTextNode(textElement);
							String value = fieldText.getValue()+ getObjectFieldValue(obj, elementName);
							fieldText.setValue(Util.formatDate(value));
						} catch (Exception e) {
							log.finer("Error getting field : " + elementField);
						}	
						xmlElement.addValue(fieldText);
					}
				} else if (type.equalsIgnoreCase("amount")) {
					FieldAmount fieldAmount = new FieldAmount();
					for (int i = 0; i < textElementChildList.getLength(); i++) {
						Node childNode = textElementChildList.item(i);
						if (childNode.getNodeType() == Node.ELEMENT_NODE) {
							childElement = (Element) childNode;
							if (childElement.getTagName().equals("alias")) {
								String alias = getTextNode(DOMUtil
										.getNodeChildElement(childElement,
												getLanguage(), 0));
								if (!alias.equals(""))
									xmlElement.setName(alias);
							} else if (childElement.getTagName().equals("if")) {
								if (opElementProcess(childNode, obj).equals(
										"false")) {
									do {
										i++;
										try {
											childNode = textElementChildList.item(i);
											if (childNode.getNodeType() == Node.ELEMENT_NODE)
												childElement = (Element) childNode;
										} catch (Exception e) {
										}
									} while (!childElement.getTagName().equals(
											"endif"));
								}
							} else if (childElement.getTagName().equals("symbol")) {
								fieldAmount.setSymbol(getTextNode(childElement));
							} else if (childElement.getTagName().equals("length")) {
								xmlElement.setLength(Integer.parseInt(getTextNode(childElement)));
							} else if (childElement.getTagName().equals("field")) {
								try {
									elementField = getTextNode(childElement);
									fieldAmount.setAmount(getObjectFieldValue(
											obj, elementField).toString());
								} catch (Exception e) {
									log.finer("Error getting field : "
											+ elementField);
								}
							}
						}
					}
					xmlElement.addValue(fieldAmount);
				} else if (type.equalsIgnoreCase("decimal") && isXSD){
					FieldAmount fieldAmount = new FieldAmount();
					String elementName = textElement.getAttribute("name");
					try {
						elementField = getTextNode(textElement);
						fieldAmount.setAmount(getObjectFieldValue(
								obj, elementName).toString());
					} catch (Exception e) {
						log.finer("Error getting field : " + elementName);
					}	
					xmlElement.addValue(fieldAmount);
				} else if (type.equals("string") && isXSD){
					FieldText fieldText = new FieldText();
					String elementName = textElement.getAttribute("name");
					try {
						elementField = getTextNode(textElement);
						fieldText.setValue(fieldText.getValue()
								+ getObjectFieldValue(obj, elementName));
					} catch (Exception e) {
						log.finer("Error getting field : " + elementName);
					}	
					xmlElement.addValue(fieldText);
				} else {
					FieldText fieldText = new FieldText();
					for (int i = 0; i < textElementChildList.getLength(); i++) {
						Node childNode = textElementChildList.item(i);
						if (childNode.getNodeType() == Node.ELEMENT_NODE) {
							childElement = (Element) childNode;
							if (childElement.getTagName().equals("alias")) {
								String alias = 
									getTextNode(
											DOMUtil.getNodeChildElement(
												childElement,
												getLanguage(), 0));
								if (!alias.equals("")) xmlElement.setName(alias);
							} else if (childElement.getTagName().equals("if")) {
								if (opElementProcess(childNode, obj).equals("false")) {
									do {
										i++;
										try {
											childNode = textElementChildList.item(i);
											if (childNode.getNodeType() == Node.ELEMENT_NODE)
												childElement = (Element) childNode;
										} catch (Exception e) {
										}
									} while (!childElement.getTagName().equals("endif"));
								}
							} else if (childElement.getTagName().equals("length")) {
								xmlElement.setLength(Integer.parseInt(getTextNode(childElement)));
							} else if (childElement.getTagName().equals("offset")) {
								xmlElement.setOffset(Integer.parseInt(getTextNode(childElement)));
							} else if (childElement.getTagName().equals("field")) {
								try {
									elementField = getTextNode(childElement);
									fieldText.setValue(fieldText.getValue()
											+ getObjectFieldValue(obj, elementField));
								} catch (Exception e) {
									log.finer("Error getting field : " + elementField);
								}
							} 
						}
					}
					xmlElement.addValue(fieldText);
				}

				NamedNodeMap nodeAttributes = textElement.getAttributes();
				for (int i = 0; i < nodeAttributes.getLength(); i++) {
					Node attributeNode = nodeAttributes.item(i);
					if (attributeNode.getNodeType() == Node.ATTRIBUTE_NODE) {
						textElement.getAttribute(attributeNode.getNodeName());
						if (!attributeNode.getNodeName().equals("nillable")){
							setElement(xmlElement, attributeNode.getNodeName(),
									attributeNode.getNodeValue());
						}
					}
				}

			}
		} catch (Exception e) {
			log.log(Level.SEVERE, "Error Mapping XML file", e);
			throw new RuntimeException("Error Mapping XML file");
		}
		return xmlElement;
	}
	
	private Object getValue(Object value) {
		if (value != null && value instanceof List) {
			for (Iterator iter = ((List) value).iterator(); iter.hasNext();) {
				Object element = iter.next();
				if (element instanceof FieldAmount) {
					return element;
				} else {
					return element;
				}			
			}
		} else if (value instanceof IXMLField) {
			return value;
		}
		return value;
	}
	
	public void addElement(BeanList dataList, MessageRecord msg, Node cellNode)
		throws IOException {
		XMLElement detail = getElement(cellNode, msg);
		if (detail != null){
			dataList.addRow(detail);
			if (detail.getType().endsWith("decimal")) {
				FieldAmount value = (FieldAmount) getValue(detail.getValue());
				XMLElement xmlElement = new XMLElement();
				xmlElement.setName(detail.getName()+"Letters");
				xmlElement.setLanguage(getLanguage());
				FieldText fieldText = new FieldText();
				fieldText.setValue(Util.amountInWords(value.getAmount(), 
						getLanguage()));
				xmlElement.addValue(fieldText);
				dataList.addRow(xmlElement);
			}
		}
	}
	
	public void addElements(BeanList dataList, MessageRecord msg, Element element, String tagName)
			throws IOException {

		NodeList elementCellsList = element.getElementsByTagNameNS("*", tagName);
		if (elementCellsList != null) {
			for (int i = 0; i < elementCellsList.getLength(); i++) {
				Node cellNode = elementCellsList.item(i);
				if (cellNode.getNodeType() == Node.ELEMENT_NODE) {
					addElement(dataList, msg, cellNode);
				}
			}
		}
	}
	
	public BeanList getElementList(MessageRecord msg) throws IOException {

		BeanList dataList = new BeanList();
		Element element = null;
		if (getElementNode(msg.getFormatName()) == null){
			element = getElementNodeByName(formats.getFormatName(msg.getFormatName()));
		} else {
			element = getElementNode(msg.getFormatName());
		}
		NodeList elementCellsList = element.getChildNodes();
		if (elementCellsList != null) {
			for (int i = 0; i < elementCellsList.getLength(); i++) {
				Node cellNode = elementCellsList.item(i);
				addElement(dataList, msg, cellNode);
			}
		}
		return dataList;
	}
	
	public BeanList getXSDElementList(MessageRecord msg) throws IOException {

		BeanList dataList = new BeanList();
		Element element = null;
		if (getElementNode(msg.getFormatName()) == null){
			element = getElementNodeByName(formats.getType(msg.getFormatName()));
		} else {
			element = getElementNode(msg.getFormatName());
		}
		if (element != null){
			NodeList elementCellsList = element.getChildNodes();
			if (elementCellsList != null) {
				for (int i = 0; i < elementCellsList.getLength(); i++) {
					Node cellNode = elementCellsList.item(i);
					if (cellNode.getNodeType() == Node.ELEMENT_NODE) {
						Element textElement = (Element) cellNode;
						if (textElement.getNodeName().endsWith(":complexType")){
							NodeList list = textElement.getElementsByTagNameNS("*", "sequence");
							Element cellNode2 = (Element)list.item(0);
							addElements(dataList, msg, cellNode2, "element");
						} else if (textElement.getNodeName().endsWith(":sequence")){
							addElements(dataList, msg, textElement, "element");
						} else if (!textElement.getNodeName().endsWith(":attribute")){
							addElement(dataList, msg, cellNode);
						}
					}
				}
			}
		}
		return dataList;
	}

	public BeanList getElementList(MessageRecord msg, String tagName)
			throws IOException {

		BeanList dataList = new BeanList();

		NodeList elementCellsList = getElementNode(tagName, 0).getChildNodes();
		if (elementCellsList != null) {
			for (int i = 0; i < elementCellsList.getLength(); i++) {
				Node cellNode = elementCellsList.item(i);
				addElement(dataList, msg, cellNode);
			}
		}
		return dataList;
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
	
	public Element getElementNodeByName(String elementId) {
		Element targetElement = null;

		NodeList elementCellsList = getDocument().getDocumentElement().getChildNodes();
		for (int i = 0; i < elementCellsList.getLength(); i++) {
			Node childNode = elementCellsList.item(i);
			if (childNode.getNodeType() == Node.ELEMENT_NODE) {
				Element childElement = (Element) childNode;
				if (childElement.getAttribute("name").equals(elementId)) {
					targetElement = childElement;
					break;
				}
			}
		}
		return targetElement;
	}
	
	public XMLElement initGroupElement(String formatName){
		XMLElement targetElement = new XMLElement();
		targetElement.setName(formats.getFormatName(formatName));
		return targetElement;
	}

	public String getFormatFromSchema(NodeList textElementChildList){
		String format = "";
		for (int i = 0; i < textElementChildList.getLength(); i++) {
			Node childNode = textElementChildList.item(i);
			if (childNode.getNodeType() == Node.ELEMENT_NODE) {
				Element childElement = (Element) childNode;
				if (childElement.getTagName().endsWith("annotation")) {
					NodeList annotationList = childElement.getChildNodes();
					for (int j = 0; j < annotationList.getLength(); j++) {
						Node annotationNode = annotationList.item(i);
						if (childNode.getNodeType() == Node.ELEMENT_NODE) {
							Element annotationElement = (Element) annotationNode;
							if (annotationElement.getTagName().endsWith("appinfo")) {
								format = getTextNode(annotationElement);
								break;
							}
						}
					}
				} 
			}
		}
		return format;
	}
	
	
	private FieldDate getDateFieldFromBean(Object dataRecord, String fieldName, String schemaFormat){
		FieldDate fieldDate = new FieldDate();
		try {
			if (fieldName.indexOf("Year") > 0
					|| fieldName.indexOf("Month") > 0
					|| fieldName.indexOf("Day") > 0){
				String dataValue = getObjectFieldValue(dataRecord, fieldName).toString();
				//Default Date format is MMDDYY
				int size = dataValue.length() > 6 ? 8 : 6;
				String date = Util.addLeftChar('0', size, dataValue);
				String month = date.substring(0, 2);
				String day = date.substring(2, 4);
				String year = date.substring(4, 4 + (size > 6 ? 4 : 2));
				year = size > 6 ? year : ((Integer.parseInt(year) > 50 ? "19" : "20")+year);
				fieldDate.setDate(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
				fieldDate.setMask(schemaFormat);
				
			} else if (fieldName.indexOf("MMDDYY") > 0
						|| fieldName.indexOf("DDMMYY") > 0
						|| fieldName.indexOf("YYMMDD") > 0){
					String dataValue = getObjectFieldValue(dataRecord, fieldName).toString();
					int size = dataValue.length() > 6 ? 8 : 6;
					int yearPos = fieldName.indexOf("YY");
					int monthPos = fieldName.indexOf("MM");
					int dayPos = fieldName.indexOf("DD");
					String date = Util.addLeftChar('0', size, dataValue);
					int pos = date.length() - (size - ((yearPos/monthPos*2) + (yearPos/monthPos*2)));
					String year = date.substring(pos, pos + (size > 6 ? 4 : 2));
					year = size > 6 ? year : ((Integer.parseInt(year) > 50 ? "19" : "20")+year);
					pos = date.length() - (size - ((monthPos/yearPos*2) + (monthPos/dayPos*2)));
					String month = date.substring(pos, pos + 2);
					pos = date.length() - (size - ((dayPos/yearPos*2) + (dayPos/monthPos*2)));
					String day = date.substring(pos, pos + 2);
					fieldDate.setDate(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
					fieldDate.setMask(schemaFormat);
				
			} else if (fieldName.indexOf("Date") > 0
				|| fieldName.indexOf("date") == 0){
				
				int indexDate = fieldName.lastIndexOf("Date");
				if (indexDate != -1){
					String year = getObjectFieldValue(dataRecord, fieldName.substring(0, indexDate)+"Year").toString();
					String month = getObjectFieldValue(dataRecord, fieldName.substring(0, indexDate)+"Month").toString();
					String day = getObjectFieldValue(dataRecord, fieldName.substring(0, indexDate)+"Day").toString();
					if (!year.equals("0") && !month.equals("0") && !day.equals("0")){
						year = year.length() > 2 ? year: ((Integer.parseInt(year) > 50 ? "19" : "20")+year);
						fieldDate.setDate(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
						fieldDate.setMask(schemaFormat);					
					}
				}			

			} else {
				fieldDate = null;
			}
	
		} catch (Exception e) {
			log.info("FORM Date Format Error on : " + fieldName);
			fieldDate = null;
		}
		
		return fieldDate;
	}


}
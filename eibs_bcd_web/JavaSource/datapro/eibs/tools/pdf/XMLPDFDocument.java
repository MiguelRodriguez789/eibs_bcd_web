package datapro.eibs.tools.pdf;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URI;
import java.net.URISyntaxException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import com.datapro.generic.beanutil.BeanUtils;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.ColumnText;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfLayer;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfPageEventHelper;
import com.lowagie.text.pdf.PdfWriter;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.LocateMe;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.DecimalField;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

/**
 * Class to hold the Document to be print in a PDF format from an XML document.
 */
	public class XMLPDFDocument {
		
		private static final float BLACK 	= 0.0f;
		private static final float GRAY 	= 0.9f;
		private static final float WHITE 	= 1.0f;
		
		private static LocateMe locateMe = new LocateMe();
		private static String sClassesRoot = "";
		private String dateFormat = "MDY";
		private String language;
		
		private org.w3c.dom.Document myXMLDoc = null;  
		private Document myPDFDoc;
		private PdfWriter pdfWriter;
		private PdfContentByte cb;

		private Rectangle pageSize;
		private Font bf = null;
		
		public void setPdfWriter(PdfWriter pdfWriter){
			this.pdfWriter=pdfWriter;
		}
		
		public PdfWriter getPdfWriter(){
			return this.pdfWriter;
		}

		public XMLPDFDocument() throws IOException, DocumentException{
			sClassesRoot = locateMe.getClassesRoot();
			
			myPDFDoc = new Document(PageSize.A4, 20, 20, 20, 20);
			myPDFDoc.newPage();
			pageSize = myPDFDoc.getPageSize();
			bf = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL);
		}

		public XMLPDFDocument(String ClassesRoot) throws IOException, DocumentException {
			if (ClassesRoot.lastIndexOf('/') != (ClassesRoot.length() - 1)) ClassesRoot = ClassesRoot + "/"; 	
			sClassesRoot = ClassesRoot;
			
			myPDFDoc = new Document(PageSize.A4, 20, 20, 20, 20);
			pageSize = myPDFDoc.getPageSize();
			bf = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL);
		}
		
		public void readXMLDoc(String filePath, String fileName) {
				if (filePath.equals("")) {
					System.out.println("XMLPDFDocument no file Path");
				} 	
				if (!sClassesRoot.equals("")) 
					filePath = sClassesRoot + filePath;

				URI outputURI;
				try {
					outputURI = new URI("file://"+ filePath);
					parse(new File(outputURI));
				} catch (URISyntaxException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
			
		public void readXMLDoc(String fileName) {
				if (fileName.equals("")) {
					System.out.println("XMLPDFDocument no file name");
				} 
				URI outputURI;
				try {
					outputURI = new URI("file://"+ sClassesRoot + fileName);
					parse(new File(outputURI));
				} catch (URISyntaxException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		public void readXMLDoc(File file) {
			parse(file);
		}
		
		private void parse(File file){
			try {
				System.out.println("FilePath - " + file.getCanonicalPath());
				DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
				myXMLDoc = docBuilder.parse(file);

				// normalize text representation
				myXMLDoc.getDocumentElement().normalize();

			} catch (SAXParseException err) {
				System.out.println(
						"** Parsing error"
						+ ", line "
						+ err.getLineNumber()
						+ ", uri "
						+ err.getSystemId());
				System.out.println(" " + err.getMessage());

			} catch (SAXException e) {
				Exception x = e.getException();
				((x == null) ? e : x).printStackTrace();

			} catch (Throwable t) {
				t.printStackTrace();
			}
		} //end of function

		public Document getPDFDoc(){
			return myPDFDoc;			
		}
		
		public PdfWriter createWriter(OutputStream out) throws IOException {
			try {
				pdfWriter =  PdfWriter.getInstance(myPDFDoc, out);
				return pdfWriter;
			} catch (Exception e) {
				throw new IOException(e);
			}
		}
		
		public void close(){
			if (myPDFDoc != null){
				myPDFDoc.close();
			}
			if(pdfWriter != null){
				pdfWriter.close();
			}			
			cb = null;
		}
		
		private boolean ifElementProcess(
			org.w3c.dom.Node ifNode, 
			ESS0030DSMessage user, 
			MessageRecord msg) {

			String param1Text = "";
			String param2Text = "";	
			String operandText = "";	 

			org.w3c.dom.Node param1 = ((org.w3c.dom.Element)ifNode).getElementsByTagName("param1").item(0);
			if (getTextNode((org.w3c.dom.Element)param1).equals("field")) {
				org.w3c.dom.Node field1 = ((org.w3c.dom.Element)ifNode).getElementsByTagName("text").item(0);
				param1Text = readXMLElementText(field1, user, msg).getText();
			} else {
				param1Text = getTextNode((org.w3c.dom.Element)param1);
			}
		
			org.w3c.dom.Node operand = ((org.w3c.dom.Element)ifNode).getElementsByTagName("operand").item(0);
			operandText = getTextNode((org.w3c.dom.Element)operand);
		
			org.w3c.dom.Node param2 = ((org.w3c.dom.Element)ifNode).getElementsByTagName("param2").item(0);
			if (getTextNode((org.w3c.dom.Element)param2).equals("field")) {
				org.w3c.dom.Node field2 = ((org.w3c.dom.Element)ifNode).getElementsByTagName("text").item(1);
				param2Text = readXMLElementText(field2, user, msg).getText();
			} else {
				param2Text = getTextNode((org.w3c.dom.Element)param2);
			}
		
			if (operandText.equals("==")){
				if (param1Text!=null && param2Text!=null && param1Text.trim().equals(param2Text.trim())) return true;
			} else if (operandText.equals("!=")){
				if (!param1Text.equals(param2Text)) return true;			
			} else if (operandText.equals(">")){
				if (Util.parseCCYtoDouble(param1Text) > Util.parseCCYtoDouble(param2Text)) return true;
			} else if (operandText.equals(">=")){
				if (Util.parseCCYtoDouble(param1Text) >= Util.parseCCYtoDouble(param2Text)) return true;
			} else if (operandText.equals("<")){
				if (Util.parseCCYtoDouble(param1Text) < Util.parseCCYtoDouble(param2Text)) return true;
			} else if (operandText.equals("<=")){
				if (Util.parseCCYtoDouble(param1Text) <= Util.parseCCYtoDouble(param2Text)) return true;
			}
			return false;	
		}
		
		private String opElementProcess(
			org.w3c.dom.Node opNode,
			ESS0030DSMessage user, 
			Object msg){

			org.w3c.dom.Element childElement = null;

			String operand1Text = "";
			String operand2Text = "";	
			String operatorText = "";

			if (opNode.getNodeType() == Node.ELEMENT_NODE) {
				org.w3c.dom.Element operationElement = (org.w3c.dom.Element) opNode;
				org.w3c.dom.NodeList operationElementChildList = operationElement.getChildNodes();
				for (int i = 0; i < operationElementChildList.getLength(); i++) {
					org.w3c.dom.Node childNode = operationElementChildList.item(i);
					String temp = "";
					if (childNode.getNodeType() == Node.ELEMENT_NODE){
						childElement = (org.w3c.dom.Element) childNode;
						if (childElement.getTagName().equals("operand")){
							operand1Text = readXMLElementText(childElement, user, msg).getValue();
							do {
								i++;
								try {
									childNode = operationElementChildList.item(i);
									if (childNode.getNodeType() == Node.ELEMENT_NODE)
										childElement = (org.w3c.dom.Element) childNode;
								} catch (Exception e){
								}
							} while (!childElement.getTagName().equals("operator")) ;
							operatorText = getTextNode(childElement);
							if (operationElementChildList.getLength() > i){
								do {
									i++;
									try {
										childNode = operationElementChildList.item(i);
										if (childNode.getNodeType() == Node.ELEMENT_NODE)
											childElement = (org.w3c.dom.Element) childNode;
									} catch (Exception e){
									}
								} while (!childElement.getTagName().equals("operand")) ;
								operand2Text = readXMLElementText(childElement, user, msg).getValue();
							}
						}
						if (operatorText.equals("==")){
							if (operand1Text.trim().equals(operand2Text.trim())) operand2Text = "true"; else operand2Text = "false";
						} else if (operatorText.equals("!=")){
							if (!operand1Text.trim().equals(operand2Text.trim())) operand2Text = "true"; else operand2Text = "false";			
						} else if (operatorText.equals(">") || operatorText.toUpperCase().equals("M")){
							if (Util.parseCCYtoDouble(operand1Text) > Util.parseCCYtoDouble(operand2Text)) operand2Text = "true"; else operand2Text = "false";
						} else if (operatorText.equals(">=")){
							if (Util.parseCCYtoDouble(operand1Text) >= Util.parseCCYtoDouble(operand2Text)) operand2Text = "true"; else operand2Text = "false";
						} else if (operatorText.equals("<") || operatorText.toUpperCase().equals("L")){
							if (Util.parseCCYtoDouble(operand1Text) < Util.parseCCYtoDouble(operand2Text)) operand2Text = "true"; else operand2Text = "false";
						} else if (operatorText.equals("<=")){
							if (Util.parseCCYtoDouble(operand1Text) <= Util.parseCCYtoDouble(operand2Text)) operand2Text = "true"; else operand2Text = "false";
						}
						if (!operand1Text.equals("") && !operand2Text.equals("")) {
							if (operatorText.equals("+")){
								operand2Text = Util.formatCCY(
									Util.parseCCYtoDouble(operand1Text) +
									Util.parseCCYtoDouble(operand2Text));
							} else if (operatorText.equals("-")){
								operand2Text = Util.formatCCY(
									Util.parseCCYtoDouble(operand1Text) -
									Util.parseCCYtoDouble(operand2Text));
							} else if (operatorText.equals("*")){
								operand2Text = Util.formatCCY(
									Util.parseCCYtoDouble(operand1Text) *
									Util.parseCCYtoDouble(operand2Text));
							} else if (operatorText.equals("/")){
								operand2Text = Util.formatCCY(
									Util.parseCCYtoDouble(operand1Text) /
									Util.parseCCYtoDouble(operand2Text));
							} else if (operatorText.equals("%")){
								operand2Text = Util.formatCCY(
									Util.parseCCYtoDouble(operand1Text) %
									Util.parseCCYtoDouble(operand2Text));
							}
						} 
					}
				}
			}
			return operand2Text;	
		}		

		public org.w3c.dom.NodeList readXMLElementList(String elementTagName, String items) {

			org.w3c.dom.NodeList elementNodeList = myXMLDoc.getElementsByTagName(elementTagName);
			org.w3c.dom.Element elementNode = (org.w3c.dom.Element)elementNodeList.item(0);
			return elementNode.getElementsByTagName(items);
		} //end of function

		public String getTextNode(org.w3c.dom.Element ele) {
			String retText = "";
			try {
				if(ele.getChildNodes() != null) {
					NodeList textNameList = ele.getChildNodes();
					retText = textNameList.item(0).getNodeValue();
				}

			}
			catch(Exception e) {
				if (ele.getTagName().equals("literal")){ 
					retText = " ";
					return retText;
				}
				else return "";
			}
			return retText;
		}

		public XMLPDFElement readXMLElementText(
			org.w3c.dom.Node textNode, 
			ESS0030DSMessage user, 
			Object msg) {

			org.w3c.dom.Element childElement = null;
			XMLPDFElement elementText = new XMLPDFElement();
			String elementField = "";

			try {
				if (textNode != null && textNode.getNodeType() == Node.ELEMENT_NODE) {
					org.w3c.dom.Element textElement = (org.w3c.dom.Element) textNode;
					org.w3c.dom.NodeList textElementChildList = textElement.getChildNodes();
					elementText.setType(textElement.getAttribute("type"));
					if (elementText.getType().equals("date")){
							String d1 = "";
							String d2 = "";
							String d3 = "";
							for (int i = 0; i < textElementChildList.getLength(); i++) {
								org.w3c.dom.Node childNode = textElementChildList.item(i);
								String temp = "";
								if (childNode.getNodeType() == Node.ELEMENT_NODE){
									childElement = (org.w3c.dom.Element) childNode;
									if (childElement.getTagName().equals("if")){
										if (opElementProcess(childNode, user, msg).equals("false")){
											do {
												i++;
												try {
													childNode = textElementChildList.item(i);
													if (childNode.getNodeType() == Node.ELEMENT_NODE)
														childElement = (org.w3c.dom.Element) childNode;
												} catch (Exception e){
												}
											} while (!childElement.getTagName().equals("endif")) ;
										}
									} else if (childElement.getTagName().equals("format")){
										elementText.setDateFormat(getTextNode(childElement));										
									} else if (childElement.getTagName().equals("field")){
										temp = getFieldValue(msg, childElement).toString();
									} else if (childElement.getTagName().equals("format")){
										temp = getTextNode(childElement);
									}								
									if (!d1.equals("") && !d2.equals("") && d3.equals("") ) d3 = temp ;
									if (!d1.equals("") && d2.equals("")) d2 = temp;
									if (d1.equals("")) d1 = temp;
								}
							}
							elementText.setDate(d1,d2,d3);
					} else if (elementText.getType().equals("amount") || elementText.getType().equals("fullamount")){
							for (int i = 0; i < textElementChildList.getLength(); i++) {
								org.w3c.dom.Node childNode = textElementChildList.item(i);
								if (childNode.getNodeType() == Node.ELEMENT_NODE){
									childElement = (org.w3c.dom.Element) childNode;
									if (childElement.getTagName().equals("operation")){
										elementText.setText(elementText.getText() + opElementProcess(childNode, user, msg));
									} else if (childElement.getTagName().equals("if")){
										if (opElementProcess(childNode, user, msg).equals("false")){
											do {
												i++;
												try {
													childNode = textElementChildList.item(i);
													if (childNode.getNodeType() == Node.ELEMENT_NODE)
														childElement = (org.w3c.dom.Element) childNode;
												} catch (Exception e){
												}										
											} while (!childElement.getTagName().equals("endif")) ;
										}
									} else if (childElement.getTagName().equals("literal")){
										elementText.setText(elementText.getText() + getTextNode(childElement));										
									} else if (childElement.getTagName().equals("symbol")){
										elementText.setAmountSymbol(getTextNode(childElement));
									} else if (childElement.getTagName().equals("length")){
										elementText.setLength(Integer.parseInt(getTextNode(childElement)));										
									} else if (childElement.getTagName().equals("field")){
										elementText.setText(getFieldValue(msg, childElement).toString());
									}
								}
							}
					} else {
						for (int i = 0; i < textElementChildList.getLength(); i++) {
							org.w3c.dom.Node childNode = textElementChildList.item(i);
							if (childNode.getNodeType() == Node.ELEMENT_NODE){
								childElement = (org.w3c.dom.Element) childNode;
								if (childElement.getTagName().equals("operation")){
									elementText.setText(elementText.getText() + opElementProcess(childNode, user, msg));
								} else if (childElement.getTagName().equals("if")){
									if (opElementProcess(childNode, user, msg).equals("false")){
										do {
											i++;
											try {
												childNode = textElementChildList.item(i);
												if (childNode.getNodeType() == Node.ELEMENT_NODE)
													childElement = (org.w3c.dom.Element) childNode;
											} catch (Exception e){
											}									
										} while (!childElement.getTagName().equals("endif")) ;
									}
								} else if (childElement.getTagName().equals("literal")){
									elementText.setText(elementText.getText() + getTextNode(childElement));
								} else if (childElement.getTagName().equals("length")){
									elementText.setLength(Integer.parseInt(getTextNode(childElement)));										
								} else if (childElement.getTagName().equals("offset")){
									elementText.setOffset(Integer.parseInt(getTextNode(childElement)));									
								} else if (childElement.getTagName().equals("field")){
	 							    try {
										String fieldValue=getFieldValue(msg, childElement).toString();
										if (!"".equals(childElement.getAttribute("nochar"))){
									        char caracter = childElement.getAttribute("nochar").charAt(0);
											fieldValue=fieldValue.replace(caracter,' ');
										}
										elementText.setText(elementText.getText() +  fieldValue);
									} catch (Exception e){
										System.out.println("Error getting field : " + elementField);
									}
								}
							}
						}
					}
					elementText.setFont(bf.getFamilyname(), bf.getSize(), bf.getCalculatedStyle(), bf.getColor());
					NamedNodeMap nodeAttributes = textElement.getAttributes();
					for (int i = 0; i < nodeAttributes.getLength(); i++) {
						Node attributeNode = nodeAttributes.item(i);
						if (attributeNode.getNodeType() == Node.ATTRIBUTE_NODE) {
							if ("invoke".equals(attributeNode.getNodeName())){
								BeanUtils.invokeMethod(elementText, attributeNode.getNodeValue(), null);
							} else {
								BeanUtils.setProperty(elementText, attributeNode.getNodeName(), attributeNode.getNodeValue());								
							}
						}
					}
				}
			} catch (Exception e){
				e.printStackTrace();
				throw new RuntimeException("Error Mapping XML file");
			}
			return elementText;
	}
	
	public org.w3c.dom.Element getPDFPage (
		int numPage){
		
		org.w3c.dom.Element elementPage = null;
		org.w3c.dom.NodeList elementPageList = myXMLDoc.getElementsByTagName("page");
		elementPage = (org.w3c.dom.Element) elementPageList.item(numPage);
		
		return elementPage;
	}	

	public NodeList getElementNodeList(String childElementTagName) {
		return myXMLDoc.getElementsByTagName(childElementTagName);
	}
	
	protected org.w3c.dom.Element getHeader(){
		return (org.w3c.dom.Element) getElementNodeList("header").item(0);
	}
	
	protected org.w3c.dom.Element getFooter(){
		return (org.w3c.dom.Element) getElementNodeList("footer").item(0);
	}
	
	protected org.w3c.dom.Element getContent(int index){
		return (org.w3c.dom.Element) getElementNodeList("content").item(index);
	}
	
	public org.w3c.dom.NodeList getTablesNodes() {
		//org.w3c.dom.NodeList elementTableList = readXMLElementList("tables");
		org.w3c.dom.NodeList elementTableList = myXMLDoc.getElementsByTagName("table");
		return elementTableList;
	}

	public org.w3c.dom.Element getTable(int index){
		return (org.w3c.dom.Element) myXMLDoc.getElementsByTagName("table").item(index);
	}
	

	public void setPDFDocumentPage() {
		org.w3c.dom.Element elementPage = getPDFPage(0);
		String size = elementPage.getAttribute("size") == null ? "A4" : elementPage.getAttribute("size").toUpperCase();
		if (size.equals("CUSTOM")) { //Custom Size
			String left = elementPage.getAttribute("left") == null ? "0" : elementPage.getAttribute("left").toUpperCase();
			String right = elementPage.getAttribute("right") == null ? "0" : elementPage.getAttribute("right").toUpperCase();
			String top = elementPage.getAttribute("top") == null ? "0" : elementPage.getAttribute("top").toUpperCase();
			String bottom = elementPage.getAttribute("bottom") == null ? "0" : elementPage.getAttribute("bottom").toUpperCase();
			myPDFDoc.setPageSize(new Rectangle(Util.parseFloat(left), Util.parseFloat(top), Util.parseFloat(right), Util.parseFloat(bottom)));
		} else if (size.equals("LETTER")) { //8.5 x 11.0 in
			myPDFDoc.setPageSize(PageSize.LETTER);
		} else if (size.equals("HALFLETTER")) { //8.5 x 5.5 in
			myPDFDoc.setPageSize(PageSize.HALFLETTER);
		} else if (size.equals("LEGAL")) { //8.5 x 14 in
			myPDFDoc.setPageSize(PageSize.LEGAL);
		} else if (size.equals("LEDGER")) {
			myPDFDoc.setPageSize(PageSize.LEDGER); //11.0 x 17.0 in
		} else if (size.equals("A0")) {
			myPDFDoc.setPageSize(PageSize.A0); //46.8 x 33.1 in
		} else if (size.equals("A1")) {
			myPDFDoc.setPageSize(PageSize.A1); //33.1 x 23.4 in
		} else if (size.equals("A2")) {
			myPDFDoc.setPageSize(PageSize.A2); //23.4 x 16.5 in
		} else if (size.equals("A3")) {
			myPDFDoc.setPageSize(PageSize.A3); //16.5 x 11.7 in
		} else if (size.equals("A5")) {
			myPDFDoc.setPageSize(PageSize.A5); //8.3 x 5.8 in
		} else if (size.equals("A6")) {
			myPDFDoc.setPageSize(PageSize.A6); //5.8 x 4.1 in
		} else if (size.equals("A7")) {
			myPDFDoc.setPageSize(PageSize.A7); //4.1 x. 2.9 in
		} else if (size.equals("A8")) {
			myPDFDoc.setPageSize(PageSize.A8); //2.9 x 2.0 in
		} else if (size.equals("A9")) {
			myPDFDoc.setPageSize(PageSize.A9); //2.0 x 1.5 in
		} else if (size.equals("A10")) {
			myPDFDoc.setPageSize(PageSize.A10); //1.5 x 1.0 in
		} else if (size.equals("B0")) {
			myPDFDoc.setPageSize(PageSize.B0); //55.7 x 39.4 in
		} else if (size.equals("B1")) {
			myPDFDoc.setPageSize(PageSize.B1); //39.4 x 27.8 in
		} else if (size.equals("B2")) {
			myPDFDoc.setPageSize(PageSize.B2); //27.8 x 19.7 in
		} else if (size.equals("B3")) {
			myPDFDoc.setPageSize(PageSize.B3); //19.7 x 13.9 in
		} else if (size.equals("B4")) {
			myPDFDoc.setPageSize(PageSize.B4); //13.9 x 9.8 in
		} else if (size.equals("B5")) {
			myPDFDoc.setPageSize(PageSize.B5); //9.8 x 6.9 in
		} else if (size.equals("11X17")) {
			myPDFDoc.setPageSize(PageSize._11X17); //11.0 x 17.0 in
		} else if (size.equals("ARCH_A")) {
			myPDFDoc.setPageSize(PageSize.ARCH_A); //9.0 x 12.0 in
		} else if (size.equals("ARCH_B")) {
			myPDFDoc.setPageSize(PageSize.ARCH_B); //9.0 x 18.0 in
		} else if (size.equals("ARCH_C")) {
			myPDFDoc.setPageSize(PageSize.ARCH_C); //18.0 x 24.0 in
		} else if (size.equals("ARCH_D")) {
			myPDFDoc.setPageSize(PageSize.ARCH_D); //24.0 x 36.0 in
		} else if (size.equals("ARCH_E")) {
			myPDFDoc.setPageSize(PageSize.ARCH_E); //24.0 x 48.0 in
		} else if (size.equals("FLSA")) {
			myPDFDoc.setPageSize(PageSize.FLSA); //8.5 x 13.0 in
		} else if (size.equals("FLSE")) {
			myPDFDoc.setPageSize(PageSize.FLSE); //9.0 x 13.0 in
		} else if (size.equals("NOTE")) {
			myPDFDoc.setPageSize(PageSize.NOTE); //7.5 x 10.0 in
		} else {
			myPDFDoc.setPageSize(PageSize.A4); //11.7 x 8.3 in
		}
		String marginLeft = elementPage.getAttribute("marginLeft") == null ? "20" : elementPage.getAttribute("marginLeft").toUpperCase();
		float ml = Util.parseFloat(marginLeft);
		String marginRight = elementPage.getAttribute("marginRight") == null ? "20" : elementPage.getAttribute("marginRight").toUpperCase();
		float mr = Util.parseFloat(marginRight);
		String marginTop = elementPage.getAttribute("marginTop") == null ? "20" : elementPage.getAttribute("marginTop").toUpperCase();
		float mt = Util.parseFloat(marginTop);
		String marginBottom = elementPage.getAttribute("marginBottom") == null ? "20" : elementPage.getAttribute("marginBottom").toUpperCase();
		float mb = Util.parseFloat(marginBottom);
		myPDFDoc.setMargins(ml, mr, mt, mb);
		pageSize = myPDFDoc.getPageSize();
	}	

	public void setPDFDocumentHeader (){

		org.w3c.dom.NodeList elementTitleList = myXMLDoc.getElementsByTagName("title");
		org.w3c.dom.Element elementTitle = (org.w3c.dom.Element) elementTitleList.item(0);

		myPDFDoc.addAuthor("eIBS");
		myPDFDoc.addCreationDate();
		myPDFDoc.addProducer();
		myPDFDoc.addTitle(getTextNode(elementTitle));
		myPDFDoc.addKeywords("pdf, itext, Java, open source, http");

	}	
	
	private String getText(XMLElement myElement){
		String text = null;
		if (myElement.getType().equals("date")) 
			text = myElement.getCustomFormatDate(dateFormat, language);
		else if (myElement.getType().equals("amount"))
			text = myElement.getFullAmount();
		else 
			text = myElement.getText();
		return text;
	}

	/**
	 * @param obj
	 * @param fieldName
	 * @return The field value
	 */
	protected Object getFieldValue(Object obj, String fieldName){

		if (obj instanceof MessageRecord) {
			MessageRecord msg = (MessageRecord) obj;
			MessageField field = msg.getField(fieldName);
			if (field.getType() == MessageField.DECIMALFIELD) {
				return ((DecimalField)field).getBigDecimal();
			} else {
				return field.toString().trim();
			}
		} else {
			Object value = null;
			try {
				value = BeanUtils.getProperty(obj, fieldName);
			} catch (Exception e) {
			}
			return value == null ? "" : value;
		}
	}
	
	protected Object getFieldValue(Object obj, org.w3c.dom.Element childElement){
		XMLElement xmlElement = new XMLElement();
		NamedNodeMap nodeAttributes = childElement.getAttributes();
		for (int i = 0; i < nodeAttributes.getLength(); i++) {
			Node attributeNode = nodeAttributes.item(i);
			if (attributeNode.getNodeType() == Node.ATTRIBUTE_NODE) {
				BeanUtils.setProperty(xmlElement, attributeNode.getNodeName(), attributeNode.getNodeValue());
			}
		}
		xmlElement.setText(getFieldValue(obj, getTextNode(childElement)).toString());
		return getText(xmlElement);
	}	
	
	private Phrase newPhrase(XMLPDFElement myElement, String text){
		Phrase phrase = null;
		if (myElement.getFont() != null) {
			phrase = new Phrase(text, myElement.getFont());
		} else {
			phrase = new Phrase(text, bf);
		}
		return phrase;
	}
	
	/** Adds a Cell to the table row
	 * @param datatable
	 * @param cell
	 * @param detail
	 */
	private float addCellDetail(PdfPTable datatable, PdfPCell cell, XMLPDFElement detail) {
		if (detail != null) {
			try {
				if (detail.getType().equals("image")) {
					cell.setImage(Image.getInstance(locateMe.fileUrl(detail.getName())));
				} else {
					cell.setPhrase(newPhrase(detail, getText(detail)));
					cell.setHorizontalAlignment(detail.getAlign());
					cell.setColspan(detail.getColspan());
				}
				datatable.addCell(cell);
				return detail.getWidth();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;
	}	
	
	protected float addCell(String type, 
			PdfPTable datatable,
			PdfPCell cell, 
			org.w3c.dom.Node cellNode, 
			ESS0030DSMessage user, 
			Object msg){

		// table header
		XMLPDFElement cellElement = null;
		if (type.equals("header")) {
			// add header Cells
			cellElement = (XMLPDFElement) readXMLElementText(cellNode, user, msg);
		} else {
			cellElement = (XMLPDFElement) readXMLElementText(cellNode, user, msg);
		}
		org.w3c.dom.Element elemCell = (org.w3c.dom.Element) cellNode; 
		
		if (elemCell.getAttribute("grayfill") != null 
			&& !elemCell.getAttribute("grayfill").trim().equals("")) {
			cell.setGrayFill(Util.parseFloat(elemCell.getAttribute("grayfill")));			
		}
		return addCellDetail(datatable, cell, cellElement);
	}	
		

	private void addContent(XMLPDFElement myElement, Phrase text){
		if (myElement.getAlign() != -1) {
			ColumnText.showTextAligned(
				cb, 
				myElement.getAlign(), 
				text,
				pageSize.getWidth() / 2, myElement.getY(), 0);
		} else {
			ColumnText.showTextAligned(cb, 
					myElement.getAlign(), text, myElement.getX(), myElement.getY(), 0);
		}
	}
	
	private void addContent(XMLPDFElement myElement){
		addContent(myElement, newPhrase(myElement, getText(myElement)));
	}
	
	private void addHeaderFooter(PdfWriter writer, XMLPDFElement header, org.w3c.dom.NodeList contentList, 
		ESS0030DSMessage user, MessageRecord msg){
		if (contentList != null) {
			for (int i = 0; i < contentList.getLength(); i++) {
				org.w3c.dom.Node headerNode = contentList.item(i);
				if (headerNode.getNodeType() == Node.ELEMENT_NODE) {
					try {
						XMLPDFElement myElement = (XMLPDFElement) readXMLElementText(headerNode, user, msg);
						org.w3c.dom.Element headerElement = (org.w3c.dom.Element) headerNode;
						if (headerElement.getTagName().equals("table")) {
							addTable(headerElement, user, msg);
						} else {
							if (myElement.getType().equals("pageNumber")){
								Phrase phase = newPhrase(myElement,
										myElement.getText() + " " + writer.getPageNumber());
								addContent(myElement, phase);
							} else {
								addContent(myElement);
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}	
	
	public void setPDFHeader(PdfWriter writer, final ESS0030DSMessage user, final MessageRecord msg){

		setPDFcb(writer);

		XMLPDFElement xmlPdfElement = null;
		org.w3c.dom.NodeList contentList = null;
		org.w3c.dom.NodeList headerNodes = (org.w3c.dom.NodeList) getElementNodeList("header");
		if (headerNodes.getLength() > 0) {
			xmlPdfElement = (XMLPDFElement) readXMLElementText(
				headerNodes.item(0), user, msg);
			contentList = headerNodes.item(0).getChildNodes();
		}
		final XMLPDFElement headerElement = xmlPdfElement;
		final org.w3c.dom.NodeList headerFields = contentList;
		
		addHeaderFooter(writer, headerElement, headerFields, user, msg);
		
		xmlPdfElement = null;
		contentList = null;
		org.w3c.dom.NodeList footerNodes = (org.w3c.dom.NodeList) getElementNodeList("footer");
		if (footerNodes.getLength() > 0) {
			xmlPdfElement = (XMLPDFElement) readXMLElementText(
					footerNodes.item(0), user, msg);
			contentList = footerNodes.item(0).getChildNodes();
		}
		final XMLPDFElement footerElement = xmlPdfElement;
		final org.w3c.dom.NodeList footerFields = contentList;
		
		PdfPageEventHelper pageEvent = new PdfPageEventHelper() {
			private int totalPages = 0;
			public void onStartPage(PdfWriter writer, Document document) {
				totalPages++;
			}
			public void onEndPage(PdfWriter writer, Document document) {
				if (totalPages > 1) {
					addHeaderFooter(writer, headerElement, headerFields, user, msg);
					addHeaderFooter(writer, footerElement, footerFields, user, msg);
				}
			}
		};
		writer.setPageEvent(pageEvent);
	}	
	
	public void addDirectContent(PdfWriter writer, org.w3c.dom.NodeList contentList, ESS0030DSMessage user, Object msg) {
		language = (user.getE01LAN().equals("s")) ? "es" : "en";
		dateFormat = user.getE01DTF();
		
		cb.beginText();
		for (int a = 0; a < contentList.getLength(); a++) {
			XMLPDFElement layerElement = (XMLPDFElement) readXMLElementText(
					contentList.item(a), user, msg);
			if (layerElement.getFont() != null) {
				bf = layerElement.getFont();
			}

			//Initializing layer
			PdfLayer layer = new PdfLayer(layerElement.getName(), writer);
			if (!layerElement.getType().equals("")) {
				layer.setOnPanel(layerElement.getType().equalsIgnoreCase("printable"));
				layer.setPrint("Print", layer.isOnPanel());
			}
			//Beginning layer
			cb.beginLayer(layer);

			org.w3c.dom.NodeList fieldsList = ((org.w3c.dom.Element) 
					contentList.item(a)).getElementsByTagName("text");
			for (int i = 0; i < fieldsList.getLength(); i++) {
				XMLPDFElement myElement = (XMLPDFElement) readXMLElementText(
						fieldsList.item(i), user, msg);
				addContent(myElement);
			}
			cb.endLayer();
		}
		cb.endText();
	}
	
	private void setPDFcb(PdfWriter writer) {
		setPdfWriter(writer);
		if (!getPDFDoc().isOpen()) 
			getPDFDoc().open();
		cb = pdfWriter.getDirectContent();
	}
	
	public void setPDFcb(PdfWriter writer, ESS0030DSMessage user, Object msg) {
		setPDFcb(writer);
		org.w3c.dom.NodeList contentList = getElementNodeList("content");
		addDirectContent(writer, contentList, user, msg);
	}

	public void setPDFcb(
		PdfWriter docWriter, 
		JBObjList origObjTable,
		ESS0030DSMessage user, 
		Object msg){
		try {
			setPDFcb(docWriter, user, msg);
			
			org.w3c.dom.NodeList elementTableList = getTablesNodes();
			for (int i=0; i < elementTableList.getLength(); i++){
			  org.w3c.dom.Element elementTable = (org.w3c.dom.Element) elementTableList.item(i);
			  setPDFTable(1, elementTable, origObjTable, user, msg);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setPDFTable (
		int numPage,
		org.w3c.dom.Element elementTable,
		JBObjList origObjTable,
		ESS0030DSMessage user, 
		Object msg) 
		throws DocumentException {
		
		int iRow = 0;
		try {
			org.w3c.dom.NodeList rowElementList = elementTable.getElementsByTagName("row");
			org.w3c.dom.Element elementRow = (org.w3c.dom.Element) rowElementList.item(0);
			
			PdfPTable datatable = addTable(elementTable, elementRow, user);
			if ("header".equals(elementRow.getAttribute("type"))){
				addTableRow(datatable, elementRow, 0, user, msg);
				datatable.setHeaderRows(1);
				if (rowElementList.getLength() > 1) {
					iRow++;
					elementRow = (org.w3c.dom.Element) rowElementList.item(iRow);
				}
			}

			String rowType = elementRow != null ? elementRow.getAttribute("type") : null;
			if (origObjTable != null && "dynamic".equals(rowType)) {
				datatable.setComplete(false);
				origObjTable.initRow();
				while (origObjTable.getNextRow()) {
					if (origObjTable.getCurrentRow() == 1 
						|| (origObjTable.getCurrentRow() > 0 && origObjTable.getCurrentRow() % 100 == 0)) {
						writeTable(elementTable, datatable);
					}
					MessageRecord msgList = (MessageRecord) origObjTable.getRecord();
					addTableRow(datatable, elementRow, origObjTable.getCurrentRow(), user, msgList);
				}
				datatable.setComplete(true);
				writeTable(elementTable, datatable);
			} else if ("static".equals(elementRow.getAttribute("type"))){
				for (int r = iRow; r < rowElementList.getLength(); r++) {
					elementRow = (org.w3c.dom.Element) rowElementList.item(r);
					addTableRow(datatable, elementRow, r, user, msg);
				}
				writeTable(elementTable, datatable);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public PdfPTable addTable(org.w3c.dom.Element elementTable, org.w3c.dom.Element elementRow, 
		ESS0030DSMessage user, MessageRecord msg) throws DocumentException {
		//datatable.setComplete(true);
		try {
			org.w3c.dom.NodeList rowElementCellsList = elementRow.getElementsByTagName("cell");

			int numColumns = 0;
			try {
				numColumns = Integer.parseInt(elementTable.getAttribute("columns"));
			} catch (Exception e) {
				numColumns = rowElementCellsList.getLength();
			}
			float columnwidths[] = new float[numColumns];
			PdfPTable datatable = new PdfPTable(numColumns);
			// For every cell in the row (columns)
			for (int i = 0; i < rowElementCellsList.getLength(); i++) {
				XMLPDFElement cellElement = (XMLPDFElement) readXMLElementText(
					rowElementCellsList.item(i), user, msg);
				columnwidths[i] = cellElement.getWidth();
			}
			setColumnsWidth(elementTable, datatable, columnwidths);
			return datatable;

		} catch (Exception e) {
			e.printStackTrace();
			throw new DocumentException(e.getMessage());
		}
	}
	
	public PdfPTable addTable(org.w3c.dom.Element elementTable, ESS0030DSMessage user, MessageRecord msg)
		throws DocumentException {
		org.w3c.dom.NodeList rowElementList = elementTable.getElementsByTagName("row");
		org.w3c.dom.Element elementRow = (org.w3c.dom.Element) rowElementList.item(0);
		return addTable(elementTable, elementRow, user, msg);
	}
	
	/**
	 * Creates a new table with his header in case this one is defined in the elementRow Element 
	 * @param elementTable
	 * @param elementRow
	 * @param obj
	 * @return
	 * @throws DocumentException
	 */
	public PdfPTable addTable(org.w3c.dom.Element elementTable,
			org.w3c.dom.Element elementRow, ESS0030DSMessage user)
			throws DocumentException {
		return addTable(elementTable, elementRow, user, null);
	}

	public void addTableRow(PdfPTable datatable,
			org.w3c.dom.Element elementRow, long rowTotal, ESS0030DSMessage user, 
			Object msg)
			throws DocumentException {

		try {
			org.w3c.dom.NodeList rowElementCellsList = elementRow.getElementsByTagName("cell");
			String rowType = elementRow != null ? elementRow.getAttribute("type") : null;
			
			PdfPCell cell = datatable.getDefaultCell();
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setBorderWidth(Util.parseFloat(elementRow.getAttribute("border")));
			cell.setNoWrap(Boolean.valueOf(elementRow.getAttribute("nowrap")).booleanValue());
			float cellpadding = 3;
			float fixedHeight = 13;
			if("".equals(elementRow.getAttribute("height").trim())){
				cell.setFixedHeight(fixedHeight);
			} else {
				cell.setFixedHeight(Util.parseFloat(elementRow.getAttribute("height")));
			}
			if ("".equals(elementRow.getAttribute("cellpadding"))) {
				cell.setPadding(cellpadding);
			} else {
				cell.setPadding(Util.parseFloat(elementRow.getAttribute("cellpadding")));
			}

			// For every cell in the row (columns)			
			if ("blank".equals(rowType)) {
				for (int i = 0; i < datatable.getAbsoluteWidths().length; i++) {
					//PdfPCell blankCell = new PdfPCell(new Phrase(""));
					PdfPCell blankCell = new PdfPCell();
					blankCell.setPadding(3);
					blankCell.setBorderWidth(0);
					datatable.addCell(blankCell);
				}
			} else {
				for (int i = 0; i < rowElementCellsList.getLength(); i++) {
					if ("dynamic".equals(rowType) && rowTotal % 2 == 0){
						cell.setGrayFill(WHITE);
					} else if (elementRow.getAttribute("grayfill") != null 
						&& !elementRow.getAttribute("grayfill").trim().equals("")) {
						cell.setGrayFill(Util.parseFloat(elementRow.getAttribute("grayfill")));
					} else {
						cell.setGrayFill(WHITE);
					}
					addCell(rowType, datatable, cell, 
						rowElementCellsList.item(i), user, msg);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new DocumentException(e.getMessage());
		}
	}
	
	/**
	 * Adds a header row to the table in case the element row definition matches the row type 
	 * @param datatable the pdf table
	 * @param elementRow the element row
	 * @param user the user session bean
	 * @param msg the message record data
	 * @return true if the table header was added, false if not definition for the header was found
	 * @throws DocumentException
	 */
	public boolean addTableHeader(PdfPTable datatable,
		org.w3c.dom.Element elementRow, ESS0030DSMessage user, 
		MessageRecord msg)
		throws DocumentException {
		if ("header".equals(elementRow.getAttribute("type"))){
			addTableRow(datatable, elementRow, 0, user, msg);
			datatable.setHeaderRows(1);
			return true;
		}
		return false;
	}
	
	public void writeTable(org.w3c.dom.Element elementTable, PdfPTable datatable)
		throws com.lowagie.text.DocumentException {
		int xPos = Util.parseInt(elementTable.getAttribute("x"));
		int yPos = Util.parseInt(elementTable.getAttribute("y"));
		if (xPos == 0 && yPos == 0) {
			myPDFDoc.add(datatable);
		} else {
			datatable.writeSelectedRows(0, -1, xPos, yPos, cb);
		}
	
		/**
		 * public float writeSelectedRows(int rowStart, int rowEnd, float xPos,
		 * float yPos, PdfContentByte canvas); The parameter rowStart is the
		 * number of the row you want to start with, rowEnd is the last row you
		 * want to show (if you want to show all the rows, use -1). xPos and
		 * yPos are the coordinates of the table.
		 **/
	}
	
	public void endTable(PdfPTable datatable)
		throws com.lowagie.text.DocumentException {
		myPDFDoc.add(datatable);
	}
	
	private float setColumnsWidth(float columnWidths[], float tableWidth){
		float width = 0;
		int notEmptyWidths = 0;
	    for (int i = 0; i < columnWidths.length; i++) {
	    	if (columnWidths[i] > 0){
		    	width = width + columnWidths[i];
		    	notEmptyWidths++;
	    	}
	    }
	    if (tableWidth == 0) {
			tableWidth = width;
		}
	    if (tableWidth < width) {
			width = tableWidth;
		}
	    float remainingWidth = (tableWidth - width);
	    if (remainingWidth > 0) {
	    	remainingWidth = remainingWidth /(columnWidths.length-notEmptyWidths);			
		}
	    if (remainingWidth > 0) {
		    for (int i = 0; i < columnWidths.length; i++) {
		    	if (columnWidths[i] <= 0){
			    	columnWidths[i] = remainingWidth;
			    	width = width + columnWidths[i];
		    	}
		    }
		}
	    return width;
	}
	
	private float setColumnsWidth(org.w3c.dom.Element elementTable, PdfPTable datatable, float tablewidths[]){
		float tableWidth = 0;
		try {
			float calculatedWidth = 0;
			float widthPercentage = 0;
			String sWidth = elementTable.getAttribute("width");
			Rectangle pageSize = myPDFDoc.getPageSize();
			if (sWidth.endsWith("%")) { // percentage
				widthPercentage = Util.parseInt(sWidth.substring(0, sWidth.length() - 1));
				if (widthPercentage == 0) {
					datatable.setWidthPercentage(tablewidths, pageSize);
				} else {
					tableWidth = (pageSize.getRight() - pageSize.getLeft()) * widthPercentage / 100f;
					datatable.setWidthPercentage(widthPercentage);
				}
			} else {
				tableWidth = Util.parseInt(sWidth);
				//datatable.setLockedWidth(true);
				widthPercentage = (tableWidth * 100f) / (pageSize.getRight() - pageSize.getLeft());
			}
			calculatedWidth = setColumnsWidth(tablewidths, widthPercentage);
			if (calculatedWidth != 0) {
				datatable.setWidths(tablewidths);
				if (tableWidth == 0)
					tableWidth = calculatedWidth;
			}
			// The total width will be set if different to the one calculated
			datatable.setTotalWidth(tableWidth);
		} catch (Exception e) {
		}
		return tableWidth;
	}	
}
package datapro.eibs.tools;

/**
 * Reads the Message and generates the XML containing the FIELDS for the EIBS Forms.
 * Creation date: (03/05/12 2:57 PM)
 * @author: Catalina Sepulveda
 */

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.Map.Entry;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.datapro.eibs.constants.General;
import com.datapro.exception.ServiceLocatorException;
import com.datapro.generic.tool.Util;
import com.datapro.services.ServiceLocator;

import datapro.eibs.beans.DataFormsDDS;

public class EIBSFormsFieldGenerator extends EIBSFormsParamsLoader {
	
	boolean isDataSource = false;
	
	public EIBSFormsFieldGenerator() {
		super();		
	}
	
	public EIBSFormsFieldGenerator(String path) {
		super(new File(path));
	}
	
	
	protected Connection getConnection() throws ServiceLocatorException {
		Connection cnx = null;
		try {
			cnx = ServiceLocator.getInstance().getDBConn(General.DBID_CURRENT_YEAR);
		} catch (ServiceLocatorException e) {
			try {
				//When running outside the container we need to use the DriverManager Connection.
				cnx = ServiceLocator.getInstance().newJDBCCon(General.DBID_CURRENT_YEAR);
			} catch (ServiceLocatorException e1) {
				//we throw original exception
				throw e;
			}
		}
		return cnx;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		EIBSFormsFieldGenerator a;
		try {
			if (args != null && args.length > 0) {
				a = new EIBSFormsFieldGenerator(args[0]);
			} else {
				a = new EIBSFormsFieldGenerator();
			}
			a.generateXML(a.getEIBSLibrary(null));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	public String getEIBSLibrary(String[] libraries) throws SQLException {
		if (libraries == null) {
			libraries = getLibraries(null);
		}
		for (int l = 0; l < libraries.length; l++) {
			if (libraries[l].indexOf("EIBS") != -1) {
				return libraries[l];
			}
		}
		return null;
	}
	
	public String[] getLibraries(Connection cnx) throws SQLException {
		if (cnx != null) {
			String[] url = Util.split(cnx.getMetaData().getURL(), ";");
			for (int i = 0; i < url.length; i++) {
				if (url[i].indexOf("libraries") != -1) {
					String[] libraries = Util.split(url[i], ",");
					return libraries;
				}
			}			
		}
		return new String[]{"EIBSR07M02"};
	}
	
	private String getQualifier(Connection cnx) throws SQLException {
		String qualifier = "/";
		String[] url = Util.split(cnx.getMetaData().getURL(), ";");
		for (int i = 0; i < url.length; i++) {
			if (url[i].indexOf("naming") != -1) {
				qualifier = url[i].indexOf("sql") > 0 ? "." : "/";
			}
		}
		return qualifier;
	}

	/**
	 * @throws IOException 
	 * 
	 */
	public synchronized File generateXML(String schema) throws IOException {
		Connection cnx = null;
		Statement st = null;
		try {
			cnx = getConnection();
			String qualifier = getQualifier(cnx);
			String[] libraries = getLibraries(cnx);
			String schemaMain = getEIBSLibrary(libraries);
			for (int l = 0; l < libraries.length; l++) {
				if (libraries[l].indexOf("EIBS") != -1) {
					schemaMain = libraries[l];
				} else if (libraries[l].indexOf("USR") != -1) {
					schema = libraries[l];
				}
			}
			String schemaSql = "(SELECT SYSTEM_TABLE_SCHEMA,  SYSTEM_TABLE_NAME " +
					"FROM (SELECT SYSTEM_TABLE_SCHEMA , SYSTEM_TABLE_NAME " +
					"		FROM QSYS2" + qualifier + "SYSTABLES " + 
					"			WHERE SYSTEM_TABLE_SCHEMA = '" + schemaMain + "' " +
					"				AND SYSTEM_TABLE_NAME NOT IN (" +
					"					SELECT SYSTEM_TABLE_NAME " +
					"					FROM QSYS2" + qualifier + "SYSTABLES "  +
					"					WHERE SYSTEM_TABLE_SCHEMA = '" + schema +  "')) A " +
					"		UNION " +
					"		SELECT SYSTEM_TABLE_SCHEMA, SYSTEM_TABLE_NAME " +
					" 		FROM QSYS2" + qualifier + "SYSTABLES " +  
					"			WHERE SYSTEM_TABLE_SCHEMA = '" + schema + "') ";
			st = cnx.createStatement();
			
			DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
	 
			// root elements xls
			Document doc = docBuilder.newDocument();
			Element rootElement = doc.createElement("xsd:schema");
			rootElement.setAttribute("xmlns:xsd", "http://www.w3.org/2001/XMLSchema");
			doc.appendChild(rootElement);
			
			// root element xml
			Document xml = docBuilder.newDocument();
	
			Iterator it = types.entrySet().iterator();
			while (it.hasNext()) {
				ResultSet rs = null;
				try {
					DataFormsDDS form = (DataFormsDDS) ((Entry) it.next()).getValue();
					
					rs = st.executeQuery("SELECT COLUMN_HEADING, COLUMN_TEXT, DATA_TYPE, LENGTH, NUMERIC_SCALE " +
							"FROM QSYS2" + qualifier + "SYSCOLUMNS WHERE SYSTEM_TABLE_NAME = '" + form.getDdsName() + "' " +
							"AND SYSTEM_TABLE_SCHEMA = (" +
							"	SELECT SYSTEM_TABLE_SCHEMA FROM " + schemaSql + " B " +
							"	WHERE SYSTEM_TABLE_NAME = '" + form.getDdsName() + "')" + 
							"ORDER BY COLUMN_HEADING");

					//complex type
					Element cmplTyp = doc.createElement("xsd:complexType");
					cmplTyp.setAttribute("name", form.getType());
					
					Element sequenceType = doc.createElement("xsd:sequence");
					cmplTyp.appendChild(sequenceType);
					
					rootElement.appendChild(cmplTyp);
			
					creatingFieldsElements(rs, doc, xml, sequenceType, null, form);
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (rs != null) {
						rs.close();
					}
				}
			}
			
			Element xmlRootElement = xml.createElement("eIBSWordDataStructure");
			xml.appendChild(xmlRootElement);
			
			//xls elements
			Element fieldsType = doc.createElement("xsd:element");
			fieldsType.setAttribute("name", "eIBSPDFDataStructure");
			rootElement.appendChild(fieldsType);
			
			Element cmplTyp = doc.createElement("xsd:complexType");
			fieldsType.appendChild(cmplTyp);
			
			Element sequenceTypeRoot = doc.createElement("xsd:sequence");
			cmplTyp.appendChild(sequenceTypeRoot);
	
			it = params.entrySet().iterator();
			while (it.hasNext()) {
				ResultSet rs = null;
				try {
					DataFormsDDS form = (DataFormsDDS) ((Entry) it.next()).getValue();
					
					rs = st.executeQuery("SELECT COLUMN_HEADING, COLUMN_TEXT, DATA_TYPE, LENGTH, NUMERIC_SCALE " +
							"FROM QSYS2" + qualifier + "SYSCOLUMNS WHERE SYSTEM_TABLE_NAME = '" + form.getDdsName() + "' " +
							"AND SYSTEM_TABLE_SCHEMA = (" +
							"	SELECT SYSTEM_TABLE_SCHEMA FROM " + schemaSql + " B " +
							"	WHERE SYSTEM_TABLE_NAME = '" + form.getDdsName() + "')" + 
							"ORDER BY COLUMN_HEADING");
					
					//xsd elements for schema
					Element elementGroup = doc.createElement("xsd:element");
					elementGroup.setAttribute("name", form.getId());
					elementGroup.setAttribute("nillable", "true");
					elementGroup.setAttribute("type", form.getType());
					rootElement.appendChild(elementGroup);
					
					//xml for word document
					Element xmlElementGroup = xml.createElement("eIBSDataGroup");
					xmlElementGroup.setAttribute("eIBSCode", form.getCode());
					xmlElementGroup.setAttribute("e-Label",  form.getDescription());
					xmlRootElement.appendChild(xmlElementGroup);
					
					creatingFieldsElements(rs, null, xml, null, xmlElementGroup, form);
					
					if (form.isTable()) {
						Element tableElement = doc.createElement("xsd:element");
						tableElement.setAttribute("name", form.getId() + "Table");
						tableElement.setAttribute("nillable", "true");
						rootElement.appendChild(tableElement);
						
						Element complex = doc.createElement("xsd:complexType");
						tableElement.appendChild(complex);
						
						Element sequence = doc.createElement("xsd:sequence");
						complex.appendChild(sequence);
						
						Element lastElem = doc.createElement("xsd:element");
						lastElem.setAttribute("maxOccurs", "unbounded");
						lastElem.setAttribute("ref", form.getId());				
						sequence.appendChild(lastElem);		
						
					}
					
					Element attrb = doc.createElement("xsd:element");
					if (form.isTable()) {
						attrb.setAttribute("ref", form.getId() + "Table");
					} else {
						attrb.setAttribute("ref", form.getId());
					}
					sequenceTypeRoot.appendChild(attrb);
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (rs != null) {
						rs.close();
					}
				}
				
			}
			
			TransformerFactory transformerFactory = TransformerFactory.newInstance();
			Transformer transformer = transformerFactory.newTransformer();
			DOMSource source = new DOMSource(doc);
			File schemaFile = new File(path, "eIBSFormsFields.xsd");
			StreamResult result = new StreamResult(schemaFile);
			
			DOMSource xmlSource = new DOMSource(xml);
			StreamResult xmlResult = new StreamResult(new File(path, "eIBSForms_DST.xml"));
	 
			// Output to console for testing
			// StreamResult result = new StreamResult(System.out);
	 
			transformer.transform(source, result);
			transformer.transform(xmlSource, xmlResult);
	 
			System.out.println("File saved in folder " + path.getAbsolutePath());
			return schemaFile;
		
		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} finally {
			try {
				if(st != null){
					st.close();
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			try{
				if (cnx != null) cnx.close();
			} catch (Exception e) {
				e.printStackTrace();
			}		
		}
	}
	
	private boolean isValidField(String dataName, DataFormsDDS form){
		if (dataName == null || dataName.startsWith("*")) {
			return false;
		}
		if (dataName.indexOf(" ") > 0){
			System.out.println("COLUMN: " + form.getDdsName() +"."+ dataName + " can't be used, Please remove the spaces");
			return false;
		}
		if (dataName.indexOf("/") > 0){
			System.out.println("COLUMN: " + form.getDdsName() +"."+ dataName + " can't be used, Please remove the slashes");
			return false;
		}
		return true;
	}
	
	private boolean isAmountField(String dataName, String type, int length, int scale){
		// Identifying whether the field is an Amount
		if (scale == 2) {
			return true;
		} else {
			return false;
		}
	}
	
	private boolean isDateField(String dataName){
		// Identifying wether the field is a Date
		if (dataName.length() >= 4
			&& (dataName.substring(dataName.length() - 4, dataName.length()).equalsIgnoreCase("Date") 
				|| dataName.indexOf("MMDDYY") != -1
				|| dataName.indexOf("DDMMYY") != -1
				|| dataName.indexOf("YYMMDD") != -1)) {
			return true;
		} else {
			return false;
		}
	}
	
	private int indexOfDate(String dataName){
		int pos = dataName.indexOf("Year");
		pos = pos != -1 ? pos : dataName.indexOf("Month");
		pos = pos != -1 ? pos : dataName.indexOf("Day");
		return pos;
	}
	
	private int lastOfDate(String dataName){
		int pos = dataName.indexOf("Year");
		if (pos != -1) {
			pos = pos + "Year".length();
		} else {
			pos = dataName.indexOf("Month");
			if (pos != -1) {
				pos = pos + "Month".length();
			} else {
				pos = dataName.indexOf("Day");
				if (pos != -1) {
					pos = pos + "Day".length();
				}
			}
		}
		return pos != -1 ? pos : dataName.length();
	}
	
	/**
	 * Adds an Element to the forms schema 
	 * @param doc
	 * @param sequenceType
	 * @param dataName
	 * @param type
	 * @param documentation
	 * @throws Exception
	 */
	private void addSchemaElement(Document doc, Element sequenceType, 
		String dataName, String type, String documentation) throws Exception {
		if (doc == null) return;
		Element dataField = doc.createElement("xsd:element");
		dataField.setAttribute("name", dataName);
		dataField.setAttribute("type", "xsd:"+type);
		dataField.setAttribute("nillable", "true");
		sequenceType.appendChild(dataField);
		
		if (documentation != null && !documentation.equals("")) {
			Element anotationField = doc.createElement("xsd:annotation");
			dataField.appendChild(anotationField);
			if ("date".equals(type)) {
				Element appInfo = doc.createElement("xsd:appinfo");
				anotationField.appendChild(appInfo);

				appInfo.appendChild(doc.createTextNode(dateFormat));
			}
			Element documentationField = doc.createElement("xsd:documentation");
			anotationField.appendChild(documentationField);
			
			documentationField.appendChild(doc.createTextNode(documentation));
		}
	}
	
	/**
	 * Adds an Element to DST for legacy forms 
	 * @param xml
	 * @param xmlElementGroup
	 * @param form
	 * @param dataName
	 * @param type
	 * @param documentation
	 * @throws Exception
	 */
	private void addDSTElement(Document xml, Element xmlElementGroup, DataFormsDDS form,
		String dataName, String type, String documentation) throws Exception {
		//xml document
		if (xmlElementGroup == null) return;
		Element xmlDataField = xml.createElement("eIBSDataField");
		xmlDataField.setAttribute("DataType", type );
		xmlDataField.setAttribute("PublicName", form.getId()+"."+dataName);
		xmlDataField.setAttribute("eIBSCode", dataName);
		if (documentation != null && !documentation.equals("")) {
			xmlDataField.setAttribute("s-Label", documentation);
		} else {
			xmlDataField.setAttribute("s-Label", " ");
		}
		xmlElementGroup.appendChild(xmlDataField);
	}
	
	private void creatingFieldsElements(ResultSet rs, Document doc, Document xml, Element sequenceType, Element xmlElementGroup, DataFormsDDS form) 
		throws Exception {
		while (rs.next()) {
			String dataName = rs.getString("COLUMN_HEADING");
			if (isValidField(dataName, form)) {
				String documentation = rs.getString("COLUMN_TEXT");				
				addDSTElement(xml, xmlElementGroup, form, dataName, 
						"String", documentation);
				if (isDateField(dataName)) {
					addSchemaElement(doc, sequenceType, dataName, "date", documentation);
					
				} else if (indexOfDate(dataName) != -1){
					String dateName = dataName;					
					addSchemaElement(doc, sequenceType, dataName, "string", documentation);
					
					if (rs.next()) {
						dataName = rs.getString("COLUMN_HEADING");
						if (!isValidField(dataName, form)) 
							continue;
						documentation = rs.getString("COLUMN_TEXT");
						addDSTElement(xml, xmlElementGroup, form, dataName, "String", documentation);
						if (indexOfDate(dataName) != -1){
							addSchemaElement(doc, sequenceType, dataName, "string", documentation);
						} else if (isDateField(dataName)) {
							addSchemaElement(doc, sequenceType, dataName, "date", documentation);
							continue;
						} else {
							addSchemaElement(doc, sequenceType, dataName, "string", documentation);
							continue;
						}
						
						if (rs.next()) {
							dataName = rs.getString("COLUMN_HEADING");
							if (!isValidField(dataName, form))
								continue;
							documentation = rs.getString("COLUMN_TEXT");
							addDSTElement(xml, xmlElementGroup, form, dataName, "String", documentation);
							if (indexOfDate(dataName) != -1){
								addSchemaElement(doc, sequenceType, dataName, "string", documentation);
							} else if (isDateField(dataName)) {
								addSchemaElement(doc, sequenceType, dataName, "date", documentation);
								continue;
							} else {
								addSchemaElement(doc, sequenceType, dataName, "string", documentation);
								continue;
							}
							
							dateName = dateName.substring(0, indexOfDate(dateName)) + dateName.substring(lastOfDate(dateName));
							addSchemaElement(doc, sequenceType, dateName+"Date", "date", documentation);
						}
					}
				} else if (isAmountField(dataName, rs.getString("DATA_TYPE"), rs.getInt("LENGTH"), rs.getInt("NUMERIC_SCALE"))){
					addSchemaElement(doc, sequenceType, dataName, "decimal", documentation);
					if (amountLetters) {
						addSchemaElement(doc, sequenceType, dataName+"Letters", "string", documentation);
					}
				} else {
					addSchemaElement(doc, sequenceType, dataName, "string", documentation);
				}				
			}
		}
	}
	
	
}
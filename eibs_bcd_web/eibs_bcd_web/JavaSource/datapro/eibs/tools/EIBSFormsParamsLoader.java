package datapro.eibs.tools;

/**
 * Reads the Params XML needed to generate the FIELDS for the EIBS Forms.
 * Creation date: (12/16/13 1:18 PM)
 * @author: Catalina Sepulveda
 */

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import datapro.eibs.beans.DataFormsDDS;
import datapro.eibs.master.LocateMe;

public class EIBSFormsParamsLoader {
	
	private static final long serialVersionUID = 4920275636255318082L;
	
	protected static File path =  new File(new LocateMe().getWarPath() + "/tools");
	protected static org.w3c.dom.Document myXMLDoc = null;
	protected static Map params = null; 
	protected static Map types = null;
	protected static String dateFormat;
	protected static boolean amountLetters;
	
	public EIBSFormsParamsLoader(){
		if (params == null || types == null){
			try {
				readXMLParameters();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public EIBSFormsParamsLoader(File path){
		if (params == null || types == null){
			try {
				EIBSFormsParamsLoader.path = path;
				readXMLParameters();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public EIBSFormsParamsLoader(String path){
		this(new File(path));
	}
	
	public String getType(String ddsName) {
		DataFormsDDS forms = (DataFormsDDS) types.get(ddsName);
		return forms != null ? forms.getType() : ddsName;
	}
	
	public String getFormatName(String ddsName) {
		DataFormsDDS forms = (DataFormsDDS) types.get(ddsName);
		return forms != null ? forms.getId() : ddsName;
	}

	public boolean isTableGroup(String ddsName) throws IOException{
		DataFormsDDS forms = (DataFormsDDS) types.get(ddsName);
		return forms != null ? forms.isTable() : false;
	}

	protected void readXMLParameters() throws IOException {
		DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder;
		
		try {
			docBuilder = docBuilderFactory.newDocumentBuilder();
			myXMLDoc = docBuilder.parse(new File(path, "eIBSFormsParams.xml"));
	
			// normalize text representation
			myXMLDoc.getDocumentElement().normalize();
		
			NodeList rootList = myXMLDoc.getElementsByTagName("eIBSForms");
			Element root = (Element)rootList.item(0);
			dateFormat = root.getAttribute("dateFormat");
			if (dateFormat == null || dateFormat.trim().equals("")) {
				dateFormat = "dd/MM/yyyy";
			}
			amountLetters = Boolean.valueOf(root.getAttribute("amountLetters")).booleanValue();
		
			NodeList children = root.getElementsByTagName("eIBSFormType");
			params = new HashMap();
			types = new HashMap();
			for (int i = 0; i < children.getLength(); i++) {
				org.w3c.dom.Node tableNode = children.item(i);
				org.w3c.dom.Element tableElement = (org.w3c.dom.Element) tableNode;
				DataFormsDDS ddsInfo = new DataFormsDDS();
				
				ddsInfo.setDdsName(tableElement.getAttribute("DDSClass"));
				ddsInfo.setType(tableElement.getAttribute("type"));
				ddsInfo.setDescription(tableElement.getAttribute("label"));
				ddsInfo.setId(tableElement.getAttribute("formName"));
				ddsInfo.setCode(tableElement.getAttribute("eibsCode"));
				if (ddsInfo.getCode() == null) {
					ddsInfo.setCode(ddsInfo.getId());
				}
				ddsInfo.setTable(tableElement.getAttribute("isTable").equals("Y"));
				
				params.put(ddsInfo.getId(), ddsInfo);	
				types.put(ddsInfo.getDdsName(), ddsInfo);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		}
	}
	
}
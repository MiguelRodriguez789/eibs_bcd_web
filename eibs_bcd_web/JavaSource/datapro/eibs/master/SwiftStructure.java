/*
 * Created on May 15, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.master;

import org.w3c.dom.Element;

import com.datapro.xml.DOMUtil;
import com.datapro.xml.DOMWrapper;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class SwiftStructure {
	
	private static DOMWrapper xmlfile = null;
	private Element eibsFieldElement = null;
	
	static {
		try {
			xmlfile = new DOMWrapper(new LocateMe("swift.xml").getUrl().openStream());
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public boolean locateField(String field) {
		String id = "id" + field;
		eibsFieldElement = xmlfile.getDocument().getElementById(id);
		return (eibsFieldElement != null);
	}
	
	public String getLabel(String lang) {
		return DOMUtil.getTextNode(lang, eibsFieldElement);
	}
	
	public int getLines() {
		return Integer.parseInt(eibsFieldElement.getAttribute("Lines"));
	}
	
	public int getChars() {
		return Integer.parseInt(eibsFieldElement.getAttribute("Chars"));
	}

}

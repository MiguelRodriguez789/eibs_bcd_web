package datapro.eibs.services;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.datapro.eibs.facade.FAParameters;
import com.datapro.eibs.parameters.vo.CNOFT;

import datapro.eibs.beans.ESS0030DSMessage;

/**  
 * @author fhernandez  
 *   
 * @version 1.00 8th june 2014.  
 */  
public class ParametersServices {
	
	private static Map cnofTables;
	
	public static ESS0030DSMessage getSessionUser(HttpServletRequest request){
		return (ESS0030DSMessage) request.getSession(false).getAttribute("currUser");
	}
	
	public static String getCnofTableDesc(HttpServletRequest request, String code) {
		if (cnofTables == null){
			try {
				FAParameters service = new FAParameters();
				service.setSessionUser(getSessionUser(request));
				List tablesList = service.getCNOFTables();
				if (!tablesList.isEmpty()) {
					cnofTables = new HashMap();
					Iterator it = tablesList.listIterator();
					while (it.hasNext()) {
						CNOFT table = (CNOFT) it.next();
						cnofTables.put(table.getCNOTCN(), table);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (cnofTables != null) {
			CNOFT table = (CNOFT)cnofTables.get(code);
			if (table != null) {
				return table.getCNODCN();
			}			
		}
		return "Tabla " + code.toUpperCase();
	}
	
	public static void refreshTables( HttpServletRequest request ){
		cnofTables = null ;
		getCnofTableDesc(request, "");
	}
       
}  

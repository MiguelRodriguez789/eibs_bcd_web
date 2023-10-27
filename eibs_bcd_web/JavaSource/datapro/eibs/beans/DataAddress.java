package datapro.eibs.beans;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.facade.FACommon;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author fhernandez
 */
public class DataAddress {

	private static final Logger logger = Logger.getLogger(DataAddress.class.getName());
	public static String bankOriginCtr = null; 
	
	public static String getTemplateName(String country, String type){
		
		if("01".equals(country)){
			return "basic_usa";
		}else if ("03".equals(country)){
			return "basic_venezuela";
		} else if ("04".equals(country)){
			return  "basic_mexico";
		} else if ("05".equals(country)){
			return "basic_colombia";
		} else if ("06".equals(country)){
			return "basic_guatemala" ; 
		} else if ("07".equals(country)){
			return "basic_panama";
		} else if ("18".equals(country)){
			return "basic_chile";
		}
		return "basic_generic";
	}
	
	public static String getTemplateName(String country){
		return getTemplateName(country, null);		
	}
	
	public static String getTemplateName(HttpServletRequest request ,String country){
		if(null ==  bankOriginCtr){
			ESS0030DSMessage msgUser = (ESS0030DSMessage) request.getSession(false).getAttribute("currUser");
			FACommon fc  = new FACommon();
			fc.setSessionUser(msgUser);
			try {
				bankOriginCtr = fc.getBankIBSCtr();
				boolean isDomesticAddress  = bankOriginCtr == null ? false :  bankOriginCtr.equals(country);
				request.getSession(false).setAttribute("isDomesticAddress", isDomesticAddress);
			} catch (FacadeException e) {
				logger.log(Level.FINE, e.getMessage());
			}
		}
		return getTemplateName(country, null);		
	}
	
	
	public static String getTemplatePage(String country, MessageRecord message){
		if (message.getFormatName().startsWith("ESD4")
			|| message.getFormatName().startsWith("EDD")
			|| message.getFormatName().startsWith("ERA")) {
			return "ESD0080_address_template_" + getTemplateName(country, "S") + ".jsp";
		}
		return "ESD0080_address_template_" + getTemplateName(country) + ".jsp";
	}
	
	public static String getTemplatePage(HttpServletRequest request, String country, MessageRecord message){
		ESS0030DSMessage msgUser = (ESS0030DSMessage) request.getSession(false).getAttribute("currUser");

		if (country == null || country.trim().equals("")) {
			country = msgUser.getE01CTR();
		}
		
		if(null ==  bankOriginCtr){
			FACommon fc  = new FACommon();
			fc.setSessionUser(msgUser);
			try {
				bankOriginCtr = fc.getBankIBSCtr();
			} catch (FacadeException e) {
				logger.log(Level.FINE, e.getMessage());
			}
		}		

		boolean isDomesticAddress  = bankOriginCtr == null ? false :  bankOriginCtr.equals(country);
		request.getSession(false).setAttribute("isDomesticAddress", isDomesticAddress);
		
		if (message.getFormatName().startsWith("ESD4")
			|| message.getFormatName().startsWith("EDD")
			|| message.getFormatName().startsWith("ERA")) {
			return "ESD0080_address_template_" + getTemplateName(country, "S") + ".jsp";
		}
		return "ESD0080_address_template_" + getTemplateName(country) + ".jsp";
	}
}
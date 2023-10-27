package datapro.eibs.tools;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

@SuppressWarnings("serial")
public class JSEUT0120 extends JSEIBSServlet {

	protected static final int R_NEW = 1;
	protected static final int R_MAINTENANCE = 2;
	protected static final int R_DELETE = 3;
	protected static final int A_RECORD = 4;

	protected static final int R_ENTER = 100;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_ENTER :
				procReqEnter(user, req, res, session);
				break;
			case R_NEW :
			case R_MAINTENANCE :
			case R_DELETE :
				procReqRecord(user, req, res, session, screen);
				break;
			case A_RECORD :
				procActionMaintenance(user, req, res, session);
				break;
			default:	
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		if (user.getE01AUT().equals("A")) userPO.setOption("Y"); 
		session.setAttribute("userPO", userPO);
		forward("EUT0120_help_maint_enter.jsp", req, res);
	}	
	
	private void procReqRecord(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
			throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EUT0120", req);
			EUT012001Message msgMenu = (EUT012001Message) mp.getMessageRecord("EUT012001");
			msgMenu.setH01USERID(user.getH01USR());
			msgMenu.setH01PROGRM("EUT0120");
			msgMenu.setH01TIMSYS(getTimeStamp());
	    	msgMenu.setH01SCRCOD("01");
	    	msgMenu.setH01OPECOD(screen == R_NEW ? "0001" : (screen == R_MAINTENANCE ? "0002" : ( screen == R_DELETE ? "0009"  : "0000" )));
	    	((CharacterField) msgMenu.getField("E01WEBID")).setStringUD(Util.getReqParameter("E01WEBID", req));
			mp.sendMessage(msgMenu);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMenu = (EUT012001Message) mp.receiveMessageRecord();
			
			session.setAttribute("msgURL", msgMenu);
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			
			if (!mp.hasError(msgError) && (screen == R_NEW || screen == R_MAINTENANCE) ) {
				forward("EUT0120_maintenance.jsp", req, res);
			} else if(screen == R_DELETE){
				forwardOnSuccess("EUT0120_confirm.jsp", req, res);
			} else {
				forward("EUT0120_help_maint_enter.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	
	private void procActionMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EUT0120", req);
			EUT012001Message msgMenu = (EUT012001Message) mp.getMessageRecord("EUT012001");
		 	msgMenu.setH01USERID(user.getH01USR());
		 	msgMenu.setH01PROGRM("EUT0120");
		 	msgMenu.setH01TIMSYS(getTimeStamp());
		 	msgMenu.setH01SCRCOD("01");
			msgMenu.setH01OPECOD("0005");
			
		 	setMessageRecord(req,msgMenu);
	    	((CharacterField) msgMenu.getField("E01WEBID")).setStringUD(Util.getReqParameter("E01WEBID", req));
			((CharacterField) msgMenu.getField("E01WEBRAW")).setStringUD(Util.getReqParameter("E01WEBRAW",req));
			((CharacterField) msgMenu.getField("E01WEBURL")).setStringUD(formatURL(Util.getReqParameter("E01WEBRAW",req)));
		 	
			mp.sendMessage(msgMenu);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgMenu = (EUT012001Message) mp.receiveMessageRecord();

			session.setAttribute("userPO", userPO);
			session.setAttribute("msgURL", msgMenu);

			if (!mp.hasError(msgError)) {
				procReqEnter(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EUT0120_maintenance.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private String formatURL(final String reqParameter) {
		String retStr = reqParameter;
		ArrayList<String> url = new ArrayList<String>();	
		List<String> jsParams = new ArrayList<String>();		
		if(!"".equals(retStr) && retStr.indexOf("+") > -1){
			if(StringUtils.countMatches(retStr, "+") > 1){
				//Multiple Javascript Variables are used
				//Find all Javascript Variables to add them to ArrayList by checking substring between +'s
				
				jsParams.addAll(Arrays.asList(StringUtils.substringsBetween(retStr,"+", "+"))); 
				if(retStr.lastIndexOf("+") + 1 < retStr.length() && !String.valueOf(retStr.charAt(retStr.length()-1)).equals("\"")){
					jsParams.add(retStr.substring(retStr.lastIndexOf("+")+1));
				}
				//Iterate through ArrayList and replace each jsParams with placeHolder a[index]
				int index = 0;
				for(String js : jsParams){
					if(!js.trim().startsWith("\"") && !js.trim().endsWith("\"")){//Not a JS variable, but a String Literal
						retStr = retStr.replace(js, "a["+ index++ +"]");
					}
				}
				//Replace all + with empty
				retStr = retStr.replace("+", "");
			} else {
				//Only One Javascript Variable
				retStr = retStr.substring(0, retStr.indexOf("+")-1) + "a[0]";
			}
			//Replace all quotes
			retStr = retStr.replace("\"", "");
			retStr = retStr.replace("'", "");
		}
		retStr = retStr.replace(String.valueOf((char) 32), "").trim(); //Removes Space AcII
		retStr = retStr.replace(String.valueOf((char) 255), "").trim(); //Removes nbsp
		return retStr;
	}
}
	
	




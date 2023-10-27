package datapro.eibs.helps;
 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0602DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEWD0602 extends JSEIBSServlet {


	private static final long serialVersionUID = 2142158706669460629L;
	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		
		MessageProcessor mp = null;
		EWD0602DSMessage msgHelp = null ;

		try {
			
			mp = getMessageProcessor("EWD0750", req);
			msgHelp = (EWD0602DSMessage) mp.getMessageRecord("EWD0602DS");
			
			if( req.getParameter("FromRecord") != null && !req.getParameter("FromRecord").equals("") ){
				
				int idx = Integer.parseInt( req.getParameter("FromRecord") );
				
				JBObjList list = (JBObjList)session.getAttribute("msgHelp");
				if( idx < 0 ){
					msgHelp = (EWD0602DSMessage)list.get( 0 );
					msgHelp.setEWDREC( String.valueOf( Integer.parseInt( msgHelp.getEWDREC() ) - list.size() - 1 ) );
				} else {
					msgHelp = (EWD0602DSMessage)list.get( list.size() - 1 );
				}
				
			} else {
			
				msgHelp.setEWDSELCDP( req.getParameter("EWDSELCDP") != null ? req.getParameter("EWDSELCDP").toUpperCase() : "" );
				msgHelp.setEWDSELEDO( req.getParameter("EWDSELEDO") != null ? req.getParameter("EWDSELEDO").toUpperCase() : "" );
				msgHelp.setEWDSELCIU( req.getParameter("EWDSELCIU") != null ? req.getParameter("EWDSELCIU").toUpperCase() : "" );
				msgHelp.setEWDSELMUN( req.getParameter("EWDSELMUN") != null ? req.getParameter("EWDSELMUN").toUpperCase() : "" );
				msgHelp.setEWDSELCLO( req.getParameter("EWDSELCLO") != null ? req.getParameter("EWDSELCLO").toUpperCase() : "" );
					
			}
			
			mp.sendMessage(msgHelp);
			
			
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("EWDOPE");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
			} else if( list.size() == 1 && ((EWD0602DSMessage)list.get( 0 )).getEWDMEXCDP().equals("")  ) {
				session.removeAttribute("msgHelp");
			} else {
				session.setAttribute("msgHelp", list);				
			}
			forward("EWD0602_SEPOMEX.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
		
	}



}
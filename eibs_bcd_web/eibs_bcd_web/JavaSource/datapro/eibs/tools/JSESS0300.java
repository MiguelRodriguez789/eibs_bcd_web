package datapro.eibs.tools;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS0300DSMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.plugins.AccessSecurity;

/*
 * Servlet to perform supervisor local, (not remote), authorization for eIBS options
 * the servlet sen user, password, and menu option to be validated in the as400.  
 */
public class JSESS0300 extends JSEIBSServlet {

	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		
		AccessSecurity security = (AccessSecurity)session.getAttribute( "AccessSecurity" );
		MessageProcessor mp = null ;
		ELEERRMessage error = null ;
		
		try
		{
			
			String authUser = req.getParameter("E01SID");
			
			if( authUser.equalsIgnoreCase( user.getH01USR() ) ){
				
				error = new ELEERRMessage();
				error.setERRNUM("1");
				error.setERNU01( "e300" );
				error.setERDS01("Usuario aprobador no autorizado." );
				error.setERDF01("E01SID" );
				
			} else {
			
				mp = getMessageProcessor("ESS0300", req);
				ESS0300DSMessage msgAuth = (ESS0300DSMessage)mp.getMessageRecord("ESS0300DS");
				setMessageRecord(req, msgAuth);
				
				msgAuth.setH01USR( req.getParameter("E01SID") );
				msgAuth.setH01PGM("ESS0300");
				msgAuth.setH01TIM(getTimeStamp());
				msgAuth.setH01SCR("01");
				msgAuth.setE01PSW( req.getParameter("E01PSW") );
				msgAuth.setE01SID( security.getMenuOption() );
				msgAuth.setE01DEN( security.getMenuSequence() );
				
				
				msgAuth.setH01OPE( "0001" );
				
				mp.sendMessage( msgAuth );
	
				error = (ELEERRMessage)mp.receiveMessageRecord();
				msgAuth = (ESS0300DSMessage)mp.receiveMessageRecord("ESS0300DS");
		
			}
			
			if( !"0".equals( error.getERRNUM() ) ){
				session.setAttribute("error", error);
				res.setStatus( 570 );
			} else {
				session.removeAttribute( "error" );
			}
		

		}
		catch (Exception e) {
			e.printStackTrace();
			res.sendError( HttpServletResponse.SC_SERVICE_UNAVAILABLE );
		}
		finally {
			if (mp != null)
				mp.close();
		}


	}

}

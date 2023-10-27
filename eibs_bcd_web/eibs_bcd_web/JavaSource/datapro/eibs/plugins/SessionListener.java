package datapro.eibs.plugins;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.datapro.security.HistUserAccessEntry;
import com.datapro.security.UserRegistryFacade;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.ServiceLocator;

/**
 * @author fhernandez
 *
 */
public class SessionListener implements HttpSessionListener {
	private static final Object LOCK = new Object();
	private static final String REGISTRY_KEY = ServiceLocator.getInstance()
		.getDataSourceJndiName(UserRegistryFacade.DB_REGISTRY);
	
	private UserRegistryFacade getUserRegistryFacade(HttpSession session){

		UserRegistryFacade userRegistryFacade = null;
		try {
			String realm = session.getServletContext().getInitParameter("realm");
			String usersImpl = session.getServletContext().getInitParameter("users");

			userRegistryFacade = (UserRegistryFacade) Class.forName(usersImpl)
					.getConstructor(new Class[] { String.class }).newInstance(new Object[] { realm });
			
			userRegistryFacade.initialize(REGISTRY_KEY, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userRegistryFacade;
	}

	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpSessionListener#sessionCreated(javax.servlet.http.HttpSessionEvent)
	 */
	public void sessionCreated(HttpSessionEvent event) {		
		HttpSession session = event.getSession();
		
		ESS0030DSMessage msgUser = (datapro.eibs.beans.ESS0030DSMessage) session.getAttribute("currUser");
		
		if (msgUser != null) {
			try {
				UserRegistryFacade userRegistryFacade = getUserRegistryFacade(session);
				HistUserAccessEntry accessEntry = new HistUserAccessEntry();
				accessEntry.setUid(msgUser.getH01USR());
				accessEntry.setPwdHistory(HistUserAccessEntry.ZERO);
				//userRegistryFacade.updateAccessHistory(accessEntry);
			} catch (Exception e) {
				System.out.println("The User Session couldn't be updated on DB : Cause By :" + e.getMessage());
			} 	
		}
	}

	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpSessionListener#sessionDestroyed(javax.servlet.http.HttpSessionEvent)
	 */
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();

		ESS0030DSMessage msgUser = (datapro.eibs.beans.ESS0030DSMessage) session
			.getAttribute("currUser");
		if (msgUser != null) {
			try {
				UserRegistryFacade userRegistryFacade =  getUserRegistryFacade(session);
				HistUserAccessEntry accessEntry = new HistUserAccessEntry();
				accessEntry.setUid(msgUser.getH01USR());
				accessEntry.setPwdHistory(new Integer("3"));
				//userRegistryFacade.updateAccessHistory(accessEntry);
			} catch (Exception e) {
				System.out.println("The User Session couldn't be updated on DB : Cause By :" + e.getMessage());
			} 				
		}
	}
	/*Problems with MUTEX Object Locking
	* EIBS Application Eliminates session Objects after Menu Refresh
	*/
	@Deprecated
    public static Object getMutex(HttpSession session, String mutex) {
    	if(mutex == null){
    		mutex = "SESSION_LOCK";
    	}
        Object sessionlock = session.getAttribute(mutex);
        if(sessionlock == null){
            synchronized (LOCK) { 
            	sessionlock = session.getAttribute(mutex);
                if (sessionlock == null) {
                	sessionlock = new Object();
                    session.setAttribute(mutex, sessionlock);
                }
            }
        }
        return sessionlock; 
    }
	@Deprecated
    public static Object getMutex(HttpSession session) {
    	return getMutex(session, null);
    }    
}

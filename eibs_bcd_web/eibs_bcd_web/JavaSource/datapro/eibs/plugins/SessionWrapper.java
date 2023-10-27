package datapro.eibs.plugins;

import java.util.Collections;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import com.datapro.interfaces.InitSessionPlugin;

/**
 * @author fhernandez
 * 
 */
public class SessionWrapper implements HttpSession, InitSessionPlugin  {
	
	private HttpSession session;
	private String id;
	private Map sessionMap;

	public boolean init(HttpSession ses, Map map) {
		session = ses;
		sessionMap = map;
		sessionMap.put("currUser", session.getAttribute("currUser"));
		id = (String) map.get("eibsSessionId");
		if (id == null) {
			id = session.getId();
		}
		session.setAttribute(id, this);
		return true;
	}
    
	public HttpSession getSession() {
		return session;
	}	

	public String getId() {
		return session.getId();
	}

	public Object getAttribute(String name) { 
		return sessionMap.get(name);
    }

	public Enumeration getAttributeNames() {
		return Collections.enumeration(sessionMap.keySet());
	}

	public void setAttribute(String name, Object value) {
		sessionMap.put(name, value);		
	}

	public void removeAttribute(String name) {
		sessionMap.remove(name);
	}

	public void invalidate() {
		session.removeAttribute(id);
	}	

	public String[] getValueNames() {
		return (String[]) sessionMap.keySet().toArray();
	}

	public void putValue(String name, Object value) {
		setAttribute(name, value);		
	}	

	public Object getValue(String name) {
		return getAttribute(name);
	}

	public void removeValue(String name) {
		removeAttribute(name);
	}

	public long getCreationTime() {
		return session.getCreationTime();
	}
	public long getLastAccessedTime() {
		return session.getLastAccessedTime();
	}

	public int getMaxInactiveInterval() {
		return session.getMaxInactiveInterval();
	}

	public ServletContext getServletContext() {
		return session.getServletContext();
	}

	public HttpSessionContext getSessionContext() {
		return session.getSessionContext();
	}

	public boolean isNew() {
		return session.isNew();
	}
	
	public void setMaxInactiveInterval(int interval) {
		session.setMaxInactiveInterval(interval);
	}

}
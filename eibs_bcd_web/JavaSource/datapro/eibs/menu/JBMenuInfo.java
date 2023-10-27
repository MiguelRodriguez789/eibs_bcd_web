package datapro.eibs.menu;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.facade.FASecurity;
import com.datapro.eibs.security.vo.WEBCOViewByUser;

import datapro.eibs.beans.ESD008001Message;
import datapro.eibs.beans.ESD008002Message;
import datapro.eibs.beans.ESS0030DSMessage;

public class JBMenuInfo {

	public static final int FLAGS_LENGTH = 20;
	private boolean[][] flags;
	private boolean lockRequest;
	private ESS0030DSMessage user;
	private String name;
	private List menu;
	
	public JBMenuInfo(ESS0030DSMessage user, String name) throws FacadeException {
		this.user = user;
		this.name = name;
		FASecurity fa = FASecurity.getInstance();
		fa.setSessionUser(user);
		menu = fa.getOptionsMenu(user.getH01USR(), name);
		if (menu.size() == 0) {
			return;
		}
		flags = new boolean[menu.size()][FLAGS_LENGTH];
		for (int i = 0; i < flags.length; i++) {
			flags[i] = new boolean[FLAGS_LENGTH];
		}
	}

	public String getName() {
		return name;
	}

	public List getMenu() {
		return menu;
	}

	public boolean hasLockRequest() {
		return lockRequest;
	}

	/**
	 * @param i
	 * @return the flags array for the menu element.
	 * If no menu element exist for that index then a new array is created.
	 * It's safe to do so because all boolean values will be set to false.
	 * This will only prevent the caller method to not break, 
	 * the array state will not be kept in this bean  
	 * because the element do not exist in the menu.
	 */
	public boolean[] getFlags(int i) {
		if (flags.length > i) {
			return flags[i];
		}
		return new boolean[FLAGS_LENGTH];
	}

	public void setFlags(boolean[] flags, int i) {
		this.flags[i] = flags;
	}

	public boolean getRequired(int i) {
		return getFlags(i)[0];
	}

	public void setRequired(boolean required, int i) {
		this.flags[i][0] = required;
	}

	public boolean getCompleted(int i) {
		return getFlags(i)[1];
	}

	public void setCompleted(boolean completed, int i) {
		this.flags[i][0] = completed;
	}

	public boolean[] getOptionFlags(String menuSID, String menuDEN) {

		int i = 0;
		Iterator iter = menu.listIterator();
		while (iter.hasNext()) {
			WEBCOViewByUser element = (WEBCOViewByUser) iter.next();
			if (element.getCMOSID().equals(menuSID)
					&& element.getCMODEN().equals(menuDEN)) {
				return getFlags(i);
			}
			i++;
		}
		return getFlags(0);
	}
	
	/**
	 * Apply the Rules for the current menu.
	 * @param request The current request
	 * @param lockRequest When true locks the rules for the current request. 
	 * This means the current rules set will not be overridden in 
	 * the subsequent request that serves the menu.
	 * 
	 */
	public void applyRules(HttpServletRequest request, boolean lockRequest){
		this.lockRequest = lockRequest;
		try {
			HttpSession session = request.getSession(false);
		} catch (ClassCastException e) {
			throw new RuntimeException("The requested menu doesn't match the MessageRecord", e);
		}
	}
	
	/**
	 * Apply the Rules for the current menu.
	 * This method does not overrides rules that has been set 
	 * in a previous request with lockRequest in true.
	 * 
	 * @param request The current request
	 * 
	 */
	public void applyRules(HttpServletRequest request){
		applyRules(request, false);
	}
	
	private void menuRules(HttpServletRequest request, ESD008001Message message){
		if (message == null) return;
		//Rules for personal customer menu
		boolean[] _001 = getOptionFlags("003", "001");
		_001[0] = true;									// Flag 1: Basic Information is always required 
				
		boolean[] _019 = getOptionFlags("003", "019");
		_019[0] = message.getE01FL6().equals("Y"); 		// Flag 1: PEP Required
	}
	
	private void menuRules(HttpServletRequest request, ESD008002Message message){
		if (message == null) return;
		// Rules for corporate customer menu
		boolean[] _001 = getOptionFlags("003", "001");
		_001[0] = true; 								// Flag 1: Basic Information is always required
	}
}

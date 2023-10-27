package com.datapro.interfaces;

import java.util.Map;

import javax.servlet.http.HttpSession;

/**
 * @author ogarcia
 *
 */
public interface InitSessionPlugin {

	public boolean init(HttpSession ses, Map map);
	
}

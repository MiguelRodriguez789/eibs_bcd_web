package com.datapro.eibs.exception;

/**
 * @author ogarcia
 *
 */
public class UserNotFoundException extends Exception {

	/**
	 * Constructor for UserNotFoundException.
	 */
	public UserNotFoundException() {
		super();
	}

	/**
	 * Constructor for UserNotFoundException.
	 * @param s
	 */
	public UserNotFoundException(String s) {
		super(s);
	}

}

package com.datapro.eibs.security.access.jdbc.bean;

/**
 * @author ogarcia
 *
 */
public class USRGRP {
	
	private String GRPID = "";
	private String USRID = "";
	private String STATUS = "";

	/**
	 * Returns the GRPID.
	 * @return String
	 */
	public String getGRPID() {
		return GRPID.trim();
	}

	/**
	 * Returns the STATUS.
	 * @return String
	 */
	public String getSTATUS() {
		return STATUS.trim();
	}

	/**
	 * Returns the USRID.
	 * @return String
	 */
	public String getUSRID() {
		return USRID.trim();
	}

	/**
	 * Sets the GRPID.
	 * @param GRPID The GRPID to set
	 */
	public void setGRPID(String GRPID) {
		this.GRPID = GRPID;
	}

	/**
	 * Sets the STATUS.
	 * @param STATUS The STATUS to set
	 */
	public void setSTATUS(String STATUS) {
		this.STATUS = STATUS;
	}

	/**
	 * Sets the USRID.
	 * @param USRID The USRID to set
	 */
	public void setUSRID(String USRID) {
		this.USRID = USRID;
	}

}

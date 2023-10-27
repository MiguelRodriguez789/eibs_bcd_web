/*
 * Created on Nov 17, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.plugins;

import java.util.Date;


/**
 * @author fhernandez
 */
public class Nonce  {
	
	private Number uid;
    private Date issued;
    
    public Nonce(Number uid, Date date) {
    	this.uid = uid;
    	this.issued = date;
    }

	public Number getUid() {
		return uid;
	}

	public void setUid(Number uid) {
		this.uid = uid;
	}

	public Date getIssued() {
		return issued;
	}

	public void setIssued(Date issued) {
		this.issued = issued;
	}
    
	public String toString() {
		return ""+getUid().intValue();
	}
}

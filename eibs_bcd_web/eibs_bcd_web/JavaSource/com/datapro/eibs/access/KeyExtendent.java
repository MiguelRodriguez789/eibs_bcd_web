/*
 * Created on Aug 27, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.access;

import java.math.BigDecimal;
import java.util.Vector;

import com.datapro.access.Key;
import com.datapro.eibs.constants.General;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class KeyExtendent extends Key {
	private Vector field = null; //Field Names
	private Vector value = null; //Field Values
	private Vector types = null; //Field Data Type	
	private Vector sign = null;	 //Sign to Compare
	private int count = 0; 		 //Number of Keys
	
	public KeyExtendent() {
		field = new Vector();
		value = new Vector();
		types = new Vector();
		sign = new Vector();
	}

	public void clear(){
		field.clear();
		value.clear();
		types.clear();
		sign.clear();
		count = 0;
	}
	
	public boolean isEmpty() {
		return (count == 0);
	}
	
	public String getField(int index) {
		return field.get(index).toString();
	}
	
	public Object getValue(int index) {
		Object result = null;
		if (value.get(index) == null) { 
			result = General.NULL;
		}
		if (types.get(index).equals((String.class.getName()))) {
			result = value.get(index).toString();
		}
		if (types.get(index).equals((BigDecimal.class.getName()))) {
			result =  new BigDecimal(value.get(index).toString());
		}
		if (types.get(index).equals((Integer.class.getName()))) {
			result = new Integer(value.get(index).toString());
		}
		if (types.get(index).equals((Boolean.class.getName()))) {
			result = new Boolean(value.get(index).toString());
		}
		return result;
	}
	
	public String getType(int index) {
		String result = "";
		if (types.get(index).equals((String.class.getName()))) {
			try {
				Integer.parseInt((String) getValue(index));
				result = "Integer";
			} catch (Exception e) {
				result = "String";
			}
		}
		if (types.get(index).equals((BigDecimal.class.getName()))) {
			result =  "BigDecimal";
		}
		if (types.get(index).equals((Integer.class.getName()))) {
			result = "Integer";
		}
		if (types.get(index).equals((Boolean.class.getName()))) {
			result = "Boolean";
		}
		return result;
	}
	
	public int getSize() {
		return count;
	}
	
	public void setKeyValues(String vfield, Object vvalue) {
		count++;
		field.add(vfield);
		value.add(vvalue);
		types.add(vvalue.getClass().getName());
		if (vvalue.getClass().getName().equals("java.lang.String")) {
			sign.add("LIKE");
		} else {
			sign.add("=");
		}	
	}
	
	public void setKeyValues(String vfield, Object vvalue, String vsign) {
		count++;
		field.add(vfield);
		value.add(vvalue);
		types.add(vvalue.getClass().getName());
		sign.add(vsign);
	}
	
	public String addQueryParameters() {
		String result = "";
		String parameter = "";
		if (!isEmpty()) {
			result = " WHERE ";
			boolean firstTime = true;
			for (int i = 0; i < getSize(); i++) {
				if (!firstTime) {
					result = result + " AND ";
				}
				parameter = " " + sign.get(i) + " ?";
				result =  result + getField(i) + parameter; 
				firstTime = false;
			}
		}
		return result;
	}
	
}

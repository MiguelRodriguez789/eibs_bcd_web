package com.datapro.eibs.generics;

import java.util.ArrayList;

/**
 * @author dmavilla
 *
 */
public class JBLVCustomerAccessOptions extends ArrayList {

	/**
	 * Constructor for JBLVCustomerAccessOptions.
	 */
	public JBLVCustomerAccessOptions() {
		super();
		JBLabelValue lv;
		lv = new JBLabelValue("", "");
		this.add(lv);
		lv = new JBLabelValue("params.bank.customer.access.option1", "1");
		this.add(lv);
		lv = new JBLabelValue("params.bank.customer.access.option2", "2");
		this.add(lv);
		
		
	}

}

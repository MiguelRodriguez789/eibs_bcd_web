package com.datapro.eibs.generics;

import java.util.ArrayList;

/**
 * @author dmavilla
 *
 */
public class JBLVIntAccrualOptions extends ArrayList {

	/**
	 * Constructor for JBLVIntAccrualOptions.
	 */
	public JBLVIntAccrualOptions() {
		super();
		JBLabelValue lv;
		lv = new JBLabelValue("", "");
		this.add(lv);
		lv = new JBLabelValue("params.bank.first.day.interest.accrual.option1", "F");
		this.add(lv);
		lv = new JBLabelValue("params.bank.first.day.interest.accrual.option2", "");
		this.add(lv);
		
	}

}

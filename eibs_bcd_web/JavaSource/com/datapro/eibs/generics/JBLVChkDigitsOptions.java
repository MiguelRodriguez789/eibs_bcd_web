package com.datapro.eibs.generics;

import java.util.ArrayList;

/**
 * @author dmavilla
 *
 */
public class JBLVChkDigitsOptions extends ArrayList {

	/**
	 * Constructor for JBLVChkDigitsOptions.
	 */
	public JBLVChkDigitsOptions() {
		super();
		JBLabelValue lv;
		lv = new JBLabelValue("", "");
		this.add(lv);
		lv = new JBLabelValue("params.bank.check.digit.new.account.option1", "0");
		this.add(lv);
		lv = new JBLabelValue("params.bank.check.digit.new.account.option2", "1");
		this.add(lv);
		lv = new JBLabelValue("params.bank.check.digit.new.account.option3", "N");
		this.add(lv);
		
	}

}

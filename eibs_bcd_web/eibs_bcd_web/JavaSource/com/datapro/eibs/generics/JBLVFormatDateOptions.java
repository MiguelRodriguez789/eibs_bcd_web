package com.datapro.eibs.generics;

import java.util.ArrayList;

/**
 * @author dmavilla
 *
 */
public class JBLVFormatDateOptions extends ArrayList {

	/**
	 * Constructor for JBLVFormatDateOptions.
	 */
	public JBLVFormatDateOptions() {
		super();
		JBLabelValue lv;
		lv = new JBLabelValue("", "");
		this.add(lv);
		lv = new JBLabelValue("params.bank.date.format.option1", "MDY");
		this.add(lv);
		lv = new JBLabelValue("params.bank.date.format.option2", "DMY");
		this.add(lv);
		lv = new JBLabelValue("params.bank.date.format.option3", "YMD");
		this.add(lv);
		
		
	}

}

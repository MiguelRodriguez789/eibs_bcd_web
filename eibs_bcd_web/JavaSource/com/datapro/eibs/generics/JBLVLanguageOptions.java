package com.datapro.eibs.generics;

import java.util.ArrayList;

/**
 * @author dmavilla
 *
 */
public class JBLVLanguageOptions extends ArrayList {

	/**
	 * Constructor for JBLVLanguageOptions.
	 */
	public JBLVLanguageOptions() {
		super();
		JBLabelValue lv;
		lv = new JBLabelValue("", "");
		this.add(lv);
		lv = new JBLabelValue("params.bank.language.option1", "E");
		this.add(lv);
		lv = new JBLabelValue("params.bank.language.option2", "S");
		this.add(lv);
		lv = new JBLabelValue("params.bank.language.option3", "F");
		this.add(lv);
		
	}

}

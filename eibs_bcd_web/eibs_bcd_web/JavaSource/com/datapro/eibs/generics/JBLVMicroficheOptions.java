package com.datapro.eibs.generics;

import java.util.ArrayList;

/**
 * @author dmavilla
 *
 */
public class JBLVMicroficheOptions extends ArrayList {

	/**
	 * Constructor for JBLVMicroficheOptions.
	 */
	public JBLVMicroficheOptions() {
		super();
		JBLabelValue lv;
		lv = new JBLabelValue("", "");
		this.add(lv);
		lv = new JBLabelValue("params.bank.microfiche.option1", "N");
		this.add(lv);
		lv = new JBLabelValue("params.bank.microfiche.option2", "M");
		this.add(lv);
		lv = new JBLabelValue("params.bank.microfiche.option3", "R");
		this.add(lv);
		lv = new JBLabelValue("params.bank.microfiche.option4", "B");
		this.add(lv);
		
	}

}

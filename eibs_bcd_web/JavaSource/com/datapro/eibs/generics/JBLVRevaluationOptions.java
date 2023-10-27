package com.datapro.eibs.generics;

import java.util.ArrayList;

/**
 * @author dmavilla
 *
 */
public class JBLVRevaluationOptions extends ArrayList {

	/**
	 * Constructor for JBLVRevaluationOptions.
	 */
	public JBLVRevaluationOptions() {
		super();
		JBLabelValue lv;
		lv = new JBLabelValue("", "");
		this.add(lv);
		lv = new JBLabelValue("params.bank.reval.frecuency.option1", "1");
		this.add(lv);
		lv = new JBLabelValue("params.bank.reval.frecuency.option2", "2");
		this.add(lv);
		lv = new JBLabelValue("params.bank.reval.frecuency.option3", "3");
		this.add(lv);
		lv = new JBLabelValue("params.bank.reval.frecuency.option4", "N");
		this.add(lv);
		
	}

}

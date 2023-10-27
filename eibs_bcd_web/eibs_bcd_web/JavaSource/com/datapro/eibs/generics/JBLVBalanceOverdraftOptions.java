package com.datapro.eibs.generics;

import java.util.ArrayList;

/**
 * @author dmavilla
 *
 */
public class JBLVBalanceOverdraftOptions extends ArrayList {

	/**
	 * Constructor for JBLVBalanceOverdraftOptions.
	 */
	public JBLVBalanceOverdraftOptions() {
		super();
		JBLabelValue lv;
		lv = new JBLabelValue("", "");
		this.add(lv);
		lv = new JBLabelValue("params.bank.balance.overdraft.calculation.option1", "G");
		this.add(lv);
		lv = new JBLabelValue("params.bank.balance.overdraft.calculation.option2", "N");
		this.add(lv);
		lv = new JBLabelValue("params.bank.balance.overdraft.calculation.option3", "A");
		this.add(lv);
		
		
	}

}

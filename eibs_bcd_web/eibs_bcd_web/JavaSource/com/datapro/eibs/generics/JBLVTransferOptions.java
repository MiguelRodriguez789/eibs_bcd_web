package com.datapro.eibs.generics;

import java.util.ArrayList;

/**
 * @author dmavilla
 *
 */
public class JBLVTransferOptions extends ArrayList {

	/**
	 * Constructor for JBLVTransferOptions.
	 */
	public JBLVTransferOptions() {
		super();
		JBLabelValue lv;
		lv = new JBLabelValue("", "");
		this.add(lv);
		lv = new JBLabelValue("params.bank.pl.fccy.transfer.option1", "C");
		this.add(lv);
		lv = new JBLabelValue("params.bank.pl.fccy.transfer.option2", "D");
		this.add(lv);
		lv = new JBLabelValue("params.bank.pl.fccy.transfer.option3", "M");
		this.add(lv);
		lv = new JBLabelValue("params.bank.pl.fccy.transfer.option4", "N");
		this.add(lv);
		
	}

}

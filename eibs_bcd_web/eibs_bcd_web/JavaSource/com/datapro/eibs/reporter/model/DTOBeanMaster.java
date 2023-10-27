package com.datapro.eibs.reporter.model;

import datapro.eibs.beans.ELEERRMessage;

public abstract class DTOBeanMaster {

	protected ELEERRMessage error;
	
	public DTOBeanMaster() {
	}
	
	public abstract ELEERRMessage validate();
	 
	protected void addError(String number, String field, String description) {
		
		int errNum = 0;
		
		try {
			errNum = Integer.parseInt(error.getERRNUM());
		}
		catch (Exception e) {
			errNum = 0;
		}
		
		switch (errNum) {
			case 0 : 
				error.setERNU01(number);
				error.setERDF01(field);
				error.setERDS01(description);
				error.setERRNUM("1");
				break;
			case 1 : 
				error.setERNU02(number);
				error.setERDF02(field);
				error.setERDS02(description);
				error.setERRNUM("2");
				break;
			case 2 : 
				error.setERNU03(number);
				error.setERDF03(field);
				error.setERDS03(description);
				error.setERRNUM("3");
				break;				
			case 3 : 
				error.setERNU04(number);
				error.setERDF04(field);
				error.setERDS04(description);
				error.setERRNUM("4");
				break;				
			case 4 : 
				error.setERNU05(number);
				error.setERDF05(field);
				error.setERDS05(description);
				error.setERRNUM("5");
				break;				
			case 5 : 
				error.setERNU06(number);
				error.setERDF06(field);
				error.setERDS06(description);
				error.setERRNUM("6");
				break;
			case 6 : 
				error.setERNU07(number);
				error.setERDF07(field);
				error.setERDS07(description);
				error.setERRNUM("7");
				break;				
			case 7 : 
				error.setERNU08(number);
				error.setERDF08(field);
				error.setERDS08(description);
				error.setERRNUM("8");
				break;
			case 8 : 
				error.setERNU09(number);
				error.setERDF09(field);
				error.setERDS09(description);
				error.setERRNUM("9");
				break;				
			case 9 : 
				error.setERNU10(number);
				error.setERDF10(field);
				error.setERDS10(description);
				error.setERRNUM("10");
				break;				
		}
	
	}

}

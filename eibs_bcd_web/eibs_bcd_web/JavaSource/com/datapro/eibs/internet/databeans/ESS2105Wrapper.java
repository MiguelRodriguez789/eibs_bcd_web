
package com.datapro.eibs.internet.databeans;

import datapro.eibs.beans.ESS210501Message;
import datapro.eibs.master.Util;
import org.apache.taglibs.display.Decorator;
import org.apache.taglibs.display.TableDecorator;


public class ESS2105Wrapper extends TableDecorator
{

	public ESS2105Wrapper()
	{
	}

	public String getPaymentdate(){
		ESS210501Message msg = (ESS210501Message)getObject();
		//String rt = Formato(msg.getE01VENDATB(),"  /  /  ");
		String rt = "000000" + msg.getE01VENDATB();
		String dat = rt.substring(rt.trim().length()-6);
		String dd = dat.substring(4);
		String mm = dat.substring(2,4);
		String yy = dat.substring(0,2);
		String fmtDat = dd + "/" + mm + "/" + yy;
		return fmtDat;
	}

	public String getVndname(){
		ESS210501Message msg = (ESS210501Message)getObject();
		String rt = msg.getE01VENNME();
		return rt;
	}

	public String getPayamt(){
		ESS210501Message msg = (ESS210501Message)getObject();
		String rt = msg.getE01VENAMT();
		return rt;
	}	

	public String getReference(){
		ESS210501Message msg = (ESS210501Message)getObject();
		String rt = msg.getE01VENREF();
		return rt;
	}
	
	public String getDescription(){
		ESS210501Message msg = (ESS210501Message)getObject();
		String rt = msg.getE01VENDSC();
		return rt;
	}

	public String getUserpmt(){
		ESS210501Message msg = (ESS210501Message)getObject();
		String rt = msg.getE01USERPMT();
		return rt;
	}

	public String getCustpmt(){
		ESS210501Message msg = (ESS210501Message)getObject();
		String rt = msg.getE01CUSPMT();
		return rt;
	}

	public String getAccpmt(){
		ESS210501Message msg = (ESS210501Message)getObject();
		String rt = msg.getE01VENACC();
		return rt;
	}

	public String getCheque(){
		ESS210501Message msg = (ESS210501Message)getObject();
		String rt = msg.getE01PMTNUM();
		return rt;
	}
	
	public static String Formato(String num, String mascara) {
		int z = 0;
		int m = 0;
		int n = 0;
		String result = "";
		int count = 0;
		int y = mascara.length() - 1;
		for(int x = 0; x <= y; x++) {
			char ny = mascara.charAt(x);
			String yy = String.valueOf(ny);
			z++;
			if(yy.trim().length() != 0) {
				try {
					result = result + num.substring(m, z - 1) + yy;
				}
				catch(IndexOutOfBoundsException _ex) {
					return result;
				}
				m += n;
				z--;
				n = -1;
			}
			n++;
			if(x == y && yy.trim().length() == 0)
				result = result + num.substring(m);
			count++;
		}
		return result;
	}
}

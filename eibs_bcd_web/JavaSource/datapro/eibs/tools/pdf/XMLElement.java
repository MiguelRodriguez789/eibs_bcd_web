package datapro.eibs.tools.pdf;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.Util;

/**
 * Class to hold the Element to be print in a PDF document.
 */
	public class XMLElement {
		
		private String name = "";
		private String type = "";
		private String value = "";
		private String lang = "es";
		private int length = 0;
		private int offset = 0;
		private boolean fill = true;
		
		private String sAmount = "";	
		private String sD1 = "";	
		private String sD2 = "";
		private String sD3 = "";
		private String sASymbol = "";
		private String sDFormat = "dd 'de' MMMM yyyy";
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public void setType(String type){
			this.type = type;
		}
		public String getType(){
			return type;
		}
		public void setText(String text){
			value = text;
			if (getType().equals("amount")) sAmount = Util.formatCCY(getValue());
		}
		public String getText(){
			String temp = ""; 
			int iEnd = 0; // end of substring
			String sValue = getValue();
			if (sValue.length() != 0) {
				int iLength = getLength();
				iEnd = getOffset() + iLength;
				iEnd = sValue.length() < iEnd || iLength == 0 ? sValue.length() : iEnd;

				if (iLength > 0 && isFill() == true) {
					if (getType().equals("")){
						temp = Util.addRightChar('*', iLength - sValue.length(), sValue.substring(
								(getOffset() > sValue.length() ? sValue.length() : getOffset()), iEnd));
					} else if (getType().equals("amount")){
						temp = Util.addLeftChar('0', iLength, sValue);
					} else if (getType().equals("number")){
						temp = Util.addLeftChar('0', iLength, sValue);
					}					
				} else {
					if (getType().equals("")){
						temp = sValue.substring(getOffset(), iEnd);
					} else if (getType().equals("date")){
						String res=Util.formatDate(sD1,sD2,sD3);
						if (res.trim().equals("&nbsp;"))
							temp="";
						else
						   temp = Util.formatDate(sD1,sD2,sD3);
					} else {
						temp = sValue;
					}
				}
			}
			return temp;
		}
		public String getValue(){
			return value;
		}		
		public void setDate(String d1, String d2, String d3){
			sD1 = d1;
			sD2 = d2;
			sD3 = d3;
			type = "date";
			String res=Util.formatDate(sD1,sD2,sD3);
			if (res.trim().equals("&nbsp;"))
				value = " ";
			else
				value = res;
		}
		public String getDate(){
			String res=Util.formatDate(sD1,sD2,sD3);
			if (res.equals("&nbsp;"))
				return " ";
			else
			    return res;
		}
		public String getCustomFormatDate(String dateFormat, String lang){
			String res=Util.formatCustomDate(dateFormat, sDFormat , lang , sD1, sD2, sD3);
			if (res.trim().equals("&nbsp;"))
				return " ";
			else	
			  return Util.formatCustomDate(dateFormat, sDFormat , lang , sD1, sD2, sD3);
		}
		public String getCustomFormatDate(ESS0030DSMessage user, String lang){
			String res=Util.formatCustomDate(user.getE01DTF(), sDFormat , lang , sD1, sD2, sD3);
			if (res.trim().equals("&nbsp;"))
				return " ";
			else	
			  return Util.formatCustomDate(user.getE01DTF(), sDFormat , lang , sD1, sD2, sD3);
		}
		public void setDateFormat(String format){
			sDFormat= format;
		}
		public String getDateFormat(){
			return sDFormat;
		}
		public void setLang(String lang){
			this.lang = lang;
		}
		public String getLang(){
			return lang;
		}		
		public void setAmountSymbol(String symbol){
			sASymbol = symbol;
		}
		public String getAmountSymbol(){
			return sASymbol;
		}
		public String getFullAmount(){
			return sASymbol + Util.addLeftChar('*', (int)getLength(), sAmount);
		}
		public void setLength(int len){
			length = len;
		}
		public void setLength(String i) {
			length = Integer.parseInt(i);
		}
		public int getLength(){
			return length;
		}
		public void setOffset(int offset){
			if (offset > getValue().length()) offset = getValue().length(); 
			this.offset = offset;
		}
		public void setOffset(String i) {
			offset = Integer.parseInt(i);
		}
		public int getOffset(){
			return offset;
		}
		public void setFill(boolean fill){ 
			this.fill = fill;
		}
		/**
		 * @param b
		 */
		public void setFill(String b) {
			fill = Boolean.valueOf(b).booleanValue();
		}
		public boolean isFill(){
			return fill;
		}		

	}
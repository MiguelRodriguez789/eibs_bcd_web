package datapro.eibs.beans;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.datapro.generic.beanutil.BeanParser;

import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class BeanDynaTable extends JBObjList {

	private static final long serialVersionUID = 2347059551233707833L;
	private int count;
	private String [] fields;
	private String keyField;
	private Map keyMap = new HashMap();

	/**
	 * 
	 */
	public BeanDynaTable() {
		super();
	}

	/**
	 * @param fields
	 */
	public BeanDynaTable(String[] fields) {
		super();
		this.fields = fields;
	}
	
	/**
	 * @param fields
	 */
	public BeanDynaTable(String[] fields, int count) {
		super();
		this.fields = fields;
		this.count = count;
	}	

	/**
	 * @return the fields
	 */
	public String[] getFields() {
		return fields;
	}

	/**
	 * @param fields the fields to set
	 */
	public void setFields(String[] fields) {
		this.fields = fields;
	}
	
	public void setFields(StringBuffer prefixes) {
		if(prefixes != null){
			fields = prefixes.toString().split("_");
		}	
	}
	
	public String getKeyField() {
		return keyField;
	}

	public void setKeyField(String keyField) {
		this.keyField = keyField;
	}

	public Map getKeyMap() {
		return keyMap;
	}

	/**
	 * @param the fields prefixes
	 */
	public StringBuffer getPrefixes() {
		StringBuffer bf = new StringBuffer();
		if (fields!=null) {
			bf.append(fields[0]);
			for (int i = 1; i < fields.length; i++) {
				bf.append("_"+fields[i]);
			}
		}
		return bf;
	}
	
	/**
	 * @return the count
	 */
	public int getCount() {
		return count;
	}

	/**
	 * @param count the count to set
	 */
	public void setCount(int count) {
		this.count = count;
	}

	private void setMessageField(MessageField field, Object value) {
		try {
			field.setString(value.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	private String formatField(
			String srcStr,
			int width,
			char padChar,
			boolean aligment) {

			String rt = "";
			int srcLen = srcStr.length();
			for (int i = 0; i < (width - srcLen); i++) {
				rt += padChar;
			}

			if (aligment == true) {
				return rt + srcStr;
			} else
				return srcStr + rt;

		}
	
	private String justifyRight(int i, int l) {
		return formatField("" + i, l, '0', true);
	}
	
	private int getDyntableRows(HttpServletRequest request, String prefix){
		int rows = 0;
		if(request.getParameter(prefix+ "SIZE")!=null)
		rows = Integer.parseInt((String) request.getParameter(prefix+ "SIZE"));
		return rows;
	}
	
	/**
	 * 
	 * @param request - To get fields from page
	 * @param prefix - the name that you gave to the Dyntable in the page with an '_' at the end
	 * @param beanClass - the class of the JB that correspond to the rows of the dynlist
	 * @param index - the index corresponding with the row of the dynlist
	 * @return A bean object with the values of the list element
	 * @return
	 * @throws Exception
	 */
	private Object retrieveDyntableBean(HttpServletRequest request, String prefix, Class beanClass, int index) 
		throws Exception {
		String sufix = "_" + justifyRight(index, 2);
		Object wrkBean = beanClass.newInstance();
		if (wrkBean instanceof MessageRecord) {
			MessageRecord message = (MessageRecord) wrkBean;
			// all the fields here
			java.util.Enumeration enu = message.fieldEnumeration();
			MessageField field = null;
			String value = "";
			while (enu.hasMoreElements()) {
				try {
					field = (MessageField) enu.nextElement();
					String fName = field.getTag();
					try {
						value = request.getParameter(prefix + fName
								+ sufix).toUpperCase();
					} catch (Exception e) {
						value = null;
					}
					if (value != null) {
						field.setString(value);
						if (fName.equals(keyField)){
							if (keyMap == null) {
								keyMap = new HashMap();
							}
							keyMap.put(value, wrkBean);
						}
					}					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return message;
		} else {
			BeanParser bp = new BeanParser(wrkBean);
			//get list fields
			Set ks = bp.getTypes().keySet();
			for (Iterator iter = ks.iterator(); iter.hasNext();) {
				String fName = (String) iter.next();
				try {
					String value = request.getParameter(prefix + fName
							+ sufix);
					if (value != null) {
						bp.set(fName, value);
						if (fName.equals(keyField)){
							if (keyMap == null) {
								keyMap = new HashMap();
							}
							keyMap.put(value, wrkBean);
						}
					}
				} catch (Exception e) {
				}
			}
			return bp.getBean();
		}		
	}
	
	public void retrieveDyntableFields(HttpServletRequest request, String prefix, Class beanClass)
		throws Exception {
		
		int rows = getDyntableRows(request, prefix);
		for (int j = 0; j < rows; j++) {
			addRow(retrieveDyntableBean(request, prefix, beanClass, j));
		}
		
	}
	
}

package datapro.eibs.sockets;

import datapro.eibs.master.Util;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class MessageData {

	private String key = "";
	private String name = "";
	private int length = 0;
	private MessageField field = null;

	/**
	 * @return
	 */
	public int getLength() {
		return length;
	}

	/**
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param i
	 */
	public void setLength(int i) {
		length = i;
	}

	/**
	 * @param string
	 */
	public void setName(String string) {
		name = string;
	}

	/**
	 * @param field
	 */
	public void setField(MessageField field) {
		this.field = field;
	}
	
	public String getValue() {
		String result = "";
		if (field != null) {
			result = field.getString();
			if (field.getLength() > length) {
				result = field.getString().substring(0, length);
			} else if (field.getLength() < length || result.equals("") || result.length() < length) {
				if (field.getType() == MessageField.DECIMALFIELD) {
					result = Util.addLeftChar('0', length, field.getString());
				} else {
					result = Util.addRightChar(' ', length, field.getString());
				}
			}
			return result;
		} else {
			return Util.addLeftChar(' ', length, result);
		}
	}
	
	public String getTag() {
		return field.getTag();
	}

	/**
	 * @return
	 */
	public MessageField getField() {
		return field;
	}

	/**
	 * @return
	 */
	public String getKey() {
		return key;
	}

	/**
	 * @param string
	 */
	public void setKey(String string) {
		key = string;
	}

}

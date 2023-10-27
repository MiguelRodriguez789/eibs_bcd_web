package datapro.eibs.sockets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public abstract class MessageStream {

	/** Size of stream. */
	protected int recordsize = 0;
	/** Array of all the field for this stream. */
	protected List record = null;
	
	
	/**
	 * 
	 */
	public MessageStream() {
		super();
		this.record = new ArrayList();
		try {
			createFields();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MessageStream(MessageRecord msg) {
		super();
		this.record = new ArrayList();
		try {
			createFields(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	abstract protected void createFields() throws Exception;
	
	private void createFields(MessageRecord msg) throws Exception {
		this.recordsize = 0;
		Enumeration enu = msg.fieldEnumeration();
		while (enu.hasMoreElements()) {
			MessageField field = (MessageField) enu.nextElement();
			addField(field);
		}
	}
	
	public int getStreamLength() {
		return recordsize;
	}
	
	public void addField(String key, int length) {
		MessageData msg = new MessageData();
		msg.setKey(key);
		msg.setName(key);
		msg.setLength(length);
		record.add(msg);
		recordsize = recordsize + length;
	}
	
	public void addField(String key, String field, int length) {
		MessageData msg = new MessageData();
		msg.setKey(key);
		msg.setName(field);
		msg.setLength(length);
		record.add(msg);
		recordsize = recordsize + length;
	}
	
	public void addField(MessageField field) {
		String key = field.getTag();
		int length = field.getLength();
		MessageData msg = new MessageData();
		msg.setKey(key);
		msg.setName(key);
		msg.setLength(length);
		msg.setField(field);
		record.add(msg);
		recordsize = recordsize + length;
	}
	
	public void addField(String key, MessageField field) {
		int length = field.getLength();
		MessageData msg = new MessageData();
		msg.setKey(key);
		msg.setName(field.getTag());
		msg.setLength(length);
		msg.setField(field);
		record.add(msg);
		recordsize = recordsize + length;
	}
	
	public byte[] getBytes() {
		return toString().getBytes();
	}
	
	public String toString() {
		String result = "";
		Iterator iterator = record.listIterator();
		while (iterator.hasNext()) {
			MessageData data = (MessageData) iterator.next();
			result += data.getValue();
		}
		
		return result;
	}
	
	public void addData(MessageField field) {
		Iterator iterator = record.listIterator();
		while (iterator.hasNext()) {
			MessageData data = (MessageData) iterator.next();
			if (field.getTag().equalsIgnoreCase(data.getName())) {
				data.setField(field);
				break;
			}
		}
	}
	
	public void setFieldsFromMessage(MessageRecord msg) {
		
		Enumeration enu = msg.fieldEnumeration();
		while (enu.hasMoreElements()) {
			MessageField field = (MessageField) enu.nextElement();
			addData(field);
		}
		
	}
	
	private MessageData found(String key) {
		MessageData result = null;
		Iterator iterator = record.listIterator();
		while (iterator.hasNext()) {
			MessageData data = (MessageData) iterator.next();
			if (key.equalsIgnoreCase(data.getKey())) {
				result = data;
				break;
			}
		}	
		return result;
	}
	
	private String parser(MessageData data, String value) {
		if (data != null) {
			MessageField field = data.getField();
			if (value.length() > data.getLength()) {
				field.setString(value.substring(0, data.getLength()));
				value = value.substring(data.getLength());
			} else {
				field.setString(value);
				value = "";
			}
		} else {
			value = "";
		}
		return value;
	}
	
	public void setFieldsFromStream(String stream) {
		Iterator iterator = record.listIterator();
		while (iterator.hasNext()) {
			MessageData data = (MessageData) iterator.next();
			if (stream.length() > 0) {
				stream = parser(data, stream);
			}
		}
	}
	
	public void setFieldsFromStream(String[] keys, String stream) {
		
		for (int i = 0; i < keys.length; i++) {
			String key = keys[i];
			if (stream.length() > 0) {
				stream = parser(found(key), stream);
			}
		}
	}
	
	public void setFieldsFromStream(MessageRecord msg, String stream) throws Exception {
		if (msg.getByteLength() == stream.length()) {
			this.record = new ArrayList();
			this.recordsize = 0;
			Enumeration enu = msg.fieldEnumeration();
			while (enu.hasMoreElements()) {
				MessageField field = (MessageField) enu.nextElement();
				addField(field);
				if (stream.length() > 0) {
					stream = parser((MessageData) record.get(record.size()), stream);
				}
			}
		} else {
			throw new IOException("Structure not match.");
		}
	}
	
	public String getValue(String key) {
		MessageData data = found(key);
		if (data != null) {
			return data.getValue();
		} else {
			return "";
		}
	}
	
	private MessageField getField(String tag) {
		MessageField result = null;
		Iterator iterator = record.listIterator();
		while (iterator.hasNext()) {
			MessageData data = (MessageData) iterator.next(); 
			if (tag.equalsIgnoreCase(data.getName())) {
				result = data.getField();
				break;
			}
		}
		return result;
	}
	
	public void read(MessageRecord msg) {
		Enumeration enu = msg.fieldEnumeration();
		while (enu.hasMoreElements()) {
			MessageField field = (MessageField) enu.nextElement();
			MessageData data = found(field.getTag());
			if (data != null) {
				data.setField(field); 
			}
		}
	}

	public void write(MessageRecord msg) {
		
		Enumeration enu = msg.fieldEnumeration();
		while (enu.hasMoreElements()) {
			MessageField field = (MessageField) enu.nextElement();
			MessageField auxf = getField(field.getTag());
			if (auxf != null) {
				field = auxf;
			}
		}
	}
	
}

package datapro.eibs.sockets;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;

import com.datapro.generic.tool.Util;

public class MessageRecordComparator implements Comparator {
	
	private String[] tag = {};
	private String fmt = "";

	public MessageRecordComparator() {
		super();
	}

	public MessageRecordComparator(String tag) {
		super();
		this.tag = new String[1];
		this.tag[0] = tag;
	}

	public MessageRecordComparator(String[] tag) {
		super();
		this.tag = tag;
	}

	public MessageRecordComparator(String tag, String fmt) {
		this(tag);
		this.fmt = fmt;
	}
	
	public MessageRecordComparator(String[] tag, String fmt) {
		this(tag);
		this.fmt = fmt;
	}

	public int compare(Object object1, Object object2) {
		
		MessageRecord msg1 = (MessageRecord) object1;
		MessageRecord msg2 = (MessageRecord) object2;
		
		if ("".equals(tag)) {
			tag[0] = msg1.getField(0).getTag();
		}
		
		if (!msg1.getFormatName().equals(msg2.getFormatName())) {
			return 0;
		} else if (!"".equals(fmt)) {
			if (tag.length == 3) {
				if (msg1.getField(tag[0]).getString() == null 
						|| msg1.getField(tag[1]).getString() == null
						|| msg1.getField(tag[2]).getString() == null) {
						return 0;
				} else {
					int ya = Util.parseInt(msg1.getField(tag[0]).getString());
					int ma = Util.parseInt(msg1.getField(tag[1]).getString());
					int da = Util.parseInt(msg1.getField(tag[2]).getString());
					if ("YMD".equalsIgnoreCase(fmt)) {
						ya = Util.parseInt(msg1.getField(tag[0]).getString());
						ma = Util.parseInt(msg1.getField(tag[1]).getString());
						da = Util.parseInt(msg1.getField(tag[2]).getString());
					} else if ("DMY".equalsIgnoreCase(fmt)) {
						ya = Util.parseInt(msg1.getField(tag[2]).getString());
						ma = Util.parseInt(msg1.getField(tag[1]).getString());
						da = Util.parseInt(msg1.getField(tag[0]).getString());
					} else {
						ya = Util.parseInt(msg1.getField(tag[2]).getString());
						ma = Util.parseInt(msg1.getField(tag[0]).getString());
						da = Util.parseInt(msg1.getField(tag[1]).getString());
					}
					Calendar a = Calendar.getInstance();
					a.set(ya, ma, da);
					int yb = Util.parseInt(msg2.getField(tag[0]).getString());
					int mb = Util.parseInt(msg2.getField(tag[1]).getString());
					int db = Util.parseInt(msg2.getField(tag[2]).getString());
					Calendar b = Calendar.getInstance();
					b.set(yb, mb, db);
					return compare(a.getTime(), b.getTime());
				}
			} else if (msg1.getField(tag[0] + fmt.charAt(0)).getString() == null 
				|| msg1.getField(tag[0] + fmt.charAt(1)).getString() == null
				|| msg1.getField(tag[0] + fmt.charAt(2)).getString() == null) {
				return 0;
			} else {
				int ya = Util.parseInt(msg1.getField(tag[0] + fmt.charAt(0)).getString());
				int ma = Util.parseInt(msg1.getField(tag[0] + fmt.charAt(1)).getString());
				int da = Util.parseInt(msg1.getField(tag[0] + fmt.charAt(2)).getString());
				Calendar a = Calendar.getInstance();
				a.set(ya, ma, da);
				int yb = Util.parseInt(msg2.getField(tag[0] + fmt.charAt(0)).getString());
				int mb = Util.parseInt(msg2.getField(tag[0] + fmt.charAt(1)).getString());
				int db = Util.parseInt(msg2.getField(tag[0] + fmt.charAt(2)).getString());
				Calendar b = Calendar.getInstance();
				b.set(yb, mb, db);
				return compare(a.getTime(), b.getTime());
			}
		} else if (tag.length > 1) {
			for (int i = 0; i < tag.length; i++) {
				if (msg1.getField(tag[i]).getString() == null) {
					return 0;
				}
			}
			String a = "";
			String b = "";
			for (int i = 0; i < tag.length; i++) {
				a += msg1.getField(tag[i]).getString();
				b += msg2.getField(tag[i]).getString();
			}
			return compare(a, b);
		} else if (msg1.getField(tag[0]) == null ) {
			return 0;
		} else if (msg1.getField(tag[0]).getType() == MessageField.DECIMALFIELD) {
			return compare((DecimalField)msg1.getField(tag[0]), (DecimalField)msg2.getField(tag[0]));
		} else {
			return compare((CharacterField)msg1.getField(tag[0]), (CharacterField)msg2.getField(tag[0]));
		}
	}
	
	private static int compare(CharacterField a, CharacterField b) {
		return a.getString().compareTo(b.getString());
	}

	private static int compare(DecimalField a, DecimalField b) {
		return a.getBigDecimal().compareTo(b.getBigDecimal());
	}

	private static int compare(Date a, Date b) {
		return a.compareTo(b);
	}

	private static int compare(String a, String b) {
		return a.compareTo(b);
	}

}

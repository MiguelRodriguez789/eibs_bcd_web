/*
 * Created on Jun 30, 2011
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.beans;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JBImageData {
	
	private String url = "";
	private int screen = 1;
	private String document = "";
	private int sequence = 0;
	private int size = 0;
	private String type = "";

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	/**
	 * @return
	 */
	public String getDocument() {
		return document;
	}

	/**
	 * @return
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param string
	 */
	public void setDocument(String string) {
		document = string;
	}


	/**
	 * @param string
	 */
	public void setUrl(String string) {
		url = string;
	}


	/**
	 * @return
	 */
	public int getScreen() {
		return screen;
	}

	/**
	 * @param i
	 */
	public void setScreen(int i) {
		screen = i;
	}

	/**
	 * @return
	 */
	public int getSequence() {
		return sequence;
	}

	/**
	 * @param i
	 */
	public void setSequence(int i) {
		sequence = i;
	}

}
